-- # �����ڵ�� ���� ����
--create table �������� as
SELECT ����ȣ, �����ڵ�,����, ���űݾ�, RankNo
FROM
    (SELECT ����ȣ, �����ڵ�,����,sum(���űݾ�) ���űݾ�,
    ROW_NUMBER() OVER (PARTITION BY ����ȣ ORDER BY sum(���űݾ�) DESC) AS RankNo
    FROM LCL2 where ���� is null group by ����ȣ, �����ڵ�,����)
WHERE RankNO = 1
order by ����ȣ, �����ڵ�;


-- # ���Ұ� �߿��� ���������� ��������� ��ġ���� �ʴ� ��
select *
from
(SELECT  t.����ȣ, t.�����ڵ�, ��������.���� ��������
FROM
(SELECT ����ȣ,�����ڵ�,����,
ROW_NUMBER() OVER (PARTITION BY ����ȣ ORDER BY count(�����ڵ�) DESC) AS RankNo
FROM LCL2 group by ����ȣ,�����ڵ�,����) T,
��������
WHERE T.RankNO=1 and T.�����ڵ�=��������.�����ڵ� AND T.����!=��������.���� order by ����ȣ) a
join custdemo b on a.����ȣ = b.����ȣ
join ������ c on a.����ȣ = c.����ȣ
where ������ = '����';


-- # �������� ä��, �����, ����� ����
select a.*, nvl(ä���̿�Ƚ��, 0) ä���̿�Ƚ��, nvl(������̿�Ƚ��, 0) ������̿�Ƚ��, nvl(����ʰ��԰���, 0) ����ʰ��԰���
from
������ a
left outer join 
(SELECT ����ȣ, SUM(�̿�Ƚ��) ä���̿�Ƚ�� FROM CHANNEL
GROUP BY ����ȣ) b on a.����ȣ = b.����ȣ
left outer join 
(SELECT ����ȣ, COUNT(����ȣ) ������̿�Ƚ�� FROM COMPET
GROUP BY ����ȣ) c on a.����ȣ = c.����ȣ
left outer join
(select ����ȣ, count(����ȣ) ����ʰ��԰��� FROM membership
group by ����ȣ) d on a.����ȣ = d.����ȣ
where ������ = '����' and ����ʰ��԰��� > 2;


-- # LCL2 ���� null�� ä���
--- # ���� null�� ä���� �ӽ�2 ���̺� �����
UPDATE �������� SET ���� = '���' WHERE �����ڵ� = 563;

create table �ӽ�2 as
select ����ȣ, b.����
from
    (SELECT ����ȣ, �����ڵ�,����, ���űݾ�, RankNo
    FROM
    (SELECT ����ȣ, �����ڵ�,����,sum(���űݾ�) ���űݾ�,
    ROW_NUMBER() OVER (PARTITION BY ����ȣ ORDER BY sum(���űݾ�) DESC) AS RankNo
    FROM LCL2 where ���� is null group by ����ȣ, �����ڵ�,����)
WHERE RankNO = 1
order by ����ȣ, �����ڵ�) a
join �������� b on a.�����ڵ� = b.�����ڵ�;

--- # LCL2�� ���� �ݿ�
MERGE INTO lcl2 a
USING �ӽ�2 b
ON (a.����ȣ = b.����ȣ)
WHEN MATCHED THEN UPDATE SET a.���� = b.����;


-- # ���� ���űݾ��� �ð����� ����
select a.����ȣ, ��, ���Žð�, sum(���űݾ�), b.������,
ROW_NUMBER() OVER (PARTITION BY a.����ȣ ORDER BY sum(���űݾ�) DESC) RankNo
from lcl2 a
join ������ b on a.����ȣ = b.����ȣ
where (��='7��' or ��='1��') and b.������ = '����'
group by a.����ȣ, ��, ���Žð�, b.������
order by a.����ȣ, ��, RankNo;