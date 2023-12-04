<%@page import="com.project.ecommerce.dao.CustomerDAO"%>
<%@page import="com.project.ecommerce.model.CustomerSession"%>
<%@page import="com.project.ecommerce.model.Product"%>
<%@page import="com.project.ecommerce.dao.ProductDAO"%>
<%@page import="com.project.ecommerce.dao.BrandDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.ecommerce.model.Category"%>
<%@page import="com.project.ecommerce.model.Brand"%>
<%@page import="com.project.ecommerce.model.Customer"%>
<%@page import="com.project.ecommerce.model.Cart"%>
<%@page import="com.project.ecommerce.dao.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="../Css/Fstyle.css">
<script src="../Js/header.js"></script>
<script>
	$(document).ready(function() {
		
		$("#btnSearch").click(function() {
			var textSearch = $("#text-Search").val()
			var flag=0
			if(textSearch.trim()==''){
				flag=1
				window.location.href = "http://localhost:8090/ShopSmartPhone/Views/Home.jsp"
					
			}
			if(flag==0){
				$.ajax({
						type : "post",
						url : "/ShopSmartPhone/searchServlet",
						data : {
								textSearch : textSearch
						},
						success : function(response) {
							window.location.href = "http://localhost:8090/ShopSmartPhone/Views/ListofSearch.jsp"
								}
						});
			}
		})
		$("#btnLoginHeader").click(function(){
			  $('#LoginModal').modal('show')
				 $("#loginModalClick").trigger('click')
		})
		$("#btnRegisterHeader").click(function(){
			 $('#LoginModal').modal('show')
			 $("#registerModalClick").trigger('click')
		})
		$("#btnCustomer").click(function(){
			 var idCustomer= $(this).attr("data-idCustomer")
			 var nameCustomer= $(this).attr("data-nameCustomer")
			 var phoneCustomer= $(this).attr("data-phoneCustomer")
			 var emailCustomer= $(this).attr("data-emailCustomer")
			 var addressCustomer= $(this).attr("data-addressCustomer")
			 $("#textNameCustomer").val(nameCustomer)
			 if(phoneCustomer=='null'){
				 $("#textPhoneCustomer").html('')
			 } else {
				 $("#textPhoneCustomer").val(phoneCustomer)
			 }
			 if(phoneCustomer=='null'){
				 $("#textAddressCustomer").html('')	
			 } else {
				 $("#textAddressCustomer").val(addressCustomer)	
			 }
			
			 $("#textEmailCustomer").val(emailCustomer)
			 
			 $("#btnEditCustomer").val(idCustomer)
			 $('#CustomerModal').modal('show')
					$("#textNameCustomer").keypress(function(){
					$("#name_alertCustomer").html('')
					})
					$("#textPhoneCustomer").keypress(function(){
						$("#phone_alertCustomer").html('') 
					})
					$("#textAddressCustomer").keypress(function(){
						$("#address_alertCustomer").html('') 
					})
			 $("#btnEditCustomer").click(function(){
						var flag=0
						var id= $("#btnEditCustomer").val()
						var name= $("#textNameCustomer").val()
						var phone= $("#textPhoneCustomer").val()
						var address= $("#textAddressCustomer").val()
						var dataButton= $(this).attr("data-button")
						  if(address.trim() ==''){
								$("#address_alertCustomer").html('(*)Địa chỉ không được để trống!');
								flag=1
							} 
						if(name.trim()==''){
							$("#name_alertCustomer").html("(*)Họ và tên không được để trống! ")
							flag=1
						}
						if(phone.trim()==''){
							$("#phone_alertCustomer").html("(*)Số điện thoại không được để trống! ")
							flag=1
						} 
						if(phone.trim()!='' && phone.length>12 || phone.length<8){
				         	$("#phone_alertCustomer").html('(*)Số điện thoại phải trên 8 số và dưới 12 số')
				         	flag=1;
				         }
						if(flag==0){
							
							$.ajax({
								type: "post",
								url: "/ShopSmartPhone/editProfileServlet",
								data: {
									id : id,
									nameCustomer : name,
									phoneCustomer : phone,
									addressCustomer : address,
									dataButton : dataButton
								},
								success : function(response){
									if(response=="success"){
										window.location.replace("http://localhost:8090/ShopSmartPhone/Views/Home.jsp");
										}
									else if(response=="wrong"){
										$("#address_alertCustomer").html("(*)Đăng kí không thành công! ")
									} 
									
								}
							});
						}
					})
		})
		
			$("#change-password").click(function() {	
						$("#CustomerModal").modal('hide')
						$("#changePassword").modal('show')
						$("#oldpass").keypress(function() {
						$("#passwordResult").html('');
						});
						$("#newpass").keypress(function() {
							$("#newPasswordResult").html('');
						});
						$("#renewpass").keypress(function() {
							$("#repasswordResult").html('');
						});
						$("#resetChange").click(function(){
							$("#oldpass").val('')
							$("#newpass").val('')
							$("#renewpass").val('')
						})
						$("#btnChange").click(function(){
							
								var oldpass= $("#oldpass").val()
								var newpass = $("#newpass").val()
								var renewpass = $("#renewpass").val()
								var dataButton = $(this).attr("data-button")
								var id = $(this).attr("data-id")
								var flag = 0;
								
								if(oldpass.trim()==''){
									$("#passwordResult").html('(* Bạn cần phải điền mật khẩu cũ của bạn *)')
									flag = 1
								}
								if(newpass.trim()==''){
									$("#newPasswordResult").html('(* Bạn cần phải điền mật khẩu mới *)')
									flag = 1
								}	
								if(renewpass.trim()==''){
									$("#repasswordResult").html('(* Bạn cần xác nhận lại mật khẩu *)')
									flag = 1
								}
								if(newpass.trim()!='' && newpass.length < 8 || newpass.length > 50){
									$("#newPasswordResult").html('(* Mật khẩu phải >=8 chars và <= 30 kí tự *)')
									flag = 1
								}
								if(newpass.trim() != renewpass.trim()){
									$("#repasswordResult").html('(*  Mật khẩu không trùng. Vui lòng xác thực lại *) ')
									flag = 1
								}if(flag == 0){
									 $.ajax({
										 	type: "post",
								        	url:"/ShopSmartPhone/editProfileServlet",
								        	data:{
								        			id : id,
								        			oldpass : oldpass,
								        			newpass : newpass,
								        			dataButton : dataButton
								        		},
								            success: function (response) {
								            	if(response == "success"){
								            		$("#changePassword").modal('hide')
								            		$("#changeSuccess").modal('show')
								            		
								            		$('#btnSuccess').click(function(){
								            			$('.modal-backdrop').remove()
								            		})	
								            	}
								            	else if (response == "wrong"){
								            		$("#passwordResult").html('(* Mật khẩu hiện tại không đúng *)')
								            	}
								            	else if (response == "fail"){
								            		$("#passwordResult").html('(* Đã có lỗi xảy ra *)')
								            	}
								            } 
								            
											});			
									}
								});
								
					});
		
		$("#btnLogout").click(function(){
			window.location.replace("http://localhost:8090/ShopSmartPhone/logOutServlet?role=customer");
		})
		
})
</script>
</head>
<body>
	<!-- -------Khai báo phương thức------------ -->
	<%
		CategoryDAO categoryDAO = new CategoryDAO();
		Category category = new Category();
		BrandDAO brandDAO = new BrandDAO();
		Brand brand = new Brand();
		Customer customer= new Customer();
		CustomerDAO customerDAO= new CustomerDAO();

		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
			
		}
		String register = "Đăng kí";
		String login = "Đăng nhập";
		Customer user = (Customer) session.getAttribute("customerSession");

		if (user != null) {
			customer= customerDAO.customerByID(user.getId());
			register = customer.getName();
			login = "Đăng xuất";
		}
	%>
