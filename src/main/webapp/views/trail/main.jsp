<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, trail.model.vo.Trail"%>
<%
    Member member = (Member) session.getAttribute("loginMember");
    ArrayList<Trail> list = (ArrayList<Trail>) request.getAttribute("list");
	int nowpage = ((Integer)request.getAttribute("currentPage")).intValue();
%>

<%@ include file="../common/head.jsp" %>
<script type="text/javascript">
	$(function() {

		
				$.ajax({
					url : "/fm/userranking",
					type : "get",
					dataType : "json",
					success : function(data) {
						console.log("팔로워유저순위 : " + data);

						var str = JSON.stringify(data);
						var json = JSON.parse(str);

						values = "";
						for ( var i in json.flist) {
							values += "<tr><td>"
									+ json.flist[i].no
									+ "</td><td><a href='/fm/info?mid=" 
									+ json.flist[i].mid + "'>"
									+ json.flist[i].NickName
									+ "</a></td><td>"
									+ json.flist[i].followe + '명'
									+ "</td></tr>";
						}
						$('#selectFolloweeRank').html(
								$('#selectFolloweeRank').html()
										+ values);

					},
					error : function(xhr, status, error) {
						console.error(" 팔로워순 유저 가져오기 에러 : ", error);
					}

				});//ajax

	}); //document ready

	$(function() {

		
				$.ajax({

					url : "/fm/weeklyhot",
					type : "get",
					dataType : "json",
					success : function(data) {
						console.log("주간인기태그 : " + data);

						var str = JSON.stringify(data);
						var json = JSON.parse(str);

						values = "";
						for ( var i in json.tlist) {
							values += "<tr><td>  "
									+ json.tlist[i].no
									+ ".</td>"
									+ "<td><a href='/fm/weeklyhotselect?tagname="
									+ json.tlist[i].tagname + "'>"
									+ "#" + json.tlist[i].tagname
									+ "</a></td></tr>";
						}

						$('#selectTagList').html(
								$('#selectTagList').html() + values);
					},
					error : function(xhr, status, error) {
						console.error(" 주간인기 태그 가져오기 에러 : ", error);
					}

				});//ajax
});
</script>
</head>
<body>
    <div class="container">

        <!-- 상단 고정 내비게이션 바 -->
        <%@ include file="../common/navbar.jsp" %>
        <h1>메인페이지</h1>
        <div class="row justify-content-center"> <!-- 중앙 정렬을 위한 부분 -->
            <div class="col-md-6"> <!-- 한 줄에 한 개의 게시글을 나열 -->
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
                
                
                
                
                <% } %>
                
            </div>
        </div>
    </div>
    	<div class="followee">
				<h4>팔로워 유저 순위</h4>
				<table id="selectFolloweeRank">
					<tr>
						<td></td>
					</tr>
				</table>
			</div>

			<div class="weeklytag">
				<h2>주간 인기 태그</h2>
				<table id="selectTagList">
					<tr>
						<td></td>
					</tr>
				</table>


			</div>
<%-- 페이징 처리 뷰 포함 처리 --%>
<%@ include file="../common/pagingView.jsp" %>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
