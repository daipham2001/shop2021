package com.project.ecommerce.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.project.ecommerce.dao.CustomerDAO;
import com.project.ecommerce.dao.EmployeeDAO;
import com.project.ecommerce.tool.MD5;
import com.project.ecommerce.tool.Mail;

@WebServlet(urlPatterns = {"/forgotPasswordServlet"})
public class ForgotPasswordServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO employeeDAO= new EmployeeDAO();
		CustomerDAO customerDAO= new CustomerDAO();
		String email= req.getParameter("email");
		String dataButton= req.getParameter("dataButton");
		PrintWriter printWriter=resp.getWriter();

		MD5 md5= new MD5();
		switch (dataButton) {
		case "changePass":
			String pass= req.getParameter("pass");
			String newPass= md5.mahoa(pass);
			try {
				if(employeeDAO.changePasswordForgot(email, newPass)) {
					printWriter.print("success");
					resp.getWriter();
				}
				else {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;
		case "changePassCustomer":
			String passCustomer= req.getParameter("pass");
			String newPassCustomer= md5.mahoa(passCustomer);
			try {
				if(employeeDAO.changePasswordForgot(email, newPassCustomer)) {
					printWriter.print("success");
					resp.getWriter();
				}
				else {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			break;
		 case "forgotPass":
			
			try {
				if (employeeDAO.checkEmailExits(email)) {
					Mail.sendMail(email, "Change PassWord", Mail.messageForgot(email));
					printWriter.print("success");
					resp.getWriter();
				}
				else {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
			case "forgotPassCustomer":			
			try {
				if (employeeDAO.checkEmailExits(email)) {
					Mail.sendMail(email, "Change PassWord", Mail.messageForgotForCustomer(email));
					printWriter.print("success");
					resp.getWriter();
				}
				else {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;

		default:
			break;
		}
	
	}
}
