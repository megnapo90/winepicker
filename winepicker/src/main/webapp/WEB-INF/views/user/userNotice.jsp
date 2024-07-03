<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지사항</title>

<style>
.mypagefaq {
  width: 1440px;
  height: 1668px;
  overflow: hidden;
  background: #FFFFFF;
}
.mypagefaq .text- {
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
.mypagefaq .frame-22 {
  position: absolute;
  top: 359px;
  left: 69px;
  width: 219px;
  height: 46px;
  overflow: hidden;
}
.mypagefaq .frame-22 .text-- {
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
.mypagefaq .text---1 {
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
.mypagefaq .line-5 {
  position: absolute;
  top: 419px;
  left: 69px;
  width: 1306px;
  border: 1px solid rgba(0, 0, 0, 0.5);
}
.mypagefaq .line-6 {
  position: absolute;
  top: 498px;
  left: 288px;
  width: 1083px;
  border: 1px solid rgba(0, 0, 0, 0.5);
}
.mypagefaq .frame-24 {
  position: absolute;
  top: 657px;
  left: 288px;
  width: 1076px;
  height: 828px;
  overflow: hidden;
}
.mypagefaq .frame-24 .frame-25 {
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
.mypagefaq .frame-24 .frame-25 .frame-29 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 75px;
  height: 65px;
  overflow: hidden;
}
.mypagefaq .frame-24 .frame-25 .frame-29 .q1 {
  position: absolute;
  top: 11px;
  left: 17px;
  width: 43px;
  height: 44px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 35px;
  line-height: 44px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagefaq .frame-24 .frame-25 .text--- {
  position: absolute;
  top: 14px;
  left: 75px;
  width: 340px;
  height: 38px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 30px;
  line-height: 38px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagefaq .frame-24 .frame-26 {
  position: absolute;
  top: 65px;
  left: 0px;
  width: 1076px;
  height: 65px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mypagefaq .frame-24 .frame-26 .frame-30 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 75px;
  height: 65px;
  overflow: hidden;
}
.mypagefaq .frame-24 .frame-26 .frame-30 .q2 {
  position: absolute;
  top: 11px;
  left: 14.5px;
  width: 48px;
  height: 44px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 35px;
  line-height: 44px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagefaq .frame-24 .frame-26 .text---- {
  position: absolute;
  top: 14px;
  left: 75px;
  width: 472px;
  height: 38px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 30px;
  line-height: 38px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypagefaq .frame-24 .frame-27 {
  position: absolute;
  top: 130px;
  left: 0px;
  width: 1076px;
  height: 65px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mypagefaq .frame-24 .frame-27 .frame-31 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 75px;
  height: 65px;
  overflow: hidden;
}
.mypagefaq .frame-24 .frame-27 .frame-31 .q3 {
  position: absolute;
  top: 11px;
  left: 14.5px;
  width: 48px;
  height: 44px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 35px;
  line-height: 44px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagefaq .frame-24 .frame-27 .text----1 {
  position: absolute;
  top: 14px;
  left: 75px;
  width: 309px;
  height: 38px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 30px;
  line-height: 38px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypagefaq .frame-24 .frame-28 {
  position: absolute;
  top: 195px;
  left: 0px;
  width: 1076px;
  height: 65px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mypagefaq .frame-24 .frame-28 .frame-32 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 75px;
  height: 65px;
  overflow: hidden;
}
.mypagefaq .frame-24 .frame-28 .frame-32 .q4 {
  position: absolute;
  top: 11px;
  left: 13.5px;
  width: 50px;
  height: 44px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 35px;
  line-height: 44px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagefaq .frame-24 .frame-28 .text----- {
  position: absolute;
  top: 14px;
  left: 75px;
  width: 513px;
  height: 38px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 30px;
  line-height: 38px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypagefaq .frame-24 .frame-33 {
  position: absolute;
  top: 260px;
  left: 0px;
  width: 1076px;
  height: 65px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mypagefaq .frame-24 .frame-33 .frame-34 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 75px;
  height: 65px;
  overflow: hidden;
}
.mypagefaq .frame-24 .frame-33 .frame-34 .q5 {
  position: absolute;
  top: 11px;
  left: 14.5px;
  width: 48px;
  height: 44px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 35px;
  line-height: 44px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mypagefaq .frame-24 .frame-33 .text-----1 {
  position: absolute;
  top: 14px;
  left: 75px;
  width: 415px;
  height: 38px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Alike Angular";
  font-size: 30px;
  line-height: 38px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mypagefaq .frame-35 {
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
.mypagefaq .frame-35 .rectangle-39 {
  position: absolute;
  top: 10px;
  left: 6px;
  width: 195px;
  height: 45px;
  background: #5E5E5E;
}
.mypagefaq .frame-35 .faq {
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
.mypagefaq .frame-35 .rectangle-40 {
  position: absolute;
  top: 10px;
  left: 212px;
  width: 195px;
  height: 45px;
  background: #D0D0D0;
}
.mypagefaq .frame-35 .text-11 {
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
.mypagefaq .frame-35 .rectangle-41 {
  position: absolute;
  top: 10px;
  left: 645px;
  width: 431px;
  height: 45px;
  background: #D0D0D0;
}
.mypagefaq .frame-35 .text-----2 {
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
.mypagefaq .footerbar {
  position: absolute;
  top: 1485px;
  left: 0px;
  width: 1440px;
  height: 183px;
  overflow: hidden;
}
.mypagefaq .footerbar .rectangle- {
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
.mypagefaq .footerbar .text------------123-12-123456------123-1 {
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
.mypagefaq .footerbar .rectangle--1 {
  position: absolute;
  top: 18px;
  left: 167px;
  width: 232px;
  height: 42px;
  object-fit: cover;
}
.mypagefaq .footerbar .market-red-white-sparkling {
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
.mypagefaq .footerbar .text--faq--11- {
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
.mypagefaq .footerbar .contact-us-email--adminwinepickercom {
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
.mypagefaq .footerbar .copyright--winepicker-all-right-reserved {
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
.mypagefaq .footerbar .text-----3 {
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
.mypagefaq .frame-20 {
  position: absolute;
  top: 498px;
  left: 69px;
  width: 164px;
  height: 825px;
  overflow: hidden;
  background: linear-gradient(0deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0.2) 100%), linear-gradient(180deg, #eecccc 15%, rgba(255, 255, 255, 0) 100%);
}
.mypagefaq .frame-20 .text--1 {
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
.mypagefaq .frame-20 .text---2 {
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
.mypagefaq .frame-20 .text----2 {
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
.mypagefaq .frame-20 .text---3 {
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
.mypagefaq .frame-20 .text----3 {
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
.mypagefaq .frame-20 .text---4 {
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
.mypagefaq .frame-20 .text----4 {
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
.mypagefaq .mainloginbar {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 1440px;
  height: 210px;
  overflow: hidden;
}
.mypagefaq .mainloginbar .rectangle--2 {
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
.mypagefaq .mainloginbar .rectangle-25 {
  position: absolute;
  top: 152px;
  left: 0px;
  width: 1440px;
  height: 58px;
  background: #84515F;
}
.mypagefaq .mainloginbar .shopping-bag-2-fill {
  position: absolute;
  top: 18px;
  left: 1385px;
  width: 31px;
  height: 30px;
}
.mypagefaq .mainloginbar .user-3-fill {
  position: absolute;
  top: 18px;
  left: 1302px;
  width: 30px;
  height: 30px;
}
.mypagefaq .mainloginbar .frame-67 {
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
.mypagefaq .mainloginbar .frame-67 .text--2 {
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
.mypagefaq .mainloginbar .frame-68 {
  position: absolute;
  top: 153px;
  left: 720px;
  width: 720px;
  height: 58px;
  overflow: hidden;
}
.mypagefaq .mainloginbar .frame-68 .text--3 {
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
.mypagefaq .mainloginbar .kakaotalk-20240627-210722285 {
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
.mypagefaq .mainloginbar .path-2 {
  position: absolute;
  top: 10%;
  left: 93.75%;
  right: 4.86%;
  bottom: 78.1%;
}
.mypagefaq .mainloginbar .picker {
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
.mypagefaq .mainloginbar .wine {
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

.frame-24 {
  width: 1076px;
  height: 828px;
  overflow: hidden;
}
.frame-24 .frame-25 {
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
.frame-24 .frame-25 .frame-29 {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 918px;
  height: 65px;
  overflow: hidden;
}
.frame-24 .frame-25 .frame-29 .text---- {
  position: absolute;
  top: 11px;
  left: 19px;
  width: 754px;
  height: 50px;
  color: #000000;
  font-family: "Noto Serif Gurmukhi";
  font-size: 35px;
  line-height: 50px;
  font-weight: 400;
  letter-spacing: 10px;
}
.frame-24 .frame-30 {
  position: absolute;
  top: 125px;
  left: 0px;
  width: 1076px;
  height: 300px;
  overflow: hidden;
  background: rgba(6, 5, 5, 0.04);
  border: 0px solid rgba(0, 0, 0, 0.5);
}
.frame-24 .frame-30 .text---100232015-6-26---1-------winepicker----------------------pc--------------2----------------------------------------------------------------------------3---------------------------------------------------- {
  position: absolute;
  top: 20px;
  left: 21px;
  width: 1035px;
  height: 260px;
  color: #3D3D3D;
  font-family: "Noto Serif Gurmukhi";
  font-size: 18px;
  line-height: 26px;
  font-weight: 400;
  letter-spacing: 10px;
}
.frame-24 .frame-31 {
  position: absolute;
  top: 474px;
  left: 0px;
  width: 1076px;
  height: 317px;
  overflow: hidden;
  background: rgba(6, 5, 5, 0.04);
  border: 0px solid rgba(0, 0, 0, 0.5);
}
.frame-24 .frame-31 .text---------------------------30---------------------------------------------------------------------------------- {
  position: absolute;
  top: 18px;
  left: 20px;
  width: 1035px;
  height: 286px;
  color: #3D3D3D;
  font-family: "Noto Serif Gurmukhi";
  font-size: 18px;
  line-height: 26px;
  font-weight: 400;
  letter-spacing: 10px;
}
.frame-24 .frame-31 .text---------------------------30---------------------------------------------------------------------------------- > div {
  width: 100%;
}
.frame-24 .text- {
  position: absolute;
  top: 87px;
  left: 9px;
  width: 121px;
  height: 38px;
  color: #000000;
  font-family: "Noto Serif Gurmukhi";
  font-size: 25px;
  line-height: 36px;
  font-weight: 400;
  letter-spacing: 10px;
}
.frame-24 .text--- {
  position: absolute;
  top: 436px;
  left: 9px;
  width: 243px;
  height: 38px;
  color: #000000;
  font-family: "Noto Serif Gurmukhi";
  font-size: 25px;
  line-height: 36px;
  font-weight: 400;
  letter-spacing: 10px;
}


</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div>
    <div class="mypagefaq">
        <div class="mypagefaq-1">
            <div class="text-">
                마이페이지
            </div>
            <div class="frame-22">
                <div class="text--">
                    홍길동님, 환영합니다. <!--  로그인 유저 성명 -->
                </div>
            </div>
            <div class="text---1">
                고객 센터
            </div>
            <div class="line-5">
            </div>
            <div class="line-6">
            </div>
            
            <div class="frame-35">
                <div class="rectangle-39">
	                <div class="faq" onclick=showFaq()>
	                    FAQ
	                </div>
                </div>
                <div class="rectangle-40" >
                	<div class="text-11" onclick="location.href='${contextPath}/ask/askPage'">
                    	1:1문의
                	</div>
                </div>
                
                <div class="rectangle-41">
                	<div class="text-----2" onclick=showNotice()>
                    	이용약관 및 개인정보처리 방침
                	</div>
                </div>
                
            </div>
            
          	<div>
		    <div class="frame-24">
		        <div class="frame-25">
		            <div class="frame-29">
		                <div class="text----">
		                    이용약관 및 개인정보처리 방침
		                </div>
		            </div>
		        </div>
		        <div class="frame-30">
		            <div class="text---100232015-6-26---1-------winepicker----------------------pc--------------2----------------------------------------------------------------------------3----------------------------------------------------">
		                <div><span>전자상거래(인터넷사이버몰) 표준약관 제10023호(2015. 6. 26. 개정) 준용<div class="_p"></div>제1조(목적) 이 약관은 와인피커 회사(전자상거래 사업자)가 운영하는 WINEPICKER 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
		                        <div class="_p"></div>제2조(정의)
		                        <div class="_p"></div>① “몰”이란 와인피커 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
		                        <div class="_p"></div>② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
		                        <div class="_p"></div>③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
		                        <div class="_p"></div>④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
		                        <div class="_p"></div>제3조 (약관 등의 명시와 설명 및 개정)
		                        <div class="_p"></div>① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 와인피커 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
		                    </span></div>
		            </div>
		        </div>
		        <div class="frame-31">
		            <div class="text---------------------------30----------------------------------------------------------------------------------">
		                <div><span>와인피커는 (이하 ‘회사’라 한다)는 정보주체의 자유와 권리 보호를 위해 「개인정보 보호법」 및 관계 법령이 정한 바를 준수하여, 적법하게 개인정보를 처리하고 안전하게 관리하고 있습니다. 이에 「개인정보 보호법」 제30조에 따라 정보주체에게 개인정보 처리에 관한 절차 및 기준을 안내하고, 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.<div class="_p"></div>
		                        <div class="_p"></div>개인정보의 처리 목적, 수집항목, 보유 및 이용기간<div class="_p"></div>󰀠회사는 서비스 제공 및 처리, 서비스업무 수행 등의 목적으로 필요에 의한 최소한으로 개인정보를 수집하고 있습니다.<div class="_p"></div>󰀠회사에서 처리하는 개인정보는 수집·이용 목적으로 명시한 범위 내에서 처리하며, 「개인정보보호법」 및 관련 법령에 따라 등록·공개하는 개인정보파일의 처리목적·보유기간 및 항목은 각 개인정보파일의 특성에 따라 달리 규정하고 있습니다.<div class="_p"></div>󰀠회사에서 처리하는 개인정보 목적, 수집항목, 보유 및 이용기간을 다음과 같습
		                    </span><span>니다.</span></div>
		            </div>
		        </div>
		        <div class="text-">
		            이용약관
		        </div>
		        <div class="text---">
		            개인 정보처리 방침
		        </div>
		    </div>
		</div>
            
            
            
            <div class="frame-20">
                <div class="text--1">  <!--onclick="location.href='${contextPath}/user/'"  -->
                    회원 탈퇴
                </div>
                <div class="text---2" onclick="location.href='${contextPath}/user/callCenter'">
                    고객 센터
                </div>
                <div class="text----2"> <!--onclick="location.href='${contextPath}/user/'"  -->
                    내 정보 변경
                </div>
                <div class="text---3" onclick="location.href='${contextPath}/user/myWishList'">
                    관심 상품
                </div>
                <div class="text----3" onclick="location.href='${contextPath}/user/myRecentProduct'">
                    최근 본 상품
                </div>
                <div class="text---4" onclick="location.href='${contextPath}/user/myReview'">
                    리뷰 관리
                </div>
                <div class="text----4" onclick="location.href='${contextPath}/user/myPage'">
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
	                <div class="text----4"> <!--onclick="location.href='${contextPath}/user/myReview'"  -->
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

<script>
	
	function showFaq(){
		location.href="${contextPath}/user/callCenter"
	}
	
	function showNotice(){
		location.href="${contextPath}/user/userNotice"
	}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>