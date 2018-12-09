package com.bjpowernode.ajax.web.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckUsernameAction extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//获取用户名
		String username = request.getParameter("username");
		
		//连接数据库验证用户名是否存在
		if("admin".equals(username)) {
			//用户名不可用
			out.print("<font color='red'>用户名已注册</font>");
		}else if("".equals(username)){
			//用户名为空时
			//这里的主要作用是：当清空用户名输入框时，提示信息也会清空
			//如果没有进行这样处理，当清空输入框的信息时，原来的相应提示信息不会清空，体验不好
			out.println("");
		}else {
			//用户名可用
			out.println("<font color='green'>用户名可用</font>");
		}
		
		//响应信息给浏览器
	}
}
