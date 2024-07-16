<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의 조회</title>
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
        .ask-list {
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
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/adminList.jsp"/>
    
    
<div class="section">
    <div class="content">
        <div class="innerOuter">
            <h2>1:1 문의 조회</h2>
            <div class="form-group">
                <form action="${pageContext.request.contextPath}/admin/askList" method="get" class="search-bar">
                    <input type="text" name="keyword" placeholder="검색어를 입력하세요" value="${keyword}" class="input-field">
                    <button type="submit">
                        <img src="${pageContext.request.contextPath}/resources/images/search-icon.png" alt="Search">
                    </button>
                </form>
                <div class="btn-group">
                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/createAsk'">작성하기</button>
                    <button type="button" onclick="modifyAsk()">선택 수정</button>
                    <button type="button" onclick="deleteAsk()" class="btn-danger">선택 삭제</button>
                </div>
            </div>
            <div class="ask-list">
                <form id="deleteAsksForm" action="${pageContext.request.contextPath}/admin/deleteAsk" method="post">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="checkbox-column"><input type="checkbox" id="selectAll" onclick="toggleAll(this)"></th>
                                <th>번호</th>
                                <th>작성시간</th>
                                <th>문의내용</th>
                                <th>제목</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${askList}" var="ask">
                                <tr>
                                    <td class="checkbox-column"><input type="checkbox" name="selectedAsks" value="${ask.askNo}"></td>
                                    <td>${ask.askNo}</td>
                                    <td>${ask.createDate}</td>
                                    <td>${ask.askContent}</td>
                                    <td>${ask.askTitle}</td>
                                </tr>
                            </c:forEach>
                            <c:forEach var="i" begin="${fn:length(askList) + 1}" end="20">
                                <tr>
                                    <td class="checkbox-column"><input type="checkbox" disabled></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
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
            var checkboxes = document.querySelectorAll('input[name="selectedAsks"]');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }

        function deleteAsk() {
            var form = document.getElementById("deleteAsksForm");
            form.submit();
        }

        function modifyAsk() {
            var selectedAsks = document.querySelectorAll('input[name="selectedAsks"]:checked');
            if (selectedAsks.length !== 1) {
                alert("하나의 문의를 선택하여 수정해주세요.");
                return;
            }
            var askNo = selectedAsks[0].value;
            window.location.href = '${pageContext.request.contextPath}/admin/modifyAskForm?askNo=' + askNo;
        }
    </script>
</body>
</html>
