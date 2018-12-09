package com.bjpowernode.ajax.web.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserLoginAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	/**
	 * 这里要注意：因为前端是用的ajax post请求，所以这里要使用doPost方法
	 * 如果是用的doGet方法，会报405 (Method Not Allowed)错误
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		StringBuilder json = new StringBuilder();
		//模拟连接数据库验证用户名和密码
		if("admin".equals(username)&&"123456".equals(password)) {
			//登陆成功
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			
			json.append("{\"success\":true}");
		}else {
			//登陆失败
			json.append("{\"success\":false}");
			
		}
		//响应JSON
		response.setContentType("text/html;Charset=UTF-8");
		response.getWriter().print(json);
		
		
	}
	

}
