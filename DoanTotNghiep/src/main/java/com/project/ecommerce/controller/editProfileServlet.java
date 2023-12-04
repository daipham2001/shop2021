package com.project.ecommerce.controller;

import com.project.ecommerce.dao.CustomerDAO;
import com.project.ecommerce.dao.EmployeeDAO;
import com.project.ecommerce.tool.MD5;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/editProfileServlet")
public class editProfileServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO employeeDAO= new EmployeeDAO();
		CustomerDAO customerDAO= new CustomerDAO();
		PrintWriter printWriter= resp.getWriter();
		MD5 md5=new MD5();
		String dataButton= req.getParameter("dataButton");
		String idString= req.getParameter("id");
		int id = Integer.parseInt(idString);
		switch (dataButton) {
		case "editProfile":
			String name= req.getParameter("name");
			String phone= req.getParameter("phone");
			String address= req.getParameter("address");
			try {
				if(employeeDAO.UpdateProfile(name, phone, address,id)) {
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
		case "editProfileCustomer":
			String name1= req.getParameter("nameCustomer");
			String phone1= req.getParameter("phoneCustomer");
			String address1= req.getParameter("addressCustomer");
			try {
				if(employeeDAO.UpdateProfile(name1, phone1, address1,id)) {
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
		case "changePass":
			String oldPassString= req.getParameter("oldpass");
			String newPassString= req.getParameter("newpass");
			String oldPass= md5.mahoa(oldPassString);
			String newPass= md5.mahoa(newPassString);
			
			try {
				int i = employeeDAO.changePass(oldPass, newPass, id);
				if(i==1) {
					printWriter.print("wrong");
					resp.getWriter();
				}
				else if(i==0) {
					printWriter.print("success");
					resp.getWriter();
				}
				else if(i==2) {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			break;
		case "changePassCustomer":
			String oldPassString1= req.getParameter("oldpass");
			String newPassString1= req.getParameter("newpass");
			String oldPass1= md5.mahoa(oldPassString1);
			String newPass1= md5.mahoa(newPassString1);
			
			try {
				int i = employeeDAO.changePass(oldPass1, newPass1, id);
				if(i==1) {
					printWriter.print("wrong");
					resp.getWriter();
				}
				else if(i==0) {
					printWriter.print("success");
					resp.getWriter();
				}
				else if(i==2) {
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
