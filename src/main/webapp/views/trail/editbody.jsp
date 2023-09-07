<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, trail.model.vo.Trail, thread.model.vo.Thread"%>
<%
    Member member = (Member)session.getAttribute("loginMember");
	System.out.println("editbody.jsp : " + member);
    Trail trail = (Trail)request.getAttribute("trail");
    System.out.println("editbody.jsp : " + trail);
    
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

        <h1>Trail 내용 수정</h1>
        <br>
<div class="card mb-4"> <!-- 카드 간 간격 조절 -->
                     
    <%@ include file="../common/trailmap.jsp" %>
    <div class="card-body">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="title" placeholder="제목">
            <label for="title">제목</label>
        </div>
        <div class="input-group mb-3 min-vh-50">
        	<span class="input-group-text">본문</span>
          <textarea class="form-control" aria-label="본문" id="body"></textarea>
        </div>
        <div class="row">
        	
        <div class="form-floating mb-3 col">
          <input type="text" class="form-control" id="tags" placeholder="#해쉬태그#입력">
          <label for="tags">#해쉬태그#입력</label>
        </div>
        <div class="row">
        <div class="col">
        <button class="btn btn-primary col" onclick="insertbody();return false;">등록</button>
        <a href="/fm/tdelete?trailId=<%= trail.getTrailId() %>" class="btn btn-primary">삭제</a>
        </div>
        <div class="col">
        <select id="range" class="form-select col-md-1" aria-label="공개범위">
            <option value="" selected>공개범위 선택</option>
            <option value="P">나만 보기</option>
            <option value="F">팔로워에게만 공개</option>
            <option value="A">전체 공개</option>
          </select>
         </div>
         <button class="btn btn-primary col-md-1" onclick="updateRange();return false;">수정</button>
    </div>


    </div>
</div>
    <%@ include file="../common/footer.jsp"%>

<script type="text/javascript">
function insertbody(){
	trailJson.title = $('#title').val();
	console.log(trailJson.title);
	trailJson.body = $('#body').val();
	console.log(trailJson.body);
	trailJson.tags = $('#tags').val();
	console.log(trailJson);
	tjson = JSON.stringify(trailJson);
	$.ajax({
		type:"POST",
		url:"/fm/createtag",
		data:{ tagname: trailJson.tags,
			trailid : trailJson.trailId},
		async: false,
		success:function(res){
			console.log(res);
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			console.log("태그 등록 실패");
		}
	});
	$.ajax({
		type:"POST",
		url:"/fm/tupdate",
		data:{trailJson : tjson,
			trailId : trailJson.trailId},
		async : false,
		success:function(res){
			location.href = "/fm/tdetail?trailId=" + trailJson.trailId;
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert("통신실패")
		}
	});
}

function updateRange(){
	console.log($('#range').val());
	var range = $('#range').val();
	var trailId = trailJson.trailId;
	$.ajax({
        type: "POST",
        url: "/fm/tuprange",
        dataType: "text",
        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
        data: {
        	trailId : trailId,
        	range: range,
        },
        error: function() {
          console.log('통신실패!!');
        },
        success: function(data) {
          console.log("통신데이터 값 : " + data);
        }
       });
}

$(function(){
	$('#title').val(trailJson.title);
	$('#body').val(trailJson.body);
	$('#tags').val(trailJson.tags);
});

</script>
</body>
</html>

