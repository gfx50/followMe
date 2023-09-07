<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp" %>
<!-- <head> 윗 부분은 head.jsp에서 일괄 관리합니다.
개발용 임시 <style> <script> 는 아래 </head> 위에 작성해 주세요 -->

</head>

<body>

<!-- 상단네비게이션 바 회원가입페이지라 생략 -->


<header class="bg-dark py-5">
<div class="text-center text-white">
<h1 align="center">관리자 회원 가입 페이지</h1>
</div>
</header>
<br>
<form action="/fm/areg" method="post"  >
<table id="outer" align="center" width="500" cellspacing="20" cellpadding="1">
	<tr><th colspan="2">회원 가입입력 창입니다</th></tr>
	<tr><td colspan='2'><br><div style="text-align : center;">
	<input type = "file" id = "upload" accept = "image/gif, image/png, image/jpeg" style="display:none">
		<label for="upload"><img src="/fm/resources/images/user.png"  width="120px"></label></div></td></tr>
	<tr><td colspan='2'><br>
			<div style="text-align : center;"> 
			<button type="button" class="btn photo-reset" id = "photo_basic" data-bs-dismiss="modal">기본프로필</button>
			<button type="button" class="btn" id = "photo_submit">변경</button></div><br></td></tr>
	
	
	<tr><th>Email</th>
	<td><input type="email" name="email" required></td></tr>
	<tr><th>Password</th>
	<td><input type="password" name="pwd" id="pwd" required></td></tr>
	<tr><th>레벨(LV)</th>
	<td><input type="text" name="lv" required></td></tr>
	<tr width="30px"><th colspan="2">
		<input type="submit" value="가입하기"> &nbsp; &nbsp; &nbsp;
		
	</th></tr>
</table>
</form>
<br><br><br><br><br><br>

<%@ include file="../common/footer.jsp" %>
</body>
</html>