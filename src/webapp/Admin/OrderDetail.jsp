<%@page import="com.project.ecommerce.dao.SeriDAO"%>
<%@page import="com.project.ecommerce.model.Seri"%>
<%@page import="com.project.ecommerce.dao.ProductDAO"%>
<%@page import="com.project.ecommerce.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.project.ecommerce.dao.Order_detailDAO"%>
<%@page import="com.project.ecommerce.model.Order_detail"%>
<%@page import="com.project.ecommerce.dao.OrderDAO"%>
<%@page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


</head>
<body>
	<% DecimalFormat formatter = new DecimalFormat("###,###.00");
	String idString=request.getParameter("id");
	int idOrder= Integer.parseInt(idString);
	List<Order_detail> lisOrder_details= new ArrayList<>();
	Product product=new Product();
	ProductDAO productDAO= new ProductDAO();
	Order_detailDAO order_detailDAO= new Order_detailDAO();
	lisOrder_details=order_detailDAO.listOrderDetailByOrderID(idOrder);
	Seri seri = new Seri();
	SeriDAO seriDAO= new SeriDAO();
	List<Seri> lisSeris= new ArrayList<>();

	%>		 
	<span id="backtoOrder" style="float:left; cursor:pointer"><i class="fas fa-backward"></i>  Quay về Đơn Hàng </span></br>
	<h2 style= "margin-right: 300px;" class="Title-view">Chi Tiết Đơn Hàng ( Mã đơn ' <%=idString%> ' )</h2>
		<div class="search-ifo">
		<input id="text-Search" placeholder="Search...">
		<button id="btn-Search">
			<i class="fas fa-search"></i>
		</button>

	</div>

	<div class="clear-float"></div>
 <div class="content-page">
		<p class="head-table">Danh sách Đặt Hàng Chi Tiết</p>

		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >			
					<tr >
						<td class="10%">Mã Sản Phẩm</td>
						 <td class="10%">Hình ảnh</td>
                        <td class="colName 30%">Sản phẩm</td>
                        <td class="10%">Giá ($)</td>
                        <td class="10%">Số lượng (cái)</td>
                        <td class="10%">Tổng</td>
                        <td class="20%">Seri</td>
						</tr>
				 	
				 	 <% for(int i=0;i<lisOrder_details.size();i++){
	                	  String productID= lisOrder_details.get(i).getProductID();
	                	  int price= lisOrder_details.get(i).getPrice();
	                	  int quantity= lisOrder_details.get(i).getQuantity();
	                	  product= productDAO.productbyID(productID);
	                	  String name= product.getName();
	                	  String image= product.getImage();
	                	  %>
					<tr style="height:70px" class="tableViewContent contentPage" >
						<td><%=productID %></td>
						<td style="text-align:center"><img style="width:50px; height:auto" alt="#" src="<%=image%>"></td>
						<td class="colName"><%=name%></td>
						<td>$<%=formatter.format(price) %></td>
						<td class="colQuantity"><%=quantity%></td>
						<td style="color:red">
						$<%=formatter.format(price*quantity)%>
						</td>
						<td>
                         
                            <ul style="list-style: none;padding: 0;">
                            <% lisSeris= seriDAO.listSeriByProductIDOrderID(productID, idOrder); 
                            for(int j=0;j<lisSeris.size();j++){ %>
                           
                                <li>  Seri <%=j+1 %>: <span style="color:cornflowerblue"><%=lisSeris.get(j).getId() %></span>  </li>
                            <%} %>
                            </ul>
                        </td>
					</tr>
				
				<%
					}
				%>
			</table>
			
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#backtoOrder").click(function(){
			$("#content").load("../Admin/OrderAdmin.jsp")
		})
	})
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
	</script>
</body>
</html>