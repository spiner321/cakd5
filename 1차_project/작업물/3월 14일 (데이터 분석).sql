-- # �ű�, ����, ��Ż ��ձݾ�
--- # �������� ���� 0% ���� ���������� ������ ��ձ��ž�
SELECT round(sum(����2015)/count(*)) FROM ��������������
where ������ > 0;

--- # �������� ���� 5.14% ���� ���������� �������� ��ձ��ž�
SELECT round(sum(����2015)/count(*)) FROM ��������������
where ������ > 5.14;

--- # �������� �ű԰��� ��ձ��ž�
SELECT round(SUM(����2015)/count(*)) FROM ��������������
WHERE ����2014 = 0;

-- # �������� ��Ż���� ��ձ��ž�
SELECT round(SUM(����2014)/count(*)) FROM ��������������
WHERE ����2015 = 0;

select * from lcl;


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

--- # 2014�� ���� RFM �迭�� ��ü
SELECT ����ȣ, TO_DATE(20141231)-MAX(TO_DATE(��������)) "Recency", COUNT(���űݾ�) "Frequency", SUM(���űݾ�) "Monetary"
FROM LCL
WHERE ���� = 2014
GROUP BY ����ȣ
ORDER BY ����ȣ;

--- # 2015�� ���� RFM �迭�� ��ü
SELECT ����ȣ, TO_DATE(20151231)-MAX(TO_DATE(��������)) "Recency", COUNT(���űݾ�) "Frequency", SUM(���űݾ�) "Monetary"
FROM LCL
WHERE ���� = 2015
GROUP BY ����ȣ
ORDER BY ����ȣ;