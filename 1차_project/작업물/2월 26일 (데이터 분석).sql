-- # 채널 분석
SELECT a.고객번호, 온라인, 이용횟수, sum(매출) "매출"
FROM CHANNEL a, 번호제휴성별연도건수매출 b
WHERE a.고객번호 = b.고객번호 AND SUBSTR(온라인, 1, 1) = b.제휴사
GROUP BY a.고객번호, 온라인, 이용횟수
ORDER BY a.고객번호, 온라인, 이용횟수;


-- # 셩별 별로 온라인 이용횟수
select 성별, sum(이용횟수) 이용횟수
from custdemo a, channel b where a.고객번호=b.고객번호
group by 성별;


-- # CUSTDEMO, PRODCL, PURPROD 테이블 합치기
CREATE TABLE LCL AS
SELECT *
FROM
(SELECT 프로드.고객번호, 데모.성별, 데모.연령대, 데모.거주지역, 프로드.제휴사, 프로드.점포코드, 씨엘.세분류명, 씨엘.분류, 씨엘.소분류명, 프로드.구매일자, 프로드.연도, 프로드.분기, 프로드.월, 프로드.구매시간, 프로드.구매금액
FROM PURPROD "프로드"
LEFT OUTER JOIN CUSTDEMO "데모"
ON 프로드.고객번호 = 데모.고객번호
LEFT OUTER JOIN PRODCL "씨엘"
ON 프로드.제휴사 = 씨엘.제휴사 AND 프로드.대분류코드 = 씨엘.대분류코드 AND 프로드.중분류코드 = 씨엘.중분류코드 AND 프로드.소분류코드 = 씨엘.소분류코드)
ORDER BY 고객번호, 제휴사, 점포코드, 구매일자;


-- # RFM 분석을 위해 최종 방문 날짜 구하기
--SELECT *
--FROM
--(SELECT 고객번호, 구매일자, SUM(구매금액), ROW_NUMBER() over(partition by 고객번호 order by 구매일자 desc) "순위" 
--FROM LCL GROUP BY 고객번호, 구매일자)
--WHERE 순위 = '1';

--- # 계열사 전체
SELECT 고객번호, TO_DATE(20151231)-MAX(TO_DATE(구매일자)) "Recency", COUNT(구매금액) "Frequency", SUM(구매금액) "Monetary"
FROM LCL
GROUP BY 고객번호
ORDER BY 고객번호;

--- # 제휴사 별
SELECT 고객번호, 제휴사, TO_DATE(20151231)-MAX(TO_DATE(구매일자)) "Recency", COUNT(구매금액) "Frequency", SUM(구매금액) "Monetary"
FROM LCL
GROUP BY 고객번호, 제휴사
ORDER BY 고객번호;


-- # 연령대별 분석
--- # 제휴사, 연령
SELECT 제휴사, 연령대, COUNT(연령대) "고객수", ROUND(avg(구매금액)) "평균금액", SUM(구매금액) "합계" FROM LCL
GROUP BY 제휴사, 연령대
ORDER BY 제휴사, 연령대;

--- # 성별, 연령
SELECT 성별, 연령대, COUNT(연령대) "고객수", ROUND(avg(구매금액)) "평균금액", SUM(구매금액) "합계", 연도 FROM LCL
GROUP BY 성별, 연령대, 연도
ORDER BY 성별, 연령대, 연도;

-- # 매출 상위 10% 거주지역
SELECT 거주지역, COUNT(거주지역)
FROM 
(SELECT 거주지역, 연령대, COUNT(연령대) "고객수", ROUND(avg(구매금액)) "평균금액", SUM(구매금액) "합계", PERCENT_RANK() OVER (ORDER BY SUM(구매금액) DESC) "퍼센트" 
FROM LCL
GROUP BY 거주지역, 연령대)
WHERE 퍼센트 <= 0.1
GROUP BY 거주지역
order by count(거주지역);