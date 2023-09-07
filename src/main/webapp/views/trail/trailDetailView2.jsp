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
html,
body {
  height: 100%;
  margin: 0;
  padding: 0;
}

</style>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

</head>
<body>
        <!-- 상단 고정 내비게이션 바 -->
        <%@ include file="../common/navbar.jsp"%>
    <div class="container">

        <h1>게시물 상세보기</h1>
        <br>
<div class="card mb-4"> <!-- 카드 간 간격 조절 -->
                     
	<div class="card-img-top container">
        <div class="row">
            <div id="map" class='col-xl-8'></div>    <!--The div element for the map -->
            <div class='col-xl-4'>
                <div id='trail_thumbs' class='row'>
                    <h6 align='center'>경로 정보 사진들</h6>
                    
                </div>
                    <hr>
                <div  id='nontrail_thumbs' class='row'>
                    <h6 align='center'>경로 정보 없는 사진들</h6>
                </div>
            </div>
        </div>  <!--  row -->
    </div> <!--  card img -->
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
			<% } %> <!-- for t  -->
			<% } %> <!-- if -->
    </div>
</div>
    <%@ include file="../common/footer.jsp"%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap" defer></script>

<script type="text/javascript">
var trailJson = <%= trail.getTrailJson() %>;

async function initMap(){
    var map;
    if(trailJson.trailPhotos.length > 0) {
	var latDec = [];
	var lonDec = [];
    var centerLat = trailJson.trailPhotos[0].latDec;
    var centerLon = trailJson.trailPhotos[0].lonDec;

    var rt = [];
    const { AdvancedMarkerElement, PinElement} = await google.maps.importLibrary("marker");
    var map = new google.maps.Map(document.getElementById("map"), {
        zoom: 16,
        center: { lat: centerLat, lng: centerLon },
        gestureHandling: "greedy",
        mapId : 'a234af45bc04ad47'
        });
    var marker = [];
	for (var i = 0; i < trailJson.trailPhotos.length ; i ++){
		latDec[i] = trailJson.trailPhotos[i].latDec;
		lonDec[i] = trailJson.trailPhotos[i].lonDec;
		console.log('latDec'+ i + ': ' + latDec[i]);
		console.log('lonDec'+ i + ': ' + lonDec[i]);
        rt.push({ lat : latDec[i], lng : lonDec[i]});
        marker[i] = new AdvancedMarkerElement({
            map,
            position: { lat: latDec[i], lng: lonDec[i]}
        })
        $('#trail_thumbs').append('<div class="col-md-3"><img src="/fm/resources/upfiles/' + trailJson.trailId + '/' + trailJson.trailPhotos[i].originFileName + '" class="img-thumbnail"></div>')
    }

    console.log(rt.valueOf());
	centerLat = latDec.reduce(function add(sum, currValue) {
		  return sum + currValue;
		}, 0)/latDec.length;
	
	centerLon = lonDec.reduce(function add(sum, currValue) {
		  return sum + currValue;
		}, 0)/lonDec.length;
	const c = centerLat + ',' + centerLon
	console.log(c);

paths = new google.maps.Polyline({ //경로 정보
           path: rt,
           geodesic: true,
           strokeColor: 'blue',
           strokeOpacity: 1.0,
           strokeWeight: 3.0,
           icons : [{ //방향을 알기 위한 화살표 표시
            icon : {path : google.maps.SymbolPath.FORWARD_OPEN_ARROW}
    , offset  : '100%'
    , repeat : '100px'
           }]
     });
  paths.setMap(map);//경로를 그려야 하는 map object를 주면 된다.  
    } else {
        $('#map').css('height','0');
    }
}

if(trailJson.nonTrailPhotos.length > 0 ) {
        for(i = 0; i < trailJson.nonTrailPhotos.length; i++){
            $('#nontrail_thumbs').append('<div class="col-md-3"><img src="/fm/resources/upfiles/' + trailJson.trailId + '/' + trailJson.nonTrailPhotos[i].originFileName + '" class="img-thumbnail"></div>')
        }
    }


</script>
</body>
</html>

