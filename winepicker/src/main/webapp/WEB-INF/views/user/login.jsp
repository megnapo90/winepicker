<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login</title>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.loginbar {
	width: 100%;
	height: 100%;
	border-radius: 6px;
	background: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0.12);
}

.login-bar {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: auto;
	overflow: hidden;
	background: #282934;
}

.input {
	position: fixed;
	top: 214px;
	left: 0px;
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

.frame {
	position: relative;
	max-width: 414px;
	border-radius: 6px;
	text-align: center;
	display: flex;
}

.logo {
	position: absolute;
	top: 11px;
	left: 168px;
	width: 78px;
	height: 69px;
	object-fit: cover;
}

.back {
	width: 100%;
	height: 455px;
	background: rgba(255, 255, 255, 0.1);
}

.inputId {
	position: absolute;
	top: 95px;
	left: 59px;
	width: 295px;
	height: 44px;
}

.inputPwd {
	position: absolute;
	top: 180px;
	left: 59px;
	width: 295px;
	height: 45px;
}

.inputId input, .inputPwd input {
	width: calc(100% - 20px);
	height: 100%;
	font-size: 16px;
	padding: 0 10px;
	outline: none;
}

.login {
	position: absolute;
	top: 274px;
	left: 168px;
	width: 78px;
	height: 33px;
	color: white;
	font-family: "Water Brush";
	font-size: 20px;
	line-height: 29px;
	font-weight: 400;
	text-align: center;
	background: none;
	border: none;
}

.findId {
	position: absolute;
	top: 330px;
	left: 59px;
	width: 128px;
	height: 29px;
	color: white;
	font-family: "Water Brush";
	font-size: 20px;
	line-height: 30px;
	font-weight: 400;
	text-align: center;
}

.register {
	position: absolute;
	top: 382px;
	left: 99px;
	width: 228px;
	height: 59px;
	color: white;
	font-family: "Water Brush";
	font-size: 30px;
	line-height: 30px;
	font-weight: 400;
	letter-spacing: 10px;
	text-align: center;
}

.findPwd {
	position: absolute;
	top: 330px;
	left: 226px;
	width: 128px;
	height: 29px;
	color: white;
	font-family: "Water Brush";
	font-size: 20px;
	line-height: 30px;
	font-weight: 400;
	text-align: center;
}
</style>

<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	</header>
	<main>

		<div class="login-bar">
			<form action="${pageContext.request.contextPath}/user/login"
				method="post">
				<img
					src="https://image-resource.creatie.ai/131184926775412/131184970815644/0767f2c61d3ed3185734ca9bf7712adc.png"
					class="input" />
				<div class="mainFrame">
					<div class="frame">
						<img
							src="https://image-resource.creatie.ai/131184926775412/131184970815644/b6328a368ee28caebfb3fbefb8a983dc.png"
							class="logo" />
						<div class="back"></div>
						<div class="inputId">
							<input type="text" id="userId" name="userId"
								placeholder="아이디를 입력하세요" required />
						</div>
						<div class="inputPwd">
							<input type="password" id="userPwd" name="userPwd"
								placeholder="비밀번호를 입력하세요" required />
						</div>
						<div class="input"></div>
						<button type="submit" class=login>로그인</button>
						<a href="${contextPath}/user/findId" class="findId">아이디 찾기</a> <a
							href="${contextPath}/user/register" class="register">회원가입</a> <a
							href="${contextPath}/user/findPwd" class="findPwd">비밀번호 찾기</a>
					</div>
				</div>
			</form>

		</div>
	</main>

	<footer> </footer>
	<script>
        import "./global.scss";
        import {
            ref,
            computed,
            reactive
        } from 'vue';
        const props = defineProps({
        });

    </script>
</body>


</html>