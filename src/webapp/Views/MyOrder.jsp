<%@page import="java.text.DecimalFormat"%>
<%@page import="com.project.ecommerce.dao.OrderDAO"%>
<%@page import="com.project.ecommerce.model.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đơn Hàng || ShopSmartPhone</title>
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
<%
	Order order=new Order();
	OrderDAO orderDAO= new OrderDAO();
	List<Order> listOrders= new ArrayList<>();
	DecimalFormat formatter = new DecimalFormat("###,###.00");
%>
<section>
	<% 
	int count= orderDAO.countOrderDetailByCustomerID(user.getId()); 
	if(count==0){%>
			<div class="container" style="text-align: center;font-family: -webkit-body;padding: 130px;">
	 	<h2> Bạn chưa đặt hàng lần nào</h2>
		</div>
		<%}else{%>
<div class="container" style="margin-top:50px">
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home">ĐƠN HÀNG ĐANG XỬ LÍ</a></li>
  <li><a data-toggle="tab" href="#menu1">ĐƠN HÀNG ĐANG GIAO</a></li>
    <li><a data-toggle="tab" href="#menu2">ĐƠN HÀNG ĐÃ NHẬN</a></li>
</ul>
 <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
   
	<div class=" cart-items-wrap" style="margin: 0 20px">
                <table class="cart-items">
                    <thead>
                    <tr>
                        <td class="10%">Mã ĐH</td>
                        <td class="20%">Ngày mua Hàng</td>
                        <td class="20%">Tổng</td>
                        <td class="40">Thông tin người nhận</td>
                        <td class="10%"></td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    <%if(user!=null){
                    	listOrders= orderDAO.listOrderByCustomer(user.getId(),0);
                    	for (int i=0;i<listOrders.size();i++){
                    		int id=listOrders.get(i).getId();
                    		String date= listOrders.get(i).getCreate_date();
                    		int total= listOrders.get(i).getTotal();
                    		String name= listOrders.get(i).getName();
                    		String phone= listOrders.get(i).getPhone();
                    		String address= listOrders.get(i).getAddress();
                    		String dateReceive= listOrders.get(i).getTime();
                    		
                    	%>
                        <td >
                            <%=id %>
                        </td>
                        <td >
                           <%=date %>
                        </td>
                        <td >
                       $<%=formatter.format(total) %>
                        </td>
                        <td >
                            
                            <ul style="list-style: none; padding:0">
                            <li>Tên: <%=name %></li>
                            <li>SDT: <%=phone %></li>
                            <li>Địa chỉ: <%=address%></li>
                            <li>Ngày nhận: <%=dateReceive %></li>
                            </ul>
                        </td>
                        <td>
                        <a style="color: cornflowerblue;" href="MyOrderDetail.jsp?id=<%=id%>">Xem chi tiết</a>
                        </td>
          
                    </tr>
                    	<% 
                    	}
					} 
					%>
                    </tbody>
                </table>
            
            <div class="clear-float"></div>
        </div> 
        </div>

<div id="menu1" class="tab-pane fade">
  <div class=" cart-items-wrap" style="margin: 0 20px">
                <table class="cart-items">
                    <thead>
                    <tr>
                        <td class="10%">Mã ĐH</td>
                        <td class="20%">Ngày mua Hàng</td>
                        <td class="20%">Tổng</td>
                        <td class="40">Thông tin người nhận</td>
                        <td class="10%"></td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    <%if(user!=null){
                    	listOrders= orderDAO.listOrderByCustomer(user.getId(),1);
                    	for (int i=0;i<listOrders.size();i++){
                    		int id=listOrders.get(i).getId();
                    		String date= listOrders.get(i).getCreate_date();
                    		int total= listOrders.get(i).getTotal();
                    		String name= listOrders.get(i).getName();
                    		String phone= listOrders.get(i).getPhone();
                    		String address= listOrders.get(i).getAddress();
                    		String dateReceive= listOrders.get(i).getTime();
                    		
                    	%>
                        <td >
                            <%=id %>
                        </td>
                        <td >
                           <%=date %>
                        </td>
                        <td >
                       $<%=formatter.format(total) %>
                        </td>
                        <td >
                            
                            <ul style="list-style: none; padding:0">
                            <li>Tên: <%=name %></li>
                            <li>SDT: <%=phone %></li>
                            <li>Địa chỉ: <%=address%></li>
                            <li>Ngày nhận: <%=dateReceive %></li>
                            </ul>
                        </td>
                        <td>
                        <a style="color: cornflowerblue;" href="MyOrderDetail.jsp?id=<%=id%>">Xem chi tiết</a>
                        </td>
          
                    </tr>
                    	<% 
                    	}
					} 
					%>
                    </tbody>
                </table>
            
            <div class="clear-float"></div>
        </div> 
  </div>
  <div id="menu2" class="tab-pane fade">
  <div class=" cart-items-wrap" style="margin: 0 20px">
                <table class="cart-items">
                    <thead>
                    <tr>
                        <td class="10%">Mã ĐH</td>
                        <td class="20%">Ngày mua Hàng</td>
                        <td class="20%">Tổng</td>
                        <td class="40">Thông tin người nhận</td>
                        <td class="10%"></td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    <%if(user!=null){
                    	listOrders= orderDAO.listOrderByCustomer(user.getId(),2);
                    	for (int i=0;i<listOrders.size();i++){
                    		int id=listOrders.get(i).getId();
                    		String date= listOrders.get(i).getCreate_date();
                    		int total= listOrders.get(i).getTotal();
                    		String name= listOrders.get(i).getName();
                    		String phone= listOrders.get(i).getPhone();
                    		String address= listOrders.get(i).getAddress();
                    		String dateReceive= listOrders.get(i).getTime();
                    		
                    	%>
                        <td >
                            <%=id %>
                        </td>
                        <td >
                           <%=date %>
                        </td>
                        <td >
                       $<%=formatter.format(total) %>
                        </td>
                        <td >
                            
                            <ul style="list-style: none; padding:0">
                            <li>Tên: <%=name %></li>
                            <li>SDT: <%=phone %></li>
                            <li>Địa chỉ: <%=address%></li>
                            <li>Ngày nhận: <%=dateReceive %></li>
                            </ul>
                        </td>
                        <td>
                        <a style="color: cornflowerblue;" href="MyOrderDetail.jsp?id=<%=id%>">Xem chi tiết</a>
                        </td>
          
                    </tr>
                    	<% 
                    	}
					} 
					%>
                    </tbody>
                </table>
            
            <div class="clear-float"></div>
        </div> 
  </div>
</div>
</div>
<%} 
%>

</section>



<%@ include file="Footer.jsp"%>
</body>
</html>