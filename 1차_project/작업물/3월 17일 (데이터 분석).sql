-- # ���Ű��� ���� ��ǰ �� �ѱ��ž�
SELECT a.����ȣ, ����, ����, �б�, ���з���, �з�, ������, sum(���űݾ�) "�ѱ��ž�"
FROM LCL a
JOIN ������ b ON a.����ȣ = b.����ȣ
WHERE ������ = '����'
GROUP BY a.����ȣ, ����, ����, �б�, ���з���, �з�, ������
ORDER BY a.����ȣ, ����, �б�, ���з���, �з�;

select * from lcl
where �������� is null;

select * from custdemo
order by ����ȣ;