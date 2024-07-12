<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>findId</title>
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
/* 모달 스타일 */
.modal-content {
	background-color: rgba(0, 0, 0, 0.7);
	border: none;
	border-radius: 8px;
	color: white;
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
}

.modal-header .modal-title {
	font-weight: bold;
}

.modal-body {
	padding: 20px;
}

.modal-footer {
	border-top: none;
	text-align: right;
	padding: 10px 20px;
	border-radius: 0 0 8px 8px;
}

.btn-secondary {
	background-color: #6c757d;
	color: #ffffff;
	border: none;
	border-radius: 4px;
	padding: 8px 16px;
}

.btn-secondary:hover {
	background-color: #5a6268;
	color: #ffffff;
}
/* 모달이 항상 최상위에 위치하도록 설정 */
        .modal {
            z-index: 2;
        }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>

	<main>
		<div class="login-bar">
			<!-- form 태그 수정 -->
			<form id="findIdForm">
				<img
					src="https://image-resource.creatie.ai/131184926775412/131184970815644/0767f2c61d3ed3185734ca9bf7712adc.png"
					class="background" />
				<div class="login-container">
					<a href="${contextPath}/"> <img
						src="https://image-resource.creatie.ai/131184926775412/131184970815644/b6328a368ee28caebfb3fbefb8a983dc.png"
						alt="Logo" class="logo" />
					</a> <input type="text" id="userName" name="userName" placeholder="이름"
						required /> <input type="text" id="userEmail" name="userEmail"
						placeholder="가입시 사용한 이메일" required />
					<!-- 버튼 클릭 시 findId 함수 호출 -->
					<button type="button" onclick="findId()">아이디 찾기</button>
					<a href="${contextPath}/user/register">회원가입</a> <a
						href="${contextPath}/user/findPwd">비밀번호 찾기</a>
				</div>
			</form>
		</div>
	</main>

	<!-- 모달 HTML 추가 -->
	<div class="modal fade" id="foundIdModal" tabindex="-1" role="dialog"
		aria-labelledby="foundIdModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="foundIdModalLabel">아이디 찾기 결과</h5>
				</div>
				<div class="modal-body">
					<p id="foundIdMessage"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="closeModal()">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
	
		function findId() {
			const userName = document.getElementById("userName").value;
			const userEmail = document.getElementById("userEmail").value;

			$.ajax({
				url : "${contextPath}/user/findId", // URL이 동적으로 채워지지 않을 경우, 서버에서 적절한 값이 설정되어야 합니다.
				type : 'POST',
				data : {
					userName : userName,
					userEmail : userEmail
				},
				success : function(response) {
					if (response.user && response.user.length > 0) {
						let idsText = "찾은 아이디: ";
						response.user.forEach(function(userId) {
							idsText += userId + ", ";
						});
						idsText = idsText.slice(0, -2); // 마지막 쉼표와 공백 제거
						$("#foundIdMessage").text(idsText);
					} else {
						$("#foundIdMessage").text(
								response.msg || "해당 정보로 등록된 아이디가 없습니다.");
					}
					$("#foundIdModal").fadeIn(300);
				},
				error : function(xhr, status, error) {
					$("#foundIdMessage").text("아이디 찾기 과정에서 오류가 발생했습니다.");
					$("#foundIdModal").fadeIn(300);
				}
			});
		}

		function closeModal() {
			$("#foundIdModal").fadeOut(300);
		}
	</script>


</body>
</html>