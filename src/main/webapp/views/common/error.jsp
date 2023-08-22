<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ include file="../common/head.jsp" %>
<!-- <head> 윗 부분은 head.jsp에서 일괄 관리합니다.
개발용 임시 <style> <script> 는 아래 </head> 위에 작성해 주세요 -->

</head>
<body>

<%@ include file="../common/navbar.jsp" %>

<h1>오류 발생 : </h1>
<%-- jsp 내장 객체 중 exception 객체를 사용:
	page 지시자 태그에 isErrorPage="true" 라고 지정했을 때만 
	exception 내장 객체를 사용할 수 있다 --%>
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
<a href="/fm/menu.jsp">메뉴페이지로 이동</a>

<%@ include file="../common/footer.jsp" %>
</body>
</html>