<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="member.model.vo.Member, java.util.ArrayList, trail.model.vo.Trail, follow.model.vo.Follow" %>
<%
	Member member = (Member)session.getAttribute("loginMember");
	ArrayList<Trail> list = (ArrayList<Trail>)request.getAttribute("list");
	ArrayList<Follow> followeelist = (ArrayList<Follow>)request.getAttribute("followeelist");
	ArrayList<Follow> followerlist = (ArrayList<Follow>)request.getAttribute("followerlist");
	int nowpage = ((Integer)request.getAttribute("currentPage")).intValue();

%>

<%@ include file="../common/head.jsp"%>
<!-- <head> 윗 부분은 head.jsp에서 일괄 관리합니다.
개발용 임시 <style> <script> 는 아래 </head> 위에 작성해 주세요 -->
<link href="/fm/resources/css/myprofileStyle.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

</head>

<!-- 상단 고정 내비게이션 바 -->
<%@ include file="../common/navbar.jsp"%>
<style>
.nav-li2:nth-child(5):hover a {
    color: #000;
}
.nav-li2:nth-child(5):hover a::before {
    width: 100%;
}
</style>
<body>

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light ">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">내정보</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">수정하기</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="javascript:location.href='/fm/moveup?email=<%= member.getEmail() %>';">내정보 수정</a></li>
							<li><a class="dropdown-item" href="/fm/flist?mid=<%=member.getmId()%>">팔로우 관리</a></li>
						</ul></li>
				</ul>
           		<a href="/fm/tflist" style="color: gray;">팔로워 게시글</a>
				&nbsp; | &nbsp;
				<a href="/fm/tbook" style="color: gray;">북마크 게시글</a>

			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="py-5 bg-navy">
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
					            (미지정)
					        <% } %>
					    </td>
					</tr>
					<tr style="text-align: left">
					    <th>전화번호</th>
					    <td>
					        <% if(member.getPhone() != null) { %>
					            <%= member.getPhone() %>
					        <% } else { %>
					            (전화번호를 추가해주세요)
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
								<button type="button" class="btn btn-outline-edit" onclick="javascript:location.href='/fm/moveup?email=<%= member.getEmail() %>';">내정보 수정</button>
								&nbsp; <button type="button" class="btn btn-outline-edit"onclick="showToast();">탈퇴하기</button>
						</th>
					</tr>
				</table>
				</div>
				<div class="hidden-toast"
				style="margin: 0 auto; width: 80%; display: none; position: fixed; top: 30%; left: 40%;z-index:9;">
				<div class="toast fade show " role="alert" aria-live="assertive"
					aria-atomic="true"
					style="width: 500px; height: 300px;">
					<div class="toast-header">
						<svg class="bd-placeholder-img rounded me-2" width="20"
							height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
							preserveAspectRatio="xMidYMid slice" focusable="false">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-square" viewBox="0 0 16 16">
							  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
							  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
							</svg></svg>

						<strong class="me-auto">경고</strong> <small
							class="text-muted"><%= member.getEmail() %></small>
						<button type="button" class="btn-close" onclick="displayToast()"></button>
					</div>
					<div class="toast-body" style="color: black; text-align: left;">
					    회원 <span style="font-weight: bold; color: red;">탈퇴</span>를 하면 <br>
					    서비스를 더 이상 이용하실 수 없습니다.<br><br>
					    회원 탈퇴를 진행하시겠습니까?<br><br><br>
					    <p style="font-size: 12px; color: gray;">
					        이후 회원 복구를 원하시면 관리자에게 문의하십시오.
					    </p>
					</div>
					<button class="btn btn-outline-secondary"
						style="bottom: 15px; right: 600px;margin-top:24px;margin-left:250px;"
						onclick="deleteMember();">탈퇴하기</button>
					<button class="btn btn-outline-secondary"
						style="bottom: 15px; right: 530px;margin-top:24px;margin-left:10px;"
						onclick="displayToast()">최소</button>
					
				</div>
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
        <div class="justify-content-center">
	 		<%if (list.isEmpty()) { %>
	 		<br><br><br>
         	<p>등록된 게시글이 없습니다.</p>
         	<% }else{ %>
<div class="row justify-content-center"> <!-- 중앙 정렬을 위한 부분 -->
            <div class="col-md-10"> <!-- 한 줄에 한 개의 게시글을 나열 -->
                <% for (Trail trail : list) { %>
                <% ArrayList<Trail> photoList = (ArrayList<Trail>) request.getAttribute("photoList_" + trail.getTrailId()); %>
                <div class="card mb-4"> <!-- 카드 간 간격 조절 -->
                 <article class="my-3" id="carousel">
      <div class="bd-heading align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3><%= trail.getNickName() %></h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example m-0 border-0">
        <div id="carouselExampleCaptions<%= trail.getTrailId() %>" class="carousel slide" data-bs-ride="carousel">
          <div id = "carouselind<%= trail.getTrailId() %>" class="carousel-indicators">
            <% for (int i = 0; i < photoList.size(); i++) { %>
  			<%
   			 String buttonClass = "";
   				 if (i == 0) {
     			 buttonClass = "active";
  				  }
 			 %>
  				<button type="button" data-bs-target="#carouselExampleCaptions<%= trail.getTrailId() %>" data-bs-slide-to="<%= i %>" class="<%= buttonClass %>" aria-label="Slide <%= (i + 1) %>"></button>
			<% } %>
          </div>
          
          <!-- Carousel 내용 -->
          <div id = "carouselimgs<%= trail.getTrailId() %>" class="carousel-inner">
            <div class="carousel-item active" onclick="openModal<%= trail.getTrailId() %>(0)">
     			 <img src="/fm/resources/upfiles/<%= trail.getTrailId() %>/<%= photoList.get(0).getOriginFileName() %>" class="d-block w-100" alt="Image 0">
              <div class="carousel-caption d-none d-md-block">
                <h5>First slide label</h5>
                <p>Some representative placeholder content for the first slide.</p>
              </div>
            </div>
            
            <% for (int i = 1; i < photoList.size(); i++) { %>
            <div class="carousel-item" onclick="openModal<%= trail.getTrailId() %>(<%= i %>)">
     			 <img src="/fm/resources/upfiles/<%= trail.getTrailId() %>/<%= photoList.get(i).getOriginFileName() %>" class="d-block w-100" alt="Image 1" >
              <div class="carousel-caption d-none d-md-block">
                <h5>Second slide label</h5>
                <p>Some representative placeholder content for the second slide.</p>
              </div>
            </div>
            <% } %>
          </div>
          
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions<%= trail.getTrailId() %>" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions<%= trail.getTrailId() %>" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
        </div></div>

      </div>
    </article>
    
    <%-- 모달폼 --%>
<div class="modal fade" id="carouselExampleModal<%= trail.getTrailId() %>" tabindex="-1" role="dialog" aria-labelledby="carouselModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="carouselModalLabel">Carousel 모달</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
        </button>
      </div>
      <div class="modal-body">
       

        <!-- 모달폼 내용 -->
        <div id="carouselExampleModal_<%= trail.getTrailId() %>" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
              <div id = "carouselimgs<%= trail.getTrailId() %>" class="carousel-inner">
            <div class="carousel-item active">
     			 <img src="/fm/resources/upfiles/<%= trail.getTrailId() %>/<%= photoList.get(0).getOriginFileName() %>" class="d-block w-100" alt="Image 0">
              <div class="carousel-caption d-none d-md-block">
                <h5>First slide label</h5>
                <p>Some representative placeholder content for the first slide.</p>
              </div>
            </div>
            
            <% for (int i = 1; i < photoList.size(); i++) { %>
            <div class="carousel-item">
     			 <img src="/fm/resources/upfiles/<%= trail.getTrailId() %>/<%= photoList.get(i).getOriginFileName() %>" class="d-block w-100" alt="Image 1" >
              <div class="carousel-caption d-none d-md-block">
                <h5>Second slide label</h5>
                <p>Some representative placeholder content for the second slide.</p>
              </div>
            </div>
            <% } %>
          </div>
          </div>
          
          <ol class="carousel-indicators">
   <% for (int i = 0; i < photoList.size(); i++) { %>
  			<%
   			 String buttonClass = "";
   				 if (i == 0) {
     			 buttonClass = "active";
  				  }
 			 %>
  				<button type="button" data-bs-target="#carouselExampleModal_<%= trail.getTrailId() %>" data-bs-slide-to="<%= i %>" class="<%= buttonClass %>" aria-label="Slide <%= (i + 1) %>"></button>
			<% } %>
</ol>

<!-- Carousel 이전/다음 버튼 수정 -->
<a class="carousel-control-prev" href="#carouselExampleModal_<%= trail.getTrailId() %>" role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
</a>
<a class="carousel-control-next" href="#carouselExampleModal_<%= trail.getTrailId() %>" role="button" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
</a>

        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
    
    
    
    
                
              <!--   <div class="card mb-4"> 카드 간 간격 조절 -->
               
                    <div class="card-body" style=" cursor: pointer;" onclick="location.href='/fm/tdetail?trailId=<%= trail.getTrailId() %>';">
                        <p class="card-text">게시물 ID : <%= trail.getTrailId() %></p>
                        <p class="card-text">글쓴이 ID : <%= trail.getmId() %></p>
                        <p class="card-text">조회수 : <%= trail.getTrailCount() %></p>
                        <p class="card-text">좋아요수 : <%= request.getAttribute("goodc" + trail.getTrailId()) %></p>
                        <p class="card-text">신고처리 여부 : <%= trail.getTrailReport() %></p>
                        <p class="card-text">작성 날짜 : <%= trail.getTrailDate() %></p>
                        <p class="card-text">공개 범위 : <%= trail.getTrailRange() %></p>
                        <a id="goodButton_<%= trail.getTrailId() %>" onclick="toggleGood<%= trail.getTrailId() %>('<%= trail.getTrailId() %>'); event.stopPropagation(); return false;" class="btn btn-primary">좋아요</a>
                        <a id="bookmarkButton_<%= trail.getTrailId() %>" onclick="toggleBookmark<%= trail.getTrailId() %>('<%= trail.getTrailId() %>'); event.stopPropagation(); return false;" class="btn btn-primary">북마크</a>
                        <a id="reportButton<%= trail.getTrailId() %>" onclick="requestReport<%= trail.getTrailId() %>(); event.stopPropagation(); return false;" class="btn btn-primary">신고하기</a>
                        <a href="/fm/tdetail?trailId=<%= trail.getTrailId() %>" class="btn btn-primary">상세정보</a>
                    </div>
                </div>
                <script type="text/javascript">
                    // 이 부분에서 JavaScript 코드를 사용할 수 있습니다.
                    var trailJson = <%= trail.getTrailJson() %>;
                    var trailId = '<%= trail.getTrailId() %>';
                    var isBookmarked = <%= request.getAttribute("isBookmarked_" + trail.getTrailId()) %>;
                    var isLiked = <%= request.getAttribute("isLiked_" + trail.getTrailId()) %>;

                    // 북마크 버튼 상태 초기화
                    var bookmarkButton_<%= trail.getTrailId() %> = document.getElementById("bookmarkButton_<%= trail.getTrailId() %>");
                    if (isBookmarked) {
                        bookmarkButton_<%= trail.getTrailId() %>.textContent = "북마크 취소";
                        bookmarkButton_<%= trail.getTrailId() %>.classList.add("btn-danger");
                    } else {
                        bookmarkButton_<%= trail.getTrailId() %>.textContent = "북마크";
                    }

                    function toggleBookmark<%= trail.getTrailId() %>(trailId) {
                        var bookmarkButton = document.getElementById("bookmarkButton_" + trailId);
                        
                        if (bookmarkButton.textContent === "북마크 취소") {
                            requestBookmarkCancel<%= trail.getTrailId() %>(trailId);
                            bookmarkButton.textContent = "북마크";
                            bookmarkButton.classList.remove("btn-danger");
                        } else {
                            requestBookmark<%= trail.getTrailId() %>(trailId);
                            bookmarkButton.textContent = "북마크 취소";
                            bookmarkButton.classList.add("btn-danger");
                        }
                    }


                    function requestBookmark<%= trail.getTrailId() %>(trailId) {
                        // 북마크 등록 요청 함수
                        fetch(`/fm/book?trailId=<%= trail.getTrailId() %>`)
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert(data.message);
                            } else {
                                alert('오류 발생: ' + trailId);
                            }
                        })
                        .catch(error => {
                            console.error('에러 :', trailId);
                        });
                    }

                    function requestBookmarkCancel<%= trail.getTrailId() %>(trailId) {
                        // 북마크 취소 요청 함수
                        fetch(`/fm/bcancel?trailId=<%= trail.getTrailId() %>`)
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert(data.message);
                            } else {
                                alert('오류 발생: ' + trailId);
                            }
                        })
                        .catch(error => {
                            console.error('에러 :', trailId);
                        });
                    }
                    
                 // 좋아요 버튼 상태 초기화
                    var goodButton_<%= trail.getTrailId() %> = document.getElementById("goodButton_<%= trail.getTrailId() %>");
                    if (isLiked) {
                    	goodButton_<%= trail.getTrailId() %>.textContent = "좋아요 취소";
                    	goodButton_<%= trail.getTrailId() %>.classList.add("btn-danger");
                    } else {
                    	goodButton_<%= trail.getTrailId() %>.textContent = "좋아요";
                    }

                    function toggleGood<%= trail.getTrailId() %>(trailId) {
                        var goodButton = document.getElementById("goodButton_" + trailId);
                        
                        if (goodButton.textContent === "좋아요 취소") {
                            requestGoodCancel<%= trail.getTrailId() %>(trailId);
                            goodButton.textContent = "좋아요";
                            goodButton.classList.remove("btn-danger");
                        } else {
                            requestGood<%= trail.getTrailId() %>(trailId);
                            goodButton.textContent = "좋아요 취소";
                            goodButton.classList.add("btn-danger");
                        }
                    }


                    function requestGood<%= trail.getTrailId() %>(trailId) {
                        // 좋아요 등록 요청 함수
                        fetch(`/fm/good?trailId=<%= trail.getTrailId() %>`)
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert(data.message);
                            } else {
                                alert('오류 발생: ' + trailId);
                            }
                        })
                        .catch(error => {
                            console.error('에러 :', trailId);
                        });
                    }

                    function requestGoodCancel<%= trail.getTrailId() %>(trailId) {
                        // 북마크 취소 요청 함수
                        fetch(`/fm/nogood?trailId=<%= trail.getTrailId() %>`)
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert(data.message);
                            } else {
                                alert('오류 발생: ' + trailId);
                            }
                        })
                        .catch(error => {
                            console.error('에러 :', trailId);
                        });
                    }
                    function requestReport<%= trail.getTrailId() %>() {
                        // 현재 페이지의 URL을 추출
                        var currentURL = window.location.href;

                        // 현재 페이지 URL을 기반으로 리디렉션 수행
                        var xhr = new XMLHttpRequest();
                        xhr.open('GET', '/fm/treport?trailId=<%= trail.getTrailId() %>', true);
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                // 서버에서 리디렉션 완료 후 메시지 표시
                                alert("신고가 접수되었습니다.");
                                // 페이지 리로드 또는 필요한 동작 수행
                                location.reload(); // 페이지 리로드 예시
                            }
                        };
                        xhr.send();
                    }

                    
                </script>
   <script type="text/javascript">
   function openModal<%= trail.getTrailId() %>(imageIndex) {
	    var modalId = `carouselExampleModal<%= trail.getTrailId() %>`;
	    var modal = document.getElementById(modalId);
	    var bsModal = new bootstrap.Modal(modal);

	    // 모달이 열릴 때 해당 Carousel을 초기화
	    modal.addEventListener('shown.bs.modal', function () {
	        var carouselId = `carouselExampleModal<%= trail.getTrailId() %>`;
	        var carousel = document.getElementById(carouselId);
	        var bsCarousel = new bootstrap.Carousel(carousel);
	        

	        // 클릭한 이미지의 순서에 맞게 Carousel을 설정
	        bsCarousel.to(imageIndex);
	    });

	    bsModal.show();
	}
   
   
   </script>             
                
                
                
                
                <% } //for %>
</div>
</div>		
        	<% } // if %>
        	<br><br><br>
        </div>
    </div>
</section>
	<!-- Footer-->
	<!--   <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer> -->
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/fm/resources/js/myprofileStyle.js"></script>

<%-- 페이징 처리 뷰 포함 처리 --%>
<%@ include file="../common/pagingView.jsp" %>
	<%@ include file="../common/footer.jsp"%>
</body>
<script>
		function showToast() {
			var hiddenDiv = document.querySelector('.hidden-toast');
			if (hiddenDiv !== null) {
				hiddenDiv.style.display = 'block';
			}
		}
		function displayToast() {
			var exitDiv = document.querySelector('.hidden-toast');
			if (exitDiv !== null) {
				exitDiv.style.display = 'none';
			}
		}
		function deleteMember(){
			location.href = "/fm/mdel?email=<%=member.getEmail()%>&pwd=<%=member.getPwd()%>";
		}
	</script>
</html>