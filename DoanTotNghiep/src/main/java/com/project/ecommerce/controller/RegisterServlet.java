package com.project.ecommerce.controller;

import com.project.ecommerce.dao.RegisterDAO;
import com.project.ecommerce.tool.MailExist;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
;

@WebServlet(urlPatterns = "/registerServlet")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		PrintWriter printWriter = resp.getWriter();
		RegisterDAO registerDAO = new RegisterDAO();
		MailExist mailExist = new MailExist();
//		if (mailExist.isAddressValid(email)) {
			int check;
			try {
				check = registerDAO.insertAccount(email, name, pass);
				if (check == 1) {
					printWriter.print("email_trung");
					resp.getWriter();

				}
				if (check == 2) {
					printWriter.print("wrong");
					resp.getWriter();
				}
				if (check == 0) {
					printWriter.print("success");
					resp.getWriter();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
//		} else {
//			printWriter.print("noExist");
//			resp.getWriter();
//		}
	}

		
		


}
