<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, 
    trail.model.vo.Trail, thread.model.vo.Thread, comments.model.vo.Comments,  
    book.model.vo.Book, good.model.vo.Good"%>
<%
    Member member = (Member)session.getAttribute("loginMember");
    Trail trail = (Trail)request.getAttribute("trail");
    ArrayList<Trail> list = (ArrayList<Trail>)request.getAttribute("list"); // 가정한 쓰레드 목록
    ArrayList<Comments> clist = (ArrayList<Comments>)request.getAttribute("clist"); // 코멘트 리스트
    Book book = (Book)request.getAttribute("book");
    boolean isBookmarked = (Boolean)request.getAttribute("isBookmarked");
	boolean isLiked = (Boolean)request.getAttribute("isLiked");
	ArrayList<Trail> photoListm = (ArrayList<Trail>) request.getAttribute("photoListm");

    System.out.println("detailview.jsp : " + list);
%>

<%@ include file="../common/head.jsp"%>
<script type="text/javascript">
var trailJson = <%= trail.getTrailJson() %>;
</script>
</head>
<body>
        <!-- 상단 고정 내비게이션 바 -->
        <%@ include file="../common/navbar.jsp"%>
    <div class="container">

        <h1>게시물 상세보기</h1>
        <br>
	<div class="card mb-4"> <!-- 카드 간 간격 조절 -->
 
    <%-- 모달폼 --%>
<div class="modal fade" id="carouselExampleModalm<%= trail.getTrailId() %>" tabindex="-1" role="dialog" aria-labelledby="carouselModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="carouselModalLabel">Carousel 모달</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       

        <!-- 모달폼 내용 -->
        <div id="carouselExampleModalm_<%= trail.getTrailId() %>" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
              <div id = "carouselimgs<%= trail.getTrailId() %>" class="carousel-inner">
            <div class="carousel-item active">
     			 <img src="/fm/resources/upfiles/<%= trail.getTrailId() %>/<%= photoListm.get(0).getOriginFileName() %>" class="d-block w-100" alt="Image 0">
              <div class="carousel-caption d-none d-md-block">
                <h5>First slide label</h5>
                <p>Some representative placeholder content for the first slide.</p>
              </div>
            </div>
            
            <% for (int i = 1; i < photoListm.size(); i++) { %>
            <div class="carousel-item">
     			 <img src="/fm/resources/upfiles/<%= trail.getTrailId() %>/<%= photoListm.get(i).getOriginFileName() %>" class="d-block w-100" alt="Image 1" >
              <div class="carousel-caption d-none d-md-block">
                <h5>Second slide label</h5>
                <p>Some representative placeholder content for the second slide.</p>
              </div>
            </div>
            <% } %>
          </div>
          </div>
          
          <ol class="carousel-indicators">
   <% for (int i = 0; i < photoListm.size(); i++) { %>
  			<%
   			 String buttonClass = "";
   				 if (i == 0) {
     			 buttonClass = "active";
  				  }
 			 %>
  				<button type="button" data-bs-target="#carouselExampleModalm_<%= trail.getTrailId() %>" data-bs-slide-to="<%= i %>" class="<%= buttonClass %>" aria-label="Slide <%= (i + 1) %>"></button>
			<% } %>
</ol>

