package com.project.ecommerce.controller;

import com.project.ecommerce.dao.CommentDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(urlPatterns = "/commentServlet")
public class CommentServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dataButton= req.getParameter("dataButton");
		CommentDAO commentDAO= new CommentDAO();
		PrintWriter printWriter=resp.getWriter();
		
		switch (dataButton) {
		case "addComment":
			String valueStarString= req.getParameter("valueStar");
			String textComment= req.getParameter("textComment");
			String idUserString= req.getParameter("idUser");
			String idProduct= req.getParameter("idProduct");
			int valueStar= Integer.parseInt(valueStarString);
			int idUser= Integer.parseInt(idUserString);
			try {
				if(commentDAO.insertComment(textComment, valueStar, idUser, idProduct)) {
					printWriter.print("success");
					resp.getWriter();
				}
				else {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "deleteComment":
			String idCommentString= req.getParameter("idComment");
			int idComment= Integer.parseInt(idCommentString);
			try {
				if(commentDAO.deleteComment(idComment)) {
					printWriter.print("success");
					resp.getWriter();
				}
				else {
					printWriter.print("fail");
					resp.getWriter();
				}
				}
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				break;
			

		default:
			break;
		}
		
		
	}

}
