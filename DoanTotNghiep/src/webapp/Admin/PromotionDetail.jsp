
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
	Promotion promotion= new Promotion();
	PromotionDAO promotionDAO= new PromotionDAO();
	List<Promotion> listPromotions = new ArrayList<>();
	Promotion_detail promotion_detail= new Promotion_detail();
	Promotion_detailDAO promotion_detailDAO= new Promotion_detailDAO();
	List<Promotion_detail> listPromotion_detail = new ArrayList<>();
	int a= (int) session.getAttribute("cmbPromotion"); 
	promotion= promotionDAO.PromotionByID(a);
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	Date dateEndPromotion = formatter.parse(promotion.getDateEnd());
	Date dateStartPromotion = formatter.parse(promotion.getDateStart());
	ProductDAO productDAO= new ProductDAO();
	Category category= new Category();
	CategoryDAO categoryDAO= new CategoryDAO();
	List<Category> lisCategories = new ArrayList<>();
	
	Date dateCurrent = new Date();
	
	%>
	<span id="backtoPromotion" style="float:left; cursor:pointer"><i class="fas fa-backward"></i> Quay về Đợt Giảm Giá</span><br>
	<h2 style= "margin-right: 100px;" class="Title-view">Chi Tiết Đợt Giảm Giá (<%=promotion.getDateStart() %> - <%=promotion.getDateEnd() %>)</h2>
		<button data-id=<%=a %> 
		<%if(dateCurrent.compareTo(dateEndPromotion)>0){ %>
		id="noAdd" <% }else { %> id="btn-addcontent"<%} %>
		class=" btn btn-primary" >Thêm Sản Phẩm</button>
	
	<div class="search-ifo">
		<input id="text-Search" placeholder="Search...">
		<button id="btn-Search">
			<i class="fas fa-search"></i>
		</button>

	</div>

	<div class="clear-float"></div>
	<hr style="margin-top: 0px;">
	


  
    <div class="content-page">

		<p class="head-table">Danh sách Chi Tiết Sản Phẩm Giảm Giá</p>
		
		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >
			
					<tr>
						<th style="width: 20%">Mã Sản Phẩm</th>
						<th style="width: 40%">Tên Sản Phẩm</th>
						<th style="width: 20%">Thể Loại</th>
						<th style="width: 10%">Giảm (%)</th>
						<th style="width: 5%"></th>
						<th style="width: 5%"></th>
						</tr>
				 	<%	  
				 
				 		
				 		listPromotion_detail= promotion_detailDAO.listPromotion_detailbyID(a);
				 			      
				 	      for (int i = 0; i < listPromotion_detail.size(); i++) {  
						  String productID= listPromotion_detail.get(i).getProductID();
						  int idPromotion= listPromotion_detail.get(i).getPromotionID();
						  int percent_promotion= listPromotion_detail.get(i).getPercent_promotion();
						  String productName= listPromotion_detail.get(i).getProcductName();
						  category = categoryDAO.categoryByidProduct(productID);
						  
						
					%> 
					<tr class="contentPage2 tableViewContent" >
					
						<td ><%=productID %></td>
						<td class="colName"><%=productName %></td>
						<td ><%=category.getName() %></td>	
						<td class="colPercent" ><%=percent_promotion%></td>
						<td >
						<button  id="btn-edit<%=i%>" class="btn btn-primary btn-edit"
						<%if(dateCurrent.compareTo(dateStartPromotion)>0){ %>
							style="display:none"
							<%} %>
								data-i="<%=i %>"
								data-productId="<%=productID%>" 
								data-promotionId="<%=idPromotion %>"
								data-name="<%=percent_promotion%>"
								data-ten="<%=productName %>"
						>Sửa</button>
						</td>
						<td>
						<button id="btn-delete<%=i%>" class="btn btn-delete"
						<%if(dateCurrent.compareTo(dateStartPromotion)>0){ %>
							style="display:none"
							<%} %>
								data-i="<%=i %>"
								data-name="<%=productName%>"
								data-productId="<%=productID%>" 
								data-promotionId="<%=idPromotion %>"
							>Xóa</button>
							
						</td>

					</tr>
				
				<%
					  }
				%>
			</table>
			
		</div>
		
		<ul style="margin-top: 20px;display: flex;" id="pagination2"  class="justify-content-center">
	  	</ul>
	</div> 
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
			aria-hidden="true" style="display: none">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Xóa Sản Phẩm Trong Đợt Giảm Giá</h5>
					</div>
					<div class="modal-body">
					<span>Bạn có muốn xóa </span><span id="alertDelete"> </span> <span>ra khỏi đợt giảm giá</span>
				</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
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
						<h5 class="modal-title">Sửa Sản Phẩm Trong Đợt Giảm Giá</h5>
						 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
					</div>
					<div class="modal-body">
					<h6 >
							Tên Sản Phẩm
							
						</h6>
					
						
						<input type="text" readonly id="edit-ten" style="width: 100%" />
						<h6 >
							Giảm (%)
							
						</h6>
					
						
						<input type="number"  id="edit-name" style="width: 100%" />
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
						<h5 class="modal-title">Thêm Sản Phẩm Giảm Giá</h5>
						 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
					</div>
					<div class="modal-body">
					
					<!-- --------- -->
						<p>Chọn Thể Loại</p>
						
							<select id="cmbCategory" onchange="cmbChanged()" style="margin-bottom:10px"> 
						<%  	lisCategories= categoryDAO.listCategory();
								for(int i=0;i<lisCategories.size();i++){
								int idCate= lisCategories.get(i).getId();
								String nameCate= lisCategories.get(i).getName();
								
							%>
 							 <option value="<%=idCate%>" ><%=nameCate%></option>
  							<%
							}
  							%>
						</select>
						<div id="cmbShowProduct">
						
						</div>
						<h6 >
							Giảm (%)
						</h6>
						<input type="number"  id="text-percent" style="width: 100%" />
						<p class="alert" id ="alertadd_percent" style="margin: 0; padding: 0;"> </p>
						</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="add"
								 data-button="add">Đồng Ý</button>
							<button type="reset" id="reset-add" class="btn btn-default">Phục Hồi </button>
							
						</div>
				</form>
			</div>
		</div>
