-- [����] employees ���̺��� department_id = 50�� ������ ������ �������� �����Ͽ� ���� ī��Ʈ�� ���
SELECT * FROM EMPLOYEES;
SELECT department_id, salary, count(salary) over(order by salary desc rows unbounded preceding) FROM EMPLOYEES
WHERE department_id = 50;

-- [����] employees ���̺��� department_id�� �������� �������� �����ϰ� �׷� ������ ���� ���� �հ踦 ���
SELECT * FROM EMPLOYEES;
--SELECT department_id, salary, sum(salary) over(order by salary rows unbounded preceding) FROM EMPLOYEES;

SELECT department_id, last_name, sum(salary) OVER(PARTITION BY department_id ORDER BY department_id asc) FROM employees;

-- [����] employees ���̺��� department_id(�μ�)�� ���� ���������� ����ϼ���.
SELECT department_id, salary, rank() over(partition by department_id order by salary desc) rank
FROM employees
ORDER BY department_id;

--SELECT department_id, salary, row_number() over(partition by department_id order by salary) rank
--FROM employees
--ORDER BY department_id, salary;