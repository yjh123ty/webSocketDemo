<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CLodop打印示例</title>
<!-- 打印插件 -->
<script src='http://192.168.0.110:8000/CLodopfuncs.js'></script>
<script type="text/javascript" src="resources/jquery.js"></script>
<script type="text/javascript" src="resources/LodopFuncs.js"></script>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
       <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
</head>
<body>
xxxxxxxxx




<script language="javascript" type="text/javascript">    
	var LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));
	
	 LODOP.PRINT_INIT("打印任务名"); 
	 LODOP.ADD_PRINT_TEXT(0,0,100,20,"文本内容一");
	 LODOP.PREVIEW();
	 LODOP.PRINT();                               
	 console.debug(LODOP);
</script> 
</body>
</html>