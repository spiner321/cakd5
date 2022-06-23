-- # 구매감소 고객의 상품 별 총구매액
SELECT a.고객번호, a.성별, a.연령대, a.지역, a.세분류명, a.분류, b.고객구분, a.기, sum(a.구매금액) "총구매액"
FROM LCL2 a
JOIN 증감고객 b ON a.고객번호 = b.고객번호
WHERE 고객구분 = '감소'
GROUP BY a.고객번호, a.성별, a.연령대, a.지역, a.세분류명, a.분류, b.고객구분, a.기
ORDER BY a.고객번호, a.성별, a.연령대, a.지역, a.세분류명, a.분류, b.고객구분, a.기;


-- # 지역별 매출액 증감
SELECT 지역, 매출액1기, 매출액7기 
FROM
(SELECT b.지역, sum(a.이용금액14_1) 매출액1기, sum(a.이용금액15_3) 매출액7기
FROM 증감고객 a, LCL2 b 
WHERE a.고객번호 = b.고객번호 
GROUP BY b.지역);


-- # 경쟁사, 채널 고객별 이용횟수
--- # 채널
SELECT 고객번호, SUM(이용횟수) FROM CHANNEL
GROUP BY 고객번호
ORDER BY SUM(이용횟수) DESC;

SELECT COUNT(DISTINCT 고객번호) FROM CHANNEL;

SELECT 고객번호, COUNT(고객번호) FROM COMPET
GROUP BY 고객번호
ORDER BY COUNT(고객번호) DESC;

--- # 경쟁사
SELECT COUNT(COUNT(고객번호)) FROM COMPET
GROUP BY 고객번호
ORDER BY COUNT(고객번호) DESC;

SELECT COUNT(DISTINCT 고객번호) FROM COMPET;