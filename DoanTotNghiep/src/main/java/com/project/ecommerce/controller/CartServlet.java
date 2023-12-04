package com.project.ecommerce.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.ecommerce.dao.ProductDAO;
import com.project.ecommerce.model.Cart;
import com.project.ecommerce.model.Item;
import com.project.ecommerce.model.Product;

@WebServlet(urlPatterns = "/cartServlet")
public class CartServlet extends HttpServlet {
	private ProductDAO productDAO= new ProductDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session= req.getSession();
		String comand= req.getParameter("comand");
		String productID= req.getParameter("productID");
		String quantityString= req.getParameter("quantity");
		int quantity = Integer.parseInt(quantityString);
		Cart cart=(Cart) session.getAttribute("cart");
		PrintWriter printWriter=resp.getWriter();
		try {
			Product product= productDAO.productbyID(productID);
			switch (comand) {
			case "plus": 
				if(cart.getCartItems().containsKey(productID)) {
					cart.insertToCart(productID, new Item(product, cart.getCartItems().get(productID).getQuantity()+quantity-1));
				} else {
					cart.insertToCart(productID, new Item(product, quantity));
				}
				printWriter.print("success");
				resp.getWriter();
				break;
			
			case "remove": cart.removeToCart(productID);
			resp.sendRedirect("Views/Cart.jsp");
				break;
			
			case "add": cart.insertToCart(productID,  new Item(product, cart.getCartItems().get(productID).getQuantity()));
			resp.sendRedirect("Views/Cart.jsp");
			break;
			
			case "minus": cart.subToCart(productID, new Item(product, cart.getCartItems().get(productID).getQuantity()));
			resp.sendRedirect("Views/Cart.jsp");
			break;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			resp.sendRedirect("Views/Home.jsp");
		}
		session.setAttribute("cart", cart);
		
	
	}
	
}
