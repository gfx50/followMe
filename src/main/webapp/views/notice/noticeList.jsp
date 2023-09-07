<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.Notice, java.util.ArrayList,admin.model.vo.Admin" %>    
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	int currentLimit = ((Integer)request.getAttribute("limit")).intValue();
	
	int nowpage = 1;
	if(request.getAttribute("currentPage") != null){
		nowpage = ((Integer)request.getAttribute("currentPage")).intValue();
	}
%>    

 <%
	//관리자 로그인했을때    
    Admin admin = (Admin)session.getAttribute("loginAdmin");
    %>

<!DOCTYPE html>
<html>
<%@ include file="../common/head.jsp" %>
<head>
<meta charset="UTF-8">
<title>follow me</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }

        th {
            background-color: #212529;
            color: #fff;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        button {
            background-color: #212529;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        button:hover {
            background-color: #212529;
        }

        a.delete-link {
            color: red;
            text-decoration: none;
            margin-left: 10px;
        }

        a.delete-link:hover {
            text-decoration: underline;
        }
    </style>
<script type="text/javascript" src="/fm/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function showWriteForm(){
	location.href = "/fm/views/notice/noticeWrite.jsp";
}

$(function(){
	var limit = "<%= currentLimit %>";
	document.getElementById("limit").value = limit;
	
	//input 태그의 name 이 item 의 값이 바뀌면(change) 작동되는 이벤트 핸들러 작성
	$('input[name=item]').on('change', function(){
		//여러 개의 태그 중에서 체크표시가 된 태그를 선택
		$('input[name=item]').each(function(index){
			//선택된 radio 순번대로 하나씩 checked 인지 확인함
			if($(this).is(':checked')){
				//체크 표시된 아이템에 대한 폼이 보여지게 처리함
				$('form.sform').eq(index).css('display', 'block');
			}else{
				//체크 표시 안된 아이템의 폼은 안 보이게 처리함
				$('form.sform').eq(index).css('display', 'none');
			}
		});  //each
	});  //on
});  //document ready

function changeLimit(limit){
	//alert(limit);
	location.href = "/fm/nlist?page=1&limit=" + limit;	
}
</script>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<%-- <%@ include file="../admin/adminMenu.jsp" %> --%>

<br>
<br>
<br>
<h1 align="center">공지사항</h1>
<br>
<%-- 게시글 쓰기는 로그인한 회원만 가능함 --%>
<% if(admin != null){ %>
<div style="align:center;text-align:center;">
	<button onclick="showWriteForm();">글쓰기</button>
</div>
<% } %>


<br>

<%-- <%-- 항목별 검색 기능 추가
<fieldset id="ss">
	<legend>검색할 항목을 선택하세요.</legend>
	<input type="radio" name="item" id="title"> 제목 &nbsp;
	<input type="radio" name="item" id="content"> 내용 &nbsp;	
	<input type="radio" name="item" id="date"> 등록날짜 &nbsp;	
	<b style="color:blue;">출력할 목록 갯수를 선택하세요 : </b>
	<select id="limit" onchange="changeLimit(this.value);">		
		<option value="10">10개씩 출력</option>
		<option value="15">15개씩 출력</option>
		<option value="20">20개씩 출력</option>
	</select>	
</fieldset>
<br> --%> 

<%-- <%-- 검색 항목별 값 입력 전송용 폼 만들기
제목 검색 폼
<form id="titleform" class="sform" action="/nsearch" method="post">
	<input type="hidden" name="action" value="title">
	<input type="hidden" name="limit" value="<%= currentLimit %>">	
<fieldset>
	<legend>검색할 제목을 입력하세요.</legend>
	<input type="search" name="keyword" size="50"> &nbsp;
	<input type="submit" value="검색">
</fieldset>
</form> --%> 

<%-- <%-- 작성자 검색 폼
<form id="contentform" class="sform" action="/first/nsearch" method="post">
	<input type="hidden" name="action" value="content">	
	<input type="hidden" name="limit" value="<%= currentLimit %>">
<fieldset>
	<legend>검색할 내용을 입력하세요.</legend>
	<input type="search" name="keyword" size="50"> &nbsp;
	<input type="submit" value="검색">
</fieldset>
</form> --%> 

<%-- <%-- 등록날짜 검색 폼
<form id="dateform" class="sform" action="/first/nsearch" method="post">
	<input type="hidden" name="action" value="date">	
	<input type="hidden" name="limit" value="<%= currentLimit %>">
<fieldset>
	<legend>검색할 등록날짜를 선택하세요.</legend>
	<input type="date" name="begin"> ~ <input type="date" name="end"> &nbsp;
	<input type="submit" value="검색">
</fieldset>
</form> --%> 

 <%-- 조회된 공지사항 목록 출력 --%>
<table align="center" width="600" border="1" cellspacing="0" 
 cellpadding="0">
<tr>
	<th><p>번호</p></th>
	<th><p>제목</p></th>
	<th><p>작성자</p></th>
	<th><p>첨부파일</p></th>
	<th><p>날짜</p></th>
	<th><p>조회수</p></th>
	
</tr>
<% for(Notice n : list){ %>
<tr>
	<td align="right"><%= n.getNoticeId() %></td>
	<td align="right">
	<a href="/fm/ndetail?nnum=<%= n.getNoticeId() %>&page=<%= nowpage %>"  style=" color : #212529; "><%= n.getNoticeTitle() %></a>
	</td>
	<td align="right"><%= n.getAdminEmail()%></td>
	<td align="right"><%= n.getFileName() %></td>
	<td align="center"><%= n.getNoticeDate() %></td>
	<td align="center"><%= n.getNoticeCount() %></td>
</tr>
<% } %> 
</table>
<br> 

<%-- 페이징 처리 뷰 포함 처리 --%>
<%@ include file="../common/pagingView.jsp" %>

<hr>
<%@ include file="../common/footer.jsp" %>

</body>
</html>





