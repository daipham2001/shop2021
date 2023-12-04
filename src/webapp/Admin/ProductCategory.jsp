
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
	
	listProducts= productDAO.listProductbyCategoryBrand(Integer.parseInt(idCate));
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
					<tr>
						<th style="width: 10%">Mã Sản Phẩm</th>
						<th style="width: 30%">Tên Sản Phẩm</th>
						<th style="width: 20%">Hãng</th>
						<th style="width: 15%">Giá ($)</th>
						<th style="width: 10%">Số Lượng (cái)</th>
						<th style="width: 5%"></th>
						<th style="width: 5%"></th>
						<th style="width: 5%"></th>
						</tr>
				 	<%
					  for (int i = 0; i < listProducts.size(); i++) {  
						  String idProduct=listProducts.get(i).getId();
						  String name=listProducts.get(i).getName();
						  int price =listProducts.get(i).getPrice();
						  int quantity=listProducts.get(i).getQuantity();
						  String description= listProducts.get(i).getDescription();
						  brand= brandDAO.brandById(listProducts.get(i).getBrandID());
						  category= categoryDAO.categoryByBrandID(listProducts.get(i).getBrandID());
						  
					%> 
					<tr style="height:50px" class="contentPage tableViewContent" >
					
						<td ><%=idProduct %></td>
						<td class="colName"><%=name%></td>
						<td><%=brand.getName() %></td>
					
						<td class="colPrice">$<%=formatter.format(price)%></td>
							<td class="colQuantity"><%=quantity%></td>
						<td>
						<button id="btn-delete" class="btn btn-delete"
						<% int count=productDAO.countProductinSeri(idProduct);
							if(count>0){
						%> style="display:none"<%} %>
								data-name="<%=name%>"
								data-id="<%=idProduct%>">Xóa</button>
							
						</td>
						<td>
						<button id="btn-edit<%=idProduct%>" class="btn btn-primary btn-edit"
								data-id="<%=idProduct%>"
								data-name="<%=name%>"
								data-price= "<%=price %>"
								data-description= "<%=description %>"
						>Sửa</button>
						</td>
						
						<td>
						<button class="btn btn-primary btn-seri"
								data-id="<%=idProduct%>" data-button="viewSeri">Seri</button>
							
						</td>

					</tr>
				
				<%
					}
				%>
			</table>
			
		</div>
		
		<ul style="margin-top: 20px" id="pagination" class="justify-content-center">
	  	</ul>
	  	
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
			aria-hidden="true" style="display: none">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Xóa Sản Phẩm</h5>
					</div>
					<div class="modal-body">
					<span>Bạn có muốn xóa sản phẩm : </span><span id="alertDelete"></span>
					<p class="alert" id="alertDeleteProduct"></p>
				</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-primary"
							data-button="delete" id="delete">Có</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Không</button>
						
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="editPostModal" tabindex="-1" role="dialog"
			aria-hidden="true" >
			<div class="modal-dialog" role="document">
				<form class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Sửa Sản Phẩm</h5>
						 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
					</div>
					<div class="modal-body">
						<h6 >
							Tên Sản Phẩm
							
						</h6>
					
						
						<input type="text"  id="edit-name" style="width: 100%" />
						<p class="alert" id = "alert_name" style="margin: 0; padding: 0;"> </p>	
						<h6 >
							Giá Sản Phẩm
							
						</h6>
					
						
						<input type="number"  id="edit-price" style="width: 100%" />
						<p class="alert" id = "alert_price" style="margin: 0; padding: 0;"> </p>	
						<h6 >
							Mô Tả Sản Phẩm
							
						</h6>
					
						
						<textarea rows="10" class="col-12" type="text"  id="edit-description" style="width: 100%" />
						<p class="alert" id = "alert_description" style="margin: 0; padding: 0;"> </p>		
						</div>
						<div class="modal-footer">			
						<button type="button" class="btn btn-primary" id="edit"
								 data-button="edit">Đồng Ý</button>
						<button type="button" id="reset-edit" class="btn btn-default">Phục Hồi</button>
							
						</div>
				</form>
			</div>
		</div>

	</div>
	<script>
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
	$(document).ready(function(){
		var id = $(this).attr("data-id")
		var name = $(this).attr("data-name")

		//bắt sự kiện click nút delete trong table 
		$(".btn-delete").click(function() {
			
			var id = $(this).attr("data-id")
			var name = $(this).attr("data-name")
			$('#delete').val(id);
			t = $(this).parent().parent('tr');
			$('#alertDelete').html(name)
			$("#deleteModal").modal('show')
		})
		$("#delete").click(function() {
			
			
			var id = $('#delete').val();
			var dataButton = $(this).attr('data-button');
			$.ajax({
				type : "post",
				url : "/ShopSmartPhone/productServlet",
				data : {
					id : id,
					dataButton : dataButton
				},
				success : function(response) {
					if (response == "success") {
						$("#deleteModal").modal('hide')
					 	$("#content").load("ProductAdmin.jsp") 
						$('.modal-backdrop').remove()
					}
					else if(response == "fail"){
						$("#alertDeleteProduct").html('(* Đã có lỗi xảy ra *)')
					}
					
				}
			});
		})
		$(".btn-seri").click(function(){
			var id=$(this).attr("data-id")
			var dataButton=$(this).attr("data-button")
			$.ajax({
				type : "post",
				url : "/ShopSmartPhone/seriServlet",
				data : {
					id : id,
					dataButton : dataButton
				},
				success : function(response) {
					if (response == "success") {
						
						$("#content").load("../Admin/ViewSeri.jsp")
					}
				}
			});
		})
		//bắt sự kiện click nút Add trong table 
		$(".btn-addcontent").click(function() {
			$("#content").load("../Admin/GoodReceipt.jsp")
		})
		//bắt sự kiện click nút Edit trong table 
		$(".btn-edit").click(function() {
			$("#editPostModal").modal('show')
			t = $(this).parent().parent('tr');
			var id = $(this).attr("data-id")
			var name = $(this).attr("data-name")
			var price = $(this).attr("data-price")
			var description= $(this).attr("data-description")
			$("#reset-edit").click(function(){
				$('#edit-name').val(name)
				$('#edit-price').val(price)
			})
			
			$('#edit').val(id)
			$("#edit-name").val(name)
			$("#edit-price").val(price)
			$("#edit-description").val(description)

			$("#edit-name").keypress(function() {
				$("#alert_name").html('')
			})
			$("#edit-price").keypress(function() {
				$("#alert_price").html('')
			})
			$("#edit-description").keypress(function() {
				$("#alert_description").html('')
			})

		})
		//bắt sự kiện click OK
		$("#edit").click(function() {
			var id = $('#edit').val()
			var dataButton = $(this).attr('data-button')
			var flag = 0;
			var idedit= "#btn-edit"+id
			var name= $("#edit-name").val()
			var price= $("#edit-price").val()
			var description= $("#edit-description").val()
			
			 if(name.trim()==""){
	            	$("#alert_name").html('(* Bạn cần điền tên sản phẩm *)')
	            	flag = 1;
	            }
			if(price.trim()==""){
	        	$("#alert_price").html('(* Bạn cần điền giá sản phẩm *)')
	        	flag = 1;
	       		}
			if(price<=0 & price.trim()!=''){
	        	$("#alert_price").html('(* Giá sản phẩm phải lớn hơn 0*)')
	        	flag = 1;
	       		}
			if(description.trim()==""){
	        	$("#alert_description").html('(* Bạn cần điền thông tin sản phẩm *)')
	        	flag = 1;
	       		}
	        if(flag == 0){
			$.ajax({
				type : "post",
				url : "/ShopSmartPhone/productServlet",
				data : {
					id : id,
					name : name,
					price : price,
					description : description,
					dataButton : dataButton
				},
				success : function(response) {
					if (response == "success") {
						$("#editPostModal").modal('hide')
						$('.modal-backdrop').remove()  
						$(idedit).attr('data-name',name)
						$(idedit).attr('data-price',price)
						$(idedit).attr('data-description',description)
						t.find('.colName').html(name)
						t.find('.colPrice').html(price)
					}
					else if(response == "exist"){
						$("#alert_name").html('(* Đã tồn tại tên sản phẩm này *)')
					}
					else if(response == "fail"){
						$("#alert_name").html('(* Đã có lỗi xảy ra *)')
					}
				}
			});
			
	       }
	    	
		})

	})
</script>
</body>
</html>