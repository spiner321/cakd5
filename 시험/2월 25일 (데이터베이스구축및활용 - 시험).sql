--������ ��� AI ���� �ַ�� ������ ��������

--������� : �����ͺ��̽� ���� �� Ȱ��

--���� : 22.02.25
--���� : �����
--���� :


--�� HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)�� Ȱ���Ͽ� ���� �������� �����ϼ���.
--Q1. HR EMPLOYEES ���̺��� �̸�, ����, 10% �λ�� ������ ����ϼ���.
--A.
SELECT employee_id, salary, salary * 1.1 "10% �λ� ����" FROM employees;
    
--Q2.  2005�� ��ݱ⿡ �Ի��� ����鸸 ���	
--A.        
 SELECT first_name, last_name, hire_date FROM employees
 WHERE hire_date BETWEEN TO_DATE(20050101) AND TO_DATE(20050630)
 ORDER BY hire_date;

--Q3. ���� SA_MAN, IT_PROG, ST_MAN �� ����� ���
--A.
SELECT * FROM employees
WHERE job_id = ANY('SA_MAN', 'IT_PROG', 'ST_MAN')
ORDER BY FIRST_NAME;
   
--Q4. manager_id �� 101���� 103�� ����� ���
--A.   	
SELECT * FROM employees
WHERE manager_id in ('101', '103');

--Q5. EMPLOYEES ���̺��� LAST_NAME, HIRE_DATE �� �Ի����� 6���� �� ù ��° �������� ����ϼ���.
--A.
SELECT LAST_NAME, HIRE_DATE, NEXT_DAY(ADD_MONTHS(HIRE_DATE, 6), '��') FROM EMPLOYEES;

--Q6. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �����ϱ����� W_MONTH(�ټӿ���)�� ������ ����ؼ� ����ϼ���.(�ټӿ��� ���� ��������)
--A.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, TRUNC((SYSDATE-HIRE_DATE)/365*12) "W_MONTH" FROM EMPLOYEES ORDER BY "W_MONTH" DESC;
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "W_MONTH" FROM EMPLOYEES ORDER BY "W_MONTH";

--Q7. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� W_YEAR(�ټӳ��)�� ����ؼ� ����ϼ���.(�ټӳ�� ���� ��������)
--A.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, TRUNC((SYSDATE-HIRE_DATE)/365) "W_YEAR" FROM EMPLOYEES ORDER BY "W_YEAR" DESC;

--Q8. EMPLOYEE_ID�� Ȧ���� ������ EMPLPYEE_ID�� LAST_NAME�� ����ϼ���.
--A. 
SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID, 2) = 1
ORDER BY EMPLOYEE_ID;

--Q9. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME �� M_SALARY(����)�� ����ϼ���. �� ������ �Ҽ��� ��°�ڸ������� ǥ���ϼ���.
--A
SELECT EMPLOYEE_ID, LAST_NAME, ROUND(SALARY/12, 2) "M_SALARY" FROM EMPLOYEES;

--Q10. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �ټӳ���� ����ؼ� �Ʒ������� �߰��� �Ŀ� ����ϼ���.
--2001�� 1�� 1�� â���Ͽ� ����(2020�� 12�� 31��)���� 20�Ⱓ ��ǿ� ȸ��� ������  �ټӳ���� ���� 30 ������� ������  ��޿� ���� 1000���� BONUS�� ����.
--�������� ����.    
--A.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, HIRE_DATE, TRUNC((TO_DATE(20201231)-HIRE_DATE)/365) "W_YEAR", WIDTH_BUCKET(TRUNC((TO_DATE(20201231)-HIRE_DATE)/365), 0, 20, 30)*1000 "BONUS" FROM EMPLOYEES ORDER BY "W_YEAR" DESC;


--Q11. EMPLOYEES ���̺��� commission_pct ��  Null�� ������  ����ϼ���.
--A.
SELECT COUNT(COMMISSION_PCT) FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

--Q12. EMPLOYEES ���̺��� deparment_id �� ���� ������ �����Ͽ�  POSITION�� '����'���� ����ϼ���.
--A.
SELECT LAST_NAME, FIRST_NAME,
CASE
WHEN DEPARTMENT_ID IS NULL THEN '����'
END "POSITION"
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

--Q13. ����� 120���� ����� ���, �̸�, ����(job_id), ������(job_title)�� ���(join~on, where �� �����ϴ� �� ���� ��� ���)
--A.
SELECT E.EMPLOYEE_ID, E.LAST_NAME, J.JOB_ID, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID(+) = J.JOB_ID
ORDER BY E.EMPLOYEE_ID; 

SELECT E.EMPLOYEE_ID, E.LAST_NAME, J.JOB_ID, J.JOB_TITLE
FROM EMPLOYEES E
JOIN JOBS J
ON E.JOB_ID(+) = J.JOB_ID
ORDER BY E.EMPLOYEE_ID;

