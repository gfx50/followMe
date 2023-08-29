<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, trail.model.vo.Trail, thread.model.vo.Thread"%>
<%
    Member member = (Member)session.getAttribute("loginMember");
    Trail trail = (Trail)request.getAttribute("trail");
    ArrayList<Thread> threadList = (ArrayList<Thread>)request.getAttribute("threadList"); // 가정한 쓰레드 목록
%>

<%@ include file="../common/head.jsp"%>
<body>
    <div class="container">
        <!-- 상단 고정 내비게이션 바 -->
        <%@ include file="../common/navbar.jsp"%>

        <h1>게시물 상세보기</h1>
        <br>
        
 <table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr>
		<th width="120">게시물아이디</th>
		<td><%= trail.getTraiIId() %></td>
	</tr>
	<tr>
		<th width="120">등록날짜</th>
		<td><%= trail.getTrailDate() %></td>
	</tr>
	<tr>
		<th width="120">내 용</th>
		<td><%= trail.getTrailJson() %></td>
	</tr>
				
</table>
            


    <%@ include file="../common/footer.jsp"%>
</body>
</html>

