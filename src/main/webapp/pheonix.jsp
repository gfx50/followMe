<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="views/common/head.jsp" %>
<!-- <head> 윗 부분은 head.jsp에서 일괄 관리합니다.
개발용 임시 <style> <script> 는 아래 </head> 위에 작성해 주세요 -->
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
    setTimeout(function () {
        document.querySelector(".overlay").style.display = "none";
    }, 2400); // 0.4초 멈춤 후 사라지도록 설정
});
</script>
<style>
body {
    margin: 0;
    overflow: hidden;
}

.overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    animation: fadeInOut 2s ease-in-out;
    animation-fill-mode: forwards;
    opacity: 0;
}

.animation {
    animation: moveImage 2s ease-in-out 0.4s;
    animation-fill-mode: forwards;
    opacity: 0;
}

img {
    max-width: 100%;
    height: auto;
}

.content {
    position: relative;
    z-index: 1;
    text-align: center;
    padding: 20px;
}

@keyframes moveImage {
    0% {
        transform: translateX(-100%);
        opacity: 0;
    }
    50% {
        transform: translateX(0);
        opacity: 1;
    }
    100% {
        transform: translateX(100%);
        opacity: 0;
    }
}

@keyframes fadeInOut {
    0% {
        opacity: 0;
    }
    50% {
        opacity: 1;
    }
    100% {
        opacity: 0;
    }
}
h1{
	font-weight: bold;
	margin-bottom: 50px;
}
p{
	font-weight: bold;
	margin-bottom: 15px;
}
</style>
</head>
<body>
<%@ include file="views/common/navbar.jsp" %>
  <div class="overlay">
        <div class="animation">
            <img src="/fm/resources/img/main-logo-black.png" alt="/fm/resources/img/main-logo-black.png">
        </div>
    </div>
    <div class="content">
        <!-- 기존 화면 내용 -->
        <h1>#team.pheonix</h1>
        <p>안태환 : tatha000@naver.com</p>
        <p>김지혁 : kimjihyuk_@naver.com</p>
        <p>오상민 : dhtkdals1525@naver.com</p>
        <p>이승용 : cook154112@gamil.com</p>
        <p>김태현 : qlqlcmrl@naver.com</p>
        <br><br><br>
        <div class="container">
		
		<p>"팀 Pheonix는 웹 프로젝트를 기획부터 완성까지 손꼽히는 팀 중 하나입니다. 우리 팀은 창의적인 웹 디자인과 철저한 개발 역량을 가지고 있으며, 다양한 프로젝트를 성공적으로 완료한 경험이 있습니다. 우리의 목표는 사용자 친화적이고 혁신적인 웹 애플리케이션을 개발하여 고객의 기대를 능가하는 것입니다. Pheonix 팀은 항상 최신 웹 기술과 트렌드를 습득하고 적용하여 프로젝트를 빠르고 효율적으로 진행합니다. 우리와 함께하면 뛰어난 웹 솔루션을 경험할 것이며, 당신의 아이디어를 현실로 만들어 드릴 것입니다."</p>
    	</div>
    </div>
    <script src="script.js"></script>

<%@ include file="views/common/footer.jsp" %>
</body>
</html>