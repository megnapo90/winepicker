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

-- COUNTRY

INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(1, '프랑스', 'FRANCE');

INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(2, '이탈리아', 'ITALY');

INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(3, '미국' ,'USA');

INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(4, '칠레', 'CHILE');

INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(5, '호주', 'AUSTRALIA');

INSERT INTO COUNTRY (COUNTRY_NO, COUNTRY_NAME, COUNTRY_ENG_NAME)
VALUES(6, '그 외', 'OTHER');

-- WINE
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '샤또 마고', 1, 1, 2010, 1000000, 750, 10, '보르도의 최고 레드 와인중 하나', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '샤또 슈발 블랑', 2, 1, 2015, 100000, 750, 10, '보르도의 최고 레드 와인중 하나', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '도멘 드 라 로마네 꽁티-라 타슈', 3, 1, 2009, 400000, 750, 10, '부르고뉴의 최고 로마네꽁띠', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '투핸즈 엔젤스 쉐어 쉬라즈', 4, 4, 2022, 30000, 750, 10, '프리미엄 호주 쉬라즈의 대명사', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '로베르토 보에르지오 랑게 네비올로 디산프란체스코', 5, 2, 2013, 100000, 750, 10, '이태리 가성비 네비올로의 최강자', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '오베르 래리 하이드 앤 선즈 샤도네이', 6, 3, 2023, 210000, 750, 10, '와인 미국 5대 화이트 컬트 와이너리', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '파스칼 졸리베 상세르 블랑', 7, 1, 2009, 87000, 750, 10, '프랑스 루아르 밸리에서 가장 유명한 도멘 중 하나', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '군트럼 리슬링 로얄블루', 8, 6, 2024, 13000, 750, 10, '우아하고 클래식한 전통 리슬링', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '샤또 디켐', 9, 1, 1986, 990000, 750, 10, '신들의 넥타라 칭송받는 세계 최고의 스위트 와인', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '페리에 주에 벨 에포크 블랑 드 블랑', 10, 1, 2019, 340000, 750, 10, ' 유럽 왕실의 샴페인으로, 빅토리아 여왕, 나폴레옹 3세, 벨기에의 레오폴 1세 등이 사랑한 샴페인', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '생 클레어 비카스 초이스 소비뇽 블랑 스파클링', 11, 6, 2024, 18000, 750, 10, '각종 국제대회에서 금메달을 수상하며 세계적으로 주목을 받기 시작한 뉴질랜드 와인', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '파올로 사라꼬 모스카토 다스티', 12, 2, 2024, 61000, 750, 10, '모스카토 다스티 3대장중 하나', 'Y');
INSERT INTO WINE (WINE_NO, WINE_NAME, GRAPE_NO, COUNTRY_NO, VINTAGE, PRICE, VOLUME, QUANTITY, CONTENT, STATUS)
VALUES(WINE_SEQ.NEXTVAL, '로저 구라트 브뤼', 13, 6, 2017, 35000, 750, 10, '가성비 끝판왕 스페인의 돔 페리뇽이라 불리는 로저 구라트', 'Y');

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

--USER
INSERT INTO "USER" (
   "USER_NO","GRADE_NO", "USER_ID", "USER_PWD", "USER_NAME", "USER_EMAIL", "USER_SSN", "PHONE", "ADDRESS", "ENROLL_DATE", "MODIFY_DATE", "STATUS"
) VALUES (
   USER_SEQ.NEXTVAL, 0, 'admin', 'admin', '관리자', 'admin@example.com', '123456-1234567', '010-1234-5678', '서울시 강남구', DEFAULT, DEFAULT, 'Y'
);


INSERT INTO "USER" (
   "USER_NO", "GRADE_NO", "USER_ID", "USER_PWD", "USER_NAME", "USER_EMAIL", "USER_SSN", "PHONE", "ADDRESS", "ENROLL_DATE", "MODIFY_DATE", "STATUS"
) VALUES (
   USER_SEQ.NEXTVAL, DEFAULT, 'user', 'user', '홍길동', 'user@example.com', '123456-1234567', '010-5678-1234', '서울시 강남구', DEFAULT, DEFAULT, 'Y'
);


