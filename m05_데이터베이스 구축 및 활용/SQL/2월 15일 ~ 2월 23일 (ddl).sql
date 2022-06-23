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
ID       VARCHAR2(50),
PWD      VARCHAR2(50),
NAME     VARCHAR2(50),
GENDER   VARCHAR2(50),
AGE      NUMBER,
BIRTHDAY VARCHAR2(50),
PHONE    VARCHAR2(50),
REGDATE  DATE
);

DROP TABLE MEMBER;

CREATE TABLE MEMBER
(
ID       VARCHAR2(20),
PWD      VARCHAR2(20),
NAME     VARCHAR2(20),
GENDER   NCHAR(2),
AGE      NUMBER(3),
BIRTHDAY VARCHAR2(10),
PHONE    VARCHAR2(13),
REGDATE  DATE
);


-- # �Ϻ� �Ӽ��� �Է�
INSERT INTO MEMBER(ID, PWD, NAME)VALUES('200901','111','KEVIN'); 
SELECT * FROM MEMBER;


-- # ��ü ��� �Է�
INSERT INTO MEMBER VALUES('200902','112','JAMES','M',29,'01-JAN-99','010-1234-2345','1994/05/02');
SELECT * FROM MEMBER;
ALTER TABLE MEMBER ADD TEXT NCLOB;
INSERT INTO MEMBER(ID, PWD,TEXT) VALUES('200903','112','��ġ�� ������ ���� �����Ѵ�');


-- # ���� ���̺��� �̿��Ͽ� ���ο� ���̺��� ����
CREATE TABLE MEMBER1 AS SELECT * FROM MEMBER;
SELECT * FROM MEMBER;
DESC member1;
CREATE TABLE member2 AS SELECT * FROM member1 WHERE 1 = 0;
DESC member2;


-- # ���̺��� ��� row ����
TRUNCATE TABLE member1;


-- # ���̺� �Ӽ� �� Ÿ�� ��ȸ
DESC MEMBER;


-- # ���̺� ����Ʈ ��ȸ
SELECT * FROM TABS;


-- # ALTER
DESC MEMBER1;
--- ## ����
ALTER TABLE MEMBER1 MODIFY(ID VARCHAR2(50), NAME NVARCHAR2(50));
--- ## ����
ALTER TABLE MEMBER1 RENAME COLUMN BIRTHDAT TO BD;
--- ## ����
ALTER TABLE MEMBER1 DROP COLUMN AGE;
--- ## �߰�
ALTER TABLE MEMBER1 ADD AGE NUMBER;
--- ## ���������� �����ϰ� �߰�
ALTER TABLE MEMBER1 ADD CONSTRAINT MEMBER1_PK PRIMARY KEY (ID);


-- # �Ʒ� �������� ���̺��� ������
--���̺�� : PLAYER
--���̺� ���� : K-���� �������� ������ ������ �ִ� ���̺�
--Į���� : PLAYER_ID (����ID) ���� ���� �ڸ��� 7�ڸ�,
--PLAYER_NAME (������) ���� ���� �ڸ��� 20�ڸ�,
--TEAM_ID (��ID) ���� ���� �ڸ��� 3�ڸ�,
--JOIN_YYYY (�Դܳ⵵) ���� ���� �ڸ��� 4�ڸ�,
--POSITION (������) ���� ���� �ڸ��� 10�ڸ�,
--BACK_NO (���ȣ) ���� 2�ڸ�,
--NATION (����) ���� ���� �ڸ��� 20�ڸ�,
--BIRTH_DATE (�������) ��¥,
--�������� : �⺻Ű(PRIMARY KEY) :  PLAYER_ID
--(�������Ǹ��� PLAYER_PK)
--���� �ݵ�� ���� (NOT NULL) : PLAYER_NAME, TEAM_ID

CREATE TABLE PLAYER
(
PLAYER_ID    NCHAR(7),
PLAYER_NAME  VARCHAR2(20) NOT NULL,
TEAM_ID      NCHAR(3) NOT NULL,
JOIN_YYYY    NCHAR(4),
POSITION     VARCHAR2(10),
BACK_NO      NUMBER(2),
NATION       VARCHAR2(20),
BIRTH_DATE   DATE,
CONSTRAINT PLAYER_PK PRIMARY KEY(PLAYER_ID)
);
DESC PLAYER;