<%@page import="com.project.ecommerce.dao.PromotionDAO"%>
<%@page import="com.project.ecommerce.model.Promotion"%>
<%@page import="com.project.ecommerce.model.Customer"%>
<%@page import="com.project.ecommerce.model.Product"%>
<%@page import="com.project.ecommerce.dao.ProductDAO"%>
<%@page import="com.project.ecommerce.dao.BrandDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.ecommerce.model.Category"%>
<%@page import="com.project.ecommerce.model.Brand"%>
<%@page import="com.project.ecommerce.dao.CategoryDAO"%>
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
<script>

$(function () {
    $(".loadMore1").slice(0, 4).show();
    $(".loadMore2").slice(0, 4).show();
    var count1=  $(".loadMore1").length
    var count2=  $(".loadMore2").length
    $("#loadMore1").click(function(){
        $(".loadMore1:hidden").slice(0, count1).slideDown();
        $("#loadMore1").css("display","none")
    });
    $("#loadMore2").click(function(){
        $(".loadMore2:hidden").slice(0, count2).slideDown();   
        $("#loadMore2").css("display","none")
    });
});
	
</script>
<body>

<%@ include file="header.jsp"%>
	<section>

		<div id="section-content" class=" container">
			<div class="home row">
				<div class="img-slider col-lg-8 col-md-12 col-sm-12 col-xs-12">
					<div id="carousel-indicators" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100"
									src="../img/quangcao/iphone-x-_-xr-1600x600.jpg"
									alt="not found">
							</div>

							<div class="carousel-item">
								<img class="d-block w-100"
									src="../img/quangcao/sliding_a80_1507.jpg" alt="not found">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="../img/quangcao/Sliding_Huawei_0107.jpg" alt="not found">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carousel-indicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span>
						</a> <a class="carousel-control-next" href="#carousel-indicators"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span>
						</a>
					</div>
					<div class="hinh-quangcao">
						<img style="width: 100%"
							src="../img/quangcao/14_11_2018_11_00_57_1200x65.png" alt="">
					</div>
				</div>
				<div class="slider-right col-lg-4 col-md-12 col-sm-12 col-xs-12">


					<img alt="" src="../img/quangcao/Right-banner_s10_plus_67.jpg">
					<img alt="" src="../img/quangcao/rightbanner_laptop_asus_97.jpg">
				</div>
			</div>

			<div class="info">
				<%
				DecimalFormat formatter = new DecimalFormat("###,###.00");
				ProductDAO productDAO = new ProductDAO();
				Product product = new Product();
				List<Product> listProduct = new ArrayList<>();
				Promotion promotion= new Promotion();
				PromotionDAO promotionDAO= new PromotionDAO();
				promotion= promotionDAO.promotionbyCurrentDate();
				
				%>
			<!-- Popular Products -->
        <div class="fr-pop-wrap">
  
            <h3 class="component-ttl" style="font-family: serif"><span>sản phẩm giảm giá</span></h3>
          
            <ul class="fr-pop-tabs sections-show">
                <li><a data-frpoptab-num="1" data-frpoptab="#frpoptab-tab-1" href="#" class="active">Tất cả sản phẩm</a></li>
                <li><a data-frpoptab-num="2" data-frpoptab="#frpoptab-tab-2" href="#">Điện Thoại</a></li>
