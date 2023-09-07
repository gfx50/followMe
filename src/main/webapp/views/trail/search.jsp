<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import=" trail.model.vo.Trail, java.util.ArrayList, tag.model.vo.Tag "%>
<%@ include file="../common/head.jsp"%>
<%
ArrayList<Trail> list = (ArrayList<Trail>) request.getAttribute("list");
ArrayList<String> searchHistory = (ArrayList<String>) session.getAttribute("searchHistory");
%>
<!-- 상단 고정 내비게이션 바 -->
<%@ include file="../common/navbar.jsp"%>
<head>

<body>




<style>
.followee {
	position: fixed;
	margin-top: 20px; /* 위쪽 여백 설정 */
	top: 400px; /* 원하는 상단 간격 설정 */
	right: 0px;
	padding: 50px; /* 내부 여백 설정 */
	max-width: 400px; /* 최대 너비 설정 */
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
}

#selectFolloweeRank {
	width: 100%; /* 테이블 너비 100%로 설정 */
	border-collapse: collapse; /* 테이블 셀 간 경계 없앰 */
}

#selectFolloweeRank th, #selectFolloweeRank td {
	border: 1px solid #ccc; /* 셀 테두리 설정 */
	padding: 8px; /* 셀 내부 여백 설정 */
	text-align: center; /* 셀 가운데 정렬 */
}

#selectFolloweeRank th {
	background-color: #f2f2f2; /* 헤더 배경색 설정 */
}

.weeklytag {
	position: fixed;
	top: 100px; /* 원하는 상단 간격 설정 */
	right: 0;
	float: right; /* 오른쪽 정렬 */
	margin-right: 20px; /* 오른쪽 여백 설정 */
	background-color: white;
	/* 다른 요소 위에 보이도록 설정 */
}

.card-container {
	overflow: hidden; /* 자식 요소가 넘치는 경우를 방지합니다. */
}

.card {
	width: 300px;
	margin-right: 10px;
	float: left; /* 카드를 가로로 나열합니다. */
	margin-bottom: 10px; /* 필요에 따라 아래 여백을 조절합니다. */
}





