<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice, admin.model.vo.Admin" %>
<%
	Notice notice = (Notice)request.getAttribute("notice");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>
<%
	//관리자 로그인했을때    
    Admin admin = (Admin)session.getAttribute("loginAdmin");
%>
<!DOCTYPE html>
<%@ include file="../common/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>follow me</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }

        th {
            background-color: #212529;
            color: #fff;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        button {
            background-color: #212529;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        button:hover {
            background-color: #212529;
        }

        a.delete-link {
            color: red;
            text-decoration: none;
            margin-left: 10px;
        }

        a.delete-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
    <h1><%= notice.getNoticeId() %>번 게시글 상세보기</h1>
    <table>
        <tr>
            <th width="120">제목</th>
            <td><%= notice.getNoticeTitle() %></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%= notice.getAdminEmail() %></td>
        </tr>
        <tr>
            <th>등록날짜</th>
            <td><%= notice.getNoticeDate() %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><%= notice.getNoticeContent() %></td>
        </tr>
    </table>
    <div class="button-container">
        <button onclick="moveUpdatePage();">수정페이지로 이동</button>
        <a class="delete-link" href="/fm/ndelete?noticeId=<%= notice.getNoticeId() %>">삭제하기</a>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
<script>
    function moveUpdatePage() {
        location.href = "/fm/nupview?nnum=<%= notice.getNoticeId() %>&page=<%= currentPage %>";
    }
</script>
</body>
</html>