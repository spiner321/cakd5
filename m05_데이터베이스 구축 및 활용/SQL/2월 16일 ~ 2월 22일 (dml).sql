-- # <2월 16일>
-- # <dml>

-- # 순위함수
--- # RANK() : 동점가 있는 경우 동일 순번을 리턴, 다음 순위는 숫자를 건너뛴다. (1, 2, 2, 4, 4, 6, ...)
--- # DENSE_RANK() : 동점자의 경우에 동일한 순번을 리턴, 다음 순위는 다음 숫자부터 진행이 된다 (1, 2, 2, 3, 3, 4, ...)
--- # ROW_NUMBER() : (1, 2, 3, 4, 5, 6, ...)
SELECT 고객번호, 구매일자, SUM(구매금액), ROW_NUMBER() over(partition by 고객번호 order by 구매일자 desc) "순위"FROM LCL GROUP BY 고객번호, 구매일자;

-- # ESCAPE
SELECT * FROM employees WHERE job_id like '%\_A%' escape '\';
SELECT * FROM employees WHERE job_id like '%#_A%' escape '#';

-- # IN : OR 대신 사용
SELECT * FROM employees WHERE manager_id = 101 or manager_id = 102 or manager_id = 103;
SELECT * FROM employees WHERE manager_id in (101, 102, 103);

-- # BETWEEN AND : AND 대신 사용
SELECT * FROM employees WHERE manager_id BETWEEN 101 AND 103;

-- # IS NULL / IS NOT NULL
SELECT * FROM employees WHERE commission_pct IS NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;

-- # 주요 함수
--- ## MOD() : 나머지 출력
SELECT * FROM employees WHERE MOD(employee_id, 2) = 1;
SELECT MOD(10, 3) FROM DUAL;

--- ## ROUND() : 반올림
SELECT ROUND(355.885555, 3) FROM DUAL;

--- ## TRUNC() : 버림
SELECT TRUNC(45.555, 1) FROM DUAL;

--- ## 날짜 관련 함수
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE + 1 FROM DUAL;
SELECT last_name, TRUNC((SYSDATE - hire_date)/365) 근속연수 FROM employees;
SELECT last_name, hire_date, ADD_MONTHS(hire_date, 6) FROM employees;
SELECT TO_CHAR(sysdate, 'yy') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '금') FROM DUAL;
SELECT TO_CHAR(TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD') + 151000), 'YYYY-MM-DD') FROM DUAL;
SELECT TO_DATE('20210101'), TO_CHAR(TO_DATE('20210101'), 'MONTHDD YYYY', 'NLS_DATE_LANGUAGE=english') FORMAT1 FROM DUAL;
SELECT last_name, SYSDATE, hire_date, TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) FROM employees;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') FROM DUAL;

-- # 형변환 함수
--- ## NUMBER CHARACTER DATE
--- ## TO_DATE() 문자열을 날짜로 바꾸기
--- ## TO_NUMBER, TO_CHAR, TO_DATE
SELECT SYSDATE - TO_DATE('10/01/01') FROM DUAL;
SELECT SYSDATE +  FROM DUAL;


-- # TO_CHAR
--- ## 9 : 한자리의 숫자표현
--- ## 0 : 앞부분을 0으로 표현
--- ## $ : 달러 기호를 앞에 표현
--- ## . : 소수점을 표시
--- ## , : 특정 위치에 표시
--- ## mi : 오른쪽에 ? 기호 표시
--- ## pr : 음수값을 <>로 표현
--- ## EEEE : 과학적 표현
--- ## B : 공백을 0으로 표현
--- ## L : 지역 통화
SELECT salary, TO_CHAR(salary, '090990') FROM employees;
SELECT TO_CHAR(-salary, '99999PR') FROM employees;
SELECT TO_CHAR(1111, '99.99EEEE') FROM dual;
SELECT TO_CHAR(1111, 'B9999.99') FROM DUAL;
SELECT TO_CHAR(1111, 'L9999') FROM DUAL;

-- # WIDTH_BUCKET() 지정값, 최소값, 최대값 , BUCKET 개수
SELECT WIDTH_BUCKET(1, 0, 10, 5) FROM DUAL;
SELECT department_id, last_name, salary, WIDTH_BUCKET(salary, 0, 20000, 5) FROM employees WHERE department_id = 50;

