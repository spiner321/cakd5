-- # <2�� 16��>
-- # <dml>

-- # �����Լ�
--- # RANK() : ������ �ִ� ��� ���� ������ ����, ���� ������ ���ڸ� �ǳʶڴ�. (1, 2, 2, 4, 4, 6, ...)
--- # DENSE_RANK() : �������� ��쿡 ������ ������ ����, ���� ������ ���� ���ں��� ������ �ȴ� (1, 2, 2, 3, 3, 4, ...)
--- # ROW_NUMBER() : (1, 2, 3, 4, 5, 6, ...)
SELECT ����ȣ, ��������, SUM(���űݾ�), ROW_NUMBER() over(partition by ����ȣ order by �������� desc) "����"FROM LCL GROUP BY ����ȣ, ��������;

-- # ESCAPE
SELECT * FROM employees WHERE job_id like '%\_A%' escape '\';
SELECT * FROM employees WHERE job_id like '%#_A%' escape '#';

-- # IN : OR ��� ���
SELECT * FROM employees WHERE manager_id = 101 or manager_id = 102 or manager_id = 103;
SELECT * FROM employees WHERE manager_id in (101, 102, 103);

-- # BETWEEN AND : AND ��� ���
SELECT * FROM employees WHERE manager_id BETWEEN 101 AND 103;

-- # IS NULL / IS NOT NULL
SELECT * FROM employees WHERE commission_pct IS NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;

-- # �ֿ� �Լ�
--- ## MOD() : ������ ���
SELECT * FROM employees WHERE MOD(employee_id, 2) = 1;
SELECT MOD(10, 3) FROM DUAL;

--- ## ROUND() : �ݿø�
SELECT ROUND(355.885555, 3) FROM DUAL;

--- ## TRUNC() : ����
SELECT TRUNC(45.555, 1) FROM DUAL;

--- ## ��¥ ���� �Լ�
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE + 1 FROM DUAL;
SELECT last_name, TRUNC((SYSDATE - hire_date)/365) �ټӿ��� FROM employees;
SELECT last_name, hire_date, ADD_MONTHS(hire_date, 6) FROM employees;
SELECT TO_CHAR(sysdate, 'yy') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL;
SELECT TO_CHAR(TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD') + 151000), 'YYYY-MM-DD') FROM DUAL;
SELECT TO_DATE('20210101'), TO_CHAR(TO_DATE('20210101'), 'MONTHDD YYYY', 'NLS_DATE_LANGUAGE=english') FORMAT1 FROM DUAL;
SELECT last_name, SYSDATE, hire_date, TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) FROM employees;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') FROM DUAL;

-- # ����ȯ �Լ�
--- ## NUMBER CHARACTER DATE
--- ## TO_DATE() ���ڿ��� ��¥�� �ٲٱ�
--- ## TO_NUMBER, TO_CHAR, TO_DATE
SELECT SYSDATE - TO_DATE('10/01/01') FROM DUAL;
SELECT SYSDATE +  FROM DUAL;


-- # TO_CHAR
--- ## 9 : ���ڸ��� ����ǥ��
--- ## 0 : �պκ��� 0���� ǥ��
--- ## $ : �޷� ��ȣ�� �տ� ǥ��
--- ## . : �Ҽ����� ǥ��
--- ## , : Ư�� ��ġ�� ǥ��
--- ## mi : �����ʿ� ? ��ȣ ǥ��
--- ## pr : �������� <>�� ǥ��
--- ## EEEE : ������ ǥ��
--- ## B : ������ 0���� ǥ��
--- ## L : ���� ��ȭ
SELECT salary, TO_CHAR(salary, '090990') FROM employees;
SELECT TO_CHAR(-salary, '99999PR') FROM employees;
SELECT TO_CHAR(1111, '99.99EEEE') FROM dual;
SELECT TO_CHAR(1111, 'B9999.99') FROM DUAL;
SELECT TO_CHAR(1111, 'L9999') FROM DUAL;

-- # WIDTH_BUCKET() ������, �ּҰ�, �ִ밪 , BUCKET ����
SELECT WIDTH_BUCKET(1, 0, 10, 5) FROM DUAL;
SELECT department_id, last_name, salary, WIDTH_BUCKET(salary, 0, 20000, 5) FROM employees WHERE department_id = 50;