<!-- Header - start -->
<header class="header container" id="header-content">


	<!-- Logo, Shop-menu - start -->
		<div class="header-middle ">
				<div class="header-middle-cont">
					<div class="toplogo">
						<a href="Home.jsp"> <img src="../img/header/logo1.png"
							alt="Electronic Store">
						</a>
					</div>
					<div class="shop-menu">
						<ul>
							<li class="topauth"><a<%if(user==null){ %> id=btnRegisterHeader<%}else {
								
								%>
							     id=btnCustomer data-idCustomer="<%=customer.getId()%>"
							     data-nameCustomer="<%=customer.getName()%>"
							     data-phoneCustomer="<%=customer.getPhone()%>"
							     data-addressCustomer="<%=customer.getAddress() %>"
							     data-emailCustomer="<%=customer.getEmail() %>"
							     
							      <%} %>> <i
									class="fas fa-user"></i> <span class="shop-menu-ttl"><%=register%></span>
							</a> 
							<a <%if(user==null){ %> id="btnLoginHeader"<%}else{ %>
								id="btnLogout"<%} %> 
								> <span class="shop-menu-ttl"><%=login%></span>
							</a></li>

							<li>
								<div class="h-cart">
									<a href="Cart.jsp"> <i class="fa fa-shopping-cart"></i> <span
										class="shop-menu-ttl">Giỏ hàng</span> (<b><%=cart.countItem()%></b>)
									</a>
								</div>
							</li>

						</ul>
					</div>
				</div>
			</div>
	<!-- Logo, Shop-menu - end -->

	<!-- Topmenu - start -->
	<div class="header-bottom">
		<div >
			<nav class="topmenu">

				<!-- Catalog menu - start -->
				<div class="topcatalog">
					<a class="topcatalog-btn" ><span>Tất cả</span> Thể Loại</a>
					<ul class="topcatalog-list">
						<%
								List<Category> listCategory = new ArrayList<>();
								listCategory = categoryDAO.listCategory();
								for (int i = 0; i < listCategory.size(); i++) {
									int idCate = listCategory.get(i).getId();
									String nameCate = listCategory.get(i).getName();
							%>
							<li><a
								href="Category.jsp?cateID=<%=idCate%>"><%=nameCate%></a>
								
									<ul>
									<%
											List<Brand> listBrand = new ArrayList<>();
												listBrand = brandDAO.listBrand(i + 1);
												for (int j = 0; j < listBrand.size(); j++) {
													int idBrand = listBrand.get(j).getId();
													String nameBrand = listBrand.get(j).getName();
										%>
								<li><a href="Brand.jsp?brandID=<%=idBrand%>"><%=nameBrand%></a></li>
									<%
											}
										%>
										</ul>
										</li>
										<%
								}
							%>
							</ul>
								
				</div>
				<!-- Catalog menu - end -->

				<!-- Main menu - start -->

				<ul class="mainmenu">
					<li>
						<a href="index.html" >
							Home
						</a>
					</li>
					
					<li >
						<a href="#" >
							Product 
						</a>
					</li>
					<li>
						<a href="#">
							Hỗ trợ khách hàng
						</a>
					</li>
					<li>
						<a href="#">
							Dịch vụ Ưu Đãi
						</a>
						
					</li>
					<%if(user!=null){ %>
					<li>
						<a href="MyOrder.jsp?idCustomer=<%=user.getId()%>">
							Đơn hàng của tôi
						</a>
						
					</li>
					<%} %>
					
						
				</ul>
				<!-- Main menu - end -->

				<!-- Search - start -->
				<div class="topsearch">
				<input id="text-Search" type="text" 
				<% 
				if(session.getAttribute("textSearch")==null){ %> 
				placeholder="TÌM KIẾM..."
				<%} else { 
					String textSearch= (String) session.getAttribute("textSearch");
				%>
				value="<%=textSearch %>"
				
				<%
				} %>
				>
					<a id="btnSearch" class="topsearch-btn" href="#"><i class="fa fa-search"></i></a>
					
				</div>
				<!-- Search - end -->

			</nav>		</div>
	</div>
	<!-- Topmenu - end -->
