<?php

	error_reporting(0);

	defined('APP_ADMIN') or exit('Access Denied');
	define('APP_DATA',APP_ROOT.'/extra/data.php');
	define('APP_TPL',APP_ROOT.'/install.php');
	define('APP_BACKUP',APP_ROOT.'/backup/data.php');
	define('APP_INFO',APP_ROOT.'/info.ini');

	if (!file_exists(APP_DATA)) { copy(APP_TPL,APP_DATA);}

	$config = require(APP_DATA);

	$theme = parse_ini_file(APP_INFO);

	$edition = config_id_0($info['cid']);

	function config_id($config,$info){

		if ($_GET && isset($_GET['type'])) {
			config_id_6($config,$info);
		}

		if($_GET && isset($_GET['manage']) && $_GET['manage'] == 'backup'){
			copy(APP_DATA,APP_BACKUP);
			echo("<script type='text/javascript'>layer.msg('操作成功', {time:1000});</script>");
			echo("<meta http-equiv=refresh content='1; url=?url=".$_GET['url']."'>");
		}
		if($_GET && isset($_GET['manage']) && $_GET['manage'] == 'resetting'){
			copy(APP_TPL,APP_DATA);
			echo("<script type='text/javascript'>layer.msg('操作成功', {time:1000});</script>");
			echo("<meta http-equiv=refresh content='1; url=?url=".$_GET['url']."'>");
		}
		if($_GET && isset($_GET['manage']) && $_GET['manage'] == 'resume'){
			if (file_exists(APP_BACKUP)) {
				copy(APP_BACKUP,APP_DATA);
			}else{
				echo("<script type='text/javascript'>layer.msg('没有发现备份文件', {time:1000});</script>");
			}
			echo("<meta http-equiv=refresh content='1; url=?url=".$_GET['url']."'>");
		}

	}
		// Progressive Web App (PWA) binding
	function setManifest($data) {
		$jsonData = [
			"name" => $data['paw_name'],
			"short_name" => $data['paw_short_name'],
			"icons" => [
				[
					"src" => $data['paw_icon512'],
					"sizes" => "512x512",
					"type" => "image/png"
				],
				[
					"src" => $data['paw_icon192'],
					"sizes" => "192x192",
					"type" => "image/png"
				]
			],
			"start_url" => "/",
			"display" => "standalone",
			"theme_color" => $data["paw_theme_color"],
			"background_color" => $data["paw_background_color"]
		];
		// $GLOBALS['MAC_PATH_TPL']
		$manifest_path =  APP_ROOT . $GLOBALS['MAC_ROOT_TEMPLATE'];
		$manifest_path  =  preg_replace('/\/admin.*$/', '', $manifest_path) . '/assets/app/manifest.json';
		// 写入文件
		file_put_contents($manifest_path, json_encode($jsonData, JSON_UNESCAPED_UNICODE));
	}
	
	
	function config_id_2($config,$info)
	{
		return @file_put_contents($config,$info);
	}

	function config_id_3($config,$info)
	{
		if(is_array($info)){
			$con = var_export($info,true);
		} else{
			$con = $info;
		}
		$con = "<?php\nreturn $con;";
		config_id_2($config, $con);
	}

	function config_id_4($config){
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $config);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		$data = curl_exec($curl);
		if (curl_errno($curl)) {return 'ERROR '.curl_error($curl);}
		curl_close($curl);
		return $data;
	}

	function config_id_5($config) {
		$array = $config;
		if(is_object($array)) {  
			$array = (array)$array;  
		}
		if(is_array($array)) {  
			foreach($array as $key=>$value) {  
				$array[$key] = config_id_5($value); 
			}  
		}  
		return $array;
	}

	function config_id_6($config,$info)
	{
		$array = $_GET['array'];
		$type = $_GET['type'];
		$act = $_GET['url'];
		
		if($type=='binding'){
			$binding = config_id_7($_POST['sn'],$info['cid']);
			if($binding['code'] == '1'){
				$_POST = array(
					'sn'=>$_POST['sn'],
					'id'=>$binding['id'],
					'cid'=>$binding['cid'],
					'buy_uid'=>$binding['buy_uid'],
					'buy_username'=>$binding['buy_username'],
					'url'=>$binding['url'],
					'domain'=>$binding['domain'],
				);
				$config_new[$array] = $_POST;
				$config_old = $config;
				$config_new = array_merge($config_old, $config_new);
				$res = config_id_3(APP_DATA, $config_new);
				if ($res === false) {
					echo("<script type=\"text/javascript\">layer.msg('操作失败，请检查权限！', {time:1000});</script>");
					echo("<meta http-equiv=refresh content='1; url=?url=".$act."'>");
				}
				echo("<script type=\"text/javascript\">layer.msg('".$binding['msg']."', {time:1000});</script>");
				echo("<meta http-equiv=refresh content='1; url=?url=".$act."'>");
				file_put_contents(APP_CACHE,md5(time()));
				return false;
			}else{
				echo("<script type=\"text/javascript\">layer.msg('".$binding['msg']."', {time:1000});</script>");
				echo("<meta http-equiv=refresh content='1; url=?url=index'>");
				if($config['binding']){
					$config_new = $config;
					unset($config_new['binding']);
					$res = config_id_3(APP_DATA, $config_new);
					unlink(APP_CACHE);
				}
				return false;
			}
		}

		if($type=='add'){
			$config_new[$array]['data'][] = $_POST;
			$config_old = $config;
			$config_new = array_merge_recursive($config_old, $config_new);
		}elseif($type=='del'){
			$config_new[$array]['data'] = $config[$array]['data'];
			unset($config_new[$array]['data'][$_GET['id']]);
			$config_old = $config;
			$config_new = array_merge($config_old, $config_new);
		}elseif($type=='edit'){
			$config_new[$array]['data'] = $config[$array]['data'];
			//$editid = $_POST['editid'];
			//unset($_POST['editid']);
			$config_new[$array]['data'][$_GET['id']] = $_POST['data'][$_GET['id']];
			$config_old = $config;
			$config_new = array_merge($config_old, $config_new);
		}elseif($type=='empty'){
			$config_new = $config;
			unset($config_new[$array]);
			unset($config_new['typeid']['data'][$_GET['id']]);
		}else{
			$config_new[$array] = $_POST;
			$config_old = $config;
			$config_new = array_merge($config_old, $config_new);
			setManifest($_POST);
		}
		$res = config_id_3(APP_DATA, $config_new);
		if ($res === false) {
			echo("<script type=\"text/javascript\">layer.msg('操作失败，请检查权限！', {time:1000});</script>");
			if($type=='edit'){
				echo("<meta http-equiv=refresh content='1; url=?url=".$act."&array=".$array."&operate=edit&id=".$_GET['id']."'>");
			}else{
				echo("<meta http-equiv=refresh content='1; url=?url=".$act."&array=".$array."'>");
			}
		}
		echo("<script type=\"text/javascript\">layer.msg('操作成功', {time:1000});</script>");
		if($type=='edit'){
			echo("<meta http-equiv=refresh content='1; url=?url=".$act."&array=".$array."&operate=edit&id=".$_GET['id']."'>");
		}else{
			echo("<meta http-equiv=refresh content='1; url=?url=".$act."&array=".$array."'>");
		}
		
	}

	function config_id_0($config){
		$edition = config_id_4('http://api.shoutu.cn/edition.php?cid='.$config);
		$edition = json_decode($edition);
		$edition = config_id_5($edition);
		$edition = $edition['data'][0];
		return $edition;
	}
	
	function config_menu($config)
	{
		
		$array = require('./input.php');
		foreach ($array['menu'] as $k => $v) {
			if($v[4]=='0'){
				echo '<li class="layui-nav-item';
                if($v[1]==$_GET['url']){echo ' layui-this';}
                echo '">';
				if($v[5]){
					echo '<a href="?url=' . $v[1] . '" ' . ($v[2] == true ? 'target="_blank"' : '') . '>' . $v[0] . '</a>';
					echo '<dl class="layui-nav-child">';
					foreach ($array['menu'] as $k => $son) {
						if($son[4]==$v[3]){
							echo '<dd><a href="?url=' . $son[1] . '" ' . ($son[2] == true ? 'target="_blank"' : '') . '>' . $son[0] . '</a></dd>';
						}
					}
					echo '</dl>';
				}else{
					echo '<a href="?url=' . $v[1] . '" ' . ($v[2] == true ? 'target="_blank"' : '') . '>' . $v[6] . $v[0] . '</a>';
				}
				echo '</li>';
			}
		}
		
	}

	function config_option($data,$type)
	{
		$array = require('./input.php');
		foreach ($array[$data] as $k => $v) {
			if($type == $v[1]){
				echo '<option value="'.$v[1].'" selected>'.$v[0].'</option></a>';
			}else{
				echo '<option value="'.$v[1].'">'.$v[0].'</option></a>';
			}
		}
	}

   
	require('./form.php');

?>