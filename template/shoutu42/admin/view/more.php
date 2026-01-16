<?php
	require('./config.php');
	$dialog = $config['dialog'];
    $ad = $config['ad'];
    $other = $config['other'];
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
                            
                <fieldset class="layui-elem-field top slide">
                    <legend>广告设置</legend>
                    <div class="layui-field-box">
                    <blockquote class="layui-elem-quote layui-text">
                    您可以自由的添加多个广告组，然后使用“图片广告”模块参数填写广告id就可以调用它，附加参数填写背景颜色值，格式#000000，可选填。
                    </blockquote>
                    <form class="layui-form" method="post" action="?url=more&array=ad&type=add" enctype="multipart/form-data" style="margin-top: 20px;">
                        <?php config_img_post('2');?>
                    </form>
                    </div>
                </fieldset>
                <form class="layui-form" method="post" action="?url=more&array=ad&type=post" enctype="multipart/form-data">	
                <fieldset class="layui-elem-field body slide">
                    <legend class="subtitle">已添加的列表组</legend>
                    <div class="layui-field-box" style="margin-top: 10px;">
                        <?php
                            if(is_array($ad['data'])){
                                $href = '?url=more&array=ad&';
                                config_img('2',$ad['data'],$href);
                            }
                        ?>		
                    </div>
                    <div class="layui-form-item" style="padding-top: 20px; text-align: center;">
                        <button type="submit" class="layui-btn layui-btn-normal"> 确认保存</button>
                        <a href="/" target="_back" class="layui-btn layui-btn-primary"> 打开前台</a>
                    </div>
                </fieldset>  
                </form> 

                <!-- 其他设置 -->
                <form class="layui-form" method="post" action="?url=more&array=other&type=post" enctype="multipart/form-data">
                <fieldset class="layui-elem-field">
                    <legend>其他设置</legend>
                    <div class="layui-field-box other" style="margin-top: 15px;">
                        
                        <div class="layui-form-item">
                            <div class="layui-input-inline title">
                                <label class="layui-form-label">主题安全</label>
                            </div>
                            <div class="layui-input-inline" style="width: auto;">
                                <input type="hidden" name="modeno" value="0">
                                <input type="checkbox" lay-skin="primary" title="禁止调式" name="modeno" value="1"<?php if($other['modeno']) { echo "checked"; }?>>
                            </div>
                            <div class="layui-input-inline" style="width: auto;">
                                <input type="hidden" name="rightno" value="0">
                                <input type="checkbox" lay-skin="primary" title="屏蔽右键" name="rightno" value="1"<?php if($other['rightno']) { echo "checked"; }?>>
                            </div>
                            <div class="layui-input-inline" style="width: auto;">
                                <input type="hidden" name="f12no" value="0">
                                <input type="checkbox" lay-skin="primary" title="禁用F12" name="f12no" value="1"<?php if($other['f12no']) { echo "checked"; }?>>
                            </div>
                            <div class="layui-input-inline" style="width: auto;">
                                <input type="hidden" name="iframeno" value="0">
                                <input type="checkbox" lay-skin="primary" title="禁止框架引用" name="iframeno" value="1"<?php if($other['iframeno']) { echo "checked"; }?>>
                            </div>
                            <div class="layui-input-inline" style="width: auto;">
                                <input type="hidden" name="selectno" value="0">
                                <input type="checkbox" lay-skin="primary" title="禁止选择内容" name="selectno" value="1"<?php if($other['selectno']) { echo "checked"; }?>>
                            </div>
                              <div class="layui-input-inline" style="width: auto;">
                                <input type="hidden" name="pcflase" value="0">
                                <input type="checkbox" lay-skin="primary" title="屏蔽PC端" name="pcflase" value="1"<?php if($other['pcflase']) { echo "checked"; }?>>
                            </div>
                        </div>
                    </div>
                    <div class="layui-field-box dialog basic" style="padding-top: 20px;">
                        <div class="layui-form-item">
                            <label class="layui-form-label">屏蔽右键提示文字</label>
                            <div class="layui-input-inline w420">
                                <textarea name="rightnotext" rows="2" placeholder="留空不启用,例如:你知道的太多啦" class="layui-textarea"><?php echo $other['rightnotext'];?></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item right">
                            <label class="layui-form-label">全站变灰</label>
                            <div class="layui-input-inline" style="width: auto;">
                                <input type="text" name="opgreytime" class="layui-input" value="<?php echo $other['opgreytime'];?>" id="laydate" placeholder="选择时间">
                                <div class="layui-form-mid layui-word-aux">指定时间，无时间限制可留空</div>
                            </div>
                            <div class="layui-input-inline" style="width: auto;">
                                <input type="hidden" name="opgrey" value="0">
                                <input type="checkbox" lay-skin="primary" name="opgrey" title="" value="1"<?php if($other['opgrey']) { echo "checked"; }?>>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" style="padding-top: 20px; text-align: center;">
                        <button type="submit" class="layui-btn layui-btn-normal"> 确认保存</button>
                        <a href="/" target="_back" class="layui-btn layui-btn-primary"> 打开前台</a>
                    </div>
                </fieldset>
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

