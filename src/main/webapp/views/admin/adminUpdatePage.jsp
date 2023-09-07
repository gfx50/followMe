<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="admin.model.vo.Admin"%>
    <%
	//관리자 로그인 유지    
    Admin admin = (Admin)session.getAttribute("loginAdmin");
    %>
    

<%@ include file="../common/head.jsp" %>
<!-- <head> 윗 부분은 head.jsp에서 일괄 관리합니다.
개발용 임시 <style> <script> 는 아래 </head> 위에 작성해 주세요 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>followme</title>
<style type="text/css">
table { background-color:	#f9f9f9; }
table#outer { border: 1px solid #D3D3D3; }
</style>
</head>
<%-- <%@ include file="../admin/adminMenu.jsp" %> --%>
<body>
<%@ include file="../common/navbar.jsp" %>
<br><br><br><br>
<h1 align="center"><%= admin.getAdminEmail() %>님의 회원 정보 수정 페이지</h1>
<br>
<br>
<form action="/fm/aupdate" method="post">
<table id="outer" align="center" width="500" cellspacing="10" cellpadding="3">
	<tr><th colspan="2">등록된 회원정보는 아래와 같습니다.<br> &nbsp;
	</th></tr>
	<tr><th width="120">이메일</th>
	<td><input type="text" name="email" value="<%= admin.getAdminEmail() %>"  readonly="readonly">
	</td></tr>	
	<tr><th width="120">비밀번호</th>
	<td><input type="password" name="pwd" value="<%= admin.getAdminPwd() %>" placeholder="****">
	</td></tr>	
	<tr><th>레벨</th>
	<td><input type="text" name="lv" value="<%= admin.getAdminLv() %>"></td></tr>
	<tr><th colspan="2">
		<input type="submit" value="수정하기"> &nbsp;
		<a href="/fm/aremove?adminEmail=<%= admin.getAdminEmail() %>">탈퇴하기</a>
		<a href="javascript:history.go(-1);">이전 페이지로 이동</a> &nbsp;
		<a href="/fm/views/admin/adminMenu.jsp">메인페이지로 이동</a>
	</th></tr>
</table>
</form>
<br><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>