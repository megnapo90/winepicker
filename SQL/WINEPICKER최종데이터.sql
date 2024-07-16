--GRAPE
INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(1, '카베르네 소비뇽', 1);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(2, '메를로', 1);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(3, '피노 누아', 1);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(4, '쉬라', 1);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(5, '그 외', 1);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(6, '샤르도네', 2);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(7, '소비뇽 블랑', 2);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(8, '리슬링', 2);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(9, '그 외', 2);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(10, '샤르도네', 3);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(11, '소비뇽 블랑', 3);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(12, '뮈스카', 3);

INSERT INTO GRAPE(GRAPE_NO, GRAPE_NAME, WINE_TYPE_NO)
VALUES(13, '그 외', 3);


--WINE_TYPE
INSERT INTO "WINE_TYPE"
VALUES(1, '레드와인', 'RED');
INSERT INTO "WINE_TYPE"
VALUES(2, '화이트와인', 'WHITE');
INSERT INTO "WINE_TYPE"
VALUES(3, '스파클링와인', 'SPARKLING');


--NOTICE
INSERT INTO NOTICE
VALUES(
    SEQ_NOTICE.NEXTVAL,
    '첫번째 공지사항',
    '공지내용 1',
    DEFAULT,
    NULL,
    NULL,
    DEFAULT
);
INSERT INTO NOTICE
VALUES(
    SEQ_NOTICE.NEXTVAL,
    '두번째 공지사항',
    '공지내용 2',
    DEFAULT,
    NULL,
    NULL,
    DEFAULT
);
INSERT INTO NOTICE
VALUES(
    SEQ_NOTICE.NEXTVAL,
    '세번째 공지사항',
    '공지내용 3',
    DEFAULT,
    NULL,
    NULL,
    DEFAULT
);


-- COUNTRY
INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(1, '프랑스', 'France');
INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(2, '이탈리아', 'Italy');
INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(3, '미국' ,'USA');
INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(4, '칠레', 'Chile');
INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(5, '호주', 'Australia');
INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(6, '그 외', 'OTHER');


