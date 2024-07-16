<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 답변</title>
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
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="content">
        <div class="innerOuter">
            <h2>리뷰 답변</h2>
            <form action="${pageContext.request.contextPath}/admin/saveReviewReply" method="post">
                <input type="hidden" name="reviewNo" value="${review.reviewNo}">
                <div class="form-group">
                    <label for="content">리뷰 내용</label>
                    <textarea id="content" class="textarea-field" readonly>${review.content}</textarea>
                </div>
                <div class="form-group">
                    <label for="replyContent">답변 내용</label>
                    <textarea id="replyContent" name="replyContent" class="textarea-field" rows="10"></textarea>
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">저장</button>
                    <button type="button" class="btn btn-secondary" onclick="window.history.back();">취소</button>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
