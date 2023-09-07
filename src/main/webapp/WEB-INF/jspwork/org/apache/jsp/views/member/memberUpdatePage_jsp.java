/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.78
 * Generated at: 2023-09-06 13:50:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import member.model.vo.Member;
import member.model.vo.Member;
import java.util.ArrayList;
import trail.model.vo.Trail;
import follow.model.vo.Follow;
import javax.servlet.http.HttpSession;

public final class memberUpdatePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/views/member/../common/navbar.jsp", Long.valueOf(1694005937110L));
    _jspx_dependants.put("/views/member/../common/footer.jsp", Long.valueOf(1693144244000L));
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"kr\">\r\n");
      out.write("<head>\r\n");
      out.write("	<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"/fm/apple-touch-icon.png\">\r\n");
      out.write("	<link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"/fm/favicon-32x32.png\">\r\n");
      out.write("	<link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"/fm/favicon-16x16.png\">\r\n");
      out.write("	<link rel=\"manifest\" href=\"/fm/site.webmanifest\">\r\n");
      out.write("	\r\n");
      out.write("	<meta charset=\"utf-8\">\r\n");
      out.write("	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("	<meta name=\"description\" content=\"\">\r\n");
      out.write("	<title>FollowMe! Trail Sharing SNS</title>\r\n");
      out.write("	<link rel=\"stylesheet\" href=\"/fm/resources/css/bootstrap.min.css\">\r\n");
      out.write("	<link rel=\"stylesheet\" href=\"/fm/resources/css/bootstrap-icons-1.10.5/font/bootstrap-icons.min.css\">\r\n");
      out.write("	<link href=\"/fm/resources/css/fileinput.css\" rel=\"stylesheet\">\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	<script src=\"/fm/resources/js/jquery-3.7.0.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<script src=\"/fm/resources/js/fileinput/plugins/buffer.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("	<script src=\"/fm/resources/js/fileinput/plugins/filetype.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("	<script src=\"/fm/resources/js/fileinput/plugins/piexif.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("	<script src=\"/fm/resources/js/fileinput/plugins/sortable.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("	<script src=\"/fm/resources/js/bootstrap.min.js\"></script>\r\n");
      out.write("	<script src=\"/fm/resources/js/fileinput/fileinput.js\"></script>\r\n");
      out.write("\r\n");
      out.write("	<script src=\"/fm/resources/js/fileinput/locales/kr.js\"></script>\r\n");
      out.write("\r\n");
      out.write("	<link href=\"/fm/resources/css/fm.css\" rel=\"stylesheet\">\r\n");
      out.write("	<script src=\"/fm/resources/js/fm.js\"></script>\r\n");
      out.write("	<script type=\"text/javascript\" src=\"/fm/resources/js/profilepic.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write(".kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {\r\n");
      out.write("    margin: 0;\r\n");
      out.write("    padding: 0;\r\n");
      out.write("    border: none;\r\n");
      out.write("    box-shadow: none;\r\n");
      out.write("    text-align: center;\r\n");
      out.write("}\r\n");
      out.write(".kv-avatar {\r\n");
      out.write("    display: inline-block;\r\n");
      out.write("}\r\n");
      out.write(".kv-avatar .file-input {\r\n");
      out.write("    display: table-cell;\r\n");
      out.write("    width: 213px;\r\n");
      out.write("}\r\n");
      out.write(".kv-reqd {\r\n");
      out.write("    color: red;\r\n");
      out.write("    font-family: monospace;\r\n");
      out.write("    font-weight: normal;\r\n");
      out.write("}\r\n");
      out.write(".dn {\r\n");
      out.write("            display: none; /* 요소 숨김 */\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function dupEmailCheck(){\r\n");
      out.write("	$.ajax({\r\n");
      out.write("		url: \"/fm/dupemail\",\r\n");
      out.write("		type: \"post\",\r\n");
      out.write("		data: { email: $('#email').val() },\r\n");
      out.write("		success: function(data){\r\n");
      out.write("			console.log(\"success : \" + data);\r\n");
      out.write("			if(data == \"ok\"){\r\n");
      out.write("				var hiddenDiv = document.querySelector('.hidden-toast2');\r\n");
      out.write("				if (hiddenDiv !== null) {\r\n");
      out.write("					hiddenDiv.style.display = 'block';\r\n");
      out.write("				}\r\n");
      out.write("			}else{\r\n");
      out.write("				var hiddenDiv = document.querySelector('.hidden-toast');\r\n");
      out.write("				if (hiddenDiv !== null) {\r\n");
      out.write("					hiddenDiv.style.display = 'block';\r\n");
      out.write("				}\r\n");
      out.write("			}\r\n");
      out.write("		},\r\n");
      out.write("		error: function(jqXHR, textStatus, errorThrown){\r\n");
      out.write("			console.log(\"error : \" + jqXHR + \", \" + textStatus + \", \" + errorThrown);\r\n");
      out.write("		}\r\n");
      out.write("	});\r\n");
      out.write("	return false; \r\n");
      out.write("}\r\n");
      out.write("function displayToast() {\r\n");
      out.write("	var exitDiv = document.querySelector('.hidden-toast');\r\n");
      out.write("	if (exitDiv !== null) {\r\n");
      out.write("		exitDiv.style.display = 'none';\r\n");
      out.write("	}\r\n");
      out.write("}\r\n");
      out.write("function displayToast2() {\r\n");
      out.write("	var exitDiv = document.querySelector('.hidden-toast2');\r\n");
      out.write("	if (exitDiv !== null) {\r\n");
      out.write("		exitDiv.style.display = 'none';\r\n");
      out.write("	}\r\n");
      out.write("}\r\n");
      out.write("function randomHangulName() {\r\n");
      out.write("	  const 형용사 = [\r\n");
      out.write("	    \"화가난 \", \"웃는 \", \"화끈한 \", \"매끈한 \", \"조용한 \", \"예쁜 \", \"더러운 \", \"망할 \", \"새로운 \", \"화끈한 \",\r\n");
      out.write("	    \"새로운 \", \"시끄러운 \", \"늙은 \", \"구운 \", \"차가운 \", \"놀라운 \", \"신박한 \", \"기발한 \", \"기존의 \", \"날것의 \",\r\n");
      out.write("	    \"감동적인 \", \"감격의 \", \"치사한 \", \"놀라운 \", \"잘생긴 \", \"귀여운 \", \"멀쩡한 \", \"이상한 \", \"배부른 \", \"배고픈 \",\r\n");
      out.write("	    \"지루한 \", \"루즈한 \", \"망한 \", \"실패한 \", \"사라진 \", \"실종된 \", \"나타난 \"\r\n");
      out.write("	  ];\r\n");
      out.write("	  const 명사 = [\r\n");
      out.write("	    \"강아지\", \"장동건\", \"개\", \"소\", \"말\", \"뱀\", \"개구리\", \"돼지\", \"도야지\", \"근\", \"도마뱀\", \"코끼리\", \"거미\",\r\n");
      out.write("	    \"지렁이\", \"프로틴\", \"물병\", \"아이폰\", \"공주\", \"왕자\", \"거지\", \"노숙자\", \"오리\", \"거위\", \"똥\", \"대머리\", \"라신\",\r\n");
      out.write("	    \"라이즈\", \"카타리나\", \"개미\", \"말벌\", \"탈모인\", \"서퍼\", \"판사\", \"의사\", \"개발자\", \"이혼남\", \"이혼녀\", \"쿼카\",\r\n");
      out.write("	    \"호랑이\", \"사자\", \"기린\", \"티라노\", \"감스트\", \"아빠\", \"엄마\", \"새\", \"독수리\", \"참새\", \"거위\"\r\n");
      out.write("	  ];\r\n");
      out.write("\r\n");
      out.write("	  const randomIndex = (array) => Math.floor(Math.random() * array.length);\r\n");
      out.write("	  const random형용사 = 형용사[randomIndex(형용사)];\r\n");
      out.write("	  const random명사 = 명사[randomIndex(명사)];\r\n");
      out.write("\r\n");
      out.write("	  return random형용사 + random명사;\r\n");
      out.write("}\r\n");
      out.write("function randomnick(){\r\n");
      out.write("	const nicknameInput = document.querySelector('input[name=\"nickname\"]');\r\n");
      out.write("	  const randomNickname = randomHangulName();\r\n");
      out.write("	  nicknameInput.value = randomNickname;\r\n");
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
      out.write("<br><br>\r\n");
      out.write("<h1 align=\"center\">");
      out.print( member.getmName() );
      out.write("님의 회원 정보 수정 페이지</h1>\r\n");
      out.write("<br><br><br>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <form class=\"form form-vertical\" action=\"/fm/mupdate\" method=\"post\" enctype=\"multipart/form-data\">\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("        <div class=\"col-sm-6 text-center\">\r\n");
      out.write("            <div class=\"kv-avatar\">\r\n");
      out.write("                <div class=\"file-loading\">\r\n");
      out.write("                    <input id=\"avatar-1\" name=\"profilepic\" type=\"file\">\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"kv-avatar-hint\">\r\n");
      out.write("                <small>최대파일 사이즈 1.5MB</small>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col-sm-6\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-sm-6\">\r\n");
      out.write("                    <div class=\"form-group2\">\r\n");
      out.write("                        <label for=\"email\">이메일<span class=\"kv-reqd\">*</span></label>\r\n");
      out.write("						<input type=\"email\" class=\"form-control2\" id=\"email\" name=\"email\" value=\"");
      out.print( member.getEmail() );
      out.write("\" style=\"width:300px;\">\r\n");
      out.write("						<input type=\"button\" class=\"btn btn-outline-dark\" value=\"중복체크\" onclick=\"dupEmailCheck();\" style=\"font-size:12px; margin-top: 10px;\">\r\n");
      out.write("                        <br><br>\r\n");
      out.write("						<label for=\"pwd\">새 비밀번호<span class=\"kv-reqd\">*</span></label>\r\n");
      out.write("                        <input type=\"password\" class=\"form-control\" name=\"pwd\" id=\"pwd\" value=\"");
      out.print(member.getPwd() );
      out.write("\" placeholder=\"*************\">\r\n");
      out.write("                        <label for=\"pwd\">비밀번호 확인<span class=\"kv-reqd\">*</span></label>\r\n");
      out.write("                        <input type=\"password\" class=\"form-control\" id=\"pwd2\" placeholder=\"*************\" >\r\n");
      out.write("						<span id=\"pass_true\" class=\"dn\" style=\"color: green;\">비밀번호가 일치합니다.</span>\r\n");
      out.write("    					<span id=\"pass_false\" class=\"dn\" style=\"color: red;\">비밀번호가 불일치합니다. 재작성해주세요.</span></td></tr>\r\n");
      out.write("						\r\n");
      out.write("						<br>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-sm-6\">\r\n");
      out.write("                    <div class=\"form-group2\">\r\n");
      out.write("						<br>\r\n");
      out.write("						<label for=\"fname\">닉네임</label>\r\n");
      out.write("                        <div style=\"display: flex; align-items: center;\">\r\n");
      out.write("						  \r\n");
      out.write("						  <input type=\"text\" class=\"form-control\" name=\"nickname\" value=\"");
      out.print( member.getNickName() );
      out.write("\" style=\"width:276px;\">\r\n");
      out.write("						  <button type=\"button\" class=\"btn btn-primary button-side\" id=\"randomButton\" onclick=\"randomnick();\">랜덤</button>\r\n");
      out.write("						</div>\r\n");
      out.write("                        <label for=\"lname\">이름</label>\r\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"mname\" value=\"");
      out.print( member.getmName() );
      out.write("\">\r\n");
      out.write("                        <label for=\"lname\">전화번호</label>\r\n");
      out.write("                        <input type=\"phone\" class=\"form-control\" name=\"phone\" value=\"");
      out.print( member.getPhone() );
      out.write("\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                <hr>\r\n");
      out.write("                </div>\r\n");
      out.write("               <div class=\"form-group\">\r\n");
      out.write("                <div class=\"text-right\">\r\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">회원정보수정</button>\r\n");
      out.write("                </div>\r\n");
      out.write("				</div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</form>\r\n");
      out.write("<div class=\"hidden-toast\"\r\n");
      out.write("	style=\"margin: 0 auto; width: 80%; display: none; position: fixed; top: 30%; left: 30%;z-index:9;\">\r\n");
      out.write("	<div class=\"toast fade show \" role=\"alert\" aria-live=\"assertive\"\r\n");
      out.write("		aria-atomic=\"true\"\r\n");
      out.write("		style=\"width: 500px; height: 100px;\">\r\n");
      out.write("		<div class=\"toast-header\">\r\n");
      out.write("			<svg class=\"bd-placeholder-img rounded me-2\" width=\"20\"\r\n");
      out.write("				height=\"20\" xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\"\r\n");
      out.write("				preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\">\r\n");
      out.write("				<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-exclamation-square\" viewBox=\"0 0 16 16\">\r\n");
      out.write("				  <path d=\"M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z\"/>\r\n");
      out.write("				  <path d=\"M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z\"/>\r\n");
      out.write("				</svg></svg>\r\n");
      out.write("\r\n");
      out.write("			<strong class=\"me-auto\">경고</strong> <small\r\n");
      out.write("				class=\"text-muted\"></small>\r\n");
      out.write("			<button type=\"button\" class=\"btn-close\" onclick=\"displayToast()\"></button>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"toast-body\" style=\"color: black; text-align: left;\">\r\n");
      out.write("		   이미 사용중인 이메일입니다.\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"hidden-toast2\"\r\n");
      out.write("	style=\"margin: 0 auto; width: 80%; display: none; position: fixed; top: 30%; left: 30%;z-index:9;\">\r\n");
      out.write("	<div class=\"toast fade show \" role=\"alert\" aria-live=\"assertive\"\r\n");
      out.write("		aria-atomic=\"true\"\r\n");
      out.write("		style=\"width: 500px; height: 100px;\">\r\n");
      out.write("		<div class=\"toast-header\">\r\n");
      out.write("			<svg class=\"bd-placeholder-img rounded me-2\" width=\"20\"\r\n");
      out.write("				height=\"20\" xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\"\r\n");
      out.write("				preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\">\r\n");
      out.write("				<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-chat-right\" viewBox=\"0 0 16 16\">\r\n");
      out.write("				  <path d=\"M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z\"/>\r\n");
      out.write("				</svg></svg>\r\n");
      out.write("\r\n");
      out.write("			<strong class=\"me-auto\">알림</strong> <small\r\n");
      out.write("				class=\"text-muted\"></small>\r\n");
      out.write("			<button type=\"button\" class=\"btn-close\" onclick=\"displayToast2()\"></button>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"toast-body\" style=\"color: black; text-align: left;\">\r\n");
      out.write("		   사용가능한 아이디 입니다.\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"kv-avatar-errors-1\" class=\"text-center\" style=\"display:none\"></div>\r\n");
      out.write("\r\n");
      out.write("<!-- the fileinput plugin initialization -->\r\n");
      out.write("<script>\r\n");
      out.write("$(\"#avatar-1\").fileinput({\r\n");
      out.write("    overwriteInitial: true,\r\n");
      out.write("    maxFileSize: 1500,\r\n");
      out.write("    showClose: false,\r\n");
      out.write("    showCaption: false,\r\n");
      out.write("    browseLabel: '이미지선택',\r\n");
      out.write("    browseIcon: '<i class=\"bi-folder2-open\"></i>',\r\n");
      out.write("    removeTitle: 'Cancel or reset changes',\r\n");
      out.write("    elErrorContainer: '#kv-avatar-errors-1',\r\n");
      out.write("    msgErrorClass: 'alert alert-block alert-danger',\r\n");
      out.write("    initialPreview: [\"");
      out.print( member.getProfilePic()!=null?"/fm/resources/images/"+member.getProfilePic():"/fm/resources/images/user.png" );
      out.write("\"],\r\n");
      out.write("	initialPreviewAsData: true,\r\n");
      out.write("	initialPreviewConfig: [\r\n");
      out.write("	{caption: \"프로필사진\", downloadUrl:'', description: \"유저프로필사진\", size: 930321, width: \"240px\", key: 1},\r\n");
      out.write("	],\r\n");
      out.write("    layoutTemplates: {main2: '{preview} ' + '{browse}'},\r\n");
      out.write("    allowedFileExtensions: [\"jpg\", \"png\", \"gif\"]\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\r\n");
      out.write("    <script>\r\n");
      out.write("        $(\"#pwd, #pwd2\").on(\"change\", function() {\r\n");
      out.write("            $('#pass_false').addClass('dn');\r\n");
      out.write("            $('#pass_true').addClass('dn');\r\n");
      out.write("            var password = $('#pwd').val();\r\n");
      out.write("            var passwordCheck = $('#pwd2').val();\r\n");
      out.write("            if (password === passwordCheck) {\r\n");
      out.write("                $('#pass_true').removeClass('dn');\r\n");
      out.write("            } else {\r\n");
      out.write("                $('#pass_false').removeClass('dn');\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    </script>\r\n");
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