--WINE
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '샤토 마고 2018', 1, 1, 2018, 550000, 750, 5, '프랑스의 대표적인 레드 와인, 까베르네 소비뇽의 명작', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '샤토 라피트 로칠드 2015', 1, 1, 2015, 1200000, 750, 3, '프랑스의 고급 레드 와인, 메를로의 명품', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '도멘 드 라 로마네 꽁티 2017', 3, 1, 2017, 2500000, 750, 2, '프랑스 부르고뉴의 유명한 피노 누아 와인', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '루이 로더러 크리스탈 2014', 10, 1, 2014, 800000, 750, 4, '프랑스의 최고급 스파클링 와인, 샤르도네와 피노 누아', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '뵈브 클리코 옐로우 라벨 2018', 10, 1, 2018, 300000, 375, 6, '프랑스의 유명 스파클링 와인, 피노 누아와 샤르도네', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '뽀므롤 드 샤또 클레르몽 2019', 2, 1, 2019, 400000, 750, 5, '프랑스의 레드 와인, 까베르네 소비뇽', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '아마란타 몬테풀치아노 다브루쪼 2019', 5, 2, 2019, 70000, 750, 8, '이탈리아의 레드 와인, 몬테풀치아노', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '로베르토 보에르지오 바롤로 2018', 5, 2, 2018, 150000, 750, 7, '이탈리아의 바롤로, 네비올로 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '라 브랑까이야 끼안티 클라시코 리제르바 2017', 5, 2, 2017, 100000, 750, 6, '이탈리아의 유명한 산지오베제 레드 와인', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '보테가 프로세코 2020', 13, 2, 2020, 30000, 750, 10, '이탈리아의 스파클링 와인, 글레라 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '사시까이아 2017', 1, 2, 2017, 180000, 750, 5, '이탈리아의 고급 레드 와인, 까베르네 소비뇽', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '마세토 2019', 2, 2, 2019, 120000, 750, 7, '이탈리아의 메를로 와인, 프리미엄 레드 와인', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '오봉클리마 2020', 3, 3, 2020, 80000, 750, 6, '미국의 레드 와인, 피노 누아 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '오봉클리마 산타바바라 2021', 6, 3, 2021, 90000, 750, 5, '미국의 화이트 와인, 샤르도네 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '오퍼스원 2017', 1, 3, 2017, 700000, 750, 4, '미국의 고급 레드 와인, 까베르네 소비뇽', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '몬테스 알파 까베르네 소비뇽 2024', 2, 4, 2024, 70000, 750, 7, '칠레의 레드 와인, 까베르네 소비뇽', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '코노수르 피노누아 2018', 3, 4, 2018, 60000, 750, 5, '칠레의 피노누아 레드 와인', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '솔 드 칠레 리저브 샤르도네 2018', 6, 4, 2018, 75000, 750, 4, '칠레의 화이트 와인, 샤르도네 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '센데로 2020', 7, 4, 2020, 45000, 750, 6, '칠레의 화이트 와인, 소비뇽 블랑 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '투 핸즈 엔젤스 쉐어 2022', 8, 5, 2022, 100000, 750, 5, '호주의 레드 와인, 쉬라즈 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '옐로우 테일 샤르도네 2023', 6, 5, 2023, 30000, 750, 8, '호주의 화이트 와인, 샤르도네 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '피츠 퓨어 2018', 7, 5, 2018, 50000, 750, 5, '호주의 화이트 와인, 소비뇽 블랑 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '펜폴즈 빈 407', 1, 6, 2017, 70000, 750, 5, '호주의 고급 레드 와인, 까베르네 소비뇽', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '술라 소비뇽 블랑 2023', 8, 6, 2023, 65000, 750, 5, '그 외 지역의 화이트 와인, 소비뇽 블랑 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '베리 브라더스 잉글리쉬 스파클링 와인 2018', 13, 6, 2018, 80000, 750, 4, '그 외 지역의 스파클링 와인, 샤르도네 품종', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS) VALUES
(WINE_SEQ.NEXTVAL, '생클레어 비카스 초이스 2021', 11, 6, 2021, 18000, 750, 9, '그 외 지역의 스파클링 와인, 소비뇽 블랑 품종', 'Y');

--WINE_IMAGE
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(1, '1', '1');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(2, '2', '2');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(3, '3', '3');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(4, '4', '4');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(5, '5', '5');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(6, '6', '6');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(7, '11', '11');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(8, '12', '12');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(9, '13', '13');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(10, '14', '14');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(11, '17', '17');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(12, '21', '21');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(13, '22', '22');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(14, '23', '23');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(15, '24', '24');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(16, '31', '31');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(17, '32', '32');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(18, '33', '33');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(19, '34', '34');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(20, '41', '41');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(21, '42', '42');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(22, '43', '43');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(23, '44', '44');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(24, '51', '51');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(25, '52', '52');
INSERT INTO WINE_IMAGE (WINE_NO, ORIGIN_NAME, CHANGE_NAME) VALUES
(26, '53', '53');

--CHARACTERISTIC
-- WINE_NO 1: 샤또 마고
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (1, 5, 2, 3, 2);
-- WINE_NO 2: 샤또 슈발 블랑
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (2, 5, 3, 2, 2);
-- WINE_NO 3: 도멘 드 라 로마네 꽁티-라 타슈
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (3, 5, 1, 4, 3);
-- WINE_NO 4: 투핸즈 엔젤스 쉐어 쉬라즈
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (4, 4, 3, 2, 2);
-- WINE_NO 5: 로베르토 보에르지오 랑게 네비올로 디산프란체스코
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (5, 4, 2, 3, 3);
-- WINE_NO 6: 오베르 래리 하이드 앤 선즈 샤도네이
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (6, 3, 2, 2, 2);
-- WINE_NO 7: 파스칼 졸리베 상세르 블랑
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (7, 3, 1, 2, 3);
-- WINE_NO 8: 군트럼 리슬링 로얄블루
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (8, 2, 4, 1, 3);
-- WINE_NO 9: 샤또 디켐
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (9, 5, 5, 1, 3);
-- WINE_NO 10: 페리에 주에 벨 에포크 블랑 드 블랑
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (10, 4, 2, 2, 2);
-- WINE_NO 11: 생 클레어 비카스 초이스 소비뇽 블랑 스파클링
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (11, 3, 2, 1, 3);
-- WINE_NO 12: 파올로 사라꼬 모스카토 다스티
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (12, 2, 5, 1, 2);
-- WINE_NO 13: 로저 구라트 브뤼
INSERT INTO "CHARACTERISTIC" (WINE_NO, BODY, SWEET, BITTER, SOUR)
VALUES (13, 3, 2, 2, 2);


