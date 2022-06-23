-- [����] EMPLOYEES ���̺��� ESCAPE �ɼ��� ����Ͽ� �Ʒ��� ���� ��µǴ� SQL���� �ۼ��ϼ���.
--- job_id Į������ _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����Ͽ� '_A'�� �����ϴ� ��� ���� ���
SELECT * FROM employees 
WHERE job_id LIKE '%\_A%' ESCAPE '\';

-- [����] employees ���̺��� �̸��� first_name�� last_name�� �ٿ��� 'name' �÷������� ����ϼ���.
SELECT first_name||' '||last_name name FROM employees;
SELECT concat(concat(first_name, ' '), last_name) name FROM employees;


-- [����] Seo��� ����� �μ����� ����ϼ���
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

-- [����] ���̺���� �м��ؼ� ��ü ��Ȳ�� ������ �� �ִ� ��� ���̺� 3���� �ۼ��ϼ���.
--- ��)�μ��� salary ����
