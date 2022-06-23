-- 2월 간 수주를 받은 거래처
SELECT DISTINCT 거래처코드 FROM contract
WHERE 수주일자 BETWEEN '2021-02-22' AND '2021-02-28';