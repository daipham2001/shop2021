
$(document).ready(function(){
	function isEmail(email) {
		var isValid = false;
		var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if(regex.test(email)) {
			isValid = true;
		}
		return isValid;
	}
	/*phần đăng nhập*/
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
				url: "/ShopSmartPhone/loginServlet",
				data: {
					email : email,
					pass : pass
				},
				success : function(response){
					if(response=="success"){
						 location.reload();
					}
					else if(response=="wrong"){
						$("#pass_alert").html("(*) Sai email hoặc mật khẩu! ")
					} 
				}
			});
		}
	})
	
	/*phần đăng kí*/
	
	$("#textNameRegister").keypress(function(){
		$("#name_alertRegister").html('')
		$("#rePass_alertRegister").html('')
	})
       $("#textEmailRegister").keypress(function(){
		$("#email_alertRegister").html('')
		$("#rePass_alertRegister").html('')
	})
		$("#textPasswordRegister").keypress(function(){
		$("#pass_alertRegister").html('')
		$("#rePass_alertRegister").html('')
	})
	$("#textRePasswordRegister").keypress(function(){
		$("#rePass_alertRegister").html('')
	})
	$("#btnRegister").click(function(){
		var flag=0
		var name= $("#textNameRegister").val()
		var email= $("#textEmailRegister").val()
		var pass= $("#textPasswordRegister").val()
		var rePass= $("#textRePasswordRegister").val()
	 	if(email.trim()==''){
			$("#email_alertRegister").html("(*)Email không được để trống! ")
			flag=1
		}
		 if(email.trim() !="" && isEmail(email)==false){
				$("#email_alertRegister").html('(*)Sai định dạng email');
				flag=1
			} 
		if(pass.trim()==''){
			$("#pass_alertRegister").html("(*)Mật khẩu không được để trống! ")
			flag=1
		} 
		if(name.trim()==''){
			$("#name_alertRegister").html("(*)Họ và tên không được để trống! ")
			flag=1
		}
		if(rePass.trim()==''){
			$("#rePass_alertRegister").html("(*)Mật khẩu không được để trống! ")
			flag=1
		}
		 if(pass.trim()!="" && pass.length<8 ){
         	$("#pass_alertRegister").html('(*)Mật khẩu phải trên 8 kí tự')
         	flag=1;
         }
		 if(pass!=rePass){
			 $("#rePass_alertRegister").html('(*)Mật khẩu không khớp')
	         	flag=1;			 
		 }
		 
		 
		if(flag==0){
			$.ajax({
				type: "post",
				url: "/ShopSmartPhone/registerServlet",
				data: {
					name : name,
					email : email,
					pass : pass,
				},
				success : function(response){
					if(response=="success"){
						 location.reload();
						}
					else if(response=="noExist"){
						$("#email_alertRegister").html("(*)Email không có thực! ")
					}
					else if(response=="wrong"){
						$("#rePass_alertRegister").html("(*)Đăng kí không thành công! ")
					} 
					else if(response=="email_trung"){
						$("#email_alertRegister").html("(*)Email đã được đăng kí!")
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