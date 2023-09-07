<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="admin.model.vo.Admin ,member.model.vo.Member, java.util.ArrayList" %>
<%  
    ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
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
            width: 30%;
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
    
    <h1>회원 정보 리스트</h1>
	<br><br>
	
	
    <table>
        <tr>
            <th>멤버 식별번호</th>
            <th>이메일</th>
            <th>소셜로그인id</th>
            <th>닉네임</th>
            <th>프로필사진</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>생년월일</th>
            <th>성별</th>
            <th>전화번호</th>
            <th>가입일</th>
            <th>마지막 로그인일</th>
            <th>비밀번호 수정일</th>
            <th>멤버 레벨</th>
            <th>멤버메타데이터</th>
            
           
        </tr>
        <% for(Member a : list){ %>
        <tr>
             <td><%= a.getmId()%></td> 
            <td><%= a.getEmail() %></td>
            <td><%= a.getSocialId()%></td>
            <td><%= a.getNickName()%></td>
            <td><%= a.getProfilePic()%></td>
            <td><%= a.getPwd()%></td> 
            <td><%= a.getmName()%></td>
             <td><%= a.getBirthDate()%></td>
            <td><%= a.getGender()%></td>
            <td><%= a.getPhone()%></td>
            <td><%= a.getEntranceDate()%></td>
            <td><%= a.getLastLoginDate()%></td>
            <td><%= a.getPassModifyDate()%></td> 
            <td>
    <form action="/fm/updateLv" method="post">
        <input type="hidden" name="email" value="<%= a.getEmail() %>">
        <select name="lv">
            <option value="1" <%= a.getLoginLv() == 1 ? "selected" : "" %>>Level 1</option>
            <option value="2" <%= a.getLoginLv() == 2 ? "selected" : "" %>>Level 2</option>
            <option value="3" <%= a.getLoginLv() == 3 ? "selected" : "" %>>Level 3</option>
            <option value="4" <%= a.getLoginLv() == 4 ? "selected" : "" %>>Level 4</option>
            <option value="5" <%= a.getLoginLv() == 5 ? "selected" : "" %>>Level 5</option>
            <option value="6" <%= a.getLoginLv() == 6 ? "selected" : "" %>>Level 6</option>
            <option value="7" <%= a.getLoginLv() == 7 ? "selected" : "" %>>Level 7</option>
            <!-- Add more options as needed -->
        </select>
        <input type="submit" value="Update">
    </form>
</td>
             <td><%= a.getMemberMeta()%></td> 
        </tr>
        <% } %>
    </table>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>