-- ========================== INFO2 ========================================
-- DEPTH 0
-- MAIN
INSERT INTO "INFO2" (
    INFO_NAME, CONTENT, SUBTITLE, ORIGIN_NAME, CHANGE_NAME, COUNTRY_NO, WINE_TYPE_NO, GRAPE_NO, DEPTH
)
VALUES (
    'MAIN', 
    '포도주(葡萄酒)는 포도의 즙을 발효시켜서 만든 알코올성의 양조주를 일컫는다. 또한 넓은 의미에선 포도의 즙으로 만든 알코올성 음료뿐만 아니라 뭇 과실이나 꽃 혹은 약초를 발효시켜서 만든 알코올성 음료를 총칭하는 말로도 확장되어 쓰인다.
    영어의 ''Wine''은 한국어로는 포도주로 번역되나 엄밀히 말해서 완전히 같은 것은 아니다. Wine은 1차적으로는 포도주를 일컫지만, 과실주 전반을 뜻하는 말로 확장되어 쓰이기 때문이다. 이 때는 해당 작물이나 곡류의 이름을 함께 병기하여 블루베리 와인, 라즈베리 와인, 아이스베리 와인, 체리 와인, 감 와인 등으로 쓴다. 심지어는 곡주인 동아시아 한중일 삼국의 청주, 황주, 사케까지 Rice Wine이라고 표현하기도 한다. 다만 Wine이 본래는 포도주의 의미[1]이고 블루베리 와인이니 체리 와인이니 하는 건 유자차, 인삼차[2]처럼 비슷한 성향의 음료를 통칭해 부르는 말이므로 Wine을 포도주로 번역하는 게 틀린 번역은 아니다. 다만 번역할 때, 포도주가 아닌 다른 과일 발효주를 의미하는 경우도 있으니 이 점은 주의해야 하며, 자세한 내용은 과일주 문서에 나와 있다.
    한편, 학술적으로는 ''포도주''라 표기하는 경우가 많고, 상업적으로는 영문 표기를 음차한 ''와인''이라는 표현을 사용하는 경우가 많은데, 대중들 사이에서는 어느쪽 표현이 독보적인 우세를 점하고 있지는 않지만 마트나 백화점 등 판매처에서 와인이라는 표기를 사용하는 경우가 많아 와인으로 표기하는 비중이 많이 늘어난 편이다.
    이탈리아어와 스페인어로는 비노(vino)로 철자는 같지만, 발음은 약간 다르다.[3] 프랑스어는 철자가 약간 달라서 뱅(vin)이다.
    전 세계에서 매년 생산되는 포도주의 종류는 셀 수 없이 많다. 최근엔 옐로우 와인(Yellow Wine)이나 앰버 와인(Amber Wine) 등 기존 분류에 새로운 종류가 추가되기도 하였다.
    포도주의 성분을 들여다보면, 적포도주 기준 평균적으로 수분 86%, 에탄올(알코올) 12%, 글리세롤 1%, 유기산 0.4%, 타닌 및 폴리페놀계 화합물 0.1%, 기타 성분 0.5%로 구성된다.
    포도주를 마시지 않은 사람들에게는 대중매체에서 포도주가 자주 등장하고, 쉽게쉽게 마시는 장면이 많아 막연하게 맥주급으로 도수가 낮은 술이라는 이미지를 가지기 쉬운데 사실 10~15% 정도로 생각보다 도수가 강한 편이다. 희석식 소주가 20도 후반을 찍곤 했던 과거에는 약한 술이었지만, 도수가 센 포도주는 과일소주보다 높고 지금의 희석식 소주와는 조금 낮거나 비슷한 정도이다. 그래서 포도주를 처음 마시는 사람 중에는 생각보다 강한 도수에 놀라는 경우도 있다.',
    '와인의 역사', NULL, NULL, 0, 0, 0, 0
);