-- # employees ���̺� �ִ� ������ (���, �̸� ��������)�� ���Ͽ� ����������� �ټӿ����� ���ϼ���
SELECT * FROM EMPLOYEES;
SELECT employee_id, last_name, TRUNC((SYSDATE - hire_date)/365) �ټӿ��� FROM EMPLOYEES;

-- # �����Լ�
SELECT UPPER('Hello World') FROM DUAL;
SELECT LOWER('Hello World') FROM DUAL;
SELECT last_name, salary FROM employees WHERE LOWER(last_name) = 'seo';
SELECT INITCAP(job_id) FROM employees;
SELECT job_id, LENGTH(job_id) FROM employees;
SELECT INSTR('Hello World', 'o', 3, 1) FROM DUAL; -- INSTR(ã�⸦ ������ ����, ã�� ����, ã�⸦ ������ ��ġ, ���� ��ġ���� ã�� ������ ����)
SELECT SUBSTR('Hello World', 3, 3) FROM DUAL;
SELECT SUBSTR('Hello World', -3, 3) FROM DUAL;
SELECT LPAD('Hello World', 20, '#') FROM DUAL;
SELECT RPAD('Hello World', 20, '#') FROM DUAL;
SELECT LTRIM('aaaHello Worldaaa', 'a') FROM DUAL;
SELECT RTRIM('aaaHello Worldaaa', 'a') FROM DUAL;
SELECT TRIM(BOTH 'a' FROM 'aaaHello Worldaaa') FROM DUAL;
SELECT TRIM('   Hello World   ') FROM DUAL;

-- # ��Ÿ�Լ�
SELECT salary, commission_pct, salary*12*NVL(commission_pct, 0) FROM employees;

-- # �м��Լ� : ���� ���� ������ ������ ���� ����� return �� �� ������ ó�� ����� �Ǵ� ���� ������ window��� ��Ī
-- # FIRST_VALUE() OVER() �׷��� ù��° ���� ���Ѵ�.
SELECT first_name �̸�, salary ����,
FIRST_VALUE(salary) OVER(ORDER BY salary DESC) �ְ���
FROM employees;

SELECT first_name �̸�, salary ����,
FIRST_VALUE(salary) OVER(ORDER BY salary) ��������
FROM employees;

SELECT first_name �̸�, salary ����,
LAST_VALUE(salary) OVER(ORDER BY salary) ��������
FROM employees;

SELECT first_name �̸�, salary ����,
FIRST_VALUE(salary) OVER(ORDER BY salary ROWS 3 PRECEDING) ��������
FROM employees;

SELECT first_name �̸�, salary ����,
FIRST_VALUE(salary) OVER(ORDER BY salary ROWS 3 PRECEDING) ��������
FROM employees;

SELECT first_name �̸�, salary ����,
LAST_VALUE(salary) OVER(ORDER BY salary DESC ROWS 3 preceding) ��������
FROM employees;

SELECT first_name �̸�, salary ����,
FIRST_VALUE(salary) OVER(ORDER BY salary RANGE 3 PRECEDING) �ְ���
FROM employees;

SELECT first_name �̸�, salary ����,
LAST_VALUE(salary) OVER(ORDER BY salary DESC ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) ��������
FROM employees;




DESC BOOK;
SELECT * FROM BOOK;

-- # Ư�� �÷��� ���
SELECT BOOKNAME,PRICE FROM  BOOK;       

-- # �ߺ��� �� ����
SELECT PUBLISHER FROM BOOK;
SELECT DISTINCT PUBLISHER FROM BOOK;

-- # ������ �����Ͽ� ���
SELECT * FROM BOOK WHERE PRICE <10000;

-- # ������ 10000�� �̻� 20000�� ������ ����
SELECT * FROM BOOK WHERE 10000<=PRICE AND 20000>=PRICE;

-- # ���ǻ簡 �½�����, Ȥ�� ���ѹ̵���� ����
SELECT * FROM BOOK WHERE PUBLISHER='�½�����' OR PUBLISHER='���ѹ̵��';
SELECT * FROM BOOK WHERE PUBLISHER IN ('�½�����', '���ѹ̵��');

