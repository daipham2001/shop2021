package com.project.ecommerce.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.ecommerce.tool.CookieService;

@WebServlet(urlPatterns = "/ShopSmartPhone")
public class HomeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CookieService cookieService = new CookieService(req, resp);
		String[] tk_mkStrings = cookieService.getValues("user");
		if(tk_mkStrings.length >= 2) {
		req.setAttribute("email_rm", tk_mkStrings[0]);
		req.setAttribute("pass_rm", tk_mkStrings[1]);
		}
	 
		resp.sendRedirect("Views/Home.jsp");
	}

}
