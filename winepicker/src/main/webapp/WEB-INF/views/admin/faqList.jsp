<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ 목록</title>
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
            align-items: flex-start;
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
            margin-top: 10px;
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
        .faq-list {
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
            <h2>FAQ 목록</h2>
            <div class="form-group">
                <form action="${pageContext.request.contextPath}/admin/faqList" method="get" class="search-bar">
                    <input type="text" name="keyword" class="input-field" placeholder="검색어를 입력하세요" value="${keyword}">
                    <button type="submit">
                        <img src="${pageContext.request.contextPath}/resources/images/search-icon.png" alt="Search">
                    </button>
                </form>
                <div class="btn-group">
                    <button type="button" onclick="updateFaq()">답변하기</button>
                    <button type="button" onclick="deleteSelectedFaqs()" class="btn-danger">선택 삭제</button>
                </div>
            </div>
            <div class="faq-list">
                <table class="table">
                    <thead>
                        <tr>                       
                            <th style="width: 30px;"><input type="checkbox" id="selectAll" onclick="toggleAll(this)"></th>
                            <th>번호</th>
                            <th>구분</th>
                            <th>제목</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${faqList}" var="faq" varStatus="status">
                            <tr>
                                <td><input type="checkbox" name="selectedFaqs" value="${faq.faqNo}"></td>
                                <td>${faq.faqNo}</td>
                                <td>${faq.faqCategory}</td>
                                <td>${faq.faqTitle}</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty reviewList}">
                        <c:forEach var="i" begin="1" end="${10 - reviewList.size()}">
                                <tr>
                                    <td class="checkbox-column"><input type="checkbox" disabled></td>
                                    <td class="number-column"></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
</div>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script>
    function updateFaq() {
        var selectedFaqs = document.querySelectorAll('input[name="selectedFaqs"]:checked');
        if (selectedFaqs.length === 0) {
            alert('FAQ를 선택해주세요.');
            return;
        }

        var faqNo = selectedFaqs[0].value; // 여기서는 하나의 FAQ만 선택할 수 있도록 제한함

        var url = '${pageContext.request.contextPath}/admin/updateFaq?faqNo=' + faqNo;
        window.location.href = url;
    }

    function deleteSelectedFaqs() {
        var selectedFaqs = document.querySelectorAll('input[name="selectedFaqs"]:checked');
        if (selectedFaqs.length === 0) {
            alert('삭제할 FAQ를 선택해주세요.');
            return;
        }

        if (confirm('선택한 FAQ를 삭제하시겠습니까?')) {
            var faqNos = [];
            selectedFaqs.forEach(function(faq) {
                faqNos.push(faq.value);
            });

            var form = document.createElement('form');
            form.method = 'post';
            form.action = '${pageContext.request.contextPath}/admin/deleteSelectedFaqs';

            faqNos.forEach(function(faqNo) {
                var input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'selectedFaqs';
                input.value = faqNo;
                form.appendChild(input);
            });

            document.body.appendChild(form);
            form.submit();
        }
    }

    function toggleAll(source) {
        var checkboxes = document.getElementsByName('selectedFaqs');
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = source.checked;
        }
    }
    </script>
</body>
</html>
