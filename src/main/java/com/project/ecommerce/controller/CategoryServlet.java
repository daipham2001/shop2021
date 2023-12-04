package com.project.ecommerce.controller;



import com.project.ecommerce.dao.CategoryDAO;

import java.awt.SystemTray;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/categoryServlet"})
public class CategoryServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CategoryDAO categoryDAO = new CategoryDAO();
		String dataButton = req.getParameter(("dataButton"));
		
		PrintWriter printWriter = resp.getWriter();
		try {
			 if (dataButton.equals("add")) {
					String name = req.getParameter(("name"));					
					int i = categoryDAO.insertCategory(name);
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
					 int idCategory = Integer.parseInt(id);
					 int i= categoryDAO.deleteCategory(idCategory);
					 if (i==0) 
					 { printWriter.print("success");
					 	resp.getWriter(); 
					 	} 
					 else if (i==2){ 
						 printWriter.print("fail"); 
						 resp.getWriter(); 
					 } 
				 }
				 
				 else if (dataButton.equals("edit")) {
					String id = req.getParameter(("id"));
					int idCategory = Integer.parseInt(id);
					String name = req.getParameter(("name"));
					int i= categoryDAO.editCategory(idCategory, name);
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
