<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery对ajax的封装</title>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
<script type="text/javascript" src="jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">
	/**
	$.ajax({
		url:'time.do',
		type:'get',
		success:function(res){
			
		},
		//用于传递到服务器的参数
		//如果是GET请求就通过url传递
		//如果是post请求就通过请求体传递
		data:{id:3,name:'张三',age:18}
	})
	*/
	
	
	
	$(document).ready(function(){
		$("#btn").click(function(){
			//发送ajax请求
			$.ajax({
				url:'package.do',
				type:'post',
				contentType: "application/x-www-form-urlencoded; charset=utf-8", 
				//用于设置响应体的类型，如下设置的话就会把服务端响应回来的json数据变成json对象
				dataType:'json',
				success:function(res){
					//alert(res)
					//console.log(res)
					alert(res.id)
					alert(res.name)
					alert(res.address)
				},
				//用于传递到服务器的参数
				//如果是GET请求就通过url传递
				//如果是post请求就通过请求体传递
				data:{id:3,name:'张三',age:18}
			})
		})
	})
</script>
</head>
<body>
	<button id="btn">点击发送ajax请求</button>
</body>
</html>