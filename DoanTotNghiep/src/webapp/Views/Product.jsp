<%@page import="com.project.ecommerce.model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="com.project.ecommerce.dao.CustomerDAO"%>
<%@page import="com.project.ecommerce.dao.CommentDAO"%>
<%@page import="com.project.ecommerce.model.Comment"%>
<%@page import="com.project.ecommerce.model.Product"%>
<%@page import="com.project.ecommerce.dao.ProductDAO"%>
<%@page import="com.project.ecommerce.dao.BrandDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.ecommerce.model.Category"%>
<%@page import="com.project.ecommerce.model.Brand"%>
<%@page import="com.project.ecommerce.dao.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.project.ecommerce.model.Cart" %>
<%@page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Sản Phẩm || AElectronic</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../Css/Fstyle.css">
</head>

<body>

    <%@ include file="header.jsp"%>
    <%
	Product product=new Product();
	ProductDAO productDAO= new ProductDAO();
	Comment comment=new Comment();
	CommentDAO commentDAO=new CommentDAO();
	String id=request.getParameter("id");
	product = productDAO.productbyID(id);
	int brandID= product.getBrandID();
	category= categoryDAO.categoryByBrandID(brandID);
	brand= brandDAO.brandById(brandID);
	List<Comment> listComment=new ArrayList<>();
	listComment= commentDAO.listCommentByProduct(product.getId());
 	DecimalFormat formatter = new DecimalFormat("###,###.00");
	 int quantityCart=0;
		 for(Map.Entry<String, Item> list: cart.getCartItems().entrySet()){
		 	if(list.getValue().getProduct().getId().equals(product.getId())){
		 		quantityCart=list.getValue().getQuantity();
		 	}
		 }
	 %>

    <section>
        <div id="section-content" class="container">
            <ul class="b-crumbs">
                <li>
                    <a href="Home.jsp">
                        Trang chủ
                    </a>
                    <i class="fas fa-angle-right"></i>
                </li>
                <li>
                    <a href="Category.jsp?cateID=<%=category.getId()%>">
                        <%=category.getName() %>

                    </a>
                    <i class="fas fa-angle-right"></i>
                </li>
                <li>
                    <a href="Brand.jsp?brandID=<%=brand.getId()%>">
                        <%=brand.getName() %>
                    </a>
                    <i class="fas fa-angle-right"></i>
                </li>
                <li>
                    <span><%=product.getName() %></span>
                </li>
            </ul>
            <div class="hinh-quangcao"> <img style="width:100%" src="../img/quangcao/14_11_2018_11_00_57_1200x65.png" alt=""></div>
            <div class="row">
                <div class="col-lg-5 col-md-7 section-left">
                    <div class="detail-img">
                        <img src="<%=product.getImage() %>" style = "height: 400px">
                    </div>
                </div>
                <div class="col-lg-4 col-md-5 section-middle">

                    <h2><b><%=product.getName() %></b></h2>

                    <hr>
                    <%if(product.getPercent_promotion()>0){
                          					int a= product.getPrice()-product.getPrice()*product.getPercent_promotion()/100;
                          				%>
                    <span style="font-size:16px;font-style:bold">Giá: </span><strong style="font-size:30px; color:red" class="gia">
                        $<%=formatter.format(a) %> </strong>
                    <br>
                    <span><strike>$<%=formatter.format(product.getPrice()) %></strike></span>
                    <span> -<%=product.getPercent_promotion() %>%</span>
                    <% } else {%>
                    <span style="font-size:16px; font-style:bold">Giá: </span><strong style="font-size:30px; color:red" class="gia">


                        $<%=formatter.format(product.getPrice()) %> </strong>
                    <% } %>
                    <div class="clear-float"></div>
                    <p style="color:green; font-size: 22px"><b>
                            <%if(product.getQuantity()== 0){%> HẾT HÀNG <%} else {
                                       		 int stillQuantity=product.getQuantity()-quantityCart;
                                       		 if(stillQuantity!=0){
                                       			 %> CÒN HÀNG <%} else {%> HẾT HÀNG<% }} %>
                        </b></p>
                    <p style="font-size:15px;color:gray"> Miễn phí giao hàng thu tiền ( COD free ) </p>
                    <ul style="padding:0 0 0 15px;font-size:13px;">
                        <li><b>Giảm tới 1% </b>giá hóa đơn</li>
                        <li><b>Trả góp 0%</b> với thẻ tín dụng ngân hàng (tối thiểu 3 triệu) </li>
                        <li><b> Miễn phí</b> cà thẻ (ngoại trừ AMEX, UnionPay & JCB)</li>
                    </ul>
                    <hr>
                    <div class="quantity ">

                        <p style="margin-left:30px;font-size:13px">Số lượng</p>
                        <div class="float-left">
                            <span><button id="btnminus" class="btnQuantity"><i class="fas fa-minus"></i></button></span>

                            <span><input id="quantity" readonly <%if(product.getQuantity()== 0){%> value="0" <%} else {
                                       		 int stillQuantity=product.getQuantity()-quantityCart;
                                       		 if(stillQuantity!=0){
                                       			 %> value="1" <%} else {%> value="0" <% }} %> style="width:35px;height:35px; text-align:center; border: 1px solid #e0e4f6; blackground-color:#e0e4f6"></span>
                            <span><button data-quantityCart="<%=quantityCart %>" data-quantity="<%=product.getQuantity() %>" id="btnplus" class="btnQuantity"><i class="fas fa-plus"></i></button></span>

                        </div>

                        <div>
                            <button type="button" class="btnMua" <%if(product.getQuantity()== 0){%> id="btnHetHang" <%} else {
                                       		 int stillQuantity=product.getQuantity()-quantityCart;
                                       		 if(stillQuantity!=0){
                                       			 %> id="btnMua" <%} else {%> id="btnHetHang" <% }} %> data-id=<%=product.getId() %>>
                                <i class="fa fa-shopping-cart"></i>
                                CHỌN MUA
                            </button>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3 col-md-12 section-right">
                    <div>
                        <h5>MUA NHƯ VUA - CHĂM SÓC NHƯ VIP</h5>
                        <ul>
                            <li><img alt="" src="../img/header/checked.png">
                                <p>100% hàng chính hãng</p>
                            </li>
                            <div class="clear-float"></div>
                            <hr>
                            <li><img alt="" src="../img/header/refund.png">
                                <p>Lỗi là đổi mới trong vòng 1 tháng</p>
                            </li>
                            <div class="clear-float"></div>
                            <hr>
                            <li><img alt="" src="../img/header/smartphone.png">
                                <p>Bảo hành dễ chỉ cần số điện thoại</p>
                            </li>
                            <div class="clear-float"></div>
                            <hr>
                            <li><img alt="" src="../img/header/checked.png">
                                <p>Bảo hành chính hãng 2 năm</p>
                            </li>
                            <div class="clear-float"></div>
                        </ul>
                    </div>
                </div>
            </div>


