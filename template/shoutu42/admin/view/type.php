<?php 
	require('./config.php');
	$data = $config['type'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>
<?php require('header.php');?>
</head>
	<body>
		<div class="page-container nav home type">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>
			<div class="layui-tab-content">
				<blockquote class="layui-elem-quote layui-text">
                <svg width="20" height="20" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M24 6V42C17 42 11.7985 32.8391 11.7985 32.8391H6C4.89543 32.8391 4 31.9437 4 30.8391V17.0108C4 15.9062 4.89543 15.0108 6 15.0108H11.7985C11.7985 15.0108 17 6 24 6Z" fill="none" stroke="#333" stroke-width="4" stroke-linejoin="round"/><path d="M32 15L32 15C32.6232 15.5565 33.1881 16.1797 33.6841 16.8588C35.1387 18.8504 36 21.3223 36 24C36 26.6545 35.1535 29.1067 33.7218 31.0893C33.2168 31.7885 32.6391 32.4293 32 33" stroke="#333" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M34.2359 41.1857C40.0836 37.6953 44 31.305 44 24C44 16.8085 40.2043 10.5035 34.507 6.97906" stroke="#333" stroke-width="4" stroke-linecap="round"/></svg>模块组逻辑：填写标题》选择模块》填写模块参数，模块参数是指分类id或对应模块的值等，例如广告模块填广告id，其他选项可根据需求选择，获取当前分类、主演等参数值填写current，全部分类填写all，具体可查看官方教程操作。
				</blockquote>
				<fieldset class="layui-elem-field">
					<legend>指定分类为栏目</legend>
					<div class="layui-field-box" style="margin-top: 15px;">
						<form class="layui-form" method="post" action="?url=type&array=typeid&type=add" enctype="multipart/form-data">
							<div class="layui-form-item">					
								<div class="layui-input-inline" style="width: 150px;">
									<input type="text" name="title" placeholder="标题" class="layui-input" value="">
								</div>
								<div class="layui-input-inline" style="width: 150px;">
									<input type="text" name="id" placeholder="分类ID" class="layui-input" value="">
								</div>
								<div class="layui-input-inline" style="width: auto;">
									<button type="submit" class="layui-btn layui-btn-warm">添加一组</button>
								</div>
                                <div class="layui-input-inline" style="width: auto;float:right">
								    <div class="layui-form-mid layui-word-aux">指定某分类为栏目，支持二级分类，可对栏目单独设置独立的模块组</div>
                                </div>
							</div>
						</form>
					</div>
				</fieldset>
				<div class="layui-tab" style="margin-top: 30px;">
					<ul class="layui-tab-title">
						<?php
							if(is_array($config['typeid']['data'])){
							foreach ($config['typeid']['data'] as $key => $value) {
						?>
						<li class="<?php if($key=='0'){ ?>layui-this<?php } ?>"><?php echo $value['title']; ?>
							<i class="layui-icon layui-icon-close layui-unselect layui-tab-close" data-key="<?php echo $key; ?>" data-id="<?php echo $value['id']; ?>"></i>
						</li>
						<?php }} ?>
					</ul>
					<div class="layui-tab-content" style="padding: 0;">
						<?php
							if(is_array($config['typeid']['data'])){
							foreach ($config['typeid']['data'] as $key2 => $value2) {
							$href = '?url=type&array=type'.$value2['id'].'&';
						?>
						<div class="layui-tab-item<?php if($key2=='0'){ ?> layui-show<?php } ?>">
							<div class="swiper" style="margin-bottom: 20px;">
								<div class="swiper-wrapper">
									<?php config_block_post('type'.$value2['id'],$href);?>
								</div>
								<div class="swiper-pagination"></div>
								<div class="swiper-button-prev"></div>
								<div class="swiper-button-next"></div>
							</div>
							<form class="layui-form" method="post" action="?url=type&array=type<?php echo $value2['id']; ?>&type=post" enctype="multipart/form-data">
                                <fieldset class="layui-elem-field">
                                    <legend class="subtitle">已添加的列表组 - 支持拖拽排序哦！</legend>
                                    <div class="layui-field-box" style="margin-top: 10px;">
                                    <?php
                                        if(is_array($config['type'.$value2['id']]['data'])){
                                            config_block('type'.$value2['id'],$config['type'.$value2['id']]['data'],$href);
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
						<?php }} ?>
					</div>
				</div>
			</div>
		</div>
		<script>
			$('.layui-tab-close').on('click', function(){
				let id = $(this).attr('data-id');
				let key = $(this).attr('data-key');
				let url = '?url=type&array=type'+id+'&type=empty&id='+key;
				layer.confirm('操作删除后栏目下所以模块也将被清空<br>您确定要删除栏目吗？,该操作不可撤销！', {
					btn: ['确认','取消'],
				}, function(){
					location.href=url;
				}, function(){
					layer.closeAll('confirm');
				});
			});
		</script>
		<?php require('footer.php'); ?>
	</body>
</html>

