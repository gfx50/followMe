<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"  %>
<%
	Member member = null;
	try{
	if(session.getAttribute("loginMember") != null) {		
	member = (Member)session.getAttribute("loginMember");
	} else {
		pageContext.forward("../member/login.jsp");
	}
	} catch(Exception e) {
		pageContext.forward("../member/login.jsp");
	}
%> 
<%-- <%@ include file="../common/head.jsp" %> --%>
<!DOCTYPE html>
<html lang="kr">
<head>
	
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<title>FollowMe! Trail Sharing SNS</title>
	<link rel="stylesheet" href="/fm/resources/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="/fm/resources/css/bootstrap-icons-1.10.5/font/bootstrap-icons.min.css">
	
	
	<link href="/fm/resources/css/fileinput.css" rel="stylesheet">
	<script src="/fm/resources/js/jquery-3.7.0.min.js"></script>
<script src="/fm/resources/js/fileinput/plugins/buffer.min.js" type="text/javascript"></script>
<script src="/fm/resources/js/fileinput/plugins/filetype.min.js" type="text/javascript"></script>
<script src="/fm/resources/js/fileinput/plugins/piexif.min.js" type="text/javascript"></script>
<script src="/fm/resources/js/fileinput/plugins/sortable.min.js" type="text/javascript"></script>
	<script src="/fm/resources/js/bootstrap.min.js"></script>
	<script src="/fm/resources/js/fileinput/fileinput.js"></script>

	<script src="/fm/resources/js/fileinput/locales/kr.js"></script>

	<link href="/fm/resources/css/fm.css" rel="stylesheet">
	<script src="/fm/resources/js/fm.js"></script>
<script type="text/javascript" src="/fm/resources/js/trailup.js"></script>
</head>
<body>

<!-- 상단 고정 내비게이션 바 -->
<%@ include file="../common/navbar.jsp" %>
<br>
<h1 class="container">파일 업로드</h1>
<form enctype="multipart/form-data" class="container">
<input type="hidden" id="mId" name="mId" value="<%= member.getmId() %>">
<!-- <input id="input-id" type="file" class="file" multiple data-browse-on-zone-click="true" data-preview-file-type="text" data-max-file-count=5 uploadUrl="/fm/tinsert" data-language="kr" data-allowed-fileTypes="['image']" data-allowed-file-extensions="['jpg','jpeg']"> -->
<input id="imgsinput" type="file" multiple data-preview-file-type="text" name="imgs[]" accept="image/*" >
<!-- <input type="hidden" name="json" id="json">  -->
</form>
<form id='tJson' name='tJson'>
<input type="hidden" id='tjinput' name='tjinput'>
</form>
<!-- 자동 방향조정 온오프 체크박스 -->
<!-- <div class="checkbox"> -->
<!--     <label> -->
<!--     <input id="toggleOrient" name="tog" type="checkbox" checked> -->
<!--     Toggle Auto Orientation -->
<!--     </label> -->
<!-- </div> -->
<div id="togStatus" class="hint-block">
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>