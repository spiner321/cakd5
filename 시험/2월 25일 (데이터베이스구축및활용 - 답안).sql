������ ��� AI ���� �ַ�� ������ ��������

������� : �����ͺ��̽� ���� �� Ȱ��

- ���� : 22.02.25
- ���� :
- ���� :

�� HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)�� Ȱ���Ͽ� ���� �������� �����ϼ���.
--Q1. HR EMPLOYEES ���̺��� �̸�, ����, 10% �λ�� ������ ����ϼ���.
--A.
SELECT FIRST_NAME, SALARY, SALARY*1.1 UPSALARY FROM EMPLOYEES;
    
--Q2.  2005�� ��ݱ⿡ �Ի��� ����鸸 ���	
--A.        
SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/06/30';  

--Q3. ���� SA_MAN, IT_PROG, ST_MAN �� ����� ���
--A.
SELECT * FROM EMPLOYEES WHERE JOB_ID IN('SA_MAN','IT_PROG','ST_MAN');
   
--Q4. manager_id �� 101���� 103�� ����� ���
--A.   	
select * from employees where manager_id between 101 and 103;

--Q5. EMPLOYEES ���̺��� LAST_NAME, HIRE_DATE �� �Ի����� 6���� �� ù ��° �������� ����ϼ���.
--A.
select last_name, hire_date, next_day( add_months( hire_date, 6 ), '��' ) "TARGET" from employees;

--Q6. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �����ϱ����� W_MONTH(�ټӿ���)�� ������ ����ؼ� ����ϼ���.(�ټӿ��� ���� ��������)
--A.
select employee_id, last_name, salary, hire_date, 
trunc((months_between(sysdate, hire_date))) 
w_month from employees order by w_month desc;

--Q7. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� W_YEAR(�ټӳ��)�� ����ؼ� ����ϼ���.(�ټӳ�� ���� ��������)
--A.
select employee_id, last_name, salary, hire_date,  
trunc( ( sysdate - hire_date ) / 365 ) w_year 
from employees order by w_year desc; 

--Q8. EMPLOYEE_ID�� Ȧ���� ������ EMPLPYEE_ID�� LAST_NAME�� ����ϼ���.
--A. 
select employee_id, last_name from employees where mod( employee_id, 2 )= 1;

--Q9. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME �� M_SALARY(����)�� ����ϼ���. �� ������ �Ҽ��� ��°�ڸ������� ǥ���ϼ���.
--A
select employee_id, last_name, round( salary/12, 2 ) m_salary from employees;  

--Q10. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �ټӳ���� ����ؼ� �Ʒ������� �߰��� �Ŀ� ����ϼ���.
--2001�� 1�� 1�� â���Ͽ� ������� 20�Ⱓ ��ǿ� ȸ��� ������  �ټӳ���� ���� 30 ������� ������  ��޿� ���� 1000���� BONUS�� ����.
--�������� ����.    
--A.
select employee_id, last_name, salary, hire_date,
trunc( ( ( to_date('20/12/31') - hire_date ) / 365)) �ټӿ���,
(width_bucket( trunc( ( to_date('20/12/31') - hire_date ) / 365),0,20,30)) wb,
(width_bucket( trunc( ( to_date('20/12/31') - hire_date ) / 365),0,20,30))  * 1000 bonus
from employees
order by bonus desc;  

--20�� ���ʽ� ��� �����
select employee_id, last_name, salary, hire_date, trunc( ( sysdate - hire_date ) / 365) �ټӿ���,
trunc(( sysdate - hire_date ) / 365) ���,(width_bucket( trunc( ( sysdate - hire_date ) / 365),0,22,20)) wb,
(width_bucket( trunc( ( sysdate - hire_date ) / 365),0,22,20))  * 1000 bonus_wb,
trunc(( sysdate - hire_date ) / 365) * 1000 bonus_���
from employees order by bonus_wb desc;



--Q11. EMPLOYEES ���̺��� commission_pct ��  Null�� ������  ����ϼ���.
--A.
SELECT count(*) FROM employees
WHERE commission_pct is null;

--Q12. EMPLOYEES ���̺��� deparment_id �� ���� ������ �����Ͽ�  POSITION�� '����'���� ����ϼ���.
--A.
select last_name, department_id, nvl(to_char(department_id),'����') position
from employees where department_id is null;


--Q13. ����� 120���� ����� ���, �̸�, ����(job_id), ������(job_title)�� ���(join~on, where �� �����ϴ� �� ���� ��� ���)
--A.
select e.employee_id, e.last_name, j.job_id, j.job_title from employees e
join jobs j on e.job_id=j.job_id where employee_id=120;

select  e.employee_id, e.last_name, j.job_id, j. job_title from employees e, jobs j
where e.job_id=j.job_id and employee_id = 120;

--Q14.  employees ���̺��� �̸��� FIRST_NAME�� LAST_NAME�� �ٿ��� 'NAME' �÷������� ����ϼ���.
--��) Steven King
--A. 
SELECT FIRST_NAME || ' ' || LAST_NAME NAME FROM EMPLOYEES;

