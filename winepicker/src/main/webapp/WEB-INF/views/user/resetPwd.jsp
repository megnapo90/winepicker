<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>
<style>
body {
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
}

.background {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background:
		url('https://image-resource.creatie.ai/131184926775412/131184970815644/0767f2c61d3ed3185734ca9bf7712adc.png')
		no-repeat center center;
	background-size: cover;
	z-index: -1;
}

.login-container {
	background-color: rgba(0, 0, 0, 0.7);
	padding: 20px;
	border-radius: 8px;
	text-align: center;
	color: white;
	width: 300px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.login-container img.logo {
	width: 100px;
	margin-bottom: 20px;
}

.login-container input[type="password"] {
	width: 90%;
	padding: 10px;
	margin: 10px 0;
	border: none;
	border-radius: 4px;
}

.login-container button {
	width: 100%;
	padding: 10px;
	background-color: #444;
	border: none;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}

.login-container a {
	color: white;
	text-decoration: none;
	display: block;
	margin: 10px 0;
}

.login-container a:hover {
	text-decoration: underline;
}

.login-container button:hover {
	background-color: white;
	opacity: 0.7;
	color: black;
}
</style>
</head>
<body>
	<main>
		<div class="login-bar">
			<form id="resetPwdForm" action="${contextPath}/user/resetPwd"
				method="post">
				<img
					src="https://image-resource.creatie.ai/131184926775412/131184970815644/0767f2c61d3ed3185734ca9bf7712adc.png"
					class="background" />
				<div class="login-container">
					<a href="${contextPath}/"> 
					<img
						src="https://image-resource.creatie.ai/131184926775412/131184970815644/b6328a368ee28caebfb3fbefb8a983dc.png"
						alt="Logo" class="logo" />
					</a> <input type="hidden" id="userId" name="userId"
						value="${param.userId}" /> <input type="password" id="newPwd"
						name="newPwd" placeholder="새 비밀번호 입력" required /> <input
						type="password" id="confirmPwd" name="confirmPwd"
						placeholder="새 비밀번호 확인" required />
					<button type="button" onclick="submitForm()">비밀번호 변경</button>
				</div>
			</form>
		</div>
	</main>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		function submitForm() {
			var newPassword = document.getElementById("newPwd").value;
			var confirmPwd = document.getElementById("confirmPwd").value;

			// 비밀번호 확인
			if (newPassword !== confirmPwd) {
				alert("입력한 비밀번호가 일치하지 않습니다.");
				return;
			}

			// 비밀번호 유효성 검사
			if (!validateNewPassword(newPassword)) {
				alert("새 비밀번호는 영문자와 숫자를 포함하여 8글자 이상이어야 합니다.");
				return;
			}

			// Form submit
			document.getElementById("resetPwdForm").submit();
		}

		function validateNewPassword(pwd) {
			var pattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; // 영문자와 숫자 포함 8글자 이상
			return pattern.test(pwd);
		}
	</script>
</body>
</html>
