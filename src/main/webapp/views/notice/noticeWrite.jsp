<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="admin.model.vo.Admin"%>
     <%
	//관리자 로그인했을때    
    Admin admin = (Admin)session.getAttribute("loginAdmin");
    %>
    
<!DOCTYPE html>
<html>
<%@ include file="../common/head.jsp" %>
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
<hr>
<h1 align="center">새 공지글 등록 페이지</h1>
<br>
<!-- form 에서 입력값들과 파일을 함께 전송하려면
반드시 속성을 추가해야 함 : enctype="multipart/form-data" -->
<form action="/fm/nwrite" method="post" >
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">

<tr><th>제 목</th><td><input type="text" name="title" size="50"></td></tr>

<tr><th>작성자</th>
	<td><input type="text" name="email" readonly 
		value="<%= admin.getAdminEmail() %>"></td></tr>
		
<tr><th>내 용</th>
	<td><textarea rows="5" cols="50" name="content"></textarea></td></tr>
	
<tr><th colspan="2">
	<input type="submit" value="등록하기"> &nbsp; 
	<input type="reset" value="작성취소"> &nbsp;
	<input type="button" value="목록" 
		onclick="javascript:history.go(-1); return false;">
</th></tr>
</table>
</form>
<br>
<hr>
<%@ include file="../common/footer.jsp" %>
</body>
</html>