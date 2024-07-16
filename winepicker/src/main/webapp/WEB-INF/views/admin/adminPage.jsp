<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Integer gradeNo = (Integer) session.getAttribute("gradeNo");
System.out.println(session.getAttribute("gradeNo"));
if (gradeNo == null || gradeNo != 0) {
   response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
   return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>


</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/adminList.jsp"/>
	
	
<div class="section">
	
</div>	



	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>