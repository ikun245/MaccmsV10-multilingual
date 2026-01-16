<?php
namespace app\common\extend\email;

class Phpmailer {

    public $name = 'PhpMailer';
    public $ver = '2.0';

    public function submit($to, $title, $body, $config=[])
    {
        if(empty($config)) {
            $config = $GLOBALS['config']['email']['phpmailer'];
            $config['nick'] =  $GLOBALS['config']['email']['nick'];
        }

        $host = $config['host'];
        $port = $config['port'];
        $user = $config['username'];
        $pass = $config['password'];
        $from = $config['username'];
        $nick = $config['nick'];
        $secure = strtolower($config['secure']);

        $header = "MIME-Version: 1.0\r\n";
        $header .= "Content-type: text/html; charset=utf-8\r\n";
        $header .= "To: " . $to . "\r\n";
        $header .= "From: " . "=?UTF-8?B?" . base64_encode($nick) . "?=" . " <" . $from . ">\r\n";
        $header .= "Subject: " . "=?UTF-8?B?" . base64_encode($title) . "?=" . "\r\n";
        $header .= "Date: " . date("r") . "\r\n";
        $header .= "X-Mailer: MacCMS-SMTP\r\n";

        $data = $header . "\r\n" . $body;

        $error = "";
        $log = "";

        $smtp_host = ($secure == 'ssl' ? 'ssl://' : ($secure == 'tls' ? 'tls://' : '')) . $host;
        
        $fp = @fsockopen($smtp_host, $port, $errno, $errstr, 30);
        if (!$fp) {
            return ['code' => 102, 'msg' => "连接失败: $errstr ($errno)"];
        }

        $smtp_cmd = function($fp, $cmd, $code = 250) {
            if ($cmd) fputs($fp, $cmd . "\r\n");
            $res = "";
            while ($line = fgets($fp, 512)) {
                $res .= $line;
                if (substr($line, 3, 1) == " ") {
                    break;
                }
            }
            if (substr($res, 0, 3) != $code) return $res;
            return true;
        };

        $res = fgets($fp, 512); // Welcome
        if (substr($res, 0, 3) != '220') return ['code' => 103, 'msg' => "服务器未就绪: $res"];

        if (($res = $smtp_cmd($fp, "EHLO MacCMS")) !== true) return ['code' => 104, 'msg' => "EHLO 失败: $res"];
        
        if ($secure == 'tls') {
            if (($res = $smtp_cmd($fp, "STARTTLS", 220)) !== true) return ['code' => 105, 'msg' => "STARTTLS 失败: $res"];
            stream_socket_enable_crypto($fp, true, STREAM_CRYPTO_METHOD_TLS_CLIENT);
            $smtp_cmd($fp, "EHLO MacCMS");
        }

        if (($res = $smtp_cmd($fp, "AUTH LOGIN", 334)) !== true) return ['code' => 106, 'msg' => "AUTH LOGIN 失败: $res"];
        if (($res = $smtp_cmd($fp, base64_encode($user), 334)) !== true) return ['code' => 107, 'msg' => "用户名验证失败: $res"];
        if (($res = $smtp_cmd($fp, base64_encode($pass), 235)) !== true) return ['code' => 108, 'msg' => "密码验证失败: $res"];

        if (($res = $smtp_cmd($fp, "MAIL FROM:<$from>")) !== true) return ['code' => 109, 'msg' => "MAIL FROM 失败: $res"];
        if (($res = $smtp_cmd($fp, "RCPT TO:<$to>")) !== true) return ['code' => 110, 'msg' => "RCPT TO 失败: $res"];
        if (($res = $smtp_cmd($fp, "DATA", 354)) !== true) return ['code' => 111, 'msg' => "DATA 失败: $res"];
        
        fputs($fp, $data . "\r\n.\r\n");
        $res = fgets($fp, 512);
        if (substr($res, 0, 3) != '250') return ['code' => 112, 'msg' => "内容发送失败: $res"];

        $smtp_cmd($fp, "QUIT", 221);
        fclose($fp);

        return ['code' => 1, 'msg' => '发送成功'];
    }
}
