-- [과제] employees 테이블에서 employee_id, last_nmae, salary, hire_date 및 입사일 기준으로 근속년수를 계산해서 아래사항을 추가한 후 출력하세요
-- 2001년 1월 1일 창업하여 현재(2020년 12월 31일)까지 20년간 운영된 회사는 직원의 근속연수에 따라 30등급으로 나누어 등급에 따라 1000원의 bonus를 지급(bonus 기준 내림차순 정렬)

SELECT employee_id, last_name, salary, hire_date,
TRUNC(((to_date('20201231') - hire_date)/365)) 근속연수,
(WIDTH_BUCKET(TRUNC(((to_date('20201231') - hire_date)/365)),0,20,30))*1000 bonus,
(WIDTH_BUCKET(TRUNC(((to_date('20201231') - hire_date)/365)),0,20,30)) 구간
FROM employees
ORDER BY bonus DESC;

SELECT employee_id, last_name, salary, hire_date,
TRUNC(((to_date('20211231') - hire_date)/365)) 근속연수,
(WIDTH_BUCKET(TRUNC(((to_date('20211231') - hire_date)/365)),0,20,30))*1000 bonus,
(WIDTH_BUCKET(TRUNC(((to_date('20211231') - hire_date)/365)),0,20,30)) 구간
FROM employees
ORDER BY bonus DESC;


SELECT WIDTH_BUCKET(19.5, 0, 20, 30) FROM DUAL;