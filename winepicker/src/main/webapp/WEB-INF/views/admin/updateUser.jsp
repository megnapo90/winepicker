<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
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
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group input[type="radio"], .form-group input[type="checkbox"] {
            width: auto;
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
        .error {
            color: red;
            margin-top: -10px;
            margin-bottom: 10px;
        }
        .success {
            color: green;
            margin-top: -10px;
            margin-bottom: 10px;
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
            <h2>내 정보 변경</h2>
            <form id="modifyForm" action="${pageContext.request.contextPath}/admin/modifyUser" method="post">
                <input type="hidden" name="userNo" value="${user.userNo}">
                <div class="form-group">
                    <label for="userId">아이디</label>
                    <input type="text" id="userId" name="userId" value="${user.userId}" readonly>
                </div>
                <div class="form-group">
                    <label for="userPwd">비밀번호</label>
                    <input type="password" id="userPwd" name="userPwd" required>
                </div>
                <div class="form-group">
                    <label for="userPwdConfirm">비밀번호 확인</label>
                    <input type="password" id="userPwdConfirm" name="userPwdConfirm" required>
                    <div id="passwordMatch" class="error" style="display:none;">비밀번호가 일치하지 않습니다.</div>
                    <br>
                    <div id="passwordMatchSuccess" class="success" style="display:none;">비밀번호가 일치합니다.</div>
                </div>
                <div class="form-group">
                    <label for="userName">이름</label>
                    <input type="text" id="userName" name="userName" value="${user.userName}" required>
                </div>
                <div class="form-group">
                    <label for="userSsn">주민등록번호</label>
                    <input type="text" id="userSsn" name="userSsn" value="${user.userSsn}" required>
                </div>
                <div class="form-group">
                    <label for="phone">전화번호</label>
                    <input type="text" id="phone" name="phone" value="${user.phone}" required>
                </div>
                <div class="form-group">
                    <label for="userEmail">이메일</label>
                    <input type="email" id="userEmail" name="userEmail" value="${user.userEmail}" required>
                </div>
                <div class="form-group">
                    <label for="address">주소</label>
                    <input type="text" id="address" name="address" value="${user.address}" required>
                </div>
                <button type="button" onclick="modifyUser()">수정하기</button>
            </form>
        </div>
    </div>
    
</div>      
    
    
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function modifyUser() {
            // 비밀번호 확인 체크
            if ($('#userPwd').val() !== $('#userPwdConfirm').val()) {
                $('#passwordMatch').show();
                $('#passwordMatchSuccess').hide();
                return;
            }

            // 데이터 준비
            var formData = $('#modifyForm').serialize();

            // AJAX 요청
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/admin/modifyUser',
                data: formData,
                success: function(response) {
                    // 성공 시 팝업으로 알림
                    alert('회원 정보가 성공적으로 수정되었습니다.');

                    // userList.jsp로 이동
                    window.location.href = '${pageContext.request.contextPath}/admin/userList';
                },
                error: function(xhr, status, error) {
                    // 실패 시 팝업으로 알림
                    alert('회원 정보 수정 중 오류가 발생했습니다. 다시 시도해주세요.');
                }
            });
        }
    </script>
</body>
</html>
