/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.82
 * Generated at: 2023-11-27 14:10:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LoginAdmin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>ShopSmartPhone</title>\n");
      out.write("<meta charset=\"UTF-8\">\n");
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
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"../Css/Fstyle.css\">\n");
      out.write("<style>\n");
      out.write("body  {\n");
      out.write("  background-image: url(\"../img/header/background.jpg\");\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("<script>\n");
      out.write("$(document).ready(function(){\n");
      out.write("	function isEmail(email) {\n");
      out.write("		var isValid = false;\n");
      out.write("		var regex = /^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$/;\n");
      out.write("		if(regex.test(email)) {\n");
      out.write("			isValid = true;\n");
      out.write("		}\n");
      out.write("		return isValid;\n");
      out.write("	}\n");
      out.write("	$(\"#textEmail\").keypress(function(){\n");
      out.write("		$(\"#email_alert\").html('')\n");
      out.write("		$(\"#pass_alert\").html('')\n");
      out.write("	})\n");
      out.write("		$(\"#textPassword\").keypress(function(){\n");
      out.write("		$(\"#pass_alert\").html('')\n");
      out.write("	})\n");
      out.write("	$(\"#btnLogin\").click(function(){\n");
      out.write("		var flag=0\n");
      out.write("		var email= $(\"#textEmail\").val()\n");
      out.write("		var pass= $(\"#textPassword\").val()\n");
      out.write("	 	if(email.trim()==''){\n");
      out.write("			$(\"#email_alert\").html(\"(*)Email không được để trống! \")\n");
      out.write("			flag=1\n");
      out.write("		}\n");
      out.write("		if(pass.trim()==''){\n");
      out.write("			$(\"#pass_alert\").html(\"(*)Mật khẩu không được để trống! \")\n");
      out.write("			flag=1\n");
      out.write("		} \n");
      out.write("		 if(email.trim() !=\"\" && isEmail(email)==false){\n");
      out.write("				$(\"#email_alert\").html('(*)Sai định dạng email');\n");
      out.write("				flag=1\n");
      out.write("			} \n");
      out.write("		if(flag==0){\n");
      out.write("			$.ajax({\n");
      out.write("				type: \"post\",\n");
      out.write("				url: \"/ShopSmartPhone/loginAdminServlet\",\n");
      out.write("				data: {\n");
      out.write("					email : email,\n");
      out.write("					pass : pass\n");
      out.write("				},\n");
      out.write("				success : function(response){\n");
      out.write("					if(response==\"success\"){\n");
      out.write("						window.location.href = \"http://localhost:8090/ShopSmartPhone/Admin/HomeAdmin.jsp\";\n");
      out.write("					}\n");
      out.write("					else if(response==\"wrong\"){\n");
      out.write("						$(\"#pass_alert\").html(\"(*) Sai email hoặc mật khẩu! \")\n");
      out.write("					} \n");
      out.write("				}\n");
      out.write("			});\n");
      out.write("		}\n");
      out.write("	})\n");
      out.write("	\n");
      out.write("	$('#forgot-password').click(function(){\n");
      out.write("		$(\"#forgotModal\").modal('show')\n");
      out.write("		$(\"#emailForgot\").keypress(function() {\n");
      out.write("		$(\"#alert-emailForgot\").html('')\n");
      out.write("		$(\"#alert-emailSuccess\").html('')\n");
      out.write("		})\n");
      out.write(" 		\n");
      out.write("		 $('#sendForgot').click(function(){\n");
      out.write("			 	var flag=0\n");
      out.write("				var email= $(\"#emailForgot\").val()\n");
      out.write("				var dataButton= $(this).attr(\"data-button\")\n");
      out.write("				if(email.trim() == \"\"){\n");
      out.write("					$(\"#alert-emailForgot\").html('(* Bạn cần điền email của bạn *)');\n");
      out.write("					$(\"#alert-emailSuccess\").html('')\n");
      out.write("					flag=1\n");
      out.write("				}\n");
      out.write("				 if(email.trim() !=\"\" && isEmail(email)==false){\n");
      out.write("					$(\"#alert-emailForgot\").html('(* Email không đúng định dạng *)');\n");
      out.write("					$(\"#alert-emailSuccess\").html('')\n");
      out.write("					flag=1\n");
      out.write("				} \n");
      out.write("				if(flag==0){\n");
      out.write("						 $.ajax({\n");
      out.write("							type : \"post\",\n");
      out.write("							url : \"/ShopSmartPhone/forgotPasswordServlet\",\n");
      out.write("							data : {\n");
      out.write("								email : email,\n");
      out.write("								dataButton : dataButton\n");
      out.write("							},\n");
      out.write("							success : function(response) {\n");
      out.write("								console.log(response)\n");
      out.write("								if (response == \"success\") {\n");
      out.write("									$(\"#alert-emailSuccess\").html('(*  Mail đã được gửi! Bạn hãy kiểm tra *)')\n");
      out.write("									\n");
      out.write("								}\n");
      out.write("								else if (response == \"fail\"){\n");
      out.write("										\n");
      out.write("									$(\"#alert-emailForgot\").html('(* Email này chưa được đăng kí *)')\n");
      out.write("								}\n");
      out.write("								\n");
      out.write("							}\n");
      out.write("						}); \n");
      out.write("				}\n");
      out.write("		})  \n");
      out.write("	})\n");
      out.write("	\n");
      out.write("})\n");
      out.write("\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<section style=\"margin-top:30px;\">\n");
      out.write("		<div class=\"container login\">\n");
      out.write("		\n");
      out.write("			\n");
      out.write("		<div class=\" formLogin\" style=\"margin-top:120px\">\n");
      out.write("		<form id=\"form-login\" > \n");
      out.write("		<h3 style=\"text-align:center;margin-bottom:20px; margin-top:20px\">QUẢN LÍ BÁN HÀNG</h3>\n");
      out.write("			<div class=\"form-group\">\n");
      out.write("\n");
      out.write("				<label >E-mail </label>\n");
      out.write("				<input placeholder=\"Vui lòng nhập email của bạn\" type=\"text\" id=\"textEmail\"  class=\"form-control\" >\n");
      out.write("					<span class= \"alert\" id= \"email_alert\"> </span>\n");
      out.write("			\n");
      out.write("					\n");
      out.write("\n");
      out.write("			</div>\n");
      out.write("			\n");
      out.write("			<div class=\"form-group\">\n");
      out.write("				<label >Mật Khẩu </label>\n");
      out.write("				<input placeholder=\"Vui lòng nhập mật khẩu của bạn\" type=\"password\" id=\"textPassword\"  class=\"form-control\">\n");
      out.write("					<span class= \"alert\" id= \"pass_alert\"></span>\n");
      out.write("\n");
      out.write("			</div>\n");
      out.write("            <a id=\"forgot-password\" href=\"#\" style=\"float:left\">Quên mật khẩu?</a>\n");
      out.write("			<div class=\"form-group\">\n");
      out.write("		    <button class=\"btn-login\" type=\"button\" id=\"btnLogin\" >Đăng nhập</button>\n");
      out.write("\n");
      out.write("			</div>\n");
      out.write("		</form>\n");
      out.write("		<div class=\"clear-float\"></div>\n");
      out.write("		</div>\n");
      out.write("		</div>\n");
      out.write("					<div class=\"modal fade\" id=\"forgotModal\" role=\"dialog\" style=\"display: none;top:150px\">\n");
      out.write("		<div class=\"modal-dialog modal-center\" role=\"document\">\n");
      out.write("			<div class=\"modal-content\" style=\"border: 1px solid lightgray;width:80%;margin:auto\">\n");
      out.write("			<div class=\"modal-header\" style=\"background-color: #F5F5F5\">\n");
      out.write("						<h2 class=\"modal-title\" style=\"color:black\" >Quên Mật Khẩu</h2>\n");
      out.write("						 <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("          <span aria-hidden=\"true\">&times;</span>\n");
      out.write("					</div>\n");
      out.write("					<div class=\"modal-body\">\n");
      out.write("					<p style=\"font-size:16px\">Nhập tài khoản mà bạn đã quên mật khẩu</p>\n");
      out.write("					<input type=\"text\" style=\"width:100%;border-radius: 5px; border:1px solid lightgray;padding:5px\" \n");
      out.write("					placeholder=\"E-mail\" id=\"emailForgot\" />\n");
      out.write("					<span class=\"alert\" style=\"font-size:15px; padding:20px 0px\" id=\"alert-emailForgot\"></span>\n");
      out.write("					<span class=\"alert\" style=\"font-size:15px; color:green; padding: 20px 0px\" id=\"alert-emailSuccess\"></span>\n");
      out.write("					<div class=modal-footer>\n");
      out.write("					<button data-button=\"forgotPass\" class=\"btn btn-primary\" id=\"sendForgot\">Gửi</button>\n");
      out.write("					</div>\n");
      out.write("					</form>\n");
      out.write("				</div>\n");
      out.write("				\n");
      out.write("			</div>\n");
      out.write("		</div>\n");
      out.write("	</div> \n");
      out.write("\n");
      out.write("</section>\n");
      out.write("\n");
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
