package com.project.ecommerce.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.ecommerce.dao.LoginAdminDAO;
import com.project.ecommerce.model.Employee;
import com.project.ecommerce.model.EmployeeSession;

@WebServlet(urlPatterns = "/loginAdminServlet")
public class LoginAdminServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emaillogin = request.getParameter("email");
		String passwordlogin = request.getParameter("pass");
		PrintWriter printWriter=response.getWriter();
		LoginAdminDAO loginAdminDAO= new LoginAdminDAO();
				try {
					if(loginAdminDAO.checkLogin(emaillogin, passwordlogin)==1) {
							printWriter.print("wrong");
							response.getWriter();
					}
					else if(loginAdminDAO.checkLogin(emaillogin, passwordlogin)==0) {
				
				  HttpSession session= request.getSession(); 
				  EmployeeSession employeeSession=null;
				  session.setAttribute("employeeSession", new Employee(EmployeeSession.id,EmployeeSession.name,EmployeeSession.phone,EmployeeSession.email,EmployeeSession.address,EmployeeSession.role));
				  printWriter.print("success");
				  response.getWriter();
							
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}

}
