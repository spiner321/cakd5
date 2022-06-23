SELECT * FROM CUSTDEMO;
SELECT COUNT(*) FROM PURPROD;
SELECT * FROM PURPROD;

ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR = SUBSTR(구매일자, 1, 4);
COMMIT;

SELECT * FROM PURPROD;
COMMIT;

CREATE TABLE PURBYYEAR AS
SELECT 고객번호, YEAR, SUM(구매금액) 구매액
FROM PURPROD
GROUP BY 고객번호, YEAR
ORDER BY 고객번호;

SELECT * FROM PURBYYEAR;

CREATE TABLE pur_amt AS
SELECT 고객번호 cusno, sum(구매금액) puramt
FROM PURPROD
GROUP BY 고객번호
ORDER BY 고객번호;

---------------------------------------------------------------------------------------------

-- # 2014 ~ 2015년 사이의 4개 회사 구매 데이터

--- ## 고객 속성정보 : 19383명 (고객수)
SELECT * FROM CUSTDEMO;
SELECT COUNT(*) FROM CUSTDEMO;

SELECT * FROM CUMPET;
SELECT COUNT(*) FROM CUMPET;

SELECT * FROM CHANNEL;
SELECT COUNT(*) FROM CHANNEL;

SELECT * FROM MEMBERSHIP;
SELECT COUNT(*) FROM MEMBERSHIP;

SELECT * FROM PRODCL;
SELECT COUNT(*) FROM PRODCL;

SELECT * FROM PURPROD;
SELECT COUNT(*) FROM PURPROD;


-- # 구매 분석(매출 분석)
SELECT YEAR, TO_CHAR(ROUND(SUM(구매금액)), '999,999,999,999') 총구매액, TO_CHAR(ROUND(AVG(구매금액)), '999,999,999') 평균구매액
FROM PURPROD
GROUP BY YEAR;


-- # 고객 속성
--- ## 성별, 연령별, 거주지별, 다양한 조합별 매출 변화
--- ## 경쟁사 이용, 멤버십 이용, 온라인 채널에 대한 매출 특이성

-- # 구매행동 패턴의 변화
--- ## 다양한 고객 유형별 구매 증감, 상품 구매 패턴, 구매 형태(시간, 장소 등)

-- # 유통 환경에 대한 이해(도메인)


SELECT 총매출 FROM (SELECT 고객번호, year, SUM(구매금액) 총매출 FROM purprod GROUP BY year, 고객번호 ORDER BY 고객번호);

SELECT SUM(구매금액) FROM PURPROD WHERE YEAR = 2014 GROUP BY 고객번호 ORDER BY 고객번호;
SELECT SUM(구매금액) FROM PURPROD WHERE YEAR = 2015 GROUP BY 고객번호 ORDER BY 고객번호;


SELECT a.고객번호, ROUND(("2015구매" - "2014구매")/"2014구매" * 100, 2) "성장률"
FROM (SELECT 고객번호, SUM(구매금액) "2014구매" FROM PURPROD WHERE YEAR = 2014 GROUP BY 고객번호 ORDER BY 고객번호) a,
     (SELECT 고객번호, SUM(구매금액) "2015구매" FROM PURPROD WHERE YEAR = 2015 GROUP BY 고객번호 ORDER BY 고객번호) b
WHERE a.고객번호 = b.고객번호
ORDER BY a.고객번호 DESC;

SELECT a.고객번호, ROUND("2015구매"/"2014구매" * 100, 2) "성장률" 
FROM (SELECT 고객번호, SUM(구매금액) "2014구매" FROM PURPROD WHERE YEAR = 2014 GROUP BY 고객번호 ORDER BY 고객번호) a, 
    (SELECT 고객번호, SUM(구매금액) "2015구매" FROM PURPROD WHERE YEAR = 2015 GROUP BY 고객번호 ORDER BY 고객번호) b 
WHERE a.고객번호 = b.고객번호
ORDER BY a.고객번호 DESC;