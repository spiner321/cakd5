'RFM �м��� ���� ���� �湮 ��¥ ���ϱ�'

-- # RFM �м��� ���� ���� �湮 ��¥ ���ϱ�
--SELECT *
--FROM
--(SELECT ����ȣ, ��������, SUM(���űݾ�), ROW_NUMBER() over(partition by ����ȣ order by �������� desc) "����" 
--FROM LCL GROUP BY ����ȣ, ��������)
--WHERE ���� = '1';

--- # ���޻� ��
SELECT ����ȣ, ���޻�, TO_DATE(20151231)-MAX(TO_DATE(��������)) "Recency", COUNT(���űݾ�) "Frequency"
FROM LCL
GROUP BY ����ȣ, ���޻�, �б�
ORDER BY ����ȣ;

SELECT * FROM LCL;