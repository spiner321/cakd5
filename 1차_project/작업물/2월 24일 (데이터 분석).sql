-- 1�� ���� �ִ� �湮ȸ�� ����� ����
SELECT YEAR, �����ڵ�,ROUND(SUM(���űݾ�)/1000) ���űݾ� ,count(���űݾ�) ����Ƚ�� 
FROM PURPROD P, CUSTDEMO C WHERE P.����ȣ=C.����ȣ
GROUP BY YEAR,�����ڵ�
HAVING SUM(���űݾ�) > (SELECT AVG(���űݾ�) FROM PURPROD)
ORDER BY ����Ƚ�� desc;

-- ���尹�� : 593
select count(distinct �����ڵ�) from purprod;

--  ���� 50���� ����Ƚ�� �⵵ ���� ����Ʈ
SELECT YEAR, �����ڵ�,ROUND(SUM(���űݾ�)/1000) ���űݾ� ,count(���űݾ�) ����Ƚ�� 
FROM PURPROD P, CUSTDEMO C WHERE P.����ȣ=C.����ȣ
GROUP BY YEAR,�����ڵ�
ORDER BY ����Ƚ�� desc
FETCH FIRST 50 PERCENT ROWS ONLY;

-- # ���� ����� ���� ��Ȳ
SELECT ����ȣ, ����ʸ� FROM MEMBERSHIP
WHERE ����ȣ = ANY(SELECT ����ȣ FROM MEMBERSHIP GROUP BY ����ȣ HAVING COUNT(����ȣ) > 1);

-- ������ ���̴뿡 ���� �������� �Һ�ݾ�
select ��������, ����, ���ɴ�, count(c.����ȣ), sum(���űݾ�) from custdemo c,purprod p where c.����ȣ=p.����ȣ
group by ��������, ����, ���ɴ� order by ��������;

-- ���� ���� �̿��ϴ� ���޻�
select ���޻�,count(*) from channel group by ���޻�; 

-- ���������� ���� �湮Ƚ��
select distinct c.��������, �����ڵ�,count(�����ڵ�) from custdemo c,purprod p
where c.����ȣ=p.����ȣ group by c.��������,�����ڵ� order by count(�����ڵ�) desc,��������;

-- ���޻纰 ���� ����
select ���޻�,count(�����) from compet group by ���޻�;

-- ����ǰ
SELECT * FROM PRODCL WHERE �з� = any('������ǰ', '�ż���ǰ', '�ϻ��ǰ', '�Ǿ�ǰ/�Ƿ���', '����/��ȭ��ǰ', '�ܽ�', '��Ÿ');