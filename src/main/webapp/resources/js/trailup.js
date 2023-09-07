$(document).ready(function() {
	var tId = self.crypto.randomUUID().replace(/-/g,'').toUpperCase();
    var trailJson = {
			trailType:"trail.0.5",
			mapProvider:"Google",
			mId:$("#mId").val(),
			trailId: tId, 
			trailUtc:new Date().toISOString(),
			title:'',
			body:'',
			trailPhotos:[],
			nonTrailPhotos:[]
		};
	
		$("#imgsinput").fileinput({
    	uploadUrl:"/fm/tinsert",
    	allowedFileTypes:['image'],
    	allowedFileExtensions:['jpg','jpeg'],
   		language:"kr",
    	browseOnZoneClick:true,
        dropZoneEnabled: true,
        maxFileCount: 25,
        autoReplace:true,
        inputGroupClass: "input-group-sm",
        autoOrientImage:true,
        uploadAsync:false,
        maxAjaxThreads:2,
        enableResumableUpload: false,
        theme: 'fa5' ,
        uploadExtraData : {
			tId : tId 
		}
         



//        { tj : 'tj' }
        
//        function() {  // callback example
//        	
//			$('#imgsinput').on('filepreajax', function(event, previewId, index) {
//    console.log('File pre ajax triggered');
//    		console.log(trailJson);
//    		return {tj : trailJson};
//    		
//});
//			
//            }

//    }).on('filebatchpreupload', function(event, data) {
//		$('#imgsinput').attr('action','/fm/tinsert?trailJson=' + JSON.stringify(trailJson));
//	}).on('fileuploaded', function(event, previewId, index, fileId) {
//        console.log('File Uploaded', 'ID: ' + fileId + ', Thumb ID: ' + previewId);
    }).on('fileuploaderror', function(event, data, msg) {
        console.log('File Upload Error', 'ID: ' + data.fileId + ', Thumb ID: ' + data.previewId);
    }).on('filebatchuploadcomplete', function(event, preview, config, tags, extraData) {
        console.log('File Batch Uploaded', preview, config, tags, extraData);
    });
    // 자동 방향조정 토글 버튼 작동용 스크립트
//     $("#toggleOrient").on('change', function() {
//         var val = $(this).prop('checked');
//         $("#testinput").fileinput('refresh', {
//             autoOrientImage: val
//         });
//         $('#togStatus').html('Fileinput is reset and <samp>autoOrientImage</samp> is set to <em>' + (val ? 'true' : 'false') + '</em>. Retry by selecting images again.');
//     });

		
// 이미지 파일들 로딩완료 이벤트
    $('#imgsinput').on('fileimagesloaded', function(event, file, previewId, fileId, index, reader) {
//    $('#imgsinput').on('filepreajax', function(event, previewId, index){

        console.log(previewId + ", " + fileId + ", " + index);
        var imgframes = $('#imgsinput').fileinput('getFrames');
        var files = $('#imgsinput').fileinput('getFileList'); 
        console.log("imgframes.length : " + imgframes.length);
		
		var exif = [];

		var trailCount = 0;
		var nonTrailCount = 0;
		
			
        
        for(i = 0; i < imgframes.length; i ++){

        exif[i] = $('#imgsinput').fileinput('getExif',imgframes[i].id);

        if(Object.keys(exif[i].GPS).length > 0) {
//        console.log(exif[i]);

        var position = {
			latDec : 0,
			lonDec : 0,
			altitude: 0,
			originTime:'',
			photoId : 't_' + self.crypto.randomUUID().replace(/-/g,''),
			originFileName:files[i].name
		};
        if(exif[i].GPS[1] === 'N'){
        	var latN = 1;
        } else {
        	var latN = -1;
        };
        if(exif[i].GPS[3] === 'E'){
        	var lonE = 1;
        } else {
        	var lonE = -1;
        };
		
        var latDec = latN * ((exif[i].GPS[2][0][0] / exif[i].GPS[2][0][1] )+ (exif[i].GPS[2][1][0] / exif[i].GPS[2][1][1] / 60) + (exif[i].GPS[2][2][0] / exif[i].GPS[2][2][1] / 3600));

        var lonDec = lonE * ((exif[i].GPS[4][0][0] / exif[i].GPS[4][0][1] )+ (exif[i].GPS[4][1][0] / exif[i].GPS[4][1][1] / 60) + (exif[i].GPS[4][2][0] / exif[i].GPS[4][2][1] / 3600));
        
        altitude = exif[i].GPS[6][0] / exif[i].GPS[6][1]; 
        
        originTime = exif[i].Exif[36867];
        
        position.latDec = latDec;
        position.lonDec = lonDec;
        position.altitude = altitude;
        position.originTime = originTime;
        
        trailJson.trailPhotos[trailCount++] = position;

//        if(exif[i].GPS[1] === 'N'){
//        	latN[i] = 1;
//        } else {
//        	latN[i] = -1;
//        };
//        if(exif[i].GPS[3] === 'E'){
//        	lonE[i] = 1;
//        } else {
//        	lonE[i] = -1;
//        };
//		
//        latDec[i] = latN[i] * ((exif[i].GPS[2][0][0] / exif[i].GPS[2][0][1] )+ (exif[i].GPS[2][1][0] / exif[i].GPS[2][1][1] / 60) + (exif[i].GPS[2][2][0] / exif[i].GPS[2][2][1] / 3600));
//
//        lonDec[i] = lonE[i] * ((exif[i].GPS[4][0][0] / exif[i].GPS[4][0][1] )+ (exif[i].GPS[4][1][0] / exif[i].GPS[4][1][1] / 60) + (exif[i].GPS[4][2][0] / exif[i].GPS[4][2][1] / 3600));
//        
//        altitude[i] = exif[i].GPS[6][0] / exif[i].GPS[6][1]; 
//        
//        originTime[i] = exif[i].Exif[36867];
//        
//        position.latDec = latDec[i];
//        position.lonDec = lonDec[i];
//        position.altitude = altitude[i];
//        position.originTime = originTime[i];
//        
//        trailJson.trailPhotos[trailCount++] = position;
//        console.log("lat: " + latDec[i] + " , lon: " + lonDec[i] + ", altitude: " + altitude[i]);
//        console.log("latDec : " + latDec + "\nlonDec : " + lonDec + ", altitude: " + altitude + "\noriginTime : " + originTime);
        } else {
			noExif = {
				photoId : 'n_' + self.crypto.randomUUID().replace(/-/g,''),
				originFileName:files[i].name,
				originTime:files[i].lastModifiedDate.toLocaleString()
			};
			
			trailJson.nonTrailPhotos[nonTrailCount++] = noExif;
			
		} 
        }// for end
//        let trailId = self.crypto.randomUUID();
//		console.log('trailId : ' + trailId.replace(/-/g,''));
//		let mId = $("#mId").val();
//		console.log('mId : ' + mId);
		console.log(trailJson);
// 		$('#json').data("json",trailJson);
 		//console.log(finput);
// 		$('#json').val(trailJson);
// 		for(i in finput){
// 		console.log(finput[i])};


//        { tj : 'tj' }
        
//        function() {  // callback example
//        	
//			$('#imgsinput').on('filepreajax', function(event, previewId, index) {
//    console.log('File pre ajax triggered');
//    		console.log(trailJson);
//    		return {tj : trailJson};
//    		
//});
//			
//            }
	$.ajax({
        type: "post",
        url : "http://localhost:8080/fm/tinsert",
        contentType: "application/json; charset=utf-8",
        ///보낼 데이터를 JSON.stringify()로 감싸주어야 함
        data : JSON.stringify(trailJson),
        success : function (data){
        	console.log(data);
        },
        error : function(e){
        }
	}); // ajax trailJson 전송

//	$('imgsinput').on('filelock', function(event, filestack, extraData) {
    //});// filelock
//    $('#imgsinput').fileinput('lock');
    //$('#imgsinput').fileinput('upload').fileinput('disable');
    $('#imgsinput').fileinput('upload').fileinput('clear');
    setTimeout(function(){window.location.href = '/fm/teditbody?trailId=' + tId}, 100);
	}); // 위도경도고도 사진찍힌 시간 추출

}); // document ready