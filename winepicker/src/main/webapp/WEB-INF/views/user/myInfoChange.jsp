<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보변경</title>
<link rel="stylesheet" href="${contextPath}/resources/css/userCommon.css">

<style>
/* 공통 스타일 */
body {
	margin: 0;
	padding: 0;
}

header {
	color: white;
	text-align: center;
}

.main-content {
	display: flex;
	flex-direction: column;
	min-height: 100vh; /* 최소 높이를 화면 높이와 같게 설정 */
}

.user-common {
	
	padding: 20px;
	width: 300px;
	font-weight: bold;
}

.main-section {
	display: flex;
	flex: 1; /* 남은 공간을 모두 차지 */
}

.page-name {
	font-size: 24px;
	font-weight: bold;
}

.content {
	flex: 1;
}
/* 공통 스타일 */ 
.myInfoChange {
	margin-left: 30px;
	margin-top: 60px;
	padding-bottom: 200px;
}

.myInfoChange .input label {
	display: block;
	margin-top: 30px;
}

.myInfoChange .input input[type="radio"] {
	margin-top: px;
	margin-right: 5px;
}

.myInfoChange .input button {
	padding: 8px 12px;
	background-color: #007bff;
	border: none;
	color: white;
	border-radius: 4px;
	cursor: pointer;
}

.myInfoChange .input button[type="submit"] {
	padding: 8px 50px;
	background-color: #5E5E5E;
	border: none;
	color: white;
	cursor: pointer;
	border-radius: 0px;
}

.myInfoChange .input button:hover {
	background-color: #0256af;
}

.myInfoChange .input button:hover[type="submit"] {
	background-color: #000000;
	opacity: 0.8;
}

.myInfoChange .input button:active {
	background-color: #000000;
	transform: translateY(1px);
}

.input input[type="text"] {
	width: 150px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.input input[type="userSsn"] {
	width: 150px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.input input[type="userEmail"] {
	width: 250px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.input input[type="password"] {
	width: 250px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.input input[id="phone"] {
	width: 250px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.input input[id="address"], .input input[id="sample6_address"], .input input[id="sample6_detailAddress"],
	.input input[id="sample6_extraAddress"] {
	width: 500px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.myInfoChange .input select[name=national] {
	width: 100px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.myInfoChange .input select[name=userEmail] {
	width: 250px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

#idCheckMsg {
	font-family: 'Arial', sans-serif;
	font-size: 10px;
}
</style>
</head>
<body>
	
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	</header>
	<div class="main-content">
		<div class="user-common">
			<jsp:include page="/WEB-INF/views/common/userCommon.jsp" />
		</div>
		
		<div class="main-section">
		
		<div class="page-name">내정보 변경</div>
	
	<div class="content">
		<main>
			<form id="change" action="${contextPath}/user/myInfoChange"
				method="post">
				<div class="myInfoChange">
					<div class="input">
						<label for="userId">아이디</label> <input type="text" id="userId"
							name="userId" value="${loginUser.userId }" readonly>
					</div>

					<div class="input">
						<label for="userPwd">비밀번호</label> <input type="password"
							id="userPwd" name="userPwd" placeholder="영문,숫자 포함 8글자 이상"
							required>
					</div>

					<div class="input">
						<label for="userPwdCheck">비밀번호 재입력</label> <input type="password"
							id="userPwdCheck" name="userPwdCheck" required> <span
							id="pwdCheckMsg"></span>
					</div>

					<div class="input">
						<label for="userName">이름</label> <input type="text" id="userName"
							name="userName" value="${loginUser.userName }" readonly>
					</div>
					<div class="input">
						<label for="userEmail">이메일</label> <input type="userEmail"
							id="userEmail" name="userEmail" value="${loginUser.userEmail }"
							required>
						<button type="button" onclick="sendVerificationCode()">인증코드
							전송</button>
						<label for="verificationCode">인증코드</label> <input type="text"
							id="verificationCode" name="verificationCode" required><br>
					</div>


					<div class="input">
						<label for="userSsn">주민등록번호</label> <input type="text"
							id="birthDate" name="birthDate"
							value="${loginUser.userSsn.substring(0, 6)}" readonly> -
						<input type="text" id="ssnTail" name="ssnTail" value="*******"
							readonly> <br>
					</div>
					<div class="input">
						<label for="phone">전화번호</label><input type="tel" id="phone"
							name="phone" value="${loginUser.phone }" required>
					</div>

					<div class="input">
						<label for="address"> 주소</label> <input type="text"
							id="sample6_postcode" placeholder="우편번호" readonly> <input
							type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address"
							value="${loginUser.address }" readonly><br> <input
							type="text" id="sample6_detailAddress"><br> <input
							type="text" id="sample6_extraAddress">
					</div>
					<div class="input">
						<label></label>
						<div align="margin-right">
							<button type="submit">내 정보 수정</button>
							<p>${msg}</p>
						</div>
					</div>
					</div>
			</form>
			<input type="hidden" id="fullAddress" name="address">


		</main>
	</div>
	</div>
	</div>
	
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
		document
				.querySelector('form')
				.addEventListener(
						'submit',
						function(event) {
							var postcode = document
									.getElementById('sample6_postcode').value;
							var address = document
									.getElementById('sample6_address').value;
							var detailAddress = document
									.getElementById('sample6_detailAddress').value;
							var extraAddress = document
									.getElementById('sample6_extraAddress').value;

							var fullAddress = postcode + '' + address + ''
									+ detailAddress + '' + extraAddress;
							document.getElementById('fullAddress').value = fullAddress;
						});
	</script>
	<script>
		function sendVerificationCode() {
			const userEmail = $("#userEmail").val();

			$.ajax({
				type : "POST",
				url : "sendVerificationCode",
				data : {
					userEmail : userEmail

				},
				success : function(response) {
					alert("인증 코드가 이메일로 전송되었습니다. 이메일을 확인해주세요.");
				},
				error : function() {
					alert("인증 코드 전송에 실패하였습니다. 다시 시도해주세요.");
				}
			});
		}
	</script>
	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							// 비밀번호 일치 및 패턴 검사
							function validatePassword() {
								var pwd = document.getElementById("userPwd").value;
								var pwdCheck = document
										.getElementById("userPwdCheck").value;
								var submitButton = document
										.getElementById("submitBtn");
								var pattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; // 영문자와 숫자 포함 8글자 이상

								if (pwd === pwdCheck && pattern.test(pwd)) {
									document.getElementById("pwdCheckMsg").innerHTML = "✔";
									document.getElementById("pwdCheckMsg").style.color = "green";
									submitButton.disabled = false; // 제출 버튼 활성화
								} else {
									document.getElementById("pwdCheckMsg").innerHTML = "비밀번호는 영문자와 숫자를 포함하여 8글자 이상이어야 합니다.";
									document.getElementById("pwdCheckMsg").style.color = "red";
									submitButton.disabled = true; // 제출 버튼 비활성화
								}
							}

							// 비밀번호 입력 필드에 keyup 이벤트 리스너 추가
							if (document.getElementById("userPwd")) {
								document.getElementById("userPwd")
										.addEventListener("keyup",
												validatePassword);
							}

							// 비밀번호 확인 입력 필드에 keyup 이벤트 리스너 추가
							if (document.getElementById("userPwdCheck")) {
								document.getElementById("userPwdCheck")
										.addEventListener("keyup",
												validatePassword);
							}
						});
	</script>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
	

</body>
</html>