--USER_GRADE
INSERT INTO "USER_GRADE" (GRADE_NO,GRADE_NAME)
VALUES(0,'관리자');

INSERT INTO "USER_GRADE" (GRADE_NO,GRADE_NAME)
VALUES(1,'사용자');

-- ========================== INFO2 ========================================
-- DEPTH 0
-- MAIN
INSERT INTO "INFO2"
VALUES (
    SEQ_INFO.NEXTVAL, 'main', '와인이란?', ' 우리나라의 소주나 막걸리, 일본의 사케, 러시아의 보드카, 세계적으로 널리 마시는 맥주 등 다양한 술이 있지만 그중 인류 역사상 가장 오랜 역사를 가진 술이 바로 와인입니다. 와인의 역사는 지금으로부터 약 7000~8000년 전으로 거슬러 올라가는데, 처음에 누가 발명했는지는 아무도 모릅니다. 단지 자연 발생적이라고 추측하고 있을 뿐입니다.

 역사가 오래된 만큼 종류도 많고 깊이 알면 알수록 어려운 것이 바로 와인입니다. 당장 대형 마트만 가도 와인 코너에 너무 많은 종류의 와인이 있어 무엇을 고를지 다들 고민한 경험이 한 번쯤은 있으시죠? 이러한 선택의 고민을 줄여주는 곳이 바로 "WINE PICKER"입니다.

 내가 원하는 나라별, 종류별 와인들을 한눈에 볼 수 있고 원하는 조건에 맞는 와인들만 모아서 볼 수 있는 곳, 누구에게나 쉽게 열려있는 와인 구매 사이트를 만나보세요!는 와인들만 추려서 볼 수 있는 누구에게나 쉽게 열려있는 와인 구매 사이트를 사용해 보세요!', NULL, NULL, 0, 0, 0, 0
);

--depth : 1
-- WINE
INSERT INTO "INFO2"
VALUES (
    SEQ_INFO.NEXTVAL, 'wine', '와인의 분류', ' 와인을 분류하는 방법에는 색에 따른 분류, 식사 순서에 따른 분류, 저장 기간에 따른 분류, 포도 취급법에 따른 분류, 양조 방식에 따른 분류, 생산 지역에 따른 분류 등 아주 다양한 방법이 있습니다.

 그중 가장 대표적인 방법이 와인의 색상에 따라 레드냐 화이트냐 구분하는 것이지요. 거기에 더해 톡 쏘는 탄산이 있는 스파클링 와인도 빠질 수 없죠!
 또 하나 매우매우 중요한 어디서 생산했는가도 와인을 고르는 데 있어서 아주 중요한 요소이죠. 

 "WINE PICKER"에서 각 분류에 맞게 다양한 종류의 와인을 만나보세요.', NULL, NULL, 0, 0, 0, 1
);
--COUNTRY
INSERT INTO "INFO2"
VALUES (
    SEQ_INFO.NEXTVAL, 'country', 'X', 'X', NULL, NULL, 0, 0, 0, 1
);

