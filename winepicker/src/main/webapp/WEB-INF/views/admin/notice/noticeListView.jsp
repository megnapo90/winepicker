<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#noticeList {text-align:center;}
	#noticeList>tbody>tr:hover {cursor:pointer;}
	
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
	#noticeList tr > td:nth-of-type(2){ /* 2번째 td(제목) */
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
   
<div class="section">

	<div class="content">
	<input id="noticeEnroll" type="button" value="공지 등록" onclick="noticeEnroll()" style="display: none;">
	<c:if test="${loginUser.gradeNo eq 0}">
		<script>
			$("#noticeEnroll").css("display", "block");
		</script>
	</c:if>
	
        <br><br>
        
        <div class="innerOuter" style="padding:5% 10%;">
        
        <br><br>
      
      	<br>
      
      	<table id="noticeList" class="table table-hover" align="center">
        	<thead>
            	<tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${empty nList}">
                	<tr>
                		<td colspan="5">공지사항이 없습니다.</td>
                  	</tr>               
                </c:when>
               	<c:otherwise>
	                <c:forEach var="notice" items="${nList}">
	                    <tr onclick="noticeDetail(${notice.noticeNo})">
	                        <td>${notice.noticeNo}</td>
	                        <td>${notice.noticeTitle}</td>
	                        <td>${notice.createDate}</td>
	                    </tr>
	                </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
        
        <script>
           function noticeDetail(noticeNo) {
            	location.href = "${contextPath}/admin/notice/noticeDetail/"+noticeNo;
           };

		   
        </script>
        
        <br>
        
        <c:set var="url" value="?currentPage="/>
        <c:if test="${not empty param.condition}">
	        <c:set var="sParam" value="&condition=${param.condition}&keyword=${param.keyword}"/>
        </c:if>
        
        <div id="pagingArea">
        	<ul class="pagination">
        		<!-- 이전 버튼 -->
        		<c:if test="${pi.currentPage eq 1}">
        			<li class="page-item">
        				<a class="page-link">이전</a>
        			</li>
        		</c:if>
        		<c:if test="${pi.currentPage ne 1}">
        			<li class="page-item">
        				<a class="page-link" href="${url}${pi.currentPage-1}${sParam}">이전</a>
        			</li>
        		</c:if>
        		
        		<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
        			<li class="page-item">
        				<a class="page-link ${i eq pi.currentPage ? 'on' : ''}" href="${url}${i}${sParam}">${i}</a>
        			</li>
        		</c:forEach>
        		
        		<!-- 다음 버튼 -->
        		<c:if test="${pi.currentPage eq pi.maxPage}">
        			<li class="page-item">
        				<a class="page-link" >다음</a>
        			</li>
        		</c:if>
        		<c:if test="${pi.currentPage ne pi.maxPage}">
        			<li class="page-item">
        				<a class="page-link" href="${url}${pi.currentPage+1}${sParam}">다음</a>
        			</li>
        		</c:if>
        	</ul>
        </div>
        
        <br clear="both">
        
        <form id="searchForm" method="get" align="center" action="">
        	
			<div class="select">
				<select class="custom-select" name="condition">
                <option value="title" ${param.condition eq 'title' ? 'selected' : ''}>제목</option>
                <option value="content" ${param.condition eq 'content' ? 'selected' : ''}>내용</option>
                <option value="titleAndContent" ${param.condition eq 'titleAndContent' ? 'selected' : ''}>제목+내용</option>
              	</select>
            </div>
			<div class="text">
            	<input type="text" class="form-control" name="keyword" value="${param.keyword}" />
            </div>
            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            
        </form>
        
        
        
		</div>
	</div>
	
</div>

<script>
	function noticeEnroll(){
		location.href = "${contextPath}/admin/noticeEnroll";
	}
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>










