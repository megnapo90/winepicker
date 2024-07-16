<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#popupList {text-align:center;}
	#popupList>tbody>tr:hover {cursor:pointer;}
	
	#pagingArea {width:fit-content; margin:auto;}
	#pagingArea .on{
		background-color: lightgray;
	}
	
	#searchForm {
	    width:80%;
	    margin:auto;
	}
	#searchForm>* {
	    float:left;
	    margin:5px;
	}
	.select {width:20%;}
	.text {width:53%;}
	.searchBtn {width:20%;}
	/* 썸네일 관련 스타일 */
	#popupList tr > td:nth-of-type(2){ /* 2번째 td(제목) */
	    position: relative;
	}
	.list-thumbnail{
	  max-width: 50px;
	 max-height: 30px;
	
	 position: absolute;
	 left : -15px;
	 top : 10px;
	}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
<jsp:include page="/WEB-INF/views/admin/adminList.jsp"/>


<div class="section">

	<input type="button" onclick="popupEnroll()" value="팝업 등록">
	<table id="popupList" class="table table-hover" align="center">
		<tr>
			<th>번호</th>
			<th>팝업 이름</th>
			<th>파일 이름</th>
			<th>게시 상태</th>
		</tr>	
		<c:choose>
             <c:when test="${empty pList}">
             	<tr>
             		<td colspan="5">현재 팝업이 없습니다.</td>
               	</tr>               
             </c:when>
            	<c:otherwise>
              <c:forEach var="p" items="${pList}">
                  <tr onclick="">
                      <td>${p.popupNo}</td>
                      <td>${p.popupTitle}</td>
                      <td>${p.originName}</td>
                      <td>${p.status}</td>
                  </tr>
              </c:forEach>
             </c:otherwise>
         </c:choose>	
	</table>



</div>

<script>
	function popupEnroll(){
		location.href = "${contextPath}/admin/popupEnroll";
	}
</script>





<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>