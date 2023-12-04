
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
	List<Product> listProducts= new ArrayList<>();
	String idCate=  request.getParameter("idCate");
	
	listProducts= productDAO.listProductbyCategory(Integer.parseInt(idCate));
	Brand brand= new Brand();
	BrandDAO brandDAO= new BrandDAO();
	List<Category> lisCategories= new ArrayList<>();
	Category category=new Category();
	CategoryDAO categoryDAO= new CategoryDAO();
	DecimalFormat formatter = new DecimalFormat("###,###,###");
		
		
	%>
<div class="content-page">
		<p class="head-table">Danh sách Sản Phẩm</p>

		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >			
					<tr >
						<th style="width: 10%">Mã Sản Phẩm</th>
						<th style="width: 7%">Hình ảnh</th>
						<th style="width: 28%">Tên Sản Phẩm</th>
						
						<th style="width: 15%">Hãng</th>
						<th style="width: 10%">Số Lượng (cái)</th>
						<th style="width: 30%"></th>
						</tr>
				 	<%
					  for (int i = 0; i < listProducts.size(); i++) {  
						  String idProduct=listProducts.get(i).getId();
						  String name=listProducts.get(i).getName();
						  String image=listProducts.get(i).getImage();
						  int quantity=listProducts.get(i).getQuantity();

						  brand= brandDAO.brandById(listProducts.get(i).getBrandID());
						  
					%> 
					<tr style="height:70px" class="tableViewContent contentPage" >
					
						<td ><%=idProduct %></td>
						<td style="text-align:center"><img style="width:50px; height:auto" alt="#" src="<%=image%>"></td>
						<td class="colName"><%=name%></td>
						<td><%=brand.getName() %></td>
						<td class="colQuantity"><%=quantity%></td>
						<td style="color:red">
						<%if(quantity<5 && quantity>0){ %>
							Bạn cần nhập thêm sản phẩm, sản phẩm đã gần hết hàng
						<%} else if(quantity==0){ %>
							Sản phẩm đã hết hàng, bạn cần nhập thêm
							<%} %>
						</td>
					</tr>	
				<%
					}
				%>
			</table>
			
		</div>
		<ul style="margin-top: 20px" id="pagination" class="justify-content-center">
	  	</ul>
	</div>
	<script type="text/javascript">
	$(function () {	
		var pageSize = 6; // Hiển thị 6 sản phẩm trên 1 trang
		showPage = function(page) {
			$(".contentPage").hide();
			$(".contentPage").each(function(n) {
				if (n >= pageSize * (page - 1) && n < pageSize * page)
					$(this).show();
			});        
		}
		showPage(1);
		///** Cần truyền giá trị vào đây **///
		var totalRows = <%=listProducts.size()%>; // Tổng số sản phẩm hiển thị
		var btnPage = 3; 
		var iTotalPages = Math.ceil(totalRows / pageSize);

		var obj = $('#pagination').twbsPagination({
			totalPages: iTotalPages,
			visiblePages: btnPage,
			onPageClick: function (event, page) {
				/* console.info(page); */
				showPage(page);
			}
		});
	});
	</script>
</body>
</html>