-- # �б⸦ ����� �ٲ㼭 ���̺� ����
--create table ���
--(
--���� number,
--�б� varchar2(10),
--�� varchar2(10)
--);
--
--insert into ���(����,�б�,��) values(2014,'1�б�','1��');
--insert into ���(����,�б�,��) values(2014,'2�б�','2��');
--insert into ���(����,�б�,��) values(2014,'3�б�','3��');
--insert into ���(����,�б�,��) values(2014,'4�б�','4��');
--insert into ���(����,�б�,��) values(2015,'1�б�','5��');
--insert into ���(����,�б�,��) values(2015,'2�б�','6��');
--insert into ���(����,�б�,��) values(2015,'3�б�','7��');
--insert into ���(����,�б�,��) values(2015,'4�б�','8��');

select a.����ȣ, a.����, a.�б�, b.�� from lcl a
join
��� b on a.���� = b.���� and a.�б� =  b.�б�
where b.�б�='3�б�';


-- # CUSTDEMO�� ���������� �߰�
--ALTER TABLE CUSTDEMO ADD ���� VARCHAR2(10); 
--UPDATE CUSTDEMO SET ���� ='����' WHERE �������� BETWEEN 010 AND 099;
--UPDATE CUSTDEMO SET ���� ='���' WHERE �������� BETWEEN 100 AND 209;
--UPDATE CUSTDEMO SET ���� ='��õ' WHERE �������� BETWEEN 210 AND 239;
--UPDATE CUSTDEMO SET ���� ='����' WHERE �������� BETWEEN 240 AND 269;
--UPDATE CUSTDEMO SET ���� ='���' WHERE �������� BETWEEN 270 AND 299;
--UPDATE CUSTDEMO SET ���� ='����' WHERE �������� BETWEEN 300 AND 309;
--UPDATE CUSTDEMO SET ���� ='�泲' WHERE �������� BETWEEN 310 AND 339;
--UPDATE CUSTDEMO SET ���� ='����' WHERE �������� BETWEEN 340 AND 359;
--UPDATE CUSTDEMO SET ���� ='���' WHERE �������� BETWEEN 360 AND 409;
--UPDATE CUSTDEMO SET ���� ='�뱸' WHERE �������� BETWEEN 410 AND 439;
--UPDATE CUSTDEMO SET ���� ='���' WHERE �������� BETWEEN 440 AND 459;
--UPDATE CUSTDEMO SET ���� ='�λ�' WHERE �������� BETWEEN 460 AND 499;
--UPDATE CUSTDEMO SET ���� ='�泲' WHERE �������� BETWEEN 500 AND 539;
--UPDATE CUSTDEMO SET ���� ='����' WHERE �������� BETWEEN 540 AND 569;
--UPDATE CUSTDEMO SET ���� ='����' WHERE �������� BETWEEN 570 AND 609;
--UPDATE CUSTDEMO SET ���� ='����' WHERE �������� BETWEEN 610 AND 629;
--UPDATE CUSTDEMO SET ���� ='����' WHERE �������� BETWEEN 630 AND 639;


-- # ���Ű��� ���� ��ǰ �� �ѱ��ž�
SELECT a.����ȣ, a.����, a.���ɴ�, d.����, a.���з���, a.�з�, b.������, c.��, sum(a.���űݾ�) "�ѱ��ž�"
FROM LCL a
JOIN ������ b ON a.����ȣ = b.����ȣ
JOIN ��� c ON a.���� = c.���� AND a.�б� = c.�б�
JOIN CUSTDEMO d ON a.����ȣ = d.����ȣ AND a.���� = d.���� AND a.���ɴ� = d.���ɴ� AND a.�������� = d.��������
WHERE ������ = '����'
GROUP BY a.����ȣ, a.����, a.���ɴ�, d.����, a.���з���, a.�з�, b.������, c.��
ORDER BY a.����ȣ, a.����, a.���ɴ�, d.����, a.���з���, a.�з�, b.������, c.��;