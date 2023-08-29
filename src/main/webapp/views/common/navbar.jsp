<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>

<%
	//로그인 확인을 위해서 내장된 session 객체를 이용
	Member loginMember = (Member)session.getAttribute("loginMember");
%>    

<% if(loginMember == null){  //로그인하지 않았을 때 %>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/fm/">FollowMe</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
   	<li class="nav-item"><a class="nav-link" href="/fm/views/member/login.jsp">유저프로필</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/views/member/login.jsp">로그인</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/views/member/enroll.jsp">회원가입</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/tlist">메인</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/views/trail/create.jsp">Trail 생성</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/views/trail/search.jsp">검색</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/msgcol">메세지</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/views/adm/adm.jsp">관리자 메뉴</a></li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<% }else{ //일반회원이 로그인 했을 때 %>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/fm/">FollowMe</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
   	<li class="nav-item"><a class="nav-link" href="/fm/myinfo">유저프로필</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/tlist">메인</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/tflist">팔로워게시글</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/tbook">북마크게시글</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/views/trail/create.jsp">Trail 생성</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/views/trail/search.jsp">검색</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/msgcol">메세지</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/views/adm/adm.jsp">관리자 메뉴</a></li>
	<li class="nav-item"><a class="nav-link" href="/fm/logout">로그아웃</a></li>
	
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<% } %>

