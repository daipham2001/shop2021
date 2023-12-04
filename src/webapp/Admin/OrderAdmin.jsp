
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
<title>Category</title>

</head>
<body>
	 <%
		Employee user = (Employee) session.getAttribute("employeeSession");
		 if(user == null){			
			response.sendRedirect("LoginAdmin.jsp");
			return;
		} 
	Order order=new Order();
	OrderDAO orderDAO= new OrderDAO();
	List<Order> listOrders= new ArrayList<>();
	Employee employee= new Employee();
	EmployeeDAO employeeDAO= new EmployeeDAO();
	Customer customer= new Customer();
	CustomerDAO customerDAO= new CustomerDAO();
	List<Employee> listShipper= new ArrayList<>();
	DecimalFormat formatter = new DecimalFormat("###,###.00");
	
		
		
	%>
	<h2 style= "margin-right: 500px;" class="Title-view">Đơn Hàng</h2>
	<div class="search-ifo">
		<input id="text-Search" placeholder="Search...">
		<button id="btn-Search">
			<i class="fas fa-search"></i>
		</button>

	</div>

	<div class="clear-float"></div>
	<hr style="margin-top: 0px;">
	

  <ul class="nav nav-tabs">
    <li><a id="trigger1Click" data-toggle="tab" href="#home">ĐƠN ĐANG CHỜ DUYỆT</a></li>
    <li><a id="trigger2Click" data-toggle="tab" href="#menu1">ĐƠN ĐANG SHIP</a></li>
    <li><a id="trigger3Click" data-toggle="tab" href="#menu2">ĐƠN HOÀN THÀNH</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
     
     <div class="content-page">

		<p class="head-table">Danh sách Đơn Đang Chờ Duyệt</p>

		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >
			
					<tr>
						<th style="width: 10%">Mã Đơn</th>
						<th  style="width: 15%">Tên Khách Hàng</th>
						<th style="width: 15%">Ngày đặt</th>
						<th style="width: 10%">Tổng tiền ($)</th>
						<th style="width: 35%">Thông tin</th>
						<th style="width: 10%"></th>
						<th style="width: 5%"></th>
						
						</tr>
				 	<%
				 	listOrders= orderDAO.listOrderBystatus(0);
					  for (int i = 0; i < listOrders.size(); i++) {  
						  int idOrder=listOrders.get(i).getId();
						  int customerID=listOrders.get(i).getCustomerID();
						  String Date=listOrders.get(i).getCreate_date();
						  int total=listOrders.get(i).getTotal();
						  String name=listOrders.get(i).getName();
						  String phone=listOrders.get(i).getPhone();
						  String address=listOrders.get(i).getAddress();
						  String time=listOrders.get(i).getTime();
						  customer= customerDAO.customerByID(customerID);
						  String customerName= customer.getName();
						  String customerEmail= customer.getEmail();
							
					
					%> 
					<tr class=" tableViewContent" >
					
						<td ><%=idOrder%></td>
						<td class="colName" ><%=customerName %></td>
						<td class="colNgayDat"><%=Date%></td>
						<td class="colTotal">$<%=formatter.format(total)%></td>
						<td class="colInfo"><ul>
						<li>Tên: <%=name %></li>
						<li>SDT: <%=phone %></li>
						<li>Địa Chỉ: <%=address %></li>
						<li>Ngày giao: <%=time %></li>
						</ul>
						</td>
						<td><a href="#" data-id="<%=idOrder%>" class="viewOrderDetail">Xem chi tiết</a></td>
						<td>
						<button id="btnShipper<%=idOrder %>" class="btn btn-primary btnShipper"
								data-id="<%=idOrder%>" data-email=<%=customerEmail %>
								>Duyệt</button>
							
						</td>
						

					</tr>
				
				<%
					}
				%>
			</table>
			
		</div>
	  	
		<div class="modal fade" id="shipperModal" tabindex="-1" role="dialog"
			aria-hidden="true" style="display: none">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Duyệt Đơn Hàng</h5>
					</div>
					<div class="modal-body">
					<p>Chọn nhân viên giao hàng</p>
					<p style="color:red">Vui lòng chọn nhân viên giao hàng có ít đơn hàng nhất</p>
						<select id="cmbShipper"> 
						<% 
							listShipper= employeeDAO.listShipper();
							for(int i=0;i<listShipper.size();i++){
								int count= orderDAO.countOrderByShipper(listShipper.get(i).getId());
								
							%>
 							 <option value="<%=listShipper.get(i).getId() %>" ><%=listShipper.get(i).getName()%>  -  Đang giao ( <%=count %> đơn hàng )</option>
  							<%
							}
  							%>
						</select>
	
				</div>
					<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
							data-button="shipper" id="shipper">Có</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Không</button>
						
					</div>
				</div>
			</div>
		</div>
	</div> 
     
     </div>
    <div id="menu1" class="tab-pane fade">
    
     <div class="content-page">

		<p class="head-table">Danh sách Đơn Đang Ship</p>

		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >
			
					<tr>
						<th style="width: 5%">Mã Đơn</th>
						<th style="width: 15%">Tên Khách Hàng</th>
						<th style="width: 15%">Tên Shipper</th>
						<th style="width: 10%">Ngày đặt</th>
						<th style="width: 10%">Tổng tiền</th>
						<th style="width: 30%">Thông tin</th>
						<th style="width: 10%"></th>
						<th style="width: 5%"></th>
						</tr>
				 	<%
				 		listOrders= orderDAO.listOrderBystatus(1);
					  for (int i = 0; i < listOrders.size(); i++) {  
						  int idOrder=listOrders.get(i).getId();
						  int customerID=listOrders.get(i).getCustomerID();
						  int idShipper=listOrders.get(i).getShipperID();
						  String Date=listOrders.get(i).getCreate_date();
						  int total=listOrders.get(i).getTotal();
						  String name=listOrders.get(i).getName();
						  String phone=listOrders.get(i).getPhone();
						  String address=listOrders.get(i).getAddress();
						  String time=listOrders.get(i).getTime(); 
						  customer= customerDAO.customerByID(customerID);
						  String customerName= customer.getName();
						  employee= employeeDAO.employeeByID(idShipper);
						  String shipperName= employee.getName();
					
					%> 
					<tr class=" tableViewContent" >
					
						<td ><%=idOrder %></td>
						<td class="colName"><%=customerName %></td>
						<td ><%=shipperName%></td>
						<td class="colNgayDat"><%=Date%></td>
						<td class="colTotal">$<%=formatter.format(total)%></td>
						<td class="colInfo"><ul>
						<li>Tên: <%=name %></li>
						<li>SDT: <%=phone%></li>
						<li>Địa Chỉ: <%=address %></li>
						<li>Ngày giao: <%=time%></li>
						</ul>
						</td>
								<td><a href="#" data-id="<%=idOrder%>" class="viewOrderDetail">Xem chi tiết</a></td>
						<td>
						<button id="btnComplete<%= i%>" class="btn btn-primary btnComplete"
								data-id="<%=idOrder%>"
								data-button="complete" onclick ="complete('<%= i  %>')"
								>Duyệt</button>
							
						</td>

					</tr>
				
				<%
					  }
				%>
			</table>
			
		</div>
		
		
	</div> 
    
      </div>
      	<div class="modal fade" id="duyetModal" role="dialog">
		<div class="modal-dialog modal-center" role="document">
			<div class="modal-content">
				<div class="modal-header" >
					<h5 class="modal-title">XÁC NHẬN</h5>
				</div>
				<div class="modal-body">
					<p>Bạn có chắc chắn muốn xác nhận đơn hoàn thành không ? </p>
				</div>
				<div class="modal-footer">
					<button type="button" id="btnduyetComplete" class="btn btn-primary">Đồng Ý</button>
						<button type="button" class="btn"
						data-dismiss="modal">Hủy</button>
				</div>
			</div>
		</div>
	</div>
    <div id="menu2" class="tab-pane fade">
    
     <div class="content-page">

		<p class="head-table">Danh sách Đơn Đã Hoàn Thành</p>

		<div style="height: 480px" class="content-table table-responsive">
				<table class="table table-striped edit-table-view" >
			
					<tr>
						<th style="width: 5%">Mã Đơn</th>
						<th style="width: 13%">Khách Hàng</th>
						<th style="width: 13%">Nhân Viên Duyệt</th>
						<th style="width: 13%">Shipper</th>
						<th style="width: 10%">Ngày đặt</th>
						<th style="width: 7%">Tổng tiền</th>
						<th style="width: 24%">Thông tin</th>
						<th style="width: 10%"></th>
						</tr>
				 	<%
				 		listOrders= orderDAO.listOrderBystatus(2);
					  for (int i = 0; i < listOrders.size(); i++) {  
						  int idOrder=listOrders.get(i).getId();
						  int customerID=listOrders.get(i).getCustomerID();
						  int idShipper=listOrders.get(i).getShipperID();
						  int idEmployee=listOrders.get(i).getEmployeeID();
						  String Date=listOrders.get(i).getCreate_date();
						  int total=listOrders.get(i).getTotal();
						  String name=listOrders.get(i).getName();
						  String phone=listOrders.get(i).getPhone();
						  String address=listOrders.get(i).getAddress();
						  String time=listOrders.get(i).getTime(); 
						  customer= customerDAO.customerByID(customerID);
						  String customerName= customer.getName();
						  employee= employeeDAO.employeeByID(idShipper);
						  String shipperName= employee.getName();
						  employee= employeeDAO.employeeByID(idEmployee);
						  String employeeName= employee.getName();
					
					%> 
					<tr class=" tableViewContent" >
					
						<td ><%=idOrder%></td>
						<td class="colName"><%=customerName %></td>
						<td><%=employeeName %></td>
						<td ><%=shipperName %></td>
						<td class="colNgayDat"><%=Date%></td>
						<td class="colTotal">$<%=formatter.format(total)%></td>
						<td class="colInfo"><ul>
						<li>Tên: <%=name %></li>
						<li>SDT: <%=phone %></li>
						<li>Địa Chỉ: <%=address %></li>
						<li>Ngày giao: <%=time %></li>
						</ul>
						</td>
						<td><a href="#" data-id="<%=idOrder%>" class="viewOrderDetail">Xem chi tiết</a></td>
					</tr>
				
				<%
					  }
				%>
			</table>
			
		</div>
		
	</div> 
    
       </div>
   
  </div>
 <script>
 $(document).ready(function(){

		$(".viewOrderDetail").click(function(){
			var id=$(this).attr("data-id")
			console.log(1)
			$("#content").load("../Admin/OrderDetail.jsp?id="+id)
		})
 })
	
</script> 
	<script src="../JsAdmin/OrderAdmin.js"></script>
</body>
</html>