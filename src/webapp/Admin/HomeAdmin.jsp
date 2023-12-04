<%@page import="com.project.ecommerce.model.EmployeeSession"%>
<%@page import="com.project.ecommerce.model.Employee"%>
<%@page import="com.project.ecommerce.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ShopSmartPhone</title>
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
 <style><%@include file="../CssAdmin/fstyle.css"%></style> 
 <script>
 $(document).ready(function() {
		var i = 0
		$("#btnUser").click(function() {	
			if (i != 1) {
				$('#btnBrand').css('background-color', '#F8F8F8');
				$('#btnCategory').css('background-color', '#F8F8F8');
				$('#btnGoodReceipt').css('background-color', '#F8F8F8');
				$('#btnTonKho').css('background-color', '#F8F8F8');
				$('#btnPromotion').css('background-color', '#F8F8F8');
				$('#btnProduct').css('background-color', '#F8F8F8');
				$('#btnOrder').css('background-color', '#F8F8F8');
				$('#content').load('../Admin/EditProfile.jsp');
					i = 1;
			}
		})

		$("#btnProduct").click(function() {
			if (i != 2) {
				$('#btnBrand').css('background-color', '#F8F8F8');
				$('#btnCategory').css('background-color', '#F8F8F8');
				$('#btnPromotion').css('background-color', '#F8F8F8');
				$('#btnTonKho').css('background-color', '#F8F8F8');
				$('#btnGoodReceipt').css('background-color', '#F8F8F8');
				$('#btnProduct').css('background-color', '#EEEEEE');
				$('#btnOrder').css('background-color', '#F8F8F8');
				$('#content').load('../Admin/ProductAdmin.jsp');
					i = 2;
			}
		})
		$("#btnCategory").click(function() {
			if (i != 3) {
				$('#btnProduct').css('background-color', '#F8F8F8');
				$('#btnBrand').css('background-color', '#F8F8F8');
				$('#btnOrder').css('background-color', '#F8F8F8');
				$('#btnTonKho').css('background-color', '#F8F8F8');
				$('#btnPromotion').css('background-color', '#F8F8F8');
				$('#btnGoodReceipt').css('background-color', '#F8F8F8');
				$('#btnCategory').css('background-color', '#EEEEEE');
				$('#content').load('../Admin/CategoryAdmin.jsp');
					i = 3;
			}
		})
			$("#btnBrand").click(function() {
			if (i != 4) {
				$('#btnProduct').css('background-color', '#F8F8F8');
				$('#btnCategory').css('background-color', '#F8F8F8');
				$('#btnOrder').css('background-color', '#F8F8F8');
				$('#btnPromotion').css('background-color', '#F8F8F8');
				$('#btnTonKho').css('background-color', '#F8F8F8');
				$('#btnGoodReceipt').css('background-color', '#F8F8F8');
				$('#btnBrand').css('background-color', '#EEEEEE');
				$('#content').load('../Admin/BrandAdmin.jsp');
					i = 4;
			}
		})
			$("#btnOrder").click(function() {
			if (i != 5) {
				$('#btnProduct').css('background-color', '#F8F8F8');
				$('#btnCategory').css('background-color', '#F8F8F8');
				$('#btnOrder').css('background-color', '#EEEEEE');
				$('#btnGoodReceipt').css('background-color', '#F8F8F8');
				$('#btnBrand').css('background-color', '#F8F8F8');
				$('#btnTonKho').css('background-color', '#F8F8F8');
				$('#btnPromotion').css('background-color', '#F8F8F8');
				$('#content').load('../Admin/OrderAdmin.jsp');
					i = 5;
			}
		})
		$("#btnGoodReceipt").click(function() {
			if (i != 8) {
				$('#btnProduct').css('background-color', '#F8F8F8');
				$('#btnCategory').css('background-color', '#F8F8F8');
				$('#btnOrder').css('background-color', '#F8F8F8');
				$('#btnGoodReceipt').css('background-color', '#EEEEEE');
				$('#btnBrand').css('background-color', '#F8F8F8');
				$('#btnTonKho').css('background-color', '#F8F8F8');
				$('#btnPromotion').css('background-color', '#F8F8F8');
				$('#content').load('../Admin/GoodReceipt.jsp');
					i = 8;
			}
		})
		$("#btnPromotion").click(function() {
			if (i != 6) {
				$('#btnProduct').css('background-color', '#F8F8F8');
				$('#btnCategory').css('background-color', '#F8F8F8');
				$('#btnOrder').css('background-color', '#F8F8F8');
				$('#btnBrand').css('background-color', '#F8F8F8');
				$('#btnGoodReceipt').css('background-color', '#F8F8F8');
				$('#btnPromotion').css('background-color', '#EEEEEE');
				$('#btnTonKho').css('background-color', '#F8F8F8');
				$('#content').load('../Admin/PromotionAdmin.jsp');
					i = 6;
			}
		})
		$("#btnTonKho").click(function() {
			if (i != 7) {
				$('#btnProduct').css('background-color', '#F8F8F8');
				$('#btnCategory').css('background-color', '#F8F8F8');
				$('#btnOrder').css('background-color', '#F8F8F8');
				$('#btnBrand').css('background-color', '#F8F8F8');
				$('#btnGoodReceipt').css('background-color', '#F8F8F8');
				$('#btnPromotion').css('background-color', '#F8F8F8');
				$('#btnTonKho').css('background-color', '#EEEEEE');
				$('#content').load('../Admin/TonKho.jsp');
					i = 7;
			}
		})
		$('#btnTonKho').css('background-color', '#F8F8F8');
		$('#btnProduct').css('background-color', '#F8F8F8');
		$('#btnBrand').css('background-color', '#F8F8F8');
		$('#btnPromotion').css('background-color', '#F8F8F8');
		$('#btnOrder').css('background-color', '#F8F8F8');
		$('#btnGoodReceipt').css('background-color', '#F8F8F8');
		$('#btnCategory').css('background-color', '#EEEEEE');
		$('#content').load('../Admin/CategoryAdmin.jsp');

	})
 </script>

