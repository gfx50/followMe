<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../common/head.jsp" %>
<meta charset="UTF-8">
<title>followme</title>
</head>
<body>
<div class="container">
<div class="d-flex idpwdbox">
	<div class="searchidbox">
		<form action="/fm/serachid" method="post" id="searchidForm">
			<div class="container">
			<h4 style="text-align:center;margin-top:20px;">아이디 찾기</h4>
			<br><br><br>
			<div style="margin-left:10px;">
			<label>생년월일</label>
			<input type="date" name="birthDate"  id="birthDate" required>
			<br>
			<br><a><label for="lname">전화번호</label>
            <input type="phone" class="form-control" name="phone" value=""></a>
            <button type="submit" class="btn btn-primary" style="position: absolute;">아이디찾기</button>
            </div>
			</div>
		</form>
	</div>
	
	<div class="searchpwdbox">
	
	</div>
</div>
</div>
</body>
</html>