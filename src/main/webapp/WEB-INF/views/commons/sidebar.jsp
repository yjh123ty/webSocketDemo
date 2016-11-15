<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div id="mainTree" class="span3">
	</div>
	
	
<script type="text/javascript">

	var str = '';
	var url = _ctx + "/main/getUserMenuTree.do";
	
	$.get(url,function(data){
		console.debug(data);
		str += '<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">';
		str += '<li><a href="${ctx}/main/index.do"><i class="icon-chevron-right"></i>主页</a></li>';
		for(var i = 0; i < data.length; i++){
			str += "<li><a href="+_ctx + data[i].url +">"+
			"<i class='icon-chevron-right'></i>" + data[i].name + "</a></li>";
		}
		str += "</ul>";
		$("#mainTree").append(str);
	});
</script>