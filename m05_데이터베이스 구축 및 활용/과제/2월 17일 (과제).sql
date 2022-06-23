-- [����] EXISTS �����ڸ� ����Ͽ� '���ѹα�'�� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT SUM(SALEPRICE) TOTAL
FROM ORDERS
WHERE EXISTS 
(SELECT * FROM CUSTOMER
 WHERE ADDRESS LIKE '%���ѹα�%' AND ORDERS.CUSTID = CUSTOMER.CUSTID);

-- [����] ���缭���� ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǹž� ���).
SELECT (SELECT NAME FROM CUSTOMER WHERE CUSTOMER.CUSTID = ORDERS.CUSTID) NAME, SUM(SALEPRICE) TOTAL
FROM ORDERS
GROUP BY ORDERS.CUSTID;

-- [����] ����ȣ�� 2 ������ ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǹž� ���)
SELECT C.NAME, SUM(O.SALEPRICE) TOTAL
FROM (SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID <=2), C

-- [����] vw_customer�� �̱��� �ּҷ� ���� ������ �����ϼ���.
SELECT * FROM vw_customer;
CREATE OR REPLACE VIEW vw_customer
AS SELECT *
FROM customer
WHERE address LIKE '%�̱�%';

-- [����] �ռ� ������ �� vw_customer�� �����Ͻÿ�.


-- [����] EMPLOYEES ���̺��� COMMISSION_PCT�� Null�� ������ ����ϼ���.
SELECT * FROM employees;
SELECT COUNT(*) FROM employees WHERE commission_pct is null;

-- [����] EMPLOYEES ���̺��� employee_id�� Ȧ���� �͸� ����ϼ���.
SELECT * FROM employees WHERE MOD(employee_id, 2) = 1;

-- [����] job_id�� ���� ���̸� ���ϼ���.
SELECT job_id, LENGTH(job_id) FROM employees;

-- [����] job_id���� �����հ�, �������, �ְ���, ���������� ����ϼ���.
SELECT JOB_ID, SUM(SALARY), AVG(SALARY), MAX(SALARY), MIN(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;