--depth : 1
-- WINE
INSERT INTO "INFO2" (
    INFO_NAME, CONTENT, SUBTITLE, ORIGIN_NAME, CHANGE_NAME, COUNTRY_NO, WINE_TYPE_NO, GRAPE_NO, DEPTH
)
VALUES (
    'WINE',
    '<백포도주, 적포도주, 로제 와인> 등 와인의 색으로 구분이 가능하다. 자세한 내용은 해당 문서 참고.
    백포도주는 적포도 또는 청포도(백포도)를 사용하며 포도즙을 낼 때 껍질을 제거한 채 알맹이만을 발효시켜서 만든 것으로 연한 밀짚색을 띤다.
    적포도주는 수확된 포도를 껍질까지 즙을 내어 발효시켜서 과피에서 우러나온 색으로 인해 적색을 띤다.
    로제 와인은 백포도주와 적포도주의의 중간 정도 색인 분홍색 또는 진홍색을 띤다. 포도즙만 짜낸 후 또는 숙성 도중 과피를 걷어내거나 적포도주 약간을 (같은 품종 적포도로 양조된)백포도주에 섞는 식으로 만들어진다.',
    '와인의 분류', NULL, NULL, 0, 0, 0, 1
);

--COUNTRY
INSERT INTO "INFO2" (
    INFO_NAME, CONTENT, SUBTITLE, ORIGIN_NAME, CHANGE_NAME, COUNTRY_NO, WINE_TYPE_NO, GRAPE_NO, DEPTH
)
VALUES (
    'COUNTRY', 'X', NULL, NULL, NULL, 0, 0, 0, 1
);

-- DEPTH 2
--RED
INSERT INTO "INFO2" (
    INFO_NAME, CONTENT, SUBTITLE, ORIGIN_NAME, CHANGE_NAME, COUNTRY_NO, WINE_TYPE_NO, GRAPE_NO, DEPTH
)
VALUES (
    'RED',
    '이름 그대로 붉은색을 띤 포도주를 지칭하며, 영어로는 레드 와인이라고 한다.',
    '레드 와인', NULL, NULL, 0, 1, 0, 2
);

-- WHITE
INSERT INTO "INFO2" (
    INFO_NAME, CONTENT, SUBTITLE, ORIGIN_NAME, CHANGE_NAME, COUNTRY_NO, WINE_TYPE_NO, GRAPE_NO, DEPTH
)
VALUES (
    'WHITE',
    '빛이 맑고 투명한 포도주를 통칭한다. 주로 청포도로 만들기 때문에 청포도 특유의 은은한 연둣빛을 내는 것이 대부분이나 숙성 과정과 품종에 따라서 황금빛을 띄는 것도 있다.',
    '화이트 와인', NULL, NULL, 0, 2, 0, 2
);

-- SPARKLING
INSERT INTO "INFO2"(
    INFO_NAME, CONTENT, SUBTITLE, ORIGIN_NAME, CHANGE_NAME, COUNTRY_NO, WINE_TYPE_NO, GRAPE_NO, DEPTH
)
VALUES(
    'SPARKLING',
    '일반적인 포도주와는 다르게 탄산이 있는 것이 특징인 포도주이다. ''탄산 포도주'', ''거품 포도주'', ''발포성 포도주''로 표현할 수 있다.',
    '스파클링 와인 ', NULL, NULL, 0, 3, 0, 2
);



-- DEPTH 3
--MERLOT
INSERT INTO "INFO2"(
    INFO_NAME, CONTENT, SUBTITLE, ORIGIN_NAME, CHANGE_NAME, COUNTRY_NO, WINE_TYPE_NO, GRAPE_NO, DEPTH
)
VALUES(
    'MERLOT',
    'Merlot - 메를로라는 이름은 지빠귀, 티티새를 뜻하는 프랑스어(Merle)에서 유래되었다. 유난히 달콤하고 과즙이 많은 이 포도를 종달새들이 즐겨 먹었다고 해서 이런 이름이 붙었다. 유전자 분석에 따르면, 메를로는 카베르네 프랑(Cabernet Franc)과 마그들렌 데 샤랑트(Magdelaine des Charente)의 접합종이다.',
    '메를로 설명', NULL, NULL, 0, 1, 2, 3
);

