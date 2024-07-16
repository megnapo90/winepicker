<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>insertUser</title>
<style>
.insertuser {
	
	margin-left: 30px;
	padding-top: 100px;
	
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

.input input[type="email"] {
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

.modal {
	display: none; /* 기본적으로 숨겨진 상태 */
	position: fixed; /* 위치 고정 */
	z-index: 1; /* 다른 요소들보다 위에 표시 */
	left: 0;
	top: 0;
	width: 100%; /* 전체 너비 */
	height: 100%; /* 전체 높이 */
	overflow: auto; /* 스크롤 가능하도록 */
	background-color: rgba(0, 0, 0, 0.4); /* 배경 투명 검정 */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 모달 창을 화면 중앙에 위치 */
	padding: 20px;
	border: 1px solid #888;
	width: 80%; /* 모달 창 너비 */
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 작은 창 스타일 */
.small-window {
	position: relative;
	display: inline-block;
	margin-top: 10px;
	width: 500px;
	padding: 10px;
	border: 1px solid #ccc;
	background-color: #f9f9f9;
}

.small-window-content {
	max-height: 150px;
	overflow-y: auto;
	font-size: 10px;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:if test="${not empty errorMsg}">
	<script>
		alert(${errorMsg});
	</script>
	<c:remove var="errorMsg"/>
</c:if>
<script>
	function idCheck() {
		const $userId = $("#register input[name=userId]");
		const userIdVal = $userId.val().trim(); // 입력된 아이디 값(trim으로 공백 제거)

		// 아이디가 입력되지 않았을 경우
		if (userIdVal === "") {
			alert("아이디를 입력하세요.");
			$userId.focus(); // 입력 필드에 포커스 맞추기
			return; // 함수 종료
		}
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
	
	function verifyEmail() {
		const inputCode = $("#verificationCode").val();

		$.ajax({
			type : "POST",
			url : "verifyEmail",
			data : {
				inputCode : inputCode

			},
			success : function(response) {
				alert(response.message);
			},
			error : function() {
				alert("오류가 발생하였습니다. 다시 진행해주세요.");				
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
							document
									.getElementById("userPwd")
									.addEventListener("keyup", validatePassword);
						}

						// 비밀번호 확인 입력 필드에 keyup 이벤트 리스너 추가
						if (document.getElementById("userPwdCheck")) {
							document
									.getElementById("userPwdCheck")
									.addEventListener("keyup", validatePassword);
						}
					});
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
				<h2>WINE PICKER 회원가입</h2>

				<div class="input">
					<label for="userId">아이디</label> <input type="text" id="userId"
						name="userId" required>
					<button type="button" onclick="idCheck();">아이디 중복 체크</button>
				</div>

				<div class="input">
					<label for="userPwd">비밀번호</label> <input type="password"
						id="userPwd" name="userPwd" placeholder="영문,숫자 포함 8글자 이상" required>
				</div>

				<div class="input">
					<label for="userPwdCheck">비밀번호 재입력</label> <input type="password"
						id="userPwdCheck" name="userPwdCheck" required> <span
						id="pwdCheckMsg"></span>
				</div>

				<div class="input">
					<label for="userName">이름</label> <input type="text" id="userName"
						name="userName" required>
				</div>
				
				<div class="input">
					<label for="userEmail">이메일</label> <input type="email"
						id="userEmail" name="userEmail" placeholder="example@domain.com"
						required>
					<button type="button" onclick="sendVerificationCode()">인증코드
						전송</button>
				</div>
				<div class="input">
					<label for="verificationCode">인증코드</label> <input type="text"
						id="verificationCode" name="verificationCode" required>
					<button type="button" onclick="verifyEmail()">
						확인</button>	
				</div>

				<div class="input">
					<label for="userSsn">주민등록번호</label> <input type="text"
						id="birthDate" name="birthDate" placeholder="YYMMDD" required>
					- <input type="password" id="ssnTail" name="ssnTail"
						placeholder="뒷자리 7자리 숫자" required pattern="[0-9]{7}"><br>
				</div>
				<div class="input">
					<label for="phone">전화번호</label><input type="tel" id="phone"
						name="phone" placeholder="-포함" required pattern="^01[0-9]-[0-9]{3,4}-[0-9]{4}$">
																			<!-- 전화번호 패턴 추가 -->
				</div>

				<div class="input">
					<label for="address"> 주소</label> <input type="text"
						id="sample6_postcode" placeholder="우편번호" readonly> <input
						type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소" readonly><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소"><br>
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</div>

				<div class="input">
					<label>이용약관 동의</label><br>


					<div class="small-window">
						<div class="small-window-content">
							<h4>이용약관</h4>
							<p>이용약관내용</p>
							<p></p>
						</div>
					</div>
					<br> 이용약관 동의 (필수) <input type="checkbox" id="termsAgreement"
						name="termsAgreement" required>
				</div>


				<div class="small-window">
					<div class="small-window-content">
						<h4>이용약관</h4>
						<p>개인정보 수집 이용 조회 동의 (필수)</p>
						<p></p>
					</div>
				</div>
				<br> 개인정보 수집 이용 조회 동의 (필수)<input type="checkbox"
					id="privacyAgreement" name="privacyAgreement" required>

				<!-- 작은 창 -->


				<div class="input">
					<div>
						<button type="submit" id="submitBtn">회원가입</button>
						<p>${msg}</p>
					</div>
				</div>
			</div>
		<input type="hidden" id="fullAddress" name="address">
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

</body>

</html>