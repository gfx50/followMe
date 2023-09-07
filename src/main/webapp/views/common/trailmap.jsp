<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

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

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap" defer></script>

<script type="text/javascript">

async function initMap(){
    var map;
    if(trailJson.trailPhotos.length > 0) {
	var latDec = [];
	var lonDec = [];
    var centerLat = trailJson.trailPhotos[0].latDec;
    var centerLon = trailJson.trailPhotos[0].lonDec;
    console.log(Number(trailJson.trailPhotos[0].latDec));
    console.log(124 + (11 / 60));
    if(Number(trailJson.trailPhotos[0].latDec) >= (33 + (6 / 60)) && 
        Number(trailJson.trailPhotos[0].latDec) <= (43) && 
        Number(trailJson.trailPhotos[0].lonDec) >= (124 + (11 / 60)) && 
        Number(trailJson.trailPhotos[0].lonDec) <= (131 + (52 / 60)) ){ // 첫번째 사진이 한국이면
    var rt = [];
    const { AdvancedMarkerElement, PinElement} = await google.maps.importLibrary("marker");
    var map = new google.maps.Map(document.getElementById("map"), {
        zoom: 18,
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
        var path = '/fm/resources/upfiles/' + trailJson.trailId + '/' + trailJson.trailPhotos[i].originFileName;
        var thumb_path = '/fm/resources/upfiles/' + trailJson.trailId + '/' + 'thumb_' + trailJson.trailPhotos[i].originFileName;
        var trailId = trailJson.trailId;
        $('#trail_thumbs').append('<div class="col-md-3"><a onclick="openModalm' + trailId + '(' + i + ')"><img src="'+ thumb_path +'" class="img-thumbnail"></a></div>');
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
       } else { // 한국이 아니면 directions 서비스 호출
            var rt = {travelMode: google.maps.TravelMode.WALKING,
            waypoints :[]
            };
            for (var i = 0; i < trailJson.trailPhotos.length ; i ++){
                latDec[i] = trailJson.trailPhotos[i].latDec;
                lonDec[i] = trailJson.trailPhotos[i].lonDec;
                console.log('latDec'+ i + ': ' + latDec[i]);
                console.log('lonDec'+ i + ': ' + lonDec[i]);

                if(i == 0){
                    rt.origin = new google.maps.LatLng(latDec[i], lonDec[i]);
                } else if (i == trailJson.trailPhotos.length - 1){
                    rt.destination = new google.maps.LatLng(latDec[i], lonDec[i]);
                } else {
                    rt.waypoints.push({location : new google.maps.LatLng(latDec[i], lonDec[i])});
                }
                $('#trail_thumbs').append('<div class="col-md-3"><img src="/fm/resources/upfiles/' + trailJson.trailId + '/' + trailJson.trailPhotos[i].originFileName + '" class="img-thumbnail"></div>');
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

            var directionsService = new google.maps.DirectionsService();
            var directionsRenderer = new google.maps.DirectionsRenderer();
            var map = new google.maps.Map(document.getElementById("map"), {
                zoom: 14,
                gestureHandling: "greedy",
                center: { lat: centerLat, lng: centerLon }
                });

            directionsRenderer.setMap(map);
            directionsService
            .route(rt)
            .then((response) => {
            directionsRenderer.setDirections(response);
            console.log(response);
            })
            .catch((e) => window.alert("Directions request failed due to " + status));
       }
    } else { // 경로 정보 있는 사진이 없으면
        $('#map').css('display','none');
    	$('#trail_thumbs').css('display','none');	
    }

 
        
}


if(trailJson.nonTrailPhotos.length > 0 ) {
        for(i = 0; i < trailJson.nonTrailPhotos.length; i++){
            var path = '/fm/resources/upfiles/' + trailJson.trailId + '/' + trailJson.nonTrailPhotos[i].originFileName;
            var thumb_path = '/fm/resources/upfiles/' + trailJson.trailId + '/' + 'thumb_' + trailJson.nonTrailPhotos[i].originFileName;
            var trailId = trailJson.trailId;
            $('#nontrail_thumbs').append('<div class="col-md-3"><a onclick="openModalm' + trailId + '(' + i + ')"><img src="'+ thumb_path +'" class="img-thumbnail"></a></div>');
        }
    } else {
    	$('#nontrail_thumbs').css('display','none');
    }

</script>    