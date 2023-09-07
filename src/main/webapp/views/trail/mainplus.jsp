<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList, trail.model.vo.Trail"%>
<%
    Member member = (Member) session.getAttribute("loginMember");
    ArrayList<Trail> list = (ArrayList<Trail>) request.getAttribute("list");
%>

<%@ include file="../common/head.jsp" %>
<body>
    <div class="container">

        <!-- 상단 고정 내비게이션 바 -->
        <%@ include file="../common/navbar.jsp" %>
        <h1>메인페이지</h1>
        <div class="row justify-content-center"> <!-- 중앙 정렬을 위한 부분 -->
            <% for (Trail t : list) { %>
            <div class="col-md-6 col-lg-4"> <!-- 카드를 반응형으로 2열로 나열 -->
                <div class="card">
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
            </div>
            <% } %>
        </div>
        <br>
    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>
