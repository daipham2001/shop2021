package com.project.ecommerce.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.paypal.base.rest.PayPalRESTException;
import com.project.ecommerce.dao.PaymentServices;
import com.project.ecommerce.model.Order_detail;

@WebServlet(urlPatterns ="/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AuthorizePaymentServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String orderId = request.getParameter("orderId");
        String productId= request.getParameter("productId");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");

        Order_detail orderDetail = new Order_detail(Integer.parseInt(id) ,Integer.parseInt(orderId), productId, Integer.parseInt(quantity), Integer.parseInt(price));

        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetail);

            response.sendRedirect(approvalLink);

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("Payment/error.jsp").forward(request, response);
        }
    }

}
