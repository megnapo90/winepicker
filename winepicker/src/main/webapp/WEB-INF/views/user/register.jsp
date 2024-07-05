<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>insertUser</title>
<style>
.insertuser {
	margin-left: 30px;
	padding-top: 300px;
}

.insertuser .input label {
	display: block;
	margin-top: 30px;
}

.insertuser .input input[type="radio"] {
	margin-top: px;
	margin-right: 5px;
}

.insertuser .input button {
	padding: 8px 12px;
	background-color: #007bff;
	border: none;
	color: white;
	border-radius: 4px;
	cursor: pointer;
}

.insertuser .input button[type="submit"] {
	padding: 8px 50px;
	background-color: #5E5E5E;
	border: none;
	color: white;
	cursor: pointer;
	border-radius: 0px;
}

.insertuser .input button:hover {
	background-color: #0256af;
}

.insertuser .input button:hover[type="submit"] {
	background-color: #000000;
	opacity: 0.8;
}

.insertuser .input button:active {
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

.input input[id="userEmail"] {
	width: 250px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.input input[type="password"] {
	width: 200px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.input input[id="phone"] {
	width: 100px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.input input[id="address"], .input input[id="addressDetail"] {
	width: 500px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.insertuser .input select[name=national] {
	width: 100px;
	padding: 8px;
	margin-top: 3px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.insertuser .input select[name=userEmail] {
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function idCheck() {
		const $userId = $("#register input[name=userId]");
		$.ajax({
			url : "idCheck",
			data : {
				userId : $userId.val()
			},
			success : function(result) {
				console.log(result);
				if (result == 1) { // 이미 사용중인
					alert("이미 사용중인 아이디입니다.");
					$userId.val("");
					$userId.focus();
				} else { // 사용안함
					alert("사용가능한 아이디입니다.");

				}
			}
		})

	}
</script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		// 비밀번호 일치 검사
		function validatePassword() {
			var pwd = document.getElementById("userPwd").value;
			var pwdCheck = document.getElementById("userPwdCheck").value;

			if (pwd === pwdCheck) {
				document.getElementById("pwdCheckMsg").innerHTML = "✔";
				document.getElementById("pwdCheckMsg").style.color = "green";
			} else {
				document.getElementById("pwdCheckMsg").innerHTML = "✘";
				document.getElementById("pwdCheckMsg").style.color = "red";
			}
		}

		// 비밀번호 확인 input 요소에 keyup 이벤트 리스너 추가
		if (document.getElementById("userPwdCheck")) {
			document.getElementById("userPwdCheck").addEventListener("keyup",
					validatePassword);
		}
	});
</script>

<script>
	function checkEmail() {
		const userEmail = document.getElementById("userEmail").value;

		if (userEmail.trim() === "") {
			alert("이메일을 입력하세요.");
			return;
		}

		$.ajax({
			url : '${pageContext.request.contextPath}/userEmailCheck.do',
			type : 'POST',
			data : {
				userEmail : userEmail
			},
			success : function(response) {
				if (response === 'available') {
					$('#userEmailCheckMsg').text('사용 가능한 이메일입니다.').addClass(
							'valid').removeClass('invalid');
				} else {
					$('#userEmailCheckMsg').text('이미 사용 중인 이메일입니다.').addClass(
							'invalid').removeClass('valid');
				}

				alert("이메일 인증이 완료되었습니다: " + userEmail);
			},
			error : function(xhr, status, error) {
				console.error("AJAX 요청 중 오류 발생:", error);
				alert("이메일 인증 중 오류가 발생했습니다.");
			}
		});
	}
</script>

</head>

<body>
	<header>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	</header>
	<main>
		<form id="register" action="${contextPath}/user/insertUser"
			method="post">


			<div class="insertuser">
				<h2 align="margin-right">WINE PICKER 회원가입</h2>

				<div class="input">
					<label for="userId">* 아이디</label> <input type="text" id="userId"
						name="userId" required>
					<button type="button" onclick="idCheck();">아이디 중복 체크</button>
					<span id="idCheckMsg"></span>
				</div>

				<div class="input">
					<label for="userPwd">* 비밀번호</label> <input type="password"
						id="userPwd" name="userPwd" required>
				</div>

				<div class="input">
					<label for="userPwdCheck">* 비밀번호 재입력</label> <input type="password"
						id="userPwdCheck" name="userPwdCheck" required> <span
						id="pwdCheckMsg"></span>
				</div>

				<div class="input">
					<label for="userName">* 이름</label> <input type="text" id="userName"
						name="userName" required>
				</div>
				<br> <label for="userEmail">이메일:</label><br> <input
					type="email" id="userEmail" name="userEmail" required><br>
				<br> <label for="userSsn">주민등록번호:</label><br> <input
					type="text" id="userSsn" name="userSsn" required><br>
				<br> <label for="phone">전화번호:</label><br> <input
					type="tel" id="phone" name="phone" required><br> <br>

				<div class="input">
					<label for="address">* 주소</label>
					<input type="text" id = "address" placeHolder = "주소">					
					 <input type="text"
						id="sample6_postcode" placeholder="우편번호"> <input
						type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</div>
				<div class="input">
					<label></label>
					<div align="margin-right">
						<button type="submit">회원가입</button>
						<p>${msg}</p>
					</div>
				</div>
			</div>
		</form>

	</main>



	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
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
	</script>

</body>

</html>