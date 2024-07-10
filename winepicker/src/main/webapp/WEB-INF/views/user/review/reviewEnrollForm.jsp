<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 등록</title>
<style>
.my-review {
	height : 100%;
	margin: 0;
	padding: 20px;
}

.my-review .review-item-header {
	
	width: 98%;
	height : 5%;
    display: flex;
    align-items: flex-start;
}

.review-item-header div{

	font-style: italic;
	font-size: 20px;
	font-weight: 400;
	
	width : 22%;
	height : 100%;
	margin : auto;
	
	display: flex;
}

.review-item-header div p{
	margin-top : 7px;
	text-align: left;
}

.review-box {
	overflow-x: auto;
	padding : 20px;
}

.review-insert-container {
	padding : 20px;
}

.review-item-header div{
	display : flex;
}

.review-item-body {
	overflow-x: auto;
	width: 100%;
	border-collapse: collapse;
}

.review-item-body tr{
	height: 130px;
}

.review-item-body tr:nth-of-type(1){
	height: 60px;
}

.review-item-body th, .review-item-body td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.review-item-body th {
	background-color: #f8f8f8;
	width : 20%;
}

.review-item-body td p {
	margin: 0;
}
.review-item-body th p {
	margin: 0;
}

.review-insert-form{
	margin-top: 30px;
}

.review-insert {
	width: 100%;
	border-collapse: collapse;
	border-top: 1px solid #ddd;
}

.review-insert div{
	display: flex;
	padding-top : 30px;
	align-items: baseline;
	justify-content: center;
}

.review-insert div p{
	width : 10%;
	text-align : center;
	font-size: 20px;
	font-family: Noto Serif Gurmukhi;
}

.review-title #title{
	width: 780px;
	height: 40px;
	font-size: 17px;
}
.review-content #point{
	width: 500px;
	height: 40px;
	font-size: 17px;
}

.review-enroll{
	margin-right : 40px;
	margin-top : 10px;
	display: flex;
    justify-content: center;
    align-items: center;
    
}
.review-enroll input[type="submit"] {
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


	<div class="page-name">
		리뷰 관리
    </div>
	<div class="content">
		<div class="page-detail">
	    	리뷰 작성
	    </div>
		
		<div class="my-review">
            <div class="review-box">
                
            <div class="review-insert-container">
            	<div class="review-item-header">
            		<div>
            			<p>주문번호 : </p>
            			<p>${review.orderNo}</p> 
            		</div>
            		<div>
            			<p>주문일자 : </p>
            			<p>${review.orderDate}</p> 
            		</div>
            	</div>
            	
            	<table class="review-item-body">
	            	<tr>
	            		<th><p>이미지</p></th>
	            		<td><p>상품명</p></td>
	            		<td><p>상품정보</p></td>
	            		<td><p>수량</p></td>
	            		<td><p>금액</p></td>
	            	</tr>
            			
					<tr>
	                	<td><img src="${contextPath}/${path }/${review.wineImage.changeName }" alt="상품 이미지"></td>
	                    <td><p>${review.wine.wineName}</p></td>
	                    <td><p>${review.wine.content}</p></td>
	                    <td><p>${review.qty}</p></td>
	                    <td><p>${review.wine.price}</p></td>
	                </tr>
            	</table>
                                
                <div class="review-insert-form"> 
                	<form action="${contextPath}/user/review/insert/${review.orderNo}" id="enrollForm" method="post" >
                    <div class="review-insert">
                        <div class="review-title">
                            <p>한줄평</p>
                            <input type="text" id="title" name="reveiwContent" required placeholder="한줄평을 등록하세요. (50자 이내)" >
                        </div>
                        <div class="review-content">
                            <p>별점</p>
	                        <input type="range" min="0.0" max="5.0" id="point" name="reveiwPoint">
	                        <p>${point }</p>
                        </div>
                    </div>
     				
	                <div class="review-enroll">
		                <input type="submit" id="formSubmit" value="등록">
	                </div>
                    </form>
            	</div>
          </div>
	</div>
	</div>
</div> 

<script>
(function countPoint(){
    var pointTag = document.querySelector("#point");
    var point = pointTag.value();

    console.log(pointTag);
    console.log(point);
})
</script>



<c:if test="${not empty errorMsg }">
		<script>   
        	alertify.alert("글 작성이 실패하였습니다.",'${errorMsg}');
        </script>
		<c:remove var="errorMsg"/>
</c:if>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>