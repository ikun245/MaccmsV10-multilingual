<?php
/*
'版权所有：https://www.shoutu.cn
'--------------------------------------------------------
'请勿尝试破解文件！！！
'--------------------------------------------------------
*/

define('APP_ADMIN','ADMIN');
define('APP_SCRIPT',substr($_SERVER["SCRIPT_NAME"], 0, strrpos($_SERVER["SCRIPT_NAME"], "/")));
define('APP_ROOT',$_SERVER['DOCUMENT_ROOT'].APP_SCRIPT);

if(strpos($_SERVER["SCRIPT_NAME"],'/admin.php')!==false){
    echo '请将主题后台入口文件'.$_SERVER["SCRIPT_NAME"].'改名，改成只有你自己知道的名字，避免被黑客入侵攻击！！！';
    exit;
}

if($_GET && isset($_GET['url'])){
    $url = $_GET['url'];
    include 'view/'.$url.'.php';
}else{
    include 'view/index.php';
}

