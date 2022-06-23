SELECT COUNT(DISTINCT 제품코드) FROM production_recipe;

SELECT COUNT(제품코드) FROM production_re;

-- SELECT a.custid, a.prodname
-- FROM
-- `2020_raw` a,
-- `;
-- 

SELECT DISTINCT a.*, b.*
FROM `2020` a
left JOIN
(SELECT distinct custid, region FROM `2021`) b
ON a.custid = b.custid;



SELECT distinct custid, region FROM `2021`;




SELECT 제품코드, 제품명, 지역  FROM production_re
WHERE `지역` = '울산' AND 제품명 = 'pema-hr1500'
order BY 제품명, 지역;

SELECT custid, prodname, region FROM 2021_raw
WHERE region = '울산' and prodname = 'PEMA-HR1500'
order BY custid, prodname;





SELECT b.제품코드, b.`제품명`, b.`지역`, a.custid, a.material_name, a.input_rate
FROM `2020` a
JOIN
	(SELECT distinct a.`제품코드`, a.`제품명`, a.`지역`, b.region, b.custid FROM production_re a
	LEFT OUTER JOIN 2021_raw b
	ON a.`제품명` = b.prodname AND a.`지역` = b.`region`) b
ON a.custid = b.CUSTID AND a.prodname = b.제품명
order BY b.`제품명`, b.`지역`, a.custid;




SELECT distinct a.제품명, a.제품코드, b.원자재명, b.투입지시비율, a.지역  FROM production_re a
-- WHERE 제품코드 = 'PEMA033101400';
JOIN production_recipe b
ON a.`제품코드` = b.`제품코드`
WHERE 제품명 = 'PEMA-580FX' AND (투입지시비율 = 9 OR 투입지시비율 = 91 OR 투입지시비율 = 0)
order BY 제품코드;

SELECT distinct custid, prodname, region FROM 2021_raw
WHERE prodname = 'PEMA-580FX'
order BY region;





SELECT distinct prodname, material_name, input_rate FROM `2020`
WHERE prodname = 'PEMA-580FX';