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
		<div class="page-container basic">
			<?php require('top.php');?>
			<ul class="layui-nav">
				<?php config_menu($config) ?>
			</ul>
			<div class="layui-tab-content">
				<script>
					$(function(){
						var path = window.parent.ADMIN_PATH;
						if (!path) {
							$("#cmstips").css("display","block");
						}
					});
				</script>

				<fieldset class="layui-elem-field">
					<legend>主题介绍</legend>
					<div class="layui-field-box">
						<div class="layui-row theme-basic">
							<div class="layui-col-md4">
								<table class="layui-table">	
									<tbody>
										<tr>
											<td class="layui-font-gray">主题名称</td>
											<td class="layui-font-input"><?php echo $theme['name'];?></td>
										</tr>
										<tr>
											<td class="layui-font-gray">当前版本</td>
											<td class="layui-font-input"><?php echo $theme['version'];?></td>
										</tr> 
										<tr>
											<td class="layui-font-gray">更新日期</td>
											<td class="layui-font-input"><?php echo $theme['inputtime'];?></td>
										</tr>
									</tbody>
								</table> 
							</div>
							<div class="layui-col-md4">
								<table class="layui-table">	
									<tbody>
										<tr>
											<td class="layui-font-gray">发布时间</td>
											<td class="layui-font-input"><?php echo $theme['updatetime'];?></td>
										</tr>	
										<tr>
											<td class="layui-font-gray">主题作者</td>
											<td class="layui-font-input"><?php echo $theme['author'];?></td>
										</tr>		        	
										<tr>
											<td class="layui-font-gray">联系作者</td>
											<td class="layui-font-input"><?php echo $theme['qq'];?></td>
										</tr>
									</tbody>
								</table>   
							</div>
							<div class="layui-col-md4">
								<table class="layui-table">	
									<tbody>
										<tr>
											<td class="layui-font-gray">适用版本</td>
											<td class="layui-font-input"><?php echo $theme['system'];?></td>
										</tr>
										<tr>
											<td class="layui-font-gray">浏览器</td>
											<td class="layui-font-input">IE10+ Chrome25+</td>
										</tr>
										<tr>
											<td class="layui-font-gray">官网地址</td>
											<td class="layui-font-input"> <a target="_blank" href="<?php echo $theme['website'];?>"><?php echo $theme['website'];?></a></td>
										</tr>
										
									</tbody>
								</table>
							</div>
						</div>
                        <div class="theme-copyright">
                            <p>严禁转发、倒卖、破解等行为，违者将取消授权和售后服务，有可能封禁！！！</p>
                        </div>
					</div>
				</fieldset>
				
                <form class="layui-form" method="post" action="?url=index&array=set&type=post" enctype="multipart/form-data">
							
				<fieldset class="layui-elem-field">
					<legend>常用设置</legend>
					<div class="layui-field-box">
						<?php config_input('index',$config['set']) ?>
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