<!-- -----Modal--------- -->
<div class="modal fade" id="LoginModal" role="dialog" style="display: none">
			<div class="modal-dialog modal-center" role="document">
				<div class="modal-content">
					<div class=modal-body>
							<ul class="nav nav-tabs">
								<li><a id="loginModalClick" data-toggle="tab" href="#login">ĐĂNG
										NHẬP</a></li>
								<li><a id="registerModalClick" data-toggle="tab" href="#register">ĐĂNG KÍ</a></li>
							</ul>
							<div class="tab-content">
								<div id="login" class="tab-pane fade in active">

									<h3>Chào mừng tới Shop SmartPhone !</h3>
									<div class=" formLogin">
										<form id="form-login">
											<div class="form-group">

												<label>E-mail </label> <input
													placeholder="Vui lòng nhập email của bạn" type="text"
													id="textEmail" class="form-control"> <span
													class="alert" id="email_alert"> </span>



											</div>
											
											<div class="form-group">
												<label>Password </label> <input
													placeholder="Vui lòng nhập mật khẩu của bạn"
													type="password" id="textPassword" class="form-control">
												<span class="alert" id="pass_alert"></span>

											</div>
											<a id="forgot-password" href="#" style="float:left">Quên mật khẩu?</a>
											<div class="form-group">
												<button class="btn-login" type="button" id="btnLogin">Đăng
													nhập</button>

											</div>
										</form>
										<div class="clear-float"></div>
									</div>
								</div>
		<div id="register" class="tab-pane fade">
			<h3>Tạo tài khoản ShopSmartPhone</h3>
		<div class=" formLogin">
			<form id="form-register">
			<div class="form-group" style="margin:0">

				<label >Họ và tên</label><input type="text" id="textNameRegister" placeholder="Vui lòng nhập họ tên của bạn" class="form-control">
					<span class= "alert" id= "name_alertRegister"></span> 

			</div>
			
			<div class="form-group" style="margin:0">

				<label >E-mail </label><input type="text" id="textEmailRegister" placeholder="Vui lòng nhập email của bạn" class="form-control" >
					<span class= "alert" id= "email_alertRegister"> </span> 

			</div>
			<div class="form-group" style="margin:0">

				<label >Mật khẩu </label><input id="textPasswordRegister" type="password"  placeholder="Vui lòng nhập mật khẩu của bạn" class="form-control" >
					<span class= "alert" id= "pass_alertRegister"> </span> 

			</div>
			<div class="form-group" style="margin:0">
				<label >Nhập lại Mật khẩu </label>
				<input type="password" id="textRePasswordRegister" placeholder="Vui lòng nhập lại mật khẩu của bạn" class="form-control" >
						<span class= "alert" id= "rePass_alertRegister"> </span> 
			</div>

			<div class="form-group">
			<button class="btn-login" type="button" id="btnRegister" >Đăng kí</button>
			</div>

		</form>
		<div class="clear-float"></div>
		</div>
		</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="forgotModal" role="dialog" style="display: none;top:150px">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content" style="border: 1px solid lightgray;width:80%;margin:auto">
			<div class="modal-header" style="    background-color: aliceblue">
						<h3 class="modal-title" style="color:black" >Quên Mật Khẩu</h3>
						 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
					</div>
					<div class="modal-body">
					<p style="font-size:16px">Nhập tài khoản mà bạn đã quên mật khẩu</p>
					<input type="text" style="width:100%;border-radius: 5px; border:1px solid lightgray;padding:5px" 
					placeholder="E-mail" id="emailForgot" />
					<span class="alert" style="font-size:15px; padding:20px 0px" id="alert-emailForgot"></span>
					<span class="alert" style="font-size:15px; color:green; padding: 20px 0px" id="alert-emailSuccess"></span>
					<div class=modal-footer>
					<button data-button="forgotPassCustomer" class="btn btn-primary" id="sendForgot">Gửi</button>
					</div>
					</form>
				</div>
				
			</div>
		</div>
	</div> 
	<div class="modal fade" id="CustomerModal" role="dialog" style="display: none;top: 100px;">
			<div class="modal-dialog modal-center" role="document" >
				<div class="modal-content">
					<div class=modal-body>
						
									<div class=" formLogin">									
									<h2 style="text-align:center;margin-bottom:10px; margin-top:10px">HỒ SƠ KHÁCH HÀNG</h2>
									<div class="form-group" style="margin:0">

				<label >Họ Và Tên</label><input type="text" id="textNameCustomer" placeholder="Vui lòng nhập họ tên của bạn" class="form-control">
					<span class= "alert" id= "name_alertCustomer"></span> 

			</div>
			<div class="form-group" style="margin:0">

				<label >Số Điện Thoại </label><input type="text" id="textPhoneCustomer" placeholder="Vui lòng nhập SDT của bạn" class="form-control">
					<span class= "alert" id= "phone_alertCustomer"></span> 

			</div>
			
			<div class="form-group" style="margin:0">

				<label >E-mail </label><input type="text" id="textEmailCustomer" readonly placeholder="Vui lòng nhập email của bạn" class="form-control" >
					<span class= "alert" id= "email_alertCustomer" > </span> 

			</div>
			<div class="form-group" style="margin:0">

				<label >Địa Chỉ </label><input type="text" id="textAddressCustomer" placeholder="Vui lòng nhập địa chỉ của bạn" class="form-control" >
					<span class= "alert" id= "address_alertCustomer"> </span> 

			</div> 
			<a id="change-password" href="#" style="float:left">Thay đổi mật khẩu</a>
			<div class="form-group">
			<button data-button="editProfileCustomer" class="btn-login" type="button" id="btnEditCustomer">Chỉnh Sửa</button>
			</div>
			<div class="clear-float"></div>
			
			</div>
		</div>
	</div>
	</div>
