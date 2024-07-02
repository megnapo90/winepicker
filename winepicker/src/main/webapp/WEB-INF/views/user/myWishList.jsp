<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품</title>

<style>
.mypagepick {
  width: 1440px;
  height: 1668px;
  overflow: hidden;
  background: #FFFFFF;
}
.mypagepick .text- {
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
.mypagepick .frame-22 {
  position: absolute;
  top: 359px;
  left: 69px;
  width: 219px;
  height: 46px;
  overflow: hidden;
}
.mypagepick .frame-22 .text-- {
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
.mypagepick .text---1 {
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
.mypagepick .text---2 {
  position: absolute;
  top: 512px;
  left: 288px;
  width: 247px;
  height: 35px;
  color: #3D3D3D;
  font-family: "Oranienbaum";
  font-size: 30px;
  line-height: 35px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypagepick .line-5 {
  position: absolute;
  top: 419px;
  left: 69px;
  width: 1306px;
  border: 1px solid rgba(0, 0, 0, 0.5);
}
.mypagepick .line-6 {
  position: absolute;
  top: 498px;
  left: 288px;
  width: 1083px;
  border: 1px solid rgba(0, 0, 0, 0.5);
}
.mypagepick .frame-24 {
  position: absolute;
  top: 656px;
  left: 295px;
  width: 1076px;
  height: 829px;
  overflow: hidden;
}
.mypagepick .frame-24 .frame-26 {
  position: absolute;
  top: 171px;
  left: 0px;
  width: 1076px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mypagepick .frame-24 .frame-26 .frame-35 {
  position: absolute;
  top: 0px;
  left: 691px;
  width: 120px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mypagepick .frame-24 .frame-26 .frame-35 .text-30-000 {
  position: absolute;
  top: 66px;
  left: 11px;
  width: 99px;
  height: 60px;
  color: rgba(0, 0, 0, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-26 .frame-35 .text--1 {
  position: absolute;
  top: 40px;
  left: 40.5px;
  width: 39px;
  height: 23px;
  color: rgba(0, 0, 0, 0.7);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-26 .frame-32 {
  position: absolute;
  top: 0px;
  left: 91px;
  width: 292px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mypagepick .frame-24 .frame-26 .frame-32 .text-----1 {
  position: absolute;
  top: 66px;
  left: 0px;
  width: 292px;
  height: 84px;
  color: rgba(0, 0, 0, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-26 .frame-32 .text--2 {
  position: absolute;
  top: 40px;
  left: 57px;
  width: 175px;
  height: 23px;
  color: rgba(0, 0, 0, 0.7);
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-26 .frame-29 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 91px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mypagepick .frame-24 .frame-26 .frame-29 .rectangle-2 {
  position: absolute;
  top: 15px;
  left: 0px;
  width: 91px;
  height: 141px;
  object-fit: cover;
}
.mypagepick .frame-24 .frame-26 .frame-37 {
  position: absolute;
  top: 0px;
  left: 383px;
  width: 308px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mypagepick .frame-24 .frame-26 .frame-37 .text--- {
  position: absolute;
  top: 56px;
  left: 0px;
  width: 307px;
  height: 60px;
  color: rgba(0, 0, 0, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-26 .frame-37 .text---3 {
  position: absolute;
  top: 43px;
  left: 115.5px;
  width: 87px;
  height: 23px;
  color: rgba(0, 0, 0, 0.7);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-26 .text--3 {
  position: absolute;
  top: 111px;
  left: 831px;
  width: 99px;
  height: 60px;
  color: rgba(0, 0, 0, 0.7);
  text-decoration: underline;
  font-family: "Akshar";
  font-size: 15px;
  line-height: 21px;
  font-weight: 700;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-26 .text--4 {
  position: absolute;
  top: 111px;
  left: 952px;
  width: 99px;
  height: 60px;
  color: rgba(0, 0, 0, 0.7);
  text-decoration: underline;
  font-family: "Akshar";
  font-size: 15px;
  line-height: 21px;
  font-weight: 700;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-26 .close-fill {
  position: absolute;
  top: 31px;
  left: 1002px;
  width: 20px;
  height: 20px;
}
.mypagepick .frame-24 .frame-25 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 1076px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mypagepick .frame-24 .frame-25 .frame-36 {
  position: absolute;
  top: 0px;
  left: 691px;
  width: 120px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mypagepick .frame-24 .frame-25 .frame-36 .text-300-000 {
  position: absolute;
  top: 66px;
  left: 11px;
  width: 99px;
  height: 60px;
  color: rgba(0, 0, 0, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-25 .frame-36 .text--5 {
  position: absolute;
  top: 40px;
  left: 40.5px;
  width: 39px;
  height: 23px;
  color: rgba(0, 0, 0, 0.7);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-25 .frame-38 {
  position: absolute;
  top: 0px;
  left: 383px;
  width: 308px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mypagepick .frame-24 .frame-25 .frame-38 .text---- {
  position: absolute;
  top: 66px;
  left: 0px;
  width: 307px;
  height: 60px;
  color: rgba(0, 0, 0, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-25 .frame-38 .text---4 {
  position: absolute;
  top: 43px;
  left: 115.5px;
  width: 87px;
  height: 23px;
  color: rgba(0, 0, 0, 0.7);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-25 .frame-33 {
  position: absolute;
  top: 0px;
  left: 91px;
  width: 292px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mypagepick .frame-24 .frame-25 .frame-33 .text---5 {
  position: absolute;
  top: 66px;
  left: 0px;
  width: 292px;
  height: 84px;
  color: rgba(0, 0, 0, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-25 .frame-33 .text--6 {
  position: absolute;
  top: 40px;
  left: 57px;
  width: 175px;
  height: 23px;
  color: rgba(0, 0, 0, 0.7);
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-25 .frame-30 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 91px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mypagepick .frame-24 .frame-25 .frame-30 .rectangle-1 {
  position: absolute;
  top: 18px;
  left: 17px;
  width: 62px;
  height: 136px;
  object-fit: cover;
}
.mypagepick .frame-24 .frame-25 .text--7 {
  position: absolute;
  top: 111px;
  left: 831px;
  width: 99px;
  height: 60px;
  color: rgba(0, 0, 0, 0.7);
  text-decoration: underline;
  font-family: "Akshar";
  font-size: 15px;
  line-height: 21px;
  font-weight: 700;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-25 .text--8 {
  position: absolute;
  top: 111px;
  left: 952px;
  width: 99px;
  height: 60px;
  color: rgba(0, 0, 0, 0.7);
  text-decoration: underline;
  font-family: "Akshar";
  font-size: 15px;
  line-height: 21px;
  font-weight: 700;
  letter-spacing: 10px;
  text-align: center;
}
.mypagepick .frame-24 .frame-25 .close-fill-1 {
  position: absolute;
  top: 30px;
  left: 1003px;
  width: 20px;
  height: 20px;
}
.mypagepick .frame-24 .rectangle-41 {
  position: absolute;
  top: 368px;
  left: 882px;
  width: 166px;
  height: 26px;
  background: #5E5E5E;
}
.mypagepick .frame-24 .text--9 {
  position: absolute;
  top: 372px;
  left: 910px;
  width: 111px;
  height: 22px;
  color: #FFFFFF;
  font-family: "Oranienbaum";
  font-size: 17px;
  line-height: 20px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypagepick .footerbar {
  position: absolute;
  top: 1485px;
  left: 0px;
  width: 1440px;
  height: 183px;
  overflow: hidden;
}
.mypagepick .footerbar .rectangle- {
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
.mypagepick .footerbar .text------------123-12-123456------123-1 {
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
.mypagepick .footerbar .rectangle--1 {
  position: absolute;
  top: 18px;
  left: 167px;
  width: 232px;
  height: 42px;
  object-fit: cover;
}
.mypagepick .footerbar .market-red-white-sparkling {
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
.mypagepick .footerbar .text--faq--11- {
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
.mypagepick .footerbar .contact-us-email--adminwinepickercom {
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
.mypagepick .footerbar .copyright--winepicker-all-right-reserved {
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
.mypagepick .footerbar .text-----2 {
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
.mypagepick .frame-20 {
  position: absolute;
  top: 498px;
  left: 69px;
  width: 164px;
  height: 825px;
  overflow: hidden;
  background: linear-gradient(0deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0.2) 100%), linear-gradient(180deg, #eecccc 15%, rgba(255, 255, 255, 0) 100%);
}
.mypagepick .frame-20 .text--10 {
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
.mypagepick .frame-20 .text---6 {
  position: absolute;
  top: 352px;
  left: 40px;
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
.mypagepick .frame-20 .text----1 {
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
.mypagepick .frame-20 .text---7 {
  position: absolute;
  top: 229px;
  left: 39px;
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
.mypagepick .frame-20 .text----2 {
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
.mypagepick .frame-20 .text---8 {
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
.mypagepick .frame-20 .text----3 {
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
.mypagepick .mainloginbar {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 1440px;
  height: 210px;
  overflow: hidden;
}
.mypagepick .mainloginbar .rectangle--2 {
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
.mypagepick .mainloginbar .rectangle-25 {
  position: absolute;
  top: 152px;
  left: 0px;
  width: 1440px;
  height: 58px;
  background: #84515F;
}
.mypagepick .mainloginbar .shopping-bag-2-fill {
  position: absolute;
  top: 18px;
  left: 1385px;
  width: 31px;
  height: 30px;
}
.mypagepick .mainloginbar .user-3-fill {
  position: absolute;
  top: 18px;
  left: 1302px;
  width: 30px;
  height: 30px;
}
.mypagepick .mainloginbar .frame-67 {
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
.mypagepick .mainloginbar .frame-67 .text--11 {
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
.mypagepick .mainloginbar .frame-68 {
  position: absolute;
  top: 153px;
  left: 720px;
  width: 720px;
  height: 58px;
  overflow: hidden;
}
.mypagepick .mainloginbar .frame-68 .text--12 {
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
.mypagepick .mainloginbar .kakaotalk-20240627-210722285 {
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
.mypagepick .mainloginbar .path-4 {
  position: absolute;
  top: 10%;
  left: 93.75%;
  right: 4.86%;
  bottom: 78.1%;
}
.mypagepick .mainloginbar .picker {
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
.mypagepick .mainloginbar .wine {
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
    <div class="mypagepick">
        <div class="mypagepick-1">
            <div class="text-">
                마이페이지
            </div>
            <div class="frame-22">
                <div class="text--">
                    홍길동님, 환영합니다.
                </div>
            </div>
            <div class="text---1">
                관심 상품
            </div>
            <div class="text---2">
                관심 상품
            </div>
            <div class="line-5">
            </div>
            <div class="line-6">
            </div>
            <div class="frame-24">
                <div class="frame-26">
                    <div class="frame-35">
                        <div class="text-30-000">
                            <div><span>
                                    <div class="_p"></div>30,000
                                </span></div>
                        </div>
                        <div class="text--1">
                            금액
                        </div>
                    </div>
                    <div class="frame-32">
                        <div class="text-----1">
                            <div><span>
                                    <div class="_p"></div>좀 색다르고 고급진 레드와인 1
                                </span></div>
                        </div>
                        <div class="text--2">
                            상품명
                        </div>
                    </div>
                    <div class="frame-29">
                        <img src="https://image-resource.creatie.ai/131184926775412/131184970815644/3b7f01cf53b46bdd46b42246fe760b82.png" class="rectangle-2" />
                    </div>
                    <div class="frame-37">
                        <div class="text---">
                            <div><span>
                                    <div class="_p"></div>계속먹다보면 이런식으로 되는데....더보기
                                </span></div>
                        </div>
                        <div class="text---3">
                            상품 설명
                        </div>
                    </div>
                    <div class="text--3">
                        <div><span>
                                <div class="_p"></div>장바구니
                            </span></div>
                    </div>
                    <div class="text--4">
                        <div><span>
                                <div class="_p"></div>구매하기
                            </span></div>
                    </div>
                    <svg id="13:50835" class="close-fill"></svg>
                </div>
                <div class="frame-25">
                    <div class="frame-36">
                        <div class="text-300-000">
                            <div><span>
                                    <div class="_p"></div>300,000
                                </span></div>
                        </div>
                        <div class="text--5">
                            금액
                        </div>
                    </div>
                    <div class="frame-38">
                        <div class="text----">
                            <div><span>
                                    <div class="_p"></div>한번 먹다보면 또 먹고싶어집니다
                                </span></div>
                        </div>
                        <div class="text---4">
                            상품 설명
                        </div>
                    </div>
                    <div class="frame-33">
                        <div class="text---5">
                            <div><span>
                                    <div class="_p"></div>스파클링 와인 1
                                </span></div>
                        </div>
                        <div class="text--6">
                            상품명
                        </div>
                    </div>
                    <div class="frame-30">
                        <img src="https://image-resource.creatie.ai/131184926775412/131184970815644/e69ccd260d159490bd54cc0361c01ded.png" class="rectangle-1" />
                    </div>
                    <div class="text--7">
                        <div><span>
                                <div class="_p"></div>장바구니
                            </span></div>
                    </div>
                    <div class="text--8">
                        <div><span>
                                <div class="_p"></div>구매하기
                            </span></div>
                    </div>
                    <svg id="13:50800" class="close-fill-1"></svg>
                </div>
                <div class="rectangle-41">
                </div>
                <div class="text--9">
                    장바구니 넣기
                </div>
            </div>
            
            <div class="frame-20">
                <div class="text--10" > <!-- onclick="location.href='${contextPath}/user/myReview'"  --> 
                    회원 탈퇴
                </div>
                <div class="text---6" onclick="location.href='${contextPath}/user/callCenter'">
                    고객 센터
                </div>
                <div class="text----1">  <!--onclick="location.href='${contextPath}/user/myReview'"  -->
                    내 정보 변경
                </div>
                <div class="text---7" onclick="location.href='${contextPath}/user/myWishList'">
                    관심 상품
                </div>
                <div class="text----2" onclick="location.href='${contextPath}/user/myRecentProduct'" >
                    최근 본 상품
                </div>
                <div class="text---8" onclick="location.href='${contextPath}/user/myReview'">
                    리뷰 관리
                </div>
                <div class="text----3" onclick="location.href='${contextPath}/user/myPage'">
                    주문 배송 조회
                </div>
                
               <%-- 
               		다른 화면들에 적용된 순서
               		 <div class="text---" onclick="location.href='${contextPath}/user/myPage'">
	                    주문 배송 조회
	                </div>
	                <div class="text----1" onclick="location.href='${contextPath}/user/myReview'">
	                    리뷰 관리
	                </div>
	                <div class="text----2" onclick="location.href='${contextPath}/user/myRecentProduct'" >
	                    최근 본 상품
	                </div>
	                <div class="text----3" onclick="location.href='${contextPath}/user/myWishList'">
	                    관심 상품
	                </div>
	                <div class="text----4"> <!--onclick="location.href='${contextPath}/user/'"  -->
	                    내 정보 변경
	                </div>
	                <div class="text----5" onclick="location.href='${contextPath}/user/callCenter'">
	                    고객 센터
	                </div>
	                <div class="text----6"> 
	                    회원 탈퇴
	                </div> --%>
               
            </div>
            
        </div>
    </div>
</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>