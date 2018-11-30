<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
	
	<script type="text/javascript">
		function login(){
			//发送ajax post请求完成登陆
			
			//获取用户名和密码
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			//1：创建ajax核心对象
			var xhr = null;
			if(window.XMLHttpRequest){
				xhr = new XMLHttpRequest();
			}else{
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			//2：注册回调函数
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						//接收服务器端响应回来的数据
						//假设服务器响应回来的是JSON数据
						//接收JSON {"success":true}或者{"success":false}
						var jsonString = xhr.responseText;    //这里的jsonString是一个普通的字符串
						//变成json对象
						eval("var jsonObj = "+jsonString);
						var tipMsg = document.getElementById("tipMsg");
						if(jsonObj.success){
							//登陆成功
							//跳转(可以跳转到action或者jsp页面)
							document.location ="success.jsp";
						}else{
							//提示错误信息
							tipMsg.innerHTML = "用户名不存在或者密码错误，请重新登录!";
						}
					}else{
						//alert(xhr.status);
					}
				}
			}
			
			//3：开启通道
			//true表示异步请求
			//如果是false的话，其他请求操作不能执行，相当于在提交这个ajax请求的过程中把浏览器锁住，只能同步请求
			//
			//那什么时候用异步和同步？
			//在一个表单中，有多个项目需要发送ajax请求进行验证的时候
			//必须等待所有表单项验证完后，才能进行下一步操作(如：点击注册按钮)
			//这时候就需要把验证的这个ajax请求设置为false，
			//否则，就可能会出现2个ajax请求一起执行的情况，这是不符合逻辑的
			//但大多数应用场景都是异步请求
			xhr.open("POST","userlogin.do",true);
			
			//4：发送请求
			//发送POSt请求必须使用表单form进行提交，只有form才能提交POST请求			
			//这句话是模拟表单提交，post请求必须有这一句
			//ajax post请求的乱码，需要在这里处理，注意：字符集需要和浏览器的字符集相同，需要和服务器当中的字符集相同
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;UTF-8");   // application/.....这一句可以通过在body中根据自动提示功能写出form表单的enctype属性，然后复制到这里
			xhr.send("username=" + username + "&password=" + password);  //post请求提交数据在send方法当中提交(请求体)
			
		}
	</script>

</head>
<body>
	<input type="button" value="点击我发送ajax请求">
	<!-- 标题字 -->
	<h1 align="center">用户登录</h1>
	<!-- 横线 -->
	<hr>
	<center>
		用户名&nbsp;&nbsp;&nbsp;&nbsp;
		<input id="username" type="text" name="username" size="40"><br><br>
		密&nbsp;&nbsp;码&nbsp;&nbsp;&nbsp;&nbsp;
		<input id="password" type="password" name="password" size="44"><br><br> 
		<input type="button" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" onclick="login();"> 
		<br><br>
		<span id="tipMsg" style="font-size:12px;color:red"></span>
	</center>

</body>
</html>