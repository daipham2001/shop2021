package com.project.ecommerce.controller;

import com.project.ecommerce.dao.ProductDAO;
import com.project.ecommerce.model.Product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(urlPatterns = "/searchServlet")
public class SearchServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String textSearch= req.getParameter("textSearch");
			HttpSession session= req.getSession();
			session.setAttribute("textSearch", textSearch);
			ProductDAO productDAO=new ProductDAO();
			PrintWriter printWriter= resp.getWriter();
			try {
				List<Product> dsSearch= productDAO.listProductbySearch(textSearch);
				if(textSearch.equals("") || textSearch==null) {
					session.removeAttribute("dsSearch");
					printWriter.print("noSearch");
					resp.getWriter();
				}
				else {
					session.setAttribute("dsSearch", dsSearch);
					printWriter.print("Search");
					resp.getWriter();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}
