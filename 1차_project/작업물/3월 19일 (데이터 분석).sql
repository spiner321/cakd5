-- # ���Ű��� ���� ��ǰ �� �ѱ��ž�
SELECT a.����ȣ, a.����, a.���ɴ�, a.����, a.���з���, a.�з�, b.������, a.��, sum(a.���űݾ�) "�ѱ��ž�"
FROM LCL2 a
JOIN ������ b ON a.����ȣ = b.����ȣ
WHERE ������ = '����'
GROUP BY a.����ȣ, a.����, a.���ɴ�, a.����, a.���з���, a.�з�, b.������, a.��
ORDER BY a.����ȣ, a.����, a.���ɴ�, a.����, a.���з���, a.�з�, b.������, a.��;


-- # ������ ����� ����
SELECT ����, �����1��, �����7�� 
FROM
(SELECT b.����, sum(a.�̿�ݾ�14_1) �����1��, sum(a.�̿�ݾ�15_3) �����7��
FROM ������ a, LCL2 b 
WHERE a.����ȣ = b.����ȣ 
GROUP BY b.����);


-- # �����, ä�� ���� �̿�Ƚ��
--- # ä��
SELECT ����ȣ, SUM(�̿�Ƚ��) FROM CHANNEL
GROUP BY ����ȣ
ORDER BY SUM(�̿�Ƚ��) DESC;

SELECT COUNT(DISTINCT ����ȣ) FROM CHANNEL;

SELECT ����ȣ, COUNT(����ȣ) FROM COMPET
GROUP BY ����ȣ
ORDER BY COUNT(����ȣ) DESC;

--- # �����
SELECT COUNT(COUNT(����ȣ)) FROM COMPET
GROUP BY ����ȣ
ORDER BY COUNT(����ȣ) DESC;

SELECT COUNT(DISTINCT ����ȣ) FROM COMPET;