<?php 
	require('./config.php');
	$data = $config['basic'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>
<?php require('header.php'); ?>
</head>
	<body>
		<div class="page-container basic">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>
			<div class="layui-tab-content">
				<form class="layui-form" method="post" action="?url=basic&array=basic&type=post" enctype="multipart/form-data">
                <fieldset class="layui-elem-field">
                    <legend>基本设置</legend>
                    <div class="layui-field-box">
                        <?php config_input('basic',$config['basic']) ?>
                    </div>
                </fieldset>
                  <fieldset class="layui-elem-field">
                    <legend>App 配置</legend>
                    <div class="layui-field-box">
                        <blockquote class="layui-elem-quote layui-text">
                        <svg width="20" height="20" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M24 6V42C17 42 11.7985 32.8391 11.7985 32.8391H6C4.89543 32.8391 4 31.9437 4 30.8391V17.0108C4 15.9062 4.89543 15.0108 6 15.0108H11.7985C11.7985 15.0108 17 6 24 6Z" fill="none" stroke="#333" stroke-width="4" stroke-linejoin="round"></path><path d="M32 15L32 15C32.6232 15.5565 33.1881 16.1797 33.6841 16.8588C35.1387 18.8504 36 21.3223 36 24C36 26.6545 35.1535 29.1067 33.7218 31.0893C33.2168 31.7885 32.6391 32.4293 32 33" stroke="#333" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"></path><path d="M34.2359 41.1857C40.0836 37.6953 44 31.305 44 24C44 16.8085 40.2043 10.5035 34.507 6.97906" stroke="#333" stroke-width="4" stroke-linecap="round"></path></svg>
                            需要在服务器上配置好HTTPS，否则无法使用。上传图标时，需要上传到服务器上，然后填写图片的URL地址。
                        </blockquote>
                        <div class="layui-form-item">
                            <label class="layui-form-label color">应用名称</label>
                            <div class="layui-input-inline w420">
                                <input type="text" class="layui-input upload-input" value="<?php echo $config['basic']['paw_name'];?>" name="paw_name">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label color">应用简介</label>
                            <div class="layui-input-inline w420">
                                <input type="text" class="layui-input upload-input" value="<?php echo $config['basic']['paw_short_name'];?>" name="paw_short_name">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label color">512x512图标：png格式 512px * 512px</label>
                                <div class="layui-input-inline w420">
                                    <input type="text" class="layui-input upload-input" value="<?php echo $config['basic']['paw_icon512'];?>" name="paw_icon512">
                                </div>
                            <div class="layui-input-inline buttun">
                                <button type="button" class="layui-btn layui-upload">上传图片</button>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label color">192x192图标：png格式 192px * 192px</label>
                                <div class="layui-input-inline w420">
                                    <input type="text" class="layui-input upload-input" value="<?php echo $config['basic']['paw_icon192'];?>" name="paw_icon192">
                                </div>
                            <div class="layui-input-inline buttun">
                                <button type="button" class="layui-btn layui-upload">上传图片</button>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label color">主题颜色：</label>
                            <div class="layui-input-inline w420">
                                <div class="layui-input-inline" style="width: 120px;">
                                    <input type="text" name="paw_theme_color" value="<?php echo $config['basic']['paw_theme_color']; ?>" placeholder="" class="layui-input color-input">
                                </div>
                                <div class="layui-input-inline">
                                    <div class="set-color layui-inline">
                                        <div class="layui-colorpicker"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label color">背景颜色：</label>
                            <div class="layui-input-inline w420">
                                <div class="layui-input-inline" style="width: 120px;">
                                    <input type="text" name="paw_background_color" value="<?php echo $config['basic']['paw_background_color']; ?>" placeholder="" class="layui-input color-input">
                                </div>
                                <div class="layui-input-inline">
                                    <div class="set-color layui-inline">
                                        <div class="layui-colorpicker"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="layui-elem-field footer" style="margin-top: 30px;">
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <a href="/" target="_back" class="layui-btn layui-btn-primary">打开前台</a>
                            <button type="button" class="layui-btn layui-btn-primary layer-confirm" data-url="?url=basic&array=basic&type=empty" data-msg="您确定要进行清空设置吗？该操作不可撤销！">
                                清空设置
                            </button>
                            <button type="submit" class="layui-btn layui-btn-normal">确认保存</button>
                        </div>
                    </div>
                </fieldset>
				</form>
			</div>
		</div>
		<?php require('footer.php'); ?>
	</body>
</html>

