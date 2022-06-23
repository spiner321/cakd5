-- # 파이썬 연동

DESC sample1;
SELECT * FROM sample1;
SELECT * FROM sample2;
DESC sample3;
SELECT * FROM sample3
order by TO_NUMBER(id);

SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

SELECT YEAR, c.고객번호, SUM(구매금액) 총매출액, ROUND(AVG(구매금액)) "평균구매액"
FROM purprod p, custdemo c 
WHERE p.고객번호 = c.고객번호
GROUP BY year, c.고객번호
ORDER BY c.고객번호;