
<script>
	$(".layui-nav li a").each(function() {
		if(this.href==document.location.toString().split("#")[0]){$(this).parent("li").addClass("layui-this");return false;}
	});
	$('.arrange').arrangeable();
</script>