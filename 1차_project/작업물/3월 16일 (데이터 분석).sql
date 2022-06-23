-- # 분기별 제휴사 총매출액 증감률
select a.제휴사, a.연도, a.분기, a.총구매액, b.연도, b.분기, b.총구매액, round((b.총구매액-a.총구매액)/b.총구매액 * 100, 2) "증감률"
from
(SELECT 제휴사, 연도, 분기, SUM(구매금액) "총구매액" FROM LCL where 연도 = 2014 GROUP BY 제휴사,연도,분기 ORDER BY 제휴사, 연도) a,
(SELECT 제휴사, 연도, 분기, SUM(구매금액) "총구매액" FROM LCL where 연도 = 2015 GROUP BY 제휴사,연도,분기 ORDER BY 제휴사, 연도) b
where a.제휴사 = b.제휴사 and a.분기 = b.분기;


-- # 기존고객 분기별 제휴사 총매출액
SELECT 제휴사, 연도, 분기, SUM(구매금액) "총구매액" 
FROM LCL a
join
분기기준고객 b on a.고객번호 = b.고객번호
where 연도 = 2014
GROUP BY 제휴사, 연도, 분기 
ORDER BY 제휴사, 연도;


-- # 기존고객 분기별 성별, 카테고리, 총매출액
SELECT 제휴사, 연도, 분기, 성별, 세분류명, SUM(구매금액) "총구매액" 
FROM LCL a
join
분기기준고객 b on a.고객번호 = b.고객번호
where 연도 = 2015
GROUP BY 제휴사, 연도, 분기, 성별, 세분류명
ORDER BY 제휴사, 연도, 분기, 세분류명;


-- # 구매감소 고객의 상품 별 총구매액
SELECT a.고객번호, 성별, 연도, 분기, 세분류명, 분류, 고객구분, sum(구매금액) "총구매액"
FROM LCL a
JOIN 증감고객 b ON a.고객번호 = b.고객번호
WHERE 고객구분 = '감소'
GROUP BY a.고객번호, 성별, 연도, 분기, 세분류명, 분류, 고객구분
ORDER BY a.고객번호, 연도, 분기, 세분류명, 분류;


SELECT 연도, 분기, sum(구매금액) "총구매액"
FROM LCL a
JOIN 증감고객 b ON a.고객번호 = b.고객번호
WHERE 고객구분 = '증가' and 분기 = any('1분기', '3분기', '4분기')
GROUP BY 연도, 분기
ORDER BY 연도, 분기;