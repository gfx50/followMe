<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../common/head.jsp" %> --%>
<!DOCTYPE html>
<html lang="kr">
<head>
	
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<title>FollowMe! Trail Sharing SNS</title>
	<link rel="stylesheet" href="/fm/resources/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.min.css" crossorigin="anonymous">
	
	
	<link href="/fm/resources/css/fm.css" rel="stylesheet">
	<script src="/fm/resources/js/fm.js"></script>
	<link href="/fm/resources/css/fileinput.css" rel="stylesheet">
	<script src="/fm/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/js/plugins/buffer.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/js/plugins/filetype.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/js/plugins/piexif.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/js/plugins/sortable.min.js" type="text/javascript"></script>
	<script src="/fm/resources/js/bootstrap.min.js"></script>
	<script src="/fm/resources/js/fileinput/fileinput.js"></script>

	<script src="/fm/resources/js/fileinput/locales/kr.js"></script>
</head>
<body>

<!-- 상단 고정 내비게이션 바 -->
<%@ include file="../common/navbar.jsp" %>
<br>
<h1 class="container">파일 업로드</h1>
<form enctype="multipart/form-data">
<!-- <input id="input-id" type="file" class="file" multiple data-browse-on-zone-click="true" data-preview-file-type="text" data-max-file-count=5 uploadUrl="/fm/tinsert" data-language="kr" data-allowed-fileTypes="['image']" data-allowed-file-extensions="['jpg','jpeg']"> -->
<input id="testinput" type="file" multiple data-preview-file-type="text" maxFileCount=5 uploadUrl="/fm/tinsert">
</form>
<div class="checkbox">
    <label>
    <input id="toggleOrient" name="tog" type="checkbox" checked>
    Toggle Auto Orientation
    </label>
</div>
<div id="togStatus" class="hint-block">
</div>
<%@ include file="../common/footer.jsp" %>
<script>
$(document).ready(function() {
    $("#testinput").fileinput({
    	allowedFileTypes:['image'],
    	allowedFileExtensions:['jpg','jpeg'],
    	language:"kr",
    	browseOnZoneClick:true,
        dropZoneEnabled: true,
        maxFileCount: 5,
        autoReplace:true,
        inputGroupClass: "input-group-sm",
        autoOrientImage:true
    });
    $("#toggleOrient").on('change', function() {
        var val = $(this).prop('checked');
        $("#testinput").fileinput('refresh', {
            autoOrientImage: val
        });
        $('#togStatus').html('Fileinput is reset and <samp>autoOrientImage</samp> is set to <em>' + (val ? 'true' : 'false') + '</em>. Retry by selecting images again.');
    });
});

</script>
</body>
</html>