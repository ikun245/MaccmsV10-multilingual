<?php 
	require('./config.php');
    $data = $config['hot'];
	$href = '?url=hot&array=index&';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>
<?php require('header.php');?>
</head>
	<body>
		<div class="page-container nav home more">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>
            <div class="layui-tab-content">
                <fieldset class="layui-elem-field slide clearfix">
                    <legend>热榜单设置</legend>
					<div class="layui-field-box">
						<form class="layui-form" method="post" action="?url=hot&array=hot&type=add" enctype="multipart/form-data" style="margin-top: 20px;">
                        <?php config_hot_post();?>
						</form>
					</div>
				</fieldset>
                <fieldset class="layui-elem-field top slide">
                    <legend class="subtitle">已添加的列表组 - 支持拖拽排序哦！</legend>
					<div class="layui-field-box" style="margin-top: 10px;">

                    <form class="layui-form" method="post" action="?url=hot&array=hot&type=post" enctype="multipart/form-data">	
                    <?php
						if(is_array($data['data'])){
							$href = '?url=hot&array=hot&';
							config_hot($data['data'],$href);
						}
					?>
							<div class="layui-form-item" style="padding-top: 20px; text-align: center;">
								<button type="submit" class="layui-btn layui-btn-normal"> 确认保存</button>
                                <a href="/" target="_back" class="layui-btn layui-btn-primary"> 打开前台</a>
							</div>
						</form>
					</div>
				</fieldset>
			</div>
		</div>
		<?php require('footer.php'); ?>
	</body>
</html>