-- DEPTH 2
--RED
INSERT INTO "INFO2"
VALUES (
    SEQ_INFO.NEXTVAL, 'Red', '레드 와인', ' 이름 그대로 아름다운 붉은색을 띤 와인. 와인 하면 가장 먼저 떠오르는 상징적인 존재이죠.

 스테이크와 같이 육류와 잘 어울리는 레드와인 중에서도 "WINE PICKER"에서 준비한 대표 품종들(카베르네 소비뇽(Cabernet Sauvignon), 메를로(Merlot), 피노 누아(Pinot Noir), 쉬라(Syrah / Shiraz))을 만나보세요.

 퇴근 후 한잔 마실 수 있는 저렴한 와인부터 특별한 날 분위기를 한층 더 업 시켜줄 수 있는 고급 와인까지 준비했습니다.', NULL, NULL, 0, 1, 0, 2
);
-- WHITE
INSERT INTO "INFO2"
VALUES (
    SEQ_INFO.NEXTVAL, 'White', '화이트 와인', ' 일반적으로 청포도(백포도)로 양조하여 화이트 와인이라는 이름과 달리 은은한 연두빛깔부터 황금빛까지 다양한 색을 지니는 와인입니다. 레드와인보다 과일맛이 강해 맛이 가볍고 청량하기 때문에 와인 초보자들도 편히 마실수 있는 와인이죠.

  와인만 마시거나 크래커 등의 가벼운 핑거푸드, 또는 생선요리와 잘 어울리는 화이트 와인 중에서도 "WINE PICKER"에서 준비한 대표 품종들(샤르도네(Chardonnay), 소비뇽 블랑(Sauvignon Blanc), 리슬링(Riesling))을 만나보세요.

 입문자들도 부담없이 마실 수 있는 와인부터 고급 와인들까지 준비했습니다.', NULL, NULL, 0, 2, 0, 2
);
-- SPARKLING
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Sparkling', '스파클링 와인', '내용 누락', NULL, NULL, 0, 3, 0, 2
);

