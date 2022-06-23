--빅데이터 기반 AI 응용 솔루션 개발자 전문과정

--교과목명 : 데이터베이스 구축 및 활용

--평가일 : 22.02.25
--성명 : 김기현
--점수 :


--※ HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)를 활용하여 다음 질문들을 수행하세요.
--Q1. HR EMPLOYEES 테이블에서 이름, 연봉, 10% 인상된 연봉을 출력하세요.
--A.
SELECT employee_id, salary, salary * 1.1 "10% 인상 연봉" FROM employees;
    
--Q2.  2005년 상반기에 입사한 사람들만 출력	
--A.        
 SELECT first_name, last_name, hire_date FROM employees
 WHERE hire_date BETWEEN TO_DATE(20050101) AND TO_DATE(20050630)
 ORDER BY hire_date;

--Q3. 업무 SA_MAN, IT_PROG, ST_MAN 인 사람만 출력
--A.
SELECT * FROM employees
WHERE job_id = ANY('SA_MAN', 'IT_PROG', 'ST_MAN')
ORDER BY FIRST_NAME;
   
--Q4. manager_id 가 101에서 103인 사람만 출력
--A.   	
SELECT * FROM employees
WHERE manager_id in ('101', '103');

--Q5. EMPLOYEES 테이블에서 LAST_NAME, HIRE_DATE 및 입사일의 6개월 후 첫 번째 월요일을 출력하세요.
--A.
SELECT LAST_NAME, HIRE_DATE, NEXT_DAY(ADD_MONTHS(HIRE_DATE, 6), '월') FROM EMPLOYEES;

--Q6. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 현재일까지의 W_MONTH(근속월수)를 정수로 계산해서 출력하세요.(근속월수 기준 내림차순)
--A.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, TRUNC((SYSDATE-HIRE_DATE)/365*12) "W_MONTH" FROM EMPLOYEES ORDER BY "W_MONTH" DESC;
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "W_MONTH" FROM EMPLOYEES ORDER BY "W_MONTH";

--Q7. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 W_YEAR(근속년수)를 계산해서 출력하세요.(근속년수 기준 내림차순)
--A.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, TRUNC((SYSDATE-HIRE_DATE)/365) "W_YEAR" FROM EMPLOYEES ORDER BY "W_YEAR" DESC;

--Q8. EMPLOYEE_ID가 홀수인 직원의 EMPLPYEE_ID와 LAST_NAME을 출력하세요.
--A. 
SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID, 2) = 1
ORDER BY EMPLOYEE_ID;

--Q9. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME 및 M_SALARY(월급)을 출력하세요. 단 월급은 소수점 둘째자리까지만 표현하세요.
--A
SELECT EMPLOYEE_ID, LAST_NAME, ROUND(SALARY/12, 2) "M_SALARY" FROM EMPLOYEES;

--Q10. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 근속년수를 계산해서 아래사항을 추가한 후에 출력하세요.
--2001년 1월 1일 창업하여 현재(2020년 12월 31일)까지 20년간 운영되온 회사는 직원의  근속년수에 따라 30 등급으로 나누어  등급에 따라 1000원의 BONUS를 지급.
--내림차순 정렬.    
--A.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, TRUNC((TO_DATE(20201231)-HIRE_DATE)/365) "W_YEAR", WIDTH_BUCKET(TRUNC((TO_DATE(20201231)-HIRE_DATE)/365), 0, 20, 30)*1000 "BONUS" FROM EMPLOYEES ORDER BY "W_YEAR" DESC;


--Q11. EMPLOYEES 테이블에서 commission_pct 의  Null값 갯수를  출력하세요.
--A.
SELECT COUNT(COMMISSION_PCT) FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

--Q12. EMPLOYEES 테이블에서 deparment_id 가 없는 직원을 추출하여  POSITION을 '신입'으로 출력하세요.
--A.
SELECT LAST_NAME, FIRST_NAME,
CASE
WHEN DEPARTMENT_ID IS NULL THEN '신입'
END "POSITION"
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

--Q13. 사번이 120번인 사람의 사번, 이름, 업무(job_id), 업무명(job_title)을 출력(join~on, where 로 조인하는 두 가지 방법 모두)
--A.
SELECT E.EMPLOYEE_ID, E.LAST_NAME, J.JOB_ID, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID(+) = J.JOB_ID
ORDER BY E.EMPLOYEE_ID; 

SELECT E.EMPLOYEE_ID, E.LAST_NAME, J.JOB_ID, J.JOB_TITLE
FROM EMPLOYEES E
JOIN JOBS J
ON E.JOB_ID(+) = J.JOB_ID
ORDER BY E.EMPLOYEE_ID;