-- # ���ǻ簡 �½�����, Ȥ�� ���ѹ̵� �ƴ� ����
SELECT * FROM BOOK WHERE PUBLISHER NOT IN ('�½�����','���ѹ̵��');

-- # �����̸��� �౸�� ���Ե� ���ǻ縦 �˻�
SELECT PUBLISHER FROM BOOK WHERE BOOKNAME LIKE '%�౸%';

-- # �������� ����
SELECT * FROM BOOK ORDER BY BOOKNAME;

-- # �������� ����
SELECT * FROM BOOK ORDER BY BOOKNAME DESC;

-- # ������ ���ݼ����� �˻��ϰ� ������ ������ �̸������� �˻�
SELECT * FROM BOOK ORDER BY PRICE, BOOKNAME;

-- # ������ ������ ������������ �˻��ϰ� ���� ������ ���ٸ� ���ǻ��� ������������ ���
SELECT * FROM BOOK ORDER BY PRICE DESC, PUBLISHER;

-- # �հ� ���ϱ�
SELECT * FROM ORDERS;
SELECT SUM(SALEPRICE) FROM ORDERS;

-- # �հ� ���� ���� �÷� �����
SELECT SUM(SALEPRICE) AS �Ѹ��� FROM ORDERS;

-- # CUSTID�� 2���� ���� �ֹ��� ������ ���Ǹž�
SELECT SUM(SALEPRICE) AS "�� �Ǹž�" FROM ORDERS WHERE CUSTID = 2;

-- # �ѹ��� ó���ϱ�
SELECT SUM(SALEPRICE) AS TOTAL,
AVG(SALEPRICE) AS AVERAGE,
MIN(SALEPRICE) AS MINIMUM,
MAX(SALEPRICE) AS MAXIMUM
FROM ORDERS;

-- # ���� ���ϱ�
SELECT COUNT(*) FROM ORDERS;

-- # CUSTID�� ���������� ���Ǹž�
SELECT  CUSTID, COUNT(*) AS ��������, SUM(SALEPRICE) AS "�� �Ǹž�" FROM ORDERS GROUP BY CUSTID;

SELECT * FROM ORDERS;

-- # ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���ϼ���, �� �� �� �̻� ������ ���� ����.
SELECT CUSTID, COUNT(*) AS "�ֹ� ������" FROM ORDERS
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >= 2;

-- # ���� �׸� ���� ��� ��ȸ�ѵ� CUSTID �������� ����
SELECT * FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY CUSTOMER.CUSTID;

-- # ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ� ������ ����
SELECT NAME, SUM(SALEPRICE) FROM CUSTOMER, ORDERS 
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.NAME
ORDER BY CUSTOMER.NAME;

-- # ���� �̸��� ���� �ֹ��� ������ �̸�
SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM CUSTOMER, ORDERS, BOOK
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID AND ORDERS.BOOKID = BOOK.BOOKID;

-- # ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ����
SELECT * FROM BOOK;
SELECT B1.BOOKNAME
FROM BOOK B1
WHERE B1.PRICE > (SELECT AVG(B2.PRICE)
                  FROM BOOK B2 WHERE B2.PUBLISHER = B1.PUBLISHER);
                  
-- # ������ �ֹ����� ���� ���� �̸�
SELECT NAME
FROM CUSTOMER
MINUS
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);

-- # �ֹ��� �ִ� ���� �̸��� �ּ�
SELECT name, address
FROM customer
WHERE custid IN (SELECT custid FROM orders);

-- # customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� '���ѹα� �λ�'���� ����
UPDATE customer
SET address = '���ѹα� �λ�'
WHERE custid = 5;
SELECT * FROM customer;

-- # customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� ����
UPDATE customer
SET address = (SELECT address FROM CUSTOMER 
WHERE name = '�迬��')
WHERE name = '�ڼ���';
SELECT * FROM customer;

-- # customer ���̺��� ����ȣ�� 5�� ���� ������ �� ����� Ȯ��
DELETE customer
WHERE custid = 5;
SELECT * FROM  customer;

-- # ���̺� ������� �ʰ� ����� ����
SELECT ABS(-78), ABS(+78) FROM DUAL;
SELECT ROUND(4.875, 1) FROM DUAL;

