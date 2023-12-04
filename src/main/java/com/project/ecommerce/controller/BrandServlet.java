package com.project.ecommerce.controller;


import com.project.ecommerce.dao.BrandDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet(urlPatterns = "/brandServlet")
public class BrandServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BrandDAO brandDAO= new BrandDAO();
		String dataButton = req.getParameter(("dataButton"));
		
		PrintWriter printWriter = resp.getWriter();
		try {
			 if (dataButton.equals("add")) {
					String name = req.getParameter(("name"));		
					String idCateString= req.getParameter("idCate");
					int idCate= Integer.parseInt(idCateString);
					int i = brandDAO.insertBrand(name, idCate);

				if (i==0) {
					printWriter.print("success");
					resp.getWriter();
					
				} else if(i==1) {
					printWriter.print("exist");
					resp.getWriter();
				}
				else if(i==2) { 
					 printWriter.print("fail"); 
					 resp.getWriter(); 
			 } 
			} 
				 else if (dataButton.equals("delete")) { 
					 String id = req.getParameter(("id"));
					 int idBrand = Integer.parseInt(id);
					 int i = brandDAO.deleteBrand(idBrand);
					 if (i==0) 
					 { printWriter.print("success");
					 	resp.getWriter(); } 
					 else if(i==2) { 
						 printWriter.print("fail"); 
						 resp.getWriter(); 
					 }
					
				 }
				 
				 else if (dataButton.equals("edit")) {
					 String id = req.getParameter(("id"));
					 int idBrand = Integer.parseInt(id);
					 String idCateString= req.getParameter("idCate");
					 int idCate= Integer.parseInt(idCateString);
					 String name = req.getParameter(("name"));
					 int i = brandDAO.editBrand(idBrand,name,idCate);
						if (i==0) {
							printWriter.print("success");
							resp.getWriter();
							
						} else if(i==1) {
							printWriter.print("exist");
							resp.getWriter();
						}
						else if(i==2) { 
							 printWriter.print("fail"); 
							 resp.getWriter(); 
					 }
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
