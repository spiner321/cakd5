-- # 2014, 2015, 2�� �ջ� ����, ������
--CREATE TABLE "�����������" AS
SELECT "2014 ���űݾ�" "2014", "2015 ���űݾ�" "2015", "2014 ���űݾ�" + "2015 ���űݾ�" "�հ�",
TO_CHAR(("2015 ���űݾ�"-"2014 ���űݾ�")/"2014 ���űݾ�"*100, '99.99') "������"
FROM 
(SELECT SUM(���űݾ�) "2014 ���űݾ�" FROM PURPROD WHERE ���� = 2014) a,
(SELECT SUM(���űݾ�) "2015 ���űݾ�" FROM PURPROD WHERE ���� = 2015) b;

-- # ���з���
ALTER TABLE PRODCL ADD ���з��� VARCHAR2(50); 
UPDATE PRODCL SET ���з���='����ǰ' WHERE �з�=ANY('������ǰ','�ż���ǰ','�ϻ��ǰ','�Ǿ�ǰ/�Ƿ���','����/��ȭ��ǰ','�ܽ�','��Ÿ');
UPDATE PRODCL SET ���з���='����ǰ' WHERE �з�=ANY('������/����','����/���׸���','�Ƿ�','����������/����','�м���ȭ','���Ƶ�');
UPDATE PRODCL SET ���з���='����ǰ' WHERE �з�='��ǰ';


-- # ���޻�, �⵵�� �Ѹ����
--CREATE TABLE "���޻纰�������Ѹ����" AS
SELECT ���޻�, ����, SUM(���űݾ�) "�հ�" FROM PURPROD GROUP BY ���޻�,���� ORDER BY ���޻�,����;


-- # �� ���޻翡 �湮�� ���� ���ŰǼ�
--CREATE TABLE "��ȣ���޼��������Ǽ�����" AS
SELECT P.����ȣ, ���޻�, C.����, ����, COUNT(P.����ȣ) "���ŰǼ�", sum(���űݾ�) "�հ�"
FROM PURPROD P, CUSTDEMO C
WHERE P.����ȣ = C.����ȣ
GROUP BY P.����ȣ, ���޻�, C.����, ����
ORDER BY P.����ȣ, C.����;

-- # PURPROD �б� �߰�
CREATE TABLE PURPROD2 AS
SELECT *
FROM
(select ���޻�, ��������ȣ, ��з��ڵ�, �ߺз��ڵ�, �Һз��ڵ�, ����ȣ, �����ڵ�, ��������, ���Žð�, ���űݾ�, ����, ��,
case
when �� between 1 AND 3 THEN '1�б�'
when �� between 4 AND 6 THEN '2�б�'
when �� between 7 AND 9 THEN '3�б�'
when �� between 10 AND 12 THEN '4�б�'
END "�б�" 
FROM PURPROD);


-- # ����� �м�
SELECT a.����ȣ, a.���޻�, B.����, ���ɴ�, ��������, ������̿�Ƚ��, ����
FROM
(SELECT ����ȣ, ���޻�, COUNT(�����) "������̿�Ƚ��", SUBSTR(�̿���, 0, 4) "����" FROM COMPET
GROUP BY ����ȣ, ���޻�, SUBSTR(�̿���, 0, 4)
ORDER BY ����ȣ) a,
(SELECT * FROM ��ȣ���޼��������Ǽ�����
WHERE ���� = 2015) b,
CUSTDEMO C
WHERE a.����ȣ = b.����ȣ AND a.���޻� = b.���޻� AND a.����ȣ = c.����ȣ AND B.���� = C.����
ORDER BY a.����ȣ;

select * from compet
where �̿��� like '%2014%';