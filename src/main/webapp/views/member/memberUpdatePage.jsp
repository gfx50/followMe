<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member member = (Member)request.getAttribute("member");
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
<%@ include file="../common/navbar.jsp" %>
<body>
<br><br><br><br>
<h1 align="center"><%= member.getmName() %>님의 회원 정보 수정 페이지</h1>
<br>
<br>
<form action="/fm/mupdate" method="post">
<table id="outer" align="center" width="500" cellspacing="10" cellpadding="3">
	<tr><th colspan="2">등록된 회원정보는 아래와 같습니다.<br> &nbsp;
	</th></tr>
	<tr><th width="120">이메일</th>
	<td><input type="text" name="email" value="<%= member.getEmail() %>" >
	</td></tr>	
	<tr><th>이름</th>
	<td><input type="text" name="mname" value="<%= member.getmName() %>" readonly></td></tr>
	<tr><th>성별</th>
	<td>
		<% if(member.getGender().equals("M")){ %>
		<input type="radio" name="gender" value="M" checked> 남자 &nbsp;
		<input type="radio" name="gender" value="F"> 여자
		<% }else{ %>
		<input type="radio" name="gender" value="M"> 남자 &nbsp;
		<input type="radio" name="gender" value="F" checked> 여자
		<% } %>
	</td></tr>
	<tr><th>전화번호</th>
	<td><input type="tel" name="phone" value="<%= member.getPhone() %>"></td></tr>
	<tr><th colspan="2">
		<input type="submit" value="수정하기"> &nbsp;
		<a href="/fm/mdel?userid=<%= member.getEmail() %>">탈퇴하기</a>
		<a href="javascript:history.go(-1);">이전 페이지로 이동</a> &nbsp;
		<a href="/fm/views/trail/main.jsp">메인페이지로 이동</a>
	</th></tr>
</table>
</form>
<br><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>