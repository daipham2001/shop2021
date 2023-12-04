
<%@page import="com.project.ecommerce.dao.EmployeeDAO"%>
<%@page import="com.project.ecommerce.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><style><%@include file="../CssAdmin/fstyle.css"%></style> 


<title>Edit Profile</title>
<script>

$(document).ready(function() {
					$("#nameEmployee").keypress(function() {
						$("#alert_nameEmployee").html('')
					})
					$("#phoneEmployee").keypress(function() {
						$("#alert_phoneEmployee").html('')
					})
					$("#addressEmployee").keypress(function() {
						$("#alert_addressEmployee").html('');
					});
					
					$("#btn_reset").click(function() {
						$('#content').load('EditProfile.jsp');
					})
					$("#submit_Edit").click(function() {
										var nameEmployee = $("#nameEmployee").val();
										var phoneEmployee = $("#phoneEmployee").val();
										var addressEmployee = $("#addressEmployee").val();
										var dataButton= $(this).attr("data-button")
										var id= $(this).attr("data-id")
										var result = 0;
										if (nameEmployee.trim() == '') {
											$("#alert_nameEmployee").html('(* Bạn cần điền tên của bạn  *)');
											result = 1;
										}
										
										if (addressEmployee.trim() == '') {
											$("#alert_addressEmployee").html('(* Bạn cần điền địa chỉ của bạn *)');
											result = 1;
										}
										if (phoneEmployee.trim() == '') {
											$("#alert_phoneEmployee").html('(* Bạn cần điền số điện thoại của bạn *)');
											result = 1;
										}
										
									
									if (result == 0) {
											$("#editModal").modal('show')
											$.ajax({
												url:"/ShopSmartPhone/editProfileServlet",
												type:"post",
												data:{
													id : id,
													address : addressEmployee,
													name : nameEmployee,
													phone : phoneEmployee,
													dataButton : dataButton
												},
												success:function(response){
													if(response == "success"){
														$("#btn-ok").click(function(){
																$('.modal-backdrop').remove()
																
														})
													}
												}
												
											});
										}
									});
					$("#changePass").click(function() {	
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
	<h2 class="Title-edit">Hồ Sơ Nhân Viên</h2>
	<div class="table-head">
		<table>
			<tr>
				<p>Thông Tin Nhân Viên</p>
			</tr>
		</table>
	</div>
	<div class="table-content" style="font-size:16px">
		<%
			Employee employee= new Employee();
			EmployeeDAO employeeDAO= new EmployeeDAO();
			employee= employeeDAO.employeeByID(user.getId());
		%>
		<h6>Họ và tên</h6>
		<input id="nameEmployee" class="col-5" type="text" placeholder="Nhập họ và tên"
			value="<%=employee.getName()%>">
		<p style="margin-left: 15px;" class="alert" id="alert_nameEmployee"></p>
		<h6>Email</h6>
		<input class="col-5" type="email" id="emailEmployee"
			placeholder="your_email@example.com" value="<%=employee.getEmail()%>"
			readonly>
		<h6>Điện Thoại</h6>
		<input id="phoneEmployee" class="col-5" type="number"
			placeholder="Nhập số điện thoại"  value="<%=employee.getPhone()%>">
		<p style="margin-left: 15px;" class="alert" id="alert_phoneEmployee"></p>
		<h6>Địa chỉ</h6>
		<input id="addressEmployee" class="col-5" type="text"
			placeholder="Nhập địa chỉ " value="<%=employee.getAddress()%>">
		<p style="margin-left: 15px;" class="alert" id="alert_addressEmployee"></p>
		
			<div style="margin-left:15px; margin-top:20px">
			<a id="changePass" href="#" >Change your password !</a>
			</div>
			<hr>
		<div style="margin-left:20px">
			<button data-id="<%=employee.getId() %>" data-button="editProfile" id="submit_Edit" class="btn btn-primary">Đồng Ý</button>
			<button id="btn_reset" class="btn">Phục Hồi</button>
		</div>
	</div>
	<div class="modal fade" id="editModal" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Sửa Thông Tin Nhân Viên</h5>
				</div>
				<div class="modal-body">
					<p>Thành Công!</p>
				</div>
				<div class="modal-footer">
					<button type="button" id="btn-ok" class="btn btn-primary"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="changePassword" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Thay đổi mật khẩu</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
				</div>
				<div class="modal-body">
					<h6>Mật khẩu hiện tại</h6>
					<input type="password" 
					id="oldpass" placeholder="Nhập mật khẩu hiện tại">
					<p class= "alert" id= "passwordResult" style="padding:0; margin:0"></p> 
						
					<h6>Mật khẩu mới</h6>
					<input type="password"  id="newpass" placeholder="Nhập mật khẩu mới">
					<p class= "alert" id="newPasswordResult"  style="padding:0; margin:0"></p> 
						
					<h6>Nhập lại mật khẩu mới</h6>
					<input type="password" 
					id="renewpass" placeholder="Nhập lại mật khẩu">
						<p class= "alert" id= "repasswordResult"  style="padding:0; margin:0"> </p> 
						
				</div>
				<div class="modal-footer">
					<button data-id="<%=employee.getId() %>" data-button="changePass" type="button" id="btnChange" class="btn btn-primary">Đồng Ý</button>
					<button id="resetChange" class="btn ">Phục Hồi</button>
				</div>
			</div>
		</div>
	</div>
		<div class="modal fade" id="changeSuccess" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Mật Khẩu</h5>
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
	</div>
</body>
</html>