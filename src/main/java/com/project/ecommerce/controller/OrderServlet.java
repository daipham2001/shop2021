package com.project.ecommerce.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.project.ecommerce.dao.OrderDAO;
import com.project.ecommerce.dao.SeriDAO;
import com.project.ecommerce.model.Cart;
import com.project.ecommerce.model.Order;
import com.sun.org.apache.bcel.internal.generic.NEW;


@WebServlet(urlPatterns = "/orderServlet")
public class OrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String idString= req.getParameter("idCustomer");
			int customerID= Integer.parseInt(idString);
			String phone= req.getParameter("phoneUser");
			String name= req.getParameter("nameUser");
			String address= req.getParameter("addressUser");
			String dateRecieve=req.getParameter("dateRecieve");
			HttpSession session= req.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			int total= cart.totalCart();
			Date d=new Date();
			SimpleDateFormat formatDay = new SimpleDateFormat("yyyy-MM-dd HH:ss");
			String date = formatDay.format(d);
			OrderDAO orderDAO= new OrderDAO();
			SeriDAO seriDAO= new SeriDAO();
			PrintWriter printWriter= resp.getWriter();
			session.setAttribute("orderSession", new Order(customerID, date, total, address, name, dateRecieve, phone));
		/*
		 * try { if(ordercom.project.ecommerce.com.project.ecommerce.dao.insertOrder(customerID, date, total, address, name,
		 * dateRecieve, phone)) { int orderID= ordercom.project.ecommerce.com.project.ecommerce.dao.OrderbyID(date, customerID);
		 * Order_detailDAO order_detailDAO= new Order_detailDAO(); for(Map.Entry<String,
		 * Item> list: cart.getCartItems().entrySet()){ String productId
		 * =list.getValue().getProduct().getId(); int price =
		 * list.getValue().getProduct().getPrice(); int quantity =
		 * list.getValue().getQuantity(); int percent_promotion =
		 * list.getValue().getProduct().getPercent_promotion(); if(percent_promotion>0){
		 * price-=price*percent_promotion/100; }
		 * order_detailcom.project.ecommerce.com.project.ecommerce.dao.insertOrder_detail(orderID, productId, quantity, price); int
		 * idOrder_detail= order_detailcom.project.ecommerce.com.project.ecommerce.dao.Order_detailbyID(orderID);
		 * sericom.project.ecommerce.com.project.ecommerce.dao.UpdateStatusSeri(productId, idOrder_detail, quantity);
		 * 
		 * } printWriter.print("success"); resp.getWriter(); }
		 * 
		 * else { printWriter.print("fail"); resp.getWriter(); } } catch (SQLException
		 * e) { // TODO Auto-generated catch block e.printStackTrace(); }
		 */
			printWriter.print("success");
			resp.getWriter();
			
	}
}
