--테이블 2개 생성(제약 조건 포함)

--데이터 각각 5개씩 삽입

--속성 타입 수정, 데이터 값 변경, 속성 이름 변경, 제약조건 추가, savepoint 2개 포함

--savepoint 1번으로 rollback후 동일작업 수행

--savepoint 2번으로 rollback후 동일작업 수행

--작업내용을 확정

--2개 테이블 Join (inner join, left outer join, right outer join, full outer join)을 수행

--2개 테이블에 대하여 각 조건별로 결과물을 조회하고 그 결과물에 대하여 합집합(중복포함 및 미포함), 교집함, 차집함을 출력하세요.


CREATE TABLE LUNCH
(
RESTAURANT      VARCHAR2(20),
CUSTID          NUMBER(10) NOT NULL,
MENU            VARCHAR2(30),
PRICE           NUMBER(10),
GRADE           NUMBER(3),
VISIT_DATE      DATE
);

CREATE TABLE COUPANG
(
CUSTID          NUMBER(10) NOT NULL,
PRODUCT         VARCHAR(30),
PRICE           NUMBER(10),
ORDER_DATE      DATE
);

INSERT INTO LUNCH VALUES('육수당', '1', '서울국밥', '8500', '5', '20220105');
INSERT INTO LUNCH VALUES('자마버거', '2', '자마오리지널', '12000', '7', '20220125');
INSERT INTO LUNCH VALUES('돈까스대왕전', '3', '왕돈까스', '9000', '4', '20220205');
INSERT INTO LUNCH VALUES('모미지식당', '4', '소고기가지덮밥', '8500', '7', '20220115');
INSERT INTO LUNCH VALUES('까이식당', '5', '치킨라이스', '8500', '9', '20220212');

INSERT INTO COUPANG VALUES('1', '믹스넛', '9500', '');
INSERT INTO COUPANG VALUES('2', '페레로로쉐', '23000', '20220215');
INSERT INTO COUPANG VALUES('3', '페브리즈레몬그라스', '13500', '20220202');
INSERT INTO COUPANG VALUES('4', '리스테린그린티', '', '20210125');
INSERT INTO COUPANG VALUES('5', '질레트쉐이빙젤', '12000', '');

SELECT * FROM LUNCH;
DESC LUNCH;
SELECT * FROM COUPANG;

--- ## 수정
ALTER TABLE LUNCH MODIFY(MENU VARCHAR2(50));
ALTER TABLE LUNCH RENAME COLUMN GRADE TO GD;
INSERT INTO LUNCH VALUES('까이식당', '5', '치킨라이스', '8500', '9', '20220212');
SAVEPOINT SV1;

SELECT * FROM LUNCH;
DESC LUNCH;

--- ## 제약조건을 설정하고 추가
ALTER TABLE LUNCH MODIFY GD NOT NULL;
ALTER TABLE COUPANG MODIFY CUSTID NULL;
SAVEPOINT SV2;
UPDATE COUPANG SET custid = '' WHERE product = '믹스넛';

SELECT * FROM LUNCH;
DESC LUNCH;
SELECT * FROM COUPANG;
DESC COUPANG;

ROLLBACK TO SV1;
ROLLBACK TO SV2;

COMMIT;

SELECT * FROM LUNCH JOIN COUPANG ON LUNCH.CUSTID = COUPANG.CUSTID(+);
SELECT * FROM LUNCH INNER JOIN COUPANG ON LUNCH.CUSTID = COUPANG.CUSTID;
SELECT * FROM LUNCH LEFT OUTER JOIN COUPANG ON LUNCH.CUSTID = COUPANG.CUSTID;
SELECT * FROM LUNCH RIGHT OUTER JOIN COUPANG ON LUNCH.CUSTID = COUPANG.CUSTID;
SELECT * FROM LUNCH FULL OUTER JOIN COUPANG ON LUNCH.CUSTID = COUPANG.CUSTID;