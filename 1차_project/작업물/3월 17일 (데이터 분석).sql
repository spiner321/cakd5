-- # 구매감소 고객의 상품 별 총구매액
SELECT a.고객번호, 성별, 연도, 분기, 세분류명, 분류, 고객구분, sum(구매금액) "총구매액"
FROM LCL a
JOIN 증감고객 b ON a.고객번호 = b.고객번호
WHERE 고객구분 = '감소'
GROUP BY a.고객번호, 성별, 연도, 분기, 세분류명, 분류, 고객구분
ORDER BY a.고객번호, 연도, 분기, 세분류명, 분류;

select * from lcl
where 거주지역 is null;

select * from custdemo
order by 고객번호;