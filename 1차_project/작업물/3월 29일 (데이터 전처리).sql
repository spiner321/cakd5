-- # ī�װ� ��, ��, �Ϸ� �ٽ� ������
--- # �з���� �÷� �߰�
--alter table lcl2 add �з���� varchar2(50);

--- # ������ǰ
update lcl2 set �з���� = '������ǰ_��' 
where �з� = '������ǰ' and �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '������ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 9206);
update lcl2 set �з���� = '������ǰ_��' 
where  �з� = '������ǰ' and �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '������ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 9206 and (sum(���űݾ�)/count(���űݾ�)) >= 3288);
update lcl2 set �з���� = '������ǰ_��' 
where  �з� = '������ǰ' and �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '������ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 3288);

--- # �ż���ǰ
update lcl2 set �з���� = '�ż���ǰ_��' 
where �з� = '�ż���ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�ż���ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 25467);
update lcl2 set �з���� = '�ż���ǰ_��' 
where �з� = '�ż���ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�ż���ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 25467 and (sum(���űݾ�)/count(���űݾ�)) >= 4244);
update lcl2 set �з���� = '�ż���ǰ_��' 
where �з� = '�ż���ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�ż���ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 4244);

--- # �ϻ��ǰ
update lcl2 set �з���� = '�ϻ��ǰ_��' 
where �з� = '�ϻ��ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�ϻ��ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 68178);
update lcl2 set �з���� = '�ϻ��ǰ_��' 
where �з� = '�ϻ��ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�ϻ��ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 68178 and (sum(���űݾ�)/count(���űݾ�)) >= 11363);
update lcl2 set �з���� = '�ϻ��ǰ_��' 
where �з� = '�ϻ��ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�ϻ��ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 11363);

--- # �Ǿ�ǰ/�Ƿ���
update lcl2 set �з���� = '�Ǿ�ǰ/�Ƿ���_��' 
where �з� = '�Ǿ�ǰ/�Ƿ���' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�Ǿ�ǰ/�Ƿ���' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 26727);
update lcl2 set �з���� = '�Ǿ�ǰ/�Ƿ���_��' 
where �з� = '�Ǿ�ǰ/�Ƿ���' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�Ǿ�ǰ/�Ƿ���' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 26727 and (sum(���űݾ�)/count(���űݾ�)) >= 4454);
update lcl2 set �з���� = '�Ǿ�ǰ/�Ƿ���_��' 
where �з� = '�Ǿ�ǰ/�Ƿ���' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�Ǿ�ǰ/�Ƿ���' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 4454);

--- # ����/��ȭ��ǰ
update lcl2 set �з���� = '����/��ȭ��ǰ_��' 
where �з� = '����/��ȭ��ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '����/��ȭ��ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 33309);
update lcl2 set �з���� = '����/��ȭ��ǰ_��' 
where �з� = '����/��ȭ��ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '����/��ȭ��ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 33309 and (sum(���űݾ�)/count(���űݾ�)) >= 5551);
update lcl2 set �з���� = '����/��ȭ��ǰ_��' 
where �з� = '����/��ȭ��ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '����/��ȭ��ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 5551);

--- # �ܽ�
update lcl2 set �з���� = '�ܽ�_��' 
where �з� = '�ܽ�' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�ܽ�' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 43203);
update lcl2 set �з���� = '�ܽ�_��' 
where �з� = '�ܽ�' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�ܽ�' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 43203 and (sum(���űݾ�)/count(���űݾ�)) >= 7200);
update lcl2 set �з���� = '�ܽ�_��' 
where �з� = '�ܽ�' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�ܽ�' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 7200);

--- # ������/����
update lcl2 set �з���� = '������/����_��' 
where �з� = '������/����' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '������/����' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 1281333);
update lcl2 set �з���� = '������/����_��' 
where �з� = '������/����' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '������/����' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 1281333 and (sum(���űݾ�)/count(���űݾ�)) >= 213555);
update lcl2 set �з���� = '������/����_��' 
where �з� = '������/����' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '������/����' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 213555);

