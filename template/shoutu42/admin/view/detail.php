<?php 
	require('./config.php');
	$href = '?url=detail&array=detail&';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>
<?php require('header.php');?>
</head>
	<body>
		<div class="page-container nav home">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>
			<div class="layui-tab-content">
				<blockquote class="layui-elem-quote layui-text">
                <svg width="20" height="20" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M24 6V42C17 42 11.7985 32.8391 11.7985 32.8391H6C4.89543 32.8391 4 31.9437 4 30.8391V17.0108C4 15.9062 4.89543 15.0108 6 15.0108H11.7985C11.7985 15.0108 17 6 24 6Z" fill="none" stroke="#333" stroke-width="4" stroke-linejoin="round"/><path d="M32 15L32 15C32.6232 15.5565 33.1881 16.1797 33.6841 16.8588C35.1387 18.8504 36 21.3223 36 24C36 26.6545 35.1535 29.1067 33.7218 31.0893C33.2168 31.7885 32.6391 32.4293 32 33" stroke="#333" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M34.2359 41.1857C40.0836 37.6953 44 31.305 44 24C44 16.8085 40.2043 10.5035 34.507 6.97906" stroke="#333" stroke-width="4" stroke-linecap="round"/></svg>模块组逻辑：填写标题》选择模块》填写模块参数，模块参数是指分类id或对应模块的值等，例如广告模块填广告id，其他选项可根据需求选择，获取当前分类、主演等参数值填写current，全部分类填写all，具体可查看官方教程操作。
				</blockquote>
				
				  <form class="layui-form" method="post" action="?url=detail&array=detailserie&type=post" enctype="multipart/form-data">
                <fieldset class="layui-elem-field slide layui-form clearfix">
                    <legend>其他设置</legend>
					     <div class="layui-field-box" style="margin-top: 15px;">
                        <div class="layui-form-item">
                            <div class="layui-input-inline title" style="width: 60px;">
                                <label class="layui-form-label">系列影片</label>
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="serie_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="serie_is" value="1" title="显示" <?php if($config['detailserie']['serie_is']) { echo "checked"; }?>>
                            </div>
                        </div>
                        
                        
                    </div>
                             <div class="layui-form-item" style="text-align: center;">
                            <button type="submit" class="layui-btn layui-btn-normal"> 确认保存</button>
                            <a href="/" target="_back" class="layui-btn layui-btn-primary"> 打开前台</a>
                        </div>
				</fieldset>
                  </form>
				
				<div class="swiper" style="margin-bottom: 20px;">
					<div class="swiper-wrapper">
						<?php config_block_post('detail',$href);?>
					</div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
				<form class="layui-form" method="post" action="<?php echo $href;?>type=post" enctype="multipart/form-data">
                    <fieldset class="layui-elem-field">
                        <legend class="subtitle">已添加的列表组 - 支持拖拽排序哦！</legend>
                        <div class="layui-field-box" style="margin-top: 10px;">
                        <?php
                            if(is_array($config['detail']['data'])){
                                config_block('detail',$config['detail']['data'],$href);
                            }
                        ?>
                        </div>
                    </fieldset>
                    <fieldset class="layui-elem-field footer">
                        <div class="layui-form-item">
                            <a href="/" target="_back" class="layui-btn layui-btn-primary">打开前台</a>
                            <button type="button" class="layui-btn layui-btn-primary layer-confirm" data-url="<?php echo $href;?>type=empty" data-msg="您确定要进行清空设置吗？该操作不可撤销！">清空模块</button>
                            <button type="submit" class="layui-btn layui-btn-normal">确认保存</button>
                        </div>
                    </fieldset> 
				</form>
			</div>
		</div>
		<?php require('footer.php'); ?>
	</body>
</html>

