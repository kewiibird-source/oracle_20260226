-- PL/SQL
-- 사용자 정의 함수, 프로시저, 트리거

-- 특징
-- 선언부(선택), 실행부, 예외처리(선택)
-- 마지막을 '/' 로 마무리

---------------------------------------------------------------------
-- 숫자를 2배로 돌려주는 함수 생성
CREATE OR REPLACE FUNCTION MULTI(I_VALUE IN NUMBER)
RETURN NUMBER
IS
-- 변수 선언
BEGIN
-- 실행부
    RETURN I_VALUE * 2;
END;
/

SELECT ENR_GRADE, MULTI(ENR_GRADE)
FROM ENROL;

---------------------------------------------------------------------
-- DATE_FUNC 이름의 함수를 생성
--
SELECT 
    --TO_CHAR(CDATETIME, 'YYYY-MM-DD HH24:MI:SS'),
    DATE_FUNC(CDATETIME)
FROM TBL_BOARD;

CREATE OR REPLACE FUNCTION DATE_FUNC(I_VALUE IN DATE)
RETURN VARCHAR2 -- 가변크기 
IS
BEGIN
    RETURN TO_CHAR(I_VALUE, 'YYYY-MM-DD HH24:MI:SS');
END;
/

---------------------------------------------------------------------
-- DATE_FUNC2(CDATETIME, 'DATETIME') -> 'YYYY-MM-DD HH24:MI:SS'
-- DATE_FUNC2(CDATETIME, 'DATE') -> 'YYYY-MM-DD'
-- DATE_FUNC2(CDATETIME, 'TIME') -> 'HH24:MI:SS'
CREATE OR REPLACE FUNCTION DATE_FUNC2(I_DATE IN DATE, I_KEY IN VARCHAR2)
RETURN VARCHAR2
IS
    O_DATE VARCHAR2(100);
BEGIN
    IF I_KEY = 'DATETIME' THEN
        O_DATE := TO_CHAR(I_DATE, 'YYYY-MM-DD HH24:MI:SS');
    ELSIF I_KEY = 'DATE' THEN 
        O_DATE := TO_CHAR(I_DATE, 'YYYY-MM-DD');
    ELSIF I_KEY = 'TIME' THEN 
        O_DATE := TO_CHAR(I_DATE, 'HH24:MI:SS');
    ELSE 
        O_DATE := '값 잘못 입력했음 ㅋ';
    END IF;
    RETURN O_DATE;
END;
/

SELECT 
    DATE_FUNC2(CDATETIME, 'DATETIME') || ' ',
    DATE_FUNC2(CDATETIME, 'DATE') || ' ',
    DATE_FUNC2(CDATETIME, 'TIME')
FROM TBL_BOARD;

---------------------------------------------------------------------
-- GRADE_FUNC
-- GRADE_FUNC(ENR_GRADE)
-- ENR_GRADE 값이 90이상이면 'A'
-- ENR_GRADE 값이 80이상이면 'B'
-- ENR_GRADE 값이 70이상이면 'C'
-- ENR_GRADE 값이 60이상이면 'D'
-- 그 외는 'F' 리턴

CREATE OR REPLACE FUNCTION GRADE_FUNC(I_SCORE IN NUMBER)
RETURN VARCHAR2
IS
BEGIN
    IF I_SCORE > 100 OR I_SCORE < 0 THEN
        RETURN '잘못된 숫자 입력';
    ELSIF I_SCORE > 90 THEN
        RETURN 'A';
    ELSIF I_SCORE > 80 THEN
        RETURN 'B';
    ELSIF I_SCORE > 70 THEN
        RETURN 'C';
    ELSIF I_SCORE > 60 THEN
        RETURN 'D';
    ELSE
        RETURN 'F';
    END IF;
END;
/

SELECT ENR_GRADE, GRADE_FUNC(ENR_GRADE)
FROM ENROL;

---------------------------------------------------------------------
SELECT *
FROM STU;

-- GENDER_FUNC(JUMIN)
-- 7번째 숫자가 1, 3이면 '남자' 리턴
-- 7번째 숫자가 2, 4이면 '여자' 리턴
-- 인자값이 13자리가 아니면 '제대로 값 입력하셈' 리턴

CREATE OR REPLACE FUNCTION GENDER_FUNC(I_JUMIN IN NUMBER)
RETURN VARCHAR2
IS
BEGIN
    IF LENGTH(I_JUMIN) != 13 THEN
        RETURN '13자리로 입력하삼';
    ELSIF SUBSTR(I_JUMIN, 7, 1) = 1 THEN
        RETURN '남';
    ELSIF SUBSTR(I_JUMIN, 7, 1) = 3 THEN
        RETURN '남';
    ELSIF SUBSTR(I_JUMIN, 7, 1) = 2 THEN
        RETURN '여';
    ELSIF SUBSTR(I_JUMIN, 7, 1) = 4 THEN
        RETURN '여';
    END IF;
END;
/

SELECT JUMIN, GENDER_FUNC(JUMIN)
FROM STU;
