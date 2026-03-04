-----------------------------------------------------------------
-- 테이블추가
SELECT * FROM BOOK;
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;

-- 1. 구매자 이름, 책 이름, 구매일 출력
SELECT C.NAME, BOOKNAME, ORDERDATE
FROM CUSTOMER C
INNER JOIN ORDERS O ON C.CUSTID = O.CUSTID
INNER JOIN BOOK B ON O.BOOKID = B.BOOKID;

-----------------------------------------------------------------
SELECT 
    BOOKNAME, PUBLISHER
FROM BOOK
WHERE PRICE >= 10000
UNION
SELECT 
    BOOKNAME, PUBLISHER
FROM BOOK
WHERE PUBLISHER = '굿스포츠'
ORDER BY BOOKNAME;

-- 날짜별 수익 / 날짜와 해당 시기의 판매 가격 출력
-- 날짜는 문자열로 변환 TO_CHAR(ORDERDATE, 'YYYY-MM-DD')
-- SUM_PRICE 열 안보이게 하려면 쿼리 전체를 서브쿼리로 넣기
SELECT 날짜, SUM_PRICE
FROM (
SELECT 
    TO_CHAR(ORDERDATE, 'YYYY/MM/DD') AS 날짜,
    SUM(SALEPRICE) AS SUM_PRICE,
    1 AS ORDERKEY
FROM ORDERS
GROUP BY ORDERDATE
UNION
SELECT 
    '매출총액', 
    SUM(SALEPRICE),
    2 AS ORDERKEY
FROM ORDERS
ORDER BY SUM_PRICE DESC
);

-- ROWNUM은 순서를 다 메긴후 정렬을 하게됨
-- 책 가격이 가장 높은 상위 3개의 책이름, 가격 출력
SELECT BOOKNAME, PRICE
FROM (
    SELECT *
    FROM BOOK
    ORDER BY PRICE DESC
) B 
WHERE ROWNUM <= 3;

-- BOOKNAME에 '축구'가 포함된 항목만 출력
SELECT *
FROM BOOK
WHERE BOOKNAME LIKE '%축구%';

-- CASE ~ WHEN 
-- 날짜별 매출 => 날짜, 해당 날짜의 매출, 
-- 매출이 20000이상일 경우 '상'. 10000 이상일경우 '중', 그 외는 '하'로 표기
SELECT 
    ORDERDATE,
    SUM(SALEPRICE),
    CASE
        WHEN SUM(SALEPRICE) >= 20000 THEN '상'
        WHEN SUM(SALEPRICE) >= 10000 THEN '중'
        ELSE '하'
    END 상중하
FROM ORDERS
GROUP BY ORDERDATE;
