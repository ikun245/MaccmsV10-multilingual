<?php 
	require('./config.php');
	$data = $config['ad'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>
<?php require('header.php'); ?>
</head>
	<body>
		<div class="page-container">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>
			<div class="layui-tab-content">
				<blockquote class="layui-elem-quote layui-text">
				您可以自由的添加多个广告组，然后使用“图片广告”模块参数填写广告id就可以调用它，附加参数填写背景颜色值，格式#000000，可选填。
				</blockquote>
				<form class="layui-form" method="post" action="?url=ad&array=ad&type=add" enctype="multipart/form-data" style="margin-top: 20px;">
					<?php config_img_post('2');?>
				</form>
				<form class="layui-form" method="post" action="?url=ad&array=ad&type=post" enctype="multipart/form-data">					
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
						<legend>已添加的列表组</legend>
					</fieldset>
					<?php
						if(is_array($data['data'])){
							$href = '?url=ad&array=ad&';
							config_img('2',$data['data'],$href);
						}
					?>		
					<div class="layui-form-item" style="padding-top: 20px; text-align: center;">
						<button type="submit" class="layui-btn layui-btn-normal"> <i class="layui-icon layui-icon-release"></i> 确认保存</button>
                        <button type="button" class="layui-btn layui-btn-danger layer-confirm" data-url="?url=ad&array=ad&type=empty" data-msg="您确定要进行清空操作吗？该操作不可撤销！"><i class="layui-icon layui-icon-delete"></i> 清空模块</button><a href="/" target="_back" class="layui-btn layui-btn-primary"> <i class="layui-icon layui-icon-home"></i> 打开前台</a>
					</div>
				</form>
				
			</div>
		</div>
		<?php require('footer.php'); ?>
	</body>
</html>