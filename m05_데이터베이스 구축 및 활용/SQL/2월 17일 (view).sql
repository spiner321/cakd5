-- 뷰 생성
CREATE VIEW vw_customer
AS SELECT *
FROM customer
WHERE address LIKE '%대한민국%';

-- orders 테이블에서 고객이름과 도서이름을 바로 확인할 수 있는 뷰를 생성하시오.
CREATE VIEW vw_orders
SELECT *
FROM CUSTOMER, BOOK, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID(+) AND BOOK.BOOKID = ORDERS.BOOKID;

-- '김연아' 고객이 구입한 도서의 주문번호, 도서이름, 주문액을 보이시오.
CREATE VIEW vw_orders(ordrid, custid, name, bookid, bookname, saleprice, orderdate)
AS SELECT o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
FROM orders o, customer c, book b
WHERE o.custid = c.custid AND o.bookid = b.bookid;

SELECT bookid, bookname, saleprice
FROM vw_orders
WHERE name = '김연아';