-- # employees 테이블에 있는 직원들 (사번, 이름 기준으로)에 대하여 현재기준으로 근속연수를 구하세요
SELECT * FROM EMPLOYEES;
SELECT employee_id, last_name, TRUNC((SYSDATE - hire_date)/365) 근속연수 FROM EMPLOYEES;

-- # 문자함수
SELECT UPPER('Hello World') FROM DUAL;
SELECT LOWER('Hello World') FROM DUAL;
SELECT last_name, salary FROM employees WHERE LOWER(last_name) = 'seo';
SELECT INITCAP(job_id) FROM employees;
SELECT job_id, LENGTH(job_id) FROM employees;
SELECT INSTR('Hello World', 'o', 3, 1) FROM DUAL; -- INSTR(찾기를 실행할 문자, 찾을 문자, 찾기를 시작할 위치, 시작 위치기준 찾을 문자의 서수)
SELECT SUBSTR('Hello World', 3, 3) FROM DUAL;
SELECT SUBSTR('Hello World', -3, 3) FROM DUAL;
SELECT LPAD('Hello World', 20, '#') FROM DUAL;
SELECT RPAD('Hello World', 20, '#') FROM DUAL;
SELECT LTRIM('aaaHello Worldaaa', 'a') FROM DUAL;
SELECT RTRIM('aaaHello Worldaaa', 'a') FROM DUAL;
SELECT TRIM(BOTH 'a' FROM 'aaaHello Worldaaa') FROM DUAL;
SELECT TRIM('   Hello World   ') FROM DUAL;

-- # 기타함수
SELECT salary, commission_pct, salary*12*NVL(commission_pct, 0) FROM employees;

-- # 분석함수 : 여러 가지 기준을 적용해 여러 결과를 return 할 수 있으며 처리 대상이 되는 행의 집단을 window라고 지칭
-- # FIRST_VALUE() OVER() 그룹의 첫번째 값을 구한다.
SELECT first_name 이름, salary 연봉,
FIRST_VALUE(salary) OVER(ORDER BY salary DESC) 최고연봉
FROM employees;

SELECT first_name 이름, salary 연봉,
FIRST_VALUE(salary) OVER(ORDER BY salary) 최저연봉
FROM employees;

SELECT first_name 이름, salary 연봉,
LAST_VALUE(salary) OVER(ORDER BY salary) 최저연봉
FROM employees;

SELECT first_name 이름, salary 연봉,
FIRST_VALUE(salary) OVER(ORDER BY salary ROWS 3 PRECEDING) 최저연봉
FROM employees;

SELECT first_name 이름, salary 연봉,
FIRST_VALUE(salary) OVER(ORDER BY salary ROWS 3 PRECEDING) 최저연봉
FROM employees;

SELECT first_name 이름, salary 연봉,
LAST_VALUE(salary) OVER(ORDER BY salary DESC ROWS 3 preceding) 최저연봉
FROM employees;

SELECT first_name 이름, salary 연봉,
FIRST_VALUE(salary) OVER(ORDER BY salary RANGE 3 PRECEDING) 최고연봉
FROM employees;

SELECT first_name 이름, salary 연봉,
LAST_VALUE(salary) OVER(ORDER BY salary DESC ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) 최저연봉
FROM employees;




DESC BOOK;
SELECT * FROM BOOK;

-- # 특정 컬럼만 출력
SELECT BOOKNAME,PRICE FROM  BOOK;       

-- # 중복된 것 제거
SELECT PUBLISHER FROM BOOK;
SELECT DISTINCT PUBLISHER FROM BOOK;

-- # 조건을 지정하여 출력
SELECT * FROM BOOK WHERE PRICE <10000;

-- # 가격이 10000원 이상 20000원 이하인 도서
SELECT * FROM BOOK WHERE 10000<=PRICE AND 20000>=PRICE;

-- # 출판사가 굿스포츠, 혹은 대한미디어인 도서
SELECT * FROM BOOK WHERE PUBLISHER='굿스포츠' OR PUBLISHER='대한미디어';
SELECT * FROM BOOK WHERE PUBLISHER IN ('굿스포츠', '대한미디어');

