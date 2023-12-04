<%@page import="com.project.ecommerce.model.Product"%>
<%@page import="com.project.ecommerce.dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat" %>
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
	<section>
	<%
	ProductDAO productDAO = new ProductDAO();
	Product product = new Product();
	List<Product> listProduct = new ArrayList<>();
	listProduct= (List<Product>) session.getAttribute("dsSearch");
	String textSearch= (String) session.getAttribute("textSearch");
	DecimalFormat formatter = new DecimalFormat("###,###,###");
	
	%>
		<% if(listProduct.size()==0){%>
			<div class="container" style="text-align: center;font-family: -webkit-body;padding: 130px;">
	 	<h2>Không có kết quả tìm kiếm cho ' <%=textSearch %> '</h2>
		</div>
		<%}else{%>
		
			
		<div id="section-content" class=" container"> 
       		<div class="info">
			   <div class="fr-pop-wrap">

            <h3 class="component-ttl" style="font-family: serif; float:left"><span>Tìm Kiếm cho '<%=textSearch %>' </span></h3>
            <h4 style="float: left;padding: 0;margin-bottom: 35px;margin-top: 32px;
                font-size: 25px;font-family: serif; color:gray"> ( <%=listProduct.size() %> kết quả )</h4> 
			
      </div> <div class="clear-float"></div>
             <div class="fr-pop-tab-cont">

                <p data-frpoptab-num="1" class="fr-pop-tab-mob active" data-frpoptab="#frpoptab-tab-1">Tất cả </p>
                <div class="flexslider prod-items fr-pop-tab" id="frpoptab-tab-1">

                  <ul style="padding: 0;width: 101%;list-style: none;">
							<%
							for (int i = 0; i < listProduct.size(); i++) {
								String name= listProduct.get(i).getName();
								String image= listProduct.get(i).getImage();
								int percent_promotion=listProduct.get(i).getPercent_promotion();
								int price=listProduct.get(i).getPrice();
								int new_product=listProduct.get(i).getNew_product();
						%>
						 <li class="prod-i ">
                            <div class="prod-i-top">
                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>" class="prod-i-img"><!-- NO SPACE -->
                                <img  src="<%=image%>" alt=""><!-- NO SPACE --></a> 
                        		
                            </div>
                            <h3>
                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>"><%=name%></a>
                            </h3>
                            <% if(percent_promotion>0){ %>
                            <p class="prod-i-price">
                            <%int a= price-price*percent_promotion/100;%>
                                <b>$<%=formatter.format(a) %></b>
                                 (<strike><b>$<%=formatter.format(price) %></b></strike>)
                            </p>
                             <div class="prod-sticker">
                                    <p class="prod-sticker-3">-<%=percent_promotion %>%</p>
                                </div>
                                 
                                <%} else { %>
                                <p class="prod-i-price">
                                <b>$<%=formatter.format(price) %></b>
                            </p>
                                <%}%>
                                <% if(new_product==1){ %>
                                 <div class="prod-sticker1">
                                    <p class="prod-sticker-1">NEW</p>
                                </div>
                                <%} %>
                          
                        </li>
                        <%} %>
                    </ul>
                </div>
          
                </div>
			</div> 
			</div>
		<%} %>
	</section>

<% session.removeAttribute("textSearch");%>
<%@ include file="Footer.jsp"%>

</body>
</html>