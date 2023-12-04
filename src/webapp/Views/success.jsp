<%@page import="com.project.ecommerce.model.Item"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mua hàng trực tuyến với ShopSmartPhone</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../Css/Fstyle.css">
</head>

<body>
<%@ include file="header.jsp"%>
	<div class=container">
      <div class="contactform-wrap">
            <form action="#" class="form-validate">
                <h3 class="component-ttl component-ttl-ct component-ttl-hasdesc"><span>ĐẶT HÀNG</span></h3>
                <p class="component-desc component-desc-ct">Khách hàng xin vui lòng xác nhận thông tin</p>
                <p class="contactform-field contactform-text">
                    <label class="contactform-label">HỌ TÊN</label><!-- NO SPACE --><span class="contactform-input"><input placeholder="Tên Khách Hàng" id="nameUser" type="text" value="<%=user.getName() %>">
                   <span class="alert" id="nameUser_alert"></span>
                    </span>
               		
                </p>
                <p class="contactform-field contactform-text">
                    <label class="contactform-label">ĐỊA CHỈ</label><!-- NO SPACE --><span class="contactform-input"><input placeholder="Địa Chỉ Khách Hàng" id="addressUser" type="text" value="<%=user.getAddress() %>" >
                   <span class="alert" id="addressUser_alert"></span>
                    </span>
                	
                </p>
                <p class="contactform-field contactform-text">
                    <label class="contactform-label">SDT</label><!-- NO SPACE --><span class="contactform-input"><input placeholder="Số Điện Thoại Khách Hàng" id="phoneUser" type="text" value="<%=user.getPhone() %>" >
                    <span class="alert" id="phoneUser_alert"></span>
                    </span>
                	
                </p>
                <p class="contactform-field contactform-text">
                    <label class="contactform-label">NGÀY NHẬN</label><!-- NO SPACE --><span class="contactform-input"> <input type="date" id="dateRecieve">
                	<span class="alert" id="dateRecieve_alert"></span>
                </span>
                </p>
                     <img style="width: 100px;
    height: auto;
    float: left;
    margin-left: 200px;" alt="" src="../img/logo-png/Paypal.png">
                <p class="contactform-submit">
                    <input style="position: relative;
    right: -20px;" data-id="<%=user.getId() %>" value="XÁC NHẬN VÀ THANH TOÁN" type="button" id="submit">
                </p>
           
          
            </form>
            <form style="display:none" action="${initParam['posturl'] }" method="post">
            <input type="hidden" name="upload" value="1"/>
			<input type="hidden" name="return" value="${initParam['returnurl'] }"/>
			<input type="hidden" name="cmd" value="_cart"/>
			<input type="hidden" name="business" value="${initParam['business'] }"/>
			<% int i=1;
			  for(Map.Entry<String, Item> list: cart.getCartItems().entrySet()){
          	  String id =list.getValue().getProduct().getId();
          	  String image = list.getValue().getProduct().getImage();
          	  String name = list.getValue().getProduct().getName();
          	  int price = list.getValue().getProduct().getPrice();
          	  int quantity = list.getValue().getQuantity();         	  
          	  int percent_promotion = list.getValue().getProduct().getPercent_promotion();
          	 if(percent_promotion>0){
            	price-=price*percent_promotion/100; 
          	 }
          	
			%>
			<input type="hidden" name="item_name_<%=i %>" value="<%=name%> "/>
			<input type="hidden" name="amount_<%=i %>" value="<%=price%> "/>
			<input type="hidden" name="quantity_<%=i %>" value="<%=quantity%> "/>
			<% i++;
			} %>
			<input id="triggerPayment" type="submit" value="payment"/> 
			</form>
        </div>
        </div>
            <%@ include file="Footer.jsp"%>
        
</body>
</html>