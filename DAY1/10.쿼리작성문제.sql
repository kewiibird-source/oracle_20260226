
--1.ENAME 열에서 모든 이름을 소문자로 변경하여 출력해 보시오.
SELECT 
    LOWER(ENAME)
FROM EMP;

--2. ENAME 열에서 'SMITH'를 찾고, 그 값을 'JOHN'으로 변경하여 출력해 보시오.
SELECT REPLACE (ENAME, 'SMITH', 'JOIN')
FROM EMP;

--3. JOB 열에서 'SALESMAN'만 추출하고, 해당 컬럼(SALESMAN)의 길이를 구해 보시오.
SELECT DISTINCT LENGTH(JOB) FROM EMP WHERE JOB = 'SALESMAN';

--4. ENAME 열에서 이름의 첫 글자만 대문자로 변경하여 출력해 보시오.(나머지는 다 소문자)
SELECT 
    UPPER(SUBSTR(ENAME, 1, 1)) || LOWER(SUBSTR(ENAME, 2)) ENAME
FROM EMP;

--5. ENAME 열에서 이름의 마지막 3글자를 추출하여 출력해 보시오.
SELECT
    SUBSTR(ENAME, LENGTH(ENAME)-2)
FROM EMP;

--6. JOB 열의 값 중 'MANAGER'로 시작하는 직책을 가진 사람들의 수를 구해 보시오.
SELECT COUNT(*)
FROM EMP
WHERE JOB = 'MANAGER';

--7. ENAME과 JOB 열을 합쳐서 'ENAME(JOB)' 형태로 출력해 보시오.
SELECT ENAME || '(' || JOB || ')' "ENAME(JOB)"
FROM EMP;

--8. ENAME 열에서 'A'가 포함된 모든 사람의 이름을 추출해 보시오.
SELECT *
FROM EMP
WHERE ENAME LIKE '%A%';

--9. 모든 직원의 SAL 값에 10%를 추가한 값을 출력해 보시오.
SELECT ENAME, SAL * 1.1
FROM EMP;

--10. SAL 값이 1500 이상인 직원들의 평균 급여를 구해 보시오.
SELECT AVG(SAL)
FROM EMP
WHERE SAL >= 1500;

--11. 각 부서(DEPTNO)별로 급여의 총합을 구해 보시오.
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

--12. SAL 값이 1300 이상이면서 부서번호가 20인 직원들의 평균 급여를 구해 보시오.
SELECT AVG(SAL)
FROM EMP
WHERE SAL >= 1300 AND DEPTNO = '20';

--13. 각 부서별로 급여가 가장 높은 직원의 이름을 구해 보시오.
SELECT *
FROM EMP
WHERE(DEPTNO, SAL) IN(
    SELECT DEPTNO, MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO
);

--14. 직급(JOB)별 가장 높은 급여를 받는 사람의 사번, 이름, 급여를 출력하시오.
SELECT EMPTNO, JOB, ENAME, SAL
FROM EMP
WHERE (JOB, SAL) IN(
    SELECT JOB, MAX(SAL)
    FROM EMP
    GROUP BY JOB
);

--15. 전체 평균보다 높은 급여를 받는 사람의 사번, 이름, 급여를 출력하시오.
SELECT *
FROM EMP
WHERE SAL > (
    SELECT AVG(SAL)
    FROM EMP
);

--16. 직급의 평균 급여가 전체 평균 급여보다 높은 직급의 이름, 평균급여를 출력하시오.
SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) > (
    SELECT AVG(SAL)
    FROM EMP
);

--17. 급여와 보너스의 합이 2500 이상인 사람의 수를 구하시오.
SELECT COUNT(*) 
FROM EMP
WHERE SAL + NVL(COMM, 0) >= 2500;

-- PROFESSOR
--1. EMAIL을 *****@abc.net형태로 출력하시오. 
--	 조건) *의 개수는 @앞의 글자 개수와 같아야 함.
SELECT 
    LPAD(SUBSTR(EMAIL, INSTR(EMAIL, '@')), LENGTH(EMAIL), '*')
FROM PROFESSOR;

--2. 이메일의 주소에 'naver'가 들어 가는 사람의 수를 구하시오.
SELECT COUNT(*)
FROM PROFESSOR
WHERE EMAIL LIKE '%naver%';

--3. 입사일(HIREDATE)을 '2026-02-26' 형태로 출력하시오.
SELECT
    TO_CHAR(HIREDATE, 'YYYY-MM-DD')
FROM EMP;






