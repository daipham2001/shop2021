package com.project.ecommerce.controller;

import com.project.ecommerce.dao.OrderDAO;
import com.project.ecommerce.model.Employee;
import com.project.ecommerce.tool.Mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(urlPatterns = "/orderAdminServlet")
public class OrderAdminServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idOrderString=req.getParameter("idOrder");
		HttpSession session= req.getSession();
		Employee user = (Employee) session.getAttribute("employeeSession");
		int adminID= user.getId();
		int idOrder= Integer.parseInt(idOrderString);
		String dataButtonString= req.getParameter("dataButton");
		PrintWriter printWriter= resp.getWriter();
		OrderDAO orderDAO = new OrderDAO();
		switch (dataButtonString) {
		case "shipper":
			String idShipperString= req.getParameter("idShipper");
			int shipperID= Integer.parseInt(idShipperString);
			String emaiString=req.getParameter("email");
			
			try {
				if (orderDAO.updateShipperOrder(adminID, shipperID, idOrder)) {
					Mail.sendMail(emaiString, "Delivery", Mail.messageDelivery());
					printWriter.print("success");
					resp.getWriter();
				}
				else {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "complete":
			try {
				if(orderDAO.updateOrderComplete(idOrder)) {
					printWriter.print("success");
					resp.getWriter();
				}
				else {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		default:
			break;
		}
		
	}

}
