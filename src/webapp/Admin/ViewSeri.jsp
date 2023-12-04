
<%@page import="com.project.ecommerce.model.Seri"%>
<%@page import="com.project.ecommerce.dao.SeriDAO"%>
<%@page import="com.project.ecommerce.dao.ProductDAO"%>
<%@page import="com.project.ecommerce.model.Product"%>
<%@page import="com.project.ecommerce.model.Employee"%>
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

<script src="../Js/jquery.twbsPagination.js" type="text/javascript"></script>


<style><%@include file="../CssAdmin/fstyle.css"%></style> 

<meta charset="UTF-8">
<title>Category</title>

</head>
<body>	 <%
		Employee user = (Employee) session.getAttribute("employeeSession");
		 if(user == null){			
			response.sendRedirect("LoginAdmin.jsp");
			return;
		} 
		%> 

	<%
	String idProduct= (String) session.getAttribute("idProductSeri");
	Product product= new Product();
	ProductDAO productDAO= new ProductDAO();
	product= productDAO.productbyID(idProduct);
	SeriDAO seriDAO= new SeriDAO();
	List<Seri> listSeri= new ArrayList<>();
	listSeri= seriDAO.listSeriByProductID(idProduct);
		
		
	%>
	<span id="backtoProduct" style="float:left; cursor:pointer"><i class="fas fa-backward"></i>  Quay về Danh sách sản phẩm </span></br>
	
	<h2 style= "margin-right: 300px;" class="Title-view"><%=product.getName() %> ( tổng: <%=listSeri.size() %> ) </h2>
	<div class="search-ifo">
		<input id="text-Search" placeholder="Search...">
		<button id="btn-Search">
			<i class="fas fa-search"></i>
		</button>

	</div>

	<div class="clear-float"></div>
	<hr style="margin-top: 0px;">
	<div class="content-page">

		<p class="head-table">Danh sách Seri</p>

		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >
			
					<tr  >
						<th style="width: 25%">Mã Seri</th>
						<th style="width: 25%">Hóa Đơn</th>
						<th style="width: 25%">Phiếu Nhập</th>
						<th style="width: 25%">Tình trạng</th>
						</tr>
				 	<%
					  for (int i = 0; i < listSeri.size(); i++) {  
						  String status="";
					if(listSeri.get(i).getStatus()==0){
						status="Chưa bán";}
					else {
						status="Đã bán";}
					%> 
					<tr style="height:50px" class="contentPage tableViewContent" >
					
						<td class="colName" ><%=listSeri.get(i).getId() %></td>
						<td ><%=listSeri.get(i).getOrderDetailID()%></td>
						<td><%=listSeri.get(i).getGoodReceipt_detailID() %></td>
						<td>
						<%=status%>
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
	<script>
$(document).ready(function(){
		//hàm chuyển các giá trị trong col thành chữ thường LowerCase()
		$.extend($.expr[":"], {"containsNC": function(elem, i, match, array) {
        return (elem.textContent || elem.innerText || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
			}
			});
		//bắt sự kiện search, giá trị nhập vào thành chữ thường 
		$("#btn-Search").click(function() {
			var a = $("#text-Search").val().toLowerCase();
			    $(".tableViewContent td.colName:containsNC('" +a + "')").parent().show();
		        $(".tableViewContent td.colName:not(:containsNC('" +a+ "'))").parent().hide();
		})
		$("#backtoProduct").click(function(){
			$("#content").load("../Admin/ProductAdmin.jsp")
		})	
		
	})
	
		$(function () {	
		var pageSize = 8; // Hiển thị 6 sản phẩm trên 1 trang
		showPage = function(page) {
			$(".contentPage").hide();
			$(".contentPage").each(function(n) {
				if (n >= pageSize * (page - 1) && n < pageSize * page)
					$(this).show();
			});        
		}
		showPage(1);
		///** Cần truyền giá trị vào đây **///
		var totalRows = <%=listSeri.size()%>; // Tổng số sản phẩm hiển thị
		var btnPage = Math.ceil(<%=listSeri.size()%>/pageSize); 
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