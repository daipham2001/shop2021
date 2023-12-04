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
<title>Giỏ Hàng || ShopSmartPhone</title>
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
 	
	if (cart == null){
		cart = new Cart();
		session.setAttribute("cart", cart);
		} %>
		
		
	<% if(cart.countItem()==0){%>
			<div class="container" style="text-align: center;font-family: -webkit-body;padding: 130px;">
	 	<h2> Chưa có sản phẩm nào được mua</h2>
		</div>
		<%}else{%>
		
			
		<div class="container cart-items-wrap">
                <table class="cart-items">
                    <thead>
                    <tr>
                        <td class="cart-image">Hình ảnh</td>
                        <td class="cart-ttl">Sản phẩm</td>
                        <td class="cart-price">Giá</td>
                        <td class="cart-quantity">Số lượng</td>
                        <td class="cart-summ">Tổng</td>
                        <td class="cart-del">&nbsp;</td>
                    </tr>
                    </thead>
                    <tbody>
                  <%  for(Map.Entry<String, Item> list: cart.getCartItems().entrySet()){
                	  String id =list.getValue().getProduct().getId();
                	  String image = list.getValue().getProduct().getImage();
                	  String name = list.getValue().getProduct().getName();
                	  int price = list.getValue().getProduct().getPrice();
                	  int quantity = list.getValue().getQuantity();
                	  int percent_promotion = list.getValue().getProduct().getPercent_promotion();
                	  int brandID= list.getValue().getProduct().getBrandID();
					  brand= brandDAO.brandById(brandID);
					  int cateID= brand.getIdcategory();
					  category= categoryDAO.categoryById(cateID);
					  
                	 
                	  
                	  %>
                    <tr>
                        <td class="cart-image">
                            <a href="Product.jsp?id=<%=id%>">
                                <img src="<%=image %>" alt="">
                            </a>
                        </td>
                        <td class="cart-ttl">
                            <a href="Product.jsp?id=<%=id%>"><%=name %></a>
                            <p>Thể loại: <%=category.getName() %></p>
                            <p>Hãng: <%=brand.getName() %></p>
                        </td>
                        <td class="cart-price">
                        <% if(percent_promotion>0){ 
                        	int a=price;
                        	price-=price*percent_promotion/100; %>
                            <b class="priceCart">$<%=formatter.format(price)%></b>
                            <b><strike><%=formatter.format(a)+" đ"%></strike> -<%=percent_promotion+"%" %></b>
                            <% }else { %>
                             <b class="priceCart">$<%=formatter.format(price)%></b>
                            <% } %>
                        </td>
                        <td class="cart-quantity">
                            <p class="cart-qnt">
                                <input value="<%=quantity%>" type="text">
                                <a href="../cartServlet?comand=add&productID=<%=id%>&quantity=1" class="cart-plus"><i class="fa fa-angle-up"></i></a>
                                <a href="../cartServlet?comand=minus&productID=<%=id%>&quantity=1" class="cart-minus"><i class="fa fa-angle-down"></i></a>
                            </p>
                        </td>
                        <td class="cart-summ">
                            
                            <b class="priceCart">$<%=formatter.format(price*quantity)%></b>
                        </td>
                        <td class="cart-del">
                            <a href="../cartServlet?comand=remove&productID=<%=id%>&quantity=1" class="cart-remove"></a>
                        </td>
                    </tr>
                    	<% 
					} 
					%>
                    </tbody>
                </table>
            	<ul class="cart-total">
                <li>TỔNG TIỀN: <b>$<%=formatter.format(cart.totalCart())%></b></li>
            </ul>
            <a  class="btnThanhToan" <%if(user==null){ %> id="btnLoginToThanhToan" <% } else { %>
               			href="ThanhToan.jsp" <% } %>>Thanh Toán Đặt Hàng</a>
            <div class="clear-float"></div>
        </div> 
        <%} %>
</section> 
 <div class="modal fade" id="alertLoginModal" role="dialog" style="display: none">
		<div class="modal-dialog modal-center"  role="document">
			<div class="modal-content" style="width: 80%;margin: auto; top: 150px">
			<div class="modal-header">
						<h4 class="modal-title">Bạn cần đăng nhập để thực hiện chức năng này</h4>
					</div>
					<div style="text-align:center;    margin: 20px;">
					<button type="button" id="btn-okToLogin" class="btn btn-primary"
					>ĐĂNG NHẬP</button>
					
				</div>
			</div>
		</div>
	</div> 
<%@ include file="Footer.jsp"%>
<script>
$(document).ready(function(){
	$("#btnLoginToThanhToan").click(function(){
		$("#alertLoginModal").modal('show')
	})
	$("#btn-okToLogin").click(function(){
			$('#alertLoginModal').modal('hide').on('hidden.bs.modal', function (e) {
                $('#LoginModal').modal('show');
			 $(this).off('hidden.bs.modal'); // Remove the 'on' event binding
            });
		})
	
})
</script>
</body>
</html>