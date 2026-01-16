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
		<div class="page-container seo">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>
			<div class="layui-tab-content">
				<blockquote class="layui-elem-quote layui-text">
                <svg width="20" height="20" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M24 6V42C17 42 11.7985 32.8391 11.7985 32.8391H6C4.89543 32.8391 4 31.9437 4 30.8391V17.0108C4 15.9062 4.89543 15.0108 6 15.0108H11.7985C11.7985 15.0108 17 6 24 6Z" fill="none" stroke="#333" stroke-width="4" stroke-linejoin="round"/><path d="M32 15L32 15C32.6232 15.5565 33.1881 16.1797 33.6841 16.8588C35.1387 18.8504 36 21.3223 36 24C36 26.6545 35.1535 29.1067 33.7218 31.0893C33.2168 31.7885 32.6391 32.4293 32 33" stroke="#333" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/><path d="M34.2359 41.1857C40.0836 37.6953 44 31.305 44 24C44 16.8085 40.2043 10.5035 34.507 6.97906" stroke="#333" stroke-width="4" stroke-linecap="round"/></svg>你可以插入常有标签也可以手动插入标签，写法：[vod_xxx]，具体标签可通过官方文档获取，<a href="https://www.shoutu.cn/article/118.html" target="_blank">查看官方标签</a>。
				</blockquote>
				<?php
					$array = require('./input.php');
					foreach ($array['aid'] as $title => $val) {
				?>
				<fieldset class="layui-elem-field" style="margin-top: 30px;">
					<legend><?php echo $title; ?></legend>
					<div class="layui-field-box" style="margin-top: 15px;">
						<form class="layui-form" method="post" action="?url=seo&array=seo<?php echo $val; ?>&type=post" enctype="multipart/form-data">
							<div class="layui-form-item seo">
								<div class="layui-input-inline">
									<input name="title" placeholder="标题" class="layui-input" value="<?php echo $config['seo'.$val]['title']; ?>" required lay-verify="required"/>
									<div class="layui-form-mid layui-word-aux">插入常用标签：<a class="layui-btn layui-btn-xs layui-addval" href="javascript:;" data-val="[site_name]">网站标题</a> <a class="layui-btn layui-btn-xs layui-addval" href="javascript:;" data-val="[vod_name]">视频名称</a> <a class="layui-btn layui-btn-xs layui-addval" href="javascript:;" data-val="[type_name]">分类名称</a>  <a class="layui-btn layui-btn-xs layui-addval" href="javascript:;" data-val="[topic_name]">专题名称</a></div>
								</div>
								<div class="layui-input-inline">
									<textarea name="key" rows="5" placeholder="关键词" class="layui-textarea"><?php echo $config['seo'.$val]['key']; ?></textarea>
									<div class="layui-form-mid layui-word-aux">插入常用标签：<a class="layui-btn layui-btn-xs layui-addval" href="javascript:;" data-val="[site_keywords]">网站关键词</a> <a class="layui-btn layui-btn-xs layui-addval" href="javascript:;" data-val="[vod_class]">视频剧情</a> <a class="layui-btn layui-btn-xs layui-addval" href="javascript:;" data-val="[vod_actor]">视频主演</a></div>
								</div>
								<div class="layui-input-inline">
									<textarea name="des" rows="5" placeholder="描述" class="layui-textarea"><?php echo $config['seo'.$val]['des']; ?></textarea>
									<div class="layui-form-mid layui-word-aux">插入常用标签：<a class="layui-btn layui-btn-xs layui-addval" href="javascript:;" data-val="[site_description]">网站描述</a> <a class="layui-btn layui-btn-xs layui-addval" href="javascript:;" data-val="[vod_blurb]">视频简介</a> <a class="layui-btn layui-btn-xs layui-addval" href="javascript:;" data-val="[topic_blurb]">专题简介</a></div>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">启用自定义文件</label>
								<div class="layui-input-inline" style="width: auto;">
									<input type="hidden" name="diy" value="">
									<input type="checkbox" lay-skin="primary" name="diy" value="1"<?php if($config['seo'.$val]['diy']) { echo "checked"; }?>>
								</div>
								<div class="layui-form-mid layui-word-aux">开启后请通过模板文件修改SEO参数，目录位置：根目录/template/模板/html/seo/</div>
							</div>
							<div class="layui-form-item" style="padding-top: 20px;margin-bottom:25px; text-align: center;">
								<button type="submit" class="layui-btn layui-btn-normal">确认保存</button>
                                <a href="/" target="_back" class="layui-btn layui-btn-primary">打开前台</a>
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

