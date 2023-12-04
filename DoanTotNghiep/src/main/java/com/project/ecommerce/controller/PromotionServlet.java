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


import com.project.ecommerce.dao.PromotionDAO;
import com.project.ecommerce.model.Employee;

@WebServlet(urlPatterns = "/promotionServlet")
public class PromotionServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dataButton= req.getParameter("dataButton");
		HttpSession session= req.getSession();
		Employee employee= (Employee) session.getAttribute("employeeSession");
		int idEmployee= employee.getId();
		PromotionDAO promotionDAO= new PromotionDAO();
		PrintWriter printWriter= resp.getWriter();
		switch (dataButton) {
		case "add":
			try {
				String dateStart=req.getParameter("dateStart");
				String dateEnd= req.getParameter("dateEnd");
				String reason= req.getParameter("reason");

				promotionDAO.insertPromotion(dateStart, dateEnd, idEmployee, reason);
				printWriter.print("success");
				resp.getWriter();
				
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "edit":
			String idString= req.getParameter("id");
			int id= Integer.parseInt(idString);
			try {
				String dateStart=req.getParameter("dateStart");
				String dateEnd= req.getParameter("dateEnd");

				promotionDAO.updatePromotion(dateStart, dateEnd, idEmployee, id);
				printWriter.print("success");
				resp.getWriter();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			break;
		case "deletePromotion":
			String idPromotionString= req.getParameter("idPromotion");
			int idPromotion= Integer.parseInt(idPromotionString);
			try {
				if(promotionDAO.deletePromotion(idPromotion)) {
					printWriter.print("success");
					resp.getWriter();
				} else {
					printWriter.print("fail");
					resp.getWriter();
				}
				
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	break;
		default:
			break;
		}
		
	}

}
