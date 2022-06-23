-- # 분기를 기수로 바꿔서 테이블 생성
--create table 기기
--(
--연도 number,
--분기 varchar2(10),
--기 varchar2(10)
--);
--
--insert into 기기(연도,분기,기) values(2014,'1분기','1기');
--insert into 기기(연도,분기,기) values(2014,'2분기','2기');
--insert into 기기(연도,분기,기) values(2014,'3분기','3기');
--insert into 기기(연도,분기,기) values(2014,'4분기','4기');
--insert into 기기(연도,분기,기) values(2015,'1분기','5기');
--insert into 기기(연도,분기,기) values(2015,'2분기','6기');
--insert into 기기(연도,분기,기) values(2015,'3분기','7기');
--insert into 기기(연도,분기,기) values(2015,'4분기','8기');

select a.고객번호, a.연도, a.분기, b.기 from lcl a
join
기기 b on a.연도 = b.연도 and a.분기 =  b.분기
where b.분기='3분기';


-- # CUSTDEMO에 거주지역명 추가
--ALTER TABLE CUSTDEMO ADD 지역 VARCHAR2(10); 
--UPDATE CUSTDEMO SET 지역 ='서울' WHERE 거주지역 BETWEEN 010 AND 099;
--UPDATE CUSTDEMO SET 지역 ='경기' WHERE 거주지역 BETWEEN 100 AND 209;
--UPDATE CUSTDEMO SET 지역 ='인천' WHERE 거주지역 BETWEEN 210 AND 239;
--UPDATE CUSTDEMO SET 지역 ='강원' WHERE 거주지역 BETWEEN 240 AND 269;
--UPDATE CUSTDEMO SET 지역 ='충북' WHERE 거주지역 BETWEEN 270 AND 299;
--UPDATE CUSTDEMO SET 지역 ='세종' WHERE 거주지역 BETWEEN 300 AND 309;
--UPDATE CUSTDEMO SET 지역 ='충남' WHERE 거주지역 BETWEEN 310 AND 339;
--UPDATE CUSTDEMO SET 지역 ='대전' WHERE 거주지역 BETWEEN 340 AND 359;
--UPDATE CUSTDEMO SET 지역 ='경북' WHERE 거주지역 BETWEEN 360 AND 409;
--UPDATE CUSTDEMO SET 지역 ='대구' WHERE 거주지역 BETWEEN 410 AND 439;
--UPDATE CUSTDEMO SET 지역 ='울산' WHERE 거주지역 BETWEEN 440 AND 459;
--UPDATE CUSTDEMO SET 지역 ='부산' WHERE 거주지역 BETWEEN 460 AND 499;
--UPDATE CUSTDEMO SET 지역 ='경남' WHERE 거주지역 BETWEEN 500 AND 539;
--UPDATE CUSTDEMO SET 지역 ='전북' WHERE 거주지역 BETWEEN 540 AND 569;
--UPDATE CUSTDEMO SET 지역 ='전남' WHERE 거주지역 BETWEEN 570 AND 609;
--UPDATE CUSTDEMO SET 지역 ='광주' WHERE 거주지역 BETWEEN 610 AND 629;
--UPDATE CUSTDEMO SET 지역 ='제주' WHERE 거주지역 BETWEEN 630 AND 639;


-- # 구매감소 고객의 상품 별 총구매액
SELECT a.고객번호, a.성별, a.연령대, d.지역, a.세분류명, a.분류, b.고객구분, c.기, sum(a.구매금액) "총구매액"
FROM LCL a
JOIN 증감고객 b ON a.고객번호 = b.고객번호
JOIN 기기 c ON a.연도 = c.연도 AND a.분기 = c.분기
JOIN CUSTDEMO d ON a.고객번호 = d.고객번호 AND a.성별 = d.성별 AND a.연령대 = d.연령대 AND a.거주지역 = d.거주지역
WHERE 고객구분 = '감소'
GROUP BY a.고객번호, a.성별, a.연령대, d.지역, a.세분류명, a.분류, b.고객구분, c.기
ORDER BY a.고객번호, a.성별, a.연령대, d.지역, a.세분류명, a.분류, b.고객구분, c.기;