--Q14.  employees 테이블에서 이름에 FIRST_NAME에 LAST_NAME을 붙여서 'NAME' 컬럼명으로 출력하세요.
--예) Steven King
--A. 
SELECT FIRST_NAME||' '||LAST_NAME "NAME" FROM EMPLOYEES
ORDER BY "NAME";

--Q15. lmembers purprod 테이블로 부터 총구매액, 2014 구매액, 2015 구매액을 한번에 출력하세요.
--A.
--SELECT LEMEBERS
SELECT TO_CHAR("2014 구매금액", 'L999,999,999,999') "2014 총구매액", TO_CHAR("2015 구매금액", 'L999,999,999,999') "2015 총구매액", TO_CHAR("2014 구매금액" + "2015 구매금액", 'L999,999,999,999') "총구매액"
FROM 
(SELECT SUM(구매금액) "2014 구매금액" FROM PURPROD WHERE YEAR = 2014) a,
(SELECT SUM(구매금액) "2015 구매금액" FROM PURPROD WHERE YEAR = 2015) b;

select
(select sum(구매금액) from purprod) 총구매액,
(select sum(구매금액) from purprod where year=2014) "2014 구매액",
(select sum(구매금액) from purprod where year=2015) "2015 구매액"
from dual;


--Q16. HR EMPLOYEES 테이블에서 escape 옵션을 사용하여 아래와 같이 출력되는 SQL문을 작성하세요.
--job_id 칼럼에서  _을 와일드카드가 아닌 문자로 취급하여 '_A'를 포함하는  모든 행을 출력
--A.
SELECT JOB_ID FROM EMPLOYEES
WHERE JOB_ID LIKE '%\_A%' ESCAPE '\';

--Q17. HR EMPLOYEES 테이블에서 SALARY, LAST_NAME 순으로 올림차순 정렬하여 출력하세요.
--A. 
SELECT SALARY, LAST_NAME FROM EMPLOYEES
ORDER BY SALARY, LAST_NAME;
   
--Q18. Seo라는 사람의 부서명을 출력하세요.
--A.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME 
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.LAST_NAME = 'Seo';

--Q19. LMEMBERS 데이터에서 고객별 구매금액의 합계를 구한 CUSPUR 테이블을 생성한 후 CUSTDEMO 테이블과 
--고객번호를 기준으로 결합하여 출력하세요.
--A.
CREATE TABLE CUSPUR AS
SELECT 고객번호, SUM(구매금액) "총구매액" FROM PURPROD
GROUP BY 고객번호
ORDER BY 고객번호;

SELECT D.고객번호, P.총구매액, D.성별, D.연령대, D.거주지역
FROM CUSPUR P, CUSTDEMO D
WHERE P.고객번호 = D.고객번호;

--Q20.PURPROD 테이블로 부터 아래 사항을 수행하세요.
-- 2년간 구매금액을 연간 단위로 분리하여 고객별, 제휴사별로 구매액을 표시하는 AMT_14, AMT_15 테이블 2개를 생성 (출력내용 : 고객번호, 제휴사, SUM(구매금액) 구매금액)
--AMT14와 AMT15 2개 테이블을 고객번호와 제휴사를 기준으로 FULL OUTER JOIN 적용하여 결합한 AMT_YEAR_FOJ 테이블 생성
--14년과 15년의 구매금액 차이를 표시하는 증감 컬럼을 추가하여 출력(단, 고객번호, 제휴사별로 구매금액 및 증감이 구분되어야 함)
--A.
CREATE TABLE AMT_14 AS
SELECT 고객번호, 제휴사, SUM(구매금액) "구매금액" FROM PURPROD
WHERE YEAR = 2014
GROUP BY 고객번호, 제휴사
ORDER BY 고객번호;

CREATE TABLE AMT_15 AS
SELECT 고객번호, 제휴사, SUM(구매금액) "구매금액" FROM PURPROD
WHERE YEAR = 2015
GROUP BY 고객번호, 제휴사
ORDER BY 고객번호;

--CREATE TABLE AMT_YEAR_FOJ AS
SELECT A14.고객번호, A14.제휴사, A14.구매금액 "14년", A15.구매금액 "15년", ROUND((A15.구매금액-A14.구매금액)/A15.구매금액*100, 2) "증감률"
FROM AMT_14 A14
FULL OUTER JOIN AMT_15 A15
ON A14.고객번호 = A15.고객번호 AND A14.제휴사 = A15.제휴사;

--Q(BONUS). HR 테이블들을 분석해서 전체 현황을 설명할 수 있는 요약 테이블을 작성하세요. (예 : 부서별 평균 SALARY 순위)
--A.
SELECT 