<!-- Carousel 이전/다음 버튼 수정 -->
<a class="carousel-control-prev" href="#carouselExampleModalm_<%= trail.getTrailId() %>" role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
</a>
<a class="carousel-control-next" href="#carouselExampleModalm_<%= trail.getTrailId() %>" role="button" data-bs-slide="next">
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
 
  
                     
    <%@ include file="../common/trailmap.jsp" %>

    <div class="card-body">
    	<h5 class="card-title" id='title'></h5>
        <p class="card-text" id='body'></p>
        <p class="card-text">닉네임 : <%= member.getNickName() %></p>
        <p class="card-text">조회수 : <%= trail.getTrailCount() %></p>
        <p class="card-text">좋아요수 : <%= trail.getTrailGood() %></p>
        <p class="card-text">작성 날짜 : <%= trail.getTrailDate() %></p>
        <p class="card-text" id='tags'></p>
        <a id="goodButton" onclick="toggleGood();" class="btn btn-primary"></a>						
		<a id="bookmarkButton" onclick="toggleBookmark();" class="btn btn-primary"></a>

        <a href="/fm/teditbody?trailId=<%= trail.getTrailId() %>" class="btn btn-primary mb-4">내용 수정</a>
        <div id="cmts" class="mb-4">
        <% if(clist.size() > 0 ) { for(Comments c : clist) { %>
            <div class="card">
              <div class="card-header">
              <img src="/fm/resources/images/<%= c.getProfilepic()!=null?c.getProfilepic():"user.png" %>" 
					style="width: 20px;height: 20px;object-fit: cover;border-radius:50%;">&nbsp;
					<a href="/fm/info?mid=<%=c.getmId()%>" style="font-weight: normal;text-decoration: none;color:black;"><%= c.getNickName() %></a> &nbsp;&nbsp;&nbsp;&nbsp;<%= c.getCommentsTime() %>
              </div>
              <div class="card-body mb-2">
                <p class="card-text"><%= c.getCommentsContent() %></p>
                <% if (c.getmId().equals(member.getmId())){ %>
                	<button class="btn btn-primary btn-sm cdelete" align="right">삭제
                	<input type="hidden" value="<%= c.getCommentsId() %>"></button>
                	
                <% } else { %>
                	<button class="btn btn-primary btn-sm creport" align="right">신고
                	<input type="hidden" value="<%= c.getCommentsId() %>"></button>
                <% } %>
              </div>
            </div>
        <% }} %>
          </div> <!-- 코맨트 끝-->

        <div class="input-group mb-3">
        	<span class="input-group-text">댓글</span>
	        <textarea class="form-control" aria-label="본문" id="comments"></textarea>
        </div>

  	    <button class="btn btn-primary col-md-1" onclick='inputComment();return false;'>등록</button>
        
    </div> <!-- card body -->


<script type="text/javascript">
   function openModalm<%= trail.getTrailId() %>(imageIndex) {
	    var modalId = `carouselExampleModalm<%= trail.getTrailId() %>`;
	    var modal = document.getElementById(modalId);
	    var bsModal = new bootstrap.Modal(modal);

	    // 모달이 열릴 때 해당 Carousel을 초기화
	    modal.addEventListener('shown.bs.modal', function () {
	        var carouselId = `carouselExampleModalm<%= trail.getTrailId() %>`;
	        var carousel = document.getElementById(carouselId);
	        var bsCarousel = new bootstrap.Carousel(carousel);
	        

	        // 클릭한 이미지의 순서에 맞게 Carousel을 설정
	        bsCarousel.to(imageIndex);
	    });

	    bsModal.show();
	}
   
   
   </script>    
   
                <!-- 쓰레드 목록 출력 위치 -->
