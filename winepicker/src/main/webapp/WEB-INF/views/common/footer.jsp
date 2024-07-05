<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
#footer {
	top: 1080px;

    position: relative;
    width: 100%;
    height: 185px;
    opacity: 1;
    background: #282934;
    bottom: 0;
}

#logo {
    position: absolute;
    left: 10%;
    top: 23%;
    width: 274px;
    height: 39px;
    opacity: 1;
}

.wine-explore-title {
    position: absolute;
    left: 43%;
    top: 27%;
    width: 117px;
    height: 23px;
    opacity: 1;
    font-size: 18px;
    font-weight: normal;
    line-height: normal;
    color: #FFFFFF;
}

.wine-explore-list {
    position: absolute;
    left: 43%;
    top: 42%;
    width: 82px;
    height: 57px;
    opacity: 1;
    font-size: 14px;
    font-weight: normal;
    line-height: normal;
    color: #FFFFFF;
}

.wine-explore-list {
    list-style: none;
    padding: 0;
}

.wine-explore-list li {
    display: block;
}

.wine-explore-list li a {
    text-decoration: none;
    color: #FFFFFF;
}

.wine-explore-list li a:hover {
    color: #FF6347;
}

.customer-service-title {
    position: absolute;
    left: 53%;
    top: 27%;
    width: 117px;
    height: 23px;
    opacity: 1;
    font-size: 18px;
    font-weight: normal;
    line-height: normal;
    color: #FFFFFF;
}

.customer-service-list {
    position: absolute;
    left: 53%;
    top: 42%;
    width: 82px;
    height: 57px;
    opacity: 1;
    font-size: 14px;
    font-weight: normal;
    line-height: normal;
    color: #FFFFFF;
}

.customer-service-list {
    list-style: none;
    padding: 0;
}

.customer-service-list {
    display: block;
}

.customer-service-list li a {
    text-decoration: none;
    color: #FFFFFF;
}

.customer-service-list li a:hover {
    color: #FF6347;
}

#p1 {
    position: absolute;
    left: 10%;
    top: 45%;
    width: 284px;
    height: 100px;
    opacity: 1;
    font-size: 14px;
    font-weight: normal;
    line-height: normal;
    color: #FFFFFF;
}

#p2 {
    position: absolute;
    top: 79%;
    width: 100%;
    height: 24px;
    opacity: 1;
    font-size: 16px;
    font-weight: normal;
    line-height: normal;
    color: #FFFFFF;
    text-align: center;
}

.contact-us-title {
    position: absolute;
    left: 85%;
    top: 20%;
    width: 203px;
    height: 56px;
    opacity: 1;
    font-size: 18px;
    font-weight: normal;
    line-height: normal;
    color: #FFFFFF;
}

.contact-us-details {
    position: absolute;
    left: 85%;
    top: 45%;
    width: 203px;
    height: 17px;
    font-family: Inter;
    font-size: 14px;
    font-weight: normal;
    line-height: normal;
    color: #FFFFFF;
}

.policy-links {
    position: absolute;
    left: 85%;
    top: 66%;
    width: 173px;
    height: 20px;
    font-size: 12px;
    color: #FFFFFF;
}

.policy-links>a {
    font-family: Inter;
    font-size: 12px;
    font-weight: normal;
    line-height: normal;
    color: #FFFFFF;
}
</style>
</head>

<body>

	<div id="footer">
		<p id="logo">
			<img src="${contextPath}/resources/common/slogo.png" alt="Company Logo">
		</p>

		<p id="p1">
			상호 : 와인 피커 | 대표 : 홍길동<br>등록번호 : 123-12-123456<br>주소 : 서울특별시
			강남구 테헤란로 123-1
		</p>


		<p class="wine-explore-title">와인 둘러보기</p>
		<ul class="wine-explore-list">
			<li><a href="link_to_red_wine">Red</a></li>
			<li><a href="link_to_white_wine">White</a></li>
			<li><a href="link_to_Sparkling_wine">Sparkling</a></li>
		</ul>



		<p class="customer-service-title">고객센터</p>
		<ul class="customer-service-list">
			<li><a href="link_to_FAQ">FAQ</a></li>
			<li><a href="${contextPath}/admin/notice">공지사항</a></li>
			<li><a href="link_to_QNA">1:1 문의</a></li>
		</ul>

		<p class="contact-us-title">Contact us</p>
		<p class="contact-us-details">
			Email : <a href="mailto:admin@winepicker.com">admin@winepicker.com</a>
		</p>

		<p class="policy-links">
			<a href="link_to_terms">이용약관</a> | <a href="link_to_privacy">개인정보취급방침</a>
		</p>



		<P id="p2">Copyright ⓒ WinePicker. All right reserved.</P>

	</div>


</body>
</html>