<div class="row section-footer">
 <div class="section-footer-left col-9">

                        <div class="description">
                            <p><%=product.getDescription() %></p>
                        </div>
                        <div class="comment">
                            <div class="comment_header">
                                <h5>Đánh giá và nhận xét của <%=product.getName() %></h5>
                                <button class="btn btn-info" <%if(user==null){ %> id="btnLoginToComment" <% } else { %> id="btnShowComment" <% } %>>Viết nhận xét của bạn</button>
                            </div>
                            <div class="clear-float"></div>
                            <h6>Nhận xét về sản phẩm (<a href="#"> <%=listComment.size() %> đánh giá </a>)</h6>
                            <% for(int i=0;i<listComment.size();i++){
							int customerID=listComment.get(i).getCustomerID();
							String content =listComment.get(i).getComment();
							int rating=listComment.get(i).getRating();
							customer= customerDAO.customerByID(customerID);

					%>
                            <div class="commentEachOther">
                                <div style="color: #faca51; padding:10px">
                                    <%
					for(int a=0;a<rating;a++){ %>
                                    <span><i class="fas fa-star"></i></span>
                                    <%
					}
					for(int a=0;a<(5-rating);a++){
                    %>
                                    <span style="color:gray"><i class="fas fa-star"></i></span>
                                    <%
					}
                    %>
                                </div>
                                <%if(user!=null && customerID==user.getId()){ %>
                                <i id="deleteComment" data-id="<%=listComment.get(i).getId() %>" class="fas fa-times" style="cursor:pointer; float: right; margin-right: 20px;"></i>
                                <%} %>
                                <div class="customerComment">
                                    <span>bởi </span><span><%=customer.getName() %></span>
                                </div>

                                <p><%=content %></p>
                            </div>
                            <%
						}
                    %>
                        </div>
                        <div id="writeComment">
                            <h4>Gửi nhận xét của bạn</h4>
                            <div>
                                <h5 style="float:left">1. Đánh giá của bạn về sản phẩm này</h5>
                                <div class='rating-stars' style="font-size: 8px; float:left">
                                    <ul id='stars' style="padding: 5px;">
                                        <li class='star' data-value='1'><i class='fa fa-star fa-fw'></i></li>
                                        <li class='star' data-value='2'><i class='fa fa-star fa-fw'></i></li>
                                        <li class='star' data-value='3'><i class='fa fa-star fa-fw'></i></li>
                                        <li class='star' data-value='4'><i class='fa fa-star fa-fw'></i></li>
                                        <li class='star' data-value='5'><i class='fa fa-star fa-fw'></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="clear-float"></div>
                            <div>
                                <span>2. Viết nhận xét của bạn vào bên dưới</span> <span class="alert" id="alert_Comment"></span>
                                <textarea id="textComment" type="text" class="form-control" rows="5"></textarea>
                            </div>

                            <button <%if(user!=null){ %> data-idUser="<%=user.getId() %>" data-idProduct="<%=product.getId() %>" <% } %> id="btnComment" class="btn btn-primary">Bình luận</button>

                        </div>
                    </div>



                    <div class="section-footer-right col-3">
                        <h4 class="sanphamlienquan">Các sản phẩm liên quan</h4>
                        <div class="info">
                            <div class="sanpham">

                                <div class=" row">

                               <%
                              							List<Product> listProduct = new ArrayList<>();
                              							listProduct = productDAO.listProductbyBrand(brandID);
                              							for (int i = 0; i < listProduct.size(); i++) {
                              								String name= listProduct.get(i).getName();
                              								String image= listProduct.get(i).getImage();
                              								int percent_promotion=listProduct.get(i).getPercent_promotion();
                              								int price=listProduct.get(i).getPrice();

                              						%>

                                              <div class="item">
                                                  <a href="Product.jsp?id=<%=listProduct.get(i).getId()%>" style="text-align:center">
                                                      <div>
                                                          <% if(percent_promotion>0){ %>
                                                          <p class="percent_promotion"><%=percent_promotion+ "%"%></p>
                                                          <img src="<%=image%>">
                                                          <h5 class="name" style="font-size:16px"><%=name%></h5>
                                                          <%int a= price-price*percent_promotion/100;%>
                                                          <span class="name" style="color:red">$<%=formatter.format(a) %> </span>
                                                          <span class="name"><strike>$<%=formatter.format(price) %></strike></span>

                                                          <% }
                              									else { %>
                                                          <img src="<%=listProduct.get(i).getImage()%>">
                                                          <h5 class="name" style="font-size:16px"><%=listProduct.get(i).getName()%></h5>
                                                          <span class="name">$<%=formatter.format(listProduct.get(i).getPrice()) %> </span>

                                                          <% } %>
                                                      </div>
                                                  </a>
                                              </div>
                                              <%
                              							}
                              						%>



                                </div>
                                <div class="clear-float"></div>
                            </div>

                        </div>
                    </div>