<%--                <li><a data-frpoptab-num="3" data-frpoptab="#frpoptab-tab-3" href="#">Laptop</a></li>--%>
<%--                <li><a data-frpoptab-num="4" data-frpoptab="#frpoptab-tab-4" href="#">ti vi</a></li>--%>
                <div style="float: right; margin: 0;padding: 12px; font-size: 18px; text-transform: uppercase; background-color: lavender;">
			<p style="margin:0"><%=promotion.getReason() %> ( <%=promotion.getDateStart() %> - <%=promotion.getDateEnd() %> )</p>
            </div>
            </ul>
         
      </div>
             <div class="fr-pop-tab-cont">

                <p data-frpoptab-num="1" class="fr-pop-tab-mob active" data-frpoptab="#frpoptab-tab-1">Tất cả </p>
                <div class=" prod-items fr-pop-tab" id="frpoptab-tab-1">

                 <ul style="padding: 0;width: 101%;list-style: none;">
							<%
						listProduct = productDAO.listProductbyPromotion();
							for (int i = 0; i < listProduct.size(); i++) {
								String name= listProduct.get(i).getName();
								String image= listProduct.get(i).getImage();
								int percent_promotion=listProduct.get(i).getPercent_promotion();
								int price=listProduct.get(i).getPrice();
								int new_product=listProduct.get(i).getNew_product();
						%>
						 <li class="prod-i loadMore1">
                            <div class="prod-i-top">
                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>" class="prod-i-img"><!-- NO SPACE -->
                                <img  src="<%=image%>" alt=""><!-- NO SPACE --></a> 
                        		
                            </div>
                            <h3>
                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>"><%=name%></a>
                            </h3>
                            <p class="prod-i-price">
                            <%int a= price-price*percent_promotion/100;%>
                                <b>$<%=formatter.format(a) %></b>
                                 (<strike><b>$<%=formatter.format(price) %></b></strike>)
                            </p>
                             <div class="prod-sticker">
                                    <p class="prod-sticker-3">-<%=percent_promotion %>%</p>
                                </div>
                                <%if(new_product==1){ %>
                                <div class="prod-sticker1">
                                    <p class="prod-sticker-1">NEW</p>
                                </div>  
                                <%} %>
                          
                        </li>
                        <%} %>
                    </ul>
                   <div class="clear-float"></div>
					<p class="loadMore" id="loadMore1">Xem thêm <i class="fas fa-chevron-right"></i></p>
                 
                </div>
                 <p data-frpoptab-num="2" class="fr-pop-tab-mob" data-frpoptab="#frpoptab-tab-2">Điện Thoại</p>
                <div class=" prod-items fr-pop-tab" id="frpoptab-tab-2">

                  <ul style="padding: 0;width: 101%;list-style: none;">
							<%
						listProduct = productDAO.listProductbyPromotionCate(1);
							for (int i = 0; i < listProduct.size(); i++) {
								String name= listProduct.get(i).getName();
								String image= listProduct.get(i).getImage();
								int percent_promotion=listProduct.get(i).getPercent_promotion();
								int price=listProduct.get(i).getPrice();
								int new_product=listProduct.get(i).getNew_product();
								%>
								 <li class="prod-i">
		                            <div class="prod-i-top">
		                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>" class="prod-i-img"><!-- NO SPACE -->
		                                <img  src="<%=image%>" alt=""><!-- NO SPACE --></a> 
		                        		
		                            </div>
		                            <h3>
		                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>"><%=name%></a>
		                            </h3>
		                            <p class="prod-i-price">
		                            <%int a= price-price*percent_promotion/100;%>
		                                <b>$<%=formatter.format(a) %></b>
		                                 (<strike><b>$<%=formatter.format(price) %></b></strike>)
		                            </p>
		                             <div class="prod-sticker">
		                                    <p class="prod-sticker-3">-<%=percent_promotion %>%</p>
		                                </div>
		                                <%if(new_product==1){ %>
		                                <div class="prod-sticker1">
		                                    <p class="prod-sticker-1">NEW</p>
		                                </div>  
		                                <%} %>
		                          
		                        </li>
		                        <%} %>
		                    </ul>
                </div>

<%--                <p data-frpoptab-num="3" class="fr-pop-tab-mob" data-frpoptab="#frpoptab-tab-3">Laptop</p>--%>
<%--                <div class=" prod-items fr-pop-tab" id="frpoptab-tab-3">--%>

