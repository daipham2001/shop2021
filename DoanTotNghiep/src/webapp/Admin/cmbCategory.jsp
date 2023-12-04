
<%@page import="com.project.ecommerce.dao.BrandDAO"%>
<%@page import="com.project.ecommerce.model.Brand"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.project.ecommerce.model.Employee"%>
<%@page import="com.project.ecommerce.dao.ProductDAO"%>
<%@page import="com.project.ecommerce.model.Product"%>
<%@page import="com.project.ecommerce.dao.CategoryDAO"%>
<%@page import="com.project.ecommerce.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%
		Employee user = (Employee) session.getAttribute("employeeSession");
		 if(user == null){			
			response.sendRedirect("LoginAdmin.jsp");
			return;
		} 
		%> 

	<%
	Product product= new Product();
	ProductDAO productDAO= new ProductDAO();
	String idCate=  request.getParameter("idCate");
	Category category=new Category();
	CategoryDAO categoryDAO= new CategoryDAO();
		
		
	%><p>Chọn Sản Phẩm</p>
						
						<select id="cmbProduct"> 
						<% List<Product> listProducts= new ArrayList<>();
							listProducts= productDAO.listProductbyCategory(Integer.parseInt(idCate));
									for(int i=0;i<listProducts.size();i++){
										category= categoryDAO.categoryByidProduct(listProducts.get(i).getId());
										
							%>
 							 <option value="<%=listProducts.get(i).getId()%>" ><%=listProducts.get(i).getId()%> - <%=listProducts.get(i).getName()%></option>
  							<%
							}
  							%>
						</select>
</body>
</html>