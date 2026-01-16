<?php
	function config_voddata($ids)
	{
		$list = [];
		$where = [];
		$where['ids'] = $ids;
		$list = model('Vod')->listCacheData($where);
		return $list['list'];
	}
	
	function config_vodlist($lp,$num,$id)
	{
		$list = [];
		$where = [];
		$where['type'] = $lp['type'];
		$where['by'] = $lp['by'];
		$where['num'] = $num;
		foreach($lp as $k => $v)
		{
			$len++;
			if($len>6){
				if(!empty($id)){
					$voddata = config_voddata($id);
				}
				if($v=='current'&&!empty($id)){
					$where[$k] = $voddata[0]['vod_'.$k];
				}else{
					$where[$k] = $v;
				}
			}
		}
		$list = model('Vod')->listCacheData($where);
		return $list['list'];
	}
	function config_vodlist2($type,$lp,$num,$id)
	{
		$list = [];
		$where = [];
		$where['type'] = $type;
		$where['by'] = $lp['by'];
		$where['num'] = $num;
		foreach($lp as $k => $v)
		{
			$len++;
			if($len>6){
				if(!empty($id)){
					$voddata = config_voddata($id);
				}
				if($v=='current'&&!empty($id)){
					$where[$k] = $voddata[0]['vod_'.$k];
				}else{
					$where[$k] = $v;
				}
			}
		}
		$list = model('Vod')->listCacheData($where);
		return $list['list'];
	}

    function config_vodlist3($lp,$num,$id)
	{
		$list = [];
		$where = [];

        $commaPos = strpos($lp['type'], ',');
		$where['type'] = substr($lp['type'], $commaPos + 1);
		$where['by'] = $lp['by'];
		$where['num'] = $num;
		foreach($lp as $k => $v)
		{
			$len++;
			if($len>6){
				if(!empty($id)){
					$voddata = config_voddata($id);
				}
				if($v=='current'&&!empty($id)){
					$where[$k] = $voddata[0]['vod_'.$k];
				}else{
					$where[$k] = $v;
				}
			}
		}
		$list = model('Vod')->listCacheData($where);
		return $list['list'];
	}

	function config_aid()
	{
		$array = require(__DIR__.'/input.php');
		return $array['aid'];
	}

	function config_aid_so($aid)
	{
		$array = require(__DIR__.'/input.php');
		$array = array_search($aid,$array['aid']);
		return $array;
	}

	function config_seo($maccms,$obj,$val)
	{
		$val = preg_replace_callback("/\[([a-z_]*)\]/i", function($m) use($maccms,$obj){
			if($maccms[$m[1]]){
				return $maccms[$m[1]];
			}else{
				return $obj[$m[1]];
			}
		}, $val);
		return $val;
	}

?>