-- # ����/���׸���
update lcl2 set �з���� = '����/���׸���_��' 
where �з� = '����/���׸���' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '����/���׸���' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 463578);
update lcl2 set �з���� = '����/���׸���_��' 
where �з� = '����/���׸���' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '����/���׸���' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 463578 and (sum(���űݾ�)/count(���űݾ�)) >= 77263);
update lcl2 set �з���� = '����/���׸���_��' 
where �з� = '����/���׸���' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '����/���׸���' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 77263);

-- # �Ƿ�
update lcl2 set �з���� = '�Ƿ�_��'
where �з� = '�Ƿ�' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�Ƿ�' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 532005 );
update lcl2 set �з���� = '�Ƿ�_��' 
where �з� = '�Ƿ�' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�Ƿ�' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 532005  and (sum(���űݾ�)/count(���űݾ�)) >= 88667);
update lcl2 set �з���� = '�Ƿ�_��' 
where �з� = '�Ƿ�' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�Ƿ�' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) < 88667);

-- # ����������/����
update lcl2 set �з���� = '����������/����_��' 
where �з� = '����������/����' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '����������/����' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 200634);
update lcl2 set �з���� = '����������/����_��' 
where �з� = '����������/����' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '����������/����' group by �з�, �Һз��� 
having (sum(���űݾ�)/count(���űݾ�)) < 200634  and (sum(���űݾ�)/count(���űݾ�)) >= 33439 );
update lcl2 set �з���� = '����������/����_��' 
where �з� = '����������/����' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '����������/����' group by �з�, �Һз��� 
having (sum(���űݾ�)/count(���űݾ�)) < 33439);

-- # �м���ȭ
update lcl2 set �з���� = '�м���ȭ_��' 
where �з� = '�м���ȭ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�м���ȭ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 327927);
update lcl2 set �з���� = '�м���ȭ_��' 
where �з� = '�м���ȭ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�м���ȭ' group by �з�, �Һз��� 
having (sum(���űݾ�)/count(���űݾ�)) < 327927  and (sum(���űݾ�)/count(���űݾ�)) >= 54654);
update lcl2 set �з���� = '�м���ȭ_��' 
where �з� = '�м���ȭ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '�м���ȭ' group by �з�, �Һз��� 
having (sum(���űݾ�)/count(���űݾ�)) < 54654);

--- # ���Ƶ�
update lcl2 set �з���� = '���Ƶ�_��' 
where �з� = '���Ƶ�' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '���Ƶ�' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 162075);
update lcl2 set �з���� = '���Ƶ�_��' 
where �з� = '���Ƶ�' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '���Ƶ�' group by �з�, �Һз��� 
having (sum(���űݾ�)/count(���űݾ�)) < 162075 and (sum(���űݾ�)/count(���űݾ�)) >= 27012);
update lcl2 set �з���� = '���Ƶ�_��' 
where �з� = '���Ƶ�' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '���Ƶ�' group by �з�, �Һз��� 
having (sum(���űݾ�)/count(���űݾ�)) < 27012);

--- # ��ǰ
update lcl2 set �з���� = '��ǰ_��' 
where �з� = '��ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '��ǰ' group by �з�, �Һз��� having (sum(���űݾ�)/count(���űݾ�)) >= 2828724);
update lcl2 set �з���� = '��ǰ_��' 
where �з� = '��ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '��ǰ' group by �з�, �Һз��� 
having (sum(���űݾ�)/count(���űݾ�)) < 2828724  and (sum(���űݾ�)/count(���űݾ�)) >= 471454 );
update lcl2 set �з���� = '��ǰ_��' 
where �з� = '��ǰ' AND �Һз��� =
any(select �Һз��� from lcl2 
where �з� = '��ǰ' group by �з�, �Һз��� 
having (sum(���űݾ�)/count(���űݾ�)) < 471454);