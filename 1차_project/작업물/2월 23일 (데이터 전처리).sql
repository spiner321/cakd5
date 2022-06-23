-- PURPROD 월 추가
ALTER TABLE PURPROD ADD MONTH NUMBER;
UPDATE PURPROD SET MONTH = substr(구매일자,5,2);

SELECT DISTINCT 제휴사, 대분류코드, 중분류명, 소분류명
FROM PRODCL
ORDER BY 제휴사;

SELECT 고객번호, 점포코드, 중분류코드, 구매금액
FROM PURPROD
ORDER BY 고객번호;


-- # 고객별 멤버십 가입 현황
SELECT 고객번호, 멤버십명 FROM MEMBERSHIP
WHERE 고객번호 = ANY(SELECT 고객번호 FROM MEMBERSHIP GROUP BY 고객번호 HAVING COUNT(고객번호) > 1);


-- # 제휴사 별 매출
select YEAR 년, SUBSTR(구매일자, 5, 2) 월, 제휴사, TO_CHAR(sum(구매금액), '999,999,999,999,999') "총매출액", TO_CHAR(round(AVG(구매금액)), '999,999') "평균금액"
from purprod
WHERE 제휴사 = 'C'
GROUP BY YEAR, SUBSTR(구매일자, 5, 2), 제휴사
ORDER BY YEAR, SUBSTR(구매일자, 5, 2), 제휴사;


SELECT DISTINCT 제휴사, 대분류코드, 중분류명 FROM PRODCL
WHERE 제휴사 = 'B'
ORDER BY 제휴사, 대분류코드, 중분류명;


SELECT YEAR, 점포코드, ROUND(SUM(구매금액)/1000) 구매금액 ,count(구매금액) 구매횟수 
FROM PURPROD P, CUSTDEMO C WHERE P.고객번호=C.고객번호
GROUP BY YEAR, 점포코드
HAVING SUM(구매금액) > AVG(구매금액);

select count(경쟁사) from compet;

-- # 상품 분류 새로 만들기
ALTER TABLE PRODCL ADD 분류 NVARCHAR2(50);
UPDATE PRODCL SET 분류 = '신선식품' WHERE 제휴사='B' AND 대분류코드 BETWEEN 1 AND 7;
UPDATE PRODCL SET 분류 = '외식' WHERE 제휴사='B' AND 대분류코드 = 8;
UPDATE PRODCL SET 분류 = '기타' WHERE 제휴사='B' AND 대분류코드 = 8 AND 중분류명 = ANY('주유소', '판매시설', '편의시설');
UPDATE PRODCL SET 분류 = '가공식품' WHERE 제휴사='B' AND 대분류코드 BETWEEN 9 AND 16;
UPDATE PRODCL SET 분류 = '유아동' WHERE 제휴사='B' AND 대분류코드 = 12 AND 중분류명 = ANY('분유', '이유식/유아간식');
UPDATE PRODCL SET 분류 = '신선식품' WHERE 제휴사='B' AND 대분류코드 = 38;
UPDATE PRODCL SET 분류 = '가공식품' WHERE 제휴사='B' AND 대분류코드 = 38 AND 중분류명 = ANY('두부', '묵', '묵/즉석참기름', '즉석참기름');
UPDATE PRODCL SET 분류 = '가공식품' WHERE 제휴사='B' AND 대분류코드 = 43;
UPDATE PRODCL SET 분류 = '신선식품' WHERE 제휴사='B' AND 대분류코드 BETWEEN 46 AND 48;
UPDATE PRODCL SET 분류 = '신선식품' WHERE 제휴사='B' AND 대분류코드 BETWEEN 52 AND 55;
UPDATE PRODCL SET 분류 = '가공식품' WHERE 제휴사='B' AND 대분류코드 = ANY(54) AND 중분류명 = ANY('간편조리생선');
UPDATE PRODCL SET 분류 = '가공식품' WHERE 제휴사='B' AND 대분류코드 = ANY(55) AND 중분류명 = ANY('냉동가공', '한방차', '기타회', '생선초밥', '생선회');
UPDATE PRODCL SET 분류 = '가공식품' WHERE 제휴사='B' AND 대분류코드 BETWEEN 56 AND 64;
UPDATE PRODCL SET 분류 = '신선식품' WHERE 제휴사='B' AND 대분류코드 = ANY(64) AND 중분류명 = ANY('수입포도', '체리');
UPDATE PRODCL SET 분류 = '신선식품' WHERE 제휴사='B' AND 대분류코드 = ANY(65, 72, 76, 78, 79, 82, 89, 91, 92);
UPDATE PRODCL SET 분류 = '가공식품' WHERE 제휴사='B' AND 대분류코드 = ANY(67, 73, 74, 75, 77, 80, 81, 83);


UPDATE PRODCL SET 분류 = '일상용품' WHERE 제휴사='B' AND 대분류코드 BETWEEN 17 AND 21;
UPDATE PRODCL SET 분류 = '의약품/의료기기' WHERE 제휴사='B' AND 대분류코드 BETWEEN 17 AND 21 AND 중분류명 = ANY('생리대', '여성위생용품');
UPDATE PRODCL SET 분류 = '가구/인테리어' WHERE 제휴사='B' AND 대분류코드 BETWEEN 22 AND 23;
UPDATE PRODCL SET 분류 = '전문스포츠/레저' WHERE 제휴사='B' AND 대분류코드 BETWEEN 22 AND 23 AND 중분류명 = ANY('아웃도어퍼니처');
UPDATE PRODCL SET 분류 = '교육/문화용품' WHERE 제휴사='B' AND 대분류코드 BETWEEN 24 AND 25;
UPDATE PRODCL SET 분류 = '유아동' WHERE 제휴사='B' AND 대분류코드 = 26;
--UPDATE PRODCL SET 분류 = '교육/문화용품' WHERE 제휴사='B' AND 대분류코드 26; AND 중분류명 = ANY('EDUCATION 1', 'EDUCATION 2');
UPDATE PRODCL SET 분류 = '유아동' WHERE 제휴사='B' AND 대분류코드 BETWEEN 17 AND 26 AND (소분류명 LIKE '%유아%' OR 소분류명 LIKE'%아동%');
UPDATE PRODCL SET 분류 = '일상용품' WHERE 제휴사='B' AND 대분류코드 BETWEEN 17 AND 26 AND 소분류명 LIKE '%건전지%';

SELECT * FROM PRODCL WHERE 제휴사 = 'B' AND 분류 IS NULL order by 대분류코드;

