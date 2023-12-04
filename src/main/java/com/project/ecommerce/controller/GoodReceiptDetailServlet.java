package com.project.ecommerce.controller;

import com.project.ecommerce.dao.GoodReceiptDAO;
import com.project.ecommerce.model.Employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = "/goodReceiptDetailServlet")
public class GoodReceiptDetailServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dataButton= req.getParameter("dataButton");
		HttpSession  session= req.getSession();
		Employee employee= (Employee) session.getAttribute("employeeSession");
		int idEmployee= employee.getId();
		GoodReceiptDAO goodReceiptDAO= new GoodReceiptDAO();
		PrintWriter printWriter= resp.getWriter();
		switch (dataButton) {
		case "viewDetail":
			String goodReceiptID= req.getParameter("goodReceiptID");
			int a= Integer.parseInt(goodReceiptID);		
			session.setAttribute("cmbgoodReceipt", a);
			printWriter.print("success");
			resp.getWriter();
			break;

		default:
			break;
		}
	}
}
