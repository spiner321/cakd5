-- [과제] EMPLOYEES 테이블에서 ESCAPE 옵션을 사용하여 아래와 같이 출력되는 SQL문을 작성하세요.
--- job_id 칼럼에서 _를 와일드카드가 아닌 문자로 취급하여 '_A'를 포함하는 모든 행을 출력
SELECT * FROM employees 
WHERE job_id LIKE '%\_A%' ESCAPE '\';

-- [과제] employees 테이블에서 이름에 first_name에 last_name을 붙여서 'name' 컬럼명으로 출력하세요.
SELECT first_name||' '||last_name name FROM employees;
SELECT concat(concat(first_name, ' '), last_name) name FROM employees;


-- [과제] Seo라는 사람의 부서명을 출력하세요
SELECT last_name, department_name FROM DEPARTMENTS D, EMPLOYEES E
WHERE last_name = 'Seo'
ORDER BY d.department_name;

select last_name, department_name from employees e
join departments d on d.department_id=e.department_id
where last_name = 'Seo';

SELECT last_name, department_name FROM DEPARTMENTS D, EMPLOYEES E
WHERE d.department_id=e.department_id and last_name = 'Seo'
ORDER BY d.department_name;

SELECT department_name FROM departments
WHERE department_id = (SELECT department_id FROM employees WHERE last_name = 'Seo');

-- [과제] 테이블들을 분석해서 전체 현황을 설명할 수 있는 요약 테이블 3개를 작성하세요.
--- 예)부서별 salary 순위
