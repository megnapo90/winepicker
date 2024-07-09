<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰관리</title>

<style>

.review-list-search {
	
	height : 100%;
	margin: 0;
	padding: 20px;
}

.review-list-search .date-filter {
	
    margin-top: 25px;
    margin-bottom: 25px;
    display: flex;
    justify-content: flex-end;
    align-items: center;
}

.date-filter form {
    display: flex;
    align-items: center;
}

.date-filter input[type="date"] {
	padding: 5px;
	margin: 0 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.date-filter input[type="submit"] {
	padding: 5px 10px;
	border: none;
	background-color: #007bff;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
}

.empty-review-list {
	text-align: center;
	padding: 20px;
	color: #888;

}
.empty-review-list>p{
	padding-top : 15%;
	text-align : center;
	font-size : 20px;
	font-weight : 10px;
}

.review-list-box {
	overflow-x: auto;
}

.show-review-list {
	width: 100%;
	border-collapse: collapse;
}

.show-review-list tr{
	height: 130px;
}

.show-review-list tr:nth-of-type(1){
	height: 60px;
}

.show-review-list th, .show-review-list td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.show-review-list th {
	background-color: #f8f8f8;
}

.show-review-list td p {
	margin: 0;
}

.show-review-list img {
	width: 50px;
	height: auto;
}

.review-notice{
	margin-top : 20px;
	margint-left : 10px;
}

#available-review{
	font-weight : 300px;
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
	    	리뷰 관리
	    </div>
 	<div class="review-list-search">
        
        <div class="date-filter">
			<form action="searchMyReview" method="post" >
				<input type="date" name="startDate">&nbsp;~&nbsp;
				<input type="date" name="endDate">&nbsp;
				<input type="submit" value="조회">
			</form>
        </div>
        
        <c:choose>
          	<c:when test="${empty reviewList}">
          		<div class="empty-review-list">
          			<p>리뷰하실 상품이 없습니다.</p>
          		</div>
          	</c:when>
        	<c:otherwise>
        
			<div class="review-list-box"> 
		
        		<table class="show-review-list">
	            	<tr>
	            		<th></th>
	            		<td><p>주문번호</p></td>
	            		<td><p>주문일자</p></td>
	            		<td><p>상품명</p></td>
	            		<td><p>수량</p></td>
	            		<td><p>금액</p></td>
	            		<td><p>배송상태</p></td>
	            		<td><p>리뷰관리</p></td>
	            	</tr>
            			
            	<c:forEach items="${reviewList }" var="review">
					<tr>
	                	<td><img src="${contextPath}/${path }/${review.wineImage.changeName }" alt="상품 이미지"></td>
	                	<td><p>${review.orderNo}</p></td>
	                    <td><p>${review.orderDate}</p></td>
	                    <td><p>${review.wine.wineName}</p></td>
	                    <td><p>${review.qty}</p></td>
	                    <td><p>${review.wine.price}</p></td>
	                    <td><p>${review.DStatus == 3 ? '배송완료' : review.DStatus == 2 ? '배송중' : '배송전'}</p></td>
						<c:if test="${review.DStatus ne 3}">
							<td><p>작성불가</p></td>	
						</c:if>
						<c:if test="${review.DStatus eq 3 and review.review.content ne null }">
							<td onclick="location.href='${contextPath}/user/review/detail/${review.orderNo}'">
								<p>작성완료</p>
							</td>	
						</c:if>
						<c:if test="${review.DStatus eq 3 and review.review.content eq null }">
                    		<td id="available-review" onclick="location.href='${contextPath}/user/review/enroll/${review.orderNo}'">
                    			<p>작성가능</p></td>
						</c:if>											
	                </tr>
          		</c:forEach>
            	</table>
            </div>
                <div class="review-notice">
                	<div class="notice-detail">
                		<span>리뷰는 주문 후 30일까지 작성 가능합니다.</span><br>
                		<span>주문 이후 30일 지난 시점부터 작성 불가하니 참고하여 주시기 바랍니다.</span>
                    </div>
                </div>
            </c:otherwise>
            </c:choose>
            
            </div>
    </div> 
    
    <c:if test="${not empty errorMsg}">
	    <script>
	    	alertify.alert("",'${errorMsg}');	
	    </script>      
		<c:remove var="errorMsg"/>
	</c:if>
	<script>
	
	</script>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


</body>
</html>