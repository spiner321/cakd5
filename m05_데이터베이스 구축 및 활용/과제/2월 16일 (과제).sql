--[���̺� ���� ��Ģ]

--���̺���� ��ü�� �ǹ��� �� �ִ� ������ �̸��� ����Ѵ�. ������ �ܼ����� �ǰ��Ѵ�.--
--���̺���� �ٸ� ���̺��� �̸��� �ߺ����� �ʾƾ� �Ѵ�.--
--�� ���̺� �������� Į������ �ߺ��ǰ� ������ �� ����. --
--���̺� �̸��� �����ϰ� �� Į������ ��ȣ "( )" �� ���� �����Ѵ�.--
--�� Į������ �޸�" ", �� ���еǰ�, �׻� ���� �����ݷ� ";"���� ������.--
--Į���� ���ؼ��� �ٸ� ���̺���� ����Ͽ� �����ͺ��̽� �������� �ϰ��� �ְ� ����ϴ� ���� ����. (������ ǥ��ȭ ����)--
--Į�� �ڿ� ������ ������ �� �����Ǿ�� �Ѵ�.--
--���̺��� Į������ �ݵ�� ���ڷ� �����ؾ� �ϰ�, �������� ���̿� ���� �Ѱ谡 �ִ�.--
--�������� ������ ������ �����(Reserved word)�� �� �� ����.--
--A-Z, a-z, 0-9, _, $, # ���ڸ� ���ȴ�.
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

INSERT INTO MEMBER(ID,PWD,TEXT)VALUES('200903','112','��ġ�� ������ ���� �����Ѵ�');

--���� ���̺��� �̿��Ͽ� ���ο� ���̺��� ����
CREATE TABLE MEMBER1 AS SELECT * FROM MEMBER;
SELECT * FROM MEMBER;

--���̺� �Ӽ� �� Ÿ�� ��ȸ
DESC MEMBER;
--���̺� ����Ʈ ��ȸ
SELECT * FROM TABS;

--ALTER
DESC MEMBER1;
--����
ALTER TABLE MEMBER1 MODIFY(ID VARCHAR2(50), NAME NVARCHAR2(50));
--����
ALTER TABLE MEMBER1 RENAME COLUMN BIRTHDAT TO BD;
--����
ALTER TABLE MEMBER1 DROP COLUMN AGE;
--�߰�
ALTER TABLE MEMBER1 ADD AGE NUMBER;

ALTER TABLE MEMBER1 ADD CONSTRAINT MEMBER1_PK PRIMARY KEY (ID);
----------------------------------------------------------------------------------

--[����] MEMBER2 ���̺��� ������ �� ����, ����, ����, �߰� �۾��� �����ϼ���. (CARRER TABLE, �Ӽ��� 5�� �̻�)

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

-- [����] �����̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ������ �˻��ϼ���.
-- _�� Ư�� ��ġ�� �Ѱ��� ���ڿ� ��ġ
-- %�� 0�� �̻��� ���ڿ� ��ġ
SELECT BOOKNAME, PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE '_��%';

-- [����] �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻�
SELECT *
FROM BOOK
WHERE BOOKNAME LIKE '%�౸%' AND PRICE >= 20000;

-- [����] ������ 20,000�� ������ �ֹ��� ���� �̸��� ������ �̸��� ���ϼ���.
SELECT CUSTOMER.NAME, BOOK.BOOKNAME FROM BOOK, CUSTOMER, ORDERS
WHERE BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.CUSTID = ORDERS.CUSTID 
AND BOOK.PRICE = 20000;

SELECT C.NAME, B.BOOKNAME 
FROM BOOK B, CUSTOMER C, ORDERS O -- AS ����
WHERE B.BOOKID = O.BOOKID AND C.CUSTID = O.CUSTID 
AND B.PRICE = 20000;

-- [����] ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���ϼ���.
-- OUTER JOIN ���� ������ �������� ���ϴ��� �ش� ���� ��Ÿ��
SELECT CUSTOMER.NAME, ORDERS.SALEPRICE 
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID(+)
ORDER BY CUSTOMER.NAME;

-- [����] ���� ��� ������ �̸��� ����ϼ���.
SELECT BOOKNAME
FROM BOOK
WHERE PRICE = (SELECT MAX(PRICE)
               FROM BOOK);

-- [����] ������ ������ ���� �ִ� ���� �̸��� �˻��ϼ���.
SELECT DISTINCT CUSTOMER.NAME 
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY CUSTOMER.NAME;

SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID
                 FROM ORDERS)
ORDER BY CUSTOMER.NAME;

-- [����] ���ѹ̵��� ������ ������ ������ ���� �̸��� ����ϼ���.

SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN 
(SELECT CUSTID FROM ORDERS
 WHERE BOOKID IN
 (SELECT BOOKID FROM BOOK
  WHERE PUBLISHER ='���ѹ̵��'));