
<%@page import="com.project.ecommerce.model.Product"%>
<%@page import="com.project.ecommerce.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.ecommerce.dao.CategoryDAO"%>
<%@page import="com.project.ecommerce.model.Category"%>
<%@page import="com.project.ecommerce.dao.BrandDAO"%>
<%@page import="com.project.ecommerce.model.Brand"%>
<%@page import="com.project.ecommerce.dao.EmployeeDAO"%>
<%@page import="com.project.ecommerce.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><style><%@include file="../CssAdmin/fstyle.css"%></style> 
<style>
h5, select {
margin-left:15px;}
</style>

<title>Edit Profile</title>

</head>
<body>
	<%
	Employee user = (Employee) session.getAttribute("employeeSession");
	 if(user == null){			
		response.sendRedirect("LoginAdmin.jsp");
		return;
	} 
	 String idGoodRecept= request.getParameter("id");
	 System.out.print(idGoodRecept);
	 Brand brand= new Brand();
	 BrandDAO brandDAO= new BrandDAO();
	 Category category=new Category();
	 CategoryDAO categoryDAO= new CategoryDAO();
	 List<Brand> listBrands= new ArrayList<>();
	 listBrands= brandDAO.listAllBrand();
	 
	%>
	<span id="backtoGoodReceiptDetail" style="float:left;cursor:pointer"><i class="fas fa-backward"></i>  Quay về Chi Tiết Phiếu Nhập </span></br>
	
	<h2 class="Title-edit" style="margin-bottom:25px">Nhập sản phẩm</h2>
	 <ul class="nav nav-tabs">
    <li><a id="trigger1Click" data-toggle="tab" href="#home">NHẬP MỚI SẢN PHẨM</a></li>
    <li><a id="trigger2Click" data-toggle="tab" href="#menu1">NHẬP THÊM SẢN PHẨM ĐÃ CÓ</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
     <div class="content-page">
    
	
	<div class="table-head">
		<table>
			<tr>
				<p>Nhập mới</p>
			</tr>
		</table>
	</div>
	<div class="table-content">
	<div class="row">
	<div class="col-6">
	<h5>Mã sản phẩm</h5>
		<input id="idProduct" class="col-10" type="text" style="height:30px"
			placeholder="Nhập mã sản phẩm"
			>
		<p style="margin-left: 15px;" class="alert" id="alert_idProduct"></p>
		<h5>Tên sản phẩm</h5>
		<input
			 id="nameProduct" type="text" class="col-10"  placeholder="Nhập tên sản phẩm" style="height:30px">
			<p style="margin-left: 15px;" class="alert" id="alert_nameProduct"></p>
		<h5>Chọn Thể Loại-Hãng</h5>
		<select id="cmbBrand" class="col-10" style="height:30px"> 
						<%  	listBrands= brandDAO.listAllBrand();
								for(int i=0;i<listBrands.size();i++){
								int idBrand= listBrands.get(i).getId();
								String nameBrand= listBrands.get(i).getName();
								category= categoryDAO.categoryByBrandID(idBrand);
							%>
 							 <option value="<%=idBrand%>" ><%=category.getName()%> - <%=nameBrand %></option>
  							<%
							}
  							%>
						</select>
		<h5>Giá sản phẩm (nhập)</h5>
		<input id="priceProduct" class="col-10" type="number" style="height:30px"
			placeholder="Nhập giá sản phẩm" >
		<p style="margin-left: 15px;" class="alert" id="alert_priceProduct"></p>
		<h5>Giá sản phẩm (bán)</h5>
		<input id="priceProductSell" class="col-10" type="number" style="height:30px"
			placeholder="Nhập giá sản phẩm" >
		<p style="margin-left: 15px;" class="alert" id="alert_priceProductSell"></p>
		<h5>Số lượng sản phẩm</h5>
		<input id="quantityProduct" class="col-10" type="number" style="height:30px"
			placeholder="Nhập số lượng sản phẩm" >
		<p style="margin-left: 15px;" class="alert" id="alert_quantityProduct"></p>
		<h5>Hình ảnh sản phẩm</h5>
		<input
			 id="imageProduct" type="text" class="col-10"  placeholder="Nhập hình ảnh sản phẩm" style="height:30px">
			<p style="margin-left: 15px;" class="alert" id="alert_imageProduct"></p>
		<h5>Mô tả sản phẩm</h5>
		<textarea
			id="descriptionProduct" type="text" rows="10" class="col-10"  placeholder="Nhập mô tả sản phẩm"/>
			<p style="margin-left: 15px;" class="alert" id="alert_descriptionProduct"></p>
	</div>
	
	<div class="col-6">
		<div id="seri1">
		</div>
	</div>
	</div>
	<div id="btnHidden">
		<hr>
		<div style="text-align:center">
			<button data-idGoodReceipt="<%=idGoodRecept %>" data-button="newReceipt" id="submit_Edit" class="btn btn-primary">Đồng Ý</button>
			<button id="btn_reset" class="btn">Phục Hồi</button>
		</div>
		</div>
	</div>
	</div>
	</div>
	 <div id="menu1" class="tab-pane fade">
	 <div class="content-page">
    
	
	<div class="table-head">
		<table>
			<tr>
				<p>Nhập thêm</p>
			</tr>
		</table>
	</div>
	<div class="table-content">
	<div class="row">
	<div class="col-6">
		<h5 style="  margin-top: 30px;">Chọn Sản Phẩm - Hãng - Thể loại</h5>
		<select id="cmbProduct" class="col-8" style="height:30px"> 
						<%  	ProductDAO productDAO= new ProductDAO();
								List<Product> listProducts= productDAO.listAllProduct();
								for(int i=0;i<listProducts.size();i++){
								String idProduct=listProducts.get(i).getId();
								String nameProduct= listProducts.get(i).getName();
								int idBrand= listProducts.get(i).getBrandID();
								brand= brandDAO.brandById(idBrand);
								category= categoryDAO.categoryByBrandID(idBrand);
							%>
 							 <option value="<%=idProduct%>" ><%=nameProduct%> - <%=category.getName()%> - <%=brand.getName() %></option>
  							<%
							}
  							%>
						</select>
		<h5 style="  margin-top: 30px;">Số lượng sản phẩm</h5>
		<input id="quantityProductAdd" class="col-8" type="number" style="height:30px"
		
		placeholder="Nhập số lượng sản phẩm" >
		<p style="margin-left: 15px;" class="alert" id="alert_quantityProductAdd"></p>
		<h5 style="  margin-top: 30px;">Giá sản phẩm (nhập)</h5>
		<input id="priceProductAdd" class="col-8" type="number" style="height:30px"
		
		placeholder="Nhập giá sản phẩm" >
		<p style="margin-left: 15px;" class="alert" id="alert_priceProductAdd"></p>
		</div>
		<div class="col-6">
			<div id="seri2"></div>
		</div>
		</div>
		<div id="btnHidden2">
		<hr>
		<div style="text-align:center">
		<button data-idGoodReceipt="<%=idGoodRecept %>" data-button="addReceipt" id="submit_Add" class="btn btn-primary">Đồng Ý</button>
		<button id="reset_Add" class="btn ">Phục Hồi</button>
		</div>
		</div>
	 </div>
	 </div>
	 </div>
 	<div class="modal fade" id="editModal" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Sản Phẩm</h5>
				</div>
				<div class="modal-body">
					<p>Thành Công</p>
				</div>
				<div class="modal-footer">
					<button type="button" id="btn-ok" class="btn btn-primary button-submit"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script>