<div class="modal fade" id="noAddModal" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header" style="background-color:brown">
					<h5 class="modal-title">LỖI</h5>
				</div>
				<div class="modal-body">
					<p>Không thể thêm sản phẩm vì đợt giảm đã hết</p>
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
			$(".contentPage2").hide();
			$(".contentPage2").each(function(n) {
				if (n >= pageSize * (page - 1) && n < pageSize * page)
					$(this).show();
			});        
		}
		showPage(1);
		///** Cần truyền giá trị vào đây **///
		var totalRows = <%=listPromotion_detail.size()%>; // Tổng số sản phẩm hiển thị
		var btnPage = Math.ceil(<%=listPromotion_detail.size()%>/pageSize) // Số nút bấm hiển thị di chuyển trang
		var iTotalPages = Math.ceil(totalRows / pageSize)

		var obj = $('#pagination2').twbsPagination({
			totalPages: iTotalPages,
			visiblePages: btnPage,
			onPageClick: function (event, page) {
				/* console.info(page); */
				showPage(page);
			}
		});
	}); 

	$(document).ready(function(){
		$("#backtoPromotion").click(function(){
			$("#content").load("../Admin/PromotionAdmin.jsp")
		})
		//bắt sự kiện click nút delete trong table 
		$(".btn-delete").click(function() {
			
			var i = $(this).attr("data-i")
			var name = $(this).attr("data-name")
			var str="#btn-delete"+i
			$('#delete').val(str);
			$('#alertDelete').html(name)
			$("#deleteModal").modal('show')
		})
		$("#delete").click(function() {
			
			
			var str = $('#delete').val();
			var idProduct = $(str).attr("data-productId")
			var idPromotion = $(str).attr("data-promotionId")
			var dataButton = $(this).attr('data-button');

			console.log(idProduct)
			console.log(idPromotion)
			console.log(dataButton)
			$.ajax({
				type : "post",
				url : "/ShopSmartPhone/promotionDetailServlet",
				data : {
					idProduct : idProduct,
					idPromotion : idPromotion,
					dataButton : dataButton
				},
				success : function(response) {
					if (response == "success") {
					 	
						$('.modal-backdrop').remove()
						$("#content").load("../Admin/PromotionDetail.jsp")
					}
				}
			});
		})
		$("#noAdd").click(function(){
			$("#noAddModal").modal('show')
			
		})
		//bắt sự kiện click nút Add trong table 
		$("#btn-addcontent").click(function() {
			var idPromotion= $(this).attr("data-id")
			$("#add").val(idPromotion)
			$("#addViewContentModal").modal('show')
			
			$("#text-percent").keypress(function() {
				$("#alertadd_percent").html('')
			})
		})
		$("#add").click(function() {
			var idPromotion= $('#add').val()
			var percent_promotion = $('#text-percent').val()
			var idProduct=$('#cmbProduct').val()
			var dataButton = $(this).attr('data-button')
			var flag = 0;
			if(percent_promotion.trim()==""){
            	$("#alertadd_percent").html('(* Bạn cần điền % giảm giá *)')
            	flag=1;
            }
			if(percent_promotion>100 || percent_promotion <=0){
            	$("#alertadd_percent").html('(* Giảm giá phải nằm trong khoảng 1 đến 100 *)')
            	flag=1;
            }
			if(idProduct==''){
				$("#alertadd_percent").html('(* Bạn cần chọn sản phẩm cần giảm giá *)')
            	flag=1;
			}
	        if(flag == 0){
			$.ajax({
				type : "post",
				url : "/ShopSmartPhone/promotionDetailServlet",
				data:{
					idPromotion : idPromotion,
					idProduct : idProduct,
					percent_promotion : percent_promotion,
					dataButton: dataButton
				},
				success : function(response) {
					if (response == "success") {
						$("#addViewContentModal").modal('hide')
						$('.modal-backdrop').remove() 
						$("#content").load("../Admin/PromotionDetail.jsp")
					}
					else if(response == "exits"){
						$("#alertadd_percent").html('(* Sản phẩm đã có trong đợt giảm giá này *)')
					}
					else if(response == "fail"){
						$("#alertadd_percent").html('(* Đã có lỗi xảy ra *)')
					}
				}
			});
			
	       }
	    	
		})
		//bắt sự kiện click nút Edit trong table 
		$(".btn-edit").click(function() {
			$("#editPostModal").modal('show')
			t = $(this).parent().parent('tr');
			var i = $(this).attr("data-i")
			var name = $(this).attr("data-name")
			var ten = $(this).attr("data-ten")
			$('#edit').val(i)
			$('#edit-name').val(name)
			$('#edit-ten').val(ten)

			$("#reset-edit").click(function(){
				$('#edit-name').val(name)
			})
			
			
			$("#edit-name").keypress(function() {
				$("#alert_name").html('')
			})

		})
		//bắt sự kiện click OK
		$("#edit").click(function() {
			var i = $('#edit').val()
			var name = $('#edit-name').val()
			var dataButton = $(this).attr('data-button')
			var flag = 0;
			var str= "#btn-edit"+i
			var idProduct =$(str).attr("data-productId")
			var idPromotion=$(str).attr("data-promotionId")
			 if(name.trim()==""){
	            	$("#alert_name").html('(* Bạn cần ghi số % giảm *)')
	            	flag = 1;
	            }
			 if(name>100 || name <=0){
	            	$("#alert_name").html('(* % phải nằm trong khoảng từ 1 tới 100 *)')
	            	flag = 1;
	            }

	        if(flag == 0){
			$.ajax({
				type : "post",
				url : "/ShopSmartPhone/promotionDetailServlet",
				data : {
					idProduct : idProduct,
					idPromotion : idPromotion,
					perent_promotion : name,
					dataButton : dataButton
				},
				success : function(response) {
					if (response == "success") {
						$("#editPostModal").modal('hide')
						$('.modal-backdrop').remove()  
						$(str).attr('data-name',name)
						t.find('.colPercent').html(name);
					}
					else if(response == "trung"){
						$("#alert_name").html('(* Trùng thể loại *)')
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
		
	
	$("#cmbShowProduct").load("../Admin/cmbCategory.jsp?idCate=1")

	})
	
	function cmbChanged(){
	 var x= $("#cmbCategory").val()
	 $("#cmbShowProduct").load("../Admin/cmbCategory.jsp?idCate="+x)
}
	
	
</script> 
</body>
</html>