-- DEPTH 3
-- CABERNET SAUVIGNON
INSERT INTO "INFO2" 
VALUES(
    SEQ_INFO.NEXTVAL, 'Cabernet Sauvignon', '카베르네 소비뇽(Cabernet Sauvignon)', ' 카베르네 소비뇽은 카베르네 프랑(Cabernet Franc)과 소비뇽 블랑(Sauvignon Blanc)의 교배종으로, 와인을 접해본 사람이라면 한 번쯤은 들어 봤을 만한 대표 레드와인 품종 중 하나입니다. 

 과육이 작고 껍질이 두꺼운 것이 특징이며 적응력과 성장력이 강하고 병충해에도 강해 포도의 왕으로 불릴 만큼 현재 전 세계적으로 광범위하게 분포하며 가장 흔히 재배하는 포도 품종으로 대부분이 와인 양조에 사용됩니다.

 진하고 풍부한 맛과 향에, 그만큼 탄닌이 많기 때문에 영와인(Young Wine)일 때는 떫은맛이 강하지만 숙성이 될수록 부드러워지면서 고유의 맛을 풍깁니다. 대부분 드라이한 타입이지만 산뜻한 타입에서 묵직한 타입까지 다양한 특징을 가진 와인으로 변모하는 팔색조 같은 와인입니다.', NULL, NULL, 0, 1, 1, 3
);
--MERLOT
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Merlot', '메를로(Merlot)', ' 메를로라는 이름은 유난히 달콤하고 과즙이 많은 것이 특징인 메를로를 새들이 즐겨 먹었다고 해서 지빠귀, 티티새를 뜻하는 프랑스어(Merle) 에서 유래되었습니다. 유전적으로 메를로는 카베르네 프랑(Cabernet Franc)과 마그들렌 데 샤랑트(Magdelaine des Charente)의 접합 종입니다.
 
 메를로는 대표적인 와인 생산지인 프랑스 보르도(Bordeaux) 지역에 널리 퍼져있는 포도 품종으로, 보르도 지방에서는 카베르네 소비뇽(Cabernet Sauvignon), 카베르네 프랑과 함께 중요한 품종으로 자리매김하고 있습니다.

 생김새는 카베르네 소비뇽과 비슷하지만, 알맹이가 더 통통하고 물기가 많으며 단맛이 강합니다. 카베르네 소비뇽보다 빨리 숙성되면서 순하고 향긋하기 때문에, 다른 포도 품종의 거친 맛을 부드럽게 만들기 위해 혼합해서 사용하기도 합니다.

 메를로는 전체적으로 부드럽고 느낌을 주는 레드 와인으로 음식 없이 와인만으로 즐기기 편하며, 음식과의 매칭에서도 상당히 다재다능한 와인입니다.', NULL, NULL, 0, 1, 2, 3
);
-- PINOT NOIR
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Pinot Noir', '피노 누아(Pinot Noir)', ' 카베르네 소비뇽(Cabernet Sauvignon)이 풍부한 맛으로 승부한다면 피노 누아는 풍부한 향으로 승부하는 품종입니다. 감각적이며 섬세하고 세련된 맛과 향을 지닌 피노 누아는 색소가 적어서 색이 다른 레드와인에 비해 밝고 투명한 루비처럼 나오기 때문에 빛깔이 가장 아름다운 품종으로도 통합니다. 피노 누아 와인을 태양 빛에 비춰 보면 그 색깔이 얼마나 환상적인지 알 수 있습니다.

 껍질이 얇아서 기후, 열과 습도에 민감해 서늘한 지역에서 잘 자라며 부드러운 맛에 복합적인 향이 깃든 고급 와인으로 양조 되어 옛날부터 프랑스 명사들이 극찬했던 품종입니다. 세계 최고의 와인 중 하나로 꼽히는 로마네 콩티의 재료도 바로 이 피노 누아입니다.

 피노 누아 와인은 대체로 블렌딩을 하지 않고 단일 품종으로만 만들며 숙성이 진행됨에 따라 향이 풍부해집니다. 부드럽고 우아한 실크같은 느낌이 나서 와인 매니아 사이에서 공주님으로 통하는 피노누아를 만나보세요.', NULL, NULL, 0, 1, 3, 3
);
-- SYRAH / SHIRAZ
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Syrah', '쉬라(Syrah / Shiraz)', ' 색이 진하고 탄닌이 높아 숙성이 늦고 오래 보관할 수 있는 묵직한 와인을 만들 수 있는 쉬라. 주로 높은 탄닌과 산도, 블랙베리, 다크 초콜릿 아로마를 지닙니다. 쉬라는 검은 과실, 꽃 향이 강렬하며, 후추와 허브 향을 드러냅니다.

 프랑스 론 북부 지방은 물론 신대륙 각국에서 널리 재배되고 있는 인기 품종. 특히 국내에서는 호주산 쉬라즈 와인들이 유명합니다.

 서리와 추위에 강하고 척박한 땅에서 잘 자라며, 색깔이 진하고 향이 중후하면서도 달콤하고 은은하여 제비꽃 향과 진한 색을 지닌 힘찬 남성적인 와인인 쉬라. 숙성이 진행될수록 더욱 선명해지는 특유의 향기를 느낄 수 있는 레드 와인입니다.', NULL, NULL, 0, 1, 4, 3
);

