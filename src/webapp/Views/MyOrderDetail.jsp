<%@page import="com.project.ecommerce.dao.SeriDAO"%>
<%@page import="com.project.ecommerce.model.Seri"%>
<%@page import="com.project.ecommerce.dao.Order_detailDAO"%>
<%@page import="com.project.ecommerce.model.Order_detail"%>
<%@page import="com.project.ecommerce.dao.OrderDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.project.ecommerce.model.Cart"%>
<%@page import="com.project.ecommerce.model.Item"%>
<%@page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết Đơn Hàng || ShopSmartPhone</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../Css/Fstyle.css">

</head>
<body>
<%@ include file="header.jsp"%>
<section>
	<% DecimalFormat formatter = new DecimalFormat("###,###.00");
	String idString=request.getParameter("id");
	int idOrder= Integer.parseInt(idString);
	List<Order_detail> lisOrder_details= new ArrayList<>();
	Order_detailDAO order_detailDAO= new Order_detailDAO();
	Product product= new Product();
	ProductDAO productDAO= new ProductDAO();
	Seri seri = new Seri();
	SeriDAO seriDAO= new SeriDAO();
	List<Seri> lisSeris= new ArrayList<>();
	lisOrder_details=order_detailDAO.listOrderDetailByOrderID(idOrder);
	%>		
 <div class="container cart-items-wrap">
 <a style="color: cornflowerblue;" href="MyOrder.jsp"><i class="fas fa-backward"></i> Quay lại đơn hàng của tôi</a>
                <table class="cart-items">
                    <thead>
                    <tr>
                        <td class="cart-image" style="width:10%">Hình ảnh</td>
                        <td class="cart-ttl" style="width:30%">Sản phẩm</td>
                        <td class="cart-price" style="width:10%">Giá</td>
                        <td class="cart-quantity" style="width:10%">Số lượng</td>
                        <td class="cart-summ" style="width:15%">Tổng</td>
                        <td  style="width:25%">Seri</td>
                    </tr>
                    </thead>
                    <tbody>
                  <% for(int i=0;i<lisOrder_details.size();i++){
                	  String productID= lisOrder_details.get(i).getProductID();
                	  int price= lisOrder_details.get(i).getPrice();
                	  int quantity= lisOrder_details.get(i).getQuantity();
                	  product= productDAO.productbyID(productID);
                	  String name= product.getName();
                	  String image= product.getImage();
                	  %>
                    <tr>
                        <td class="cart-image">
                            <a >
                                <img src="<%=image %>" alt="">
                            </a>
                        </td>
                        <td class="cart-ttl">
							<%=name %>
                        </td>
                        <td class="cart-price">
                            $<%=formatter.format(price) %>
                        </td>
                        <td class="cart-quantity">
                           <%=quantity %>
                        </td>
                        <td class="cart-summ">
                            
                            <b class="priceCart">$<%=formatter.format(price*quantity)%></b>
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
                    </tbody>
                </table>
            	
        </div> 
</section> 

<%@ include file="Footer.jsp"%>
</body>
</html>