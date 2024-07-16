<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 목록</title>
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
            width: 80%;
        }
        h2 {
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .search-bar {
            position: relative;
            width: 300px;
        }
        .input-field {
            padding: 8px 12px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 20px;
        }
        .search-bar button {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            border: none;
            background: none;
            cursor: pointer;
        }
        .search-bar button img {
            width: 20px;
            height: 20px;
        }
        .btn-group {
            text-align: right;
        }
        .btn-group button {
            padding: 8px 16px;
            margin-left: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
            white-space: nowrap;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .review-list {
            margin-top: 20px;
        }
        .checkbox-column {
            width: 40px;
        }
        .number-column {
            width: 60px;
        }
        .action-link {
            color: #007bff;
            text-decoration: none;
        }
        .action-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    <div class="content">
        <div class="innerOuter">
            <h2>리뷰 목록</h2>
            <div class="form-group">
                <form action="${pageContext.request.contextPath}/admin/review" method="get" class="search-bar">
                    <input type="text" name="keyword" placeholder="검색어를 입력하세요" value="${keyword}" class="input-field">
                    <button type="submit">
                        <img src="${pageContext.request.contextPath}/resources/images/search-icon.png" alt="Search">
                    </button>
                </form>
                <div class="btn-group">
                    <button type="button" onclick="deleteSelectedReviews()" class="btn-danger">선택 삭제</button>
                </div>
            </div>
            <div class="review-list">
                <form id="deleteReviewsForm" action="${pageContext.request.contextPath}/admin/deleteSelectedReviews" method="post">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="checkbox-column"><input type="checkbox" id="selectAll" onclick="toggleAll(this)"></th>
                                <th>리뷰 번호</th>
                                <th>주문 번호</th>
                                <th>내용</th>
                                <th>작성일</th>
                                <th>점수</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${reviewList}" var="review">
                                <tr>
                                    <td class="checkbox-column"><input type="checkbox" name="selectedReviews" value="${review.reviewNo}"></td>
                                    <td>${review.reviewNo}</td>
                                    <td>${review.orderNo}</td>
                                    <td>${review.content}</td>
                                    <td>${review.createDate}</td>
                                    <td>${review.point}</td>
                                    <td>${review.status}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty reviewList}">
                                <c:forEach var="i" begin="1" end="10">
                                    <tr>
                                        <td class="checkbox-column"><input type="checkbox" disabled></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <c:if test="${not empty popupMsg}">
        <script>
            alert("${popupMsg}");
        </script>
    </c:if>

    <script>
        function toggleAll(source) {
            var checkboxes = document.querySelectorAll('input[name="selectedReviews"]');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }

        function deleteSelectedReviews() {
            var form = document.getElementById("deleteReviewsForm");
            form.submit();
        }
    </script>
</body>
</html>
