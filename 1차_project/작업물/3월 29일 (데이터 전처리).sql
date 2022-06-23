-- # 카테고리 상, 중, 하로 다시 나누기
--- # 분류등급 컬럼 추가
--alter table lcl2 add 분류등급 varchar2(50);

--- # 가공식품
update lcl2 set 분류등급 = '가공식품_상' 
where 분류 = '가공식품' and 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '가공식품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 9206);
update lcl2 set 분류등급 = '가공식품_중' 
where  분류 = '가공식품' and 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '가공식품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 9206 and (sum(구매금액)/count(구매금액)) >= 3288);
update lcl2 set 분류등급 = '가공식품_하' 
where  분류 = '가공식품' and 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '가공식품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 3288);

--- # 신선식품
update lcl2 set 분류등급 = '신선식품_상' 
where 분류 = '신선식품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '신선식품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 25467);
update lcl2 set 분류등급 = '신선식품_중' 
where 분류 = '신선식품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '신선식품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 25467 and (sum(구매금액)/count(구매금액)) >= 4244);
update lcl2 set 분류등급 = '신선식품_하' 
where 분류 = '신선식품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '신선식품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 4244);

--- # 일상용품
update lcl2 set 분류등급 = '일상용품_상' 
where 분류 = '일상용품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '일상용품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 68178);
update lcl2 set 분류등급 = '일상용품_중' 
where 분류 = '일상용품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '일상용품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 68178 and (sum(구매금액)/count(구매금액)) >= 11363);
update lcl2 set 분류등급 = '일상용품_하' 
where 분류 = '일상용품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '일상용품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 11363);

--- # 의약품/의료기기
update lcl2 set 분류등급 = '의약품/의료기기_상' 
where 분류 = '의약품/의료기기' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '의약품/의료기기' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 26727);
update lcl2 set 분류등급 = '의약품/의료기기_중' 
where 분류 = '의약품/의료기기' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '의약품/의료기기' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 26727 and (sum(구매금액)/count(구매금액)) >= 4454);
update lcl2 set 분류등급 = '의약품/의료기기_하' 
where 분류 = '의약품/의료기기' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '의약품/의료기기' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 4454);

--- # 교육/문화용품
update lcl2 set 분류등급 = '교육/문화용품_상' 
where 분류 = '교육/문화용품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '교육/문화용품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 33309);
update lcl2 set 분류등급 = '교육/문화용품_중' 
where 분류 = '교육/문화용품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '교육/문화용품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 33309 and (sum(구매금액)/count(구매금액)) >= 5551);
update lcl2 set 분류등급 = '교육/문화용품_하' 
where 분류 = '교육/문화용품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '교육/문화용품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 5551);

--- # 외식
update lcl2 set 분류등급 = '외식_상' 
where 분류 = '외식' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '외식' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 43203);
update lcl2 set 분류등급 = '외식_중' 
where 분류 = '외식' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '외식' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 43203 and (sum(구매금액)/count(구매금액)) >= 7200);
update lcl2 set 분류등급 = '외식_하' 
where 분류 = '외식' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '외식' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 7200);

--- # 디지털/가전
update lcl2 set 분류등급 = '디지털/가전_상' 
where 분류 = '디지털/가전' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '디지털/가전' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 1281333);
update lcl2 set 분류등급 = '디지털/가전_중' 
where 분류 = '디지털/가전' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '디지털/가전' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 1281333 and (sum(구매금액)/count(구매금액)) >= 213555);
update lcl2 set 분류등급 = '디지털/가전_하' 
where 분류 = '디지털/가전' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '디지털/가전' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 213555);

-- # 가구/인테리어
update lcl2 set 분류등급 = '가구/인테리어_상' 
where 분류 = '가구/인테리어' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '가구/인테리어' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 463578);
update lcl2 set 분류등급 = '가구/인테리어_중' 
where 분류 = '가구/인테리어' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '가구/인테리어' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 463578 and (sum(구매금액)/count(구매금액)) >= 77263);
update lcl2 set 분류등급 = '가구/인테리어_하' 
where 분류 = '가구/인테리어' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '가구/인테리어' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 77263);

-- # 의류
update lcl2 set 분류등급 = '의류_상'
where 분류 = '의류' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '의류' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 532005 );
update lcl2 set 분류등급 = '의류_중' 
where 분류 = '의류' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '의류' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 532005  and (sum(구매금액)/count(구매금액)) >= 88667);
update lcl2 set 분류등급 = '의류_하' 
where 분류 = '의류' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '의류' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) < 88667);

-- # 전문스포츠/레저
update lcl2 set 분류등급 = '전문스포츠/레저_상' 
where 분류 = '전문스포츠/레저' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '전문스포츠/레저' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 200634);
update lcl2 set 분류등급 = '전문스포츠/레저_중' 
where 분류 = '전문스포츠/레저' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '전문스포츠/레저' group by 분류, 소분류명 
having (sum(구매금액)/count(구매금액)) < 200634  and (sum(구매금액)/count(구매금액)) >= 33439 );
update lcl2 set 분류등급 = '전문스포츠/레저_하' 
where 분류 = '전문스포츠/레저' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '전문스포츠/레저' group by 분류, 소분류명 
having (sum(구매금액)/count(구매금액)) < 33439);

-- # 패션잡화
update lcl2 set 분류등급 = '패션잡화_상' 
where 분류 = '패션잡화' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '패션잡화' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 327927);
update lcl2 set 분류등급 = '패션잡화_중' 
where 분류 = '패션잡화' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '패션잡화' group by 분류, 소분류명 
having (sum(구매금액)/count(구매금액)) < 327927  and (sum(구매금액)/count(구매금액)) >= 54654);
update lcl2 set 분류등급 = '패션잡화_하' 
where 분류 = '패션잡화' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '패션잡화' group by 분류, 소분류명 
having (sum(구매금액)/count(구매금액)) < 54654);

--- # 유아동
update lcl2 set 분류등급 = '유아동_상' 
where 분류 = '유아동' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '유아동' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 162075);
update lcl2 set 분류등급 = '유아동_중' 
where 분류 = '유아동' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '유아동' group by 분류, 소분류명 
having (sum(구매금액)/count(구매금액)) < 162075 and (sum(구매금액)/count(구매금액)) >= 27012);
update lcl2 set 분류등급 = '유아동_하' 
where 분류 = '유아동' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '유아동' group by 분류, 소분류명 
having (sum(구매금액)/count(구매금액)) < 27012);

--- # 명품
update lcl2 set 분류등급 = '명품_상' 
where 분류 = '명품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '명품' group by 분류, 소분류명 having (sum(구매금액)/count(구매금액)) >= 2828724);
update lcl2 set 분류등급 = '명품_중' 
where 분류 = '명품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '명품' group by 분류, 소분류명 
having (sum(구매금액)/count(구매금액)) < 2828724  and (sum(구매금액)/count(구매금액)) >= 471454 );
update lcl2 set 분류등급 = '명품_하' 
where 분류 = '명품' AND 소분류명 =
any(select 소분류명 from lcl2 
where 분류 = '명품' group by 분류, 소분류명 
having (sum(구매금액)/count(구매금액)) < 471454);