<%--                      <ul style="padding: 0;width: 101%;list-style: none;">--%>
<%--							<%--%>
<%--						listProduct = productDAO.listProductbyPromotionCate(2);--%>
<%--							for (int i = 0; i < listProduct.size(); i++) {--%>
<%--								String name= listProduct.get(i).getName();--%>
<%--								String image= listProduct.get(i).getImage();--%>
<%--								int percent_promotion=listProduct.get(i).getPercent_promotion();--%>
<%--								int price=listProduct.get(i).getPrice();--%>
<%--						int new_product=listProduct.get(i).getNew_product();--%>
<%--						%>--%>
<%--						 <li class="prod-i">--%>
<%--                            <div class="prod-i-top">--%>
<%--                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>" class="prod-i-img"><!-- NO SPACE -->--%>
<%--                                <img  src="<%=image%>" alt=""><!-- NO SPACE --></a> --%>
<%--                        		--%>
<%--                            </div>--%>
<%--                            <h3>--%>
<%--                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>"><%=name%></a>--%>
<%--                            </h3>--%>
<%--                            <p class="prod-i-price">--%>
<%--                            <%int a= price-price*percent_promotion/100;%>--%>
<%--                                <b>$<%=formatter.format(a) %></b>--%>
<%--                                 (<strike><b>$<%=formatter.format(price) %></b></strike>)--%>
<%--                            </p>--%>
<%--                             <div class="prod-sticker">--%>
<%--                                    <p class="prod-sticker-3">-<%=percent_promotion %>%</p>--%>
<%--                                </div>--%>
<%--                                <%if(new_product==1){ %>--%>
<%--                                <div class="prod-sticker1">--%>
<%--                                    <p class="prod-sticker-1">NEW</p>--%>
<%--                                </div>  --%>
<%--                                <%} %>--%>
<%--                          --%>
<%--                        </li>--%>
<%--                        <%} %>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                --%>
<%--                <p data-frpoptab-num="4" class="fr-pop-tab-mob" data-frpoptab="#frpoptab-tab-4">Tivi</p>--%>
<%--                <div class=" prod-items fr-pop-tab" id="frpoptab-tab-4">--%>

<%--                      <ul style="padding: 0;width: 101%;list-style: none;">--%>
<%--							<%--%>
<%--						listProduct = productDAO.listProductbyPromotionCate(3);--%>
<%--							for (int i = 0; i < listProduct.size(); i++) {--%>
<%--								String name= listProduct.get(i).getName();--%>
<%--								String image= listProduct.get(i).getImage();--%>
<%--								int percent_promotion=listProduct.get(i).getPercent_promotion();--%>
<%--								int price=listProduct.get(i).getPrice();--%>
<%--						int new_product=listProduct.get(i).getNew_product();--%>
<%--						%>--%>
<%--						 <li class="prod-i">--%>
<%--                            <div class="prod-i-top">--%>
<%--                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>" class="prod-i-img"><!-- NO SPACE -->--%>
<%--                                <img  src="<%=image%>" alt=""><!-- NO SPACE --></a> --%>
<%--                        		--%>
<%--                            </div>--%>
<%--                            <h3>--%>
<%--                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>"><%=name%></a>--%>
<%--                            </h3>--%>
<%--                            <p class="prod-i-price">--%>
<%--                            <%int a= price-price*percent_promotion/100;%>--%>
<%--                                <b>$<%=formatter.format(a) %></b>--%>
<%--                                 (<strike><b>$<%=formatter.format(price) %></b></strike>)--%>
<%--                            </p>--%>
<%--                             <div class="prod-sticker">--%>
<%--                                    <p class="prod-sticker-3">-<%=percent_promotion %>%</p>--%>
<%--                                </div>--%>
<%--                                <%if(new_product==1){ %>--%>
<%--                                <div class="prod-sticker1">--%>
<%--                                    <p class="prod-sticker-1">NEW</p>--%>
<%--                                </div>  --%>
<%--                                <%} %>--%>
<%--                          --%>
<%--                        </li>--%>
<%--                        <%} %>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                </div>--%>
   		<!-- NEW Products -->
        <div class="fr-pop-wrap">

            <h3 class="component-ttl" style="font-family: serif"><span>sản phẩm mới</span></h3>

            <ul class="fr-pop-tabs sections-show">
                <li><a data-frpoptab-num="21" data-frpoptab="#frpoptab-tab-21" href="#" class="active">Tất cả sản phẩm</a></li>
                <li><a data-frpoptab-num="22" data-frpoptab="#frpoptab-tab-22" href="#">Điện Thoại</a></li>
