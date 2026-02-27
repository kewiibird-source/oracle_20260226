-- 전체 학생수
SELECT COUNT(*)
FROM STUDENT;

-- 학과별 학생수 (그룹사용)
SELECT
    STU_DEPT,
    COUNT(*) NUM
FROM STUDENT
GROUP BY STU_DEPT;

-- EMP 테이블에서 직급별 평균 급여
SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB;

-- 학번, 이름, 시험점수 출력
SELECT S.STU_NO, STU_NAME, ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;
-- STU_NO가 같은 학생들끼리 조인
-- ORA-00918: 열의 정의가 애매합니다
-- 양쪽에 같은 컬럼이 존재하기 때문에 어느테이블에 있는지 명확하게 표시해줘야함

-- 사번, 이름, 급여, 급여등급 출력
SELECT EMPNO, ENAME, SAL, GRADE
FROM EMP E
INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- (한사람당 한번씩)학번, 이름, 시험평균
SELECT S.STU_NO, STU_NAME, AVG(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, STU_NAME;
-- STU_NO 와 STU_NAME이 동일할때만 그룹을 지어줌

