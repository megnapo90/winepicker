<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ 답변하기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 180px); /* 헤더 높이를 고려한 높이 조정 */
            margin: 0;
        }
        .innerOuter {
            width: 50%;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    <div class="content">
        <div class="innerOuter">
            <h2>FAQ 답변하기</h2>
            <form id="updateFaqForm" action="${pageContext.request.contextPath}/admin/updateFaq" method="post">
                <input type="hidden" name="faqNo" value="${faq.faqNo}">
                <div class="form-group">
                    <label for="faqTitle">제목</label>
                    <input type="text" id="faqTitle" name="faqTitle" value="${faq.faqTitle}" readonly>
                </div>
                <div class="form-group">
                    <label for="faqCategory">구분</label>
                    <input type="text" id="faqCategory" name="faqCategory" value="${faq.faqCategory}" readonly>
                </div>
                <div class="form-group">
                    <label for="faqContent">내용</label>
                    <textarea id="faqContent" name="faqContent" rows="10">${faq.faqContent}</textarea>
                </div>
                <div class="btn-group">
                    <button type="button" onclick="submitForm()">저장하기</button>
                </div>
            </form>
        </div>
    </div>
    
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script>
        function submitForm() {
            var form = document.getElementById('updateFaqForm');
            form.submit();
        }

        <c:if test="${not empty popupMsg}">
            alert("${popupMsg}");
            window.location.href = "${pageContext.request.contextPath}/admin/faqList";
        </c:if>
    </script>
</body>
</html>
