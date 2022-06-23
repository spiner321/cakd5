-- # ���� 2014�� ��� 2015�� ���� ������
--CREATE TABLE �������������� AS
SELECT C.����ȣ, C.����, NVL(A."2014", 0) "����2014", NVL(B."2015", 0) "����2015", ROUND((NVL("2015", 0)-NVL("2014", 0))/"2014"*100, 4) "������"
FROM
(SELECT ����ȣ, ���� FROM CUSTDEMO) C
FULL OUTER JOIN
(SELECT ����ȣ, ����, SUM(���űݾ�) "2015" FROM LCL
WHERE ���� = 2015
GROUP BY ����ȣ, ����
ORDER BY ����ȣ) B
ON C.����ȣ = B.����ȣ AND C.���� = B.����
FULL OUTER JOIN
(SELECT ����ȣ, ����, SUM(���űݾ�) "2014" FROM LCL
WHERE ���� = 2014
GROUP BY ����ȣ, ����
ORDER BY ����ȣ) A
ON A.����ȣ = C.����ȣ AND A.���� = C.����;

--- # 2015�� ��Ż��
SELECT * FROM ��������������
WHERE ����2015 = 0;

--- # 2015�� ���Ű��� �� Ȯ���ϱ�
SELECT DISTINCT B.����ȣ, B.����, B.���޻�, B.���з���, COUNT(B.���з���) "����Ƚ��", B.�з�, B.����
FROM �������������� A, LCL B
WHERE 
A.����ȣ = B.����ȣ AND A.���� = B.����
AND ������ < 5.41
GROUP BY B.����ȣ, B.����, B.���޻�, B.���з���, B.�з�, B.����
ORDER BY ����ȣ, �з�;


-- # ���ɺ� ���� ������
--CREATE TABLE ���ɺ����������� AS
SELECT A.����, A.���ɴ�, A."����" ����14, B."����" ����15, A.��ձݾ� "��ձݾ�14", B.��ձݾ� "��ձݾ�15", A."�հ�" "����14", B.�հ� "����15", ROUND((B.����-A.����)/A.����*100, 2) "����������", ROUND((B.�հ�-A.�հ�)/A.�հ�*100, 2) "����������"
FROM
(SELECT ����, ���ɴ�, COUNT(���ɴ�) "����", ROUND(avg(���űݾ�)) "��ձݾ�", SUM(���űݾ�) "�հ�" FROM LCL
WHERE ���� = 2014
GROUP BY ����, ���ɴ�
ORDER BY ����, ���ɴ�) A,
(SELECT ����, ���ɴ�, COUNT(���ɴ�) "����", ROUND(avg(���űݾ�)) "��ձݾ�", SUM(���űݾ�) "�հ�" FROM LCL
WHERE ���� = 2015
GROUP BY ����, ���ɴ�
ORDER BY ����, ���ɴ�) B
where A.���� = B.���� AND A.���ɴ� = B.���ɴ�;

SELECT * FROM ���ɺ�����������;

--- # �����ջ�, ���ɺ� ���� ������
SELECT a.*, round((b.����15-b.����14)/b.����14*100, 2) "����������", round((b.����15-b.����14)/b.����14*100, 2) "����������"
FROM
(SELECT ���ɴ�, SUM(����14) "����14", SUM(����15) "����15", AVG(��ձݾ�14) "��ձݾ�14", AVG(��ձݾ�15) "��ձݾ�15", SUM(����14) "����14", SUM(����15) "����15" FROM ���ɺ�����������
GROUP BY ���ɴ�
ORDER BY ���ɴ�) a,
(SELECT ���ɴ�, SUM(����14) "����14", SUM(����15) "����15", AVG(��ձݾ�14) "��ձݾ�14", AVG(��ձݾ�15) "��ձݾ�15", SUM(����14) "����14", SUM(����15) "����15" FROM ���ɺ�����������
GROUP BY ���ɴ�
ORDER BY ���ɴ�) b
where a.���ɴ� = b.���ɴ�;


SELECT TABLESPACE_NAME, FILE_ID, SUM(NVL(BYTES, 0)) FREE 
FROM DBA_FREE_SPACE
GROUP BY TABLESPACE_NAME, FILE_ID;


SELECT A.TABLESPACE_NAME AS "���̺����̽���",
A.FILE_NAME  AS "���ϰ�� AS ",
TO_CHAR((A.BYTES - B.FREE), '999,999,999,999,999,999,')  AS "������",
TO_CHAR(B.FREE, '999,999,999,999,999,999,') AS "�ܿ� ����",
TO_CHAR(A.BYTES, '999,999,999,999,999,999,') AS "��ü ũ��",
TO_CHAR((B.FREE / A.BYTES * 100), '999.99') || '%'  AS "�ܿ�����"

FROM
(SELECT FILE_ID, TABLESPACE_NAME, FILE_NAME, SUBSTR(FILE_NAME, 1, 200) FILE_NM, SUM(BYTES) BYTES 
FROM DBA_DATA_FILES
GROUP BY FILE_ID, TABLESPACE_NAME, FILE_NAME, SUBSTR(FILE_NAME, 1, 200)) A,
(SELECT TABLESPACE_NAME, FILE_ID, SUM(NVL(BYTES, 0)) FREE 
FROM DBA_FREE_SPACE
GROUP BY TABLESPACE_NAME, FILE_ID) B

WHERE A.TABLESPACE_NAME = B.TABLESPACE_NAME AND A.FILE_ID = B.FILE_ID
ORDER BY A.TABLESPACE_NAME, B.FREE;