-- # ���� ��� �ֹ� �ݾ��� ��� ������ �ݿø�
SELECT custid ����ȣ, round(AVG(saleprice), -2) "��� �ݾ�" FROM ORDERS GROUP BY custid;

-- # ���� ���� '�߱�'�� ���Ե� ������ '��'�� ������ �� ���� ��ϰ� ������ ǥ��
SELECT bookid, REPLACE(bookname, '�߱�', '��') bookname, price
FROM BOOK;

-- # '�½�����'���� ������ ������ ����� ������ ���� ��, ����Ʈ ��
SELECT bookname ����, LENGTH(bookname) ���ڼ�, LENGTHB(bookname) ����Ʈ��
FROM BOOK
WHERE publisher = '�½�����';

-- # '�ڼ���' �׸� ����
SELECT * FROM customer;
INSERT INTO customer VALUES(5, '�ڼ���', '���ѹα� ����', NULL);

-- # ���缭���� �� �߿��� ���� ��(��)�� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ����
-- # SUBSTR(value, value�� str��ġ, str��ġ������ str����)
SELECT SUBSTR(name, 1, 1) ��, count(*) �ο���
FROM customer
GROUP BY SUBSTR(name, 1, 1);

-- # ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���ϼ���.
SELECT orderdate, orderdate+10 FROM ORDERS;

SELECT SYSDATE FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss')SYSDATE1
FROM DUAL;

-- # ���缭���� 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�.
SELECT * FROM orders WHERE orderdate = '20/07/07';
SELECT orderid, TO_CHAR(orderdate, 'YYYY-mm-dd day'), custid, bookid
FROM orders
WHERE orderdate = '20/07/07';

-- # ����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̽ÿ�.
SELECT * FROM customer;
SELECT custid, name, phone
FROM customer
WHERE ROWNUM <= 2; -- # ROWNUM : ����

-- # ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�
SELECT orderid, saleprice
FROM orders
WHERE saleprice <= (SELECT AVG(saleprice) FROM orders);

-- # �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� �ֹ���ȣ, ����ȣ, �ݾ��� ���̽ÿ�
SELECT orderid, custid, saleprice
FROM orders
WHERE saleprice > (SELECT AVG(saleprice) FROM orders GROUP BY CUSTID);
SELECT AVG(saleprice) FROM orders GROUP BY CUSTID;

-- # '���ѹα�'�� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT SUM(orders.saleprice) "�� �Ǹž�"
FROM customer, orders
WHERE customer.custid = orders.custid AND customer.address LIKE '%���ѹα�%';

-- # 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���̽ÿ�
select orderid, saleprice from orders 
where saleprice > (select max(saleprice) from orders where custid=3);

-- # ��¥ ���� �Լ�
SELECT SYSDATE FROM DUAL;
SELECT * FROM employees;
SELECT last_name, hire_date, TRUNC((SYSDATE - hire_date) / 365, 0) �ټӿ��� -- # TRUNC : ���� �Լ�
FROM employees;

-- # Ư�� ���� ���� ���� ��¥�� ���ϱ�
SELECT last_name, hire_date, ADD_MONTHS(hire_date, 7) FROM employees;

-- # �ش� ��¥�� ���� ���� ������ ��ȯ�ϴ� �Լ�
SELECT LAST_DAY(SYSDATE) FROM DUAL;

-- # ���� �� ����(hire_date ����)
SELECT hire_date, LAST_DAY(ADD_MONTHS(hire_date, 1)) FROM employees;

-- # �ش� ��¥�� �������� �ٷ� ������ ���� ��õ� ���Ͽ� �ش��ϴ� ��¥�� ��ȯ
SELECT hire_date, NEXT_DAY(hire_date, '��') FROM employees;

-- # �Ի��� 6���� �� ù ��° �������� �����̸����� ���
SELECT last_name, hire_date, NEXT_DAY(ADD_MONTHS(hire_date, 6), '��') FROM employees;

-- # ��¥�� ��¥ ������ ���� �� ���ϱ�
SELECT last_name, TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date), 0) �ټӿ��� FROM employees;

-- # job_id ���� �����հ�, �������, �ְ���, �������� ���, �� ��տ����� 5000 �̻��� ��츸 ����
SELECT job_id, SUM(salary) �����հ�, AVG(salary) �������, MAX(salary) �ְ���, MIN(salary) ��������
FROM employees
GROUP BY job_id
HAVING AVG(salary) >= 5000;

