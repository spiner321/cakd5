-- # ä�� �м�
SELECT a.����ȣ, �¶���, �̿�Ƚ��, sum(����) "����"
FROM CHANNEL a, ��ȣ���޼��������Ǽ����� b
WHERE a.����ȣ = b.����ȣ AND SUBSTR(�¶���, 1, 1) = b.���޻�
GROUP BY a.����ȣ, �¶���, �̿�Ƚ��
ORDER BY a.����ȣ, �¶���, �̿�Ƚ��;


-- # �ͺ� ���� �¶��� �̿�Ƚ��
select ����, sum(�̿�Ƚ��) �̿�Ƚ��
from custdemo a, channel b where a.����ȣ=b.����ȣ
group by ����;


-- # CUSTDEMO, PRODCL, PURPROD ���̺� ��ġ��
CREATE TABLE LCL AS
SELECT *
FROM
(SELECT ���ε�.����ȣ, ����.����, ����.���ɴ�, ����.��������, ���ε�.���޻�, ���ε�.�����ڵ�, ����.���з���, ����.�з�, ����.�Һз���, ���ε�.��������, ���ε�.����, ���ε�.�б�, ���ε�.��, ���ε�.���Žð�, ���ε�.���űݾ�
FROM PURPROD "���ε�"
LEFT OUTER JOIN CUSTDEMO "����"
ON ���ε�.����ȣ = ����.����ȣ
LEFT OUTER JOIN PRODCL "����"
ON ���ε�.���޻� = ����.���޻� AND ���ε�.��з��ڵ� = ����.��з��ڵ� AND ���ε�.�ߺз��ڵ� = ����.�ߺз��ڵ� AND ���ε�.�Һз��ڵ� = ����.�Һз��ڵ�)
ORDER BY ����ȣ, ���޻�, �����ڵ�, ��������;


-- # RFM �м��� ���� ���� �湮 ��¥ ���ϱ�
--SELECT *
--FROM
--(SELECT ����ȣ, ��������, SUM(���űݾ�), ROW_NUMBER() over(partition by ����ȣ order by �������� desc) "����" 
--FROM LCL GROUP BY ����ȣ, ��������)
--WHERE ���� = '1';

--- # �迭�� ��ü
SELECT ����ȣ, TO_DATE(20151231)-MAX(TO_DATE(��������)) "Recency", COUNT(���űݾ�) "Frequency", SUM(���űݾ�) "Monetary"
FROM LCL
GROUP BY ����ȣ
ORDER BY ����ȣ;

--- # ���޻� ��
SELECT ����ȣ, ���޻�, TO_DATE(20151231)-MAX(TO_DATE(��������)) "Recency", COUNT(���űݾ�) "Frequency", SUM(���űݾ�) "Monetary"
FROM LCL
GROUP BY ����ȣ, ���޻�
ORDER BY ����ȣ;


-- # ���ɴ뺰 �м�
--- # ���޻�, ����
SELECT ���޻�, ���ɴ�, COUNT(���ɴ�) "����", ROUND(avg(���űݾ�)) "��ձݾ�", SUM(���űݾ�) "�հ�" FROM LCL
GROUP BY ���޻�, ���ɴ�
ORDER BY ���޻�, ���ɴ�;

--- # ����, ����
SELECT ����, ���ɴ�, COUNT(���ɴ�) "����", ROUND(avg(���űݾ�)) "��ձݾ�", SUM(���űݾ�) "�հ�", ���� FROM LCL
GROUP BY ����, ���ɴ�, ����
ORDER BY ����, ���ɴ�, ����;

-- # ���� ���� 10% ��������
SELECT ��������, COUNT(��������)
FROM 
(SELECT ��������, ���ɴ�, COUNT(���ɴ�) "����", ROUND(avg(���űݾ�)) "��ձݾ�", SUM(���űݾ�) "�հ�", PERCENT_RANK() OVER (ORDER BY SUM(���űݾ�) DESC) "�ۼ�Ʈ" 
FROM LCL
GROUP BY ��������, ���ɴ�)
WHERE �ۼ�Ʈ <= 0.1
GROUP BY ��������
order by count(��������);