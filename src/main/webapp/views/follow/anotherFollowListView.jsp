<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member,java.util.ArrayList,follow.model.vo.Follow"%>
<%
ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
ArrayList<Member> list2 = (ArrayList<Member>) request.getAttribute("list2");
%>
<%@ include file="../common/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>followme</title>
</head>
<%@ include file="../common/navbar.jsp"%>
<body>
	<br><br><br>
	
	<div class="bd-example container" style="width:70%;">
		 <br> <br> &nbsp; <span class="badge rounded-pill bg-dark">팔로이</span><a style="margin-left:86%;"><%= list.size() %>명</a>
		<br><br>
        <table class="table table-hover">
          <thead>
          <tr class="table-secondary">
            <th scope="col">이메일</th>
            <th scope="col"style="text-align: left;">팔로우한 날짜</th>
          </tr>
          </thead>
          <tbody>
          <%if(list.isEmpty()){ %>
          <tr>
          	<td>팔로이가 없습니다.</td>
          </tr>
          <% }for(Member m : list){ %>
          <tr>
            <th scope="row"><a href="/fm/info?mid=<%=m.getmId()%>" style="font-weight: normal;text-decoration: none;color:black;"><%= m.getEmail() %></a></th>
            <td style="text-align: left;"><%= m.getFollowtime() %></td>
 
		<script type="text/javascript">
	    function followdelete(mid) {
	        $.ajax({
	            type: 'POST',
	            url: '/fm/unfollow',
	            data: {
	                mid: mid
	            },
	            success: function(response) {
	                console.log('팔로우 취소 성공');
	                // 성공 시 추가로 수행할 작업을 여기에 추가할 수 있습니다.
	            },
	            error: function(xhr, textStatus, errorThrown) {
	                console.error('팔로우 취소 실패:', textStatus, errorThrown);
	                // 실패 시 처리할 작업을 여기에 추가할 수 있습니다.
	            }
	        });
	    }
	</script>
          <% } %>
     
          </tbody>
        </table>
        <br><br><br>
        &nbsp; <span class="badge rounded-pill bg-dark">팔로워</span><a style="margin-left:86%;"><%= list2.size() %>명</a>
        <br><br>
        <table class="table table-hover">
          <thead>
          <tr class="table-secondary">
            <th scope="col">이메일</th>
            <th scope="col" style="text-align: left;">팔로우한 날짜</th>
          </tr>
          </thead>
          <tbody>
          <%if(list2.isEmpty()){ %>
          <tr>
          	<td>팔로워가 없습니다.</td>
          </tr>
          <% }for(Member m : list2){ %>
          <tr>
            <th scope="row"><a href="/fm/info?mid=<%=m.getmId()%>" style="font-weight: normal;text-decoration: none;color:black;"><%= m.getEmail() %></a></th>
            <td style="text-align: left;"><%= m.getFollowtime() %></td>
          </tr>
          <% } %>
          </tbody>
        </table>
        </div>
<br><br><br><br>
<%@ include file="../common/footer.jsp"%>
</body>

</html>