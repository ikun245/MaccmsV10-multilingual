<?php
	require('./config.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>
<?php require('header.php'); ?>
</head>
	<body>
		<div class="page-container nav">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>
			<div class="layui-tab-content">
				<?php
					$array = require('./input.php');
					foreach ($array['nav'] as $title => $val ) {
				?>
				<fieldset class="layui-elem-field">
					<legend><?php echo $title; ?></legend>
					<div class="layui-field-box">
						<form class="layui-form" method="post" action="?url=nav&array=<?php echo $val; ?>&type=add" enctype="multipart/form-data" style="margin-top: 20px;">
                        <?php 
                            if($val=='nav_b'){
                                config_nav_post();
                            }else{
                                config_foot_nav_post();
                            }
                            ?>
						</form>
					</div>
				</fieldset>
                <fieldset class="layui-elem-field">
                    <legend class="subtitle">已添加的列表组 - 支持拖拽排序哦！</legend>
					<div class="layui-field-box" style="margin-top: 10px;">

						<form class="layui-form" method="post" action="?url=nav&array=<?php echo $val; ?>&type=post" enctype="multipart/form-data">
							<?php
								if(is_array($config[$val]['data'])){
									$href = '?url=nav&array='.$val.'&';
									config_nav($config[$val]['data'],$href);
								}
							?>
							<div class="layui-form-item" style="padding-top: 20px; text-align: center;">
								<button type="submit" class="layui-btn layui-btn-normal"> 确认保存</button>
                                <a href="/" target="_back" class="layui-btn layui-btn-primary"> 打开前台</a>
							</div>
						</form>
					</div>
				</fieldset>

				<?php } ?>
			</div>
		</div>
		<?php require('footer.php'); ?>
	</body>
</html>

