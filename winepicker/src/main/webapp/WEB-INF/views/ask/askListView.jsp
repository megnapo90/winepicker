<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의사항</title>

<style>
.mypageonebyone {
  width: 1440px;
  height: 1668px;
  border-radius: 6px;
  background: #FFFFFF;
  border: 1px solid rgba(0, 0, 0, 0.12);
}
.mypageonebyone .mypageonebyone-1 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 1440px;
  height: 1668px;
  overflow: hidden;
  background: #FFFFFF;
}
.mypageonebyone .mypageonebyone-1 .text- {
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
.mypageonebyone .mypageonebyone-1 .frame-22 {
  position: absolute;
  top: 359px;
  left: 69px;
  width: 219px;
  height: 46px;
  overflow: hidden;
}
.mypageonebyone .mypageonebyone-1 .frame-22 .text-- {
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
.mypageonebyone .mypageonebyone-1 .text---1 {
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
.mypageonebyone .mypageonebyone-1 .line-5 {
  position: absolute;
  top: 419px;
  left: 69px;
  width: 1306px;
  border: 1px solid rgba(0, 0, 0, 0.5);
}
.mypageonebyone .mypageonebyone-1 .line-6 {
  position: absolute;
  top: 498px;
  left: 288px;
  width: 1083px;
  border: 1px solid rgba(0, 0, 0, 0.5);
}
.mypageonebyone .mypageonebyone-1 .frame-24 {
  position: absolute;
  top: 657px;
  left: 288px;
  width: 1076px;
  height: 828px;
  overflow: hidden;
}
.mypageonebyone .mypageonebyone-1 .frame-24 .frame-25 {
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
.mypageonebyone .mypageonebyone-1 .frame-24 .frame-25 .frame-29 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 387px;
  height: 65px;
  overflow: hidden;
}
.mypageonebyone .mypageonebyone-1 .frame-24 .frame-25 .frame-29 .text-11- {
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

.mypageonebyone .mypageonebyone-1 .frame-24 .frame-30 {
  position: absolute;
  top: 65px;
  left: 0px;
  width: 1076px;
  height: 504px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}

.mypageonebyone .mypageonebyone-1 .frame-24 .frame-30 .text--- {
  position: absolute;
  top: 231px;
  left: 408px;
  width: 263px;
  height: 113px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 20px;
  line-height: 25px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypageonebyone .mypageonebyone-1 .frame-24 .frame-30 .text--- > div {
  width: 100%;
}

.mypageonebyone .mypageonebyone-1 .frame-24 .frame-30 .text--- > div span:nth-child(2) {
  font-size: 35px;
  line-height: 44px;
}
.mypageonebyone .mypageonebyone-1 .frame-24 .rectangle-39 {
  position: absolute;
  top: 589px;
  left: 916px;
  width: 75px;
  height: 40px;
  background: #5E5E5E;
}
.mypageonebyone .mypageonebyone-1 .frame-24 .text--1 {
  position: absolute;
  top: 602px;
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
.mypageonebyone .mypageonebyone-1 .frame-26 {
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
.mypageonebyone .mypageonebyone-1 .frame-26 .rectangle-40 {
  position: absolute;
  top: 10px;
  left: 6px;
  width: 195px;
  height: 45px;
  background: #D0D0D0;
}
.mypageonebyone .mypageonebyone-1 .frame-26 .faq {
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
.mypageonebyone .mypageonebyone-1 .frame-26 .rectangle-41 {
  position: absolute;
  top: 10px;
  left: 212px;
  width: 195px;
  height: 45px;
  background: #5E5E5E;
}
.mypageonebyone .mypageonebyone-1 .frame-26 .text-11 {
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
.mypageonebyone .mypageonebyone-1 .frame-26 .rectangle-42 {
  position: absolute;
  top: 10px;
  left: 645px;
  width: 431px;
  height: 45px;
  background: #D0D0D0;
}
.mypageonebyone .mypageonebyone-1 .frame-26 .text---- {
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
.mypageonebyone .mypageonebyone-1 .footerbar {
  position: absolute;
  top: 1485px;
  left: 0px;
  width: 1440px;
  height: 183px;
  overflow: hidden;
}
.mypageonebyone .mypageonebyone-1 .footerbar .rectangle- {
  position: absolute;
  top: -3px;
  left: 0px;
  width: 1440px;
  height: 186px;
  background: url(https://image-resource.creatie.ai/131184926775412/131184970815644/2892ec27424cc49e7c97067577ba1b8e.png);
  object-fit: cover;
  background-repeat: no-repeat;
  background-size: 1440px 182.95px;
  background-position: 0px 3.05px;
}
.mypageonebyone .mypageonebyone-1 .footerbar .text------------123-12-123456------123-1 {
  position: absolute;
  top: 46px;
  left: 194px;
  width: 284px;
  height: 100px;
  color: #FFFFFF;
  font-family: "Inter";
  font-size: 14px;
  line-height: 17px;
  font-weight: 400;
}
.mypageonebyone .mypageonebyone-1 .footerbar .rectangle--1 {
  position: absolute;
  top: 18px;
  left: 167px;
  width: 232px;
  height: 42px;
  object-fit: cover;
}
.mypageonebyone .mypageonebyone-1 .footerbar .market-red-white-sparkling {
  position: absolute;
  top: 26px;
  left: 626px;
  width: 76px;
  height: 113px;
  color: #FFFFFF;
  font-family: "Inter";
  font-size: 14px;
  line-height: 17px;
  font-weight: 400;
}
.mypageonebyone .mypageonebyone-1 .footerbar .text--faq--11- {
  position: absolute;
  top: 26px;
  left: 764px;
  width: 76px;
  height: 113px;
  color: #FFFFFF;
  font-family: "Inter";
  font-size: 14px;
  line-height: 17px;
  font-weight: 400;
}
.mypageonebyone .mypageonebyone-1 .footerbar .contact-us-email--adminwinepickercom {
  position: absolute;
  top: 26px;
  left: 912px;
  width: 299px;
  height: 96px;
  color: #FFFFFF;
  font-family: "Inter";
  font-size: 14px;
  line-height: 17px;
  font-weight: 400;
}
.mypageonebyone .mypageonebyone-1 .footerbar .copyright--winepicker-all-right-reserved {
  position: absolute;
  top: 146px;
  left: 546px;
  width: 349px;
  height: 24px;
  color: #FFFFFF;
  font-family: "Inter";
  font-size: 16px;
  line-height: 19px;
  font-weight: 400;
}
.mypageonebyone .mypageonebyone-1 .footerbar .text-----1 {
  position: absolute;
  top: 97px;
  left: 908px;
  width: 299px;
  height: 62px;
  color: #FFFFFF;
  font-family: "Inter";
  font-size: 14px;
  line-height: 17px;
  font-weight: 400;
}
.mypageonebyone .mypageonebyone-1 .frame-20 {
  position: absolute;
  top: 498px;
  left: 69px;
  width: 164px;
  height: 825px;
  overflow: hidden;
  background: linear-gradient(0deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0.2) 100%), linear-gradient(180deg, #eecccc 15%, rgba(255, 255, 255, 0) 100%);
}
.mypageonebyone .mypageonebyone-1 .frame-20 .text--2 {
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
.mypageonebyone .mypageonebyone-1 .frame-20 .text---2 {
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
.mypageonebyone .mypageonebyone-1 .frame-20 .text----1 {
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
.mypageonebyone .mypageonebyone-1 .frame-20 .text---3 {
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
.mypageonebyone .mypageonebyone-1 .frame-20 .text----2 {
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
.mypageonebyone .mypageonebyone-1 .frame-20 .text---4 {
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
.mypageonebyone .mypageonebyone-1 .frame-20 .text----3 {
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
.mypageonebyone .mypageonebyone-1 .mainloginbar {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 1440px;
  height: 210px;
  overflow: hidden;
}
.mypageonebyone .mypageonebyone-1 .mainloginbar .rectangle--2 {
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
.mypageonebyone .mypageonebyone-1 .mainloginbar .rectangle-25 {
  position: absolute;
  top: 152px;
  left: 0px;
  width: 1440px;
  height: 58px;
  background: #84515F;
}
.mypageonebyone .mypageonebyone-1 .mainloginbar .shopping-bag-2-fill {
  position: absolute;
  top: 18px;
  left: 1385px;
  width: 31px;
  height: 30px;
}
.mypageonebyone .mypageonebyone-1 .mainloginbar .user-3-fill {
  position: absolute;
  top: 18px;
  left: 1302px;
  width: 30px;
  height: 30px;
}
.mypageonebyone .mypageonebyone-1 .mainloginbar .frame-67 {
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
.mypageonebyone .mypageonebyone-1 .mainloginbar .frame-67 .text--3 {
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
.mypageonebyone .mypageonebyone-1 .mainloginbar .frame-68 {
  position: absolute;
  top: 153px;
  left: 720px;
  width: 720px;
  height: 58px;
  overflow: hidden;
}
.mypageonebyone .mypageonebyone-1 .mainloginbar .frame-68 .text--4 {
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
.mypageonebyone .mypageonebyone-1 .mainloginbar .kakaotalk-20240627-210722285 {
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
.mypageonebyone .mypageonebyone-1 .mainloginbar .path-2 {
  position: absolute;
  top: 10%;
  left: 93.75%;
  right: 4.86%;
  bottom: 78.1%;
}
.mypageonebyone .mypageonebyone-1 .mainloginbar .picker {
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
.mypageonebyone .mypageonebyone-1 .mainloginbar .wine {
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
.frame-26 {
  width: 1076px;
  height: 65px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.frame-26 .frame-29 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 75px;
  height: 65px;
  overflow: hidden;
}
.frame-26 .frame-29 .no {
  position: absolute;
  top: 20px;
  left: 20px;
  width: 35px;
  height: 25px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 20px;
  line-height: 25px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.frame-26 .text- {
  position: absolute;
  top: 20px;
  left: 105px;
  width: 39px;
  height: 25px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 20px;
  line-height: 25px;
  font-weight: 400;
  letter-spacing: 10px;
}
.frame-26 .text--1 {
  position: absolute;
  top: 20px;
  left: 586px;
  width: 205px;
  height: 25px;
  color: #3D3D3D;
  font-family: "Alike Angular";
  font-size: 20px;
  line-height: 25px;
  font-weight: 400;
  letter-spacing: 10px;
}
.frame-26 .text--2 {
  position: absolute;
  top: 18px;
  left: 778px;
  width: 205px;
  height: 25px;
  color: #3D3D3D;
  font-family: "Alike Angular";
  font-size: 20px;
  line-height: 25px;
  font-weight: 400;
  letter-spacing: 10px;
}

.frame-27 {
  width: 1076px;
  height: 65px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.frame-27 .frame-29 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 75px;
  height: 65px;
  overflow: hidden;
}
.frame-27 .frame-29 .text-1 {
  position: absolute;
  top: 16px;
  left: 32px;
  width: 14px;
  height: 25px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 20px;
  line-height: 25px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.frame-27 .a--- {
  position: absolute;
  top: 16px;
  left: 82px;
  width: 326px;
  height: 25px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 20px;
  line-height: 25px;
  font-weight: 400;
  letter-spacing: 10px;
}
.frame-27 .text-2024-06-27 {
  position: absolute;
  top: 14px;
  left: 563px;
  width: 126px;
  height: 25px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 20px;
  line-height: 25px;
  font-weight: 400;
  letter-spacing: 10px;
}
.frame-27 .text- {
  position: absolute;
  top: 13px;
  left: 784px;
  width: 80px;
  height: 25px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 20px;
  line-height: 25px;
  font-weight: 400;
  letter-spacing: 10px;
}
.frame-27 .rectangle-40 {
  position: absolute;
  top: 18px;
  left: 929px;
  width: 52px;
  height: 25px;
  background: #5E5E5E;
}
.frame-27 .text--1 {
  position: absolute;
  top: 23px;
  left: 941px;
  width: 28px;
  height: 16px;
  color: #FFFFFF;
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 14px;
  line-height: 16px;
  font-weight: 400;
  letter-spacing: 10px;
}
.frame-27 .rectangle-41 {
  position: absolute;
  top: 18px;
  left: 992px;
  width: 52px;
  height: 25px;
  background: #5E5E5E;
}
.frame-27 .text--2 {
  position: absolute;
  top: 23px;
  left: 1004px;
  width: 28px;
  height: 16px;
  color: #FFFFFF;
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 14px;
  line-height: 16px;
  font-weight: 400;
  letter-spacing: 10px;
}


</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div>
    <div class="mypageonebyone">
        <div class="mypageonebyone-1">
            <div class="text-">
                마이페이지
            </div>
            <div class="frame-22">
                <div class="text--">
                    ${loginUser.userName} 님, 환영합니다.
                </div>
            </div>
            <div class="text---1" onclick=showFaq()>
                고객 센터
            </div>
            <div class="line-5">
            </div>
            <div class="line-6">
            </div>
            <div class="frame-24">
                <div class="frame-25">
                    <div class="frame-29">
                        <div class="text-11-" onclick="location.href='${contextPath}/ask/askPage'">
                            1:1 문의내역
                        </div>
                    </div>
                </div>
                
                <div class="frame-30">
                    <div class="text---">
                    <div class="frame-26">
									        <div class="frame-29">
									            <div class="no">
									                No.
									            </div>
									        </div>
									        <div class="text-">
									            제목
									        </div>
									        <div class="text--1">
									            작성일자
									        </div>
									        <div class="text--2">
									            답변상태
									        </div>
								    </div>
		                    	</div>
                    <c:choose>
                    	<c:when test="${empty askList}">
	                        <div>
	                        	<span>작성하신 문의글이 없습니다.</span>
	                        	<span>
			                        <div class="_p"></div>
			                        <div class="_p"></div>
			                        </span>
			                </div>
		                </c:when>
		                <c:otherwise>
		                <c:forEach var="ask" items="${askList}">
						    <div class="frame-27" onclick="movePage(${ask.askNo})">
						        <div class="frame-29">
						            <div class="text-1">
						                ${ask.askNo}
						            </div>
						        </div>
						        <div class="a---">
						            ${ask.askTitle}
						        </div>
						        <div class="text-2024-06-27">
						            ${ask.modifyDate}
						        </div>
						        <div class="text-">
						            <c:choose>
						            <c:when test="${fn:contains(ask.responseStatus, 'N')}">
						            	<p>답변대기</p>
						            </c:when>
						            <c:otherwise>
						            	<p>답변완료</p>
						            </c:otherwise>
						            </c:choose>
						        </div>
						    </div>
		                  </c:forEach>
                   		</c:otherwise>
                    </c:choose>
                    
                    	
                    
                    </div>
                </div>
                <div class="rectangle-39">
                </div>
                
                <input type="button" value="작성하기" class="text--1" onclick="location.href='${contextPath}/ask/askInsert'">
                

            </div>
            <div class="frame-26">
                <div class="rectangle-40">
                </div>
                <div class="faq" onclick=showFaq()>
                    FAQ
                </div>
                <div class="rectangle-41">
                </div>
                <div class="text-11">
                    1:1문의
                </div>
                <div class="rectangle-42">
                </div>
                <div class="text----" onclick=showNotice()>
                    이용약관 및 개인정보처리 방침
                </div>
            </div>
           
            <div class="frame-20">
                <div class="text--2">
                    회원 탈퇴
                </div>
                <div class="text---2" onclick="location.href='${contextPath}/user/callCenter'">
                    고객 센터
                </div>
                <div class="text----1">
                    내 정보 변경
                </div>
                <div class="text---3"  onclick="location.href='${contextPath}/user/myWishList'">
                    관심 상품
                </div>
                <div class="text----2" onclick="location.href='${contextPath}/user/myRecentProduct'" >
                    최근 본 상품
                </div>
                <div class="text---4" onclick="location.href='${contextPath}/user/myReview'">
                    리뷰 관리
                </div>
                <div class="text----3" onclick="location.href='${contextPath}/user/myPage'">
                    주문 배송 조회
                </div>
            </div>
            
        </div>
    </div>

<script>
	
	function showFaq(){
		location.href="${contextPath}/user/callCenter"
	}
	
	function showNotice(){
		location.href="${contextPath}/user/userNotice"
	}
	
	function movePage(ano){
		location.href="${contextPath}/ask/detail/"+ano
	}

</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>