<?php
	function config_block_add($block)
	{
		$array = require('./input.php');
		echo '<input type="hidden" name="is" value="1">
        <div class="add_iframe">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="text" name="title" placeholder="模块标题" class="layui-input" required lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline2" style="width: 170px;">
                    <select name="block">';echo config_option('block',$block);echo '</select>
                </div>
                <div class="layui-input-inline2" style="width: 170px;padding-right:0;">
                    <input type="text" name="type" placeholder="模块参数" class="layui-input" style="padding:0;text-align:center;" required lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-inline2" style="width: 170px;">
                    <select name="by">
                        <option value="">排序</option>';echo config_option('by','0');echo '
                    </select>
                </div>
                <div class="layui-input-inline2" style="width: 170px;padding-right:0;">
                    <input name="subval" type="text" placeholder="附加参数" class="layui-input" style="padding:0;text-align:center;">
                </div>
            </div>
            <div class="addition-copy">
            </div>
            <div class="layui-form-item addition-data">
                <div class="layui-input-inline2" style="width: 170px;">
                    <select lay-filter="filter3">
                        <option value="">指定</option>';echo config_option('where','0');echo '
                    </select>
                </div>
                <div class="layui-input-inline2"style="width: 115px;padding-right:10px;">
                    <input data-name="" type="text" placeholder="指定参数" class="layui-input value" style="padding:0;text-align:center;">
                </div>
                
                <div class="layui-input-inline2 block" style="width: 20px;">
                    <button type="button" class="layui-btn layui-btn-sm layui-btn-warm addition-val">
                        <i class="layui-icon layui-icon-addition"></i>
                    </button>
                </div>
                <div class="layui-input-inline2 hide" style="width: 20px;">
                    <button type="button" class="layui-btn layui-btn-sm layui-btn-warm addition-del">
                        <i class="layui-icon layui-icon-close"></i>
                    </button>
                </div>
            </div>
        </div>
		';
	}



	function config_block_post($merge,$href)
	{
		$array = require('./input.php');
		foreach ($array['block'] as $k => $v) {
			echo '<div class="swiper-slide">';
				echo '<div>';
				echo '<img style="width:100%;" src="'.$v[2].'" />
				';
				echo '</div>';
				echo '<div style="background-color: #EEEFF2;border-radius:0 0 13px 13px;padding:14px 20px;color:#3D3D3D;display:flex;justify-content:space-between;align-items:center;">'.$v[3];
                echo '<div class="page" style="text-align: center;">
						<a href="javascript:;" class="left-prev"><i class="layui-icon layui-icon-left"></i></a>
						<span class="layui-btn layui-btn-xs layui-btn-primary lef-page" style="width: auto;"></span>
						<a href="javascript:;" class="right-next"><i class="layui-icon layui-icon-right"></i></a>
					';
				echo '<button type="button" class="layui-btn layui-btn-sm layui-btn-warm layer-edit" data-id="'.$v[1].'" data-array="'.$merge.'" data-type="add">
				添加这种模块
			</button></div></div>';
				echo '</form>';
			echo '</div>';
		}
	}



	function config_block_edit($array,$key)
	{
		echo '<input type="hidden" name="data['.$key.'][is]" value="1">
        <div class="add_iframe">
		<div class="layui-form-item">
			<div class="layui-input-block">
				<input type="text" name="data['.$key.'][title]" placeholder="模块标题" class="layui-input" value="'.$array[$key]['title'].'" required lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-inline2" style="width: 170px;">
				<select name="data['.$key.'][block]">';echo config_option('block',$array[$key]['block']);echo '</select>
			</div>
			<div class="layui-input-inline2" style="width: 170px;;padding-right:0;">
				<input type="text" name="data['.$key.'][type]" placeholder="模块参数" class="layui-input" value="'.$array[$key]['type'].'" style="padding:0;text-align:center;" required lay-verify="required">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-inline2" style="width: 170px;">
				<select name="data['.$key.'][by]">
					<option value="">排序</option>';echo config_option('by',$array[$key]['by']);echo '
				</select>
			</div>
			<div class="layui-input-inline2" style="width: 170px;;padding-right:0;">
				<input name="data['.$key.'][subval]" type="text" placeholder="附加参数" value="'.$array[$key]['subval'].'" class="layui-input" style="padding:0;text-align:center;">
			</div>
		</div>
		
		<div class="addition-copy">';
			foreach($array[$key] as $k => $v)
			{
				$len++;
				if($len>6){
					echo '
					<div class="layui-form-item">
						<div class="layui-input-inline2" style="width: 170px;">
							<select lay-filter="filter2">
								<option value="">指定</option>';
								echo config_option('where',$k);
								echo '
							</select>
						</div>
						<div class="layui-input-inline2" style="width: 115px;">
							<input data-name="data['.$key.']" name="data['.$key.']['.$k.']" type="text" placeholder="参数" value="'.$v.'" class="layui-input value" style="padding:0;text-align:center;">
						</div>
						<div class="layui-input-inline2 hide" style="width: 30px;">
							<button type="button" class="layui-btn layui-btn-sm layui-btn-warm addition-del" style="margin-top:7px;">
								<i class="layui-icon layui-icon-close"></i>
							</button>
						</div>
					</div>
					';
				}

			}
		echo '
		</div>
		<div class="layui-form-item addition-data">
			<div class="layui-input-inline2" style="width: 170px;">
				<select lay-filter="filter2">
					<option value="">指定</option>';echo config_option('where',$array[$key]['where']);echo '
				</select>
			</div>
			<div class="layui-input-inline2"style="width: 115px;">
				<input data-name="data['.$key.']" type="text" placeholder="参数" value="" class="layui-input value" style="padding:0;text-align:center;">
			</div>
			<div class="layui-input-inline2 block" style="width: 20px;">
				<button type="button" class="layui-btn layui-btn-sm layui-btn-warm addition-val">
					<i class="layui-icon layui-icon-addition"></i>
				</button>
			</div>
			<div class="layui-input-inline2 hide" style="width: 20px;">
				<button type="button" class="layui-btn layui-btn-sm layui-btn-warm addition-del">
					<i class="layui-icon layui-icon-close"></i>
				</button>
			</div>
		</div></div>
		';
	}

	function config_block($merge,$array,$href)
	{
		foreach ($array as $key => $value) {
			echo '<div class="layui-form-item arrange">
			<div class="id">
                <div class="layui-input-inline" style="width: 20px;">
                    <input type="hidden" name="data['.$key.'][is]" value="0">
                    <input type="checkbox" lay-skin="primary" name="data['.$key.'][is]" value="1"'.($value['is'] ? 'checked' :'').'>
                </div>
            </div>
            <div class="type">
                <div class="layui-input-inline">
                    <input type="text" name="data['.$key.'][title]" placeholder="模块标题" class="layui-input" value="'.$value['title'].'">
                </div>
                <div class="layui-input-inline">
                    <select name="data['.$key.'][block]">';echo config_option('block',$value['block']);echo '</select>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="data['.$key.'][type]" placeholder="模块参数" class="layui-input" value="'.$value['type'].'" style="padding:0;text-align:center;">
                </div>
                <div class="layui-input-inline">
                    <select name="data['.$key.'][by]">
                        <option value="">排序</option>';echo config_option('by',$value['by']);echo '
                    </select>
                </div>
            </div>
            <div class="add">
                <div class="layui-input-inline" style="width: 120px;">
                    <input name="data['.$key.'][subval]" type="text" placeholder="附加参数" value="'.$value['subval'].'" class="layui-input" style="padding:0;text-align:center;">
                </div>
                <div class="layui-input-inline" style="width: auto; margin-right: 0;">
                    <button type="button" class="layui-btn layui-btn-sm layui-btn-warm layer-edit" data-id="'.$key.'" data-array="'.$merge.'" data-type="edit"><span>编辑</span></button><button type="button" class="layui-btn layui-btn-sm layui-btn-danger layer-confirm"  data-url="'.$href.'type=del&id='.$key.'"><span>删除</span></button>
                </div>
            </div>
			';
			$len=0;
			foreach($array[$key] as $k => $v)
			{
				$len++;
				if($len>6){
					echo '<input type="hidden" name="data['.$key.']['.$k.']" value="'.$v.'">';
				}
			}
		echo '</div>';

		}
	}

	function config_nav_post()
	{
		echo '<div class="layui-form-item active">
            <div class="id">
                <div class="layui-input-inline">
                    <input type="hidden" name="is" value="1">
                    <input type="checkbox" lay-skin="primary" name="is" value="1" checked>
                </div>
            </div>
            <div class="type">
                <div class="layui-input-inline">
                    <input type="text" name="icon" placeholder="该图标无需设置" class="layui-input" value="" disabled>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="title" placeholder="标题" class="layui-input" value="" required lay-verify="required">
                </div>
                <div class="layui-input-inline">
                    <select name="type">';echo config_option('url','0');echo '</select>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="val" placeholder="参数" class="layui-input" value="" required lay-verify="required">
                </div>
            </div>
            <div class="add">
                <div class="layui-input-inline" style="width: auto;">
                    <input type="hidden" name="blank" value="0">
                    <input type="checkbox" lay-skin="primary" name="data[blank]" title="新窗口" value="1">
                </div>
                <div class="layui-input-inline" style="width: auto;">
                    <button type="submit" class="layui-btn layui-btn-sm layui-btn-warm">
                        <span>增加</span>
                    </button>
                </div>
            </div>
		</div>';
		
	}
    
	function config_foot_nav_post()
	{
		echo '<div class="layui-form-item active">
            <div class="id">
                <div class="layui-input-inline">
                    <input type="hidden" name="is" value="1">
                    <input type="checkbox" lay-skin="primary" name="is" value="1" checked>
                </div>
            </div>
            <div class="type">
                <div class="layui-input-inline">
                    <input type="text" name="icon" placeholder="图标" class="layui-input" value="">
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="title" placeholder="标题" class="layui-input" value="" required lay-verify="required">
                </div>
                <div class="layui-input-inline">
                    <select name="type">';echo config_option('url','0');echo '</select>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="val" placeholder="参数" class="layui-input" value="" required lay-verify="required">
                </div>
            </div>
            <div class="add">
                <div class="layui-input-inline" style="width: auto;">
                    <input type="hidden" name="blank" value="0">
                    <input type="checkbox" lay-skin="primary" name="data[blank]" title="新窗口" value="1">
                </div>
                <div class="layui-input-inline" style="width: auto;">
                    <button type="submit" class="layui-btn layui-btn-sm layui-btn-warm">
                        <span>增加</span>
                    </button>
                </div>
            </div>
		</div>';
		
	}

	function config_nav($array,$href)
	{
		foreach ($array as $key => $value) {
			echo '<div class="layui-form-item arrange">
                <div class="id">
                    <div class="layui-input-inline">
                        <input type="hidden" name="data['.$key.'][is]" value="0">
                        <input type="checkbox" lay-skin="primary" name="data['.$key.'][is]" value="1"'.($value['is'] ? 'checked' :'').'>
                    </div>
                </div>
                <div class="type">
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][icon]" placeholder="图标" class="layui-input" value="'.$value['icon'].'">
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][title]" placeholder="标题" class="layui-input" value="'.$value['title'].'">
                    </div>
                    <div class="layui-input-inline">
                        <select name="data['.$key.'][type]">';echo config_option('url',$value['type']);echo '</select>
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][val]" placeholder="参数" class="layui-input" value="'.$value['val'].'">
                    </div>
                </div>
                <div class="add">
                    <div class="layui-input-inline" style="width: auto;">
                        <input type="hidden" name="data['.$key.'][blank]" value="0">
                        <input type="checkbox" lay-skin="primary" name="data['.$key.'][blank]" title="新窗口" value="1"'.($value[' blank'] ? 'checked' :'').'>
                    </div>
                    <div class="layui-input-inline" style="width: auto;">
                        <button type="button" class="layui-btn layui-btn-sm layui-btn-danger layer-confirm" data-url="'.$href.'type=del&id='.$key.'">
                            <span>删除</span>
                        </button>
                    </div>
                </div>
			</div>';
		}
	}

    function config_screen($array)
	{
		foreach ($array as $key => $value) {
			echo '
            <div class="layui-form-item arrange">
                <div class="layui-input-inline title">
                        <input type="text" name="data['.$key.'][title]"  class="layui-input" value="'.$value['title'].'" disabled>
                    </div>
                    <input type="hidden" name="data['.$key.'][val]" value="'.$value['val'].'">
                <div class="layui-input-inline">
                    <input type="hidden" name="data['.$key.']['.$value['val'].']" value="0">
                    <input type="checkbox" lay-skin="primary" name="data['.$key.']['.$value['val'].']" title="显示" value="1" '.($value[$value['val']] ? 'checked' :'').'>
                </div>
            </div>';
		}
	}

	function config_img_post($id)
	{
		echo '<div class="layui-form-item arrange">
        <div class="id">
			<div class="layui-input-inline" style="width: 20px;">
				<input type="hidden" name="is" value="1">
				<input type="checkbox" lay-skin="primary" name="is" value="1" checked>
			</div>
        </div>
        <div class="type">
		';
		if($id=='2'){
			echo '
				<div class="layui-input-inline">
					<input type="text" placeholder="id" class="layui-input layui-disabled" value="id" disabled>
				</div>
			';
		}
		echo '
			<div class="layui-input-inline">
				<input type="text" name="title" placeholder="标题" class="layui-input" value="" required lay-verify="required">
			</div>
		';
		if($id=='1'){
			echo '
				<div class="layui-input-inline">
					<input type="text" name="id" placeholder="视频id" class="layui-input" value="">
				</div>
			';
		}
		echo '
                <div class="layui-input-inline">
                    <input type="text" name="url" placeholder="链接" class="layui-input" value="">
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="img" placeholder="图片" class="layui-input upload-input" value="" required lay-verify="required">
                </div>
                <div class="layui-input-inline" style="width: 95px;">
                    <button type="button" class="layui-btn layui-upload">上传图片</button>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="val" placeholder="附加参数" class="layui-input" value="">
                </div>
            </div>
            <div class="add">
                <div class="layui-input-inline" style="width: auto;">
                    <input type="hidden" name="blank" value="0">
                    <input type="checkbox" lay-skin="primary" name="blank" title="新窗口" value="1">
                </div>
                <div class="layui-input-inline" style="width: auto;">
                    <button type="submit" class="layui-btn layui-btn-sm layui-btn-warm">
                    <span>增加</span>
                    </button>
                </div>
            </div>
		</div>';
	}

	function config_img($id,$array,$href)
	{
		foreach ($array as $key => $value) {
			echo '<div class="layui-form-item arrange">
            <div class="id">
				<div class="layui-input-inline" style="width: 20px;">
					<input type="hidden" name="data['.$key.'][is]" value="0">
					<input type="checkbox" lay-skin="primary" name="data['.$key.'][is]" value="1"'.($value['is'] ? 'checked' :'').'>
				</div>
            </div>
            <div class="type">
			';
			if($id=='2'){
				echo '
					<div class="layui-input-inline">
						<input type="text" placeholder="广告id" class="layui-input layui-disabled" value="id:'.$key.'" disabled>
					</div>
				';
			}
			echo '
				<div class="layui-input-inline">
					<input type="text" name="data['.$key.'][title]" placeholder="标题" class="layui-input" value="'.$value['title'].'">
				</div>
			';
			if($id=='1'){
				echo '
					<div class="layui-input-inline">
						<input type="text" name="data['.$key.'][id]" placeholder="视频id" class="layui-input" value="'.$value['id'].'">
					</div>
				';
			} 
			echo '
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][url]" placeholder="链接" class="layui-input" value="'.$value['url'].'">
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][img]" placeholder="图片" class="layui-input upload-input" value="'.$value['img'].'">
                    </div>
                    <div class="layui-input-inline" style="width: 95px;">
                        <button type="button" class="layui-btn layui-upload">上传图片</button>
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][val]" placeholder="附加参数" class="layui-input" value="'.$value['val'].'">
                    </div>
                </div>
                <div class="add">
                    <div class="layui-input-inline" style="width: auto;">
                        <input type="hidden" name="data['.$key.'][blank]" value="0">
                        <input type="checkbox" lay-skin="primary" name="data['.$key.'][blank]" title="新窗口" value="1"'.($value['blank'] ? 'checked' :'').'>
                    </div>
                    <div class="layui-input-inline" style="width: auto;">
                        <button type="button" class="layui-btn layui-btn-sm layui-btn-danger layer-confirm" data-url="'.$href.'type=del&id='.$key.'">
                        <span>删除</span>
                        </button>
                    </div>
                </div>
			</div>';
		}
	}

    function config_img_like($array)
	{
		foreach ($array as $key => $value) {
			echo '<div class="layui-form-item arrange">
			';

			echo '
                    
                    <div class="layui-input-inline" style="width: 95px;">
                        <button type="button" class="layui-btn layui-upload">上传图片</button>
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][img]" placeholder="图片" class="layui-input upload-input" value="'.$value['img'].'">
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][title]" placeholder="标题" class="layui-input" value="'.$value['title'].'">
                    </div>
                    <div class="layui-input-inline">
                    <input type="text" name="data['.$key.'][type]" placeholder="模块参数" class="layui-input" value="'.$value['type'].'" style="padding:0;text-align:center;">
                </div>
                <div class="layui-input-inline">
                    <select name="data['.$key.'][by]">
                        <option value="">排序</option>';echo config_option('by',$value['by']);echo '
                    </select>
                </div>

                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][val]" placeholder="附加参数" class="layui-input" value="'.$value['val'].'">
                    </div>
                </div>';
		}
	}










    function config_hot_post()
	{
			echo '<div class="layui-form-item arrange">
                    <div class="id">
                        <div class="layui-input-inline" style="width: 20px;">
                            <input type="hidden" name="is" value="1">
                            <input type="checkbox" lay-skin="primary" name="is" value="1" checked>
                        </div>
                    </div>
                    <div class="type">
                        <div class="layui-input-inline" style="width: 95px;">
                            <button type="button" class="layui-btn layui-upload">上传图片</button>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="img" placeholder="图片" class="layui-input upload-input" value="">
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="title" placeholder="标题" class="layui-input" value="">
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="val" placeholder="参数" class="layui-input" value="">
                        </div>
                        <div class="layui-input-inline">
                            <select name="by">
                                <option value="">排序</option>';echo config_option('by',0);echo '
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="fval" placeholder="附加参数" class="layui-input" value="">
                        </div>
                    </div>
                    <div class="add">
                        <div class="layui-input-inline" style="width: auto;">
                            <button type="submit" class="layui-btn layui-btn-sm layui-btn-warm">
                            <span>增加</span>
                            </button>
                        </div>
                    </div>
			</div>';
		
	}






    function config_hot($array,$href)
	{
		foreach ($array as $key => $value) {
			echo '<div class="layui-form-item arrange">
                    <div class="id">
                        <div class="layui-input-inline" style="width: 20px;">
                            <input type="hidden" name="data['.$key.'][is]" value="0">
                            <input type="checkbox" lay-skin="primary" name="data['.$key.'][is]" value="1"'.($value['is'] ? 'checked' :'').'>
                        </div>
                    </div>
                    <div class="type">
                        <div class="layui-input-inline" style="width: 95px;">
                            <button type="button" class="layui-btn layui-upload">上传图片</button>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="data['.$key.'][img]" placeholder="图片" class="layui-input upload-input" value="'.$value['img'].'">
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="data['.$key.'][title]" placeholder="标题" class="layui-input" value="'.$value['title'].'">
                        </div>

                        <div class="layui-input-inline">
                            <input type="text" name="data['.$key.'][val]" placeholder="参数" class="layui-input" value="'.$value['val'].'">
                        </div>
                        <div class="layui-input-inline">
                            <select name="data['.$key.'][by]">
                                <option value="">排序</option>';echo config_option('by',$value['by']);echo '
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="data['.$key.'][fval]" placeholder="附加参数" class="layui-input" value="'.$value['fval'].'">
                        </div>
                    </div>
                    <div class="add">
                        <div class="layui-input-inline" style="width: auto;">
                            <button type="button" class="layui-btn layui-btn-sm layui-btn-danger layer-confirm" data-url="'.$href.'type=del&id='.$key.'">
                            <span>删除</span>
                            </button>
                        </div>
                    </div>
			    </div>';
		}
	}



	function config_module($array)
	{
		foreach ($array as $key => $value) {
			echo '<div class="layui-form-item arrange">
                    <div class="layui-input-inline" style="width: 95px;">
                        <button type="button" class="layui-btn layui-upload">上传图片</button>
                    </div>
                    <div class="type">
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][img]" placeholder="图片" class="layui-input upload-input" value="'.$value['img'].'">
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][title]" placeholder="标题" class="layui-input" value="'.$value['title'].'">
                    </div>
                    <div class="layui-input-inline">
                        <select name="data['.$key.'][type]">';echo config_option('url',$value['type']);echo '</select>
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][val]" placeholder="参数" class="layui-input" value="'.$value['val'].'">
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][fval]" placeholder="附加参数" class="layui-input" value="'.$value['fval'].'">
                    </div>
                    <div class="layui-input-inline" style="width: auto;">
                        <input type="hidden" name="data['.$key.'][blank]" value="0">
                        <input type="checkbox" lay-skin="primary" name="data['.$key.'][blank]" title="新窗口" value="1"'.($value['blank'] ? 'checked' :'').'>
                    </div>
                </div>
			</div>';
		}
	}
	function config_group($array)
	{
		foreach ($array as $key => $value) {
			echo '<div class="layui-form-item arrange">
                    <div class="type">
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][id]" placeholder="会员组id" class="layui-input" value="'.$value['id'].'">
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][title]" placeholder="会员组名称" class="layui-input" value="'.$value['title'].'">
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][long]" placeholder="会员组时长" class="layui-input" value="'.$value['long'].'">
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][val]" placeholder="会员组价格" class="layui-input" value="'.$value['val'].'">
                    </div>
                    <div class="layui-input-inline">
                        <input type="text" name="data['.$key.'][fval]" placeholder="附加参数" class="layui-input" value="'.$value['fval'].'" style="width:200px">
                    </div>
                </div>
			</div>';
		}
	}
	function config_input($val,$config)
	{
		$array = require('./input.php');
		foreach ($array[$val] as $k => $v) {
			echo '
			<div class="layui-form-item">
				<label class="layui-form-label color">'.$v[0].'</label>
					<div class="layui-input-inline w420">';
				if($v[1]=='textarea'){
					echo '<textarea name="'.$v[2].'" rows="2" placeholder="'.$v[5].'" class="layui-textarea">'.$config[$v[2]].'</textarea>';
					if($v[4]){
						echo '<div class="layui-form-mid layui-word-aux">'.$v[4].'</div>';
					}
				}else if($v[1]=='input'){
					echo '<input type="text" class="layui-input" placeholder="'.$v[5].'" value="'.$config[$v[2]].'" name="'.$v[2].'">';
					if($v[4]){
						echo '<div class="layui-form-mid layui-word-aux">'.$v[4].'</div>';
					}
				}else if($v[1]=='upload'){
					echo'<input type="text" class="layui-input upload-input" placeholder="'.$v[5].'" value="'.$config[$v[2]].'" name="'.$v[2].'">';
					if($config[$v[2]]){
						echo'<div class="layui-form-mid layui-word-aux upload">
							<img style="max-width: 220px;" src="'.$config[$v[2]].'" />
						</div>';
						
					}else{
						if($v[4]){
							echo '<div class="layui-form-mid layui-word-aux">'.$v[4].'</div>';
						}
					}
				}else if($v[1]=='color'){
					echo '
                    <div class="layui-input-inline" style="width: 60px;">
                        <label class="layui-form-label">'.$v[0].'</label>
					</div>
					<div class="layui-input-inline" style="width: 120px;">
						<input type="text" name="'.$v[2].'" value="'.$config[$v[2]].'" placeholder="'.$v[5].'" class="layui-input color-input">
					</div>
					<div class="layui-input-inline" style="left: -11px; width: 30px;">
						<div class="set-color"></div>
					</div>
					';
					if($v[4]){
						echo '<div class="layui-form-mid layui-word-aux">'.$v[4].'</div>';
					}
				}else if($v[1]=='checkbox'){
					echo '<input type="hidden" name="cody" value="0">';
					echo '<input type="checkbox" lay-skin="switch" placeholder="'.$v[5].'" name="'.$v[2].'" value="1"'.($config[$v[2]] ? 'checked':'').'>';
					if($v[4]){
						echo '<div class="layui-form-mid layui-word-aux">'.$v[4].'</div>';
					}
				}
			echo '</div>';
			if($v[3]){
			echo '
				<div class="layui-input-inline buttun">
					<input type="hidden" name="'.$v[2].'_is" value="0">
					<input type="checkbox" lay-skin="primary" title="启用" name="'.$v[2].'_is" value="1"'.($config[$v[2].'_is'] ? 'checked':'').'>
				</div>
			';
			}
			if($v[1]=='upload'){
			echo '
			<div class="layui-input-inline buttun" style="width: auto;">
				<button type="button" class="layui-btn layui-upload">上传图片</button>
			</div>
			';
			}
			echo '</div>';
		}
	}
?>