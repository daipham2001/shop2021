
<%@page import="com.project.ecommerce.dao.BrandDAO"%>
<%@page import="com.project.ecommerce.model.Brand"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.project.ecommerce.model.Employee"%>
<%@page import="com.project.ecommerce.dao.ProductDAO"%>
<%@page import="com.project.ecommerce.model.Product"%>
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
<title>Manager Category</title>

</head>
<body>	 <%
		Employee user = (Employee) session.getAttribute("employeeSession");
		 if(user == null){			
			response.sendRedirect("LoginAdmin.jsp");
			return;
		} 
		%> 

	<%
	Product product= new Product();
	ProductDAO productDAO= new ProductDAO();
	List<Product> listProducts= new ArrayList<>();
	listProducts= productDAO.listAllProduct();
	Brand brand= new Brand();
	BrandDAO brandDAO= new BrandDAO();
	List<Category> lisCategories= new ArrayList<>();
	Category category=new Category();
	CategoryDAO categoryDAO= new CategoryDAO();
	DecimalFormat formatter = new DecimalFormat("###,###,###");
		
		
	%>
	<h2 style= "margin-right: 500px;" class="Title-view">BÁO CÁO TỒN KHO</h2>
	
	
	<div class="search-ifo">
		<input id="text-Search" placeholder="Search...">
		<button id="btn-Search">
			<i class="fas fa-search"></i>
		</button>

	</div>

	<div class="clear-float"></div>
	<hr style="margin-top: 0px;">
		<select id="cmbCategory" onchange="cmbChanged()" class="col-5" style="height:30px;margin:0"> 
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
<div id="TonKhoID">
</div>
	<script>
	$(document).ready(function() {
	
		//hàm chuyển các giá trị trong col thành chữ thường LowerCase()
		$.extend($.expr[":"], {"containsNC": function(elem, i, match, array) {
        return (elem.textContent || elem.innerText || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
			}
			})	;
		//bắt sự kiện search, giá trị nhập vào thành chữ thường 
		$("#btn-Search").click(function() {
			var a = $("#text-Search").val().toLowerCase();
			    $(".tableViewContent td.colName:containsNC('" +a + "')").parent().show();
		        $(".tableViewContent td.colName:not(:containsNC('" +a+ "'))").parent().hide();
		})
		$("#TonKhoID").load("../Admin/TONKHOID.jsp?idCate=1")
	})
	function cmbChanged(){
	  var x= $("#cmbCategory").val()
	  console.log(x);
	 	$("#TonKhoID").load("../Admin/TONKHOID.jsp?idCate="+x)
}
</script>
	
</body>
</html>