$(document).ready(function() {
	
	/* ---------NEW---------- */
	$("#backtoGoodReceiptDetail").click(function(){
		$("#content").load("../Admin/GoodReceiptDetail.jsp?id="+<%=idGoodRecept%>)
	})	
	
					$("#idProduct").keypress(function() {
						$("#alert_idProduct").html('')
					})
					$("#nameProduct").keypress(function() {
						$("#alert_nameProduct").html('')
					})
					$("#priceProduct").keypress(function() {
						$("#alert_priceProduct").html('');
					});
					$("#priceProductSell").keypress(function() {
						$("#alert_priceProductSell").html('');
					});
					$("#quantityProduct").keypress(function() {
						$("#alert_quantityProduct").html('');
					});
					$("#imageProduct").keypress(function() {
						$("#alert_imageProduct").html('');
					});
					$("#descriptionProduct").keypress(function() {
						$("#alert_descriptionProduct").html('');
					});
					$("#btn_reset").click(function() {
						$("#idProduct").val('')
						$("#alert_idProduct").html('')
						$("#nameProduct").val('')
						$("#alert_nameProduct").html('')
						$("#priceProduct").val('')
						$("#alert_priceProduct").html('')
						$("#priceProductSell").val('')
						$("#alert_priceProductSell").html('')
						$("#quantityProduct").val('')
						$("#alert_quantityProduct").html('')
						$("#imageProduct").val('')
						$("#alert_imageProduct").html('')
						$("#descriptionProduct").val('')
						$("#alert_descriptionProduct").html('')
					})
					$("#submit_Edit").click(function() {
										var idProduct = $("#idProduct").val();
										var nameProduct = $("#nameProduct").val();
										var brandProduct = $("#cmbBrand").val();
										var priceProduct = $("#priceProduct").val();
										var priceProductSell = $("#priceProductSell").val()
										var quantityProduct = $("#quantityProduct").val();
										var imageProduct = $("#imageProduct").val();
										var descriptionProduct = $("#descriptionProduct").val();
										var dataButton= $(this).attr("data-button")
										var idGoodReceipt= $(this).attr("data-idGoodReceipt")
										var result = 0;
										if (idProduct.trim() == '') {
											$("#alert_idProduct").html('(* Bạn cần điền mã sản phẩm  *)');
											result = 1;
										}
										
										if (nameProduct.trim() == '') {
											$("#alert_nameProduct").html('(* Bạn cần điền tên sản phẩm *)');
											result = 1;
										}
										if (priceProduct.trim() == '') {
											$("#alert_priceProduct").html('(* Bạn cần điền giá sản phẩm *)');
											result = 1;
										}
										if(priceProduct<=0 & priceProduct.trim()!=''){
							            	$("#alert_priceProduct").html('(* Giá sản phẩm phải lớn hơn 0*)')
							            	flag = 1;
							           		}
										if (priceProductSell.trim() == '') {
											$("#alert_priceProductSell").html('(* Bạn cần điền giá sản phẩm *)');
											result = 1;
										}
										if(priceProductSell<=0 & priceProductSell.trim()!=''){
							            	$("#alert_priceProductSell").html('(* Giá sản phẩm phải lớn hơn 0*)')
							            	flag = 1;
							           		}
										if (quantityProduct.trim() == '') {
											$("#alert_quantityProduct").html('(* Bạn cần điền số lượng sản phẩm *)');
											result = 1;
										}
										if (quantityProduct<=0 & quantityProduct.trim()!='') {
											$("#alert_quantityProduct").html('(* Số lượng sản phẩm phải lớn hơn 0 *)');
											result = 1;
										}
										if (imageProduct.trim() == '') {
											$("#alert_imageProduct").html('(* Bạn cần điền hình ảnh sản phẩm *)');
											result = 1;
										}
										if (descriptionProduct.trim() == '') {
											$("#alert_descriptionProduct").html('(* Bạn cần điền mô tả sản phẩm *)');
											result = 1;
										}
											
									
									if (result == 0) {
											
											$.ajax({
												url:"/ShopSmartPhone/productServlet",
												type:"post",
												data:{
													idGoodReceipt : idGoodReceipt,
													idProduct : idProduct,
													nameProduct : nameProduct,
													brandProduct : brandProduct,
													priceProduct : priceProduct,
													priceProductSell : priceProductSell,
													quantityProduct : quantityProduct,
													imageProduct : imageProduct,
													descriptionProduct : descriptionProduct,
													dataButton : dataButton
												},
												success:function(response){
													if(response == "success"){
														$("#editModal").modal('show')
														$("#btn-ok").click(function(){
														$('.modal-backdrop').remove()
														
														$("#seri1").load("../Admin/SeriAdmin.jsp")
														$("#btnHidden").css("display","none")
																
														})
													}
													else if(response == "fail"){
														$("#alert_descriptionProduct").html('(* Đã có lỗi xảy ra *)');
													}
													else if (response == "existID"){
														$("#alert_idProduct").html('(* Đã tồn tại mã sản phẩm này *)');
													}
													else if (response == "existName"){
														$("#alert_nameProduct").html('(* Đã tồn tại tên sản phẩm thuộc thể loại này *)');
													}
													
													
												}
												
											});
										}
									});
					/* ---------NEW---------- */
/* ---------OLD---------- */
	$("#quantityProductAdd").keypress(function() {
		$("#alert_quantityProductAdd").html('')
	});
	$("#priceProductAdd").keypress(function() {
		$("#alert_priceProductAdd").html('')
	});
	$("#reset_Add").click(function(){
		$("#alert_quantityProductAdd").html('')
		$("#quantityProductAdd").val('')
		$("#priceProductAdd").val('')
		$("#alert_priceProductAdd").html('')
	})
	$("#submit_Add").click(function() {
						var idProduct = $("#cmbProduct").val();
						var quantityProduct = $("#quantityProductAdd").val();
						var priceProduct = $("#priceProductAdd").val();
						var dataButton= $(this).attr("data-button")
						var idGoodReceipt= $(this).attr("data-idGoodReceipt")
						var result = 0;
							if (quantityProduct.trim() == '') {
							$("#alert_quantityProductAdd").html('(* Bạn cần điền số lượng sản phẩm *)');
							result = 1;
						}
							if (quantityProduct<=0 & quantityProduct.trim() != '') {
								$("#alert_quantityProductAdd").html('(* Số lượng sản phẩm phải lớn hơn 0 *)');
								result = 1;
							}
							if (priceProduct.trim() == '') {
								$("#alert_priceProductAdd").html('(* Bạn cần điền giá sản phẩm *)');
								result = 1;
							}
								if (priceProduct<=0 & priceProduct.trim() != '') {
									$("#alert_priceProductAdd").html('(* Giá sản phẩm phải lớn hơn 0 *)');
									result = 1;
								}
						
					if (result == 0) {
							
							$.ajax({
								url:"/ShopSmartPhone/productServlet",
								type:"post",
								data:{
									idGoodReceipt : idGoodReceipt,
									priceProduct : priceProduct,
									idProduct : idProduct,
									quantityProduct : quantityProduct,
									dataButton : dataButton
								},
								success:function(response){
									console.log(response)
									if(response == "success"){
										$("#editModal").modal('show')
										$("#btn-ok").click(function(){
										$('.modal-backdrop').remove()
										$("#seri2").load("../Admin/SeriAdmin.jsp")
										$("#btnHidden2").css("display","none")
												
										})
									}
									else if(response == "fail"){
										$("#alert_quantityProductAdd").html('(* Đã có lỗi xảy ra *)');
									}
									
									
								}
								
							});
						}
					});

})
</script>
</html>