-- # ���̽� ����

DESC sample1;
SELECT * FROM sample1;
SELECT * FROM sample2;
DESC sample3;
SELECT * FROM sample3
order by TO_NUMBER(id);

SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

SELECT YEAR, c.����ȣ, SUM(���űݾ�) �Ѹ����, ROUND(AVG(���űݾ�)) "��ձ��ž�"
FROM purprod p, custdemo c 
WHERE p.����ȣ = c.����ȣ
GROUP BY year, c.����ȣ
ORDER BY c.����ȣ;