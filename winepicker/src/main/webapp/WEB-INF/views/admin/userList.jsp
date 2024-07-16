<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원관리</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/admin.css'/>">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .content {
            margin: 20px;
            overflow: scroll;
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
        .user-list {
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
            <h2>회원조회</h2>
            <div class="form-group">
                <form action="<c:url value='/admin/searchUser'/>" id="enrollForm" method="get" class="search-bar">
                    <input type="text" id="username" name="username" class="input-field" placeholder="검색어를 입력하세요" onkeydown="if(event.keyCode==13) { searchUser(); return false; }">
                    <button type="button" onclick="searchUser()">
                        <img src="<c:url value='/resources/images/search-icon.png'/>" alt="Search">
                    </button>
                </form>
                <div class="btn-group">
                    <button type="button" onclick="modifyUser()">회원 수정</button>                
                    <button type="button" onclick="deleteUser()" class="btn-danger">회원 삭제</button>
                </div>
            </div>
            <div class="user-list">
                <h2>회원 목록</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th class="checkbox-column"><input type="checkbox" id="selectAll" onclick="toggleAll(this)"></th>
                            <th class="number-column">번호</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>가입일</th>
                            <th>상태</th>
                            <th>상세 보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td class="checkbox-column"><input type="checkbox" name="selectedUsers" value="${user.userNo}"></td>
                                <td class="number-column">${user.userNo}</td>
                                <td>${user.userId}</td>
                                <td>${user.userName}</td>
                                <td>${user.userEmail}</td>
                                <td>${user.phone}</td>
                                <td>${user.enrollDate}</td>
                                <td>${user.status}</td>
                                <td><a class="action-link" href="<c:url value='/admin/user/${user.userNo}'/>">상세 보기</a></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty userList}">
                            <c:forEach var="i" begin="1" end="20">
                                <tr>
                                    <td class="checkbox-column"><input type="checkbox" disabled></td>
                                    <td class="number-column"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${not empty userList && userList.size() < 10}">
                            <c:forEach var="i" begin="1" end="${10 - userList.size()}">
                                <tr>
                                    <td class="checkbox-column"><input type="checkbox" disabled></td>
                                    <td class="number-column"></td>
                                    <td></td>
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
            </div>
        </div>
    </div>
    
</div>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    <script>
        function searchUser() {
            document.getElementById('enrollForm').submit();
        }

        function modifyUser() {
            var selectedUsers = document.getElementsByName('selectedUsers');
            var selectedUserIds = [];
            for (var i = 0; i < selectedUsers.length; i++) {
                if (selectedUsers[i].checked) {
                    selectedUserIds.push(selectedUsers[i].value);
                }
            }
            if (selectedUserIds.length == 1) {
                window.location.href = '<c:url value="/admin/modifyUserForm"/>?userNo=' + selectedUserIds[0];
            } else if (selectedUserIds.length > 1) {
                alert('한 번에 하나의 회원만 수정할 수 있습니다.');
            } else {
                alert('수정할 회원을 선택해주세요.');
            }
        }

        function deleteUser() {
            var selectedUsers = document.getElementsByName('selectedUsers');
            var selectedUserIds = [];
            for (var i = 0; i < selectedUsers.length; i++) {
                if (selectedUsers[i].checked) {
                    selectedUserIds.push(selectedUsers[i].value);
                }
            }
            if (selectedUserIds.length > 0) {
                if (confirm('선택된 회원을 삭제하시겠습니까?')) {
                    var form = document.createElement('form');
                    form.setAttribute('method', 'post');
                    form.setAttribute('action', '<c:url value="/admin/deleteUser"/>');

                    selectedUserIds.forEach(function(userNo) {
                        var hiddenField = document.createElement('input');
                        hiddenField.setAttribute('type', 'hidden');
                        hiddenField.setAttribute('name', 'userNo');
                        hiddenField.setAttribute('value', userNo);
                        form.appendChild(hiddenField);
                    });

                    document.body.appendChild(form);
                    form.submit();
                }
            } else {
                alert('삭제할 회원을 선택해주세요.');
            }
        }

        function toggleAll(source) {
            var checkboxes = document.getElementsByName('selectedUsers');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }
    </script>
</body>
</html>
