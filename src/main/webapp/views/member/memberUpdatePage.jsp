<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member member = (Member)request.getAttribute("member");
%>

<!DOCTYPE html>
<html lang="kr">
<head>
	<link rel="apple-touch-icon" sizes="180x180" href="/fm/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/fm/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/fm/favicon-16x16.png">
	<link rel="manifest" href="/fm/site.webmanifest">
	
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
	<script type="text/javascript" src="/fm/resources/js/profilepic.js"></script>
<style>
.kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {
    margin: 0;
    padding: 0;
    border: none;
    box-shadow: none;
    text-align: center;
}
.kv-avatar {
    display: inline-block;
}
.kv-avatar .file-input {
    display: table-cell;
    width: 213px;
}
.kv-reqd {
    color: red;
    font-family: monospace;
    font-weight: normal;
}
.dn {
            display: none; /* 요소 숨김 */
}
</style>
</head>
<body>
<script type="text/javascript">
function dupEmailCheck(){
	$.ajax({
		url: "/fm/dupemail",
		type: "post",
		data: { email: $('#email').val() },
		success: function(data){
			console.log("success : " + data);
			if(data == "ok"){
				var hiddenDiv = document.querySelector('.hidden-toast2');
				if (hiddenDiv !== null) {
					hiddenDiv.style.display = 'block';
				}
			}else{
				var hiddenDiv = document.querySelector('.hidden-toast');
				if (hiddenDiv !== null) {
					hiddenDiv.style.display = 'block';
				}
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
	return false; 
}
function displayToast() {
	var exitDiv = document.querySelector('.hidden-toast');
	if (exitDiv !== null) {
		exitDiv.style.display = 'none';
	}
}
function displayToast2() {
	var exitDiv = document.querySelector('.hidden-toast2');
	if (exitDiv !== null) {
		exitDiv.style.display = 'none';
	}
}
function randomHangulName() {
	  const 형용사 = [
	    "화가난 ", "웃는 ", "화끈한 ", "매끈한 ", "조용한 ", "예쁜 ", "더러운 ", "망할 ", "새로운 ", "화끈한 ",
	    "새로운 ", "시끄러운 ", "늙은 ", "구운 ", "차가운 ", "놀라운 ", "신박한 ", "기발한 ", "기존의 ", "날것의 ",
	    "감동적인 ", "감격의 ", "치사한 ", "놀라운 ", "잘생긴 ", "귀여운 ", "멀쩡한 ", "이상한 ", "배부른 ", "배고픈 ",
	    "지루한 ", "루즈한 ", "망한 ", "실패한 ", "사라진 ", "실종된 ", "나타난 "
	  ];
	  const 명사 = [
	    "강아지", "장동건", "개", "소", "말", "뱀", "개구리", "돼지", "도야지", "근", "도마뱀", "코끼리", "거미",
	    "지렁이", "프로틴", "물병", "아이폰", "공주", "왕자", "거지", "노숙자", "오리", "거위", "똥", "대머리", "라신",
	    "라이즈", "카타리나", "개미", "말벌", "탈모인", "서퍼", "판사", "의사", "개발자", "이혼남", "이혼녀", "쿼카",
	    "호랑이", "사자", "기린", "티라노", "감스트", "아빠", "엄마", "새", "독수리", "참새", "거위"
	  ];

	  const randomIndex = (array) => Math.floor(Math.random() * array.length);
	  const random형용사 = 형용사[randomIndex(형용사)];
	  const random명사 = 명사[randomIndex(명사)];

	  return random형용사 + random명사;
}
function randomnick(){
	const nicknameInput = document.querySelector('input[name="nickname"]');
	  const randomNickname = randomHangulName();
	  nicknameInput.value = randomNickname;
}
</script>
<%@ include file="../common/navbar.jsp" %>
<br><br>
<h1 align="center"><%= member.getmName() %>님의 회원 정보 수정 페이지</h1>
<br><br><br>


 <form class="form form-vertical" action="/fm/mupdate" method="post" enctype="multipart/form-data">
    <div class="row">
        <div class="col-sm-6 text-center">
            <div class="kv-avatar">
                <div class="file-loading">
                    <input id="avatar-1" name="profilepic" type="file">
                </div>
            </div>
            <div class="kv-avatar-hint">
                <small>최대파일 사이즈 1.5MB</small>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group2">
                        <label for="email">이메일<span class="kv-reqd">*</span></label>
						<input type="email" class="form-control2" id="email" name="email" value="<%= member.getEmail() %>" style="width:300px;">
						<input type="button" class="btn btn-outline-dark" value="중복체크" onclick="dupEmailCheck();" style="font-size:12px; margin-top: 10px;">
                        <br><br>
						<label for="pwd">새 비밀번호<span class="kv-reqd">*</span></label>
                        <input type="password" class="form-control" name="pwd" id="pwd" value="<%=member.getPwd() %>" placeholder="*************">
                        <label for="pwd">비밀번호 확인<span class="kv-reqd">*</span></label>
                        <input type="password" class="form-control" id="pwd2" placeholder="*************" >
						<span id="pass_true" class="dn" style="color: green;">비밀번호가 일치합니다.</span>
    					<span id="pass_false" class="dn" style="color: red;">비밀번호가 불일치합니다. 재작성해주세요.</span></td></tr>
						
						<br>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group2">
						<br>
						<label for="fname">닉네임</label>
                        <div style="display: flex; align-items: center;">
						  
						  <input type="text" class="form-control" name="nickname" value="<%= member.getNickName() %>" style="width:276px;">
						  <button type="button" class="btn btn-primary button-side" id="randomButton" onclick="randomnick();">랜덤</button>
						</div>
                        <label for="lname">이름</label>
                        <input type="text" class="form-control" name="mname" value="<%= member.getmName() %>">
                        <label for="lname">전화번호</label>
                        <input type="phone" class="form-control" name="phone" value="<%= member.getPhone() %>">
                    </div>
                <hr>
                </div>
               <div class="form-group">
                <div class="text-right">
                    <button type="submit" class="btn btn-primary">회원정보수정</button>
                </div>
				</div>
            </div>
        </div>
    </div>
</form>
<div class="hidden-toast"
	style="margin: 0 auto; width: 80%; display: none; position: fixed; top: 30%; left: 30%;z-index:9;">
	<div class="toast fade show " role="alert" aria-live="assertive"
		aria-atomic="true"
		style="width: 500px; height: 100px;">
		<div class="toast-header">
			<svg class="bd-placeholder-img rounded me-2" width="20"
				height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
				preserveAspectRatio="xMidYMid slice" focusable="false">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-square" viewBox="0 0 16 16">
				  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
				  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
				</svg></svg>

			<strong class="me-auto">경고</strong> <small
				class="text-muted"></small>
			<button type="button" class="btn-close" onclick="displayToast()"></button>
		</div>
		<div class="toast-body" style="color: black; text-align: left;">
		   이미 사용중인 이메일입니다.
		</div>
	</div>
</div>
<div class="hidden-toast2"
	style="margin: 0 auto; width: 80%; display: none; position: fixed; top: 30%; left: 30%;z-index:9;">
	<div class="toast fade show " role="alert" aria-live="assertive"
		aria-atomic="true"
		style="width: 500px; height: 100px;">
		<div class="toast-header">
			<svg class="bd-placeholder-img rounded me-2" width="20"
				height="20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
				preserveAspectRatio="xMidYMid slice" focusable="false">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right" viewBox="0 0 16 16">
				  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
				</svg></svg>

			<strong class="me-auto">알림</strong> <small
				class="text-muted"></small>
			<button type="button" class="btn-close" onclick="displayToast2()"></button>
		</div>
		<div class="toast-body" style="color: black; text-align: left;">
		   사용가능한 아이디 입니다.
		</div>
	</div>
</div>
<div id="kv-avatar-errors-1" class="text-center" style="display:none"></div>

<!-- the fileinput plugin initialization -->
<script>
$("#avatar-1").fileinput({
    overwriteInitial: true,
    maxFileSize: 1500,
    showClose: false,
    showCaption: false,
    browseLabel: '이미지선택',
    browseIcon: '<i class="bi-folder2-open"></i>',
    removeTitle: 'Cancel or reset changes',
    elErrorContainer: '#kv-avatar-errors-1',
    msgErrorClass: 'alert alert-block alert-danger',
    initialPreview: ["<%= member.getProfilePic()!=null?"/fm/resources/images/"+member.getProfilePic():"/fm/resources/images/user.png" %>"],
	initialPreviewAsData: true,
	initialPreviewConfig: [
	{caption: "프로필사진", downloadUrl:'', description: "유저프로필사진", size: 930321, width: "240px", key: 1},
	],
    layoutTemplates: {main2: '{preview} ' + '{browse}'},
    allowedFileExtensions: ["jpg", "png", "gif"]
});
</script>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $("#pwd, #pwd2").on("change", function() {
            $('#pass_false').addClass('dn');
            $('#pass_true').addClass('dn');
            var password = $('#pwd').val();
            var passwordCheck = $('#pwd2').val();
            if (password === passwordCheck) {
                $('#pass_true').removeClass('dn');
            } else {
                $('#pass_false').removeClass('dn');
            }
        });
    </script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>