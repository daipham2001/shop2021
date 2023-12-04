package com.project.ecommerce.controller;

import com.project.ecommerce.dao.GoodReceiptDAO;
import com.project.ecommerce.dao.GoodReceiptDetailDAO;
import com.project.ecommerce.dao.ProductDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = "/productServlet")
public class ProductServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dataButton= req.getParameter("dataButton");
		PrintWriter printWriter= resp.getWriter();
		HttpSession session= req.getSession();
		ProductDAO productDAO= new ProductDAO();
		GoodReceiptDetailDAO goodReceiptDetailDAO= new GoodReceiptDetailDAO();
		GoodReceiptDAO goodReceiptDAO= new GoodReceiptDAO();
		switch (dataButton) {
		case "edit":
			String idProduct= req.getParameter("id");
			String name= req.getParameter("name");
			String priceString= req.getParameter("price");
			int price= Integer.parseInt(priceString);
			String description= req.getParameter("description");
			
			try {
				int i = productDAO.updateProduct(idProduct, price, name, description);
				if(i==0) {
					printWriter.print("success");
					resp.getWriter();
				}
				else if(i==2) {
					printWriter.print("fail");
					resp.getWriter();
				}
				else if(i==1) {
					printWriter.print("exist");
					resp.getWriter();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "newReceipt":
			String idProduct1= req.getParameter("idProduct");
			String nameProduct1= req.getParameter("nameProduct");
			String priceProduct1String= req.getParameter("priceProduct");
			String priceProductSell1String= req.getParameter("priceProductSell");
			String brandProduct1String= req.getParameter("brandProduct");
			String quantityProduct1String= req.getParameter("quantityProduct");
			String descriptionProduct1= req.getParameter("descriptionProduct");
			String imageProduct1= req.getParameter("imageProduct");
			String idGoodReceiptString= req.getParameter("idGoodReceipt");
			int idGoodReceipt= Integer.parseInt(idGoodReceiptString);
			int priceProductSell1= Integer.parseInt(priceProductSell1String);
			int brandProduct1= Integer.parseInt(brandProduct1String);
			int priceProduct1= Integer.parseInt(priceProduct1String);
			int quantityProduct1= Integer.parseInt(quantityProduct1String);
			try {
				int i= productDAO.insertProduct(idProduct1, nameProduct1, priceProductSell1, quantityProduct1, imageProduct1, descriptionProduct1, brandProduct1);
				if(i==1) {
					printWriter.print("existID");
					resp.getWriter();
				}
				if(i==2) {
					printWriter.print("existName");
					resp.getWriter();
				}
				if(i==3) {
					printWriter.print("fail");
					resp.getWriter();
				}
				if(i==0) {
					session.setAttribute("seri", quantityProduct1);
					session.setAttribute("seriProductID", idProduct1);
					if(goodReceiptDetailDAO.insertGoodReceiptDetail(idGoodReceipt,idProduct1, priceProduct1, quantityProduct1)==0) {
						int total= priceProduct1*quantityProduct1;
						if(goodReceiptDAO.updateGoodReceipt(idGoodReceipt, total)) {
							printWriter.print("success");
							resp.getWriter();
						}
					}
					else {
						
					}
				}
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "addReceipt":
			String idProduct2= req.getParameter("idProduct");
			String quantityString= req.getParameter("quantityProduct");
			String idGoodReceiptString2= req.getParameter("idGoodReceipt");
			String priceString2= req.getParameter("priceProduct");
			int priceProduct2= Integer.parseInt(priceString2);
			int idGoodReceipt2= Integer.parseInt(idGoodReceiptString2);
			int quantityProduct2= Integer.parseInt(quantityString);
			
			try {
				int i = productDAO.addOldProduct(idProduct2, quantityProduct2);
				if(i==1) {
					printWriter.print("fail");
					resp.getWriter();
				}
				else if(i==0) {
					session.setAttribute("seri", quantityProduct2);
					session.setAttribute("seriProductID", idProduct2);
					if(goodReceiptDetailDAO.insertGoodReceiptDetail(idGoodReceipt2,idProduct2, priceProduct2, quantityProduct2)==0){
						int total2= priceProduct2*quantityProduct2;
						if(goodReceiptDAO.updateGoodReceipt(idGoodReceipt2, total2)) {
							printWriter.print("success");
							resp.getWriter();
						}
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			break;
		case "delete":
			String idProduct3= req.getParameter("id");
			try {
				int i = productDAO.deleteProduct(idProduct3);
				if(i==0) {
					printWriter.print("success");
					resp.getWriter();
				}
				else if(i==2) {
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
