/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.82
 * Generated at: 2023-11-27 14:10:10 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.project.ecommerce.model.EmployeeSession;
import com.project.ecommerce.model.Employee;
import com.project.ecommerce.model.Customer;

public final class HomeAdmin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/Admin/../CssAdmin/fstyle.css", Long.valueOf(1699944475685L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("com.project.ecommerce.model.Employee");
    _jspx_imports_classes.add("com.project.ecommerce.model.Customer");
    _jspx_imports_classes.add("com.project.ecommerce.model.EmployeeSession");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>ShopSmartPhone</title>\n");
      out.write("<link rel=\"stylesheet\"\n");
      out.write("	href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\"\n");
      out.write("	integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\"\n");
      out.write("	crossorigin=\"anonymous\"> \n");
      out.write(" <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\n");
      out.write("<link rel=\"stylesheet\"\n");
      out.write("	href=\"https://use.fontawesome.com/releases/v5.4.1/css/all.css\"\n");
      out.write("	integrity=\"sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz\"\n");
      out.write("	crossorigin=\"anonymous\">\n");
      out.write(" <style>");
      out.write("@charset \"UTF-8\";\n");
      out.write("\n");
      out.write("header {\n");
      out.write("	background-color: #F8F8F8;\n");
      out.write("	border-bottom: 1px lightgray solid;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#header-content h3 {\n");
      out.write("	float: left;\n");
      out.write("	margin: 5px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#header-content .dropdown1 {\n");
      out.write("	float: right;\n");
      out.write("	padding: 0;\n");
      out.write("	margin: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#header-content .dropdown1 ul {\n");
      out.write("	margin-bottom: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#header-content .dropdown1 ul li {\n");
      out.write("	list-style: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#header-content .dropdown1 ul li a {\n");
      out.write("	color: black;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#header-content .dropdown1 ul li a:hover {\n");
      out.write("	cursor: pointer;\n");
      out.write("	background-color: #EEEEEE;\n");
      out.write("	color: blue;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown:hover .dropdown-content {\n");
      out.write("	display: block;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown-content {\n");
      out.write("	position: absolute;\n");
      out.write("	background-color: white;\n");
      out.write("	z-index: 1;\n");
      out.write("	display: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown-content ul {\n");
      out.write("	padding: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown-content ul li {\n");
      out.write("	border: 1px lightgray solid;\n");
      out.write("	background-color: white;\n");
      out.write("	width: 140%;\n");
      out.write("	float: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown-content ul li a {\n");
      out.write("	font-size: 14px;\n");
      out.write("	padding: 14px;\n");
      out.write("	display: block;\n");
      out.write("	text-decoration: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown-content ul li a i {\n");
      out.write("	margin-right: 5px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".sub-dropdown {\n");
      out.write("	position: relative;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".clear-float {\n");
      out.write("	clear: both;\n");
      out.write("}\n");
      out.write("\n");
      out.write("section {\n");
      out.write("	background-color: #F8F8F8;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .menu {\n");
      out.write("	padding: 0px;\n");
      out.write("	border-right: 1px lightgray solid;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content {\n");
      out.write("	margin: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .layout {\n");
      out.write("	margin: 0;\n");
      out.write("	padding: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .menu ul {\n");
      out.write("	padding: 0;\n");
      out.write("	margin: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .menu ul li {\n");
      out.write("	list-style: none;\n");
      out.write("	padding: 10px;\n");
      out.write("	border-bottom: 1px lightgray solid;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .menu ul li:hover {\n");
      out.write("	background-color: #EEEEEE;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .menu ul li a {\n");
      out.write("	padding-left: 10px;\n");
      out.write("	text-decoration: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .menu ul li a i {\n");
      out.write("	margin-right: 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .content {\n");
      out.write("	background-color: white;\n");
      out.write("	padding: 30px 30px 20px 30px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .content .Title-view {\n");
      out.write("	float: left;\n");
      out.write("	margin-bottom: 0;\n");
      out.write("	padding-bottom: 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".Title-add {\n");
      out.write("	margin-bottom: 0;\n");
      out.write("	padding-bottom: 10px;\n");
      out.write("	border-bottom: 1px solid lightgray;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".Title-edit {\n");
      out.write("	margin-bottom: 0;\n");
      out.write("	padding-bottom: 10px;\n");
      out.write("	border-bottom: 1px solid lightgray;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".search-ifo {\n");
      out.write("	float: right;\n");
      out.write("	padding: 5px 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".search-ifo input {\n");
      out.write("	float: left;\n");
      out.write("	border: 1px solid lightgray;\n");
      out.write("	border-top-left-radius: 5px;\n");
      out.write("	border-bottom-left-radius: 5px;\n");
      out.write("	padding: 5px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".search-ifo button {\n");
      out.write("	padding: 5px 10px;\n");
      out.write("	border: 1px solid lightgray;\n");
      out.write("	border-top-right-radius: 5px;\n");
      out.write("	border-bottom-right-radius: 5px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .content .content-page {\n");
      out.write("	margin-top: 20px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#section-content .content .content-page .head-table {\n");
      out.write("	border-top-left-radius: 5px;\n");
      out.write("	border-top-right-radius: 5px;\n");
      out.write("	text-align: left;\n");
      out.write("	padding: 10px;\n");
      out.write("	border: 1px lightgray solid;\n");
      out.write("	background-color: #F8F8F8;\n");
      out.write("	border-bottom: 0;\n");
      out.write("	margin-bottom: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".content-table {\n");
      out.write("	border: 1px solid lightgray;\n");
      out.write("	padding: 10px;\n");
      out.write("	width: 100%;\n");
      out.write("	padding-bottom: 20px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".edit-table-view {\n");
      out.write("	width: 100%;\n");
      out.write("	border: 1px lightgray solid;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".edit-table-view th {\n");
      out.write("	padding: 5px;\n");
      out.write("	border: 1px lightgray solid;\n");
      out.write("	border-top: 0;\n");
      out.write("	border-left: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".edit-table-view td {\n");
      out.write("	padding: 5px;\n");
      out.write("	border: 1px lightgray solid;\n");
      out.write("	border-top: 0;\n");
      out.write("	border-left: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".content .table-head {\n");
      out.write("	margin-top: 20px;\n");
      out.write("	border: 1px lightgray solid;\n");
      out.write("	background: #F8F8F8;\n");
      out.write("	border-top-left-radius: 5px;\n");
      out.write("	border-top-right-radius: 5px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".table-head p {\n");
      out.write("	margin-bottom: 0;\n");
      out.write("	padding: 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(".table-content {\n");
      out.write("	padding-top: 10px;\n");
      out.write("	padding-bottom: 10px;\n");
      out.write("	border-left: 1px lightgray solid;\n");
      out.write("	border-bottom: 1px lightgray solid;\n");
      out.write("	border-right: 1px lightgray solid;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".table-content input, select{\n");
      out.write("	padding: 0 5px;\n");
      out.write("	margin-left: 15px;\n");
      out.write("	border: 1px solid lightgray;\n");
      out.write("	border-radius: 5px;\n");
      out.write("}\n");
      out.write(".table-content textarea {\n");
      out.write("	padding: 0 5px;\n");
      out.write("	margin-left: 15px;\n");
      out.write("	border: 1px solid lightgray;\n");
      out.write("	border-radius: 5px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".table-content h6 {\n");
      out.write("	margin-left: 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".edit-table-add td {\n");
      out.write("	padding: 10px 10px 0 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".edit-table-add input {\n");
      out.write("	padding: 0 5px;\n");
      out.write("	border-radius: 5px;\n");
      out.write("	width: 70%;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".edit-table-add {\n");
      out.write("	width: 100%;\n");
      out.write("	border: 1px lightgray solid;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".edit-table-add textarea {\n");
      out.write("	padding: 0 5px;\n");
      out.write("	border: 1px lightgray solid;\n");
      out.write("	width: 70%;\n");
      out.write("	border-radius: 5px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".edit-table-add .button-control {\n");
      out.write("	padding: 10px 10px 20px 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".edit-table-add .button-control button {\n");
      out.write("	padding: 5px;\n");
      out.write("	border: 0px;\n");
      out.write("	border-radius: 5px;\n");
      out.write("	color: white;\n");
      out.write("	background-color: #00CC33;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".alert {\n");
      out.write("	color: red;\n");
      out.write("	font-size: 12px;\n");
      out.write("	font-weight: 400;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".edit-table-add p {\n");
      out.write("	margin: 0;\n");
      out.write("	border: 0;\n");
      out.write("	padding: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".table-content p {\n");
      out.write("	margin: 0;\n");
      out.write("	border: 0;\n");
      out.write("	padding: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write("body {\n");
      out.write("	background-color: #F5F5F5;\n");
      out.write("	/* width: 100%; */\n");
      out.write("	height: 100%;\n");
      out.write("	\n");
      out.write("}\n");
      out.write("\n");
      out.write(".container {\n");
      out.write("	width: 100%;\n");
      out.write("	margin: auto;\n");
      out.write("	padding-bottom: 30px;\n");
      out.write("	padding-top: 5%;\n");
      out.write("	background: #F8F8F8;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".label {\n");
      out.write("	height: 10%;\n");
      out.write("	width: 36%;\n");
      out.write("	margin: auto;\n");
      out.write("	background: #F5F5F5;\n");
      out.write("	border-radius: 5px 5px 0 0;\n");
      out.write("	border: 2px solid #DDDDDD;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".label p {\n");
      out.write("	margin-left: 5%;\n");
      out.write("	font-size: 18px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".remember {\n");
      out.write("	margin-left: 6%;\n");
      out.write("	margin-bottom: 5%;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".modal .modal-dialog{\n");
      out.write("	width: 100%;\n");
      out.write("    margin: auto;\n");
      out.write("    top: 100px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* .content-table .td-update button{\n");
      out.write("	padding: 5px;\n");
      out.write("    border: 0px;\n");
      out.write("    width:60px;\n");
      out.write("    border-radius: 5px;\n");
      out.write("    color: white;\n");
      out.write("    background-color: #007bff;\n");
      out.write("} */\n");
      out.write(".modal-header{\n");
      out.write("	background-color:cadetblue; \n");
      out.write("	color:white;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#pagination {\n");
      out.write("		display: flex;\n");
      out.write("		display: -webkit-flex; /* Safari 8 */\n");
      out.write("		flex-wrap: wrap;\n");
      out.write("		-webkit-flex-wrap: wrap; /* Safari 8 */\n");
      out.write("		justify-content: center;\n");
      out.write("		-webkit-justify-content: center;\n");
      out.write("	}\n");
      out.write("/* ---------abc-------- */\n");
      out.write(".modal-title{\n");
      out.write("	font-size:20px;\n");
      out.write("}\n");
      out.write(".modal-body, .modal-body h6 {\n");
      out.write("	font-size:16px;\n");
      out.write("}\n");
      out.write(".modal-body input{\n");
      out.write("	width: 100%;\n");
      out.write("    height: 30px;\n");
      out.write("    border: 1px solid lightgray;\n");
      out.write("    border-radius: 5px;\n");
      out.write("    margin-bottom: 10px;\n");
      out.write("}\n");
      out.write(".modal-body select{\n");
      out.write("	width:100%;\n");
      out.write("	height:30px;\n");
      out.write("	margin:0;\n");
      out.write("	 border: 1px solid lightgray;\n");
      out.write("    border-radius: 5px;\n");
      out.write("}\n");
      out.write(".btn-addcontent{\n");
      out.write("	position: absolute;\n");
      out.write("	    top: 37px;\n");
      out.write("    right: 400px;\n");
      out.write("}\n");
      out.write(" .table-content h6,\n");
      out.write(".table-content h5{\n");
      out.write("	font-size:16px;\n");
      out.write("	margin-left:15px;\n");
      out.write("}\n");
      out.write(".table-content input{\n");
      out.write("	height:30px;\n");
      out.write("}");
      out.write("</style> \n");
      out.write(" <script>\n");
      out.write(" $(document).ready(function() {\n");
      out.write("		var i = 0\n");
      out.write("		$(\"#btnUser\").click(function() {	\n");
      out.write("			if (i != 1) {\n");
      out.write("				$('#btnBrand').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnCategory').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnGoodReceipt').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnTonKho').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnPromotion').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnProduct').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnOrder').css('background-color', '#F8F8F8');\n");
      out.write("				$('#content').load('../Admin/EditProfile.jsp');\n");
      out.write("					i = 1;\n");
      out.write("			}\n");
      out.write("		})\n");
      out.write("\n");
      out.write("		$(\"#btnProduct\").click(function() {\n");
      out.write("			if (i != 2) {\n");
      out.write("				$('#btnBrand').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnCategory').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnPromotion').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnTonKho').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnGoodReceipt').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnProduct').css('background-color', '#EEEEEE');\n");
      out.write("				$('#btnOrder').css('background-color', '#F8F8F8');\n");
      out.write("				$('#content').load('../Admin/ProductAdmin.jsp');\n");
      out.write("					i = 2;\n");
      out.write("			}\n");
      out.write("		})\n");
      out.write("		$(\"#btnCategory\").click(function() {\n");
      out.write("			if (i != 3) {\n");
      out.write("				$('#btnProduct').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnBrand').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnOrder').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnTonKho').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnPromotion').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnGoodReceipt').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnCategory').css('background-color', '#EEEEEE');\n");
      out.write("				$('#content').load('../Admin/CategoryAdmin.jsp');\n");
      out.write("					i = 3;\n");
      out.write("			}\n");
      out.write("		})\n");
      out.write("			$(\"#btnBrand\").click(function() {\n");
      out.write("			if (i != 4) {\n");
      out.write("				$('#btnProduct').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnCategory').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnOrder').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnPromotion').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnTonKho').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnGoodReceipt').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnBrand').css('background-color', '#EEEEEE');\n");
      out.write("				$('#content').load('../Admin/BrandAdmin.jsp');\n");
      out.write("					i = 4;\n");
      out.write("			}\n");
      out.write("		})\n");
      out.write("			$(\"#btnOrder\").click(function() {\n");
      out.write("			if (i != 5) {\n");
      out.write("				$('#btnProduct').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnCategory').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnOrder').css('background-color', '#EEEEEE');\n");
      out.write("				$('#btnGoodReceipt').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnBrand').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnTonKho').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnPromotion').css('background-color', '#F8F8F8');\n");
      out.write("				$('#content').load('../Admin/OrderAdmin.jsp');\n");
      out.write("					i = 5;\n");
      out.write("			}\n");
      out.write("		})\n");
      out.write("		$(\"#btnGoodReceipt\").click(function() {\n");
      out.write("			if (i != 8) {\n");
      out.write("				$('#btnProduct').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnCategory').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnOrder').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnGoodReceipt').css('background-color', '#EEEEEE');\n");
      out.write("				$('#btnBrand').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnTonKho').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnPromotion').css('background-color', '#F8F8F8');\n");
      out.write("				$('#content').load('../Admin/GoodReceipt.jsp');\n");
      out.write("					i = 8;\n");
      out.write("			}\n");
      out.write("		})\n");
      out.write("		$(\"#btnPromotion\").click(function() {\n");
      out.write("			if (i != 6) {\n");
      out.write("				$('#btnProduct').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnCategory').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnOrder').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnBrand').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnGoodReceipt').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnPromotion').css('background-color', '#EEEEEE');\n");
      out.write("				$('#btnTonKho').css('background-color', '#F8F8F8');\n");
      out.write("				$('#content').load('../Admin/PromotionAdmin.jsp');\n");
      out.write("					i = 6;\n");
      out.write("			}\n");
      out.write("		})\n");
      out.write("		$(\"#btnTonKho\").click(function() {\n");
      out.write("			if (i != 7) {\n");
      out.write("				$('#btnProduct').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnCategory').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnOrder').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnBrand').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnGoodReceipt').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnPromotion').css('background-color', '#F8F8F8');\n");
      out.write("				$('#btnTonKho').css('background-color', '#EEEEEE');\n");
      out.write("				$('#content').load('../Admin/TonKho.jsp');\n");
      out.write("					i = 7;\n");
      out.write("			}\n");
      out.write("		})\n");
      out.write("		$('#btnTonKho').css('background-color', '#F8F8F8');\n");
      out.write("		$('#btnProduct').css('background-color', '#F8F8F8');\n");
      out.write("		$('#btnBrand').css('background-color', '#F8F8F8');\n");
      out.write("		$('#btnPromotion').css('background-color', '#F8F8F8');\n");
      out.write("		$('#btnOrder').css('background-color', '#F8F8F8');\n");
      out.write("		$('#btnGoodReceipt').css('background-color', '#F8F8F8');\n");
      out.write("		$('#btnCategory').css('background-color', '#EEEEEE');\n");
      out.write("		$('#content').load('../Admin/CategoryAdmin.jsp');\n");
      out.write("\n");
      out.write("	})\n");
      out.write(" </script>\n");
      out.write("\n");
      out.write("<title>Trang quản lý</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("		 ");

		Employee user = (Employee) session.getAttribute("employeeSession");
		 if(user == null){			
			response.sendRedirect("LoginAdmin.jsp");
			return;
		}

			session.setAttribute("cmbPromotion",1);
			session.setAttribute("idProductSeri","MH01");
		
      out.write(" \n");
      out.write("	<header id=\"header-content\">\n");
      out.write("		<div class=\"container-fluid\">\n");
      out.write("			<h3 class=\"cms\">QUAN LY</h3>\n");
      out.write("			<div class=\"dropdown1\">\n");
      out.write("				<ul>\n");
      out.write("					<li class=\"dropdown\"><a\n");
      out.write("						style=\"padding: 10px; display: block; text-decoration: none; margin: 0 0 0 60px;\"><i\n");
      out.write("							style=\"margin-right: 10px; font-size: 20px\" class=\"fas fa-user\"></i><i\n");
      out.write("							class=\"fas fa-caret-down\"></i> </a>\n");
      out.write("						<div class=\"dropdown-content\">\n");
      out.write("							<ul>\n");
      out.write("								<li id=\"btnUser\" class=\"sub-dropdown\"><a href=\"#\"><i\n");
      out.write("										class=\"fas fa-user\"></i>Hồ sơ</a></li>\n");
      out.write("								<li style=\"border-top: 0;\" class=\"sub-dropdown\"><a\n");
      out.write("									href=\"/ShopSmartPhone/logOutServlet?role=admin\"><i class=\"fas fa-sign-out-alt\"></i>Thoát</a></li>\n");
      out.write("							</ul>\n");
      out.write("						</div></li>\n");
      out.write("				</ul>\n");
      out.write("			</div>\n");
      out.write("			<div class=\"clear-float\"></div>\n");
      out.write("		</div>\n");
      out.write("\n");
      out.write("	</header>\n");
      out.write("	<section id=\"section-content\" class=\"preloading\">\n");
      out.write("		<div class=\"layout container-fluid row\">\n");
      out.write("			<div class=\"menu col-md-4 col-lg-2\">\n");
      out.write("				<ul>\n");
      out.write("					\n");
      out.write("					<li id=\"btnCategory\"><a href=\"#\"><i class=\"fas fa-box\"></i>Thể Loại</a></li>\n");
      out.write("					\n");
      out.write("						<li id=\"btnBrand\"><a href=\"#\"><i\n");
      out.write("							class=\"fas fa-box\"></i>Hãng</a></li>\n");
      out.write("					\n");
      out.write("					<li id=\"btnProduct\"><a href=\"#\"><i class=\"fas fa-newspaper\"></i>Sản Phẩm</a></li>\n");
      out.write("					\n");
      out.write("					<li id=\"btnOrder\"><a href=\"#\"><i class=\"fas fa-edit\"></i>Đặt Hàng</a></li>\n");
      out.write("					<li id=\"btnPromotion\"><a href=\"#\"><i class=\"fas fa-tags\"></i>Đợt Giảm Giá</a></li>\n");
      out.write("					<li id=\"btnGoodReceipt\"><a href=\"#\"><i class=\"far fa-plus-square\"></i>Nhập Hàng</a></li>\n");
      out.write("					<li id=\"btnTonKho\"><a href=\"#\"><i class=\"fas fa-chart-bar\"></i>Tồn Kho</a></li>\n");
      out.write("					\n");
      out.write("				\n");
      out.write("					\n");
      out.write("				</ul>\n");
      out.write("			</div>\n");
      out.write("			<div class=\"content col-12 col-sm-12 col-md-8 col-lg-10\">\n");
      out.write("				<div id=\"content\" ></div>\n");
      out.write("			</div>\n");
      out.write("\n");
      out.write("		</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("	</section>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
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