<%--                <li><a data-frpoptab-num="23" data-frpoptab="#frpoptab-tab-23" href="#">Laptop</a></li>--%>
<%--                <li><a data-frpoptab-num="24" data-frpoptab="#frpoptab-tab-24" href="#">ti vi</a></li>--%>
            </ul>
     <!--        <p class="loadMore" id="loadMore3"><i class="fas fa-chevron-down"></i></p>
			<p class="loadMore" id="loadLess3"><i class="fas fa-chevron-up"></i></p>
      -->       
      </div>
             <div class="fr-pop-tab-cont">

                <p data-frpoptab-num="21" class="fr-pop-tab-mob active" data-frpoptab="#frpoptab-tab-21">Tất cả </p>
                <div class=" prod-items fr-pop-tab" id="frpoptab-tab-21">

                 <ul style="padding: 0;width: 101%;list-style: none;">
							<%
						listProduct = productDAO.listProductNew();
							for (int i = 0; i < listProduct.size(); i++) {
								String name= listProduct.get(i).getName();
								String image= listProduct.get(i).getImage();
								int percent_promotion=listProduct.get(i).getPercent_promotion();
								int price=listProduct.get(i).getPrice();
								int new_product=listProduct.get(i).getNew_product();
						%>
						 <li class="prod-i loadMore2 ">
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
					  <div class="clear-float"></div>
					<p class="loadMore" id="loadMore2">Xem thêm <i class="fas fa-chevron-right"></i></p>
                 
                </div>
                 <p data-frpoptab-num="22" class="fr-pop-tab-mob" data-frpoptab="#frpoptab-tab-22">Điện Thoại</p>
                <div class=" prod-items fr-pop-tab" id="frpoptab-tab-22">

                  <ul style="padding: 0;width: 101%;list-style: none;">
							<%
						listProduct = productDAO.listProductNewCate(1);
							for (int i = 0; i < listProduct.size(); i++) {
								String name= listProduct.get(i).getName();
								String image= listProduct.get(i).getImage();
								int percent_promotion=listProduct.get(i).getPercent_promotion();
								int price=listProduct.get(i).getPrice();
								int new_product=listProduct.get(i).getNew_product();
								%>
								 <li class="prod-i">
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

<%--                <p data-frpoptab-num="23" class="fr-pop-tab-mob" data-frpoptab="#frpoptab-tab-23">Laptop</p>--%>
<%--                <div class=" prod-items fr-pop-tab" id="frpoptab-tab-23">--%>

<%--                     <ul style="padding: 0;width: 101%;list-style: none;">--%>
<%--							<%--%>
<%--						listProduct = productDAO.listProductNewCate(2);--%>
<%--							for (int i = 0; i < listProduct.size(); i++) {--%>
<%--								String name= listProduct.get(i).getName();--%>
<%--								String image= listProduct.get(i).getImage();--%>
<%--								int percent_promotion=listProduct.get(i).getPercent_promotion();--%>
<%--								int price=listProduct.get(i).getPrice();--%>
<%--								int new_product=listProduct.get(i).getNew_product();--%>
<%--						%>--%>
<%--						 <li class="prod-i">--%>
<%--                            <div class="prod-i-top">--%>
<%--                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>" class="prod-i-img"><!-- NO SPACE -->--%>
<%--                                <img  src="<%=image%>" alt=""><!-- NO SPACE --></a> --%>
<%--                        		--%>
<%--                            </div>--%>
<%--                            <h3>--%>
<%--                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>"><%=name%></a>--%>
<%--                            </h3>--%>
<%--                            <% if(percent_promotion>0){ %>--%>
<%--                            <p class="prod-i-price">--%>
<%--                            <%int a= price-price*percent_promotion/100;%>--%>
<%--                                <b>$<%=formatter.format(a) %></b>--%>
<%--                                 (<strike><b>$<%=formatter.format(price) %></b></strike>)--%>
<%--                            </p>--%>
<%--                             <div class="prod-sticker">--%>
<%--                                    <p class="prod-sticker-3">-<%=percent_promotion %>%</p>--%>
<%--                                </div>--%>
<%--                                 --%>
<%--                                <%} else { %>--%>
<%--                                <p class="prod-i-price">--%>
<%--                                <b>$<%=formatter.format(price) %></b>--%>
<%--                            </p>--%>
<%--                                <%}%>--%>
<%--                                <% if(new_product==1){ %>--%>
<%--                                 <div class="prod-sticker1">--%>
<%--                                    <p class="prod-sticker-1">NEW</p>--%>
<%--                                </div>--%>
<%--                                <%} %>--%>
<%--                          --%>
<%--                        </li>--%>
<%--                        <%} %>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                --%>
<%--                <p data-frpoptab-num="24" class="fr-pop-tab-mob" data-frpoptab="#frpoptab-tab-24">Tivi</p>--%>
<%--                <div class="prod-items fr-pop-tab" id="frpoptab-tab-24">--%>

<%--                          <ul style="padding: 0;width: 101%;list-style: none;">--%>
<%--							<%--%>
<%--						listProduct = productDAO.listProductNewCate(3);--%>
<%--							for (int i = 0; i < listProduct.size(); i++) {--%>
<%--								String name= listProduct.get(i).getName();--%>
<%--								String image= listProduct.get(i).getImage();--%>
<%--								int percent_promotion=listProduct.get(i).getPercent_promotion();--%>
<%--								int price=listProduct.get(i).getPrice();--%>
<%--								int new_product=listProduct.get(i).getNew_product();--%>
<%--						%>--%>
<%--						 <li class="prod-i">--%>
<%--                            <div class="prod-i-top">--%>
<%--                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>" class="prod-i-img"><!-- NO SPACE -->--%>
<%--                                <img  src="<%=image%>" alt=""><!-- NO SPACE --></a> --%>
<%--                        		--%>
<%--                            </div>--%>
<%--                            <h3>--%>
<%--                                <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>"><%=name%></a>--%>
<%--                            </h3>--%>
<%--                            <% if(percent_promotion>0){ %>--%>
<%--                            <p class="prod-i-price">--%>
<%--                            <%int a= price-price*percent_promotion/100;%>--%>
<%--                                <b>$<%=formatter.format(a) %></b>--%>
<%--                                 (<strike><b>$<%=formatter.format(price) %></b></strike>)--%>
<%--                            </p>--%>
<%--                             <div class="prod-sticker">--%>
<%--                                    <p class="prod-sticker-3">-<%=percent_promotion %>%</p>--%>
<%--                                </div>--%>
<%--                                 --%>
<%--                                <%} else { %>--%>
<%--                                <p class="prod-i-price">--%>
<%--                                <b>$<%=formatter.format(price) %></b>--%>
<%--                            </p>--%>
<%--                                <%}%>--%>
<%--                                <% if(new_product==1){ %>--%>
<%--                                 <div class="prod-sticker1">--%>
<%--                                    <p class="prod-sticker-1">NEW</p>--%>
<%--                                </div>--%>
<%--                                <%} %>--%>
<%--                          --%>
<%--                        </li>--%>
<%--                        <%} %>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                </div>--%>

				
			</div>
			
			    <!-- Subscribe Form -->
        <div class="newsletter">
            <h3>ĐĂNG KÍ VỚI CHÚNG TÔI</h3>
            <p>Điền email của bạn nếu muốn theo dõi các sản phẩm mới của chúng tôi</p>
            <form action="#">
                <input placeholder="Email của bạn" type="text">
                <input name="OK" value="Đăng kí" type="submit">
            </form>
        </div>
		</div>
	</section>
	<%@ include file="Footer.jsp"%>
	
</body>
<script src="../Js/main.js"></script>
</html>