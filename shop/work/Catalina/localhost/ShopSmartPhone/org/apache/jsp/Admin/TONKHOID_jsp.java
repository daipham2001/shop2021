/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.82
 * Generated at: 2023-11-27 14:21:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.project.ecommerce.dao.BrandDAO;
import com.project.ecommerce.model.Brand;
import java.text.DecimalFormat;
import com.project.ecommerce.model.Employee;
import com.project.ecommerce.dao.ProductDAO;
import com.project.ecommerce.model.Product;
import com.project.ecommerce.dao.CategoryDAO;
import com.project.ecommerce.model.Category;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;

public final class TONKHOID_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("com.project.ecommerce.model.Product");
    _jspx_imports_classes.add("com.project.ecommerce.dao.BrandDAO");
    _jspx_imports_classes.add("com.project.ecommerce.model.Employee");
    _jspx_imports_classes.add("com.project.ecommerce.model.Category");
    _jspx_imports_classes.add("com.project.ecommerce.dao.ProductDAO");
    _jspx_imports_classes.add("java.text.DecimalFormat");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("com.project.ecommerce.model.Brand");
    _jspx_imports_classes.add("com.project.ecommerce.dao.CategoryDAO");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("	 ");

		Employee user = (Employee) session.getAttribute("employeeSession");
		 if(user == null){			
			response.sendRedirect("LoginAdmin.jsp");
			return;
		} 
		
      out.write(" \n");
      out.write("\n");
      out.write("	");

	Product product= new Product();
	ProductDAO productDAO= new ProductDAO();
	List<Product> listProducts= new ArrayList<>();
	String idCate=  request.getParameter("idCate");
	
	listProducts= productDAO.listProductbyCategory(Integer.parseInt(idCate));
	Brand brand= new Brand();
	BrandDAO brandDAO= new BrandDAO();
	List<Category> lisCategories= new ArrayList<>();
	Category category=new Category();
	CategoryDAO categoryDAO= new CategoryDAO();
	DecimalFormat formatter = new DecimalFormat("###,###,###");
		
		
	
      out.write("\n");
      out.write("<div class=\"content-page\">\n");
      out.write("		<p class=\"head-table\">Danh sách Sản Phẩm</p>\n");
      out.write("\n");
      out.write("		<div style=\"height: 480px\" class=\"content-table table-responsive\">\n");
      out.write("				<table class=\"table table-striped edit-table-view\" >			\n");
      out.write("					<tr >\n");
      out.write("						<th style=\"width: 10%\">Mã Sản Phẩm</th>\n");
      out.write("						<th style=\"width: 7%\">Hình ảnh</th>\n");
      out.write("						<th style=\"width: 28%\">Tên Sản Phẩm</th>\n");
      out.write("						\n");
      out.write("						<th style=\"width: 15%\">Hãng</th>\n");
      out.write("						<th style=\"width: 10%\">Số Lượng (cái)</th>\n");
      out.write("						<th style=\"width: 30%\"></th>\n");
      out.write("						</tr>\n");
      out.write("				 	");

					  for (int i = 0; i < listProducts.size(); i++) {  
						  String idProduct=listProducts.get(i).getId();
						  String name=listProducts.get(i).getName();
						  String image=listProducts.get(i).getImage();
						  int quantity=listProducts.get(i).getQuantity();

						  brand= brandDAO.brandById(listProducts.get(i).getBrandID());
						  
					
      out.write(" \n");
      out.write("					<tr style=\"height:70px\" class=\"tableViewContent contentPage\" >\n");
      out.write("					\n");
      out.write("						<td >");
      out.print(idProduct );
      out.write("</td>\n");
      out.write("						<td style=\"text-align:center\"><img style=\"width:50px; height:auto\" alt=\"#\" src=\"");
      out.print(image);
      out.write("\"></td>\n");
      out.write("						<td class=\"colName\">");
      out.print(name);
      out.write("</td>\n");
      out.write("						<td>");
      out.print(brand.getName() );
      out.write("</td>\n");
      out.write("						<td class=\"colQuantity\">");
      out.print(quantity);
      out.write("</td>\n");
      out.write("						<td style=\"color:red\">\n");
      out.write("						");
if(quantity<5 && quantity>0){ 
      out.write("\n");
      out.write("							Bạn cần nhập thêm sản phẩm, sản phẩm đã gần hết hàng\n");
      out.write("						");
} else if(quantity==0){ 
      out.write("\n");
      out.write("							Sản phẩm đã hết hàng, bạn cần nhập thêm\n");
      out.write("							");
} 
      out.write("\n");
      out.write("						</td>\n");
      out.write("					</tr>	\n");
      out.write("				");

					}
				
      out.write("\n");
      out.write("			</table>\n");
      out.write("			\n");
      out.write("		</div>\n");
      out.write("		<ul style=\"margin-top: 20px\" id=\"pagination\" class=\"justify-content-center\">\n");
      out.write("	  	</ul>\n");
      out.write("	</div>\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("	$(function () {	\n");
      out.write("		var pageSize = 6; // Hiển thị 6 sản phẩm trên 1 trang\n");
      out.write("		showPage = function(page) {\n");
      out.write("			$(\".contentPage\").hide();\n");
      out.write("			$(\".contentPage\").each(function(n) {\n");
      out.write("				if (n >= pageSize * (page - 1) && n < pageSize * page)\n");
      out.write("					$(this).show();\n");
      out.write("			});        \n");
      out.write("		}\n");
      out.write("		showPage(1);\n");
      out.write("		///** Cần truyền giá trị vào đây **///\n");
      out.write("		var totalRows = ");
      out.print(listProducts.size());
      out.write("; // Tổng số sản phẩm hiển thị\n");
      out.write("		var btnPage = 3; \n");
      out.write("		var iTotalPages = Math.ceil(totalRows / pageSize);\n");
      out.write("\n");
      out.write("		var obj = $('#pagination').twbsPagination({\n");
      out.write("			totalPages: iTotalPages,\n");
      out.write("			visiblePages: btnPage,\n");
      out.write("			onPageClick: function (event, page) {\n");
      out.write("				/* console.info(page); */\n");
      out.write("				showPage(page);\n");
      out.write("			}\n");
      out.write("		});\n");
      out.write("	});\n");
      out.write("	</script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