<div class="card mb-4">
    <div class="card-body">
        <h5 class="card-title">게시물 쓰레드 목록</h5>
        <ul>
            <% if (list != null && !list.isEmpty()) { %>
                <% for (Trail t : list) { %>
                   <% String currentTrailId = t.getTrailId(); %>
                   <% ArrayList<Trail> photoList = (ArrayList<Trail>) request.getAttribute("photoList_" + t.getTrailId()); %>
                <li class="card mb-2">
                 <article class="my-3" id="carousel">
      <div class="bd-heading align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3><%= t.getTrailId() %></h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example m-0 border-0">
        <div id="carouselExampleCaptions<%= t.getTrailId() %>" class="carousel slide carousel-fade" data-bs-ride="carousel">
          <div id = "carouselind<%= t.getTrailId() %>" class="carousel-indicators">
            <% for (int i = 0; i < photoList.size(); i++) { %>
  			<%
   			 String buttonClass = "";
   				 if (i == 0) {
     			 buttonClass = "active";
  				  }
 			 %>
  				<button type="button" data-bs-target="#carouselExampleCaptions<%= t.getTrailId() %>" data-bs-slide-to="<%= i %>" class="<%= buttonClass %>" aria-label="Slide <%= (i + 1) %>"></button>
			<% } %>
          </div>
          
          <!-- Carousel 내용 -->
          <div id = "carouselimgs<%= t.getTrailId() %>" class="carousel-inner">
            <div class="carousel-item active" onclick="openModal<%= t.getTrailId() %>(0)">
     			 <img src="/fm/resources/upfiles/<%= trail.getTrailId() %>/<%= photoList.get(0).getOriginFileName() %>" class="d-block w-100" alt="Image 0">
              <div class="carousel-caption d-none d-md-block">
                <h5>First slide label</h5>
                <p>Some representative placeholder content for the first slide.</p>
              </div>
            </div>
            
            <% for (int i = 1; i < photoList.size(); i++) { %>
            <div class="carousel-item" onclick="openModal<%= t.getTrailId() %>(<%= i %>)">
     			 <img src="/fm/resources/upfiles/<%= trail.getTrailId() %>/<%= photoList.get(i).getOriginFileName() %>" class="d-block w-100" alt="Image 1" >
              <div class="carousel-caption d-none d-md-block">
                <h5>Second slide label</h5>
                <p>Some representative placeholder content for the second slide.</p>
              </div>
            </div>
            <% } %>
          </div>
          
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions<%= t.getTrailId() %>" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions<%= t.getTrailId() %>" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
        </div></div>

      </div>
    </article>
    
    <%-- 모달폼 --%>
<div class="modal fade" id="carouselExampleModal<%= t.getTrailId() %>" tabindex="-1" role="dialog" aria-labelledby="carouselModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="carouselModalLabel">Carousel 모달</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
        </button>
      </div>
      
      
      <div class="modal-body">
        <!-- 모달폼 내용 -->
        <div id="carouselExampleModal_<%= t.getTrailId() %>" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
              <div id = "carouselimgs<%= t.getTrailId() %>" class="carousel-inner">
            <div class="carousel-item active">
     			 <img src="/fm/resources/upfiles/<%= trail.getTrailId() %>/<%= photoList.get(0).getOriginFileName() %>" class="d-block w-100" alt="Image 0">
              <div class="carousel-caption d-none d-md-block">
                <h5>First slide label</h5>
                <p>Some representative placeholder content for the first slide.</p>
              </div>
            </div>
            
            <% for (int i = 1; i < photoList.size(); i++) { %>
            <div class="carousel-item">
     			 <img src="/fm/resources/upfiles/<%= trail.getTrailId() %>/<%= photoList.get(i).getOriginFileName() %>" class="d-block w-100" alt="Image<%= i %>">
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
  				<button type="button" data-bs-target="#carouselExampleModal_<%= t.getTrailId() %>" data-bs-slide-to="<%= i %>" class="<%= buttonClass %>" aria-label="Slide <%= (i + 1) %>"></button>
			<% } %>
</ol>

<!-- Carousel 이전/다음 버튼 수정 -->
<a class="carousel-control-prev" href="#carouselExampleModal_<%= t.getTrailId() %>" role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
</a>
<a class="carousel-control-next" href="#carouselExampleModal_<%= t.getTrailId() %>" role="button" data-bs-slide="next">
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
                   
                   
                     
                        <div class="card-body">
                            <p class="card-text">게시물 id : <%= t.getTrailId() %></p>
                            <p class="card-text">팔로워 id : <%= t.getmId() %></p>
                            <p class="card-text">조회수 : <%= t.getTrailCount() %></p>
                            <p class="card-text">좋아요수 : <%= request.getAttribute("goodtc"+ t.getTrailId()) %></p>
                            <p class="card-text">신고처리 여부 : <%= t.getTrailReport() %></p>
                            <p class="card-text">작성 날짜 : <%= t.getTrailDate() %></p>
                            <a id="goodButton_<%= t.getTrailId() %>" onclick="toggleGood<%= t.getTrailId() %>('<%= t.getTrailId() %>');" class="btn btn-primary"></a>
							<a id="bookmarkButton_<%= t.getTrailId() %>" onclick="toggleBookmark<%= t.getTrailId() %>('<%= t.getTrailId() %>');" class="btn btn-primary"></a>

                            <a href="#" class="btn btn-primary">공유</a>
                            <a href="/fm/tdetail?trailId=<%= t.getTrailId() %>" class="btn btn-primary">상세정보</a>
                        </div>
                    </li>

                    <!-- JavaScript 코드 -->
<script type="text/javascript">
                        // 이 부분에서 JavaScript 코드를 사용할 수 있습니다.
                        var trailId = '<%= t.getTrailId() %>';
                        var isBookmarked_ = <%= request.getAttribute("isBookmarked_" + t.getTrailId()) %>;
                        var isLiked_ = <%= request.getAttribute("isLiked_" + t.getTrailId()) %>;

                        // 북마크 버튼 상태 초기화
                        var bookmarkButton_<%= t.getTrailId() %> = document.getElementById("bookmarkButton_<%= t.getTrailId() %>");
                        if (isBookmarked_) {
                            bookmarkButton_<%= t.getTrailId() %>.textContent = "북마크 취소";
                            bookmarkButton_<%= t.getTrailId() %>.classList.add("btn-danger");
                        } else {
                            bookmarkButton_<%= t.getTrailId() %>.textContent = "북마크";
                        }

                        function toggleBookmark<%= t.getTrailId() %>(trailId) {
                            
                            if (bookmarkButton_<%= t.getTrailId() %>.textContent === "북마크 취소") {
                                requestBookmarkCancel<%= t.getTrailId() %>(trailId);
                                bookmarkButton_<%= t.getTrailId() %>.textContent = "북마크";
                                bookmarkButton_<%= t.getTrailId() %>.classList.remove("btn-danger");
                            } else {
                                requestBookmark<%= t.getTrailId() %>(trailId);
                                bookmarkButton_<%= t.getTrailId() %>.textContent = "북마크 취소";
                                bookmarkButton_<%= t.getTrailId() %>.classList.add("btn-danger");
                            }
                        }

                        function requestBookmark<%= t.getTrailId() %>(trailId) {
                            // 북마크 등록 요청 함수
                            fetch(`/fm/book?trailId=<%= t.getTrailId() %>`)
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

                        function requestBookmarkCancel<%= t.getTrailId() %>(trailId) {
                            // 북마크 취소 요청 함수
                            fetch(`/fm/bcancel?trailId=<%= t.getTrailId() %>`)
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
                        var goodButton_<%= t.getTrailId() %> = document.getElementById("goodButton_<%= t.getTrailId() %>");
                        if (isLiked_) {
                            goodButton_<%= t.getTrailId() %>.textContent = "좋아요 취소";
                            goodButton_<%= t.getTrailId() %>.classList.add("btn-danger");
                        } else {
                            goodButton_<%= t.getTrailId() %>.textContent = "좋아요";
                        }

                        function toggleGood<%= t.getTrailId() %>(trailId) {
                            
                            if (goodButton_<%= t.getTrailId() %>.textContent === "좋아요 취소") {
                                requestGoodCancel<%= t.getTrailId() %>(trailId);
                                goodButton_<%= t.getTrailId() %>.textContent = "좋아요";
                                goodButton_<%= t.getTrailId() %>.classList.remove("btn-danger");
                            } else {
                                requestGood<%= t.getTrailId() %>(trailId);
                                goodButton_<%= t.getTrailId() %>.textContent = "좋아요 취소";
                                goodButton_<%= t.getTrailId() %>.classList.add("btn-danger");
                            }
                        }

                        function requestGood<%= t.getTrailId() %>(trailId) {
                            // 좋아요 등록 요청 함수
                            fetch(`/fm/good?trailId=<%= t.getTrailId() %>`)
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

                        function requestGoodCancel<%= t.getTrailId() %>(trailId) {
                            // 좋아요 취소 요청 함수
                            fetch(`/fm/nogood?trailId=<%= t.getTrailId() %>`)
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
                        
                        
                        function openModal<%= t.getTrailId() %>(imageIndex) {
                    	    var modalId = `carouselExampleModal<%= t.getTrailId() %>`;
                    	    var modal = document.getElementById(modalId);
                    	    var bsModal = new bootstrap.Modal(modal);

                    	    // 모달이 열릴 때 해당 Carousel을 초기화
                    	    modal.addEventListener('shown.bs.modal', function () {
                    	        var carouselId = `carouselExampleModal<%= t.getTrailId() %>`;
                    	        var carousel = document.getElementById(carouselId);
                    	        var bsCarousel = new bootstrap.Carousel(carousel);
                    	        

                    	        // 클릭한 이미지의 순서에 맞게 Carousel을 설정
                    	        bsCarousel.to(imageIndex);
                    	    });

                    	    bsModal.show();
                    	}
                        
                    </script>
                <% } %>
            <% } else { %>
                <p>쓰레드가 없습니다.</p>
            <% } %>
        </ul>
    </div>
</div>
</div>
    <%@ include file="../common/footer.jsp"%>
<script>
$(function(){
$('#title').text(trailJson.title);
$('#body').text(trailJson.body);
});
var trailId = '<%= trail.getTrailId() %>';
var mId = '<%= member.getmId() %>';
var nickName = '<%= member.getNickName() %>';
var profilepic = '<%= member.getProfilePic()!=null?member.getProfilePic():"user.png" %>';
var card1 = '<div class="card"><div class="card-header w-100"><img src="/fm/resources/images/' + profilepic + 
			'"style="width: 20px;height: 20px;object-fit: cover;border-radius:50%;">&nbsp;<a href="/fm/info?mid=' + mId + '" style="font-weight: normal;text-decoration: none;color:black;">' + nickName + 
			'</a> &nbsp;&nbsp;&nbsp;&nbsp;';
var card2 = '              </div>    <div class="card-body mb-2"><p class="card-text">';
var card3 = '</p></div></div>';
function inputComment() {
	$.ajax({
        type: "POST",
        url: "/fm/cwrite",
        dataType: "text",
        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
        data: {
        	trailId : trailId,
        	mId: mId,
        	body: $('#comments').val()
        },
        error: function() {
          console.log('통신실패!!');
        },
        success: function(data) {
          console.log("통신데이터 값 : " + data);
          const date = new Date();
          $('#cmts').append(card1 + date.toString() + card2 + data + card3);
          $('#comments').val('').focus();
          
        }
       });
}
$(document).ready(function(){
	  $(".creport").click(function(){
		  console.log($(this).find("input").val());
		  var commentsId = $(this).find("input").val();
			$.ajax({
		        type: "POST",
		        url: "/fm/creport",
		        dataType: "text",
		        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		        data: {
		        	commentsId : commentsId,
		        },
		        error: function() {
		          console.log(data);
		        },
		        success: function(data) {
		          console.log("통신데이터 값 : " + data);
					alert("신고 완료");		          
		        }
	       });
	  }); // creport
	  
	  $(".cdelete").click(function(){
		  console.log($(this).find("input").val());
		  var commentsid = $(this).find("input").val();
		  if(confirm("정말로 삭제하시겠습니까?")){
			  $.ajax({
			        type: "POST",
			        url: "/fm/cdelete",
			        dataType: "text",
			        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			        data: {
			        	commentsid : commentsid,
			        },
			        success: function(data) {
			          console.log("통신데이터 값 : " + data);
						location.reload();		          
			        },
			        error: function() {
			          console.log(data);
			        }
		       });
		  }
			
	  }); // cdelete
}); // document ready
	

var isBookmarked = <%= request.getAttribute("isBookmarked") %>; 
var bookmarkButton = document.getElementById("bookmarkButton");
var isLiked = <%= request.getAttribute("isLiked") %>; 
var goodButton = document.getElementById("goodButton");



// 서버로부터 받은 북마크 상태 정보
console.log(isBookmarked);
console.log(isLiked);
 // 북마크 버튼 상태 초기화

if (isBookmarked) {
    bookmarkButton.textContent = "북마크 취소";
    bookmarkButton.classList.add("btn-danger");
} else {
    bookmarkButton.textContent = "북마크";
}



if (isLiked) {
	goodButton.textContent = "좋아요 취소";
	goodButton.classList.add("btn-danger");
} else {
	goodButton.textContent = "좋아요";
}


function requestReport(){
	//신고하기 요청 함수
	location.href = "/fm/treport?trailId=<%= trail.getTrailId() %>";
	alert("신고가 접수되었습니다.");
}

function requestBookmark() {
    // 북마크 등록/취소 요청 함수
    var trailId = "<%= trail.getTrailId() %>";
    fetch(`/fm/book?trailId=<%= trail.getTrailId() %>`)
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert(data.message);
            // 여기에 UI 업데이트 로직 추가
            bookmarkButton = document.getElementById("bookmarkButton");
            bookmarkButton.textContent = "북마크 취소";
            bookmarkButton.classList.add("btn-danger"); // 예시 스타일 클래스 */
        } else {
            alert('오류 발생: ' + data.message);
        }
    })
    .catch(error => {
        console.error('에러 :', error);
    });
}
function requestBookmarkCancel() {
    // 북마크 등록/취소 요청 함수
    var trailId = "<%= trail.getTrailId() %>";
    fetch(`/fm/bcancel?trailId=<%= trail.getTrailId() %>`)
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert(data.message);
            // 여기에 UI 업데이트 로직 추가
            bookmarkButton = document.getElementById("bookmarkButton");
            bookmarkButton.textContent = "북마크";
            bookmarkButton.classList.remove("btn-danger"); // 예시 스타일 클래스 제거 */
        } else {
            alert('오류 발생: ' + data.message);
        }
    })
    .catch(error => {
        console.error('에러 :', error);
    });
}

