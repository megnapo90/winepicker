<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의사항 등록</title>
<style>
.mypageonebyoneinput {
  width: 1440px;
  height: 1668px;
  border-radius: 6px;
  background: #FFFFFF;
  border: 1px solid rgba(0, 0, 0, 0.12);
}
.mypageonebyoneinput .mypageonebyoneinput-1 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 1440px;
  height: 1668px;
  overflow: hidden;
  background: #FFFFFF;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .text- {
  position: absolute;
  top: 268px;
  left: 69px;
  width: 315px;
  height: 77px;
  color: #000000;
  font-family: "Oranienbaum";
  font-size: 60px;
  line-height: 69px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-22 {
  position: absolute;
  top: 359px;
  left: 69px;
  width: 219px;
  height: 46px;
  overflow: hidden;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-22 .text-- {
  position: absolute;
  top: 12px;
  left: 10px;
  width: 200px;
  height: 23px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .text---1 {
  position: absolute;
  top: 439px;
  left: 288px;
  width: 247px;
  height: 40px;
  color: #3D3D3D;
  font-family: "Oranienbaum";
  font-size: 35px;
  line-height: 40px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .line-5 {
  position: absolute;
  top: 419px;
  left: 69px;
  width: 1306px;
  border: 1px solid rgba(0, 0, 0, 0.5);
}
.mypageonebyoneinput .mypageonebyoneinput-1 .line-6 {
  position: absolute;
  top: 498px;
  left: 288px;
  width: 1083px;
  border: 1px solid rgba(0, 0, 0, 0.5);
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-25 {
  position: absolute;
  top: 545px;
  left: 288px;
  width: 1076px;
  height: 65px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-25 .rectangle-39 {
  position: absolute;
  top: 10px;
  left: 6px;
  width: 195px;
  height: 45px;
  background: #5E5E5E;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-25 .faq {
  position: absolute;
  top: 14px;
  left: 76px;
  width: 55px;
  height: 38px;
  color: #FFFFFF;
  font-family: "Noto Serif Gurmukhi";
  font-size: 25px;
  line-height: 36px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-25 .rectangle-40 {
  position: absolute;
  top: 10px;
  left: 212px;
  width: 195px;
  height: 45px;
  background: #D0D0D0;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-25 .text-11 {
  position: absolute;
  top: 17px;
  left: 249px;
  width: 121px;
  height: 38px;
  color: #FFFFFF;
  font-family: "Noto Serif Gurmukhi";
  font-size: 25px;
  line-height: 36px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-25 .rectangle-41 {
  position: absolute;
  top: 10px;
  left: 645px;
  width: 431px;
  height: 45px;
  background: #D0D0D0;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-25 .text---- {
  position: absolute;
  top: 14px;
  left: 671px;
  width: 379px;
  height: 38px;
  color: #FFFFFF;
  font-family: "Noto Serif Gurmukhi";
  font-size: 25px;
  line-height: 36px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 {
  position: absolute;
  top: 657px;
  left: 288px;
  width: 1076px;
  height: 828px;
  /* overflow: hidden; */
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-27 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 1076px;
  height: 65px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-27 .frame-29 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 387px;
  height: 65px;
  overflow: hidden;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-27 .frame-29 .text-11- {
  position: absolute;
  top: 11px;
  left: 19px;
  width: 276px;
  height: 44px;
  color: #3D3D3D;
  font-family: "Alike Angular";
  font-size: 35px;
  line-height: 44px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 {
  position: absolute;
  top: 65px;
  left: 0px;
  width: 1076px;
  height: 504px;
  /* overflow: hidden; */
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 {
  position: absolute;
  top: 15px;
  left: 0px;
  width: 1076px;
  height: 434px;
  overflow: hidden;
  border: 0px solid rgba(0, 0, 0, 0.5);
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .text--1 {
  position: absolute;
  top: 34px;
  left: 68px;
  width: 33px;
  height: 20px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 17px;
  line-height: 20px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .text--2 {
  position: absolute;
  top: 150px;
  left: 69px;
  width: 33px;
  height: 20px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 17px;
  line-height: 20px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .text---2 {
  position: absolute;
  top: 304px;
  left: 69px;
  width: 74px;
  height: 20px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 17px;
  line-height: 20px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .frame-40 {
  position: absolute;
  top: 29px;
  left: 166px;
  width: 779px;
  height: 295px;
  overflow: hidden;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .frame-40 .frame-41 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 779px;
  height: 29px;
  overflow: hidden;
  border: 1px solid #000000;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .frame-40 .frame-41 .text---3 {
  position: absolute;
  top: 7px;
  left: 13px;
  width: 61px;
  height: 16px;
  color: rgba(61, 61, 61, 0.5);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 14px;
  line-height: 16px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .frame-40 .frame-42 {
  position: absolute;
  top: 57px;
  left: 0px;
  width: 779px;
  height: 188px;
  overflow: hidden;
  border: 1px solid #000000;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .frame-40 .frame-42 .text--- {
  position: absolute;
  top: 11px;
  left: 12px;
  width: 70px;
  height: 16px;
  color: rgba(61, 61, 61, 0.5);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 14px;
  line-height: 16px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .frame-40 .frame-43 {
  position: absolute;
  top: 266px;
  left: 0px;
  width: 779px;
  height: 29px;
  overflow: hidden;
  border: 1px solid #000000;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .rectangle-42 {
  position: absolute;
  top: 295px;
  left: 959px;
  width: 64px;
  height: 29px;
  background: #5E5E5E;
}

.mypageonebyoneinput .mypageonebyoneinput-1 .frame-26 .frame-30 .frame-31 .text--3 {
  position: absolute;
  top: 302px;
  left: 974px;
  width: 35px;
  height: 22px;
  color: #FFFFFF;
  font-family: "Oranienbaum";
  font-size: 17px;
  line-height: 20px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-30 .askEnroll {
  position: absolute;
  top: 520px;
  left: 916px;
  width: 75px;
  height: 40px;
}

.askEnroll>#formSubmit{
	width : 100%;
	height : 100%;
	background: #5E5E5E;
	color: #ffffff;
}





.mypageonebyoneinput .mypageonebyoneinput-1 .frame-30 .text--4 {
  position: absolute;
  top: 599px;
  left: 921px;
  width: 65px;
  height: 15px;
  color: #FFFFFF;
  font-family: "Oranienbaum";
  font-size: 18px;
  line-height: 21px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}

.mypageonebyoneinput .mypageonebyoneinput-1 .frame-20 {
  position: absolute;
  top: 498px;
  left: 69px;
  width: 164px;
  height: 825px;
  overflow: hidden;
  background: linear-gradient(0deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0.2) 100%), linear-gradient(180deg, #eecccc 15%, rgba(255, 255, 255, 0) 100%);
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-20 .text--5 {
  position: absolute;
  top: 431px;
  left: 41px;
  width: 87px;
  height: 23px;
  color: rgba(0, 0, 0, 0.6);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-20 .text---4 {
  position: absolute;
  top: 352px;
  left: 40px;
  width: 87px;
  height: 23px;
  color: #2B0000;
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-20 .text----1 {
  position: absolute;
  top: 308px;
  left: 25px;
  width: 114px;
  height: 23px;
  color: rgba(0, 0, 0, 0.6);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-20 .text---5 {
  position: absolute;
  top: 229px;
  left: 39px;
  width: 87px;
  height: 23px;
  color: rgba(0, 0, 0, 0.6);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-20 .text----2 {
  position: absolute;
  top: 185px;
  left: 26px;
  width: 114px;
  height: 23px;
  color: rgba(0, 0, 0, 0.6);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-20 .text---6 {
  position: absolute;
  top: 106px;
  left: 39px;
  width: 87px;
  height: 23px;
  color: rgba(0, 0, 0, 0.6);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .frame-20 .text----3 {
  position: absolute;
  top: 62px;
  left: 15px;
  width: 134px;
  height: 23px;
  color: rgba(0, 0, 0, 0.6);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 1440px;
  height: 210px;
  overflow: hidden;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .rectangle--2 {
  position: absolute;
  top: -4px;
  left: 0px;
  width: 1440px;
  height: 156px;
  background: url(https://image-resource.creatie.ai/131184926775412/131184970815644/2892ec27424cc49e7c97067577ba1b8e.png);
  object-fit: cover;
  background-repeat: no-repeat;
  background-size: 1440px 160.33px;
  background-position: 0px 2.67px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .rectangle-25 {
  position: absolute;
  top: 152px;
  left: 0px;
  width: 1440px;
  height: 58px;
  background: #84515F;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .shopping-bag-2-fill {
  position: absolute;
  top: 18px;
  left: 1385px;
  width: 31px;
  height: 30px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .user-3-fill {
  position: absolute;
  top: 18px;
  left: 1302px;
  width: 30px;
  height: 30px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .frame-67 {
  position: absolute;
  top: 152px;
  left: 0px;
  width: 720px;
  height: 58px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: #FFFFFF;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .frame-67 .text--6 {
  position: absolute;
  top: 9px;
  left: 259px;
  width: 216px;
  height: 41px;
  color: #FFFFFF;
  font-family: "Inter";
  font-size: 30px;
  line-height: 36px;
  font-weight: 400;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .frame-68 {
  position: absolute;
  top: 153px;
  left: 720px;
  width: 720px;
  height: 58px;
  overflow: hidden;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .frame-68 .text--7 {
  position: absolute;
  top: 8px;
  left: 247px;
  width: 216px;
  height: 41px;
  color: #FFFFFF;
  font-family: "Inter";
  font-size: 30px;
  line-height: 36px;
  font-weight: 400;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .kakaotalk-20240627-210722285 {
  position: absolute;
  top: 4px;
  left: 649px;
  width: 142px;
  height: 141px;
  background: url(https://image-resource.creatie.ai/131184926775412/131184970815644/9807466d9fc7c804bee814979ae75873.png);
  object-fit: cover;
  background-repeat: no-repeat;
  background-size: 142px 181.89px;
  background-position: 0px -23.51px;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .path-2 {
  position: absolute;
  top: 10%;
  left: 93.75%;
  right: 4.86%;
  bottom: 78.1%;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .picker {
  position: absolute;
  top: 28px;
  left: 806px;
  width: 365px;
  height: 92px;
  color: #FFFFFF;
  white-space: nowrap;
  font-family: "Judson";
  font-size: 80px;
  line-height: 92px;
  font-weight: 400;
  letter-spacing: 30px;
  text-align: center;
}
.mypageonebyoneinput .mypageonebyoneinput-1 .mainloginbar .wine {
  position: absolute;
  top: 28px;
  left: 379px;
  width: 255px;
  height: 92px;
  color: #FFFFFF;
  white-space: nowrap;
  font-family: "Judson";
  font-size: 80px;
  line-height: 92px;
  font-weight: 400;
  letter-spacing: 30px;
  text-align: center;
}


</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div>
    <div class="mypageonebyoneinput">
        <div class="mypageonebyoneinput-1">
            <div class="text-">
                마이페이지
            </div>
            <div class="frame-22">
                <div class="text--">
                    ${loginUser.userName } 님, 환영합니다.
                </div>
            </div>
            <div class="text---1">
                고객 센터
            </div>
            <div class="line-5">
            </div>
            <div class="line-6">
            </div>
            <div class="frame-25">
                <div class="rectangle-39">
                </div>
                <div class="faq">
                    FAQ
                </div>
                <div class="rectangle-40">
                </div>
                <div class="text-11">
                    1:1문의
                </div>
                <div class="rectangle-41">
                </div>
                <div class="text----">
                    이용약관 및 개인정보처리 방침
                </div>
            </div>
            <div class="frame-26">
                <div class="frame-27">
                    <div class="frame-29">
                        <div class="text-11-">
                            1:1 문의작성
                        </div>
                    </div>
                </div>
                <div class="frame-30">
                	<form action="${contextPath}/ask/askInsert" id="enrollForm" method="post" enctype="multipart/form-data">
                    <div class="frame-31">
                        <div class="text--1">
                            제목
                        </div>
                        <div class="text--2">
                            내용
                        </div>
                        <div class="text---2">
                            첨부 파일
                        </div>
                        <div class="frame-40">
                            <input type="text" id="title" class="frame-41" name="askTitle" required placeholder="문의 제목" >
                            
	                        <textarea class="frame-42" id="content" name="askContent" rows="10" cols="50" required placeholder="문의 내용"></textarea>
                        	
                        	<input type="file" id="upfile" class="frame-43" name="upfile">
                            
                        </div>
                      
                    </div>
     				
	                <div class="askEnroll">
		                <input type="submit" id="formSubmit" value="등록">
	                </div>
                    </form>
            	</div>
            
            <div class="frame-20">
                <div class="text--5">
                    회원 탈퇴
                </div>
                <div class="text---4">
                    고객 센터
                </div>
                <div class="text----1">
                    내 정보 변경
                </div>
                <div class="text---5">
                    관심 상품
                </div>
                <div class="text----2">
                    최근 본 상품
                </div>
                <div class="text---6">
                    리뷰 관리
                </div>
                <div class="text----3">
                    주문 배송 조회
                </div>
            </div>
            
        </div>
    </div>
	</div>
	</div>



<c:if test="${not empty errorMsg }">
		<script>   
        	alertify.alert("글 작성이 실패하였습니다.",'${errorMsg}');
        </script>
		<c:remove var="errorMsg"/>
</c:if>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>