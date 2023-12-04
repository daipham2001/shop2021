
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
	Category category=new Category();
	CategoryDAO categoryDAO= new CategoryDAO();
	List<Category> listCategories= new ArrayList<>();
	listCategories = categoryDAO.listCategory();
		
		
	%>
	<h2 style= "margin-right: 500px;" class="Title-view">Thể Loại</h2>
	<button class="btn-addcontent btn btn-primary">Thêm Thể Loại</button>
	<div class="search-ifo">
		<input id="text-Search" placeholder="Search...">
		<button id="btn-Search">
			<i class="fas fa-search"></i>
		</button>

	</div>

	<div class="clear-float"></div>
	<hr style="margin-top: 0px;">
	<div class="content-page">

		<p class="head-table">Danh sách Thể Loại</p>

		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >
			
					<tr>
						<th style="width: 15%">Mã Thể Loại</th>
						<th style="width: 75%">Tên Thể loại</th>
						<th style="width: 5%"></th>
						<th style="width: 5%"></th>
						</tr>
				 	<%
					  for (int i = 0; i < listCategories.size(); i++) {  
					
					%> 
					<tr style="height:50px" class="contentPage tableViewContent" >
					
						<td ><%=listCategories.get(i).getId() %></td>
						<td class="colName"><%=listCategories.get(i).getName()%></td>
						<td>
						<button id="btn-delete" class="btn btn-delete"
								<% int count= categoryDAO.countCategoryinBrand(listCategories.get(i).getId());
									if(count>0){%>
									style="display:none"<%} %>
								data-name="<%=listCategories.get(i).getName()%>"
								data-id="<%=listCategories.get(i).getId()%>">Xóa</button>
							
						</td>
						<td >
						<button id="btn-edit<%=listCategories.get(i).getId()%>" class="btn btn-primary btn-edit"
								data-id="<%=listCategories.get(i).getId()%>"
								data-name="<%=listCategories.get(i).getName()%>"
						>Sửa</button>
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
						<h5 class="modal-title">Xóa Thể Loại</h5>
						 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
					</div>
					<div class="modal-body">
					<span>Bạn có muốn xóa thể loại : </span><span id="alertDelete"></span>
					
						
				</div>
				<div class="modal-body">
				<p class="alert" id="alertNoDelete" style="margin: 0; padding: 0;"></p>
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
						<h5 class="modal-title">Sửa Thể Loại</h5>
						 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
       				   <span aria-hidden="true">&times;</span>
					</div>
					<div class="modal-body">
						<h6 >
							Tên Thể Loại
							
						</h6>
					
						
						<input type="text"  id="edit-name" style="width: 100%" />
						<p class="alert" id = "alert_name" style="margin: 0; padding: 0;"> </p>	
						</div>
						<div class="modal-footer">					
						<button type="button" class="btn btn-primary" id="edit"
								 data-button="edit">Đồng Ý</button>
						<button type="button" id="reset-edit" class="btn btn-default">Phục Hồi</button>
							
						</div>
				</form>
			</div>
		</div>
		
		<div class="modal fade" id="addViewContentModal" tabindex="-1" role="dialog"
			aria-hidden="true" >
			<div class="modal-dialog" role="document">
				<form class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Thêm Thể Loại</h5>
						 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
					</div>
					<div class="modal-body">
						<h6 >
							Tên Thể Loại
							
						</h6>
					
						
						<input type="text"  id="text-name" style="width: 100%" />
						<p class="alert" id = "alertadd_name" style="margin: 0; padding: 0;"> </p>
						</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="add"
								 data-button="add">Đồng Ý</button>
							<button type="reset" id="reset-add" class="btn btn-default">Phục Hồi </button>
							
						</div>
				</form>
			</div>
		</div>
		

	</div>
	<script>
	$(document).ready(function() {

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
				url : "/ShopSmartPhone/categoryServlet",
				data : {
					id : id,
					dataButton : dataButton
				},
				success : function(response) {
					if (response == "success") {
						$("#deleteModal").modal('hide')
						$('.modal-backdrop').remove() 
						//$("#content").load("../Admin/CategoryAdmin.jsp")
						t.remove();
					}
					else if(response == "fail"){
						$('#alertNoDelete').html('(* Đã có lỗi xảy ra *)')
					}
				}
			});
		})
		
		//bắt sự kiện click nút Add trong table 
		$(".btn-addcontent").click(function() {
			$("#addViewContentModal").modal('show')
			
			$("#text-name").keypress(function() {
				$("#alertadd_name").html('')
			})
		})
		$("#add").click(function() {
			var name = $('#text-name').val()
			var dataButton = $(this).attr('data-button')
			var flag = 0;
			if(name.trim()==""){
            	$("#alertadd_name").html('(* Bạn cần điền tên thể loại *)')
            	flag=1;
            }
	        if(flag == 0){
	        	console.log(name)
			$.ajax({
				type : "post",
				url : "/ShopSmartPhone/categoryServlet",
				data:{
					name : name,
					dataButton: dataButton
				},
				success : function(response) {
					if (response == "success") {
						$("#addViewContentModal").modal('hide')
						$('.modal-backdrop').remove() 
						$("#content").load("../Admin/CategoryAdmin.jsp")
					}
					else if(response == "exist"){
						$("#alertadd_name").html('(* Đã tồn tại tên thể loại này *)')
					}
					else if(response == "fail"){
						$("#alertadd_name").html('(* Đã xảy ra lỗi *)')
					}
				}
			});
			
	       }
	    	
		})
		//bắt sự kiện click nút Edit trong table 
		$(".btn-edit").click(function() {
			$("#editPostModal").modal('show')
			t = $(this).parent().parent('tr');
			var id = $(this).attr("data-id")
			var name = $(this).attr("data-name")
			$("#reset-edit").click(function(){
				$('#edit-name').val(name)
			})
			
			$('#edit').val(id)
			$('#edit-name').val(name)

			$("#edit-name").keypress(function() {
				$("#alert_name").html('')
			})

		})
		//bắt sự kiện click OK
		$("#edit").click(function() {
			var id = $('#edit').val()
			var name = $('#edit-name').val()
			var dataButton = $(this).attr('data-button')
			var flag = 0;
			var idedit= "#btn-edit"+id
			 if(name.trim()==""){
	            	$("#alert_name").html('(* Bạn cần điền tên thể loại *)')
	            	flag = 1;
	            }

	        if(flag == 0){
			$.ajax({
				type : "post",
				url : "/ShopSmartPhone/categoryServlet",
				data : {
					id : id,
					name : name,
					dataButton : dataButton
				},
				success : function(response) {
					if (response == "success") {
						$("#editPostModal").modal('hide')
						$('.modal-backdrop').remove()  
						$(idedit).attr('data-name',name)
						t.find('.colName').html(name)
					}
					else if(response == "exist"){
						$("#alert_name").html('(* Đã tồn tại tên thể loại này *)')
					}
					else if(response == "fail"){
						$("#alert_name").html('(* Đã có lỗi xảy ra *)')
					}
				}
			});
			
	       }
	    	
		})

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
		
	})
	
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
		var totalRows = <%=listCategories.size()%>; // Tổng số sản phẩm hiển thị
		var btnPage = Math.ceil(<%=listCategories.size()%>/pageSize); ; // Số nút bấm hiển thị di chuyển trang
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