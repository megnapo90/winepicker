<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style>
.purchase-history {
	
	height : 100%;
	margin: 0;
	padding: 20px;
}

.purchase-history .date-filter {
	
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

.empty-history-list {
	text-align: center;
	padding: 20px;
	color: #888;
}
.empty-history-list>p{
	padding-top : 15%;
	text-align : center;
	font-size : 20px;
	font-weight : 10px;
}

.purchase-list-box {
	overflow-x: auto;
}

.purchase-list {
	width: 100%;
	border-collapse: collapse;
}

.purchase-list tr{
	height: 130px;
}

.purchase-list tr:nth-of-type(1){
	height: 60px;
}

.purchase-list th, .purchase-list td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.purchase-list th {
	background-color: #f8f8f8;
}

.purchase-list td p {
	margin: 0;
}

.purchase-list img {
	width: 50px;
	height: auto;
}
#available-review{
	font-weight : 300px;
	cursor: pointer;
}

.purchase-list img {
	width: 50px;
	height: auto;
}

</style>

</head>
<body>
	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/userCommon.jsp"/>

	
	<div class="page-name">	
		주문 배송 조회
	</div>
    <div class="content">
      	<div class="page-detail">
            주문 내역
        </div>
           
        <div class="purchase-history">
          
         	<div class="date-filter">

				<form action="myPage" method="post" >
					<input type="date" name="startDate" value=${startDate }>&nbsp;~&nbsp;
					<input type="date" name="endDate" value=${endDate }>&nbsp;

					<input type="submit" value="조회">
				</form>
           	</div>
          	
          	<c:choose>

          	<c:when test="${empty purchaseList }">

          		<div class="empty-history-list">
          			<p>주문하신 상품이 없습니다.</p>
          		</div>
          	</c:when>
          	<c:otherwise>
          	<div class="purchase-list-box">
              <table class="purchase-list">
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
          	
          		<c:forEach items="${purchaseList }" var="item">
					<tr>
	                	<td><img src="${contextPath}/${path }/${item.wineImage.changeName }" alt="상품 이미지"></td>
	                	<td><p>${item.orderNo}</p></td>
	                    <td><p>${item.orderDate}</p></td>
	                    <td><p>${item.wine.wineName}</p></td>
	                    <td><p>${item.qty}</p></td>
	                    <td><p>${item.wine.price}</p></td>
	                    <td><p>${item.DStatus == 3 ? '배송완료' : item.DStatus == 2 ? '배송중' : '배송전'}</p></td>
						<c:if test="${item.DStatus ne 3}">
							<td><p>작성불가</p></td>	
						</c:if>
						<c:if test="${item.DStatus eq 3 and item.review.content ne null }">
							<td onclick="location.href='${contextPath}/user/review/detail/${item.orderNo}'">
								<p>작성완료</p>
							</td>	
						</c:if>
						<c:if test="${item.DStatus eq 3 and item.review.content eq null }">
                    		<td id="available-review" onclick="location.href='${contextPath}/user/review/searchMyReview'">
                    			<p>작성가능</p></td>
						</c:if>											
	                </tr>

          		</c:forEach>
          	
          		</table>
          	</div>
          	</c:otherwise>
          	</c:choose>
          		
       </div>
          
	</div>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


</body>
</html>