<title>Trang quản lý</title>
</head>
<body>
		 <%
		Employee user = (Employee) session.getAttribute("employeeSession");
		 if(user == null){			
			response.sendRedirect("LoginAdmin.jsp");
			return;
		}

			session.setAttribute("cmbPromotion",1);
			session.setAttribute("idProductSeri","MH01");
		%> 
	<header id="header-content">
		<div class="container-fluid">
			<h3 class="cms">QUAN LY</h3>
			<div class="dropdown1">
				<ul>
					<li class="dropdown"><a
						style="padding: 10px; display: block; text-decoration: none; margin: 0 0 0 60px;"><i
							style="margin-right: 10px; font-size: 20px" class="fas fa-user"></i><i
							class="fas fa-caret-down"></i> </a>
						<div class="dropdown-content">
							<ul>
								<li id="btnUser" class="sub-dropdown"><a href="#"><i
										class="fas fa-user"></i>Hồ sơ</a></li>
								<li style="border-top: 0;" class="sub-dropdown"><a
									href="/ShopSmartPhone/logOutServlet?role=admin"><i class="fas fa-sign-out-alt"></i>Thoát</a></li>
							</ul>
						</div></li>
				</ul>
			</div>
			<div class="clear-float"></div>
		</div>

	</header>
	<section id="section-content" class="preloading">
		<div class="layout container-fluid row">
			<div class="menu col-md-4 col-lg-2">
				<ul>
					
					<li id="btnCategory"><a href="#"><i class="fas fa-box"></i>Thể Loại</a></li>
					
						<li id="btnBrand"><a href="#"><i
							class="fas fa-box"></i>Hãng</a></li>
					
					<li id="btnProduct"><a href="#"><i class="fas fa-newspaper"></i>Sản Phẩm</a></li>
					
					<li id="btnOrder"><a href="#"><i class="fas fa-edit"></i>Đặt Hàng</a></li>
					<li id="btnPromotion"><a href="#"><i class="fas fa-tags"></i>Đợt Giảm Giá</a></li>
					<li id="btnGoodReceipt"><a href="#"><i class="far fa-plus-square"></i>Nhập Hàng</a></li>
					<li id="btnTonKho"><a href="#"><i class="fas fa-chart-bar"></i>Tồn Kho</a></li>
					
				
					
				</ul>
			</div>
			<div class="content col-12 col-sm-12 col-md-8 col-lg-10">
				<div id="content" ></div>
			</div>

		</div>


	</section>

</body>

</html>