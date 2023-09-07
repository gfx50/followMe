<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, trail.model.vo.Trail, thread.model.vo.Thread"%>
<%
    Member member = (Member)session.getAttribute("loginMember");
    Trail trail = (Trail)request.getAttribute("trail");
    ArrayList<Trail> list = (ArrayList<Trail>)request.getAttribute("list"); // 가정한 쓰레드 목록
    System.out.println("detailview.jsp : " + trail);
%>

<%@ include file="../common/head.jsp"%>
<style>
/*
 * Always set the map height explicitly to define the size of the div element
 * that contains the map.
 */
#map {
  height: 600px;
}

</style>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

<script type="text/javascript">
	var trailJson = <%= trail.getTrailJson() %>;
	var latDec = [];
	var lonDec = [];
	for (var i = 0; i < trailJson.trailPhotos.length ; i ++){
		latDec[i] = trailJson.trailPhotos[i].latDec;
		lonDec[i] = trailJson.trailPhotos[i].lonDec;
		console.log('latDec'+ i + ': ' + latDec[i]);
		console.log('lonDec'+ i + ': ' + lonDec[i]);
	}
	const centerLat = latDec.reduce(function add(sum, currValue) {
		  return sum + currValue;
		}, 0)/latDec.length;
	
	const centerLon = lonDec.reduce(function add(sum, currValue) {
		  return sum + currValue;
		}, 0)/lonDec.length;
	const c = centerLat + ',' + centerLon
	console.log(c);
//	document.getElementById('gmap').setAttribute('center',c);
</script>

</head>
<body>
    <div class="container">
        <!-- 상단 고정 내비게이션 바 -->
        <%@ include file="../common/navbar.jsp"%>

        <h1>게시물 상세보기</h1>
        <br>
<div class="card mb-4"> <!-- 카드 간 간격 조절 -->
                     

    <div id="map">    <!--The div element for the map -->
		<gmp-map id="gmap" zoom="15" map-id="a234af45bc04ad47">
        <%-- <gmp-advanced-marker position="37.504471,127.02514297222223" title="내 위치"></gmp-advanced-marker> --%>
        </gmp-map>
		<script>
			$('#gmap').attr("center", c);
            for ( i = 0; i < latDec.length; i++){
                var marker = 
                    '<gmp-advanced-marker position="' + latDec[i] + ',' + lonDec[i] + '" title=""></gmp-advanced-marker>';
                $('#gmap').append(marker);
            }
		</script>
    </div>
    <!-- 구글 맵스 embed api https://developers.google.com/maps/documentation/embed/get-started?_gl=1*lfx6e2*_ga*NDQ2NDE1OTc5LjE2OTM2NDUwMzU.*_ga_NRWSTWS78N*MTY5MzY1MjQ2MS4yLjEuMTY5MzY1NTkzNy4wLjAuMA..&hl=ko -->
<!--
    <iframe
        width="100%"
        height="450"
        frameborder="0" style="border:0"
        referrerpolicy="no-referrer-when-downgrade"
        src="https://www.google.com/maps/embed/v1/directions?key=AIzaSyDtziNot6T35oiVya9bcaWKRteCHd9JOpk&origin=광화문&waypoints=청주|대구&destination=부산진역&zoom=12"

        allowfullscreen>
    </iframe>
-->
    <!-- src="https://www.google.com/maps/embed/v1/directions?key=AIzaSyDtziNot6T35oiVya9bcaWKRteCHd9JOpk&origin=37.504471,127.02485297222222&waypoints=37.501452,127.02514297222223|37.501452,127.02514297222223&destination=37.501460,127.026&center=37.501452,127.02514297222223&zoom=18" -->
<!-- &waypoints=37.501452,127.02514297222223|37.501452,127.02514297222223 -->        

                    <div class="card-body">
                        <p class="card-text">JSON 파일 : <%= trail.getTrailJson() %></p>
                        
                        <p class="card-text">팔로워 id : <%= trail.getmId() %></p>
                        <p class="card-text">조회수 : <%= trail.getTrailCount() %></p>
                        <p class="card-text">좋아요수 : <%= trail.getTrailGood() %></p>
                        <p class="card-text">신고처리 여부 : <%= trail.getTrailReport() %></p>
                        <p class="card-text">작성 날짜 : <%= trail.getTrailDate() %></p>
                        <a href="#" class="btn btn-primary">좋아요</a>
                        <a href="#" class="btn btn-primary">북마크</a>
                        <a href="#" class="btn btn-primary">공유</a>
                        <a href="/fm/tdetail?trailId=<%= trail.getTrailId() %>" class="btn btn-primary">상세정보</a>
                    </div>
                </div>  
                <% if(list != null){ %>
                 <% for (Trail t : list) { %>
                 <svg class="bd-placeholder-img card-img-top" width="1000"
                        height="350" xmlns="http://www.w3.org/2000/svg" role="img"
                        aria-label="Placeholder: Image cap"
                        preserveAspectRatio="xMidYMid slice" focusable="false">
                        <rect width="100%" height="100%" fill="#868e96" />
                        <text x="50%" y="50%" fill="#dee2e6" dy=".3em" text-anchor="middle"
                            alignment-baseline="middle">이미지 불러오기</text>
                    </svg>
                    <div class="card-body">
                        <p class="card-text">JSON 파일 : <%= t.getTrailJson() %></p>
                        <p class="card-text">팔로워 id : <%= t.getmId() %></p>
                        <p class="card-text">조회수 : <%= t.getTrailCount() %></p>
                        <p class="card-text">좋아요수 : <%= t.getTrailGood() %></p>
                        <p class="card-text">신고처리 여부 : <%= t.getTrailReport() %></p>
                        <p class="card-text">작성 날짜 : <%= t.getTrailDate() %></p>
                        <a href="#" class="btn btn-primary">좋아요</a>
                        <a href="#" class="btn btn-primary">북마크</a>
                        <a href="#" class="btn btn-primary">공유</a>
                        <a href="/fm/tdetail?trailId=<%= t.getTrailId() %>" class="btn btn-primary">상세정보</a>
                    </div>
                </div>  
			<% } %> <!-- for t  -->
			<% } %> <!-- if -->
    <%@ include file="../common/footer.jsp"%>

<script async
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDtziNot6T35oiVya9bcaWKRteCHd9JOpk&callback=initMap&libraries=maps,marker&v=beta">
</script>
<script>
function initMap() {
    console.log('Maps JavaScript API loaded.');
    // map.setCenter({lat: centerLat, lng: centerLon});
    // new google.maps.Marker({position: {lat: latDec[0], lng: lonDec[0]}, map: map});
   }
</script>
</body>
</html>

