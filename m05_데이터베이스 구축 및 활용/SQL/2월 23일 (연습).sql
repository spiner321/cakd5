--���̺� 2�� ����(���� ���� ����)

--������ ���� 5���� ����

--�Ӽ� Ÿ�� ����, ������ �� ����, �Ӽ� �̸� ����, �������� �߰�, savepoint 2�� ����

--savepoint 1������ rollback�� �����۾� ����

--savepoint 2������ rollback�� �����۾� ����

--�۾������� Ȯ��

--2�� ���̺� Join (inner join, left outer join, right outer join, full outer join)�� ����

--2�� ���̺� ���Ͽ� �� ���Ǻ��� ������� ��ȸ�ϰ� �� ������� ���Ͽ� ������(�ߺ����� �� ������), ������, �������� ����ϼ���.


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

INSERT INTO LUNCH VALUES('������', '1', '���ﱹ��', '8500', '5', '20220105');
INSERT INTO LUNCH VALUES('�ڸ�����', '2', '�ڸ���������', '12000', '7', '20220125');
INSERT INTO LUNCH VALUES('��������', '3', '�յ��', '9000', '4', '20220205');
INSERT INTO LUNCH VALUES('������Ĵ�', '4', '�Ұ�Ⱑ������', '8500', '7', '20220115');
INSERT INTO LUNCH VALUES('���̽Ĵ�', '5', 'ġŲ���̽�', '8500', '9', '20220212');

INSERT INTO COUPANG VALUES('1', '�ͽ���', '9500', '');
INSERT INTO COUPANG VALUES('2', '�䷹�ην�', '23000', '20220215');
INSERT INTO COUPANG VALUES('3', '��긮���׶�', '13500', '20220202');
INSERT INTO COUPANG VALUES('4', '�����׸��׸�Ƽ', '', '20210125');
INSERT INTO COUPANG VALUES('5', '����Ʈ���̺���', '12000', '');

SELECT * FROM LUNCH;
DESC LUNCH;
SELECT * FROM COUPANG;

--- ## ����
ALTER TABLE LUNCH MODIFY(MENU VARCHAR2(50));
ALTER TABLE LUNCH RENAME COLUMN GRADE TO GD;
INSERT INTO LUNCH VALUES('���̽Ĵ�', '5', 'ġŲ���̽�', '8500', '9', '20220212');
SAVEPOINT SV1;

SELECT * FROM LUNCH;
DESC LUNCH;

--- ## ���������� �����ϰ� �߰�
ALTER TABLE LUNCH MODIFY GD NOT NULL;
ALTER TABLE COUPANG MODIFY CUSTID NULL;
SAVEPOINT SV2;
UPDATE COUPANG SET custid = '' WHERE product = '�ͽ���';

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