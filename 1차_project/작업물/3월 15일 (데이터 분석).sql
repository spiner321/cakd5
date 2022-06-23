-- # 분기 기준 고객 나누기
--- # 8분기 모두 구매한 고객
select 고객번호
from
(SELECT 고객번호, 연도, 분기, count(고객번호) "분기별구매횟수" FROM lcl
where 분기 = any('1분기', '2분기', '3분기', '4분기')
group by 고객번호, 연도, 분기
order by 고객번호)
group by 고객번호
having count(고객번호) = 8
order by 고객번호;

--- # 8분기 동안 계속 구매한 고객 수
select count(count(고객번호))
from
(SELECT 고객번호, 연도, 분기, count(고객번호) "분기별구매횟수" FROM lcl
where 분기 = any('1분기', '2분기', '3분기', '4분기')
group by 고객번호, 연도, 분기
order by 고객번호)
group by 고객번호
having count(고객번호) = 8
order by 고객번호;


-- # 반기 기준 고객 나누기
--- # 반기 기준 계속 구매한 고객 수
select 고객번호
from
(select 고객번호, count(고객번호)
from
(SELECT 고객번호, 연도 FROM lcl
where 분기 = any('1분기', '2분기')
group by 고객번호, 연도
order by 고객번호)
group by 고객번호
having count(고객번호) = 2
intersect
select 고객번호, count(고객번호)
from
(SELECT 고객번호, 연도 FROM lcl
where 분기 = any('3분기', '4분기')
group by 고객번호, 연도
order by 고객번호)
group by 고객번호
having count(고객번호) = 2
order by 고객번호);

--- # 반기 기준 계속 구매한 고객 수
select count(*)
from
(select 고객번호, count(고객번호)
from
(SELECT 고객번호, 연도 FROM lcl
where 분기 = any('1분기', '2분기')
group by 고객번호, 연도
order by 고객번호)
group by 고객번호
having count(고객번호) = 2
intersect
select 고객번호, count(고객번호)
from
(SELECT 고객번호, 연도 FROM lcl
where 분기 = any('3분기', '4분기')
group by 고객번호, 연도
order by 고객번호)
group by 고객번호
having count(고객번호) = 2
order by 고객번호);


-- # 기존고객 2014, 2015 개별 총구매액 비교
select *
from
(select sum(sum(구매금액)) "2014"
from 분기기준고객 b
join LCL a on b.고객번호 = a.고객번호
where 연도 = 2014
group by b.고객번호),
(select sum(sum(구매금액)) "2015"
from 분기기준고객 b
join LCL a on b.고객번호 = a.고객번호
where 연도 = 2015
group by b.고객번호);


--- # 비기존고객 고객번호
select 고객번호 from lcl
minus
select 고객번호 from 분기기준고객;


-- # 기존고객, 비기존고객의 중요도 비교
--- # 비기존고객의 2014, 2015 합산 총구매액
select sum(sum(구매금액))
from lcl a
join
(select 고객번호 from lcl
minus
select 고객번호 from 분기기준고객) b on a.고객번호 = b.고객번호
group by a.고객번호;

--- # 기존고객의 2014, 2015 합산 총구매액
select sum(sum(구매금액))
from lcl a
join 분기기준고객 b on a.고객번호 = b.고객번호
group by a.고객번호;

--- # 비기존고객의 2014, 2015 평균액
select avg(avg(구매금액))
from lcl a
join
(select 고객번호 from lcl
minus
select 고객번호 from 분기기준고객) b on a.고객번호 = b.고객번호
group by a.고객번호;

--- # 기존고객의 2014, 2015 평균액
select avg(avg(구매금액))
from lcl a
join 분기기준고객 b on a.고객번호 = b.고객번호
group by a.고객번호;


select a.고객번호, 연도, 분기, sum(구매금액) "총구매금액"
from lcl a
join 분기기준고객 b on a.고객번호 = b.고객번호
group by a.고객번호, 연도, 분기
order by a.고객번호, 연도, 분기;


select a.고객번호, 연도, 분기, sum(구매금액) "총구매금액"
from lcl a
join
(select 고객번호 from lcl
minus
select 고객번호 from 분기기준고객) b on a.고객번호 = b.고객번호
group by a.고객번호, 연도, 분기
order by a.고객번호, 연도, 분기;