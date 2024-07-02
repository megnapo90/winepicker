<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style>


.mapagemain {
  width: 100%;
  height: 1440px;
  border-radius: 6px;
  background: #FFFFFF;
  border: 1px solid rgba(0, 0, 0, 0.12);
}
.mapagemain .mypagemain {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 100%;
  height: 1440px;
  overflow: hidden;
  background: #FFFFFF;
}
.mapagemain .mypagemain .frame-20 {
  position: absolute;
  top: 498px;
  left: 69px;
  width: 164px;
  height: 825px;
  overflow: hidden;
  background: linear-gradient(0deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0.2) 100%), linear-gradient(180deg, #eecccc 15%, rgba(255, 255, 255, 0) 100%);
}
.mapagemain .mypagemain .frame-20 .text--- {
  position: absolute;
  top: 62px;
  left: 14.5px;
  width: 134px;
  height: 23px;
  color: #2E0000;
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mapagemain .mypagemain .frame-20 .text----1 {
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
.mapagemain .mypagemain .frame-20 .text----2 {
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
.mapagemain .mypagemain .frame-20 .text----3 {
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
.mapagemain .mypagemain .frame-20 .text----4 {
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
.mapagemain .mypagemain .frame-20 .text----5 {
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
.mapagemain .mypagemain .frame-20 .text----6 {
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
.mapagemain .mypagemain .text- {
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
.mapagemain .mypagemain .frame-22 {
  position: absolute;
  top: 359px;
  left: 69px;
  width: 219px;
  height: 46px;
  overflow: hidden;
}
.mapagemain .mypagemain .frame-22 .text-- {
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
.mapagemain .mypagemain .text----7 {
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
.mapagemain .mypagemain .text---1 {
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
.mapagemain .mypagemain .line-5 {
  position: absolute;
  top: 419px;
  left: 69px;
  width: 1306px;
  border: 1px solid rgba(0, 0, 0, 0.5);
}
.mapagemain .mypagemain .line-6 {
  position: absolute;
  top: 498px;
  left: 288px;
  width: 1083px;
  border: 1px solid rgba(0, 0, 0, 0.5);
}
.mapagemain .mypagemain .frame-24 {
  position: absolute;
  top: 656px;
  left: 295px;
  width: 1076px;
  height: 829px;
  overflow: hidden;
}
.mapagemain .mypagemain .frame-24 .frame-27 {
  position: absolute;
  top: 342px;
  left: 0px;
  width: 1076px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mapagemain .mypagemain .frame-24 .frame-28 {
  position: absolute;
  top: 513px;
  left: 0px;
  width: 1076px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mapagemain .mypagemain .frame-24 .frame-29 {
  position: absolute;
  top: 684px;
  left: 0px;
  width: 1076px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 0px 1px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.5);
}
.mapagemain .mypagemain .frame-24 .frame-26 {
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-31 {
  position: absolute;
  top: 0px;
  left: 212px;
  width: 120px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-31 .text-20240627 {
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-31 .text--1 {
  position: absolute;
  top: 40px;
  left: 20px;
  width: 80px;
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-34 {
  position: absolute;
  top: 0px;
  left: 625px;
  width: 90px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-34 .text-1 {
  position: absolute;
  top: 69px;
  left: -4px;
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-34 .text--2 {
  position: absolute;
  top: 43px;
  left: 25.5px;
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-35 {
  position: absolute;
  top: 0px;
  left: 716px;
  width: 120px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-35 .text-30-000 {
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-35 .text--3 {
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-36 {
  position: absolute;
  top: 0px;
  left: 836px;
  width: 120px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-36 .text--4 {
  position: absolute;
  top: 66px;
  left: 11px;
  width: 99px;
  height: 60px;
  color: rgba(0, 181, 24, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-36 .text--5 {
  position: absolute;
  top: 40px;
  left: 20px;
  width: 80px;
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-30 {
  position: absolute;
  top: 0px;
  left: 91px;
  width: 120px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-30 .text-20240627-0002 {
  position: absolute;
  top: 81px;
  left: 10px;
  width: 99px;
  height: 75px;
  color: rgba(0, 0, 0, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-30 .text--6 {
  position: absolute;
  top: 40px;
  left: 20px;
  width: 80px;
  height: 46px;
  color: rgba(0, 0, 0, 0.7);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-32 {
  position: absolute;
  top: 0px;
  left: 332px;
  width: 292px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-32 .text-----1 {
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-32 .text--7 {
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-33 {
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-33 .rectangle-2 {
  position: absolute;
  top: 15px;
  left: 0px;
  width: 91px;
  height: 141px;
  object-fit: cover;
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-37 {
  position: absolute;
  top: 0px;
  left: 956px;
  width: 120px;
  height: 171px;
  overflow: hidden;
}
.mapagemain .mypagemain .frame-24 .frame-26 .frame-37 .text---2 {
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
.mapagemain .mypagemain .frame-24 .frame-26 .frame-37 .text--8 {
  position: absolute;
  top: 40px;
  left: 20px;
  width: 80px;
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
.mapagemain .mypagemain .frame-24 .frame-25 {
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-38 {
  position: absolute;
  top: 0px;
  left: 212px;
  width: 120px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-38 .text-20240628 {
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-38 .text--9 {
  position: absolute;
  top: 40px;
  left: 16.5px;
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-39 {
  position: absolute;
  top: 0px;
  left: 625px;
  width: 90px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-39 .text-2 {
  position: absolute;
  top: 69px;
  left: -4px;
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-39 .text--10 {
  position: absolute;
  top: 43px;
  left: 25.5px;
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-40 {
  position: absolute;
  top: 0px;
  left: 716px;
  width: 120px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-40 .text-300-000 {
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-40 .text--11 {
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-41 {
  position: absolute;
  top: 0px;
  left: 836px;
  width: 120px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-41 .text--12 {
  position: absolute;
  top: 66px;
  left: 11px;
  width: 99px;
  height: 60px;
  color: rgba(181, 0, 0, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-41 .text--13 {
  position: absolute;
  top: 40px;
  left: 20px;
  width: 80px;
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-42 {
  position: absolute;
  top: 0px;
  left: 91px;
  width: 120px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-42 .text-20240627-0001 {
  position: absolute;
  top: 81px;
  left: 10px;
  width: 100px;
  height: 63px;
  color: rgba(0, 0, 0, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-42 .text--14 {
  position: absolute;
  top: 40px;
  left: 20px;
  width: 80px;
  height: 46px;
  color: rgba(0, 0, 0, 0.7);
  white-space: nowrap;
  font-family: "Oranienbaum";
  font-size: 20px;
  line-height: 23px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-43 {
  position: absolute;
  top: 0px;
  left: 332px;
  width: 292px;
  height: 171px;
  overflow: hidden;
  border-width: 0px 1px 0px 0px;
  border-style: solid;
  border-color: rgba(0, 0, 0, 0.7);
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-43 .text---3 {
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-43 .text--15 {
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-44 {
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
.mapagemain .mypagemain .frame-24 .frame-25 .frame-44 .rectangle-1 {
  position: absolute;
  top: 18px;
  left: 17px;
  width: 62px;
  height: 136px;
  object-fit: cover;
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-45 {
  position: absolute;
  top: 0px;
  left: 956px;
  width: 120px;
  height: 171px;
  overflow: hidden;
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-45 .text--16 {
  position: absolute;
  top: 66px;
  left: 11px;
  width: 99px;
  height: 60px;
  color: rgba(0, 101, 173, 0.7);
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mapagemain .mypagemain .frame-24 .frame-25 .frame-45 .text--17 {
  position: absolute;
  top: 40px;
  left: 20px;
  width: 80px;
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
.mapagemain .mypagemain .frame-46 {
  position: absolute;
  top: 544px;
  left: 943px;
  width: 428px;
  height: 66px;
  overflow: hidden;
}
.mapagemain .mypagemain .frame-46 .text-2024-06-27 {
  position: absolute;
  top: 17px;
  left: 24.5px;
  width: 109px;
  height: 28px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mapagemain .mypagemain .frame-46 .text-2024-06-28 {
  position: absolute;
  top: 17px;
  left: 200px;
  width: 109px;
  height: 28px;
  color: #3D3D3D;
  white-space: nowrap;
  font-family: "Akshar";
  font-size: 20px;
  line-height: 28px;
  font-weight: 400;
  letter-spacing: 10px;
  text-align: center;
}
.mapagemain .mypagemain .frame-46 .calendar-2-fill {
  position: absolute;
  top: 19px;
  left: 143px;
  width: 24px;
  height: 24px;
}
.mapagemain .mypagemain .frame-46 .path-1 {
  position: absolute;
  top: 28.79%;
  left: 74.53%;
  right: 20.79%;
  bottom: 40.91%;
}
.mapagemain .mypagemain .frame-46 .rectangle-39 {
  position: absolute;
  top: 18px;
  left: 351px;
  width: 58px;
  height: 26px;
  background: #5E5E5E;
}
.mapagemain .mypagemain .frame-46 .text--18 {
  position: absolute;
  top: 22px;
  left: 363px;
  width: 35px;
  height: 22px;
  color: #FFFFFF;
  font-family: "Oranienbaum";
  font-size: 17px;
  line-height: 20px;
  font-weight: 400;
  letter-spacing: 10px;
}
.mapagemain .mypagemain .footerbar {
  position: absolute;
  top: 1485px;
  left: 0px;
  width: 1440px;
  height: 183px;
  overflow: hidden;
}
.mapagemain .mypagemain .footerbar .rectangle- {
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
.mapagemain .mypagemain .footerbar .text------------123-12-123456------123-1 {
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
.mapagemain .mypagemain .footerbar .rectangle--1 {
  position: absolute;
  top: 18px;
  left: 167px;
  width: 232px;
  height: 42px;
  object-fit: cover;
}
.mapagemain .mypagemain .footerbar .market-red-white-sparkling {
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
.mapagemain .mypagemain .footerbar .text--faq--11- {
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
.mapagemain .mypagemain .footerbar .contact-us-email--adminwinepickercom {
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
.mapagemain .mypagemain .footerbar .copyright--winepicker-all-right-reserved {
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
.mapagemain .mypagemain .footerbar .text---- {
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
.mapagemain .mypagemain .mainloginbar {
  position: absolute;
  top: 0px;
  left: 0px;
  width: 1440px;
  height: 210px;
  overflow: hidden;
}
.mapagemain .mypagemain .mainloginbar .rectangle--2 {
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
.mapagemain .mypagemain .mainloginbar .rectangle-25 {
  position: absolute;
  top: 152px;
  left: 0px;
  width: 1440px;
  height: 58px;
  background: #84515F;
}
.mapagemain .mypagemain .mainloginbar .shopping-bag-2-fill {
  position: absolute;
  top: 18px;
  left: 1385px;
  width: 31px;
  height: 30px;
}
.mapagemain .mypagemain .mainloginbar .user-3-fill {
  position: absolute;
  top: 18px;
  left: 1302px;
  width: 30px;
  height: 30px;
}
.mapagemain .mypagemain .mainloginbar .frame-67 {
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
.mapagemain .mypagemain .mainloginbar .frame-67 .text--19 {
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
.mapagemain .mypagemain .mainloginbar .frame-68 {
  position: absolute;
  top: 153px;
  left: 720px;
  width: 720px;
  height: 58px;
  overflow: hidden;
}
.mapagemain .mypagemain .mainloginbar .frame-68 .text--20 {
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
.mapagemain .mypagemain .mainloginbar .kakaotalk-20240627-210722285 {
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
.mapagemain .mypagemain .mainloginbar .path-4 {
  position: absolute;
  top: 10%;
  left: 93.75%;
  right: 4.86%;
  bottom: 78.1%;
}
.mapagemain .mypagemain .mainloginbar .picker {
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
.mapagemain .mypagemain .mainloginbar .wine {
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
	
	    <div class="mapagemain">
	        <div class="mypagemain">
	            <div class="frame-20">
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
	                <div class="text----6"> <!-- onclick="location.href='${contextPath}/user/myReview'"  --> 
	                    회원 탈퇴
	                </div>
	            </div>
	            <div class="text-">
	                마이페이지
	            </div>
	            <div class="frame-22">
	                <div class="text--">
	                    홍길동님, 환영합니다.   <!-- 로그인 유저 명 -->
	                </div>
	            </div>
	            <div class="text----7">
	                주문 배송 조회
	            </div>
	            <div class="text---1">
	                주문 내역
	            </div>
	            <div class="line-5">
	            </div>
	            <div class="line-6">
	            </div>
	            <div class="frame-24">
	                <div class="frame-27">
	                </div>
	                <div class="frame-28">
	                </div>
	                <div class="frame-29">
	                </div>
	                <div class="frame-26">
	                    <div class="frame-31">
	                        <div class="text-20240627">
	                            <div><span>
	                                    <div class="_p"></div>20240627
	                                </span></div>
	                        </div>
	                        <div class="text--1">
	                            주문일자
	                        </div>
	                    </div>
	                    <div class="frame-34">
	                        <div class="text-1">
	                            <div><span>
	                                    <div class="_p"></div>1
	                                </span></div>
	                        </div>
	                        <div class="text--2">
	                            수량
	                        </div>
	                    </div>
	                    <div class="frame-35">
	                        <div class="text-30-000">
	                            <div><span>
	                                    <div class="_p"></div>30,000
	                                </span></div>
	                        </div>
	                        <div class="text--3">
	                            금액
	                        </div>
	                    </div>
	                    <div class="frame-36">
	                        <div class="text--4">
	                            <div><span>
	                                    <div class="_p"></div>배송완료
	                                </span></div>
	                        </div>
	                        <div class="text--5">
	                            배송상태
	                        </div>
	                    </div>
	                    <div class="frame-30">
	                        <div class="text-20240627-0002">
	                            20240627-0002
	                        </div>
	                        <div class="text--6">
	                            <div><span>주문번호<div class="_p"></div></span></div>
	                        </div>
	                    </div>
	                    <div class="frame-32">
	                        <div class="text-----1">
	                            <div><span>
	                                    <div class="_p"></div>좀 색다르고 고급진 레드와인 1
	                                </span></div>
	                        </div>
	                        <div class="text--7">
	                            상품명
	                        </div>
	                    </div>
	                    <div class="frame-33">
	                        <img src="https://image-resource.creatie.ai/131184926775412/131184970815644/3b7f01cf53b46bdd46b42246fe760b82.png" class="rectangle-2" />
	                    </div>
	                    <div class="frame-37">
	                        <div class="text---2">
	                            <div><span>
	                                    <div class="_p"></div>작성 완료
	                                </span></div>
	                        </div>
	                        <div class="text--8">
	                            리뷰작성
	                        </div>
	                    </div>
	                </div>
	                <div class="frame-25">
	                    <div class="frame-38">
	                        <div class="text-20240628">
	                            <div><span>
	                                    <div class="_p"></div>20240627
	                                </span></div>
	                        </div>
	                        <div class="text--9">
	                            주문일자
	                        </div>
	                    </div>
	                    <div class="frame-39">
	                        <div class="text-2">
	                            <div><span>
	                                    <div class="_p"></div>1
	                                </span></div>
	                        </div>
	                        <div class="text--10">
	                            수량
	                        </div>
	                    </div>
	                    <div class="frame-40">
	                        <div class="text-300-000">
	                            <div><span>
	                                    <div class="_p"></div>300,000
	                                </span></div>
	                        </div>
	                        <div class="text--11">
	                            금액
	                        </div>
	                    </div>
	                    <div class="frame-41">
	                        <div class="text--12">
	                            <div><span>
	                                    <div class="_p"></div>배송중
	                                </span></div>
	                        </div>
	                        <div class="text--13">
	                            배송상태
	                        </div>
	                    </div>
	                    <div class="frame-42">
	                        <div class="text-20240627-0001">
	                            20240627-0001
	                        </div>
	                        <div class="text--14">
	                            <div><span>주문번호<div class="_p"></div></span></div>
	                        </div>
	                    </div>
	                    <div class="frame-43">
	                        <div class="text---3">
	                            <div><span>
	                                    <div class="_p"></div>스파클링 와인 1
	                                </span></div>
	                        </div>
	                        <div class="text--15">
	                            상품명
	                        </div>
	                    </div>
	                    <div class="frame-44">
	                        <img src="https://image-resource.creatie.ai/131184926775412/131184970815644/e69ccd260d159490bd54cc0361c01ded.png" class="rectangle-1" />
	                    </div>
	                    <div class="frame-45">
	                        <div class="text--16">
	                            <div><span>
	                                    <div class="_p"></div>작성가능
	                                </span></div>
	                        </div>
	                        <div class="text--17">
	                            리뷰작성
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="frame-46">
	                <div class="text-2024-06-27">
	                    2024-06-27
	                </div>
	                <div class="text-2024-06-28">
	                    2024-06-27
	                </div>
	                <svg id="13:312" class="calendar-2-fill"></svg><svg id="13:40939" class="path-1"></svg>
	                <div class="rectangle-39">
	                </div>
	                <div class="text--18">
	                    조회
	                </div>
	            </div>
	          
	          
	        </div>
	    </div>
	</div>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


</body>
</html>