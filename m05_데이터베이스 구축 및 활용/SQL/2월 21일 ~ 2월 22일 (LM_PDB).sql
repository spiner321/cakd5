SELECT * FROM CUSTDEMO;
SELECT COUNT(*) FROM PURPROD;
SELECT * FROM PURPROD;

ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR = SUBSTR(��������, 1, 4);
COMMIT;

SELECT * FROM PURPROD;
COMMIT;

CREATE TABLE PURBYYEAR AS
SELECT ����ȣ, YEAR, SUM(���űݾ�) ���ž�
FROM PURPROD
GROUP BY ����ȣ, YEAR
ORDER BY ����ȣ;

SELECT * FROM PURBYYEAR;

CREATE TABLE pur_amt AS
SELECT ����ȣ cusno, sum(���űݾ�) puramt
FROM PURPROD
GROUP BY ����ȣ
ORDER BY ����ȣ;

---------------------------------------------------------------------------------------------

-- # 2014 ~ 2015�� ������ 4�� ȸ�� ���� ������

--- ## �� �Ӽ����� : 19383�� (����)
SELECT * FROM CUSTDEMO;
SELECT COUNT(*) FROM CUSTDEMO;

SELECT * FROM CUMPET;
SELECT COUNT(*) FROM CUMPET;

SELECT * FROM CHANNEL;
SELECT COUNT(*) FROM CHANNEL;

SELECT * FROM MEMBERSHIP;
SELECT COUNT(*) FROM MEMBERSHIP;

SELECT * FROM PRODCL;
SELECT COUNT(*) FROM PRODCL;

SELECT * FROM PURPROD;
SELECT COUNT(*) FROM PURPROD;


-- # ���� �м�(���� �м�)
SELECT YEAR, TO_CHAR(ROUND(SUM(���űݾ�)), '999,999,999,999') �ѱ��ž�, TO_CHAR(ROUND(AVG(���űݾ�)), '999,999,999') ��ձ��ž�
FROM PURPROD
GROUP BY YEAR;


-- # �� �Ӽ�
--- ## ����, ���ɺ�, ��������, �پ��� ���պ� ���� ��ȭ
--- ## ����� �̿�, ����� �̿�, �¶��� ä�ο� ���� ���� Ư�̼�

-- # �����ൿ ������ ��ȭ
--- ## �پ��� �� ������ ���� ����, ��ǰ ���� ����, ���� ����(�ð�, ��� ��)

-- # ���� ȯ�濡 ���� ����(������)


SELECT �Ѹ��� FROM (SELECT ����ȣ, year, SUM(���űݾ�) �Ѹ��� FROM purprod GROUP BY year, ����ȣ ORDER BY ����ȣ);

SELECT SUM(���űݾ�) FROM PURPROD WHERE YEAR = 2014 GROUP BY ����ȣ ORDER BY ����ȣ;
SELECT SUM(���űݾ�) FROM PURPROD WHERE YEAR = 2015 GROUP BY ����ȣ ORDER BY ����ȣ;


SELECT a.����ȣ, ROUND(("2015����" - "2014����")/"2014����" * 100, 2) "�����"
FROM (SELECT ����ȣ, SUM(���űݾ�) "2014����" FROM PURPROD WHERE YEAR = 2014 GROUP BY ����ȣ ORDER BY ����ȣ) a,
     (SELECT ����ȣ, SUM(���űݾ�) "2015����" FROM PURPROD WHERE YEAR = 2015 GROUP BY ����ȣ ORDER BY ����ȣ) b
WHERE a.����ȣ = b.����ȣ
ORDER BY a.����ȣ DESC;

SELECT a.����ȣ, ROUND("2015����"/"2014����" * 100, 2) "�����" 
FROM (SELECT ����ȣ, SUM(���űݾ�) "2014����" FROM PURPROD WHERE YEAR = 2014 GROUP BY ����ȣ ORDER BY ����ȣ) a, 
    (SELECT ����ȣ, SUM(���űݾ�) "2015����" FROM PURPROD WHERE YEAR = 2015 GROUP BY ����ȣ ORDER BY ����ȣ) b 
WHERE a.����ȣ = b.����ȣ
ORDER BY a.����ȣ DESC;