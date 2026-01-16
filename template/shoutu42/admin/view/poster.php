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
		<div class="page-container poster">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>

			<div class="layui-tab-content">
				<blockquote class="layui-elem-quote layui-text">
                <svg width="20" height="20" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M24 6V42C17 42 11.7985 32.8391 11.7985 32.8391H6C4.89543 32.8391 4 31.9437 4 30.8391V17.0108C4 15.9062 4.89543 15.0108 6 15.0108H11.7985C11.7985 15.0108 17 6 24 6Z" fill="none" stroke="#333" stroke-width="4" stroke-linejoin="round"/><path d="M32 15L32 15C32.6232 15.5565 33.1881 16.1797 33.6841 16.8588C35.1387 18.8504 36 21.3223 36 24C36 26.6545 35.1535 29.1067 33.7218 31.0893C33.2168 31.7885 32.6391 32.4293 32 33" stroke="#333" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M34.2359 41.1857C40.0836 37.6953 44 31.305 44 24C44 16.8085 40.2043 10.5035 34.507 6.97906" stroke="#333" stroke-width="4" stroke-linecap="round"/></svg>当前设置对站点全局有效，下拉框没有的参数可手动填写要调用的标签，具体可参考官方文档。
				</blockquote>
                
                <fieldset class="layui-elem-field">
                    <legend>竖版海报设置</legend>
                    <form class="layui-form" method="post" action="?url=poster&array=poster&type=post" enctype="multipart/form-data">
                    <div class="layui-field-box" style="margin-top: 15px;">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <label class="layui-form-label" style="padding-right: 5px;">懒加载背景图</label>
                                </div>
                                <div class="layui-input-inline">
                                    <input type="text" class="layui-input upload-input" value="<?php echo $config['poster']['lopimg'];?>" name="lopimg">
                                    
                                </div>
                                <div class="layui-input-inline">
                                    <button type="button" class="layui-btn layui-upload">上传图片</button>
                                </div>
                                <div class="layui-input-inline" style="margin-top: 25px;">
                                <?php if($config['poster']['lopimg']){ ?>
                                    <div class="layui-form-mid layui-word-aux">
                                        <img src="<?php echo $config['poster']['lopimg'];?>" />
                                    </div>
                                    <div class="layui-form-mid layui-word-aux">
                                        <img src="<?php echo $config['poster']['lopimg'];?>" />
                                    </div>
                                    <div class="layui-form-mid layui-word-aux">
                                        <img src="<?php echo $config['poster']['lopimg'];?>" />
                                    </div>
                                <?php }?>
                                </div>
                            </div>
                        </div>
                              <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">副标题1</label>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;">
                                <select lay-filter="filter">
                                    <?php echo config_option('title',$config['poster']['text']); ?>
                                </select>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;">
                                <input name="text" type="text" value="<?php echo $config['poster']['text'];?>" placeholder="自定义" size="60" class="layui-input value">
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="text_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="text_is" value="1" title="显示" <?php if($config['poster']['text_is']) { echo "checked"; }?>>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" style="padding-top: 20px; text-align: center;">
                        <button type="submit" class="layui-btn layui-btn-normal"> <i class="layui-icon layui-icon-release"></i> 确认保存</button>
                        <a href="/" target="_back" class="layui-btn layui-btn-primary"> <i class="layui-icon layui-icon-home"></i> 打开前台</a>
                    </div>
                </form>
                </fieldset>

        
			</div>
		</div>
		<?php require('footer.php'); ?>
	</body>
</html>

