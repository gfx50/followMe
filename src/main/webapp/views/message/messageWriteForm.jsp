<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../common/head.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function showmsgListView(){
	location.href = "/fm/msgcol";
}
</script>
<%@ include file="../common/navbar.jsp" %>
</head>
<body>


<hr>
<br>
<h1 align="center">메세지 작성하기</h1>
<br>
<form action="/fm/msgsend" method="post">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
<input type="hidden"  name="writer" value="<%= loginMember.getmId()%>">
	<tr>
		<th>받는 사람</th>
		<td><input type="text" name="email" size="50"  value="" placeholder="email"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="mname" readonly value="<%= loginMember.getmName()%>"></td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="50" name="content" placeholder="내용을 입력해주세요."></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
		<br>
			 &nbsp; &nbsp; 
			<button type="submit" value="등록하기" class="btn btn-outline-secondary">등록하기</button> &nbsp;
			<button type="button" class="btn btn-outline-secondary" onclick="showmsgListView();">작성취소</button>
			<br><br>
		</th>		
	</tr>
</table>
</form>


<br>

<hr>

<%@ include file="../common/footer.jsp" %>
</body>
</html>