-- # 출판사가 굿스포츠, 혹은 대한미디어가 아닌 도서
SELECT * FROM BOOK WHERE PUBLISHER NOT IN ('굿스포츠','대한미디어');

-- # 도서이름에 축구가 포함된 출판사를 검색
SELECT PUBLISHER FROM BOOK WHERE BOOKNAME LIKE '%축구%';

-- # 오름차순 정렬
SELECT * FROM BOOK ORDER BY BOOKNAME;

-- # 내림차순 정렬
SELECT * FROM BOOK ORDER BY BOOKNAME DESC;

-- # 도서를 가격순으로 검색하고 가격이 같으면 이름순으로 검색
SELECT * FROM BOOK ORDER BY PRICE, BOOKNAME;

-- # 도서를 가격의 내림차순으로 검색하고 만약 가격이 같다면 출판사의 오름차순으로 출력
SELECT * FROM BOOK ORDER BY PRICE DESC, PUBLISHER;

-- # 합계 구하기
SELECT * FROM ORDERS;
SELECT SUM(SALEPRICE) FROM ORDERS;

-- # 합계 구한 것의 컬럼 만들기
SELECT SUM(SALEPRICE) AS 총매출 FROM ORDERS;

-- # CUSTID가 2번인 고객이 주문한 도서의 총판매액
SELECT SUM(SALEPRICE) AS "총 판매액" FROM ORDERS WHERE CUSTID = 2;

-- # 한번에 처리하기
SELECT SUM(SALEPRICE) AS TOTAL,
AVG(SALEPRICE) AS AVERAGE,
MIN(SALEPRICE) AS MINIMUM,
MAX(SALEPRICE) AS MAXIMUM
FROM ORDERS;

-- # 개수 구하기
SELECT COUNT(*) FROM ORDERS;

-- # CUSTID별 도서수량과 총판매액
SELECT  CUSTID, COUNT(*) AS 도서수량, SUM(SALEPRICE) AS "총 판매액" FROM ORDERS GROUP BY CUSTID;

SELECT * FROM ORDERS;

-- # 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하세요, 단 두 권 이상 구매한 고객에 한정.
SELECT CUSTID, COUNT(*) AS "주문 도서량" FROM ORDERS
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >= 2;

-- # 동일 항목에 대해 묶어서 조회한뒤 CUSTID 기준으로 정렬
SELECT * FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY CUSTOMER.CUSTID;

-- # 고객별로 주문한 모든 도서의 총 판매액을 구하고 고객별로 정렬
SELECT NAME, SUM(SALEPRICE) FROM CUSTOMER, ORDERS 
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.NAME
ORDER BY CUSTOMER.NAME;

-- # 고객의 이름과 고객이 주문한 도서의 이름
SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM CUSTOMER, ORDERS, BOOK
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID AND ORDERS.BOOKID = BOOK.BOOKID;

-- # 출판사별로 출판사의 평균 도서 가격보다 비싼 도서
SELECT * FROM BOOK;
SELECT B1.BOOKNAME
FROM BOOK B1
WHERE B1.PRICE > (SELECT AVG(B2.PRICE)
                  FROM BOOK B2 WHERE B2.PUBLISHER = B1.PUBLISHER);
                  
-- # 도서를 주문하지 않은 고객의 이름
SELECT NAME
FROM CUSTOMER
MINUS
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);

-- # 주문이 있는 고객의 이름과 주소
SELECT name, address
FROM customer
WHERE custid IN (SELECT custid FROM orders);

-- # customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경
UPDATE customer
SET address = '대한민국 부산'
WHERE custid = 5;
SELECT * FROM customer;

-- # customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경
UPDATE customer
SET address = (SELECT address FROM CUSTOMER 
WHERE name = '김연아')
WHERE name = '박세리';
SELECT * FROM customer;

-- # customer 테이블에서 고객번호가 5인 고객을 삭제한 후 결과를 확인
DELETE customer
WHERE custid = 5;
SELECT * FROM  customer;

-- # 테이블 사용하지 않고 결과값 보기
SELECT ABS(-78), ABS(+78) FROM DUAL;
SELECT ROUND(4.875, 1) FROM DUAL;

