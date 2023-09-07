<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member,java.util.ArrayList" %>
<%@ page import="message.model.vo.Message" %>
<%
	Member member = (Member)session.getAttribute("loginMember");
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
%>   
<!DOCTYPE html>
<html>
<%@ include file="../common/head.jsp" %>
<head>
<meta charset="UTF-8">
<title>followme</title>
<script type="text/javascript">
function showMessageWriteForm(){
	location.href = "/fm/views/message/messageWriteForm.jsp?mid=<%= member.getmId()%>";
}
function showMessageListForm(){
	location.href = "/fm/msgcol?mid=<%= member.getmId()%>";
}
</script>
</head>
<%@ include file="../common/navbar.jsp" %>
<body>
<br><br>
<h1 align="center">보낸 메세지 목록</h1>

<div style="align:center;text-align:center;">
<br><br>
	<button  class="btn btn-outline-secondary" onclick="showMessageWriteForm();">메세지 보내기</button> &nbsp; &nbsp; &nbsp;
	<button class="btn btn-outline-secondary" onclick="showMessageListForm();">받은 메세지 보기</button>
</div>
<br><br><br>
<table class="table table-striped container" align="center" border="1" cellspacing="0" width="900">
	<tr>
		<th style="text-align:center;">받은사람</th>
		<th width="120" style="text-align:center;">날짜</th>
		<th style="text-align:center;">확인</th>
	</tr>
	<% for(Message m : list){ %>
		<tr onclick="showToast('<%= m.getNickName() %>', '<%= m.getMsgTime() %>', '<%= m.getMsgContent() %>', '<%= m.getmId() %>', '<%= m.getRcvYN() %>');" style="cursor: pointer; height: 50px;">
			<td align="center"><img src="/fm/resources/images/<%= m.getProfilepic()!=null?m.getProfilepic():"user.png" %>" 
					style="width: 20px;height: 20px;object-fit: cover;border-radius:50%;">&nbsp;<%= m.getNickName() %></td>
			<td align="center"><%= m.getMsgTime() %></td>
			<td align="center">
			<% if ("Y".equals(m.getRcvYN())) {%>
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2-square" viewBox="0 0 16 16">
  					<path d="M3 14.5A1.5 1.5 0 0 1 1.5 13V3A1.5 1.5 0 0 1 3 1.5h8a.5.5 0 0 1 0 1H3a.5.5 0 0 0-.5.5v10a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V8a.5.5 0 0 1 1 0v5a1.5 1.5 0 0 1-1.5 1.5H3z"/>
  					<path d="m8.354 10.354 7-7a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z"/>
				</svg>
			<% }else{ %>
				&nbsp;
			<% } %>
			</td>
			<div class="hidden-toast" style="margin: 0 auto;width:80%; display: none; position: fixed; top: 30%; left: 40%; z-index: 99;">
				<div class="toast fade show " role="alert" aria-live="assertive"
					aria-atomic="true" style="text-align: center;width:500px;height:400px;">
					<div class="toast-header">
						<svg class="bd-placeholder-img rounded me-2" width="20"
							height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
							preserveAspectRatio="xMidYMid slice" focusable="false">
							<rect width="100%" height="100%" fill="#007aff"></rect></svg>

						<a href="/fm/info?mid=<%=m.getmId()%>" style="font-weight: normal;text-decoration: none;color:black;"><strong class="me-auto"><%=m.getEmail()%></strong></a>
			             <small class="text-muted" style="margin-left:auto;"><%=m.getMsgTime()%></small>
						<button type="button"class="btn-close" onclick="displayToast()">	</button>
					</div>
					<div class="toast-body"><%= m.getMsgContent() %></div>
					<input type="hidden" value="<%= m.getmId() %>" id="getmid">
					<input type="hidden" value="<%= m.getMsgContent() %>" id="getcontent">
					<input type="hidden" value="<%= m.getRcvYN() %>" id="getcheck">
				</div>
			</div>
			<script>
function showToast(nickName, msgTime, msgContent, mId, rcvYN) {
    var hiddenDiv = document.querySelector('.hidden-toast');
    if (hiddenDiv !== null) {
        hiddenDiv.style.display = 'block';
        $('.toast strong').text(nickName);
        $('.toast small').text(msgTime);
        $('.toast .toast-body').text(msgContent);
        $('#getmid').val(mId);
        $('#getcontent').val(msgContent);
        $('#getcheck').val(rcvYN);
    }
   
}

function displayToast() {
    var exitDiv = document.querySelector('.hidden-toast');
    if (exitDiv !== null) {
        exitDiv.style.display = 'none';
    }
}
</script>

		</tr>
	<% } %>
</table>

<br><br>


<%@ include file="../common/footer.jsp" %>
</body>
</html>