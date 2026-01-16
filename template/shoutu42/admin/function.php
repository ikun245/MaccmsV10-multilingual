<?php

	$agent = strtolower($_SERVER['HTTP_USER_AGENT']); 
	$is_pc = (strpos($agent, 'windows nt')) ? true : false;
	$is_iphone = (strpos($agent, 'iphone')) ? true : false;
	$is_ipad = (strpos($agent, 'ipad')) ? true : false;
	$is_android = (strpos($agent, 'android')) ? true : false;
	$is_mobile = (strpos($agent, 'mobile')) ? true : false;
	$shoutu = file_exists(__DIR__.'/extra/data.php') ? require(__DIR__.'/extra/data.php') : require(__DIR__.'/install.php');
	$theme = parse_ini_file(__DIR__.'/info.ini');
    function config_header($config)
	{
		if($config['other']['opgrey']) {
			$posday = substr($config['other']['opgreytime'],0,10);
			$today = date('Y-m-d');
			if($posday==$today || $config['other']['opgreytime']==''){ 
				echo '<style type="text/css">'."\r\n".'html{-webkit-filter:grayscale(100%);filter:gray;filter:grayscale(100%);filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);}'."\r\n".'</style>'."\r\n";
			}
		}
		if($config['basic']['substatic_is']==1) {
			echo $config['basic']['substatic']."\r\n";
		}
		
	}
	
	function config_footer($config)
	{
        if($config['set']['footadjs_is']==1) {
			echo $config['set']['footadjs']."\r\n";
		}
        if($config['set']['footcode_is']==1) {
			echo $config['set']['footcode']."\r\n";
		}
        if($config['basic']['jscode_is']==1) {
			echo $config['basic']['jscode']."\r\n";
		}
		if($config['other']['f12no']) {
			echo '<script>'."\r\n".'document.onkeydown = function(e){'."\r\n".'if ((e.keyCode == 123)){'."\r\n".'e.preventDefault();'."\r\n".'}'."\r\n".'}'."\r\n".'</script>'."\r\n";
		}
		if($config['other']['iframeno']) {
			echo '<script>'."\r\n".'(function(window) {'."\r\n".'if (window.location !== window.top.location) {'."\r\n".'window.top.location = window.location;'."\r\n".'}'."\r\n".'})(this);</script>'."\r\n";
		}
		if($config['other']['selectno']) {
			echo '<script>'."\r\n".'document.onselectstart=function(){'."\r\n".'return false;'."\r\n".'}'."\r\n".'</script>'."\r\n";
		}
		if($config['other']['rightno']) {
			echo '<script>'."\r\n".'document.oncontextmenu = function() {  '."\r\n".'event.returnValue = false;'."\r\n".'}'."\r\n".'document.oncontextmenu=function(e){'."\r\n".'alert("'.$config['other']['rightnotext'].'");'."\r\n".'return false;'."\r\n".'}'."\r\n".'</script>'."\r\n";
		}
		if($config['other']['modeno']) {
			echo '<script>'."\r\n".'setInterval(function() {'."\r\n".'check();'."\r\n".'}, 2000);'."\r\n".'var check = function() {'."\r\n".'function doCheck(a) {'."\r\n".'if (("" + a / a)["length"] !== 1 || a % 20 === 0) {'."\r\n".'(function() {}["constructor"]("debugger")());'."\r\n".'} else {'."\r\n".'(function() {}["constructor"]("debugger")());'."\r\n".'
			}'."\r\n".'doCheck(++a);'."\r\n".'}'."\r\n".'try {'."\r\n".'doCheck(0);'."\r\n".'} catch (err) {}'."\r\n".'};'."\r\n".'check();'."\r\n".'</script>'."\r\n";
		}
		if($config['other']['pcflase']) { 
		echo '<script>var system={win:false,mac:false,xll:false};var p=navigator.platform;var us=navigator.userAgent.toLowerCase();system.win=p.indexOf("Win")==0;system.mac=p.indexOf("Mac")==0;system.xll=(p=="X11")||(p.indexOf("Linux")==0);if(system.win||system.mac||system.xll){var iframe_url=\'/404.html\';$("head").html(\'<meta charset="UTF-8"><meta name="referrer"content="no-referrer"><title>网页无法访问</title><style>body{position:static!important;}body*{visibility:hidden;}</style>\');$("body").empty();$(document).ready(function(){$("body").html(\'<iframe style="width:100%; height:100%;position:absolute;margin-left:0px;margin-top:0px;top:0%;left:0%;"id="mainFrame"src="\' + iframe_url + \'"frameborder="0"scrolling="no"></iframe>\').show();$("body *").css("visibility","visible")})}</script>';
		}
	}

    require(__DIR__.'/chk.php');

    function config_ip($ip)
	{
		$ch = curl_init();
		$url = 'https://whois.pconline.com.cn/ipJson.jsp?ip='.$ip;
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt ( $ch, CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
		$location = curl_exec($ch);
		curl_close($ch);
		$location = mb_convert_encoding($location, 'utf-8','GB2312');
		$location = substr($location, strlen('({')+strpos($location, '({'),(strlen($location) - strpos($location, '})'))*(-1));
		$location = str_replace('"',"",str_replace(":","=",str_replace(",","&",$location)));
		parse_str($location,$ip_location);
		return $ip_location['pro'];
	}


?>