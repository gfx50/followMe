<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="admin.model.vo.Admin, java.util.ArrayList" %>
<%  
    ArrayList<Admin> list =
    (ArrayList<Admin>)request.getAttribute("list");
%>    
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
    
    <h1>관리자의 회원 리스트</h1>
	<br><br>

	
	
    <table>
        <tr>
            <th>이메일</th>
            <th>비밀번호</th>
            <th>레벨</th>
        </tr>
        <% for(Admin a : list){ %>
        <tr>
            <td><%= a.getAdminEmail()%></td>
            <td><%= a.getAdminPwd() %></td>
            <td><%= a.getAdminLv()%></td>
        </tr>
        <% } %>
    </table>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>