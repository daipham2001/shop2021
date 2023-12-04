<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShopSmartPhone</title>
<meta charset="UTF-8">
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
<style>
body  {
  background-image: url("../img/header/background.jpg");
}
</style>
<script>
$(document).ready(function(){
	function isEmail(email) {
		var isValid = false;
		var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if(regex.test(email)) {
			isValid = true;
		}
		return isValid;
	}
	$("#textEmail").keypress(function(){
		$("#email_alert").html('')
		$("#pass_alert").html('')
	})
		$("#textPassword").keypress(function(){
		$("#pass_alert").html('')
	})
	$("#btnLogin").click(function(){
		var flag=0
		var email= $("#textEmail").val()
		var pass= $("#textPassword").val()
	 	if(email.trim()==''){
			$("#email_alert").html("(*)Email không được để trống! ")
			flag=1
		}
		if(pass.trim()==''){
			$("#pass_alert").html("(*)Mật khẩu không được để trống! ")
			flag=1
		} 
		 if(email.trim() !="" && isEmail(email)==false){
				$("#email_alert").html('(*)Sai định dạng email');
				flag=1
			} 
		if(flag==0){
			$.ajax({
				type: "post",
				url: "/ShopSmartPhone/loginAdminServlet",
				data: {
					email : email,
					pass : pass
				},
				success : function(response){
					if(response=="success"){
						window.location.href = "http://localhost:8090/ShopSmartPhone/Admin/HomeAdmin.jsp";
					}
					else if(response=="wrong"){
						$("#pass_alert").html("(*) Sai email hoặc mật khẩu! ")
					} 
				}
			});
		}
	})
	
	$('#forgot-password').click(function(){
		$("#forgotModal").modal('show')
		$("#emailForgot").keypress(function() {
		$("#alert-emailForgot").html('')
		$("#alert-emailSuccess").html('')
		})
 		
		 $('#sendForgot').click(function(){
			 	var flag=0
				var email= $("#emailForgot").val()
				var dataButton= $(this).attr("data-button")
				if(email.trim() == ""){
					$("#alert-emailForgot").html('(* Bạn cần điền email của bạn *)');
					$("#alert-emailSuccess").html('')
					flag=1
				}
				 if(email.trim() !="" && isEmail(email)==false){
					$("#alert-emailForgot").html('(* Email không đúng định dạng *)');
					$("#alert-emailSuccess").html('')
					flag=1
				} 
				if(flag==0){
						 $.ajax({
							type : "post",
							url : "/ShopSmartPhone/forgotPasswordServlet",
							data : {
								email : email,
								dataButton : dataButton
							},
							success : function(response) {
								console.log(response)
								if (response == "success") {
									$("#alert-emailSuccess").html('(*  Mail đã được gửi! Bạn hãy kiểm tra *)')
									
								}
								else if (response == "fail"){
										
									$("#alert-emailForgot").html('(* Email này chưa được đăng kí *)')
								}
								
							}
						}); 
				}
		})  
	})
	
})


</script>
</head>
<body>
<section style="margin-top:30px;">
		<div class="container login">
		
			
		<div class=" formLogin" style="margin-top:120px">
		<form id="form-login" > 
		<h3 style="text-align:center;margin-bottom:20px; margin-top:20px">QUẢN LÍ BÁN HÀNG</h3>
			<div class="form-group">

				<label >E-mail </label>
				<input placeholder="Vui lòng nhập email của bạn" type="text" id="textEmail"  class="form-control" >
					<span class= "alert" id= "email_alert"> </span>
			
					

			</div>
			
			<div class="form-group">
				<label >Mật Khẩu </label>
				<input placeholder="Vui lòng nhập mật khẩu của bạn" type="password" id="textPassword"  class="form-control">
					<span class= "alert" id= "pass_alert"></span>

			</div>
            <a id="forgot-password" href="#" style="float:left">Quên mật khẩu?</a>
			<div class="form-group">
		    <button class="btn-login" type="button" id="btnLogin" >Đăng nhập</button>

			</div>
		</form>
		<div class="clear-float"></div>
		</div>
		</div>
					<div class="modal fade" id="forgotModal" role="dialog" style="display: none;top:150px">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content" style="border: 1px solid lightgray;width:80%;margin:auto">
			<div class="modal-header" style="background-color: #F5F5F5">
						<h2 class="modal-title" style="color:black" >Quên Mật Khẩu</h2>
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
					<button data-button="forgotPass" class="btn btn-primary" id="sendForgot">Gửi</button>
					</div>
					</form>
				</div>
				
			</div>
		</div>
	</div> 

</section>

</body>
</html>