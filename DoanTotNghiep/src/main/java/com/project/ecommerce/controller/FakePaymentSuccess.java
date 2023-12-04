package com.project.ecommerce.controller;

import com.project.ecommerce.dao.OrderDAO;
import com.project.ecommerce.dao.Order_detailDAO;
import com.project.ecommerce.dao.ProductDAO;
import com.project.ecommerce.dao.SeriDAO;
import com.project.ecommerce.model.Cart;
import com.project.ecommerce.model.Item;
import com.project.ecommerce.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;


@WebServlet(urlPatterns = "/FakePaymentSuccess")
public class FakePaymentSuccess extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // String status = req.getParameter("st");
        // fake status compled
        String status = "Completed";
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Order order = (Order) session.getAttribute("orderSession");
        OrderDAO orderDAO = new OrderDAO();
        Order_detailDAO order_detailDAO = new Order_detailDAO();
        ProductDAO productDAO = new ProductDAO();
        SeriDAO seriDAO = new SeriDAO();
        if (status.equals("Completed")) {
            try {
                if (orderDAO.insertOrder(order.getCustomerID(), order.getCreate_date(), order.getTotal(), order.getAddress(),
                        order.getName(), order.getTime(), order.getPhone())) {
                    int orderID = orderDAO.OrderbyID(order.getCreate_date(), order.getCustomerID());
                    for (Map.Entry<String, Item> list : cart.getCartItems().entrySet()) {
                        String productId = list.getValue().getProduct().getId();
                        int price = list.getValue().getProduct().getPrice();
                        int quantity = list.getValue().getQuantity();
                        int percent_promotion = list.getValue().getProduct().getPercent_promotion();
                        if (percent_promotion > 0) {
                            price -= price * percent_promotion / 100;
                        }
                        order_detailDAO.insertOrder_detail(orderID, productId, quantity, price);
                        int idOrder_detail = order_detailDAO.Order_detailbyID(orderID);
                        seriDAO.UpdateStatusSeri(productId, idOrder_detail, quantity);
                        productDAO.updateQuantityProduct(productId, quantity);
                    }
                    session.removeAttribute("cart");
                    session.removeAttribute("orderSession");
                    resp.sendRedirect("Views/Home.jsp");
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
    }

}
