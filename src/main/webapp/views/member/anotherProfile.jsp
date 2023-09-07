<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="member.model.vo.Member, java.util.ArrayList, trail.model.vo.Trail ,follow.model.vo.Follow" %>
<%
	Member member = (Member)request.getAttribute("member");
	ArrayList<Trail> list = (ArrayList<Trail>)request.getAttribute("list");
	ArrayList<Follow> followeelist = (ArrayList<Follow>)request.getAttribute("followeelist");
	ArrayList<Follow> followerlist = (ArrayList<Follow>)request.getAttribute("followerlist");
%>

<%@ include file="../common/head.jsp"%>
<!-- <head> 윗 부분은 head.jsp에서 일괄 관리합니다.
개발용 임시 <style> <script> 는 아래 </head> 위에 작성해 주세요 -->
<link href="/fm/resources/css/myprofileStyle.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<script>
    $(document).ready(function() {
    	var followmid = '<%= member.getmId() %>';
        $.ajax({
            url: '/fm/followcheck', 
            type: 'get',
            dataType: 'json',
            data: {
            	followmid: followmid
            },
            success: function(data) {
                if (data.isFollowing === 'N') {
                    $('#followButtonDiv').show();
                } else {
                    $('#followButtonDiv').hide();
                }
            },
            error : function(xhr, status, error) {
				console.error("팔로우 과정중(ajax) : ", error);
			}
        });
    });
</script>
</head>

<!-- 상단 고정 내비게이션 바 -->
<%@ include file="../common/navbar.jsp"%>

<body>
	<!-- Header-->
	<header class="bg-navy py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<div class="myinfo-card">
					<div style="border: 1px solid #ccc;overflow: hidden;width:50%;margin:auto;width: 150px;height: 150px;border-radius:70%;background-color:white;">
					<img src="/fm/resources/images/<%= member.getProfilePic()!=null?member.getProfilePic():"user.png" %>" 
					style="width: 150px;height: 150px;object-fit: cover;border-radius:70%;">
					</div>
				<br>
				<h1 class="fw-bolder image-container">
				<% if(member.getNickName() != null) { %>
		            <%= member.getNickName() %>
		        <% } else { %>
		            user
		        <% } %>
				</h1>
				<p class="lead fw-normal mb-0" style="color:black;"><%= member.getEmail() %></p>
				<p class="lead fw-normal text-white-50 mb-0" style="font-size:15px"><a href="/fm/flist?mid=<%=member.getmId()%>" style="font-weight: normal;text-decoration: none;color:grey;">팔로이: <%=followeelist.size() %>&nbsp; &nbsp; &nbsp; 팔로워: <%=followerlist.size() %></a></p>
				</div>
				<div class="myinfo-card2">
				<table id="outer" align="center" width="500">
					<tr>
						<th colspan="2" style="text-align: left">"<%= member.getmName() %>"님의
							회원정보입니다
						</th>
					</tr>
					<tr style="text-align: left">
						<th>이메일</th>
						<td><%= member.getEmail() %></td>
					</tr>
					<tr style="text-align: left">
						<th>이름</th>
						<td><%= member.getmName() %></td>
					</tr>
					<tr style="text-align: left">
					    <th>성별</th>
					    <td>
					        <% if(member.getGender() != null) { %>
					            <%= member.getGender() %>
					        <% } else { %>
					            (비공개)
					        <% } %>
					    </td>
					</tr>
					<tr style="text-align: left">
					    <th>전화번호</th>
					    <td>
					        <% if(member.getPhone() != null) { %>
					            <%= member.getPhone() %>
					        <% } else { %>
					            (비공개)
					        <% } %>
					    </td>
					</tr>
					<% if(member.getLoginLv() == 6){ %>
					<tr style="text-align: left">
						<th>회원등급</th>
						<td>프리미엄 회원</td>
					</tr>
					<% } %>
					<% if(member.getLoginLv() == 7){ %>
					<tr style="text-align: left">
						<th>회원등급</th>
						<td>신</td>
					</tr>
					<% } %>
					<tr style="text-align: left">
						<th colspan="2">
						<br>
						<div class="d-flex">
						&nbsp;<button type="button" class="btn btn-outline-edit"onclick="sendMessage();">메세지보내기</button>
						&nbsp;
						<div id="followButtonDiv">
						    <button type="button" class="btn btn-outline-edit" onclick="follow();">팔로우하기</button>
						</div>
						</div>
						</th>
					</tr>
				</table>
				</div>
			</div>
		</div>
	</header>
	<!-- Section-->
<section class="py-5">
<hr>
    <div class="container px-4 px-lg-5 mt-5">
             <span class="badge rounded-pill bg-secondary" style="left: 10%;top:110%;">등록한 게시물 목록</span>
             <br><br>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
	 		<%if (list.isEmpty()) { %>
	 		<br><br><br>
         	<p>등록된 게시글이 없습니다.</p>
         	<% }else{ %>
          <% for (Trail t : list) { %>
          <br><br><br>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top"
                        src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><%= t.getTrailDate() %> </h5>
                            <!-- Product price-->
                         <%= t.getTrailJson() %>
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                          <a class="btn btn-outline-dark mt-auto" href="/fm/tdetail?trailId=<%= t.getTrailId() %>">상세정보</a>
                        </div>
                    </div>
                </div>
            </div>
        	<% } %>           
        	<% } %>
        	<br><br><br>
        </div>
    </div>
</section>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/fm/resources/js/myprofileStyle.js"></script>
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
	function sendMessage(){
		location.href = "/fm/rsend?mid=<%=member.getmId()%>";
	}
	function follow(){
		location.href = "/fm/follow?mid=<%=member.getmId()%>";
	}
	</script>
</body>
</html>