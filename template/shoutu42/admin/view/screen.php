<?php 
	require('./config.php');
    $screen = $config['screen'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>
<?php require('header.php');?>
</head>
	<body>
    <div class="page-container play poster">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>
			<div class="layui-tab-content">
                
                <form class="layui-form" method="post" action="?url=screen&array=screen&type=post" enctype="multipart/form-data">
                <fieldset class="layui-elem-field">
                    <legend>筛选条件</legend>
                    <div class="layui-field-box" style="margin-top: 15px;">
                          <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">类型</label>
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="type_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="type_is" value="1" title="显示" <?php if($config['screen']['type_is']) { echo "checked"; }?>>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">剧情</label>
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="class_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="class_is" value="1" title="显示" <?php if($config['screen']['class_is']) { echo "checked"; }?>>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">地区</label>
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="area_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="area_is" value="1" title="显示" <?php if($config['screen']['area_is']) { echo "checked"; }?>>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">年份</label>
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="year_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="year_is" value="1" title="显示" <?php if($config['screen']['year_is']) { echo "checked"; }?>>
                            </div>
                        </div>
                         <div class="layui-form-item">
                                <div class="layui-input-inline title">
                                    <label class="layui-form-label">语言</label>
                                </div>
                                     <div class="layui-input-inline">
                                <input type="hidden" name="lang_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="lang_is" value="1" title="显示" <?php if($config['screen']['lang_is']) { echo "checked"; }?>>
                            </div>
                       </div>
                        <div class="layui-form-item">
                                <div class="layui-input-inline title">
                                    <label class="layui-form-label">字母</label>
                                </div>
                                     <div class="layui-input-inline">
                                <input type="hidden" name="letter_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="letter_is" value="1" title="显示" <?php if($config['screen']['letter_is']) { echo "checked"; }?>>
                            </div>
                       </div>
                        <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">排序</label>
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="by_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="by_is" value="1" title="显示" <?php if($config['screen']['by_is']) { echo "checked"; }?>>
                            </div>
                        </div>
                    </div>
                </fieldset>
                
                <fieldset class="layui-elem-field footer">
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <a href="/" target="_back" class="layui-btn layui-btn-primary">打开前台</a>
                            <button type="button" class="layui-btn layui-btn-danger layer-confirm layui-btn-primary" data-url="?url=index&array=set&type=empty" data-msg="您确定要进行清空设置吗？该操作不可撤销！">
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