--CHARDONNAY
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Chardonnay', '샤르도네(Chardonnay)', ' 샤르도네는 프랑스 샤블리를 비롯한 부르고뉴 지방 화이트와인의 대표적인 품종으로 전 세계에서 가장 널리 알려진 청포도 품종이며 화이트 와인의 여왕으로 불립니다.

 샤르도네로는 스위트 와인으로도 만들어지지만 드라이한 와인이 주를 이루며 다양한 스타일의 와인이 만들어질 수 있습니다. 일상에서 자주 마시는 데일리 와인부터 장기 숙성이 되는 고급 와인까지 아주 폭 넓고 다양하게 사용되는 품종입니다.

 서늘한 기후의 샤르도네는 청사과, 배, 아카시아, 레몬, 자몽 풍미를 지니며, 숙성되면 견과류와 비스킷, 버터, 꿀 풍미를 보입니다. 더운 기후 샤르도네는 망고, 크림, 바나나, 파인애플, 멜론, 꿀 향을 냅니다. 샤르도네 와인은 다양한 스타일로 만들어지는 만큼 다채로운 음식들과 좋은 조화를 이룹니다.', NULL, NULL, 0, 2, 6, 3
);
-- SAUVIGNON BLANC
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Sauvignon Blanc', '소비뇽 블랑(Sauvignon Blanc)', '내용 누락', NULL, NULL, 0, 2, 7, 3
);
-- RIESLING
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Riesling', '리슬링(Riesling)', ' 독일을 대표하는 품종이었지만 라인강 강가와 모젤 지방, 그리고 프랑스의 알자스 지방에서도 생산되며 최근에는 호주와 뉴질랜드에서도 재배되는 화이트 와인의 대표적인 품종인 리슬링. 
 전 세계적으로 최고급 포도주로 알려져 있으며 추위를 잘 견디며 싹이 늦게 나오는 특징이 있습니다. 알이 작고 둥글며 부드러운 리슬링은 드라이한 와인부터 스위트한 와인까지 여러 가지 타입의 와인을 만들며 신선하고 독특한 향을 냅니다.
 추위에 강한 리슬링은 늦게까지 수확하지 않고 당도가 가장 높은 초겨울 무렵에 수확해서 스위트 와인인 아이스 와인을 양조하기도 합니다.', NULL, NULL, 0, 2, 8, 3
);

-- MUSCAT
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Muscat', '뮈스카(Muscat)', ' 와인의 본고장 프랑스의 뮈스카 품종은 지역에 따라 모스카토(Moscato), 모스카텔(Moscatel), 머스캣 등으로 다양하게 불립니다. 한국에는 가장 단맛이 강한 품종으로 모스카토라는 이름으로 널리 알려져 있습니다. 따라서 다른 와인들에 비해 단맛이 강하고 입문자들에게 가장 부담이 적은 와인입니다. 
 대부분의 화이트 와인 품종들을 시원한 청량감을 더해주는 스파클링 와인으로도 만들지만 특히 단맛이 높은 뮈스카로 만든 스파클링 와인은 대중들에게 인기가 가장 많습니다.
 누구에게나 부담 없고 시원한 뮈스카 스파클링 와인을 "WINE PICKER"에서 만나보세요.', NULL, NULL, 0, 3, 11, 3
);
--CHARDONNAY
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, ' Chardonnay', '샤르도네(Chardonnay)', ' 샤르도네는 프랑스 샤블리를 비롯한 부르고뉴 지방 화이트와인의 대표적인 품종으로 전 세계에서 가장 널리 알려진 청포도 품종이며 화이트 와인의 여왕으로 불립니다.

 샤르도네로는 스위트 와인으로도 만들어지지만 드라이한 와인이 주를 이루며 다양한 스타일의 와인이 만들어질 수 있습니다. 일상에서 자주 마시는 데일리 와인부터 장기 숙성이 되는 고급 와인까지 아주 폭 넓고 다양하게 사용되는 품종입니다.

 서늘한 기후의 샤르도네는 청사과, 배, 아카시아, 레몬, 자몽 풍미를 지니며, 숙성되면 견과류와 비스킷, 버터, 꿀 풍미를 보입니다. 더운 기후 샤르도네는 망고, 크림, 바나나, 파인애플, 멜론, 꿀 향을 냅니다. 샤르도네 와인은 다양한 스타일로 만들어지는 만큼 다채로운 음식들과 좋은 조화를 이룹니다.', NULL, NULL, 0, 3, 10, 3
);
-- SAUVIGNON BLANC
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, ' Sauvignon Blanc', '소비뇽 블랑(Sauvignon Blanc)', '내용 누락', NULL, NULL, 0, 3, 11, 3
);

