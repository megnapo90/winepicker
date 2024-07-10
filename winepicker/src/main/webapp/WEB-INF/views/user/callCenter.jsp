<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>

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

#faq-detail {
	opacity: 1;
	background: #D3D3D3;
	
	font-style: oblique;
	height: 150px;
	
	padding : 25px;
}
.call-center-menu .faq{
	opacity: 1;
	background: #5E5E5E;
	font-family: Noto Serif Gurmukhi;
	font-size: 25px;
	font-weight: normal;
	line-height: normal;
	letter-spacing: 0.1em;
	color: #FFFFFF;	
}

.faq-list-box {
	overflow-x: auto;
}

.faq-list {
	margin : auto;
	width: 95%;
	border-collapse: collapse;
}

.faq-list tr{
	height: 90px;
	
	box-sizing: border-box;
	border-width: 0px 0px 0.5px 0px;
	border-style: solid;
	border-color: rgba(0, 0, 0, 0.5);
	
}

.faq-list th, .faq-list td {
	margin : auto;
	padding: 10px;
	text-align: left;
}

.faq-list th {
	width : 10%;
	font-family: Alike Angular;
	font-size: 30px;
	font-weight: 400;
	line-height: normal;
	text-align: center;
	letter-spacing: 0.1em;
	font-variation-settings: "opsz" auto;
	color: #3D3D3D;
}
.faq-list td {
	font-family: Alike Angular;
	font-size: 25px;
	font-weight: normal;
	line-height: normal;
	letter-spacing: 0.1em;
	font-variation-settings: "opsz" auto;
	color: #3D3D3D;
}

.faq-list td p {
	margin: 0;
}

</style>
</head>
<body>
	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/userCommon.jsp"/>

    <div class="page-name">	
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
	        <div class="faq-list-box">    
	        <table class="faq-list">
	            	
	          	<c:forEach items="${faqList }" var="faq">
	            	<tr id="${faq.faqNo }" onclick=showFaqDetail(${faq.faqNo});>
	            		<th>Q${faq.faqNo }</th>
	            		<td>${faq.faqTitle }</td>
	            	</tr>
	            </c:forEach>
	        </table>
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

	function showFaqDetail(fno){
	
		if($("#faq-detail") != null){
			$.ajax({
		
				url : "${contextPath}/user/faqDetail/"+fno,
				data : {
					faqNo : "${faqNo}"
				},
				type : "get",
				success : function showFaqContent(faq){
					console.log(faq);
					
					var content = "";
						content += '<tr id="faq-detail" onclick=removeFaqDetail(this);>';
						content += `<th>A\${faq.faqNo}</th>`; 
						content += `<td>\${faq.faqContent}</td>`;
						content += '</tr>';
					var faqNo = faq.faqNo;
					
					$(".faq-list #"+faqNo+"").after(content);
				}
			})
		}
			
	}
	
	
	function removeFaqDetail(faq){
		$(faq).remove();
	}
	
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>