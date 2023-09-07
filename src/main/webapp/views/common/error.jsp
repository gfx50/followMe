<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ include file="../common/head.jsp" %>
<!-- <head> 윗 부분은 head.jsp에서 일괄 관리합니다.
개발용 임시 <style> <script> 는 아래 </head> 위에 작성해 주세요 -->
<style>
  .centered-image {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 50vh;
  }
</style>
</head>
<body>

<%@ include file="../common/navbar.jsp" %>
<h1>경고 오류</h1>
<div class="centered-image">

<%
	if(exception != null){ // jsp 페이지에서 발생한 에러이면
%>
	<h3>jsp 페이지 오류 : <%= exception.getMessage() %></h3>
<%		
	}else{ // jsp 페이지 에러가 아니라면(servlet 에서 throws로 넘긴 예외라면)
		%>
	<h3>Servlet 오류 : <%= request.getAttribute("message") %></h3>		
<%
	}
%>
&nbsp;&nbsp;&nbsp;<a href="/fm/menu.jsp">메뉴페이지로 이동</a>
  <img src="/fm/resources/images/gongsa.jpeg" alt="Image">
</div>
<br><br>


<%@ include file="../common/footer.jsp" %>
</body>
</html>