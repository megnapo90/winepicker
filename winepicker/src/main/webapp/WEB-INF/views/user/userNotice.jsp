<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지사항</title>

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

.call-center-menu .user-notice{
	opacity: 1;
	background: #5E5E5E;
	font-family: Noto Serif Gurmukhi;
	font-size: 20px;
	font-weight: normal;
	line-height: normal;
	letter-spacing: 0.1em;
	color: #FFFFFF;	
}

.user-notice-box {
	overflow-x: auto;
	padding : 15px;
}
.user-notice-title {
	
	width: 98%;
	height : 6%;
    margin : auto;
    
   	font-family: Noto Serif Gurmukhi;
	font-size: 30px;
	
	
	border-width: 0px 0px 0.5px 0px;
	border-style: solid;
	border-color: rgba(0, 0, 0, 0.5);
	
}
.user-notice-content{
	
	box-sizing: border-box;
}

.user-notice-content *{
	margin : 15px;
	
	font-weight: normal;
	line-height: normal;
	letter-spacing: 0.1em;
}

#title{
	width: 200px;
	height: 30px;
	font-size: 20px;
}
#content{
	height: 250px;
	padding : 20px;
	
	overflow: auto;
	
	font-size: 15px;
	
	opacity: 1;
	background: rgba(6, 5, 5, 0.04);
	border: 0px solid rgba(0, 0, 0, 0.5);
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/userCommon.jsp"/>

	<div class="page-name">
		고객 센터
		
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
			<div class="user-notice-box">
				<div class="user-notice-title">
					<p>이용약관 및 개인정보처리 방침</p>
				</div>
				<div class="user-notice-content">
					<div class="1">
						<span id="title">이용약관</span>
						<div id="content">이용약관</div>
					</div>
					<div class="2">
						<span id="title">개인 정보처리 방침</span>
						<div id="content">개인 정보처리 방침</div>
					</div>
				</div>
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

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>