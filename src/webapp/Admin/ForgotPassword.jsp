<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay Đổi Mật Khẩu</title>
</head>
<body>
	<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../Css/Fstyle.css">
</head>
<style>
body  {
  background-image: url("../img/header/background.jpg");
}
</style>
<script>
  $(document).ready(function(){
		$("#passForgot").keypress(function() {
    		$("#alert-passForgot").html('');
    	});
    	$("#repeatPassForgot").keypress(function() {
    		$("#alert-repeatPassForgot").html('');
    	});
        $("#savePassword").click(function(){
        			var flag=0
                    var passForgot=$("#passForgot").val()
                    var repeatPassForgot=$("#repeatPassForgot").val()
                    var dataButton= $(this).attr("data-button")
                    console.log(passForgot)
                    if (passForgot.trim()==''){
                    	$("#alert-passForgot").html('(* Bạn cần điền mật khẩu mới! *)')
                    	flag=1
                    }
                    if (repeatPassForgot.trim()== ''){
                    	$("#alert-repeatPassForgot").html('(* Bạn cần nhập lại mật khẩu mới! *)')
                    	flag=1
                    }
                    if((passForgot.length >20 || passForgot.length <8) && passForgot != ""){
                    	$("#alert-passForgot").html('(* Mật khẩu phải nằm trong khoảng 8 tới 20 kí tự ! *)')
                    	flag=1
                    }
                    if(repeatPassForgot != passForgot){
                    	$("#alert-repeatPassForgot").html('(* Mật khẩu chưa khớp! *)')
                    	flag=1
                    }
                    if(flag==0){
                    		var email = "<%=request.getParameter("email")%>"
											$.ajax({
														type : "post",
														url : "/ShopSmartPhone/forgotPasswordServlet",
														data : {
															pass : passForgot,
															email : email,
															dataButton : dataButton
														},
														success : function(
																response) {
															if (response == "success") {
																window.location.href = "http://localhost:8090/ShopSmartPhone/Admin/LoginAdmin	.jsp";
															}
															else if (response == "fail"){
																$("#alert-repeatPassForgot").html('(* Đã có lỗi xảy ra *)')
															}
														}
													})
                    						}

							})

					})
</script>
<body>
 <%
		String email= request.getParameter("email");
		if(email == null){			
			response.sendRedirect("LoginAdmin.jsp");
			return;
		}
	%> 

<section style="margin-top:30px;">
		<div class="container login">
		
			
		<div class=" formLogin" style="margin-top:120px">
		<form id="form-login" > 
		<h3 style="text-align:center;margin-bottom:20px; margin-top:20px">THAY ĐỔI MẬT KHẨU</h3>
		<div class="form-group">
				<label>Mật khẩu mới</label>
				<input type="password" id="passForgot"
					placeholder="Nhập mật khẩu mới">
					<p id="alert-passForgot" class="alert" style="magrin-bottom:0;padding: 10px 0px 0px 0px"></p>

			</div>

			<div class="form-group">
				<label>Nhập lại mật khẩu</label>
				<input type="password" id="repeatPassForgot"
					placeholder="Nhập lại mật khẩu">
					<p id="alert-repeatPassForgot" class="alert" style="magrin-bottom:0;padding: 10px 0px 0px 0px"></p>
	
			</div>

			<div class="form-group">

				<p>Để xác nhận thay đổi mật khẩu. Xin vui lòng click vào nút phía dưới</p>
			</div>

			<div class="form-group">

				<button class="btn-login" type="button" data-button="changePass" id="savePassword"
					>XÁC NHẬN</button>

			</div>
		</form>
		<div class="clear-float"></div>
	</div>
	</div>
	</section>
</body>
</html>