<%@page import="java.text.DateFormat"%>
<%@page import="com.project.ecommerce.dao.GoodReceiptDetailDAO"%>
<%@page import="com.project.ecommerce.model.GoodReceiptDetail"%>
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
<%@page import="java.util.Date"%>
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
	GoodReceiptDetail goodReceiptDetail= new GoodReceiptDetail();
	GoodReceiptDetailDAO goodReceiptDetailDAO= new GoodReceiptDetailDAO();
	GoodReceipt goodReceipt= new GoodReceipt();
	GoodReceiptDAO goodReceiptDAO= new GoodReceiptDAO();
	Product product= new Product();
	ProductDAO productDAO= new ProductDAO();
	String idgoodReceiptString= request.getParameter("id");
	goodReceipt=goodReceiptDAO.goodReceiptById(Integer.parseInt(idgoodReceiptString));
	List<GoodReceiptDetail> listGoodReceiptDetail = new ArrayList<>();
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	Date dateGoodReceipt = formatter.parse(goodReceipt.getCreated_date());
	Date date = new Date();
	DateFormat formatdateCurrent = new SimpleDateFormat("dd/MM/yyyy");
	String dateCurrentFormatString= formatdateCurrent.format(date);
	Date dateCurrent = formatter.parse(dateCurrentFormatString);
	DecimalFormat formatterPrice = new DecimalFormat("###,###.00");
	
	%>
	<span id="backtoGoodReceipt" style="float:left; cursor:pointer"><i class="fas fa-backward"></i>  Quay về Phiếu Nhập </span></br>
	<h2 style= "margin-right: 300px;" class="Title-view">Chi Tiết Phiếu Nhập <%=goodReceipt.getCreated_date()%></h2>
		<button data-button="addReceipt"  class="btn btn-primary"
		<%if(dateCurrent.compareTo(dateGoodReceipt)>0 ){ %>
		id="noAdd" <% }else { if(user.getId()!=goodReceipt.getEmployeeID()){ %> id="canAdd"<%}else{ %>id="btnAddProduct"<%} } %>
		 data-id=<%=idgoodReceiptString %>>Thêm Sản Phẩm</button>
	
	<div class="search-ifo">
		<input id="text-Search" placeholder="Search...">
		<button id="btn-Search">
			<i class="fas fa-search"></i>
		</button>

	</div>

	<div class="clear-float"></div>
	<hr style="margin-top: 0px;">
     <div class="content-page">

		<p class="head-table">Danh sách chi tiết phiếu nhập</p>

		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >
			
					<tr>
						<th style="width: 5%">ID</th>
						<th style="width: 20%">Mã Sản Phẩm</th>
						<th style="width: 30%">Tên Sản Phẩm</th>
						<th style="width: 20%">Giá ($)</th>
						<th style="width: 15%">Số Lượng (cái)</th>
						</tr>
				 	<%
				 	listGoodReceiptDetail= goodReceiptDetailDAO.listGoodReceiptDetailbyID(Integer.parseInt(idgoodReceiptString));
					  for (int i = 0; i < listGoodReceiptDetail.size(); i++) {  
						  int idGoodReceiptDetail =listGoodReceiptDetail.get(i).getId();
						  int price= listGoodReceiptDetail.get(i).getPrice();
						  int quantity=listGoodReceiptDetail.get(i).getQuantity();
						  String productID= listGoodReceiptDetail.get(i).getProductID();
						  product = productDAO.productbyID(productID);	
					%> 
					<tr style="height:50px"  class="contentPage tableViewContent" >
					
						<td ><%=idGoodReceiptDetail%></td>
						<td class="colTotal"><%=productID%></td>
						<td class="colName"><%=product.getName() %>
						</td>
						<td >$<%=formatterPrice.format(price)%></td>
						<td ><%=quantity%></td>

					</tr>
				
				<%
					}
				%>
			</table>
			
		</div>
		
		<ul style="margin-top: 20px" id="pagination" class="justify-content-center">
	  	</ul>
	
	</div> 
		<div class="modal fade" id="noAddModal" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header" style="background-color:brown">
					<h5 class="modal-title">LỖI</h5>
				</div>
				<div class="modal-body">
					<p>Không thể thêm sản phẩm vì phiếu nhập đã qua ngày</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="canAddModal" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header" style="background-color:brown">
					<h5 class="modal-title">LỖI</h5>
				</div>
				<div class="modal-body">
					<p>Không thể thêm sản phẩm vì đây không phải là phiếu của bạn</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-dismiss="modal">OK</button>
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
		var totalRows = <%=listGoodReceiptDetail.size()%>; // Tổng số sản phẩm hiển thị
		var btnPage = Math.ceil(<%=listGoodReceiptDetail.size()%>/pageSize); ; // Số nút bấm hiển thị di chuyển trang
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
		$("#backtoGoodReceipt").click(function(){
			$("#content").load("../Admin/GoodReceipt.jsp")
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
		 
		//bắt sự kiện click nút thêm sản phẩm
		$("#btnAddProduct").click(function(){
			var id= $(this).attr("data-id")
			$("#content").load("../Admin/NewReceipt.jsp?id="+id)
		})
		$("#noAdd").click(function(){
			$("#noAddModal").modal('show')
			
		})
		$("#canAdd").click(function(){
			$("#canAddModal").modal('show')
			
		})
	})

	
</script> 
</body>
</html>