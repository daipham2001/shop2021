
<%@page import="com.project.ecommerce.dao.ProductDAO"%>
<%@page import="com.project.ecommerce.model.Product"%>
<%@page import="com.project.ecommerce.dao.Promotion_detailDAO"%>
<%@page import="com.project.ecommerce.model.Promotion_detail"%>
<%@page import="com.project.ecommerce.dao.PromotionDAO"%>
<%@page import="com.project.ecommerce.model.Promotion"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.project.ecommerce.dao.CustomerDAO"%>
<%@page import="com.project.ecommerce.model.Customer"%>
<%@page import="com.project.ecommerce.dao.EmployeeDAO"%>
<%@page import="com.project.ecommerce.model.Employee"%>
<%@page import="com.project.ecommerce.dao.OrderDAO"%>
<%@page import="com.project.ecommerce.model.Order"%>
<%@page import="com.project.ecommerce.dao.BrandDAO"%>
<%@page import="com.project.ecommerce.model.Brand"%>
<%@page import="com.project.ecommerce.dao.CategoryDAO"%>
<%@page import="com.project.ecommerce.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../Js/jquery.twbsPagination.js" type="text/javascript"></script>


<style><%@include file="../CssAdmin/fstyle.css"%></style> 

<meta charset="UTF-8">
<title>Promotion</title>

