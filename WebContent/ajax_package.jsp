<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>封装原生ajax</title>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
<script type="text/javascript">
	
	//===================封装者====================================
	
	/**
		封装的过程
		1：写一个相对完整的用例
		2：写一个空函数，没有形参，将刚刚的	用例作为函数的函数体
		3：根据使用过程中的需求抽象参数
	*/
	
	function ajax (method,url,params,done){
		//先把method可能是小写的字母都转换成大写统一在下面比较
		method = method.toUpperCase()
		
		var xhr = new XMLHttpRequest()
		
		
		
		//如果传递的参数是json对象格式，就把json对象格式转换成'key1=value1&key2=value2'字符串格式
		//当然：如果传递的参数params直接是一个json字符串格式，就不用走经过这里处理
		if(typeof params == 'object'){
			var tempArr = []
			for(var key in params){
				var value = params[key]
				tempArr.push(key + '=' +value)
			}
			
			//这时候已经把json兑现转换成如下格式的json串了   tempArr ==>  ['key=value1','key2=value2'] 
			//想要把json串用&符号进行连接  如： params ==> 'key1=value1&key2=value2'
			params = tempArr.join('&')
		}
		
		
		
		if(method == "GET"){
			url += '?'+params
		}
		xhr.open(method,url,true)

		
		var data = null
		if(method == 'POST'){
			xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded')
			data = params
		}
		
		xhr.onreadystatechange = function (){
			if(this.readyState != 4) return 
			//不因该在封装的函数中主观地处理响应结果
			//console.log(this.responseText)
			//无法在内部包含的函数中通过return的方式给外部函数的调用返回结果
			//return this responseText
			//由于异步模式下 这里的代码最后执行 所以不可能在外部通过返回值的方式返回数据
			//应该如下处理，done是调用者传递的函数类型的参数
			done(this.responseText)
		}
		
		
		//如果是get请求，则data为空；如果是post请求，data中有数据
		xhr.send(data)
	}
	
	
	
	//==========================调用者===============================
	
	var onDone = function(res){
		console.log("hellos")
		console.log(res)
		console.log('jquery')
	}
	
    //传递的是一个字符串
	//ajax('GET','time.do','id=1')  
	//ajax('POST','add.do','key1=value1&key2=value2')
	
	//传递一个json对象
	//ajax('GET','time.do',{id:1})
	//ajax('POST','add.do',{key1:'value1',key2:'value2'})     //json串的值可以直接是获取到的表单元素的值，如获取到id值为username的对象，则{"name":username.value}
    
    //上面的调用方式不能指定封装者做指定的事,通过给封装者传递一个函数参数来指定封装者做想做的事
    //ajax('GET','time.do',{id:1},onDone)
	//ajax('POST','add.do',{key1:'value1',key2:'value2'},done)     //json串的值可以直接是获取到的表单元素的值，如获取到id值为username的对象，则{"name":username.value}
	
</script>

</head>
<body>

	<button onclick="ajax('GET','time.do',{id:1,name:'jchonker'},onDone)">点击触发ajax事件</button>

</body>
</html>