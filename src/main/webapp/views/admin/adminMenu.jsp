<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="admin.model.vo.Admin"%>
<%
    //관리자 로그인했을때    
    Admin admin = (Admin)session.getAttribute("loginAdmin");
%>

<!DOCTYPE html>
<html>
<script type="text/javascript">
function logoutAdmin(){
	location.href="/fm/logout";
}



</script>

<head>
<%@ include file="../common/head.jsp" %>
    <meta charset="UTF-8">
    <title>fm</title>
    <style>
        /* Reset some default styles */
        body, h1 {
            margin: 0;
            padding: 0;
        }

        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        /* Header styles */
        h1 {
            text-align: center;
            margin-top: 50px;
        }

        /* Admin Menu styles */
        #adminMenu {
            max-width: 300px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        .list-group-item {
            background-color: transparent;
            border: none;
            padding: 10px 0;
        }

        .list-group-item a {
            text-decoration: none;
            color: #0f2742;
            font-weight: bold;
        }

        .list-group-item a:hover {
            text-decoration: underline;
        }

        /* Login Info Box styles */
        .login-info-box {
            text-align: center;
            padding: 10px;
            background-color: #dff0d8;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        .login-info-box p {
            margin: 0;
        }
        
        

    </style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<h1>관리자 메뉴 목록</h1>
<br>
<div class="login-info-box">
    <% if (admin != null) { %>
        <p><strong>관리자 <%= admin.getAdminEmail() %>님이 로그인하셨습니다.</strong></p>
    <% } %>

    <br>
    <button onclick="logoutAdmin();" class="btn btn-outline-dark" type="submit">로그아웃</button>
</div>

<div class="bd-example" id="adminMenu">
    <ul class="list-group list-group-flush">
        <li class="list-group-item"><a href="/fm/alist">관리자 회원 리스트목록</a></li>
        <li class="list-group-item"><a href="/fm/views/admin/adminUpdatePage.jsp">관리자 회원정보수정</a></li>
        <li class="list-group-item"><a href="/fm/views/admin/admineroll.jsp">관리자 회원가입</a></li>
        <li class="list-group-item"><a href="/fm/views/admin/adminLogin.jsp">관리자 로그인</a></li>
        <li class="list-group-item"><a href="/fm/amlist">회원 리스트 목록</a></li>
        <li class="list-group-item"><a href="/fm/nlist">공지사항</a></li>
        <li class="list-group-item"><a href="/fm/arlist">유저 신고 게시물관리</a></li>
        <li class="list-group-item"><a href="/fm/creportlist">유저 댓글 신고관리</a></li>
        <li class="list-group-item"><a href="/fm/listtag">유저 태그 네임 리스트</a></li>
        <li class="list-group-item"><a href="/fm/listtagid">유저 태그 아이디 관리</a></li>
    </ul>
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>