-- # ������ ���� ���� ����
SELECT ����ȣ, ����, ����, CAT���ɴ�, ���޻�, ���з���, �з�, �з����, ��, ��, �ð�, ���űݾ� "�ѱ��ž�", ����
FROM
(SELECT a.*, CAT���ɴ�, ���� FROM LCL2 a
JOIN CAT���ɴ� b on a.���ɴ� = b.���ɴ�
JOIN ������ c on a.����ȣ = c.����ȣ);

SELECT ����, sum(���űݾ�)
FROM
(SELECT a.*, CAT���ɴ�, ���� FROM LCL2 a
JOIN CAT���ɴ� b on a.���ɴ� = b.���ɴ�
JOIN ������ c on a.����ȣ = c.����ȣ)
where ���� = 2
group by ����;