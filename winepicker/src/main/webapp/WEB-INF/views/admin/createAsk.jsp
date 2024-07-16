<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의 작성</title>
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
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .input-field {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        textarea.input-field {
            height: 200px; /* 내용 칸 높이 증가 */
            resize: vertical;
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
            <h2>1:1 문의 작성</h2>
            <form action="${pageContext.request.contextPath}/admin/addAsk" method="post">
                <div class="form-group">
                    <label for="askTitle">제목:</label>
                    <input type="text" id="askTitle" name="askTitle" class="input-field" required>
                </div>
                <div class="form-group">
                    <label for="productName">상품명:</label>
                    <input type="text" id="productName" name="productName" class="input-field" required>
                </div>
                <div class="form-group">
                    <label for="askContent">내용:</label>
                    <textarea id="askContent" name="askContent" class="input-field" required></textarea>
                </div>
                <button type="submit">작성하기</button>
            </form>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
