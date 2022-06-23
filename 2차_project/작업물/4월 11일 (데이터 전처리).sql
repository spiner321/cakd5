SELECT custid, prodname FROM `2020_raw`
GROUP BY custid, prodname
order BY custid;

-- # 거래처, 제품코드 매칭
SELECT a.custid, b.거래처명, a.prodname, a.region
FROM
(SELECT a.custid, a.prodname, b.region FROM `2020_raw` a
LEFT OUTER JOIN `2021_raw` b
ON a.CUSTID = b.custid AND a.prodname = b.prodname
GROUP BY a.custid, a.prodname, b.region
order BY custid) a
LEFT OUTER JOIN `client` b
ON a.custid = b.거래처코드;




SELECT a.custid, a.prodname, b.region FROM `2020_raw` a
LEFT OUTER JOIN `2021_raw` b
ON a.CUSTID = b.custid AND a.prodname = b.prodname
GROUP BY a.custid, a.prodname, b.region
order BY a.custid;


SELECT * FROM
(SELECT custid, region FROM `2021_raw`
GROUP BY custid, region
order BY custid);







LEFT OUTER JOIN `client` c
ON a.CUSTID = c.`거래처코드`
LEFT OUTER JOIN product_lot d
ON a.PRODNAME = d.제품명
LEFT OUTER JOIN `contract` e
ON a.PRODNAME = e.`제품명`;