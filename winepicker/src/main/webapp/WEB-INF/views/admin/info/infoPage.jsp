<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
#main-img img{
	box-sizing: content-box;
	
	position: absolute;
	top: 0px;
	left: 0px;
	
	/* float: left; */

    width: 500px;
    margin-top: 0;
    margin-right: 20px;
}
#subtitle{
    box-sizing: content-box;
    
    position: absolute;
    top: 0px;
    left: 550px;

    font-size: xx-large;
    font-weight: bolder;
    text-align: center;
}
#info-main-content{

	position: absolute;
	top: 50px;
	left: 510px;
    box-sizing: content-box;

}
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
    
    <div class="section">


	<div id="info-main">
        <div id="main-img">
            <img src="${contextPath}/resources/admin/shop.jpg" alt="메인인포 사진">
        </div>
        <div id="subtitle">${info.subtitle}</div>
        <div id="info-main-content">
			${info.content}
        </div>
    </div>
    
	<c:if test="${loginUser.gradeNo eq 0}">
		<script>
            (()=>{
                $("#info-main").css("display", "none");
            })();
		</script>
		
		<form action="${contextPath}/admin/updateInfo" method="post" enctype="multipart/form-data">
        <table align="center">
        	<tr>
        		<th>INFO_NAME</th>
        		<td>
                    <textarea  name="infoName"  id="infoName" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.infoName}</textarea>                
                </td>
        	</tr>
        	<tr>
        		<th>COUNTRY_NO</th>
        		<td>
                    <textarea  name="countryNo"  id="countryNo" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.countryNo}</textarea>                
                </td>
        	</tr>
        	<tr>
        		<th>WINE_TYPE_NO</th>
        		<td>
                    <textarea  name="wineTypeNo"  id="wineTypeNo" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.wineTypeNo}</textarea>                
                </td>
        	</tr>
        	<tr>
        		<th>GRAPE_NO</th>
        		<td>
                    <textarea  name="grapeNo"  id="grapeNo" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.grapeNo}</textarea>                
                </td>
        	</tr>
        	<tr>
        		<th>DEPTH</th>
        		<td>
                    <textarea  name="depth"  id="depth" style="resize: none;" rows="1" class="form-control" required="required" readonly>${info.depth - 1}</textarea>                
                </td>
        	</tr>
        	
            <tr>
                <th>부제목</th>
                <td>
                    <textarea  name="subtitle"  id="subtitle" style="resize: none;" rows="1" class="form-control" required="required">${info.subtitle}</textarea>                
                </td>
            </tr>

            <tr>
                <th>첨부파일</th>
                <td><input type="file" id="upfile" class="form-control" name="upfile"></td>
            </tr>


            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" id="content" style="resize: none;" rows="10" class="form-control"  required="required">${info.content}</textarea>
                </td>
            </tr>
        </table>
        <div align="center">
            <button type="submit" class="btn btn-primary">수정</button>
            <button type="reset" class="btn btn-danger">취소</button>
        </div>
    </form>
		
	</c:if>


    </div>
    
    
    <div id="list">
    	<c:forEach var="info2" items="${iList}">
			<c:if test="${info2.countryNo eq 1}">
    			<ul class="ul">
    				<li class="depth${info2.depth}">
    					<a href="${contextPath}/admin/info/${info2.infoName}">${info2.infoName} 정보글</a>
    				</li>
    			</ul>
    		</c:if>
    	</c:forEach>
    </div>
    
    	<%-- <c:if test="${info.depth lt 1}">
    		<script>
    			$(".depth2").css("display", "none");
    			$(".depth3").css("display", "none");
    		</script>
    	</c:if> --%>
    
    
    
    
   <%--  <div id="list">
    
    <c:choose>
    	<c:when test="${info.depth lt 4}">
		    <c:forEach var="info2" items="${iList}">
		    	<c:choose>
				    <c:when test="${info.wineTypeNo eq info2.wineTypeNo}">
				    	<ul class="ul">
				   			<li>
					    		<a href="${contextPath}/admin/info/${info2.infoName}">${info2.infoName} 정보글</a>
				   			</li>
				   		</ul>
				    </c:when>
				    
				    <c:when test="${info.wineTypeNo eq 0}">
				    <ul class="ul">
				    	<li>
				    		<a href="${contextPath}/admin/info/${info2.infoName}">${info2.infoName} 정보글</a>
			   			</li>
				    </ul>
				    </c:when>
	    		</c:choose>
		    </c:forEach>
    	</c:when>
    </c:choose>
    
    <c:if test="${info.depth gt 2}">
	    <ul class="ul">
	    	<li>
	   			<a href="상품보러가기">${info.infoName} 상품 보러가기</a>
			</li>
	    </ul>
    </c:if> --%>
    
    </div>

    


    

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>