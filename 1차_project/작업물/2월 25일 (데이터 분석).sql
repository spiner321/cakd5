-- # 2014, 2015, 2년 합산 매출, 증감률
--CREATE TABLE "연도별매출비교" AS
SELECT "2014 구매금액" "2014", "2015 구매금액" "2015", "2014 구매금액" + "2015 구매금액" "합계",
TO_CHAR(("2015 구매금액"-"2014 구매금액")/"2014 구매금액"*100, '99.99') "증감률"
FROM 
(SELECT SUM(구매금액) "2014 구매금액" FROM PURPROD WHERE 연도 = 2014) a,
(SELECT SUM(구매금액) "2015 구매금액" FROM PURPROD WHERE 연도 = 2015) b;

-- # 세분류명
ALTER TABLE PRODCL ADD 세분류명 VARCHAR2(50); 
UPDATE PRODCL SET 세분류명='편의품' WHERE 분류=ANY('가공식품','신선식품','일상용품','의약품/의료기기','교육/문화용품','외식','기타');
UPDATE PRODCL SET 세분류명='선매품' WHERE 분류=ANY('디지털/가전','가구/인테리어','의류','전문스포츠/레저','패션잡화','유아동');
UPDATE PRODCL SET 세분류명='전문품' WHERE 분류='명품';


-- # 제휴사, 년도별 총매출액
--CREATE TABLE "제휴사별연도별총매출액" AS
SELECT 제휴사, 연도, SUM(구매금액) "합계" FROM PURPROD GROUP BY 제휴사,연도 ORDER BY 제휴사,연도;


-- # 각 제휴사에 방문한 고객별 구매건수
--CREATE TABLE "번호제휴성별연도건수매출" AS
SELECT P.고객번호, 제휴사, C.성별, 연도, COUNT(P.고객번호) "구매건수", sum(구매금액) "합계"
FROM PURPROD P, CUSTDEMO C
WHERE P.고객번호 = C.고객번호
GROUP BY P.고객번호, 제휴사, C.성별, 연도
ORDER BY P.고객번호, C.성별;

-- # PURPROD 분기 추가
CREATE TABLE PURPROD2 AS
SELECT *
FROM
(select 제휴사, 영수증번호, 대분류코드, 중분류코드, 소분류코드, 고객번호, 점포코드, 구매일자, 구매시간, 구매금액, 연도, 월,
case
when 월 between 1 AND 3 THEN '1분기'
when 월 between 4 AND 6 THEN '2분기'
when 월 between 7 AND 9 THEN '3분기'
when 월 between 10 AND 12 THEN '4분기'
END "분기" 
FROM PURPROD);


-- # 경쟁사 분석
SELECT a.고객번호, a.제휴사, B.성별, 연령대, 거주지역, 경쟁사이용횟수, 매출
FROM
(SELECT 고객번호, 제휴사, COUNT(경쟁사) "경쟁사이용횟수", SUBSTR(이용년월, 0, 4) "연도" FROM COMPET
GROUP BY 고객번호, 제휴사, SUBSTR(이용년월, 0, 4)
ORDER BY 고객번호) a,
(SELECT * FROM 번호제휴성별연도건수매출
WHERE 연도 = 2015) b,
CUSTDEMO C
WHERE a.고객번호 = b.고객번호 AND a.제휴사 = b.제휴사 AND a.고객번호 = c.고객번호 AND B.성별 = C.성별
ORDER BY a.고객번호;

select * from compet
where 이용년월 like '%2014%';