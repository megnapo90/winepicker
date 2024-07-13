<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 수정</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
</head>
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
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    <div class="content">
        <div class="innerOuter">
            <h2>문의 수정</h2>
            <form action="${pageContext.request.contextPath}/admin/modifyAsk" method="post">
                <input type="hidden" name="askNo" value="${ask.askNo}">
                <div class="form-group">
                    <label for="askTitle">제목</label>
                    <input type="text" id="askTitle" name="askTitle" value="${ask.askTitle}" required>
                </div>
                <div class="form-group">
                    <label for="askContent">내용</label>
                    <textarea id="askContent" name="askContent" rows="10" required>${ask.askContent}</textarea>
                </div>
                <button type="submit">수정하기</button>
            </form>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