-- # 고객별 평균 주문 금액을 백원 단위로 반올림
SELECT custid 고객번호, round(AVG(saleprice), -2) "평균 금액" FROM ORDERS GROUP BY custid;

-- # 도서 제목에 '야구'가 포함된 도서를 '농구'로 변경한 후 도서 목록과 가격을 표시
SELECT bookid, REPLACE(bookname, '야구', '농구') bookname, price
FROM BOOK;

-- # '굿스포츠'에서 출판한 도서의 제목과 제목의 글자 수, 바이트 수
SELECT bookname 제목, LENGTH(bookname) 글자수, LENGTHB(bookname) 바이트수
FROM BOOK
WHERE publisher = '굿스포츠';

-- # '박세리' 항목 삽입
SELECT * FROM customer;
INSERT INTO customer VALUES(5, '박세리', '대한민국 대전', NULL);

-- # 마당서점의 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하
-- # SUBSTR(value, value의 str위치, str위치부터의 str개수)
SELECT SUBSTR(name, 1, 1) 성, count(*) 인원수
FROM customer
GROUP BY SUBSTR(name, 1, 1);

-- # 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하세요.
SELECT orderdate, orderdate+10 FROM ORDERS;

SELECT SYSDATE FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss')SYSDATE1
FROM DUAL;

-- # 마당서점이 2020년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오.
SELECT * FROM orders WHERE orderdate = '20/07/07';
SELECT orderid, TO_CHAR(orderdate, 'YYYY-mm-dd day'), custid, bookid
FROM orders
WHERE orderdate = '20/07/07';

-- # 고객목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 보이시오.
SELECT * FROM customer;
SELECT custid, name, phone
FROM customer
WHERE ROWNUM <= 2; -- # ROWNUM : 순번

-- # 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오
SELECT orderid, saleprice
FROM orders
WHERE saleprice <= (SELECT AVG(saleprice) FROM orders);

-- # 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 보이시오
SELECT orderid, custid, saleprice
FROM orders
WHERE saleprice > (SELECT AVG(saleprice) FROM orders GROUP BY CUSTID);
SELECT AVG(saleprice) FROM orders GROUP BY CUSTID;

-- # '대한민국'에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오
SELECT SUM(orders.saleprice) "총 판매액"
FROM customer, orders
WHERE customer.custid = orders.custid AND customer.address LIKE '%대한민국%';

-- # 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 보이시오
select orderid, saleprice from orders 
where saleprice > (select max(saleprice) from orders where custid=3);

-- # 날짜 관련 함수
SELECT SYSDATE FROM DUAL;
SELECT * FROM employees;
SELECT last_name, hire_date, TRUNC((SYSDATE - hire_date) / 365, 0) 근속연수 -- # TRUNC : 내림 함수
FROM employees;

-- # 특정 개월 수를 더한 날짜를 구하기
SELECT last_name, hire_date, ADD_MONTHS(hire_date, 7) FROM employees;

-- # 해당 날짜가 속한 월의 말일을 반환하는 함수
SELECT LAST_DAY(SYSDATE) FROM DUAL;

-- # 다음 달 말일(hire_date 기준)
SELECT hire_date, LAST_DAY(ADD_MONTHS(hire_date, 1)) FROM employees;

-- # 해당 날짜를 기준으로 바로 다음에 오는 명시된 요일에 해당하는 날짜를 반환
SELECT hire_date, NEXT_DAY(hire_date, '월') FROM employees;

-- # 입사일 6개월 후 첫 번째 월요일을 직원이름별로 출력
SELECT last_name, hire_date, NEXT_DAY(ADD_MONTHS(hire_date, 6), '월') FROM employees;

-- # 날짜와 날짜 사이의 개월 수 구하기
SELECT last_name, TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date), 0) 근속월수 FROM employees;

-- # job_id 별로 연봉합계, 연봉평균, 최고연봉, 최저연봉 출력, 단 평균연봉이 5000 이상인 경우만 포함
SELECT job_id, SUM(salary) 연봉합계, AVG(salary) 연봉평균, MAX(salary) 최고연봉, MIN(salary) 최저연봉
FROM employees
GROUP BY job_id
HAVING AVG(salary) >= 5000;

