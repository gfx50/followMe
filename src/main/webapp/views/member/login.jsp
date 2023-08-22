<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp" %>
<!-- <head> 윗 부분은 head.jsp에서 일괄 관리합니다.
개발용 임시 <style> <script> 는 아래 </head> 위에 작성해 주세요 -->

</head>

<body>

<!-- 상단 고정 내비게이션 바 -->
<%@ include file="../common/navbar.jsp" %>

<div  class="d-flex align-items-center py-4 bg-body-tertiary">

<main class="form-signin w-100 m-auto container">
<h1 align="center">Welcome to the world of FollowMe!</h1>
<hr>
 <form>
    <h2 class="h3 mb-3 fw-normal">로그인 해주세요</h2>

    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="form-check text-start my-3">
      <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
      <label class="form-check-label" for="flexCheckDefault">
        Remember me
      </label>
    </div>
    <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
  </form>
</main>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>