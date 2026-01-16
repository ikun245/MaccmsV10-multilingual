<?php
	require('./config.php');
	$data = $config['dialog'];
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
  					您可以自由的添加一个或多个自定义弹窗组，然后使用javascript:tzt_dialog('**');这样的方式启用它，例如做一个下载APP的二维码弹窗。
				</blockquote>
				<form class="layui-form" method="post" action="?url=dialog&array=dialog&type=add" enctype="multipart/form-data">
					<input type="hidden" name="is" value="1">
					<div class="layui-form-item">
						<div class="layui-input-block box" style=" margin: 0 0 20px;">
							<textarea name="code" rows="5" class="layui-textarea" placeholder="自定义内容和样式，支持html" required lay-verify="required"></textarea>
						</div>
						<div class="layui-input-block" style="margin: 0;">
							<div class="layui-input-inline" style="width: 150px;">
								<input type="text" name="id" placeholder="id标识" class="layui-input" required lay-verify="required">
							</div>
							<div class="layui-input-inline" style="width: 180px;">
								<input type="text" name="title" placeholder="标题" class="layui-input" required lay-verify="required">
							</div>
							<div class="layui-input-inline" style="width: 180px;">
								<select name="class">
									<option value="center">居中弹窗</option>
									<option value="left">左侧划出</option>
									<option value="right">右侧划出</option>
									<option value="bottom">底部划出</option>
								</select>
							</div>
							<div class="layui-input-inline">
								<button type="submit" class="layui-btn layui-btn-warm"><i class="layui-icon layui-icon-addition"></i> 添加一组</button>
							</div>
						</div>
						
					</div>
				</form>
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>已添加的弹窗组</legend>
				</fieldset>
				<?php
					if(is_array($data['data'])){
					foreach ($data['data'] as $key => $value) {
				?>
				<form class="layui-form" method="post" action="?url=dialog&array=dialog&type=post" enctype="multipart/form-data">
					<div class="layui-form-item">
						<div class="layui-input-block" style="margin: 0;">
							<div class="layui-input-inline" style="width: 20px;">
								<input type="hidden" name="data[<?php echo $key; ?>][is]" value="0">
								<input type="checkbox" lay-skin="primary" name="data[<?php echo $key; ?>][is]" value="1" <?php if($value['is']) { echo "checked"; }?>>
							</div>
							<div class="layui-input-inline" style="width: 90px;">
								<input type="text" name="data[<?php echo $key; ?>][id]" placeholder="id标识" class="layui-input" value="<?php echo $value['id']; ?>">
							</div>
							<div class="layui-input-inline" style="width: 100px;">
								<input type="text" name="data[<?php echo $key; ?>][title]" placeholder="标题" class="layui-input" value="<?php echo $value['title']; ?>">
							</div>
							<div class="layui-input-inline" style="width: 240px;">
								<input type="text" class="layui-input" value="javascript:tzt_dialog('<?php echo $value['id']; ?>');">
							</div>
							<div class="layui-input-inline" style="width: 110px;">
								<select name="data[<?php echo $key; ?>][class]">
									<option value="center"<?php if($value['class']=='center') { echo "selected"; }?>>居中弹窗</option>
									<option value="left"<?php if($value['class']=='left') { echo "selected"; }?>>左侧划出</option>
									<option value="right"<?php if($value['class']=='right') { echo "selected"; }?>>右侧划出</option>
									<option value="bottom"<?php if($value['class']=='bottom') { echo "selected"; }?>>底部划出</option>
								</select>
							</div>
							<div class="layui-input-inline" style="width: auto;">
								<button type="button" class="layui-btn layui-btn-warm btn-code"><i class="layui-icon layui-icon-fonts-code"></i></button>
								<button type="button" class="layui-btn layui-btn-danger layer-confirm" data-url="?url=dialog&array=dialog&type=del&id=<?php echo $key; ?>">
									<i class="layui-icon layui-icon-close"></i>
								</button>
							</div>
						</div>
						<div class="layui-input-block box" style="display: none; margin: 20px 0 0;">
							<textarea name="data[<?php echo $key; ?>][code]" rows="5" class="layui-textarea" placeholder="自定义内容和样式，支持html"><?php echo htmlspecialchars($value['code']);?></textarea>
						</div>
					</div>
					<?php }} ?>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button type="submit" class="layui-btn layui-btn-normal"> <i class="layui-icon layui-icon-release"></i> 确认保存</button>
							<button type="button" class="layui-btn layui-btn-danger layer-confirm layui-btn-primary" data-url="?url=dialog&array=dialog&type=empty" data-msg="您确定要进行清空操作吗？该操作不可撤销！">
								 <i class="layui-icon layui-icon-delete"></i> 清空模块
							</button>
							<a href="/" target="_back" class="layui-btn layui-btn-primary"> <i class="layui-icon layui-icon-home"></i> 打开前台</a>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script>
			$('.btn-code').click(function(){
				let $_this = $(this);
				$_this.parent().parent().parent().find('.box').show();
			});
    </script>
		<?php require('footer.php'); ?>
	</body>
</html>