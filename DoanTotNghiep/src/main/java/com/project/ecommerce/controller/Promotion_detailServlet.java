package com.project.ecommerce.controller;

import com.project.ecommerce.dao.Promotion_detailDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(urlPatterns = "/promotionDetailServlet")
public class Promotion_detailServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dataButton = req.getParameter("dataButton");
		PrintWriter printWriter= resp.getWriter();
		HttpSession session= req.getSession();	
		Promotion_detailDAO promotion_detailDAO= new Promotion_detailDAO();
		switch (dataButton) {
		case "viewDetail":
			String promotionID= req.getParameter("promotionID");
			int a= Integer.parseInt(promotionID);		
			session.setAttribute("cmbPromotion", a);
			printWriter.print("success");
			resp.getWriter();
			break;
			
		case "edit":
			String idProduct= req.getParameter("idProduct");
			String idPromotionString= req.getParameter("idPromotion");
			int idPromotion= Integer.parseInt(idPromotionString);
			String percent_promotionString = req.getParameter("perent_promotion");
			int percent_promotion= Integer.parseInt(percent_promotionString);
			try {
				if(promotion_detailDAO.updatePromotion_detail(idProduct, idPromotion, percent_promotion)) {
					printWriter.print("success");
					resp.getWriter();
				}else {
					printWriter.print("fail");
					resp.getWriter();
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "delete":
			String idProduct1= req.getParameter("idProduct");
			String idPromotionString1= req.getParameter("idPromotion");
			int idPromotion1= Integer.parseInt(idPromotionString1);
			
			try {
				if(promotion_detailDAO.deletePromotion_detail(idProduct1,idPromotion1)) {
					printWriter.print("success");
					resp.getWriter();
				}else {
					printWriter.print("fail");
					resp.getWriter();
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "add":
			String idProduct2= req.getParameter("idProduct");
			String idPromotionString2= req.getParameter("idPromotion");
			String percent_promotionString2= req.getParameter("percent_promotion");
			int idPromotion2= Integer.parseInt(idPromotionString2);
			int percent_prommotion2= Integer.parseInt(percent_promotionString2);
			try {
				int i = promotion_detailDAO.insertProductToPromotionDetail(idProduct2, percent_prommotion2, idPromotion2);
				if(i==1) {
					printWriter.print("exits");
					resp.getWriter();
				}
				else if(i==0) {
					printWriter.print("success");
					resp.getWriter();
				}
				else if (i==2) {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
		
	}
}