--CHARDONNAY
INSERT INTO "INFO2"(
    INFO_NAME, CONTENT, SUBTITLE, ORIGIN_NAME, CHANGE_NAME, COUNTRY_NO, WINE_TYPE_NO, GRAPE_NO, DEPTH
)
VALUES(
    'CHARDONNAY',
    'Chardonnay / Weissburgunder(샤르도네 / 샤도네이 / 바이스부르군더[17]) - 샤르도네는 프랑스 샤블리를 비롯한 부르고뉴 지방 화이트와인의 대표적인 품종으로 전 세계에서 가장 널리 알려진 청포도 품종이며 화이트 와인의 여왕으로 불린다. 현재로서는 프랑스 부르고뉴에서 처음 재배가 이루어졌다는 기록이 전해진다. 일찍 싹이 터서 봄 서리에 취약하지만, 열매가 일찍 익어서 이른 겨울이 찾아와도 안정적인 수확이 가능하다. 또한 나무의 활력이 왕성하고 서늘한 기후부터 더운 기후대까지 모두 적응한다. 다만 껍질이 얇고 습한 곳에서는 보트리시스 곰팡이에 취약하다. 주로 석회질 토양과 점토 석회질 토양에서 잘 자란다. 서늘한 지역인 샤블리에서는 산도가 높고 레몬, 풋사과와 같은 중립적인 향을 띠지만 날씨가 따뜻해질수록 복숭아, 파인애플, 망고와 같은 열대 과일 향이 난다. 또한 젖산 발효, 효모 찌꺼기(Lees) 숙성, 오크 숙성 유무에 따라서 와인 스타일이 크게 차이 난다.',
    '샤르도네 설명', NULL, NULL, 0, 2, 6, 3
);

--FRANCE
INSERT INTO "INFO2"(
    INFO_NAME, CONTENT, SUBTITLE, ORIGIN_NAME, CHANGE_NAME, COUNTRY_NO, WINE_TYPE_NO, GRAPE_NO, DEPTH
)
VALUES(
    'FRANCE',
    '프랑스 공화국(République française), 약칭 프랑스(France)는 유럽의 본토와 전 세계에 퍼져있는 여러 해외 영토로 구성된 공화국이다.',
    '프랑스 개요', NULL, NULL, 1, 0, 0, 3
);

--WINE_TYPE
INSERT INTO "WINE_TYPE"
VALUES(1, '레드와인', 'RED');
INSERT INTO "WINE_TYPE"
VALUES(2, '화이트와인', 'WHITE');
INSERT INTO "WINE_TYPE"
VALUES(3, '스파클링와인', 'SPARKLING');


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

SELECT * 
		FROM WINE W
		LEFT JOIN WINE_IMAGE USING(WINE_NO)
		LEFT JOIN COUNTRY C USING(COUNTRY_NO)
		LEFT JOIN CHARACTERISTIC CH USING(WINE_NO)
		LEFT JOIN GRAPE G USING(GRAPE_NO)
		LEFT JOIN WINE_TYPE WT USING(WINE_TYPE_NO)
		WHERE WINE_NO = 13;

SELECT 
			WINE_NO,
			WINE_NAME,
			WINE_TYPE_NAME,
			GRAPE_NAME,
			COUNTRY_NAME,
			VINTAGE,
			VOLUME,
			QUANTITY,
			PRICE,
			STATUS 
		FROM WINE W
		LEFT JOIN COUNTRY C USING(COUNTRY_NO)
		LEFT JOIN GRAPE G USING(GRAPE_NO)
		LEFT JOIN WINE_TYPE WT USING(WINE_TYPE_NO);
        
        SELECT 
			WINE_NO,
			WINE_NAME,
			WINE_TYPE_NAME,
			GRAPE_NAME,
			COUNTRY_NAME,
			VINTAGE,
			VOLUME,
			QUANTITY,
			PRICE,
			STATUS 
		FROM WINE W
		LEFT JOIN COUNTRY C USING(COUNTRY_NO)
		LEFT JOIN GRAPE G USING(GRAPE_NO)
		LEFT JOIN WINE_TYPE WT USING(WINE_TYPE_NO);


COMMIT;



