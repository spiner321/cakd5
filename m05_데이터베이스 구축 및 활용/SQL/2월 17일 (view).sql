-- �� ����
CREATE VIEW vw_customer
AS SELECT *
FROM customer
WHERE address LIKE '%���ѹα�%';

-- orders ���̺��� ���̸��� �����̸��� �ٷ� Ȯ���� �� �ִ� �並 �����Ͻÿ�.
CREATE VIEW vw_orders
SELECT *
FROM CUSTOMER, BOOK, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID(+) AND BOOK.BOOKID = ORDERS.BOOKID;

-- '�迬��' ���� ������ ������ �ֹ���ȣ, �����̸�, �ֹ����� ���̽ÿ�.
CREATE VIEW vw_orders(ordrid, custid, name, bookid, bookname, saleprice, orderdate)
AS SELECT o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
FROM orders o, customer c, book b
WHERE o.custid = c.custid AND o.bookid = b.bookid;

SELECT bookid, bookname, saleprice
FROM vw_orders
WHERE name = '�迬��';