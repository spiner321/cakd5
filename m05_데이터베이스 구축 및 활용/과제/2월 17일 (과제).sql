-- [과제] EXISTS 연산자를 사용하여 '대한민국'에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
SELECT SUM(SALEPRICE) TOTAL
FROM ORDERS
WHERE EXISTS 
(SELECT * FROM CUSTOMER
 WHERE ADDRESS LIKE '%대한민국%' AND ORDERS.CUSTID = CUSTOMER.CUSTID);

-- [과제] 마당서점의 고객별 판매액을 보이시오(고객이름과 고객별 판매액 출력).
SELECT (SELECT NAME FROM CUSTOMER WHERE CUSTOMER.CUSTID = ORDERS.CUSTID) NAME, SUM(SALEPRICE) TOTAL
FROM ORDERS
GROUP BY ORDERS.CUSTID;

-- [과제] 고객번호가 2 이하인 고객의 판매액을 보이시오(고객이름과 고객별 판매액 출력)
SELECT C.NAME, SUM(O.SALEPRICE) TOTAL
FROM (SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID <=2), C

-- [과제] vw_customer를 미국을 주소로 가진 고객으로 변경하세요.
SELECT * FROM vw_customer;
CREATE OR REPLACE VIEW vw_customer
AS SELECT *
FROM customer
WHERE address LIKE '%미국%';

-- [과제] 앞서 생성한 뷰 vw_customer를 삭제하시오.


-- [과제] EMPLOYEES 테이블에서 COMMISSION_PCT의 Null값 개수를 출력하세요.
SELECT * FROM employees;
SELECT COUNT(*) FROM employees WHERE commission_pct is null;

-- [과제] EMPLOYEES 테이블에서 employee_id가 홀수인 것만 출력하세요.
SELECT * FROM employees WHERE MOD(employee_id, 2) = 1;

-- [과제] job_id의 문자 길이를 구하세요.
SELECT job_id, LENGTH(job_id) FROM employees;

-- [과제] job_id별로 연봉합계, 연봉평균, 최고연봉, 최저연봉을 출력하세요.
SELECT JOB_ID, SUM(SALARY), AVG(SALARY), MAX(SALARY), MIN(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;