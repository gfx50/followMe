<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>


<%@ include file="views/common/head.jsp" %>
<!-- <head> 윗 부분은 head.jsp에서 일괄 관리합니다.
개발용 임시 <style> <script> 는 아래 </head> 위에 작성해 주세요 -->

</head>
<body>
<%@ include file="views/common/navbar.jsp" %>


<h1 align="center">기능개발용 메뉴 인덱스</h1>
<ul>
	<li><a href="views/member/profile.jsp">유저프로필</a></li>
	<li><a href="views/member/login.jsp">로그인</a></li>
	<li><a href="views/member/enroll.jsp">회원가입</a></li>
	<li><a href="views/trail/main.jsp">메인</a></li>
	<li><a href="views/trail/create.jsp">Trail 생성</a></li>
	<li><a href="views/trail/search.jsp">검색</a></li>
	<li><a href="views/adm/adm.jsp">관리자 메뉴</a></li>
</ul>


<%@ include file="views/common/footer.jsp" %>
</body>
</html>