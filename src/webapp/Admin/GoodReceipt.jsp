
<%@page import="com.project.ecommerce.dao.GoodReceiptDAO"%>
<%@page import="com.project.ecommerce.model.GoodReceipt"%>
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
	GoodReceipt goodReceipt= new GoodReceipt();
	GoodReceiptDAO goodReceiptDAO= new GoodReceiptDAO();
	List<GoodReceipt> listGoodReceipts = new ArrayList<>();
	DecimalFormat formatter = new DecimalFormat("###,###.00");
	%>
	<h2 style= "margin-right: 500px;" class="Title-view">Phiếu Nhập</h2>
		<button data-button="addReceipt" id="btnAddReceipt" class="btn btn-primary">Thêm Phiếu Nhập</button>
	
	<div class="search-ifo">
		<input id="text-Search" placeholder="Search...">
		<button id="btn-Search">
			<i class="fas fa-search"></i>
		</button>

	</div>

	<div class="clear-float"></div>
	<hr style="margin-top: 0px;">
     <div class="content-page">

		<p class="head-table">Danh sách phiếu nhập</p>

		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >
			
					<tr>
						<th style="width: 10%">Mã Phiếu Nhập</th>
						<th style="width: 30%">Nhân Viên Lập</th>
						<th style="width: 30%">Ngày Lập Phiếu</th>
						<th style="width: 20%">Tổng tiền ($)</th>
						<th style="width: 5%"></th>
						<th style="width: 5%"></th>
						</tr>
				 	<%
				 	listGoodReceipts= goodReceiptDAO.listGoodReceipts();
					  for (int i = 0; i < listGoodReceipts.size(); i++) {  
						  int idGoodReceipt =listGoodReceipts.get(i).getId();
						  String created_date=listGoodReceipts.get(i).getCreated_date();
						  int total= listGoodReceipts.get(i).getTotal();
						  int employeeID=listGoodReceipts.get(i).getEmployeeID();
						  employee= employeeDAO.employeeByID(employeeID);
						  String employeeName= employee.getName();
							
					
					%> 
					<tr style="height:50px" class="contentPage tableViewContent" >
					
						<td ><%=idGoodReceipt%></td>
						<td class="colNgayDat"><%=employeeName%></td>
						<td class="colTotal"><%=created_date%></td>
						<td class="colInfo">$<%=formatter.format(total) %>
						</td>
						<td>
							<button <% if(total>0 || user.getId()!=employeeID){ %> style="display:none"<%} %>
							
							 id="btn-deleteReceipt" class="btn btn-deleteReceipt"
								data-id="<%=idGoodReceipt%>">Xóa</button>
						</td>
						<td>
							<button id="btn-delete" class="btn btn-primary btn-delete"
								data-id="<%=idGoodReceipt%>"
								>Xem</button>
							
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
			<div class="modal fade" id="errorModal" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header" style="background-color:brown">
					<h5 class="modal-title">LỖI</h5>
				</div>
				<div class="modal-body">
					<p>Bạn đã lập phiếu vào ngày hôm nay</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="deleteModal" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header" >
					<h5 class="modal-title">Xóa Phiếu Nhập</h5>
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
		var totalRows = <%=listGoodReceipts.size()%>; // Tổng số sản phẩm hiển thị
		var btnPage = Math.ceil(<%=listGoodReceipts.size()%>/pageSize); ; 
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
		var idGoodReceipt = $(this).attr("data-id")
		$("#btn-ok").val(idGoodReceipt)
		$("#deleteModal").modal('show')
		$("#btn-ok").click(function(){
			var dataButton = "deleteGoodReceipt"
			var idGoodReceipt =$("#btn-ok").val()
			console.log(idGoodReceipt)
				$.ajax({
					type : "post",
					url : "/ShopSmartPhone/receiptServlet",
					data:{
						idGoodReceipt : idGoodReceipt,
						dataButton: dataButton
					},
					success : function(response) {
						if (response == "success") {
							$('.modal-backdrop').remove()
							$("#content").load("../Admin/GoodReceipt.jsp")
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
			    $(".tableViewContent td.colNgayDat:containsNC('" +a + "')").parent().show();
		        $(".tableViewContent td.colNgayDat:not(:containsNC('" +a+ "'))").parent().hide();
		})
		

 	$(".btn-delete").click(function() {
			
			var id = $(this).attr("data-id")
			 
						$("#content").load("../Admin/GoodReceiptDetail.jsp?id="+id)
		
		})
		 
		//bắt sự kiện click nút Add trong table 
			$("#btnAddReceipt").click(function() {
				var dataButton = $(this).attr("data-button")
				$.ajax({
					type : "post",
					url : "/ShopSmartPhone/receiptServlet",
					data:{
						dataButton: dataButton
					},
					success : function(response) {
						if (response == "success") {
							$("#content").load("../Admin/GoodReceipt.jsp")
						}
						else if(response == "fail"){
							alert("đã có lỗi xảy ra")
						}
						else if(response=="exist"){
							$("#errorModal").modal('show')
						}
					}
				});	
		    	
			})
	})

	
</script> 
</body>
</html>