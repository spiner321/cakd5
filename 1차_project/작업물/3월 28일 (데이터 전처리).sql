select ���޻�, �з�, �ߺз���, �Һз��� from prodcl
where ���޻� = 'C'
group by ���޻�, �з�, �ߺз���, �Һз���
order by �з�, �ߺз���;

alter table prodcl add �ߺз� varchar2(30);

SELECT * FROM PRODCL WHERE ���޻� = 'A'; 
ALTER TABLE PRODCL ADD �ߺз� VARCHAR2(30);
UPDATE PRODCL SEL �ߺз� = '��갡����ǰ' WHERE ���޻� = 'C' �з� = '������ǰ' AND �Һз��� = ANY('��Ÿ����/����������', '�����')
UPDATE PRODCL SEL �ߺз� = '��갡����ǰ' WHERE ���޻� = 'C' �з� = '������ǰ' AND �Һз��� = ANY('���ֿ�������')
UPDATE PRODCL SEL �ߺз� = '�и���' WHERE ���޻� = 'C' �ߺз��� = '�����и���'
UPDATE PRODCL SEL �ߺз� = '�Ｎ/���ǽ�ǰ' WHERE ���޻� = 'C' �ߺз� = '������'
UPDATE PRODCL SEL �ߺз� = '��갡����ǰ' WHERE ���޻� = 'C' �з� = '������ǰ' AND �Һз��� = ANY('')
