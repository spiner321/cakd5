-- # 예측된 감소 고객의 정보
SELECT 고객번호, 성별, 지역, CAT연령대, 제휴사, 세분류명, 분류, 분류등급, 기, 월, 시간, 구매금액 "총구매액", 군집
FROM
(SELECT a.*, CAT연령대, 군집 FROM LCL2 a
JOIN CAT연령대 b on a.연령대 = b.연령대
JOIN 군집라벨 c on a.고객번호 = c.고객번호);

SELECT 군집, sum(구매금액)
FROM
(SELECT a.*, CAT연령대, 군집 FROM LCL2 a
JOIN CAT연령대 b on a.연령대 = b.연령대
JOIN 군집라벨 c on a.고객번호 = c.고객번호)
where 군집 = 2
group by 군집;