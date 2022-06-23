select 제휴사, 분류, 중분류명, 소분류명 from prodcl
where 제휴사 = 'C'
group by 제휴사, 분류, 중분류명, 소분류명
order by 분류, 중분류명;

alter table prodcl add 중분류 varchar2(30);

SELECT * FROM PRODCL WHERE 제휴사 = 'A'; 
ALTER TABLE PRODCL ADD 중분류 VARCHAR2(30);
UPDATE PRODCL SEL 중분류 = '농산가공식품' WHERE 제휴사 = 'C' 분류 = '가공식품' AND 소분류명 = ANY('기타간식/안주형과자', '맛밤류')
UPDATE PRODCL SEL 중분류 = '축산가공식품' WHERE 제휴사 = 'C' 분류 = '가공식품' AND 소분류명 = ANY('안주용육포류')
UPDATE PRODCL SEL 중분류 = '분말류' WHERE 제휴사 = 'C' 중분류명 = '가공분말류'
UPDATE PRODCL SEL 중분류 = '즉석/편의식품' WHERE 제휴사 = 'C' 중분류 = '간편간식'
UPDATE PRODCL SEL 중분류 = '축산가공식품' WHERE 제휴사 = 'C' 분류 = '가공식품' AND 소분류명 = ANY('')
