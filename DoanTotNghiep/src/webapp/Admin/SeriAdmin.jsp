
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
<script>
 $(document).ready(function(){
	
	 $("#btn_addSeri").click(function(){
		  var seri=$(this).attr("data-seri")
		  var seriProductID=$(this).attr("data-seriProductID")
		  var dataButton=$(this).attr("data-button")
		  var flag=0
		 for(var i=1;i<=seri;i++){
			 var str="#seriProduct"+i
			 var alert="#alert_seriProduct"+i
			 var seriID=$(str).val()
			 if(seriID.trim()==''){
				 $(alert).html('(* Bạn cần nhập số seri *)');
				 flag=1
			 }
			 if($(str).val().trim()!=''){
				 $(alert).html('');
			 }
			
			 }
		  if(flag==0){
			  for(var i=1;i<=seri;i++){
					 var str="#seriProduct"+i
					 var alert="#alert_seriProduct"+i
					 var seriID=$(str).val()
					 
				$.ajax({
					type : "post",
					url : "/ShopSmartPhone/seriServlet",
					data : {
						seriID : seriID,
						seriProductID : seriProductID,
						dataButton : dataButton
					},
					success : function(response) {
						if (response == "success") {
						 	$("#editModal").modal('show')
								$("#btn-ok").click(function(){
									$('.modal-backdrop').remove()
									$("#content").load("../Admin/GoodReceipt.jsp")											
									}) 
						}
						if(response == "fail"){
							
						}
					}
				});
			  }
				
		 }	
	
	 })
 })
</script>
</head>
<body>
	<%
	Employee user = (Employee) session.getAttribute("employeeSession");
	 if(user == null){			
		response.sendRedirect("LoginAdmin.jsp");
		return;
	} 
	 
	%>
	<h2 class="Title-edit">Nhập Seri Sản Phẩm</h2>
<% int seri= (int) session.getAttribute("seri");
		String seriProductID= (String) session.getAttribute("seriProductID");
		for(int i=1;i<=seri;i++){
			
		%>
		<h5>Seri Sản Phẩm <%=i %></h5>
		<input id="seriProduct<%=i%>" class="col-3" type="text" style="height:30px"
		placeholder="Nhập seri" >
		<p style="margin-left: 15px;" class="alert" id="alert_seriProduct<%=i%>"></p>
		<%
		}%>
		<div style="padding: 20px;">
		<button data-seri=<%=seri %> data-seriProductID=<%=seriProductID %> 
		data-button="add"
		id="btn_addSeri" class="btn btn-primary">Đồng ý</button>
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
					<button type="button" id="btn-ok" class="btn btn-primary"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>