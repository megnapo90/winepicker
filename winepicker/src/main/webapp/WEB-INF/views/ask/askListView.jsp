<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의사항</title>

<style>
.callcenter {
	height : 100%;
	margin: 0;
	padding: 20px;
}

.callcenter .call-center-menu {
	
	width: 98%;
	height : 6%;
    margin : auto;
    margin-bottom : 10px;
    display: flex;
    align-items: center;
}

.call-center-menu div{
	font-style: italic;
	font-size: 20px;
	font-weight: 400;
	
	text-align: center;

	background: #D0D0D0;
	width : 22%;
	height : 100%;
	margin : auto;
	
}

.call-center-menu div p{
	margin-top : 7px;
}

#blank{
	background: white;
}

.call-center-menu .ask{
	opacity: 1;
	background: #5E5E5E;
	font-family: Noto Serif Gurmukhi;
	font-size: 25px;
	font-weight: normal;
	line-height: normal;
	letter-spacing: 0.1em;
	color: #FFFFFF;	
}

.ask-list-box {
	overflow-x: auto;
	padding : 20px;
}

.ask-menu-title {
	
	width: 98%;
	height : 6%;
    margin : 15px;
    
   	font-family: Noto Serif Gurmukhi;
	font-size: 30px;

}

.ask-list-container {
	padding : 20px;
}

.ask-list {
	width: 100%;
	border-collapse: collapse;
}

.ask-list tr{
	height: 90px;
	
	font-size : 20px;
	font-weight : 200;
	text-align: center;
	
	box-sizing: border-box;
	border-width: 0px 0px 0.5px 0px;
	border-style: solid;
	border-color: rgba(0, 0, 0, 0.5);
}

.ask-list tr:nth-of-type(1){
	height: 60px;
}

.ask-list th, .ask-list td {
	margin : auto;
	padding: 10px;
	text-align: center;
}

.ask-list th {
	width : 10%;
}
.ask-list td {
}

.ask-list td p {
	margin: 0;
}

.empty-ask-list {
	text-align: center;
	padding: 20px;
	color: #888;

}
.empty-ask-list>p{
	padding-top : 15%;
	text-align : center;
	font-size : 20px;
	font-weight : 10px;
}

.ask-insert-button{
	margin-right : 40px;
	margin-top : 10px;
	display: flex;
    justify-content: flex-end;
    align-items: center;
}
.ask-insert-button input[type="button"] {
	padding: 5px 10px;
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}


</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/userCommon.jsp"/>


	<div class="page-name" onclick=showFaq()>	
		고객센터
	</div>
	<div class="content">
		<div class="callcenter">
			<div class="call-center-menu">
				<div class="faq" onclick=showFaq()>
		        	<p>FAQ</p>        
	            </div>
	            <div class="ask" onclick="location.href='${contextPath}/ask/askPage'">
	            	<p>1:1문의</p>     	
	            </div>
	            <div id="blank"></div>
	            <div class="user-notice" onclick=showNotice()>
					<p>이용약관 및 개인정보처리 방침</p>
				</div>
			</div>        
                      
            <div class="ask-list-box">
                <div class="ask-menu-title" onclick="location.href='${contextPath}/ask/askPage'">
                	1:1 문의내역
                </div>
				<c:choose>
					<c:when test="${empty askList}">
						<div class="empty-ask-list">
							<p>작성하신 문의글이 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
							<div class="ask-list-container">

								<table class="ask-list">
									<tr>
										<th><p>No.</p></th>
										<th><p>제목</p></th>
										<th><p>작성일자</p></th>
										<th><p>답변상태</p></th>
									</tr>
									
									<c:forEach var="ask" items="${askList}">
									<tr onclick="movePage(${ask.askNo})">
										<th><p>${ask.askNo}</p></th>
										<th><p>${ask.askTitle}</p></th>
										<th><p>${ask.modifyDate}</p></th>
										<th><c:choose>
												<c:when test="${fn:contains(ask.responseStatus, 'N')}">
													<p>답변대기</p>
												</c:when>
												<c:otherwise>
													<p>답변완료</p>
												</c:otherwise>
											</c:choose></th>
									</tr>
									</c:forEach>
								</table>
							</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="ask-insert-button">
				<input type="button" value="작성하기" onclick="location.href='${contextPath}/ask/askInsert'">
			</div>
		</div>
	</div>                

<script>
	
	function showFaq(){
		location.href="${contextPath}/user/callCenter"
	}
	
	function showNotice(){
		location.href="${contextPath}/user/userNotice"
	}
	
	function movePage(ano){
		location.href="${contextPath}/ask/detail/"+ano
	}

</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>