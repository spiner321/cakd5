-- 1년 동안 최다 방문회수 매장과 매출
SELECT YEAR, 점포코드,ROUND(SUM(구매금액)/1000) 구매금액 ,count(구매금액) 구매횟수 
FROM PURPROD P, CUSTDEMO C WHERE P.고객번호=C.고객번호
GROUP BY YEAR,점포코드
HAVING SUM(구매금액) > (SELECT AVG(구매금액) FROM PURPROD)
ORDER BY 구매횟수 desc;

-- 매장갯수 : 593
select count(distinct 점포코드) from purprod;

--  상위 50프로 구매횟수 년도 점포 리스트
SELECT YEAR, 점포코드,ROUND(SUM(구매금액)/1000) 구매금액 ,count(구매금액) 구매횟수 
FROM PURPROD P, CUSTDEMO C WHERE P.고객번호=C.고객번호
GROUP BY YEAR,점포코드
ORDER BY 구매횟수 desc
FETCH FIRST 50 PERCENT ROWS ONLY;

-- # 고객별 멤버십 가입 현황
SELECT 고객번호, 멤버십명 FROM MEMBERSHIP
WHERE 고객번호 = ANY(SELECT 고객번호 FROM MEMBERSHIP GROUP BY 고객번호 HAVING COUNT(고객번호) > 1);

-- 지역별 나이대에 따른 고객분포와 소비금액
select 거주지역, 성별, 연령대, count(c.고객번호), sum(구매금액) from custdemo c,purprod p where c.고객번호=p.고객번호
group by 거주지역, 성별, 연령대 order by 거주지역;

-- 가장 많이 이용하는 제휴사
select 제휴사,count(*) from channel group by 제휴사; 

-- 거주지역별 매장 방문횟수
select distinct c.거주지역, 점포코드,count(점포코드) from custdemo c,purprod p
where c.고객번호=p.고객번호 group by c.거주지역,점포코드 order by count(점포코드) desc,거주지역;

-- 제휴사별 유출 고객수
select 제휴사,count(경쟁사) from compet group by 제휴사;

-- 편의품
SELECT * FROM PRODCL WHERE 분류 = any('가공식품', '신선식품', '일상용품', '의약품/의료기기', '교육/문화용품', '외식', '기타');