-- # job_id ���� �����հ�, �������, �ְ���, �������� ���, �� ��տ����� 5000 �̻��� ��츸 ������������ ����
SELECT job_id, SUM(salary) �����հ�, AVG(salary) �������, MAX(salary) �ְ���, MIN(salary) ��������
FROM employees
GROUP BY job_id
HAVING AVG(salary) >= 5000
ORDER BY AVG(salary) DESC;

-- # last_name�� L�� ���Ե� ������ ������ ���ϼ���
SELECT last_name, salary
FROM employees
WHERE last_name LIKE '%L%';

-- # job_id�� PROG�� ���Ե� ������ �Ի����� ���ϼ���
SELECT hire_date
FROM employees
WHERE job_id LIKE '%PROG%';

-- # ������ 10000$ �̻��� manager_id�� 100�� ������ �����͸� ����ϼ���
SELECT *
FROM employees
WHERE manager_id = 100 AND salary >= 10000;

-- # department_id�� 100���� ���� ��� ������ ������ ���ϼ���
SELECT salary
FROM EMPLOYEES
WHERE department_id < 100;

-- # manager_id�� 101, 103�� ������ job_id�� ���ϼ���
SELECT job_id, manager_id
FROM employees
WHERE manager_id = 103 OR manager_id = 101;

-- # ��� ��ȣ�� 110�� ����� �μ���
-- # join
SELECT * FROM employees;
SELECT * FROM departments;

SELECT e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+) AND e.employee_id = 110;

SELECT employee_id, department_name
FROM employees e
JOIN departments d on e.department_id = d.department_id(+)
WHERE employee_id = 110;

-- # ����� 120���� ����� ���, �̸�, ����, �������� ���
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id(+) AND e.employee_id = 120;

SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e
JOIN jobs j on e.job_id = j.job_id(+)
WHERE e.employee_id = 120;

-- # 100�� �μ��� ������ ����� �޿����� �� ���� �޿��� �޴� ����� ���
select employee_id,last_name,salary from employees 
where salary > (select max(salary) from employees where department_id=100);
-- #where salary > all(select salary from employees where department_id=100);

-- # ���, �̸�, department_name, job_title(employees, departments, jobs)
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, j.job_title
FROM employees e
JOIN departments d ON e.department_id = d.department_id(+)
JOIN jobs j ON e.job_id = j.job_id;

-- # self join : �ϳ��� ���̺��� �� ���� ���̺��� ��ó�� ����
SELECT e.employee_id "�μ����� ���", e.last_name "�μ��� �̸�", m.last_name ����̸�, m.employee_id ���
FROM employees e, employees m
WHERE e.employee_id = m.manager_id
ORDER BY e.employee_id;

-- # outer join : ���� ���ǿ� �������� ���ϴ��� �ش� ���� ��Ÿ���� ���� �� ���
SELECT e.employee_id, e.last_name, m.last_name, m.manager_id
FROM employees e, employees m
WHERE e.employee_id = m.manager_id(+)
ORDER BY e.employee_id;

-- # UNION : �� ����� ��ġ�鼭 �ߺ� �� ���� (������)
-- # UNION ALL : �� ����� ��ġ�鼭 �ߺ��� ǥ��
SELECT first_name �̸�, salary �޿� FROM employees
WHERE salary < 5000
UNION ALL
SELECT first_name �̸�, salary �޿� FROM employees
WHERE hire_date < '99/01/01';

-- # INTERSECT : �� ���� ���� ���� (������)
SELECT first_name �̸�, salary �޿� FROM employees
WHERE salary < 5000
INTERSECT
SELECT first_name �̸�, salary �޿� FROM employees
WHERE hire_date < '06/01/01';

-- # MINUS : �� ���ǿ��� �Ʒ� ������ �� �� (������)
SELECT first_name �̸�, salary �޿� FROM employees
WHERE salary < 5000
MINUS
SELECT first_name �̸�, salary �޿� FROM employees
WHERE hire_date > '06/01/01';

-- # UNBOUNDED PRECEDING : ó������� ����
-- # UNBOUNDED FOLLOWING : ����������� ����
-- # CURRENT ROW : ������
