<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ajax的get请求</title>
	<!-- http://localhost:8080/ajax-get -->
	<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
<script type="text/javascript">
	function checkUsername(username){
	
		//发送请求，验证用户名是否可用
		//发送ajax请求的代码包括4步，这4步是固定的
		//比传统请求麻烦一些
		//ajax发送请求全靠浏览器内置的XMLHttpRequest对象
		//使用这个对象可以在浏览器中单独启动一个新的浏览器线程，通过浏览器线程发送请求
		//达到异步的效果
		
		//1：创建ajax核心对象XMLHttpRequest对象（浏览器内置的，可以直接使用）
		//如果浏览器支持这个对象
		if(window.XMLHttpRequest){
			var xhr = new XMLHttpRequest(); 
		}else{
			//不支持XMLHttpRequest,IE5和IE6不支持，它们只支持ActiveXObject对象
			var xhr = new ActiveXObject("Microsoft.XMLHttp");
		}
		//alert(xhr);
		
		//2：注册回调函数
		//程序执行到这里的时候，这里的回调函数并不会执行，只是将回调函数注册给xhr对象
		//等xhr对象的readyState发生变化的时候，后面的回调函数会执行
		/**
			XMLHttpRequest对象在请求和响应的过程中，该对象的readyState状态从0-4:
				0：请求初始化
				1：服务器连接已建立
				2：请求已接收
				3：请求处理中
				4：请求已完成，且响应已就绪
				
			xhr.readystate == 0
			xhr.readystate == 1
			xhr.readystate == 2
			xhr.readystate == 3
			xhr.readystate == 4
			
		*/
		xhr.onreadystatechange = function(){     //当xhr对象的readystate的值发生变化的时候，回调一次，可以发生若干次
			if(xhr.readyState == 4){   //服务器响应结束
				//404错误
				//500错误
				
				//status表示服务器状态
				if(xhr.status == 200){   //200表示服务器正常相应结束
					//在浏览器中使用xhr对象接收服务器响应回来的文本（字符串形式）
					//var s = xhr.responseText;
				    //alert(s);
				    
				    var nameTipMsg = document.getElementById("nameTipMsg");
				    nameTipMsg.innerHTML = xhr.responseText;
				}else{
					//弹出错误代码(xhr.status属性可以获取到HTTP的响应状态码)
					alert(xhr.status);
				}
			}
		}
		
		
		//3：开启浏览器和服务器之间的通道
		/**
			method:指定请求方式为post还是get
			url：请求路径
			asyn:true / false (true代表支持异步，false代表支持同步)，目前我们统一写成true
		*/
		//xhr.open(method,url,asyn)
		//前面配置了base标签，原来的请求路径: "/ajax_get/checkusername.do?username="+username就可以变成下面的路径
		//xhr.open("GET","checkusername.do?username="+username,true);    //这里只开启通道，不发送请求
		var timestamp = new Date().getTime();
		xhr.open("GET","checkusername.do?T="+timestamp+"&username="+username,true);
		
		
		//4：发送ajax请求
		xhr.send();   //这里才会发送
		
			
	}
	
	
	
	
	
	/**
		解决ajax get请求缓存问题：
		
		在使用ajax get时有一个情况：
		比如发送http://localhost:8080/AjaxTest/checkusername?username=abc请求，
		第一次肯定要请求到后台服务器，获得结果，并把这个请求的结果存在浏览器中
		但是第二次再请求的时候，就不会向服务器发送这个请求了，而是直接从浏览器中获得这个请求的结果，减轻服务器压力
		后面的相同请求都不会发送，所以这就出现了浏览器缓存问题
		
		这时候可以再请求参数中加入一个时间戳解决这个问题，加入时间戳后，则每次请求都不相同，就不会有缓存，如下：
		xhr.open("GET","checkusername.do?T="+timestamp+"&username="+username,true);
	*/
	
	
	
</script>

</head>
<body>
	<!-- oninput:此事件会在value属性值发生改变时触发 -->
	用户名:<input id="username" type="text" name="username" onblur="checkUsername(this.value);"><span id="nameTipMsg" style="font-size: 12px"></span> 
	<br>
	密码:<input type="password" name="password">
	<br>
</body>
</html>