</style>


	<script type="text/javascript"
		src="/fm/resources/js/jquery-3.7.0.min.js"></script>
	<div class="container">
		<script type="text/javascript">


			$(function() {

				

				$.ajax({
							url : "/fm/weeklymax",
							type : "get",
							dataType : "json",
							success : function(data) {
								console.log("주간 조회순 게시글 : " + data);

								var str = JSON.stringify(data);
								var json = JSON.parse(str);

								values = "<input type='submit' value='더 많은 결과 보기'><br><br>";
								for ( var i in json.nlist) {
									values += "<div class='card'>"
											+ "<img class='card-img-top' src='https://dummyimage.com/450x300/dee2e6/6c757d.jpg' alt='...' />"
											+ "<div class='card-body'>"
											+ "<h5 class='card-title'> "
											+ json.nlist[i].nickName
											+ "님</h5>"
											+ "<p class='card-text'> 작성 날짜: "
											+ json.nlist[i].trailDate
											+ "<br> JSON: "
											+ json.nlist[i].trailJson
											+ "<br> 조회수:"
											+ json.nlist[i].trailCount
											+ " <br> </p>"
											+

											"<a href='/fm/tdetail?trailId="
											+ json.nlist[i].trailId
											+ "' class='btn btn-primary'>상세보기</a>"
											+ "</div>" + "</div>";

								}
								$('#selectWeeklycount')
										.html(
												$('#selectWeeklycount').html()
														+ values);
							},

							error : function(xhr, status, error) {
								console.error("주간 조회순 게시물 가져오기 에러 : ", error);
							}

						});//ajax

				$
						.ajax({
							url : "/fm/weeklygood",
							type : "get",
							dataType : "json",
							success : function(data) {
								console.log("주간 좋아요 게시글 : " + data);

								var str = JSON.stringify(data);
								var json = JSON.parse(str);

								values = "<input type='submit' value='더 많은 결과 보기'><br><br>";
								for ( var i in json.glist) {
									values += "<div class='card'>"
											+ "<img class='card-img-top' src='https://dummyimage.com/450x300/dee2e6/6c757d.jpg' alt='...' />"
											+ "<div class='card-body'>"
											+ "<h5 class='card-title'>"
											+ json.glist[i].nickName
											+ "님</h5>"
											+ "<p class='card-text'> 작성 날짜: "
											+ json.glist[i].trailDate
											+ "<br> JSON"
											+ json.glist[i].trailJson
											+ "<br> 좋아요 : "
											+ json.glist[i].trailGood
											+ " <br> </p>"
											+

											"<a href='/fm/tdetail?trailId="
											+ json.glist[i].trailId
											+ "' class='btn btn-primary'>상세보기</a>"
											+ "</div>" + "</div>";
								}
								$('#selectWeeklygood').html(
										$('#selectWeeklygood').html() + values);
							},

							error : function(xhr, status, error) {
								console.error("주간 좋아요 게시물 가져오기 에러 : ", error);
							}

						});//ajax

				$.ajax({
					url : "/fm/weeklyonetag",
					type : "get",
					dataType : "json",
					success : function(data) {
						console.log("태그 1위 가져오기 : " + data);

						var str = JSON.stringify(data);
						var json = JSON.parse(str);

						values = "";
						// 첫 번째 요소만 가져오기
						var firstTag = json.olist[0];

						// 첫 번째 요소의 "tag" 값을 사용하여 HTML 생성
						values += "<h3> 태그 : #" + firstTag.tag + "</h3>";
						$('#onetag').html($('#onetag').html() + values);
					},
					error : function(xhr, status, error) {
						console.error("인기 태그 한개 가져오기 에러 : ", error);
					}

				});//ajax

				$
						.ajax({
							url : "/fm/weeklyonetag",
							type : "get",
							dataType : "json",
							success : function(data) {
								console.log("인기 태그  게시글 : " + data);

								var str = JSON.stringify(data);
								var json = JSON.parse(str);

								values = "<input type='submit' value='더 많은 결과 보기'><br><br>";
								for ( var i in json.olist) {
									values +=

									"<div class='card'>"
											+ "<img class='card-img-top' src='https://dummyimage.com/450x300/dee2e6/6c757d.jpg' alt='...' />"
											+ "<div class='card-body'>"
											+ "<h5 class='card-title'>"
											+ json.olist[i].nickName
											+ "님</h5>"
											+ "<p class='card-text'> 작성 날짜: "
											+ json.olist[i].trailDate
											+ "<br> JSON"
											+ json.olist[i].trailJson
											+ "<br> 좋아요 : "
											+ json.olist[i].trailGood
											+ " <br></p>조회수 : "
											+ json.olist[i].trailCount
											+ "<br>"
											+ "<a href='/fm/tdetail?trailId="
											+ json.olist[i].trailId
											+ "' class='btn btn-primary'>상세보기</a>"
											+ "</div>" + "</div>";
								}
								$('#onetag').html($('#onetag').html() + values);
							},

							error : function(xhr, status, error) {
								console.error("인기 태그 게시글 가져오기 에러 : ", error);
							}

						});//ajax

			});//document ready
		</script>




 	<div class="wrapper" style="text-align: center;">
        <form id="tagselectform" class="form1" action="/fm/tagnicknamesearch" method="post">
            <input type="search" name="keyword" id="searchKeyword" placeholder="검색할 유저or태그를 입력하세요" style="width: 300px;">
            <input type="submit" value="검색">
        </form>
    
    </div>
  
		<br> <br> <br>

		<header>


			<div style="text-align: center;">
				<form id="coming" action="/fm/todayposts" method="post">
					<h2>🎆오늘의 인기 게시글 보기🎆</h2>
					<input type="submit" value="확인">
				</form>
			</div>




			<form id="selectWeeklycount" action="/fm/viewsmax">
				<h2>최다 조회수 게시글(주간)</h2>
			</form>
			<br> <br> <br>

			
			<form id="selectWeeklygood" action="/fm/goodviewmax">
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br>
				<h2>최다 좋아요 게시글(주간)</h2>
			</form>

			<br> <br> <br>
			<hr>
			<!-- 인기 태그 게시글 보여주기  -->
			<form id="onetag" action="/fm/weeklyonetagview">
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br>

				<h2>최상위 태그 추천 게시글</h2>

			</form>

			


		</header>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>


	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	

	<%@ include file="../common/footer.jsp"%>
</body>
</html>