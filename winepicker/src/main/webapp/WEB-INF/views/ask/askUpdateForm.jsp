<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의사항 수정</title>
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

.ask-update-box {
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

.ask-update-container {
	padding : 20px;
}

.ask-update {
	width: 100%;
	border-collapse: collapse;
}

.ask-update div{
	display: flex;
	margin : 0px 0px 10px 0px;
}

#title{
	width : 90%;
}
#content{
	width : 90%;
}
#upfile{
	width : 90%;
}

.ask-update div p{
	width : 100px;
	text-align : center;
	font-size: 18px;
}

.ask-update div div{
	padding-left : 10px;
	box-sizing: border-box;
	border : 0.5px solid rgba(0, 0, 0, 0.5);
	padding-left : 10px;
}



.ask-update-button{
	margin-right : 40px;
	margin-top : 10px;
	display: flex;
    justify-content: flex-end;
    align-items: center;
}
.ask-update-button input[type="submit"] {
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
                      
            <div class="ask-update-box">
                <div class="ask-menu-title" onclick="location.href='${contextPath}/ask/askPage'">
                	1:1 문의작성
                </div>
            <div class="ask-update-container"> 
	
                <div class="ask-update-form">
                	<form action="${contextPath}/ask/update/${askNo}" id="updateForm" method="post" enctype="multipart/form-data">
                    <div class="ask-update">
                        <div class="ask-title">
                            <p>제목</p>
                            <input type="text" id="title" class="frame-41" name="askTitle" value="${ask.askTitle }" required>
                        </div>
                        <div class="ask-content">
                            <p>내용</p>
	                        <textarea class="frame-42" id="content" name="askContent" rows="10" cols="50" required>${ask.askContent}</textarea>
                        </div>
                        <div class="ask-upfile">
                            <p>첨부파일</p>
                        	<span class="update-file" >
                        		<input type="file" id="upfile" class="frame-43" name="upfile" >
                        		<span id="origin-name">${ask.originName}</span>
                        		<span class="delete-img" data-name="${ask.changeName}">&times;</span>
                        	</span>
                        </div>
                    </div>
     				<input type="hidden" id="delete-img-name" value="" name="deleteImageName">
	                <div class="ask-update-button">
		                <input type="submit" id="formSubmit" value="수정">
	                </div>
                    </form>
            	</div>
        </div>
    </div>
	</div>
	</div>

	<script>
		$(function(){
			
			var $deleteImage = $(".delete-img");
			var $deleteImageName = $("#delete-img-name");
			
			$deleteImage.each(function(index, ele){
				$(ele).click(function(e){
					
					var imgName = $(this).data("name");  
					var originName = $("#origin-name");
					
					$deleteImageName.val(imgName);
					
					originName.remove();
					$(this).remove();
					
				})
			})
			
		})
	
	
	</script>


	<c:if test="${not empty errorMsg }">
			<script>   
	        	alertify.alert("글 수정 실패하였습니다.",'${errorMsg}');
	        </script>
			<c:remove var="errorMsg"/>
	</c:if>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>