<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
/* ============================ 민욱 시작 ============================ */
body {
    font-family: "Oranienbaum", sans-serif;
}

.var {
    width: 212px;
    height: 1062px;
    overflow: hidden;
    background: linear-gradient(0deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0.2) 100%), linear-gradient(180deg, rgba(238, 204, 204, 1) 15%, rgba(255, 255, 255, 0) 100%);
    padding: 20px;
}

ul {
    padding: 0;
    list-style-type: none;
}

li {
    margin-bottom: 10px;
}

div.user, div.text, div.popup, div.service, div.review {
    font-size: 18px;
    font-weight: bold;
    margin-top: 10px;
    margin-bottom: 5px;
}

a {
    text-decoration: none;
    color: #000000;
    font-size: 16px;
    display: block;
    padding: 2px 0;
}

a:hover {
    color: #ff0000;
}
/* ============================ 민욱 끝 ============================ */
</style>

</head>
<body>


<!-- ======================= 민욱 시작 ======================= -->

<div id="list">
    <ul class="ul">
        <li class="user">
        	회원 관리
            <ul>
                <li><a href="<c:url value='/admin/userList'/>">회원 조회</a></li>
            </ul>
        </li>
        
        <li class="text">
            상품 관리
            <ul>
                <li><a href="<c:url value='/admin/enrollWine'/>">상품 등록</a></li>
                <li><a href="<c:url value='/admin/wineList'/>">상품 관리</a></li>
            </ul>
        </li>
        
        <li class="text">
            정보글 관리
            <ul>
                <li><a href="<c:url value='/admin/info/main'/>">정보글 수정</a></li>
            </ul>
        </li>
        
        <li class="popup">
            팝업 관리
            <ul>
                <li><a href="<c:url value='/admin/popupList'/>">팝업 관리</a></li>
            </ul>
        </li>
        
        <li class="service">
            고객센터 관리
            <ul>
                <li><a href="${contextPath}/admin/notice">공지 사항</a>
                <li><a href="${contextPath}/admin/noticeEnroll">공지 등록</a>
                <li><a href="<c:url value='/admin/askList'/>">1:1 문의</a></li>
                <li><a href="<c:url value='/admin/faqList'/>">FAQ</a></li>
                <li><a href="<c:url value='/admin/terms'/>">이용약관, <br>개인정보 처리방침</a></li>
            </ul>
        </li>
        
        <li class="review">
            리뷰 관리
            <ul>
                <li><a href="<c:url value='/admin/review'/>">리뷰 조회</a></li>
            </ul>
        </li>
    </ul>
</div>
<!-- ======================= 민욱 끝 ======================= -->


	<script>
		function updateWine(no){
			console.log(no);
			location.href = "${contextPath}/admin/updateWine/"+no;
		}
	</script>




</body>
</html>