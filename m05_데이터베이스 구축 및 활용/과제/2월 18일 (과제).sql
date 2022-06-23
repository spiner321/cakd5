-- [과제] job_title, department_name 별로 평균 연봉을 구한 후 출력하세요
SELECT j.job_title, d.department_name, ROUND(AVG(e.salary), 0)
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id
GROUP BY j.job_title, d.department_name;

-- [과제] 2005년 이후에 입사한 직원의 사번, 이름, 입사일, 부서명 (department_name), 업무명(job_title)을 출력
SELECT e.employee_id, e.last_name, e.hire_date, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND TO_CHAR(e.hire_date ,'yyyy') >= 2005;

-- [과제] 평균보다 많은 급여를 받는 직원 검색 후 출력
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- [과제] last_name이 king인 직원의 last_name, hire_date, department_id를 출력
SELECT last_name, hire_date, department_id
FROM employees
WHERE LOWER(last_name) = 'king';

-- [과제] 아래 기준에 맞춰 사번, 이름, 직급을 출력
-- salary > 20000 '대표이사'
-- salary > 15000 '이사'
-- salary > 10000 '부장
-- salary > 5000 '과장'
-- salary > 3000 '대리'

SELECT employee_id 사번, last_name 이름, 
case
    when salary > 20000 then '대표이사'
    when salary > 15000 then '이사'
    when salary > 10000 then '부장'
    when salary > 3000 then '대리'
    else '사원'
end as 직급
from employees
ORDER BY salary;
