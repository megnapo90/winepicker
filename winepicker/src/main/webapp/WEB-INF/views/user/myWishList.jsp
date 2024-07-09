<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품</title>

<style>
.wish-list {
	
	height : 100%;
	margin: 0;
	padding: 20px;
}

.empty-wish-list {
	text-align: center;
	padding: 20px;
	color: #888;

}
.empty-wish-list>p{
	padding-top : 15%;
	text-align : center;
	font-size : 20px;
	font-weight : 10px;
}

.wish-list-box {
	overflow-x: auto;
	margin-top : 50px;
}

.wish-list {
	width: 100%;
	border-collapse: collapse;
}

.wish-list tr{
	height: 100px;
}

.wish-list tr:nth-of-type(1){
	height: 60px;
}

.wish-list th, .wish-list td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: ;
}

.wish-list th {
	background-color: #f8f8f8;
}

.wish-list td p {
	margin: 0;
}

.wish-list img {
	width: 50px;
	height: auto;
}

.addShoppingBag{
	margin-top : 10px;
	display: flex;
    justify-content: flex-end;
    align-items: center;
}
.addShoppingBag input[type="button"] {
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
		관심 상품
	</div>
            
	<div class="content">
		<div class="page-detail">
			관심 상품
		</div>

		<div class="wish-list">

		<c:choose>
			<c:when test="${wishList eq null}">
				<div class="empty-wish-list">
					<p>관심 상품이 없습니다.</p>
				</div>
		</c:when>
		<c:otherwise>
        <div class="wish-list-box">
            	               
			<table class="wish-list">
            	
				<tr>
          			<th></th>
          			<td><p>상품명</p></td>
          			<td><p>상품설명</p></td>
          			<td><p>금액</p></td>
          			<td><p>장바구니</p></td>
          			<td><p>구매하기</p></td>
          			<td><p>삭제</p></td>
          		</tr>
            	
			<c:forEach items="${wishList }" var="wish">
           		<tr class="wish-item-${wish.wineNo }">
           			<th><img src="${contextPath}/${path }/${wish.wineImage.changeName }" /></th>
           			<td>${wish.wineName }</td>
           			<td>${wish.content }</td>
           			<td>${wish.price }</td>
           			<td onclick=addShoppingBag(${wish.wineNo})>장바구니</td>
           			<c:choose>
						<c:when test="${wish.quantity eq 0}">
							<td><spans color="red">sold out</spans></td>	
						</c:when>
						<c:otherwise>
		            		<td onclick=purchaseItem(${wish.wineNo})>구매하기</td>
						</c:otherwise>
					</c:choose>
					<td onclick=removeItem(${wish.wineNo})>삭제</td>
           		</tr>
           	</c:forEach>
          	</table>
            	<div class="addShoppingBag">
                    <input type="button" onclick=addShoppingBagAll(${wishList}) value="장바구니"> 
                </div>
        </div>
        </c:otherwise>
        </c:choose>
        </div>
    </div>

<script>
	function addShoppingBag(no){
		//장바구니 모달창에 상품 추가
	}

	function addShoppingBagAll(list){
		//관심상품 전체 장바구니 모달창에 추가	
	}
	
	function purchaseItem(no){
		//구매하기 화면으로 넘김
	}
	function removeItem(no){
		$.ajax({
			url : "${contextPath}/user/delete/myWishItem",
			data : {
				no : no
			},
			type : "get",
			success : $(".wish-item-"+no+"").remove()
		})
		
	}

</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>