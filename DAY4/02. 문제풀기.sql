-- BOOK, CUSTOMER, ORDERS
--1. BOOK 테이블에서 PRICE 가 20000 이상인 레코드를 출력하시오.
SELECT *
FROM BOOK
WHERE PRICE >= 20000;

--2. BOOK 테이블에서 BOOKNAME 컬럼에 '야구' 가 들어간 레코드 출력하시오.
SELECT *
FROM BOOK
WHERE BOOKNAME LIKE '%야구%';

--3. BOOK 테이블에서 PUBLISHER 컬럼이 '굿스포츠'인 데이터를 BOOKNAME 컬럼 내림차순으로 출력하시오.
SELECT *
FROM BOOK
WHERE PUBLISHER = '굿스포츠'
ORDER BY BOOKNAME DESC;

--4. BOOK 테이블에서 PRICE 가 5000이상 20000이하 데이터 출력하시오.
SELECT *
FROM BOOK
WHERE PRICE BETWEEN 5000 AND 20000;

--5. CUSTOMER 테이블에서 PHONE가 NULL이 아니고 CUSTID가 3이상인 레코드 출력하시오.
SELECT *
FROM CUSTOMER
WHERE PHONE IS NOT NULL AND CUSTID >= 3;

--6. 고객별 평균 주문 금액을 반올림한 값을 출력하시오.(고객명, 평균 주문 금액 출력)
SELECT C.NAME, ROUND(AVG(SALEPRICE)) AS 평균주문금액
FROM CUSTOMER C
INNER JOIN ORDERS O ON C.CUSTID = O.CUSTID 
GROUP BY C.NAME;

--7. 이상미디어의 책을 구매한 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오.
SELECT *
FROM CUSTOMER;
SELECT SUBSTR(NAME, 1, 1) || '씨', COUNT(*)
FROM BOOK B
INNER JOIN ORDERS O ON B.BOOKID = O.BOOKID
INNER JOIN CUSTOMER C ON C.CUSTID = O.CUSTID
WHERE PUBLISHER = '이상미디어'
GROUP BY SUBSTR(NAME, 1, 1);

--8. 이상미디어에서 2020년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객이름, 도서번호를 모두 보이시오. 
SELECT ORDERID, ORDERDATE, NAME, O.BOOKID
FROM ORDERS O
INNER JOIN BOOK B ON O.BOOKID = B.BOOKID
INNER JOIN CUSTOMER C ON O.CUSTID = C.CUSTID
WHERE ORDERDATE = '2020/07/07'; -- DORDERDATE는 문자열로 바꿔서 

--9. 이름, 전화번호가 포함된 고객목록을 보이시오. 단, 전화번호가 없는 고객은 ‘연락처없음’으로 표시하시오.
SELECT NAME, NVL(PHONE, '연락처없음')
FROM CUSTOMER;

--10. 전체 평균 주문금액 보다 금액이 작은 주문에 대해서 주문번호와 금액을 출력하시오.
-- 1)전체평균주문금액 2)전체주문출력 SALEPRICE가 1) 보다 작은것 출력
SELECT AVG(SALEPRICE)
GROUP BY ORDERID, SALEPRICE;

--11. ‘대한민국’에 거주하는 고객에게 판매한 도서의 총 판매액을 출력하시오.
SELECT SUM(SALEPRICE)
FROM CUSTOMER C
INNER JOIN ORDERS O ON C.CUSTID = O.CUSTID
WHERE ADDRESS LIKE '%대한민국%';

--12. 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
-- 1)3번고객의주문최고금액 2)ORDERS에서조건으로SALEPRICE가13000초과하는
SELECT MAX(SALEPRICE)
FROM (
SELECT * 
FROM ORDERS
WHERE CUSTID = '3'
ORDER BY SALEPRICE DESC
);

--13. 이상미디어의 고객별 판매액을 보이시오(고객이름과 고객별 판매액 출력).

-- EMP, DEPT, SALGRADE
--1. 각 부서별 급여 평균 등급을 출력하시오.(평균 급여 등급, 부서명 출력)
SELECT DEPTNO, ROUND(AVG(SAL),1)
FROM EMP
GROUP BY DEPTNO;

--2. 자신의 매니저(MGR)가 받는 급여 등급과 본인이 받는 급여 등급의 차이를 구하시오.
-- 1)매니저찾기(셀프조인) 2)SALGRADE
SELECT *
FROM EMP;

--3. 본인 부서의 평균 급여보다 높은 급여를 받는 사람의 이름, 부서명, 급여, 본인부서의 평균급여를 출력하시오.


-- TBL_USER, TBL_BOARD, TBL_COMMENT
--1. 댓글을 가장 많이 쓴 사용자의 이름, 댓글 개수를 출력하시오.
-- MAX(COUNT(*)) => USERID 추가 안하면 가능
SELECT USERNAME, COUNT(*) AS CNT
FROM TBL_COMMENT C
INNER JOIN TBL_USER U ON C.USERID = U.USERID
GROUP BY C.USERID, USERNAME
HAVING COUNT(*) = (
    SELECT MAX(COUNT(*)) AS CNT
    FROM TBL_COMMENT
    GROUP BY USERID
);

