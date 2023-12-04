package com.project.ecommerce.controller;


import com.project.ecommerce.dao.GoodReceiptDetailDAO;
import com.project.ecommerce.dao.SeriDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/seriServlet")
public class SeriServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dataButton= req.getParameter("dataButton");
		PrintWriter printWriter=resp.getWriter();
		SeriDAO seriDAO= new SeriDAO();
		GoodReceiptDetailDAO goodReceiptDetailDAO= new GoodReceiptDetailDAO();
		HttpSession session= req.getSession();
		switch (dataButton) {
		case "add":
			String seri= req.getParameter("seriID");
			String seriProductID= req.getParameter("seriProductID");
			
			try {
				int a = goodReceiptDetailDAO.getIDgoodReceiptDetal();
				int i = seriDAO.insertSeri(seri, seriProductID,a);
				if(i==0) {
					printWriter.print("success");
					resp.getWriter();
				}
				else if(i==1) {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "viewSeri":
			String idProduct= req.getParameter("id");
			session.setAttribute("idProductSeri", idProduct);
			printWriter.print("success");
			resp.getWriter();
			
			break;
		default:
			break;
		}
		
		
	}
}
