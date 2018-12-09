<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>解决ajax跨域请求问题</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	img {
		display:block;
		margin:30px auto;
		width:260px;
	}
	#span {
		display:block;
		margin: auto;
		text-align: center;
		
	}
	#text {
		width: 550px;
		height: 30px;
		margin-bottom:0px;
		text-indent:10px;    /*首行缩进*/
	}
	#btn {
		width: 100px;
		height: 34px;
		border: 0px;
		margin-left: 0px;
		margin-bottom:0px;
		color: white;
		background: #3385ff;
	}
	#show {
		display:none;
		width:552px;
		/*margin:auto;*/
		margin-left: 354px;
		border:1px solid #000;
		border-top:0px;      /*去掉上边框的值*/
	}
	#show ul li {
		list-style:none;     /*去除li标签前面的小黑点*/
		line-height:30px;
		text-indent:10px;    /*首行缩进*/
	}
	#show ul li:hover {
		background:gray;
		color:#fff;
	}
</style>


</head>
<body>
	<!-- 模拟百度搜索的功能 -->
	
	<img src="img/bd_logo1.png" alt="百度login">
	<span id="span">
		<!-- 
			1：当松开按键时调用myjsonp()函数显示关键字相关选项 
			2：当获取焦点时调用myjsonp()函数显示相关选项，这个的主要功能是当搜索并显示一个选项内容之后再回退到搜索主页面，之前的关键字还继续显示着，
				当获取焦点时，又重新调取myjsonp函数就行进行搜索。如果没有这个功能，当回退后获取焦点时就不会有重新搜索的功能，体验不好
			3：当失去焦点时，下面的显示相关选项的show块就隐藏      onblur="hide()"     
				但是这个功能和前面2个功能冲突，因为前面2个功能中，当点击一个<li>标签选项的时候，本来应该跳转，但是这时候本身就会失去焦点，和onblur事件冲突，就不能成功跳转
		-->
		<input type="text" id="text" onkeyup="myjsonp()" onfocus="myjsonp()" />     
		<button id="btn">百度一下</button>
	</span>
	
	<!-- 下面的div块用于显示按照关键字查询出来的待选项 -->
	<div id="show">
		<ul>
			<li>jnsugb</li>
			<li>jnsdavsdgb</li>
			<li>jsdvnsugavsb</li>
			<li>jnsuscasgb</li>
			<li>jnsugwerwqerweb</li>
			<li>j2423nsugb</li>
			<li>jnssdvwrugb</li>
		</ul>
	</div>
	
	
	
	
	<!-- 
		注意：这里的js代码要放在body之后，否则会出现Uncaught TypeError: Cannot set property 'onkeyup' of null的错误，
		页面无法加载完毕执行代码
	 -->
	<script type="text/javascript">
		//用户输入内容，从后台获取关键字补全的数据，然后在页面中展示
		
		//通过id名获取元素
		var oSpan = document.getElementById("span");
		var oText = document.getElementById("text");
		var oUl = document.querySelector("#show ul");
		var oShow = document.getElementById("show");
		var oBtn = document.getElementById("btn");
		
		
		//获取文本框的内容
		var val = oText.value;     //this表示之执行当前事件的对象，即oText
		
		//给百度一下按钮添加一个点击事件
		oBtn.addEventListener("click",function(){
			jump2(val);
		})
		
		
		//给文本输入框添加一个回车事件监听器
		
		oSpan.addEventListener("keyup",function(event){
			if (event.keyCode == "13") {
				jump2(val);
			}
		});
		
		
		//oText.onkeyup = function(){
		function myjsonp(){
			
			val = oText.value;     //this表示之执行当前事件的对象，即oText
		
			//jsonp跨域请求
			//通过document生成节点
			var oScript = document.createElement("script");
			oScript.src = "https://sp0.baidu.com/5a1Fazu8AA54nxGko9WTAnF6hhy/su?wd="+val+"&cb=xiaolong";
			document.body.appendChild(oScript);
		}
		
		function xiaolong(arg){
			var data = arg.s;      //保存从后台获取的数据
			oUl.innerHTML = "";    //输入框中的数据每次增加输入或者删除时都先把ul中的值都清空
			if(data.length){
				oShow.style.display = "block";
				
				//遍历获取到的data数据
				data.forEach(function(el){
					var oLi = document.createElement("li");
					oLi.innerText = el;
					
					oUl.appendChild(oLi);
					
					/*
					*/
					oLi.onclick = function(){
						window.location.href = "https://www.baidu.com/s?wd="+el
				    }
					console.log("5");
					
					//oLi.addEventListener("click",jump1(el));      //给li标签添加点击事件监听
					
					
				})
				
			}
			else{
				oShow.style.display = "none";     //如果没有获取到数据就隐藏show的div块
			}
		}
		
		
		function jump1(el){
			this.el = el;
			window.location.href = "https://www.baidu.com/s?wd="+el;					
		}
		
		
		
		function jump2(val){
			window.location.href = "https://www.baidu.com/s?wd="+val;					
		}
		
		function hide(){
			oShow.style.display = "none";			
		}
	</script>	
	
</body>
</html>