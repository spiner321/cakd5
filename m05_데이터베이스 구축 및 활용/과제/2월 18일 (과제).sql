-- [����] job_title, department_name ���� ��� ������ ���� �� ����ϼ���
SELECT j.job_title, d.department_name, ROUND(AVG(e.salary), 0)
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id
GROUP BY j.job_title, d.department_name;

-- [����] 2005�� ���Ŀ� �Ի��� ������ ���, �̸�, �Ի���, �μ��� (department_name), ������(job_title)�� ���
SELECT e.employee_id, e.last_name, e.hire_date, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND TO_CHAR(e.hire_date ,'yyyy') >= 2005;

-- [����] ��պ��� ���� �޿��� �޴� ���� �˻� �� ���
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- [����] last_name�� king�� ������ last_name, hire_date, department_id�� ���
SELECT last_name, hire_date, department_id
FROM employees
WHERE LOWER(last_name) = 'king';

-- [����] �Ʒ� ���ؿ� ���� ���, �̸�, ������ ���
-- salary > 20000 '��ǥ�̻�'
-- salary > 15000 '�̻�'
-- salary > 10000 '����
-- salary > 5000 '����'
-- salary > 3000 '�븮'

SELECT employee_id ���, last_name �̸�, 
case
    when salary > 20000 then '��ǥ�̻�'
    when salary > 15000 then '�̻�'
    when salary > 10000 then '����'
    when salary > 3000 then '�븮'
    else '���'
end as ����
from employees
ORDER BY salary;
