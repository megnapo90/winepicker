<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 상세 정보</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .content {
            margin: 20px;
        }
        .innerOuter {
            margin: auto;
            width: 50%;
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
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="content">
        <div class="innerOuter">
            <h2>회원 상세 정보</h2>
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" value="${user.userId}" readonly>
            </div>
            <div class="form-group">
                <label for="userName">이름</label>
                <input type="text" id="userName" name="userName" value="${user.userName}" readonly>
            </div>
            <div class="form-group">
                <label for="userSsn">주민등록번호</label>
                <input type="text" id="userSsn" name="userSsn" value="${user.userSsn}" readonly>
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" id="phone" name="phone" value="${user.phone}" readonly>
            </div>
            <div class="form-group">
                <label for="userEmail">이메일</label>
                <input type="email" id="userEmail" name="userEmail" value="${user.userEmail}" readonly>
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <textarea id="address" name="address" rows="4" readonly>${user.address}</textarea>
            </div>
            <button onclick="goBack()">돌아가기</button>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
