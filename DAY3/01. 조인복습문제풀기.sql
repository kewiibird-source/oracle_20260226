-- STUDENT, ENROL, SUBJECT
SELECT * FROM STUDENT;
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;

-- 1. 학번, 학생이름, 학과, 시험과목명, 시험점수 출력
SELECT S.STU_NO, STU_NAME, STU_DEPT, SUB_NAME,  ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN SUBJECT SUB ON SUB.SUB_NO = E.SUB_NO;

-- 2. 각 학과별 시험 평균 점수 구하기(학과,평균점수 출력)
SELECT STU_DEPT, AVG(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY STU_DEPT;

-- 3. 본인 학과의 시험 평균 점수보다 높은 평균 점수를 가진 학생의 학번, 이름, 평균점수 출력
SELECT S.STU_NO, STU_NAME, AVG(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN (
    SELECT STU_DEPT, AVG(ENR_GRADE) AVG_DEPT
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    GROUP BY STU_DEPT
) T ON S.STU_DEPT = T.STU_DEPT
GROUP BY S.STU_NO, STU_NAME, AVG_DEPT
HAVING AVG(ENR_GRADE) > AVG_DEPT;

-- 3-1. 본인 학과의 시험 평균 점수보다 높은 시험 점수를 가진 학생의 학번, 이름, 평균점수 출력
SELECT S.STU_NO, STU_NAME, AVG(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
INNER JOIN (
    SELECT STU_DEPT, AVG(ENR_GRADE) AS AVG_GRADE
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    GROUP BY STU_DEPT
) T ON S.STU_DEPT = T.STU_DEPT
GROUP BY S.STU_NO, STU_NAME, AVG_GRADE
HAVING AVG(ENR_GRADE) > AVG_GRADE;

-- TBL_BOARD , TBL_COMMENT, TBL_USER
-- 3.2 사용자가 작성한 게시글 조회수의 총합이 
SELECT USERID, SUM(CNT) AS SUM_CNT
FROM TBL_BOARD
GROUP BY USERID;
-- 모든 게시글 조회수 전체 평균보다 높은 게시글의 
SELECT AVG(CNT)
FROM TBL_BOARD;
-- 작성자 아이디, 이름, 조회수 총합 출력

SELECT B.USERID, U.USERNAME, SUM(CNT)
FROM TBL_BOARD B
INNER JOIN TBL_USER U ON B.USERID = U.USERID
GROUP BY B.USERID, U.USERNAME
HAVING SUM(CNT) > (
    SELECT AVG(CNT)
    FROM TBL_BOARD
);

SELECT U.USERID, USERNAME, SUM_CNT
FROM TBL_USER U
INNER JOIN (
    SELECT USERID, SUM(CNT) AS SUM_CNT
    FROM TBL_BOARD
    GROUP BY USERID
) T ON U.USERID = T.USERID
WHERE SUM_CNT > (
    SELECT AVG(CNT)
    FROM TBL_BOARD
);

-- 4. 시험을 2번이상 본 학생의 학번, 이름, 시험본 횟수 출력                                                                                          
SELECT S.STU_NO, STU_NAME, COUNT(*)                                                                                                                                                                                                                                                                                                                                    )
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, STU_NAME
HAVING COUNT(*) >= 2;
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