--FRANCE
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'France', '프랑스', ' 지형과 토양, 기후 등 포도에 영향을 주는 모든 요소에 최적의 자연 조건을 갖추고 있는 국가. 바로 와인하면 가장 먼저 떠오르는 나라 프랑스입니다.

 농산물 중에서 포도가 차지하는 비율이 10% 가량이며 전체 포도 중 레드 와인이 약 60%로 가장 많이 생산되며 단연 세계에서 가장 유명한 와인 생산국이죠. 이탈리아, 스페인과 더불어 오래 전부터 최고의 와인 생산량과 소비량을 자랑합니다. 

 전통과 역사가 깊은 만큼 부담없이 즐길 수 있는 와인부터 최고급 와인까지 다양한 종류의 와인을 선보입니다.', NULL, NULL, 1, 0, 0, 3
);
--ITALY
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Italy', '이탈리아', ' 고대 로마 시대부터 와인의 종주국으로 3000년의 역사를 가지고 있는 이탈리아. 길게 뻗은 국토의 특징으로 언덕과 산악 지대가 많은 데다 바다로 둘러싸여 있기 때문에 지역 별로 포도주의 특징이 강하고 다양한 것이 특징입니다. 와인 생산량, 소비량, 수출량은 1위 프랑스에 이어 2위인 와인하면 빼놓을 수 없는 나라입니다.

 오랜 역사와 전통을 와인에도 접목시켜 상당히 풍부하고 세련된 느낌의 와인이 많은 나라입니다.', NULL, NULL, 1, 0, 0, 3
);
--USA
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'USA', '미국', ' 전통적인 와인 생산지의 유럽 와인에 비해 저렴하지만 좋은 품질의 와인이 많은 미국. 와인 생산지의 신흥 강자에서 빼놓을 수 없는 나라입니다. 필록세라와 경제 대공황, 금주법 등으로 포도주 산업이 발전하지 못하다가 1933년 금주법이 폐지되면서 캘리포니아에서 포도주 산업은 부흥하기 시작하고 캘리포니아의 생산량이 전체 와인의 90%를 차지합니다.

 카베르네 소비뇽, 진판델, 메를로, 쉬라, 피노누아, 샤도네이 등 다양한 품종을 생산하며 수출 대상 국가 사람들의 입맛에 맞게 전략적으로 제조하여 판매하는 것으로 유명합니다.', NULL, NULL, 1, 0, 0, 3
);
--CHILE
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Chile', '칠레', ' 미국, 호주, 아르헨티나 등과 함께 신세계 와인으로 분류되는 칠레. 포도 재배는 16세기경에 시작된 것으로 추정되며 1520년에 에르난 코르테스가 멕시코로 스페인의 포도나무를 가져온 이래로 페루에 포도밭을 형성하였고, 이 포도나무를 칠레에 심기 시작한 것으로 추정되며 현재까지도 가장 널리 재배되고 있습니다.

 생산량 대비 수출 점유율 1위인 수출 주도형 와인 생산국으로 포도 재배에 가장 이상적인 환경을 가진 곳 중 하나입니다. 가성비가 좋은 와인을 생산하는 것으로 유명하며 보르도 스타일 레드 블렌드 포도주가 주력으로 생산되는 나라입니다.', NULL, NULL, 1, 0, 0, 3
);
--AUSTRALIA
INSERT INTO "INFO2"
VALUES(
    SEQ_INFO.NEXTVAL, 'Australia', '호주', ' 19세기부터 유럽에서 포도를 도입하여, 뉴사우스웨일스의 헌터 밸리에서 와인을 만들기 시작하였습니다. 이때부터 영국이 주요 시장으로 발전하였고, 요즘은 경제적으로 발전하여 소비층이 늘어나 가까운 동아시아에서 판촉을 활발히 하고 있습니다.

 1970년대까지만 해도 저렴한 디저트 와인과 값싼 테이블 와인 위주로 생산했으나 1980년대부터 고급품을 만들어 국제적인 명성을 얻기 시작하였습니다. 세계 4위의 와인 수출국이면서, 소비량도 영어권에서는 뉴질랜드와 더불어 1인당 소비량이 가장 많은 나라입니다. 여느 신대륙 와인처럼 가성비가 좋고 저렴한 가격의 와인이 많습니다. 또한 국가 차원에서 코르크 대신에 스크류 캡을 쓰길 권하기 때문에 스크류캡이 달린 포도주가 많습니다. 대표 품종으로는 단연 쉬라즈가 꼽힙니다.', NULL, NULL, 1, 0, 0, 3
);


COMMIT;