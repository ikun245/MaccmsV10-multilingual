layui.use(['form','slider','carousel','upload','laydate'], function(){
    var form = layui.form ,
    slider =  layui.slider,
    carousel = layui.carousel,
    upload = layui.upload,
    laydate = layui.laydate,
    element = layui.element,
    table = layui.table,
    colorpicker = layui.colorpicker;
    form.on('switch(submit)', function(data){
      $(this).parents("form").submit();
    });
    form.on('primary(submit)', function(data){
      $(this).parents("form").submit();
    });
    form.on('select(filter)', function(data){
      var input = $(data.elem).parent().parent().find('.value');
      $(input).val(data.value);
    });
    form.on('select(filter2)', function(data){
      var input = $(data.elem).parent().parent().find('.value');
      var inputname = $(input).attr('data-name');
      $(input).attr('name',inputname+'['+data.value+']');
    });
    form.on('select(filter3)', function(data){
      var input = $(data.elem).parent().parent().find('.value');
      $(input).attr('name',data.value);
    });
    $('.slider').each(function (){
      let $input = parseInt($(this).parent().find('input').attr('value'));
      let $min = parseInt($(this).attr('data-min'));
      let $max = parseInt($(this).attr('data-max'));
      let $e = $(this);
      slider.render({
        elem: this
        ,input: true
        ,value: $input||$min
        ,min: $min
        ,max: $max
        ,change: function(value){
          $e.parent().find('input').attr('value',value);
        }
      });
    });  
    $('.slider2').each(function (){
      let $input = parseInt($(this).parent().find('input').attr('value'));
      let $min = parseInt($(this).attr('data-min'));
      let $max = parseInt($(this).attr('data-max'));
      let $height = parseInt($(this).attr('data-height'));
      let $e = $(this);
      slider.render({
        elem: this
        ,type: 'vertical'
        ,height: $height
        ,input: false
        ,value: $input||$min
        ,min: $min
        ,max: $max
        ,change: function(value){
          $e.parent().find('input').attr('value',value);
        }
      });
    }); 
    var path = window.parent.ADMIN_PATH;
    if(path){
      upload.render({
        elem: '.layui-upload'
        ,url: path+'/admin/upload/upload.html?flag=site'
        ,method: 'post'
        , exts: 'jpg|png|gif|bmp|jpeg|ico'
        ,done: function(res, index, upload) {
          let $obj = this.item;
          object = $($obj).parent().parent().find('.upload-input');
          objectimg = $($obj).parent().parent().find('.layui-word-aux');
          object.attr("value", "/"+res.data.file);
          objectimg.html('<img style="max-width: 220px;" src="/'+res.data.file+'" />');
        }
      });
    }else{
      $(".layui-upload").click(function() {
          layer.msg('请通过CMS后台菜单入口访问再上传', {time:3000});
      });
    }
    carousel.render({
      elem: '#slide'
      ,autoplay: false
      ,anim: 'fade'
      ,width: '100%'
      ,height: '400px'
      ,arrow: 'always'
      ,indicator: 'outside'
    });
    laydate.render({
      elem: '#laydate'
    });
    $('.set-color').each(function (){
      let $input = $(this).parent().parent().find('input').attr('value');
      let $e = $(this);
      colorpicker.render({
        elem: this
        ,color: $input
        ,done: function(color){
          $e.parent().parent().find('input').attr('value',color);
        }
      });
    });
});

$(function(){
  console.log("首涂主题官方原创作品，唯一官方地址shoutu.cn，作者：王多于(qq2686114666)\n，支持正版，勿传播倒卖正版资源，谢谢！");
  $(".layui-addval").click(function() {
    let val = $(this).parent().parent().find('input,textarea').val();
    let newval = $(this).attr('data-val');
    $(this).parent().parent().find('input,textarea').val(val+newval);
  });
  $(".layer-confirm").click(function() {
    let url = $(this).attr('data-url');
    let msg = $(this).attr('data-msg');
    msg=msg||'确认需要删除吗？该操作不可撤销哦';
    layer.confirm(msg, {
      btn: ['确认','取消'],
    }, function(){
      location.href=url;
    }, function(){
      layer.closeAll('confirm');
    });
  });
  $(".layer-edit").click(function() {
    let id = $(this).attr('data-id');
    let array = $(this).attr('data-array');
    let type = $(this).attr('data-type');
    layer.open({
      type: 2,
      title: '模块设置',
      shadeClose: true,
      shade: 0.8,
      area: ['380px', '60%'],
      content: '?url=block&array='+array+'&operate='+type+'&id='+id,
    });
  });
  $(".addition-val").click(function() {
      let selectval = $(this).parent().parent().find("select").find("option:selected").val();
      $(this).parent().parent().clone(true).appendTo(".addition-copy").find("select").find("option[value='"+selectval+"']").attr("selected","selected");
      $(this).parent().parent().find("input").val("");
      $(this).parent().parent().find("select").find("option:selected").removeAttr("selected");
      layui.form.render();
  });
  $(".addition-del").click(function() {
      $(this).parent().parent().remove();
  });
  var mySwiper = new Swiper('.swiper', {
    autoHeight: true,
    effect: 'fade',
    fadeEffect: {
      crossFade: true,
    },
    pagination: {
      el: '.lef-page',
      type: 'fraction',
      renderFraction: function (currentClass, totalClass) {
        return '<span class="' + currentClass + '"></span>' + ' / ' + '<span class="' + totalClass + '"></span>';
      },
    },
    navigation: {
      nextEl: ".right-next,.swiper-button-next",
      prevEl: ".left-prev,.swiper-button-prev",
    },
  });
});
