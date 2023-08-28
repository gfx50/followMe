<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member,java.util.ArrayList" %>
<%@ page import="message.model.vo.Message" %>
<%
	Member member = (Member)session.getAttribute("loginMember");
%>   
<%
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
%>
<%@ include file="../common/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 상단 고정 내비게이션 바 -->
<%@ include file="../common/navbar.jsp" %>
<body>

<hr>
<h1 align="center">메세지 목록</h1>
<% if(member != null){ %>
<div style="align:center;text-align:center;">
<br><br>
	<button onclick="showMessageWriteForm();">메세지 보내기</button>
</div>
<br><br><br>
<table align="center" border="1" cellspacing="0" width="700">
	<tr>
		<th>보낸사람</th>
		<th>날짜</th>
		<th>내용</th>
		<th>확인</th>
	</tr>
	<% for(Message m : list){ %>
		<tr>
			<td align="center"><%= m.getmId() %></td>
			<td align="center"><%= m.getMsgTime() %></td>
			<td align="center"><%= m.getMsgContent() %></td>
			<td align="center"><%= m.getRcvYN() %></td>
		</tr>
	<% } %>
</table>
<% } %>
<% if(member == null){ %>
	<br><br><br><br><br>
	<h6 align="center">먼저 로그인해주세요</h6>
	<br><br>
<% } %>
<%@ include file="../common/footer.jsp" %>
</body>
</html>