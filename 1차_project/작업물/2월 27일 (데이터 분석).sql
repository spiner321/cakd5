-- # 고객별 2014년 대비 2015년 매출 증감률
--CREATE TABLE 고객별매출증감률 AS
SELECT C.고객번호, C.성별, NVL(A."2014", 0) "연도2014", NVL(B."2015", 0) "연도2015", ROUND((NVL("2015", 0)-NVL("2014", 0))/"2014"*100, 4) "증감률"
FROM
(SELECT 고객번호, 성별 FROM CUSTDEMO) C
FULL OUTER JOIN
(SELECT 고객번호, 성별, SUM(구매금액) "2015" FROM LCL
WHERE 연도 = 2015
GROUP BY 고객번호, 성별
ORDER BY 고객번호) B
ON C.고객번호 = B.고객번호 AND C.성별 = B.성별
FULL OUTER JOIN
(SELECT 고객번호, 성별, SUM(구매금액) "2014" FROM LCL
WHERE 연도 = 2014
GROUP BY 고객번호, 성별
ORDER BY 고객번호) A
ON A.고객번호 = C.고객번호 AND A.성별 = C.성별;

--- # 2015년 이탈고객
SELECT * FROM 고객별매출증감률
WHERE 연도2015 = 0;

--- # 2015년 구매감소 고객 확인하기
SELECT DISTINCT B.고객번호, B.성별, B.제휴사, B.세분류명, COUNT(B.세분류명) "구매횟수", B.분류, B.연도
FROM 고객별매출증감률 A, LCL B
WHERE 
A.고객번호 = B.고객번호 AND A.성별 = B.성별
AND 증감률 < 5.41
GROUP BY B.고객번호, B.성별, B.제휴사, B.세분류명, B.분류, B.연도
ORDER BY 고객번호, 분류;


-- # 연령별 매출 증감률
--CREATE TABLE 연령별매출증감률 AS
SELECT A.성별, A.연령대, A."고객수" 고객수14, B."고객수" 고객수15, A.평균금액 "평균금액14", B.평균금액 "평균금액15", A."합계" "매출14", B.합계 "매출15", ROUND((B.고객수-A.고객수)/A.고객수*100, 2) "고객수증감률", ROUND((B.합계-A.합계)/A.합계*100, 2) "매출증감률"
FROM
(SELECT 성별, 연령대, COUNT(연령대) "고객수", ROUND(avg(구매금액)) "평균금액", SUM(구매금액) "합계" FROM LCL
WHERE 연도 = 2014
GROUP BY 성별, 연령대
ORDER BY 성별, 연령대) A,
(SELECT 성별, 연령대, COUNT(연령대) "고객수", ROUND(avg(구매금액)) "평균금액", SUM(구매금액) "합계" FROM LCL
WHERE 연도 = 2015
GROUP BY 성별, 연령대
ORDER BY 성별, 연령대) B
where A.성별 = B.성별 AND A.연령대 = B.연령대;

SELECT * FROM 연령별매출증감률;

--- # 연도합산, 연령별 매출 증감률
SELECT a.*, round((b.고객수15-b.고객수14)/b.고객수14*100, 2) "고객수증감률", round((b.매출15-b.매출14)/b.매출14*100, 2) "매출증감률"
FROM
(SELECT 연령대, SUM(고객수14) "고객수14", SUM(고객수15) "고객수15", AVG(평균금액14) "평균금액14", AVG(평균금액15) "평균금액15", SUM(매출14) "매출14", SUM(매출15) "매출15" FROM 연령별매출증감률
GROUP BY 연령대
ORDER BY 연령대) a,
(SELECT 연령대, SUM(고객수14) "고객수14", SUM(고객수15) "고객수15", AVG(평균금액14) "평균금액14", AVG(평균금액15) "평균금액15", SUM(매출14) "매출14", SUM(매출15) "매출15" FROM 연령별매출증감률
GROUP BY 연령대
ORDER BY 연령대) b
where a.연령대 = b.연령대;


SELECT TABLESPACE_NAME, FILE_ID, SUM(NVL(BYTES, 0)) FREE 
FROM DBA_FREE_SPACE
GROUP BY TABLESPACE_NAME, FILE_ID;


SELECT A.TABLESPACE_NAME AS "테이블스페이스명",
A.FILE_NAME  AS "파일경로 AS ",
TO_CHAR((A.BYTES - B.FREE), '999,999,999,999,999,999,')  AS "사용공간",
TO_CHAR(B.FREE, '999,999,999,999,999,999,') AS "잔여 공간",
TO_CHAR(A.BYTES, '999,999,999,999,999,999,') AS "전체 크기",
TO_CHAR((B.FREE / A.BYTES * 100), '999.99') || '%'  AS "잔여공간"

FROM
(SELECT FILE_ID, TABLESPACE_NAME, FILE_NAME, SUBSTR(FILE_NAME, 1, 200) FILE_NM, SUM(BYTES) BYTES 
FROM DBA_DATA_FILES
GROUP BY FILE_ID, TABLESPACE_NAME, FILE_NAME, SUBSTR(FILE_NAME, 1, 200)) A,
(SELECT TABLESPACE_NAME, FILE_ID, SUM(NVL(BYTES, 0)) FREE 
FROM DBA_FREE_SPACE
GROUP BY TABLESPACE_NAME, FILE_ID) B

WHERE A.TABLESPACE_NAME = B.TABLESPACE_NAME AND A.FILE_ID = B.FILE_ID
ORDER BY A.TABLESPACE_NAME, B.FREE;