--Q15. lmembers purprod ���̺�� ���� �ѱ��ž�, 2014 ���ž�, 2015 ���ž��� �ѹ��� ����ϼ���.
select (select sum(p1.���űݾ�) from purprod p1)  as amt,
(select sum(p2.���űݾ�) from purprod p2 where p2.�������� <20150101) as amt_2014,
(select sum(p3.���űݾ�) from purprod p3 where p3.�������� >20141231) as amt_2015
from dual;

--Q16. HR EMPLOYEES ���̺��� escape �ɼ��� ����Ͽ� �Ʒ��� ���� ��µǴ� SQL���� �ۼ��ϼ���.
--job_id Į������  _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����Ͽ� '_A'�� �����ϴ�  ��� ���� ���
--A.
-- _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����ϰ� ���� �� escape �ɼ��� ����Ѵ�. \������ ��('_')�� Ư�����ڷ� ���͸�
select * from employees where job_id like '%\_A%' escape '\';

--Q17. HR EMPLOYEES ���̺��� SALARY, LAST_NAME ������ �ø����� �����Ͽ� ����ϼ���.
--A. 
select SALARY, LAST_NAME from employees order by salary asc, last_name asc;

   
--Q18. Seo��� ����� �μ����� ����ϼ���.
--A.
select department_name from departments 
where department_id=(select department_id from employees where last_name='Seo');     

--Q19. LMEMBERS �����Ϳ��� ���� ���űݾ��� �հ踦 ���� CUSPUR ���̺��� ������ �� CUSTDEMO ���̺�� 
--����ȣ�� �������� �����Ͽ� ����ϼ���.
CREATE TABLE CUSPUR
AS SELECT ����ȣ, SUM(���űݾ�) ���űݾ�
FROM PURPROD
GROUP BY ����ȣ
ORDER BY ����ȣ;
SELECT * FROM CUSPUR;


--CUST�� CUSPUR ����ȣ ���� ����
SELECT C.*, CP.���űݾ�
FROM CUSTDEMO C, CUSPUR CP
WHERE C.����ȣ = CP.����ȣ;

--Q20.PURPROD ���̺�� ���� �Ʒ� ������ �����ϼ���.
-- 2�Ⱓ ���űݾ��� ���� ������ �и��Ͽ� ����, ���޻纰�� ���ž��� ǥ���ϴ� AMT_14, AMT_15 ���̺� 2���� ���� (��³��� : ����ȣ, ���޻�, SUM(���űݾ�) ���űݾ�)
--AMT14�� AMT15 2�� ���̺��� ����ȣ�� ���޻縦 �������� FULL OUTER JOIN �����Ͽ� ������ AMT_YEAR_FOJ ���̺� ����
--14��� 15���� ���űݾ� ���̸� ǥ���ϴ� ���� �÷��� �߰��Ͽ� ���(��, ����ȣ, ���޻纰�� ���űݾ� �� ������ ���еǾ�� ��)

SELECT * FROM PURPROD
WHERE YEAR <2015;
DESC PURPROD;

CREATE TABLE AMT14
AS SELECT ����ȣ, ���޻�, SUM(���űݾ�) ���űݾ� 
FROM PURPROD
WHERE �������� < 20150101
GROUP BY ����ȣ, ���޻�
ORDER BY ����ȣ;

select * from amt14;

CREATE TABLE AMT15
AS SELECT ����ȣ, ���޻�, SUM(���űݾ�) ���űݾ� 
FROM PURPROD
WHERE �������� > 20141231
GROUP BY ����ȣ, ���޻�
ORDER BY ����ȣ;

select * from amt15;

--FULL OUTER JOIN ���̺� ����
CREATE TABLE AMT_YEAR_FOJ
AS SELECT A4.����ȣ, A4.���޻�, A4.���űݾ� ����14, A5.���űݾ� ����15
FROM AMT14 A4 FULL OUTER JOIN AMT15 A5
ON (A4.����ȣ=A5.����ȣ AND A4.���޻�=A5.���޻�);

--FULL OUTER JOIN ����� ���� ���
SELECT ����ȣ,���޻�, NVL(����14,0) ����14, NVL(����15,0) ����15,
(NVL(����15,0)-NVL(����14,0)) ����
FROM AMT_YEAR_FOJ A;

DROP TABLE amt14;
DROP TABLE amt15;
DROP TABLE AMT_YEAR_FOJ;

--Q(BONUS). HR ���̺���� �м��ؼ� ��ü ��Ȳ�� ������ �� �ִ� ��� ���̺��� �ۼ��ϼ���. (�� : �μ��� ��� SALARY ����)
--A.
�μ��� ��� SALARY ����
SELECT d.DEPARTMENT_NAME, ROUND(AVG(e.SALARY)) AVG
FROM DEPARTMENTS d, EMPLOYEES e
WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME
ORDER BY AVG DESC;