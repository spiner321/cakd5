-- [����] employees ���̺��� employee_id, last_nmae, salary, hire_date �� �Ի��� �������� �ټӳ���� ����ؼ� �Ʒ������� �߰��� �� ����ϼ���
-- 2001�� 1�� 1�� â���Ͽ� ����(2020�� 12�� 31��)���� 20�Ⱓ ��� ȸ��� ������ �ټӿ����� ���� 30������� ������ ��޿� ���� 1000���� bonus�� ����(bonus ���� �������� ����)

SELECT employee_id, last_name, salary, hire_date,
TRUNC(((to_date('20201231') - hire_date)/365)) �ټӿ���,
(WIDTH_BUCKET(TRUNC(((to_date('20201231') - hire_date)/365)),0,20,30))*1000 bonus,
(WIDTH_BUCKET(TRUNC(((to_date('20201231') - hire_date)/365)),0,20,30)) ����
FROM employees
ORDER BY bonus DESC;

SELECT employee_id, last_name, salary, hire_date,
TRUNC(((to_date('20211231') - hire_date)/365)) �ټӿ���,
(WIDTH_BUCKET(TRUNC(((to_date('20211231') - hire_date)/365)),0,20,30))*1000 bonus,
(WIDTH_BUCKET(TRUNC(((to_date('20211231') - hire_date)/365)),0,20,30)) ����
FROM employees
ORDER BY bonus DESC;


SELECT WIDTH_BUCKET(19.5, 0, 20, 30) FROM DUAL;