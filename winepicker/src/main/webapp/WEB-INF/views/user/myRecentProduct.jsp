<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 본 상품</title>
<style>
.search-history {
	
	height : 100%;
	margin-top: 20px;
	padding: 20px;
}

.empty-select-list {
	text-align: center;
	padding: 20px;
	color: #888;

}
.empty-select-list>p{
	padding-top : 15%;
	text-align : center;
	font-size : 20px;
	font-weight : 10px;
}

.search-list-box {
	overflow-x: auto;
	margin-top : 50px;
}

.search-list {
	width: 100%;
	border-collapse: collapse;
}

.search-list tr{
	height: 100px;
}

.search-list tr:nth-of-type(1){
	height: 60px;
}

.search-list th, .search-list td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.search-list th {
	background-color: #f8f8f8;
}

.search-list td p {
	margin: 0;
}

.search-list img {
	width: 50px;
	height: auto;
}

</style>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/userCommon.jsp"/>


	<div class="page-name">
    	최근 본 상품
    </div>
	
	<div class="content">
		<div class="page-detail">
			최근 조회 상품
		</div>	
		<div class="search-history">
			<c:choose>
	
				<c:when test="${searchList ne null}">
					<div class="empty-select-list">
						<p>최근 조회한 상품이 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="search-list-box">
						<table class="search-list">
							<tr>
								<th></th>
								<td><p>상품명</p></td>
								<td><p>상품설명</p></td>
								<td><p>금액</p></td>
							</tr>
	
							<c:forEach items="${searchList }" var="s">
								<tr>
									<td><img src="<%-- ${wine.imageURL} --%>" alt="상품 이미지"></td>
									<td><p>
											<%-- ${s.productName} --%>
										</p></td>
									<td><p>
											<%-- ${s.content} --%>
										</p></td>
									<td><p>
											<%-- ${s.price} --%>
										</p></td>
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