--Q14.  employees ���̺��� �̸��� FIRST_NAME�� LAST_NAME�� �ٿ��� 'NAME' �÷������� ����ϼ���.
--��) Steven King
--A. 
SELECT FIRST_NAME||' '||LAST_NAME "NAME" FROM EMPLOYEES
ORDER BY "NAME";

--Q15. lmembers purprod ���̺�� ���� �ѱ��ž�, 2014 ���ž�, 2015 ���ž��� �ѹ��� ����ϼ���.
--A.
--SELECT LEMEBERS
SELECT TO_CHAR("2014 ���űݾ�", 'L999,999,999,999') "2014 �ѱ��ž�", TO_CHAR("2015 ���űݾ�", 'L999,999,999,999') "2015 �ѱ��ž�", TO_CHAR("2014 ���űݾ�" + "2015 ���űݾ�", 'L999,999,999,999') "�ѱ��ž�"
FROM 
(SELECT SUM(���űݾ�) "2014 ���űݾ�" FROM PURPROD WHERE YEAR = 2014) a,
(SELECT SUM(���űݾ�) "2015 ���űݾ�" FROM PURPROD WHERE YEAR = 2015) b;

select
(select sum(���űݾ�) from purprod) �ѱ��ž�,
(select sum(���űݾ�) from purprod where year=2014) "2014 ���ž�",
(select sum(���űݾ�) from purprod where year=2015) "2015 ���ž�"
from dual;


--Q16. HR EMPLOYEES ���̺��� escape �ɼ��� ����Ͽ� �Ʒ��� ���� ��µǴ� SQL���� �ۼ��ϼ���.
--job_id Į������  _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����Ͽ� '_A'�� �����ϴ�  ��� ���� ���
--A.
SELECT JOB_ID FROM EMPLOYEES
WHERE JOB_ID LIKE '%\_A%' ESCAPE '\';

--Q17. HR EMPLOYEES ���̺��� SALARY, LAST_NAME ������ �ø����� �����Ͽ� ����ϼ���.
--A. 
SELECT SALARY, LAST_NAME FROM EMPLOYEES
ORDER BY SALARY, LAST_NAME;
   
--Q18. Seo��� ����� �μ����� ����ϼ���.
--A.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME 
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.LAST_NAME = 'Seo';

--Q19. LMEMBERS �����Ϳ��� ���� ���űݾ��� �հ踦 ���� CUSPUR ���̺��� ������ �� CUSTDEMO ���̺�� 
--����ȣ�� �������� �����Ͽ� ����ϼ���.
--A.
CREATE TABLE CUSPUR AS
SELECT ����ȣ, SUM(���űݾ�) "�ѱ��ž�" FROM PURPROD
GROUP BY ����ȣ
ORDER BY ����ȣ;

SELECT D.����ȣ, P.�ѱ��ž�, D.����, D.���ɴ�, D.��������
FROM CUSPUR P, CUSTDEMO D
WHERE P.����ȣ = D.����ȣ;

--Q20.PURPROD ���̺�� ���� �Ʒ� ������ �����ϼ���.
-- 2�Ⱓ ���űݾ��� ���� ������ �и��Ͽ� ����, ���޻纰�� ���ž��� ǥ���ϴ� AMT_14, AMT_15 ���̺� 2���� ���� (��³��� : ����ȣ, ���޻�, SUM(���űݾ�) ���űݾ�)
--AMT14�� AMT15 2�� ���̺��� ����ȣ�� ���޻縦 �������� FULL OUTER JOIN �����Ͽ� ������ AMT_YEAR_FOJ ���̺� ����
--14��� 15���� ���űݾ� ���̸� ǥ���ϴ� ���� �÷��� �߰��Ͽ� ���(��, ����ȣ, ���޻纰�� ���űݾ� �� ������ ���еǾ�� ��)
--A.
CREATE TABLE AMT_14 AS
SELECT ����ȣ, ���޻�, SUM(���űݾ�) "���űݾ�" FROM PURPROD
WHERE YEAR = 2014
GROUP BY ����ȣ, ���޻�
ORDER BY ����ȣ;

CREATE TABLE AMT_15 AS
SELECT ����ȣ, ���޻�, SUM(���űݾ�) "���űݾ�" FROM PURPROD
WHERE YEAR = 2015
GROUP BY ����ȣ, ���޻�
ORDER BY ����ȣ;

--CREATE TABLE AMT_YEAR_FOJ AS
SELECT A14.����ȣ, A14.���޻�, A14.���űݾ� "14��", A15.���űݾ� "15��", ROUND((A15.���űݾ�-A14.���űݾ�)/A15.���űݾ�*100, 2) "������"
FROM AMT_14 A14
FULL OUTER JOIN AMT_15 A15
ON A14.����ȣ = A15.����ȣ AND A14.���޻� = A15.���޻�;

--Q(BONUS). HR ���̺���� �м��ؼ� ��ü ��Ȳ�� ������ �� �ִ� ��� ���̺��� �ۼ��ϼ���. (�� : �μ��� ��� SALARY ����)
--A.
SELECT 