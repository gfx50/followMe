<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="admin.model.vo.Admin,comments.model.vo.Comments , java.util.ArrayList" %>
<%  
    ArrayList<Comments> list = (ArrayList<Comments>)request.getAttribute("list");
%>    
<%
    //관리자 로그인했을때    
    Admin admin = (Admin)session.getAttribute("loginAdmin");
%>

<!DOCTYPE html>
<html>

<head>
<%@ include file="../common/head.jsp" %>
    <meta charset="UTF-8">
    <title>follow me</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        h1 {
            text-align: center;
            margin-top: 50px;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #7d7d84;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #d1d1d1;
        }
    </style>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <br><br>
    
    <h1>신고 댓글 관리</h1>
	<br><br>

	
	
    <table>
        <tr>
            <th>작성자</th>
            <th>작성일</th>
            <th>작성내용</th>
            <th>신고처리</th>
        </tr>
        <% for(Comments a : list){ %>
        <tr>
            <td><%= a.getmId()%></td>
            <td><%= a.getCommentsTime() %></td>
            <td><%= a.getCommentsContent() %></td>
              <td><%= a.getCommentsReportYn()%></td>  

        </tr>
        <% } %>
    </table>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>