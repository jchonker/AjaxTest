package com.bjpowernode.ajax.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

public class AjaxPakageByJquery extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//=================接收ajax的json参数===========================
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		//name = new String(name.getBytes("iso-8859-1"),"utf-8");     //如果是get请求，把中文的编码改为utf-8，否则会有乱码；如果是post请求则不需要这么设置
		String age = request.getParameter("age");
		System.out.println("id="+id);
		System.out.println("name="+name);
		System.out.println("age="+age);
		
		
		
		
		//=========================响应的数据（json）====================================
		
		//创建一个json对象，JsonObject类在Gson的jar包里
		JsonObject json = new JsonObject();
		json.addProperty("id", 100);
		json.addProperty("name", "李四");
		json.addProperty("address", "北京");	
		
		//为了解决输出json数据是问号的问题，所以要设置response的type和encording
		response.setContentType("application/json;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter writer = response.getWriter();
		writer.println(json);
	}
}
