<?php 
	require('./config.php');
	$data = $config['slide'];
	$module = $config['module'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理中心</title>
<?php require('header.php'); ?>
</head>
	<body>
		<div class="page-container more nav">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>

			<div class="layui-tab-content">
				<blockquote class="layui-elem-quote layui-text">
  					开启后，幻灯片数据苹果cms后台调用，数量最大8个，视频推荐9。
				</blockquote>
                 <form class="layui-form" method="post" action="?url=slide&array=slide&type=post" enctype="multipart/form-data">
                <fieldset class="layui-elem-field slide layui-form clearfix">
                    <legend>幻灯片设置</legend>
					     <div class="layui-field-box" style="margin-top: 15px;">
                        <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">幻灯片</label>
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="side_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="side_is" value="1" title="显示" <?php if($config['slide']['side_is']) { echo "checked"; }?>>
                            </div>
                        </div>
                        
                             <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">小标签</label>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;">
                                <select lay-filter="filter">
                                    <?php echo config_option('title',$config['slide']['subtitle1']); ?>
                                </select>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;">
                                <input name="subtitle1" type="text" value="<?php echo $config['slide']['subtitle1'];?>" placeholder="自定义" size="60" class="layui-input value">
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="subtitle1_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="subtitle1_is" value="1" title="显示" <?php if($config['slide']['subtitle1_is']) { echo "checked"; }?>>
                            </div>
                        </div>
                        
                             <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">副标题</label>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;">
                                <select lay-filter="filter">
                                    <?php echo config_option('title',$config['slide']['subtitle2']); ?>
                                </select>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;">
                                <input name="subtitle2" type="text" value="<?php echo $config['slide']['subtitle2'];?>" placeholder="自定义" size="60" class="layui-input value">
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="subtitle2_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="subtitle2_is" value="1" title="显示" <?php if($config['slide']['subtitle2_is']) { echo "checked"; }?>>
                            </div>
                        </div>
                        
                             <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">右边副标题</label>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;">
                                <select lay-filter="filter">
                                    <?php echo config_option('title',$config['slide']['subtitle3']); ?>
                                </select>
                            </div>
                            <div class="layui-input-inline" style="width: 120px;">
                                <input name="subtitle3" type="text" value="<?php echo $config['slide']['subtitle3'];?>" placeholder="自定义" size="60" class="layui-input value">
                            </div>
                            <div class="layui-input-inline">
                                <input type="hidden" name="subtitle3_is" value="0">
                                <input type="checkbox" lay-skin="primary" name="subtitle3_is" value="1" title="显示" <?php if($config['slide']['subtitle3_is']) { echo "checked"; }?>>
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

