<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="views/common/head.jsp" %>
<script>
function login(){
	console.log($('#floatingInput').val() + ', ' + $('#floatingPassword').val());
	$.ajax({
	    url: "/fm/checkm",
	    type: "post",
	    data: { 
	        email: $('#floatingInput').val(),
	        pwd: $('#floatingPassword').val()
	    },
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    success: function(data) {
	        console.log("data : " + data);
	        if (data == "ok") {
	            $('#loginForm').submit();
	        } else {
	            alert("아이디와 비밀번호가 올바르지 않습니다.");
	        }
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
	    }
	});
	
}
</script>
<!-- <head> 윗 부분은 head.jsp에서 일괄 관리합니다.
개발용 임시 <style> <script> 는 아래 </head> 위에 작성해 주세요 -->

</head>

<body>
<div>
       	<img src="/fm/resources/images/phone.jpeg" style="position:absolute;top:50%;left:50%;transform: translate(-50%, -50%);z-index:-1;width:500px">
</div>


<div  class="d-flex align-items-center py-4 bg-body-tertiary" style="width:340px;position:absolute;top:50%;left:50%;transform: translate(-50%, -50%);">

<main class="form-signin w-100 m-auto container">
<h4 align="center" style="text-align:left;">Welcome to the world of FollowMe!</h4>
<hr><br>
    <a>로그인 해주세요</a>
    <br>
<form action="/fm/login" method="post" id="loginForm">
    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="useremail">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="userpwd">
      <label for="floatingPassword">Password</label>
    </div>
    <br>
    <button type="button" class="btn btn-primary w-100 py-2" onclick="login();">Sign in</button>
  </form>
  <br>
  <a style="font-size:13px;color:grey;">계정이 없으신가요?</a>
  <br>
  <a style="font-size:13px;color:grey;" href="/fm/views/member/enroll.jsp">회원가입</a>
</main>
</div>
<%@ include file="views/common/footer.jsp" %>
</body>
</html>