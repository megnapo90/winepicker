<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>registerSuccess</title>
</head>
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

.login-container input[type="text"], .login-container input[type="password"]
	{
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>

	<main>
		<div class="login-bar">

			<form id="findIdForm">
				<img
					src="https://image-resource.creatie.ai/131184926775412/131184970815644/0767f2c61d3ed3185734ca9bf7712adc.png"
					class="background" />
				<div class="login-container">
					<a href="${contextPath}/"> <img
						src="https://image-resource.creatie.ai/131184926775412/131184970815644/b6328a368ee28caebfb3fbefb8a983dc.png"
						alt="Logo" class="logo" />
					</a>
					<h3>회원가입이 완료되었습니다!</h3>

					<p>
						<a href="${pageContext.request.contextPath}/user/loginPage">로그인
							페이지로 이동하기</a>
					</p>
			</form>
		</div>
	</main>
</body>
</html>