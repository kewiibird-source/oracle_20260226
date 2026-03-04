SELECT * FROM STUDENT;
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;

-- 1. 복잡한쿼리 단순화, 원하는 컬럼만 제공, 제약걸기
-- OR REPLACE : 같은 이름의 VIEW가 있다면 대체함
CREATE OR REPLACE VIEW STUDENT_VIEW AS
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_DEPT = '기계'
WITH READ ONLY; -- 읽기 전용 옵션!! => 수정 불가

SELECT * FROM STUDENT_VIEW;
-------------------------------------------------------
--2. 보안적인 이유
SELECT *
FROM EMP;
CREATE OR REPLACE VIEW EMP_VIEW AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WITH READ ONLY;

SELECT * FROM EMP_VIEW;
-------------------------------------------------------
-- VIEW에서 수정 가능한 경우
-- 하나의 테이블만 참조 (조인 없을때)
-- GROUP 함수 없을 때
-- DISTINCT 가 없을 때
-- ★ 읽기 전용 옵션이 없을 때 ★
-- -> VIEW를 만들 때는 읽기 전용 옵션을 붙여주는게 좋다.
--------------------------------------------------------
-- 학번, 이름, 학과, 시험평균점수를 출력하는 'STUDENT_VIEW' 이름의 VIEW를 만들어라
CREATE OR REPLACE VIEW STUDENT_VIEW AS
SELECT S.STU_NO, STU_NAME, STU_DEPT, AVG(ENR_GRADE) AS AVG_GRADE
FROM STUDENT S 
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, STU_NAME, STU_DEPT
WITH READ ONLY;

SELECT * 
FROM STUDENT_VIEW;