--2. 각 사용자가 작성한 게시글의 작성자 이름, 조회수 평균을 구하시오. 
-- 단, 작성글이 없으면 조회수 평균에 '게시글 없음'으로 출력하시오.
SELECT USERNAME, NVL(TO_CHAR(ROUND(AVG(CNT),1)), '게시글 없음') AS 조회수평균
FROM TBL_USER U
LEFT JOIN TBL_BOARD B  ON B.USERID = U.USERID
GROUP BY U.USERID, USERNAME;

-- STUDENT, ENROL, SUBJECT 
-- 1. 성이 '김'씨인 학생들의 학번, 이름, 학과를 출력하시오.
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE SUBSTR(STU_NAME,1,1) = '김';

-- 2. 15학번 학생들의 학번, 이름, 학과를 출력하시오.
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE SUBSTR(STU_NO,1,4) = '2015';

-- 3. 컴퓨터정보 학과 학생들의 시험 평균 점수를 구하시오.
SELECT STU_DEPT, AVG(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE STU_DEPT = '컴퓨터정보'
GROUP BY STU_DEPT;

-- 4. 컴퓨터개론 수업을 듣는 학생의 학번, 이름, 학과, 시험점수를 구하시오.
SELECT S.STU_NO, STU_NAME, STU_DEPT, ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON E.SUB_NO = SUB.SUB_NO
WHERE SUB_NAME = '컴퓨터개론';

-- 5. 학생들의 전체 평균 키보다 큰 키를 가진 학생들의 학번, 이름, 키를 출력하시오.
SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT > (
    SELECT AVG(STU_HEIGHT)
    FROM STUDENT
) ;

-- 6. 본인 학과의 평균 키보다 큰 학생들의 이름, 학과, 키, 학과 평균키 값 출력
SELECT S.STU_NAME, S.STU_DEPT, S.STU_HEIGHT, AVG_HEI
FROM STUDENT S
INNER JOIN (
    SELECT STU_DEPT, ROUND(AVG(STU_HEIGHT),1) AS AVG_HEI
    FROM STUDENT
    GROUP BY STU_DEPT
) T ON S.STU_DEPT = T.STU_DEPT 
WHERE S.STU_HEIGHT > AVG_HEI;

-- EMP, SALGRADE, DEPT
-- 1. 급여 등급이 3이상인 사원의 사번, 이름, 급여등급을 출력하시오.
SELECT E.EMPNO, ENAME, SAL, AVG_GRADE
FROM EMP E
INNER JOIN (
    SELECT EMPNO, ROUND(AVG(GRADE),1) AS AVG_GRADE
    FROM EMP E
    INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
    GROUP BY EMPNO
) T ON E.EMPNO = T.EMPNO
WHERE AVG_GRADE >= 3;

-- 2. 사번, 이름, 팀장(MGR)의 이름을 출력하시오.
SELECT * 
FROM EMP;
SELECT * 
FROM DEPT;

-- 3. 부서별 가장 높은 급여를 받는 사원의 사번, 이름, 급여, 부서명을 출력하시오.
SELECT EMPNO, ENAME, SAL, DNAME
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
INNER JOIN (
    SELECT DEPTNO, MAX(SAL) AS MAX_SAL
    FROM EMP
    GROUP BY DEPTNO
) T ON E.DEPTNO = T.DEPTNO
WHERE SAL = MAX_SAL;

-- 4. 입사년도가 1981년도인 사원들의 급여 총합을 구하시오.
SELECT SUM(SAL)
FROM EMP
WHERE SUBSTR(HIREDATE,1,2) = '81';

-- STU, PROFESSOR, DEPARTMENT
-- 1. 남자이면서(주민번호 7번째자리 1) 공과대학에 속한 학생의 수를 구하시오.
SELECT *
FROM STU
WHERE SUBSTR(JUMIN,7,1) = '1';

SELECT *
FROM DEPARTMENT;

-- 2. 학생들의 아이디의 마지막 세글자를 '*' 로 채우시오
SELECT 
    ID,
    RPAD(SUBSTR(ID, 1, LENGTH(ID)-3), LENGTH(ID), '*') AS ID
FROM STU;

-- 3. 보너스+급여가 400 이하인 교수들의 이름, 아이디, 학과명을 출력하시오.
SELECT NAME, ID
FROM PROFESSOR
WHERE PAY + BONUS <= 400;
SELECT *
FROM PROFESSOR P
INNER JOIN DEPARTMENT D;

-- 4. 담당 학생이 2명이상인 교수의 이름, 아이디, 담당학생 수를 출력하시오.
-- EMP, SALGRADE, DEPT
-- 1. ALLEN과 같은 JOB, DEPTNO(부서)를 가진 사람을 구하시오.(ENAME, DNAME 출력)
-- 2. 자신의 부서 급여등급 평균보다 높은 등급인 사람의 이름, 부서명, 급여등급을 구하시오.

-- STUDENT, ENROL, SUBJECT
-- 1. 컴퓨터정보과의 평균보다 평균이 낮은 학과의 학과명, 점수 출력

-- STU, PROFESSOR, DEPARTMENT
-- 1. 가장 많은 학생이 있는 학과와 가장 적은 학생이 있는 학과의 학과명, 학생수를 출력하시오.