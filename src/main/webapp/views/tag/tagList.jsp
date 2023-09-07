<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tag.model.vo.Tag,admin.model.vo.Admin, java.util.ArrayList" %>
<%
    ArrayList<Tag> list = (ArrayList<Tag>) request.getAttribute("list");
   
		
%>
<% Admin admin = (Admin) session.getAttribute("loginAdmin"); %>





<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/head.jsp" %>
    <meta charset="UTF-8">
    <title>Follow Me </title>
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

    <h1>유저 태그 리스트 모음</h1>
    <br><br>

    <table>
        <tr>
            <th>trail ID</th>
            <th>tagName</th>
            <th>태그네임 수정하기</th>
            <th>삭제하기</th>
            
        </tr>
        <% for (Tag a : list) { %>
            <tr>
                <td><%= a.getTrailId()%></td>
				<td> <input type="text" name="tagname" value="<%= a.getTagName() %>">
				<td> <a class="tag-text" href="/fm/settag?update"> 수정하기 </a>            
                <td><a class="delete-link" href="/fm/deletetag?tagname=<%= a.getTagName() %>">삭제하기</a></td>
            </tr>
        <% } %>
    </table>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>