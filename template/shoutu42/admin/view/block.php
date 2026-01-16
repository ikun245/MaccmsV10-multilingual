<?php 
	require('./config.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<?php 
	require('header.php'); 
	$id = $_GET['id'];
	$array = $_GET['array'];
	if($_GET['operate']){
		$type = $_GET['operate'];
	}else{
		$type = 'add';
	}
?>
</head>
	<body>
		<form class="layui-form" method="post" action="?url=block&array=<?php echo $array;?>&type=<?php echo $type;?>&id=<?php echo $id;?>" enctype="multipart/form-data" style="margin-top: 20px;">
			<?php 
				if($type=='edit'){
					config_block_edit($config[$array]['data'],$id);
				}else{
					config_block_add($id);
				}
			?>
			<div class="layui-form-item" style="width:80%;padding-top: 20px; text-align: center;">
				<button type="submit" class="layui-btn layui-btn-normal">确认保存</button>
				<button type="button" class="layui-btn" onclick="window.parent.layer.closeAll('iframe'); window.parent.location.reload();">关闭弹窗</button>
			</div>
		</form>
		<?php require('footer.php'); ?>
		<style>
			.layui-form-item{
				padding: 15px;
			}
			.layui-input-block{
				margin: 0;
				padding: 0 10px;
			}
			.layui-form-item .layui-input-inline{
				float: left;
    			width: auto;
				display: inline-block;
    			vertical-align: middle;
				margin: 0;
				padding: 0 10px;
			}
			.layui-form-item .layui-input-inline2{
				float: left;
				display: inline-block;
    			vertical-align: middle;
				margin: 0;
				padding: 0 10px;
			}
			.layui-input-inline2.hide,.layui-input-inline2.block{
				padding: 0;
			}
			.layui-input-inline2.hide{
				display: none;
			}
			.addition-copy .layui-input-inline2.hide{
				display: inline-block;
			}
			.addition-copy .layui-input-inline2.block{
				display: none;
			}
		</style>
	</body>
</html>

