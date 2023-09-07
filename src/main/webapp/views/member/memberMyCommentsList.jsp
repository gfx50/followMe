<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, comments.model.vo.Comments, java.util.ArrayList" %>
<%
    ArrayList<Comments> list = (ArrayList<Comments>) request.getAttribute("list");
   
%>
<% Member member = (Member) session.getAttribute("loginAdmin"); %>


<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/head.jsp" %>
    <meta charset="UTF-8">
    <title>Follow Me </title>
 <!--   <style>
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
    </style> -->
    
 
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <br><br>
<div class="container mb-4">
    <h1>내가 쓴 댓글 조회</h1>
    </div>


    <table class="table table-striped container" >
        <tr>
        	<th>번호</th>
            <th>작성일</th>
            <th>작성내용</th>
            <th>신고 유무</th>
            <th>관리</th>
        </tr>
        <% int i = 1; for (Comments a : list) { %>
            <tr>
            	<td><%= i++ %></td>
                <td><a href="/fm/tdetail?trailId=<%= a.getTrailId() %>"><%= a.getCommentsTime() %></a></td>
                <td><%= a.getCommentsContent() %></td>
                <td><%= a.getCommentsReportYn() %></td>
                <td><button class="btn btn-primary btn-sm cdelete" align="right">삭제
                	<input type="hidden" value="<%= a.getCommentsId() %>"></button></td>
            </tr>
        <% } %>
    </table>

    <%@ include file="../common/footer.jsp" %>
<script>
$(document).ready(function(){
	  $(".cdelete").click(function(){
		  console.log($(this).find("input").val());
		  var commentsid = $(this).find("input").val();
		  if(confirm("정말로 삭제하시겠습니까?")){
			  $.ajax({
			        type: "POST",
			        url: "/fm/cdelete",
			        dataType: "text",
			        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			        data: {
			        	commentsid : commentsid,
			        },
			        success: function(data) {
			          console.log("통신데이터 값 : " + data);
						location.reload();		          
			        },
			        error: function() {
			          console.log(data);
			        }
		       });
		  }
			
	  }); // cdelete
}); // document ready    
</script>
</body>
</html>