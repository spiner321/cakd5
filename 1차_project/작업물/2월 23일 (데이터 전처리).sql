-- PURPROD �� �߰�
ALTER TABLE PURPROD ADD MONTH NUMBER;
UPDATE PURPROD SET MONTH = substr(��������,5,2);

SELECT DISTINCT ���޻�, ��з��ڵ�, �ߺз���, �Һз���
FROM PRODCL
ORDER BY ���޻�;

SELECT ����ȣ, �����ڵ�, �ߺз��ڵ�, ���űݾ�
FROM PURPROD
ORDER BY ����ȣ;


-- # ���� ����� ���� ��Ȳ
SELECT ����ȣ, ����ʸ� FROM MEMBERSHIP
WHERE ����ȣ = ANY(SELECT ����ȣ FROM MEMBERSHIP GROUP BY ����ȣ HAVING COUNT(����ȣ) > 1);


-- # ���޻� �� ����
select YEAR ��, SUBSTR(��������, 5, 2) ��, ���޻�, TO_CHAR(sum(���űݾ�), '999,999,999,999,999') "�Ѹ����", TO_CHAR(round(AVG(���űݾ�)), '999,999') "��ձݾ�"
from purprod
WHERE ���޻� = 'C'
GROUP BY YEAR, SUBSTR(��������, 5, 2), ���޻�
ORDER BY YEAR, SUBSTR(��������, 5, 2), ���޻�;


SELECT DISTINCT ���޻�, ��з��ڵ�, �ߺз��� FROM PRODCL
WHERE ���޻� = 'B'
ORDER BY ���޻�, ��з��ڵ�, �ߺз���;


SELECT YEAR, �����ڵ�, ROUND(SUM(���űݾ�)/1000) ���űݾ� ,count(���űݾ�) ����Ƚ�� 
FROM PURPROD P, CUSTDEMO C WHERE P.����ȣ=C.����ȣ
GROUP BY YEAR, �����ڵ�
HAVING SUM(���űݾ�) > AVG(���űݾ�);

select count(�����) from compet;

-- # ��ǰ �з� ���� �����
ALTER TABLE PRODCL ADD �з� NVARCHAR2(50);
UPDATE PRODCL SET �з� = '�ż���ǰ' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 1 AND 7;
UPDATE PRODCL SET �з� = '�ܽ�' WHERE ���޻�='B' AND ��з��ڵ� = 8;
UPDATE PRODCL SET �з� = '��Ÿ' WHERE ���޻�='B' AND ��з��ڵ� = 8 AND �ߺз��� = ANY('������', '�ǸŽü�', '���ǽü�');
UPDATE PRODCL SET �з� = '������ǰ' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 9 AND 16;
UPDATE PRODCL SET �з� = '���Ƶ�' WHERE ���޻�='B' AND ��з��ڵ� = 12 AND �ߺз��� = ANY('����', '������/���ư���');
UPDATE PRODCL SET �з� = '�ż���ǰ' WHERE ���޻�='B' AND ��з��ڵ� = 38;
UPDATE PRODCL SET �з� = '������ǰ' WHERE ���޻�='B' AND ��з��ڵ� = 38 AND �ߺз��� = ANY('�κ�', '��', '��/�Ｎ���⸧', '�Ｎ���⸧');
UPDATE PRODCL SET �з� = '������ǰ' WHERE ���޻�='B' AND ��з��ڵ� = 43;
UPDATE PRODCL SET �з� = '�ż���ǰ' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 46 AND 48;
UPDATE PRODCL SET �з� = '�ż���ǰ' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 52 AND 55;
UPDATE PRODCL SET �з� = '������ǰ' WHERE ���޻�='B' AND ��з��ڵ� = ANY(54) AND �ߺз��� = ANY('������������');
UPDATE PRODCL SET �з� = '������ǰ' WHERE ���޻�='B' AND ��з��ڵ� = ANY(55) AND �ߺз��� = ANY('�õ�����', '�ѹ���', '��Ÿȸ', '�����ʹ�', '����ȸ');
UPDATE PRODCL SET �з� = '������ǰ' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 56 AND 64;
UPDATE PRODCL SET �з� = '�ż���ǰ' WHERE ���޻�='B' AND ��з��ڵ� = ANY(64) AND �ߺз��� = ANY('��������', 'ü��');
UPDATE PRODCL SET �з� = '�ż���ǰ' WHERE ���޻�='B' AND ��з��ڵ� = ANY(65, 72, 76, 78, 79, 82, 89, 91, 92);
UPDATE PRODCL SET �з� = '������ǰ' WHERE ���޻�='B' AND ��з��ڵ� = ANY(67, 73, 74, 75, 77, 80, 81, 83);


UPDATE PRODCL SET �з� = '�ϻ��ǰ' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 17 AND 21;
UPDATE PRODCL SET �з� = '�Ǿ�ǰ/�Ƿ���' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 17 AND 21 AND �ߺз��� = ANY('������', '����������ǰ');
UPDATE PRODCL SET �з� = '����/���׸���' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 22 AND 23;
UPDATE PRODCL SET �з� = '����������/����' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 22 AND 23 AND �ߺз��� = ANY('�ƿ������۴�ó');
UPDATE PRODCL SET �з� = '����/��ȭ��ǰ' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 24 AND 25;
UPDATE PRODCL SET �з� = '���Ƶ�' WHERE ���޻�='B' AND ��з��ڵ� = 26;
--UPDATE PRODCL SET �з� = '����/��ȭ��ǰ' WHERE ���޻�='B' AND ��з��ڵ� 26; AND �ߺз��� = ANY('EDUCATION 1', 'EDUCATION 2');
UPDATE PRODCL SET �з� = '���Ƶ�' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 17 AND 26 AND (�Һз��� LIKE '%����%' OR �Һз��� LIKE'%�Ƶ�%');
UPDATE PRODCL SET �з� = '�ϻ��ǰ' WHERE ���޻�='B' AND ��з��ڵ� BETWEEN 17 AND 26 AND �Һз��� LIKE '%������%';

SELECT * FROM PRODCL WHERE ���޻� = 'B' AND �з� IS NULL order by ��з��ڵ�;