</div>

        </div>
        <div class="modal fade" id="hetHangModal" role="dialog">
            <div class="modal-dialog modal-center" role="document" style="top: 150px;">
                <div class="modal-content" style="border: 1px solid lightgray;width:80%;margin:auto">
                    <div class="modal-header" style="    background-color: aliceblue;">
                        <h3 class="modal-title">Thông Báo</h3>
                    </div>
                    <div class="modal-body">
                        <p>Sản phẩm này hiện tại đã hết hàng!</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <div class="modal fade" id="alertLoginModal" role="dialog" style="display: none">
        <div class="modal-dialog modal-center" role="document">
            <div class="modal-content" style="width: 80%;margin: auto; top: 150px">
                <div class="modal-header">
                    <h4 class="modal-title">Bạn cần đăng nhập để thực hiện chức năng này</h4>
                </div>
                <div style="text-align:center;    margin: 20px;">
                    <button type="button" id="btn-okToLogin" class="btn btn-primary">ĐĂNG NHẬP</button>

                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="deleteCommentModal" role="dialog">
        <div class="modal-dialog modal-center" role="document">
            <div class="modal-content" style="top:100px">
                <div class="modal-header">
                    <h4 class="modal-title">Bạn có chắc chắn muốn xóa Bình luận này không?</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="deleteCommentUser">Xóa</button>
                    <button type="button" class="btn" data-dismiss="modal">Hủy</button>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="Footer.jsp"%>
   <script src="../Js/product.js"></script>
</body>

</html>