</div>
   </div>
   	<div class="modal fade" id="changePassword" role="dialog">
		<div class="modal-dialog modal-center" role="document" style="top: 100px;">
			<div class="modal-content">
				<div class="modal-header" style="    background-color: aliceblue;">
					<h3 class="modal-title">Thay đổi mật khẩu</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
				</div>
				<div class="modal-body">
				<div class="form-group" style="margin:0">
					<label>Mật khẩu hiện tại</label>
					<input type="password" 
					id="oldpass" placeholder="Nhập mật khẩu hiện tại">
					<span class= "alert" id= "passwordResult" style="padding:0; margin:0"></span>
					</div> 
						<div class="form-group" style="margin:0">
					<label>Mật khẩu mới</label>
					<input type="password"  id="newpass" placeholder="Nhập mật khẩu mới">
					<span class= "alert" id="newPasswordResult"  style="padding:0; margin:0"></span> 
						</div>
						<div class="form-group" style="margin:0">
					<label>Nhập lại mật khẩu mới</label>
					<input type="password" 
					id="renewpass" placeholder="Nhập lại mật khẩu">
						<span class= "alert" id= "repasswordResult"  style="padding:0; margin:0"> </span> 
						</div>
				</div>
				<div class="modal-footer">
					<button <% if(user!=null){ %> data-id="<%=user.getId() %><% } %>" data-button="changePassCustomer" type="button" id="btnChange" class="btn btn-primary">Đồng Ý</button>
					<button id="resetChange" class="btn ">Phục Hồi</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="changeSuccess" role="dialog">
		<div class="modal-dialog modal-center" role="document"  style="top: 100px;">
			<div class="modal-content" style="border: 1px solid lightgray;width:80%;margin:auto">
				<div class="modal-header" style="    background-color: aliceblue;">
					<h3 class="modal-title">Mật Khẩu</h3>
				</div>
				<div class="modal-body">
					<p>Thay đổi mật khẩu thành công!</p>
				</div>
				<div class="modal-footer">
					<button type="button" id="btnSuccess" class="btn btn-primary"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
					
</header>
<!-- Header - end -->
</body>
</html>