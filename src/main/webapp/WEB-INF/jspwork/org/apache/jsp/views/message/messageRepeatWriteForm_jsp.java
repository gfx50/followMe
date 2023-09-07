/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.78
 * Generated at: 2023-09-06 13:26:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.message;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import member.model.vo.Member;
import member.model.vo.Member;
import java.util.ArrayList;
import trail.model.vo.Trail;
import follow.model.vo.Follow;
import javax.servlet.http.HttpSession;

public final class messageRepeatWriteForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/views/message/../common/head.jsp", Long.valueOf(1693643825518L));
    _jspx_dependants.put("/views/message/../common/navbar.jsp", Long.valueOf(1694005937110L));
    _jspx_dependants.put("/views/message/../common/footer.jsp", Long.valueOf(1693144244000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("javax.servlet.http.HttpSession");
    _jspx_imports_classes.add("follow.model.vo.Follow");
    _jspx_imports_classes.add("member.model.vo.Member");
    _jspx_imports_classes.add("trail.model.vo.Trail");
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
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
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
      			"/fm/views/common/error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

	Member member = (Member)request.getAttribute("member");

      out.write("   \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"ko\" data-bs-theme=\"auto\">\n");
      out.write("<head>\n");
      out.write("	<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"/fm/apple-touch-icon.png\">\n");
      out.write("<link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"/fm/favicon-32x32.png\">\n");
      out.write("<link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"/fm/favicon-16x16.png\">\n");
      out.write("<link rel=\"manifest\" href=\"/fm/site.webmanifest\">\n");
      out.write("\n");
      out.write("		<meta charset=\"utf-8\">\n");
      out.write("		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("		<meta name=\"description\" content=\"\">\n");
      out.write("		<title>FollowMe! Trail Sharing SNS</title>\n");
      out.write("	\n");
      out.write("<!-- 		<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/@docsearch/css@3\"> -->\n");
      out.write("\n");
      out.write("<!-- 부트스트랩, 부트스트랩 아이콘 css, js,  jquery 로드 -->	\n");
      out.write("	<link href=\"/fm/resources/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("	<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css\">\n");
      out.write("\n");
      out.write("	<script src=\"/fm/resources/js/jquery-3.7.0.min.js\"></script>\n");
      out.write("	<script src=\"/fm/resources/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- 수제 css , js 로드 -->\n");
      out.write("	<link href=\"/fm/resources/css/fm.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("	<script src=\"/fm/resources/js/fm.js\"></script>\n");
      out.write("	\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function showmsgListView(){\r\n");
      out.write("	location.href = \"/fm/msgcol\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");

	Member loginMember = (Member)session.getAttribute("loginMember");


      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("    document.addEventListener(\"DOMContentLoaded\", function () {\r\n");
      out.write("        var navLinks = document.querySelectorAll(\".nav-li a\");\r\n");
      out.write("\r\n");
      out.write("        for (var i = 0; i < navLinks.length; i++) {\r\n");
      out.write("            navLinks[i].addEventListener(\"mouseover\", function (event) {\r\n");
      out.write("                this.classList.add(\"highlighted\");\r\n");
      out.write("            });\r\n");
      out.write("\r\n");
      out.write("            navLinks[i].addEventListener(\"mouseout\", function (event) {\r\n");
      out.write("                this.classList.remove(\"highlighted\");\r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("</script>\r\n");
      out.write("<div class=\"top-bar\"></div>\r\n");
      out.write("<div class=\"head-div2\">\r\n");
      out.write("	<div class=\"nav-div2 container\">\r\n");
      out.write("		<ul class=\"nav-ul2\">\r\n");
      out.write("			<li class=\"nav-li2\"><a href=\"/fm/tlist\">HOME</a></li>\r\n");
      out.write("			<li class=\"nav-li2\"><a href=\"/fm/views/trail/create.jsp\">TRAIL</a></li>\r\n");
      out.write("			<li class=\"nav-li2\"><a href=\"/fm/msgcol\">MESSAGE</a></li>\r\n");
      out.write("			<li class=\"nav-li2\"><a href=\"/fm/flist?mid=");
      out.print( loginMember.getmId() );
      out.write("\">FOLLOW</a></li>\r\n");
      out.write("			<li class=\"nav-li2\" id=\"myProfile\"><a href=\"/fm/myinfo\">MYPROFILE</a></li>\r\n");
      out.write("			<li class=\"nav-li2\"><a href=\"/fm/nlist\">NOTICE</a></li>\r\n");
      out.write("		</ul>\r\n");
      out.write("	</div>\r\n");
      out.write("	<div class=\"nav-search2\">\r\n");
      out.write("	<img class=\"search-icon2\" src=\"/fm/resources/img/search.jpeg\" onclick=\"search();\">\r\n");
      out.write("	<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"25\" height=\"25\" fill=\"currentColor\" class=\"bi bi-box-arrow-right\" viewBox=\"0 0 16 16\" onclick=\"logout();\" style=\"cursor: pointer;\">\r\n");
      out.write("	    <path fill-rule=\"evenodd\" d=\"M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z\"/>\r\n");
      out.write("	    <path fill-rule=\"evenodd\" d=\"M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z\"/>\r\n");
      out.write("	</svg>\r\n");
      out.write("	</svg>\r\n");
      out.write("	</div>\r\n");
      out.write("	<div class=\"main-logo-img2\">\r\n");
      out.write("		<a href=\"/fm/pheonix.jsp\"><img class=\"logo-img2\" src=\"/fm/resources/img/Followmelogo.png\"></a>\r\n");
      out.write("	</div>\r\n");
      out.write("</div>\r\n");
      out.write("<hr>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function logout(){\r\n");
      out.write("	location.href=\"/fm/logout\"\r\n");
      out.write("}\r\n");
      out.write("function search(){\r\n");
      out.write("	location.href=\"/fm/views/trail/search.jsp\"\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<hr>\r\n");
      out.write("<br>\r\n");
      out.write("<h1 align=\"center\">메세지 작성하기</h1>\r\n");
      out.write("<br>\r\n");
      out.write("<form action=\"/fm/msgsend\" method=\"post\">\r\n");
      out.write("<table align=\"center\" width=\"500\" border=\"1\" cellspacing=\"0\" cellpadding=\"5\">\r\n");
      out.write("<input type=\"hidden\"  name=\"writer\" value=\"");
      out.print( loginMember.getmId());
      out.write("\">\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>받는 사람</th>\r\n");
      out.write("		<td><input type=\"text\" name=\"email\" size=\"50\" value=\"");
      out.print( member.getEmail());
      out.write("\" readonly></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>작성자</th>\r\n");
      out.write("		<td><input type=\"text\" name=\"mname\" readonly value=\"");
      out.print( loginMember.getmName());
      out.write("\"></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th>내 용</th>\r\n");
      out.write("		<td><textarea rows=\"5\" cols=\"50\" name=\"content\" placeholder=\"내용을 입력해주세요.\"></textarea></td>\r\n");
      out.write("	</tr>\r\n");
      out.write("	<tr>\r\n");
      out.write("		<th colspan=\"2\">\r\n");
      out.write("		<br>\r\n");
      out.write("			 &nbsp; &nbsp; \r\n");
      out.write("			<button type=\"submit\" value=\"등록하기\" class=\"btn btn-outline-secondary\">등록하기</button> &nbsp;\r\n");
      out.write("			<button type=\"button\" class=\"btn btn-outline-secondary\" onclick=\"showmsgListView();\">작성취소</button>\r\n");
      out.write("			<br><br>\r\n");
      out.write("		</th>		\r\n");
      out.write("	</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("\r\n");
      out.write("<hr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("	  <footer class=\"d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top\">\r\n");
      out.write("		<p class=\"col-md-4 mb-0 text-body-secondary\">&copy; 2023 Team Phoenix</p>\r\n");
      out.write("	\r\n");
      out.write("<!-- 		<a href=\"/fm/menu.jsp\" class=\"col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none\"> -->\r\n");
      out.write("<!-- 		  <svg class=\"bi me-2\" width=\"40\" height=\"32\"><use xlink:href=\"#bootstrap\"/></svg> -->\r\n");
      out.write("<!-- 		</a> -->\r\n");
      out.write("		</footer>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
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