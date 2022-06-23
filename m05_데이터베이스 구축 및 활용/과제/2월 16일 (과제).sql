--[테이블 생성 규칙]

--테이블명은 객체를 의미할 수 있는 적절한 이름을 사용한다. 가능한 단수형을 권고한다.--
--테이블명은 다른 테이블의 이름과 중복되지 않아야 한다.--
--한 테이블 내에서는 칼럼명이 중복되게 지정될 수 없다. --
--테이블 이름을 지정하고 각 칼럼들은 괄호 "( )" 로 묶어 지정한다.--
--각 칼럼들은 콤마" ", 로 구분되고, 항상 끝은 세미콜론 ";"으로 끝난다.--
--칼럼에 대해서는 다른 테이블까지 고려하여 데이터베이스 내에서는 일관성 있게 사용하는 것이 좋다. (데이터 표준화 관점)--
--칼럼 뒤에 데이터 유형은 꼭 지정되어야 한다.--
--테이블명과 칼럼명은 반드시 문자로 시작해야 하고, 벤더별로 길이에 대한 한계가 있다.--
--벤더에서 사전에 정의한 예약어(Reserved word)는 쓸 수 없다.--
--A-Z, a-z, 0-9, _, $, # 문자만 허용된다.
select * from tabs;
CREATE TABLE MEMBER
(
ID VARCHAR2(20),
PWD VARCHAR2(20),
NAME VARCHAR2(20),
GENDER NCHAR(2),
AGE NUMBER(3),
BIRTHDAY VARCHAR2(50),
PHONE VARCHAR2(13),
REGDATE DATE
);
INSERT INTO MEMBER(ID,PWD,NAME)VALUES('200901','111','JAMES');

DROP TABLE MEMBER;

INSERT INTO MEMBER VALUES('200902','111','JAMES','M',29,'01-JAN-99','010-1234-2345','1994/05/02');

ALTER TABLE MEMBER ADD TEXT NCLOB;

INSERT INTO MEMBER(ID,PWD,TEXT)VALUES('200903','112','정치는 국민을 위해 존재한다');

--기존 테이블을 이용하여 새로운 테이블을 생성
CREATE TABLE MEMBER1 AS SELECT * FROM MEMBER;
SELECT * FROM MEMBER;

--테이블 속성 및 타입 조회
DESC MEMBER;
--테이블 리스트 조회
SELECT * FROM TABS;

--ALTER
DESC MEMBER1;
--수정
ALTER TABLE MEMBER1 MODIFY(ID VARCHAR2(50), NAME NVARCHAR2(50));
--변경
ALTER TABLE MEMBER1 RENAME COLUMN BIRTHDAT TO BD;
--삭제
ALTER TABLE MEMBER1 DROP COLUMN AGE;
--추가
ALTER TABLE MEMBER1 ADD AGE NUMBER;

ALTER TABLE MEMBER1 ADD CONSTRAINT MEMBER1_PK PRIMARY KEY (ID);
----------------------------------------------------------------------------------

--[과제] MEMBER2 테이블을 생성한 후 수정, 변경, 삭제, 추가 작업을 수행하세요. (CARRER TABLE, 속성은 5개 이상)

CREATE TABLE MEMBER2
(
ID VARCHAR2(20),
PWD VARCHAR2(20),
NAME VARCHAR2(20),
GENDER NCHAR(2),
AGE NUMBER(3),
BIRTHDAY VARCHAR2(50),
PHONE VARCHAR2(13),
REGDATE DATE
);

DESC MEMBER2;
ALTER TABLE MEMBER2 DROP COLUMN PWD, REGDATE;
ALTER TABLE MEMBER2 ADD PWD VARCHAR2(20);
INSERT INTO MEMBER2(ID)VALUES('S P I N E R');
-------------------------------------------------------------------------------------------------------
DESC CUSTOMER

-- [과제] 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색하세요.
-- _은 특정 위치의 한개의 문자와 일치
-- %는 0개 이상의 문자와 일치
SELECT BOOKNAME, PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE '_구%';

-- [과제] 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색
SELECT *
FROM BOOK
WHERE BOOKNAME LIKE '%축구%' AND PRICE >= 20000;

-- [과제] 가격이 20,000인 도서를 주문한 고객의 이름과 도서의 이름을 구하세요.
SELECT CUSTOMER.NAME, BOOK.BOOKNAME FROM BOOK, CUSTOMER, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.CUSTID = ORDERS.CUSTID 
AND BOOK.PRICE = 20000;

SELECT C.NAME, B.BOOKNAME 
FROM BOOK B, CUSTOMER C, ORDERS O -- AS 생략
WHERE B.BOOKID = O.BOOKID AND C.CUSTID = O.CUSTID 
AND B.PRICE = 20000;

-- [과제] 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하세요.
-- OUTER JOIN 조인 조건을 만족하지 못하더라도 해당 행을 나타냄
SELECT CUSTOMER.NAME, ORDERS.SALEPRICE 
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID(+)
ORDER BY CUSTOMER.NAME;

-- [과제] 가장 비싼 도서의 이름을 출력하세요.
SELECT BOOKNAME
FROM BOOK
WHERE PRICE = (SELECT MAX(PRICE)
               FROM BOOK);

-- [과제] 도서를 구매한 적이 있는 고객의 이름을 검색하세요.
SELECT DISTINCT CUSTOMER.NAME 
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY CUSTOMER.NAME;

SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID
                 FROM ORDERS)
ORDER BY CUSTOMER.NAME;

-- [과제] 대한미디어에서 출판한 도서를 구매한 고객의 이름을 출력하세요.

SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN 
(SELECT CUSTID FROM ORDERS
 WHERE BOOKID IN
 (SELECT BOOKID FROM BOOK
  WHERE PUBLISHER ='대한미디어'));