</head>
<body>
	 <%
		Employee user = (Employee) session.getAttribute("employeeSession");
		 if(user == null){			
			response.sendRedirect("LoginAdmin.jsp");
			return;
		} 
	Employee employee= new Employee();
	EmployeeDAO employeeDAO= new EmployeeDAO();
	Promotion promotion= new Promotion();
	PromotionDAO promotionDAO= new PromotionDAO();
	List<Promotion> listPromotions = new ArrayList<>();
	Promotion_detail promotion_detail= new Promotion_detail();
	Promotion_detailDAO promotion_detailDAO= new Promotion_detailDAO();
	List<Promotion_detail> listPromotion_detail = new ArrayList<>();
	%>
	<h2 style= "margin-right: 480px;" class="Title-view">Đợt Giảm Giá</h2>
		<button class="btn-addcontent btn btn-primary">Thêm Đợt Giảm Giá</button>
	
	<div class="search-ifo">
		<input id="text-Search" placeholder="Search...">
		<button id="btn-Search">
			<i class="fas fa-search"></i>
		</button>

	</div>

	<div class="clear-float"></div>
	<hr style="margin-top: 0px;">
     <div class="content-page">

		<p class="head-table">Danh sách Đợt Giảm Giá</p>

		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >
			
					<tr>
						<th style="width: 5%">ID</th>
						<th  style="width: 35%">Lí do giảm giá</th>
						<th style="width: 15%">Ngày Bắt Đầu</th>
						<th style="width: 15%">Ngày Kết Thúc</th>
						<th style="width: 20%">Nhân Viên Lập</th>
						<th style="width: 5%"></th>
						<th style="width: 5%"></th>
						</tr>
				 	<%
						listPromotions= promotionDAO.listPromotion();
					  for (int i = 0; i < listPromotions.size(); i++) {  
						  int idPromotion=listPromotions.get(i).getId();
						  String dateStart=listPromotions.get(i).getDateStart();
						  String dateEnd=listPromotions.get(i).getDateEnd();
						  int employeeID=listPromotions.get(i).getEmployeeID();
						  employee= employeeDAO.employeeByID(employeeID);
						  String employeeName= employee.getName();
						  int count= promotion_detailDAO.countPromotion_detailbyID(idPromotion);
						  String reason= listPromotions.get(i).getReason();
							
					
					%> 
					<tr style="height:50px" class="contentPage tableViewContent" >
					
						<td ><%=idPromotion%></td>
						<td class="colReason" ><%=reason%></td>
						<td ><%=dateStart%></td>
						<td ><%=dateEnd%></td>
						<td ><%=employeeName %>
						</td>
						<td>
							<button <% if(count>0){ %> style="display:none"<%} %>
							 id="btn-deleteReceipt" class="btn btn-deleteReceipt"
								data-id="<%=idPromotion%>">Xóa</button>
						</td>
						<td>
							<button id="btn-delete" class="btn btn-delete btn-primary"
								data-id="<%=idPromotion%>">Xem</button>
							
						</td>

					</tr>
				
				<%
					}
				%>
			</table>
			
		</div>
		
		<ul style="margin-top: 20px" id="pagination" class="justify-content-center">
	  	</ul>
	
	</div> 
    
  
		<div class="modal fade" id="addViewContentModal" tabindex="-1" role="dialog"
			aria-hidden="true" >
			<div class="modal-dialog" role="document">
				<form class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Thêm Đợt Giảm Giá</h5>
						 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
					</div>
					<div class="modal-body">
					<h6 >
							Lí do khuyến mãi
							
						</h6>
					
						
						<input type="text"  id="textReason" style="width: 100%" />
						<p class="alert" id = "alertReason" style="margin: 0; padding: 0;"> </p>
					<h6> Ngày bắt đầu giảm giá</h6>
						<input type="date" id="dateStart" >
						<h6> Ngày kết thúc giảm giá</h6>
						<input type="date" id="dateEnd">
					
						
						<p class="alert" id = "alertdate" style="margin: 0; padding: 0;"> </p>
						</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="add"
								 data-button="add">Đồng Ý</button>
							<button type="reset" id="reset-add" class="btn btn-default">Phục Hồi </button>
							
						</div>
				</form>
			</div>
		</div>
			<div class="modal fade" id="deleteModal" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header" >
					<h5 class="modal-title">Xóa Đợt Giảm Giá</h5>
				</div>
				<div class="modal-body">
					<p>Bạn có chắc chắn muốn xóa không ? </p>
				</div>
				<div class="modal-footer">
					<button type="button" id="btn-ok" class="btn btn-primary">Đồng Ý</button>
						<button type="button" class="btn"
						data-dismiss="modal">Hủy</button>
				</div>
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
		var totalRows = <%=listPromotions.size()%>; // Tổng số sản phẩm hiển thị
		var btnPage = Math.ceil(<%=listPromotions.size()%>/pageSize); ; // Số nút bấm hiển thị di chuyển trang
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
	//bắt sự kiện click nút Xóa trong table 
		$(".btn-deleteReceipt").click(function(){
			var idPromtion = $(this).attr("data-id")
			$("#btn-ok").val(idPromtion)
			$("#deleteModal").modal('show')
			$("#btn-ok").click(function(){
				var dataButton = "deletePromotion"
				var idPromotion =$("#btn-ok").val()
					$.ajax({
						type : "post",
						url : "/ShopSmartPhone/promotionServlet",
						data:{
							idPromotion : idPromotion,
							dataButton: dataButton
						},
						success : function(response) {
							if (response == "success") {
								$('.modal-backdrop').remove()
								$("#content").load("../Admin/PromotionAdmin.jsp")
							}
							else if(response == "fail"){
								alert("đã có lỗi xảy ra")
							}
						}
					});	
			})
			
		})
		
		//hàm chuyển các giá trị trong col thành chữ thường LowerCase()
		$.extend($.expr[":"], {"containsNC": function(elem, i, match, array) {
        return (elem.textContent || elem.innerText || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
			}
			});
		//bắt sự kiện search, giá trị nhập vào thành chữ thường 
		$("#btn-Search").click(function() {
			var a = $("#text-Search").val().toLowerCase();
			    $(".tableViewContent td.colReason:containsNC('" +a + "')").parent().show();
		        $(".tableViewContent td.colReason:not(:containsNC('" +a+ "'))").parent().hide();
		})
		

	$(".btn-delete").click(function() {
			
			var id = $(this).attr("data-id")
			var dataButton = "viewDetail"
			$.ajax({
				type : "post",
				url : "/ShopSmartPhone/promotionDetailServlet",
				data : {
					promotionID : id,
					dataButton : dataButton
				},
				success : function(response) {
					if (response == "success") {	
						
						$("#content").load("../Admin/PromotionDetail.jsp")
					}
				}
			});
		})
		
		//bắt sự kiện click nút Add trong table 
			$(".btn-addcontent").click(function() {
			
				$("#addViewContentModal").modal('show')
			})
				$("#textReason").keypress(function() {
				$("#alertReason").html('')
			})
			$("#add").click(function() {
				var dateStart = $("#dateStart").val()
				var dataButton = $(this).attr('data-button')
				var dateEnd = $("#dateEnd").val()
				var reason= $("#textReason").val()
				
				var fullDate= new Date()
				var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) : '0' + (fullDate.getMonth()+1);
				var currentDate =  fullDate.getFullYear()+ "-" + twoDigitMonth + "-" + fullDate.getDate();
				var flag = 0;
				if(reason.trim()==""){
	            	$("#alertReason").html('(* Lí do không được để trống *)')
	            	flag=1;
	            }
				if(dateStart.trim()==""){
	            	$("#alertdate").html('(* Ngày bắt đầu không được để trống *)')
	            	flag=1;
	            }
				if(dateEnd.trim()==""){
	            	$("#alertdate").html('(* Ngày kết thúc không được để trống *)')
	            	flag=1;
	            }
				if(dateStart>dateEnd && dateStart.trim()!="" && dateEnd.trim()!=""){
					$("#alertdate").html('(* Ngày bắt đầu phải nhỏ hơn ngày kết thúc *)')
	            	flag=1;
				}
				if(dateStart<currentDate && dateStart.trim()!="" && dateEnd.trim()!=""){
					$("#alertdate").html('(* Ngày bắt đầu phải lớn hơn ngày hôm nay *)')
	            	flag=1;
				}
		        if(flag == 0){
		        	
				$.ajax({
					type : "post",
					url : "/ShopSmartPhone/promotionServlet",
					data:{
						reason: reason,
						dateStart : dateStart,
						dateEnd : dateEnd,
						dataButton: dataButton
					},
					success : function(response) {
						if (response == "success") {
							$("#addViewContentModal").modal('hide')
							$('.modal-backdrop').remove() 
							$("#content").load("../Admin/PromotionAdmin.jsp")
						}
						else if(response == "trung"){
							$("#alertadd_name").html('(* Trùng thể loại *)')
						}
					}
				});
				
		       }
		    	
			})
	})

	
</script> 
</body>
</html>