function toggleBookmark() {
    var bookmarkButton = document.getElementById("bookmarkButton");
    
    if (bookmarkButton.textContent === "북마크 취소") {
        requestBookmarkCancel();
        bookmarkButton.textContent = "북마크";
        bookmarkButton.classList.remove("btn-danger");
    } else {
        requestBookmark();
        bookmarkButton.textContent = "북마크 취소";
        bookmarkButton.classList.add("btn-danger");
    }
}

function requestGood() {
    // 좋아요 요청 함수
    var trailId = "<%= trail.getTrailId() %>";
    fetch(`/fm/good?trailId=<%= trail.getTrailId() %>`)
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert(data.message);
            // 여기에 UI 업데이트 로직 추가
           goodButton = document.getElementById("goodButton");
           goodButton.textContent = "좋아요 취소";
           goodButton.classList.add("btn-danger"); // 예시 스타일 클래스 */
        } else {
            alert('오류 발생: ' + data.message);
        }
    })
    .catch(error => {
        console.error('에러 :', error);
    });
}
function requestGoodCancel() {
    // 좋아요 취소 요청 함수
    var trailId = "<%= trail.getTrailId() %>";
    fetch(`/fm/nogood?trailId=<%= trail.getTrailId() %>`)
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert(data.message);
            // 여기에 UI 업데이트 로직 추가
            goodButton = document.getElementById("goodButton");
            goodButton.textContent = "좋아요";
            goodButton.classList.remove("btn-danger"); // 예시 스타일 클래스 제거 */
        } else {
            alert('오류 발생: ' + data.message);
        }
    })
    .catch(error => {
        console.error('에러 :', error);
    });
}

function toggleGood() {
    var goodButton = document.getElementById("goodButton");
    
    if (goodButton.textContent === "좋아요 취소") {
        requestGoodCancel();
        goodButton.textContent = "좋아요";
        goodButton.classList.remove("btn-danger");
    } else {
        requestGood();
        goodButton.textContent = "좋아요 취소";
        goodButton.classList.add("btn-danger");
    }
} 



</script>

</body>
</html>

