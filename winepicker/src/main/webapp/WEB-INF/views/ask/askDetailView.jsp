<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의사항 상세조회</title>
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

.ask-detail-box {
	overflow-x: auto;
	padding : 20px;
	height : 100%;
}

.ask-menu-title {
	
	width: 98%;
	height : 6%;
    margin : 15px;
    
   	font-family: Noto Serif Gurmukhi;
	font-size: 30px;

}

.ask-detail-container {
	padding : 20px;
	height : 80%;
}

.ask-detail-container>form {
	height : 100%;
}

.ask-detail {
	width: 100%;
	height : 100%;
	border-collapse: collapse;
}

.ask-detail div{
	display: flex;
	margin : 0px 0px 7px 0px;
}

.ask-title {
	height : 10%;
}
.ask-content {
	height : 40%;
}
.ask-detail div div{
	width : 90%;
	box-sizing: border-box;
	border : 0.5px solid rgba(0, 0, 0, 0.5);
	padding-left : 10px;
}

.ask-detail div p{
	width : 100px;
	text-align : center;
	font-size: 18px;
}

.buttons{
	display: flex;
    justify-content: flex-end;
    align-items: center;
	margin-right : 40px;
}
.buttons div{
	margin : 5px;
}
.buttons input[type="button"] {
	padding: 5px 10px;
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}
.response{
	height : 20%;
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
            
           <div class="ask-detail-box">
                <div class="ask-menu-title" onclick="location.href='${contextPath}/ask/askPage'">
                	1:1 문의 내역
                </div>
            <div class="ask-detail-container"> 
                	<form>
                    <div class="ask-detail">
                    	<div class="ask-title">
                            <p>제목</p>
                            <div id="title">${ask.askTitle}</div>
                        </div>
                    	<div class="ask-content">
                            <p>내용</p>
	                        <div id="content">${ask.askContent}</div>
                        </div>
						<c:if test="${ask.originName ne null}">
                        	<div class="ask-upfile">
                        		<p>첨부파일</p>
                        		<div id="upfile" >${ask.originName}</div>
                        	</div>
                        </c:if>
	     				<c:if test="${fn:contains(ask.responseStatus, 'Y')}">
		     				<div class="response">
		     					<p>답변</p>
		     					<div class="response-detail">${ask.responseContent }</div>
		     				</div>
	     				</c:if>
     				
                    </div>
                    <div class="buttons">
     				<c:if test="${fn:contains(ask.responseStatus, 'N')}">
		                <div class="askUpdate">
			                <input type="button" id="updateAsk" value="수정" onclick="updateAskDetail(${ask.askNo})">
		                </div>
	                </c:if>
	                <div class="askDelete">
			                <input type="button" id="deleteAsk" value="삭제" onclick="deleteAskDetail(${ask.askNo})">
	                </div>
	                </div>
                    </form>
                    
	        </div>
	    </div>
		</div>
		</div>
		
	
	<script>
		function deleteAskDetail(ano){
			var bool = confirm("삭제하시겠습니까?");
			
			if(bool){
				location.href="${contextPath}/ask/delete/"+ano;
			}
		}
		function updateAskDetail(ano){
			location.href="${contextPath}/ask/update/"+ano;
		}
	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>