-- [과제] employees 테이블에서 department_id = 50인 직원의 연봉을 내림차순 정렬하여 누적 카운트를 출력
SELECT * FROM EMPLOYEES;
SELECT department_id, salary, count(salary) over(order by salary desc rows unbounded preceding) FROM EMPLOYEES
WHERE department_id = 50;

-- [과제] employees 테이블에서 department_id를 기준으로 오름차순 정렬하고 그룹 직원의 연봉 누적 합계를 출력
SELECT * FROM EMPLOYEES;
--SELECT department_id, salary, sum(salary) over(order by salary rows unbounded preceding) FROM EMPLOYEES;

SELECT department_id, last_name, sum(salary) OVER(PARTITION BY department_id ORDER BY department_id asc) FROM employees;

-- [과제] employees 테이블에서 department_id(부서)별 직원 연봉순위를 출력하세요.
SELECT department_id, salary, rank() over(partition by department_id order by salary desc) rank
FROM employees
ORDER BY department_id;

--SELECT department_id, salary, row_number() over(partition by department_id order by salary) rank
--FROM employees
--ORDER BY department_id, salary;