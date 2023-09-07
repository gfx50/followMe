<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="member.model.vo.Member, java.util.ArrayList, trail.model.vo.Trail, follow.model.vo.Follow" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");

%>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var navLinks = document.querySelectorAll(".nav-li a");

        for (var i = 0; i < navLinks.length; i++) {
            navLinks[i].addEventListener("mouseover", function (event) {
                this.classList.add("highlighted");
            });

            navLinks[i].addEventListener("mouseout", function (event) {
                this.classList.remove("highlighted");
            });
        }
    });
</script>
<div class="top-bar"></div>
<div class="head-div2">
	<div class="nav-div2 container">
		<ul class="nav-ul2">
			<li class="nav-li2"><a href="/fm/tlist">HOME</a></li>
			<li class="nav-li2"><a href="/fm/views/trail/create.jsp">TRAIL</a></li>
			<li class="nav-li2"><a href="/fm/msgcol">MESSAGE</a></li>
			<li class="nav-li2"><a href="/fm/flist?mid=<%= loginMember.getmId() %>">FOLLOW</a></li>
			<li class="nav-li2" id="myProfile"><a href="/fm/myinfo">MYPROFILE</a></li>
			<li class="nav-li2"><a href="/fm/nlist">NOTICE</a></li>
		</ul>
	</div>
	<div class="nav-search2">
	<img class="search-icon2" src="/fm/resources/img/search.jpeg" onclick="search();">
	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16" onclick="logout();" style="cursor: pointer;">
	    <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
	    <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
	</svg>
	</svg>
	</div>
	<div class="main-logo-img2">
		<a href="/fm/pheonix.jsp"><img class="logo-img2" src="/fm/resources/img/Followmelogo.png"></a>
	</div>
</div>
<hr>

<script type="text/javascript">
function logout(){
	location.href="/fm/logout"
}
function search(){
	location.href="/fm/views/trail/search.jsp"
}
</script>