-- # job_id 별로 연봉합계, 연봉평균, 최고연봉, 최저연봉 출력, 단 평균연봉이 5000 이상인 경우만 내림차순으로 정렬
SELECT job_id, SUM(salary) 연봉합계, AVG(salary) 연봉평균, MAX(salary) 최고연봉, MIN(salary) 최저연봉
FROM employees
GROUP BY job_id
HAVING AVG(salary) >= 5000
ORDER BY AVG(salary) DESC;

-- # last_name에 L이 포함된 직원의 연봉을 구하세요
SELECT last_name, salary
FROM employees
WHERE last_name LIKE '%L%';

-- # job_id에 PROG가 포함된 직원의 입사일을 구하세요
SELECT hire_date
FROM employees
WHERE job_id LIKE '%PROG%';

-- # 연봉이 10000$ 이상인 manager_id가 100인 직원의 데이터를 출력하세요
SELECT *
FROM employees
WHERE manager_id = 100 AND salary >= 10000;

-- # department_id가 100보다 적은 모든 직원의 연봉을 구하세요
SELECT salary
FROM EMPLOYEES
WHERE department_id < 100;

-- # manager_id가 101, 103인 직원의 job_id를 구하세요
SELECT job_id, manager_id
FROM employees
WHERE manager_id = 103 OR manager_id = 101;

-- # 사원 번호가 110인 사원의 부서명
-- # join
SELECT * FROM employees;
SELECT * FROM departments;

SELECT e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+) AND e.employee_id = 110;

SELECT employee_id, department_name
FROM employees e
JOIN departments d on e.department_id = d.department_id(+)
WHERE employee_id = 110;

-- # 사번이 120번인 사람의 사번, 이름, 업무, 업무명을 출력
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id(+) AND e.employee_id = 120;

SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e
JOIN jobs j on e.job_id = j.job_id(+)
WHERE e.employee_id = 120;

-- # 100번 부서의 구성원 모두의 급여보다 더 많은 급여를 받는 사원을 출력
select employee_id,last_name,salary from employees 
where salary > (select max(salary) from employees where department_id=100);
-- #where salary > all(select salary from employees where department_id=100);

-- # 사번, 이름, department_name, job_title(employees, departments, jobs)
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, j.job_title
FROM employees e
JOIN departments d ON e.department_id = d.department_id(+)
JOIN jobs j ON e.job_id = j.job_id;

-- # self join : 하나의 테이블이 두 개의 테이블인 것처럼 조인
SELECT e.employee_id "부서장의 사번", e.last_name "부서장 이름", m.last_name 사원이름, m.employee_id 사번
FROM employees e, employees m
WHERE e.employee_id = m.manager_id
ORDER BY e.employee_id;

-- # outer join : 조인 조건에 만족하지 못하더라도 해당 행을 나타내고 싶을 때 사용
SELECT e.employee_id, e.last_name, m.last_name, m.manager_id
FROM employees e, employees m
WHERE e.employee_id = m.manager_id(+)
ORDER BY e.employee_id;

-- # UNION : 두 결과를 합치면서 중복 값 제거 (합집합)
-- # UNION ALL : 두 결과를 합치면서 중복도 표현
SELECT first_name 이름, salary 급여 FROM employees
WHERE salary < 5000
UNION ALL
SELECT first_name 이름, salary 급여 FROM employees
WHERE hire_date < '99/01/01';

-- # INTERSECT : 두 조건 동시 만족 (교집합)
SELECT first_name 이름, salary 급여 FROM employees
WHERE salary < 5000
INTERSECT
SELECT first_name 이름, salary 급여 FROM employees
WHERE hire_date < '06/01/01';

-- # MINUS : 위 조건에서 아래 조건을 뺀 값 (차집합)
SELECT first_name 이름, salary 급여 FROM employees
WHERE salary < 5000
MINUS
SELECT first_name 이름, salary 급여 FROM employees
WHERE hire_date > '06/01/01';

-- # UNBOUNDED PRECEDING : 처음행까지 선택
-- # UNBOUNDED FOLLOWING : 마지막행까지 선택
-- # CURRENT ROW : 현재행
