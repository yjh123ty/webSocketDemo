<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>打印示例</title>

<script language="javascript"> 
	function printdiv(printpage) 
	{ 
	var headstr = "<html><head><title></title></head><body>"; 
	var footstr = "</body>"; 
	var newstr = document.all.item(printpage).innerHTML; 
	var oldstr = document.body.innerHTML; 
	document.body.innerHTML = headstr+newstr+footstr; 
	window.print(); 
	document.body.innerHTML = oldstr; 
	return false; 
	} 
	
	function printDiv(){
		window.print(); 
	}
</script> 
</head>

<body> 
	这里是不需要打印的内容
	<input name="b_print" type="button" class="ipt" onClick="printdiv('div_print');" value=" Print "> 
	 
	<div id="div_print"> 
	 
	<h1 style="Color:Red">打印这里的内容</h1> 
	 
	</div> 
	这里是不需要打印的内容 
	
	<hr/>
	
	打印二
	<input type="button" onClick="printDiv();" value=" 打印 ">
</body>

</html>