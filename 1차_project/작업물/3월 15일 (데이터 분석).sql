-- # �б� ���� �� ������
--- # 8�б� ��� ������ ��
select ����ȣ
from
(SELECT ����ȣ, ����, �б�, count(����ȣ) "�б⺰����Ƚ��" FROM lcl
where �б� = any('1�б�', '2�б�', '3�б�', '4�б�')
group by ����ȣ, ����, �б�
order by ����ȣ)
group by ����ȣ
having count(����ȣ) = 8
order by ����ȣ;

--- # 8�б� ���� ��� ������ �� ��
select count(count(����ȣ))
from
(SELECT ����ȣ, ����, �б�, count(����ȣ) "�б⺰����Ƚ��" FROM lcl
where �б� = any('1�б�', '2�б�', '3�б�', '4�б�')
group by ����ȣ, ����, �б�
order by ����ȣ)
group by ����ȣ
having count(����ȣ) = 8
order by ����ȣ;


-- # �ݱ� ���� �� ������
--- # �ݱ� ���� ��� ������ �� ��
select ����ȣ
from
(select ����ȣ, count(����ȣ)
from
(SELECT ����ȣ, ���� FROM lcl
where �б� = any('1�б�', '2�б�')
group by ����ȣ, ����
order by ����ȣ)
group by ����ȣ
having count(����ȣ) = 2
intersect
select ����ȣ, count(����ȣ)
from
(SELECT ����ȣ, ���� FROM lcl
where �б� = any('3�б�', '4�б�')
group by ����ȣ, ����
order by ����ȣ)
group by ����ȣ
having count(����ȣ) = 2
order by ����ȣ);

--- # �ݱ� ���� ��� ������ �� ��
select count(*)
from
(select ����ȣ, count(����ȣ)
from
(SELECT ����ȣ, ���� FROM lcl
where �б� = any('1�б�', '2�б�')
group by ����ȣ, ����
order by ����ȣ)
group by ����ȣ
having count(����ȣ) = 2
intersect
select ����ȣ, count(����ȣ)
from
(SELECT ����ȣ, ���� FROM lcl
where �б� = any('3�б�', '4�б�')
group by ����ȣ, ����
order by ����ȣ)
group by ����ȣ
having count(����ȣ) = 2
order by ����ȣ);


-- # ������ 2014, 2015 ���� �ѱ��ž� ��
select *
from
(select sum(sum(���űݾ�)) "2014"
from �б���ذ� b
join LCL a on b.����ȣ = a.����ȣ
where ���� = 2014
group by b.����ȣ),
(select sum(sum(���űݾ�)) "2015"
from �б���ذ� b
join LCL a on b.����ȣ = a.����ȣ
where ���� = 2015
group by b.����ȣ);


--- # ������� ����ȣ
select ����ȣ from lcl
minus
select ����ȣ from �б���ذ�;


-- # ������, ��������� �߿䵵 ��
--- # ��������� 2014, 2015 �ջ� �ѱ��ž�
select sum(sum(���űݾ�))
from lcl a
join
(select ����ȣ from lcl
minus
select ����ȣ from �б���ذ�) b on a.����ȣ = b.����ȣ
group by a.����ȣ;

--- # �������� 2014, 2015 �ջ� �ѱ��ž�
select sum(sum(���űݾ�))
from lcl a
join �б���ذ� b on a.����ȣ = b.����ȣ
group by a.����ȣ;

--- # ��������� 2014, 2015 ��վ�
select avg(avg(���űݾ�))
from lcl a
join
(select ����ȣ from lcl
minus
select ����ȣ from �б���ذ�) b on a.����ȣ = b.����ȣ
group by a.����ȣ;

--- # �������� 2014, 2015 ��վ�
select avg(avg(���űݾ�))
from lcl a
join �б���ذ� b on a.����ȣ = b.����ȣ
group by a.����ȣ;


select a.����ȣ, ����, �б�, sum(���űݾ�) "�ѱ��űݾ�"
from lcl a
join �б���ذ� b on a.����ȣ = b.����ȣ
group by a.����ȣ, ����, �б�
order by a.����ȣ, ����, �б�;


select a.����ȣ, ����, �б�, sum(���űݾ�) "�ѱ��űݾ�"
from lcl a
join
(select ����ȣ from lcl
minus
select ����ȣ from �б���ذ�) b on a.����ȣ = b.����ȣ
group by a.����ȣ, ����, �б�
order by a.����ȣ, ����, �б�;