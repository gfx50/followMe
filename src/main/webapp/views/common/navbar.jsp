<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Fixed navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
   	<li><a class="nav-link" href="views/member/profile.jsp">유저프로필</a></li>
	<li class="nav-item"><a class="nav-link" href="views/member/login.jsp">로그인</a></li>
	<li class="nav-item"><a class="nav-link" href="views/member/enroll.jsp">회원가입</a></li>
	<li class="nav-item"><a class="nav-link" href="views/trail/main.jsp">메인</a></li>
	<li class="nav-item"><a class="nav-link" href="views/trail/create.jsp">Trail 생성</a></li>
	<li class="nav-item"><a class="nav-link" href="views/trail/search.jsp">검색</a></li>
	<li class="nav-item"><a class="nav-link" href="views/adm/adm.jsp">관리자 메뉴</a></li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>