--  조건 처리
-- NVL : NULL값에 대한 처리

SELECT NAME, PAY, BONUS, PAY+BONUS
FROM PROFESSOR;

-- BONUS가 NULL인 값은 0으로 대체
SELECT NAME, PAY, NVL(BONUS, 0), PAY+NVL(BONUS, 0)
FROM PROFESSOR;
-- NOT NULL 일때 => 100으로 / NULL 일때 => 0으로 변경
SELECT NAME, BONUS, NVL2(BONUS, 100, 0)
FROM PROFESSOR;
-- NVL(TO_CHAR(AVG(ENR_GRADE)), '점수 없음')
--NVL은!! 비교할 데이터들이 동일한 데이터타입이여야 함
--TO_CHAR으로 숫자를 문자형으로 변형해줌


-- DECODE : 자바의 조건문(IF)
-- DECODE(컬럼명, '조건값', '조건이랑 같을 때 출력', '조건이랑 다를 때 출력')
-- DECODE(컬럼명, '조건값1', '조건1 만족할 때 출력', '조건2', '조건2 만족할 때 출력', '조건1,2 만족 안했을때')

SELECT 
    NAME,
    DECODE(GRADE, 4, '졸업반', GRADE || '학년')
FROM STU;

SELECT 
    NAME,
    DECODE(GRADE, 4, '졸업반', '3', '고학년', '저학년')
FROM STU;

-- CASE ~ WHEN : DECODE 보다 좀더 복잡한 IF 가독성있게 처리 가능
SELECT 
    SAL,
    CASE
        WHEN SAL > 4000 THEN '고소득'
        WHEN SAL BETWEEN 2000 AND 4000 THEN '적당히 받음'
        ELSE '화이팅!'
    END 급여정보
FROM EMP;