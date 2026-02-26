-- 문자 함수

-- 1) CONCAT : 문자열 결합
SELECT CONCAT(CONCAT(STU_NO, ' '), STU_NAME) AS ZZ
FROM STUDENT;
-- 1-2) || : 문자열 결합
SELECT STU_NO || ' ' || STU_NAME AS ZZ
FROM STUDENT;

-- 2) LENGTH : 문자열 길이
SELECT NAME, ID, LENGTH(ID)
FROM PROFESSOR;

-- 3) SUBSTR : 문자열 자르기
SELECT 
    NAME, 
    SUBSTR(JUMIN, 1, 6) 생년월일,
    SUBSTR(JUMIN, 7)
FROM STU;

-- DECODE : 자바의 IF문 같은거 (조건문)
SELECT NAME, 
    SUBSTR(JUMIN, 7, 1),
    DECODE(SUBSTR(JUMIN, 7, 1), 1, '남자', '여자')
FROM STU;

-- 4) UPPER , LOWER : 대,소문자로 변경
SELECT
    UPPER('Hello OraCle'),
    LOWER('Hello OraCle')
FROM DUAL;

-- 5) INSTR : 특정 문자열이 몇번째에 나오는지 처음으로 나오는지
SELECT 
    EMAIL, 
    INSTR(EMAIL, '@'),
    SUBSTR(EMAIL, INSTR(EMAIL, '@') + 1)
FROM PROFESSOR;

-- 6) REPLACE : 문자열을 다른 문자열로 대체
SELECT
    EMAIL,
    REPLACE(EMAIL, 'net', 'com')
FROM PROFESSOR;

-- 7) TRIM, LTRIM, RTIM : 공백제거
SELECT 
    TRIM('   Hello Oracle   '),
    LTRIM('   Hello Oracle   '),
    RTRIM('   Hello Oracle   ')
FROM DUAL;

-- 8) LPAD, RPAD : 지정한 길이 만큼 특정 문자 채우기
SELECT 
    RPAD(ID, 10, '*') -- ID가 10글자가 되도록 '*'가 추가됨
FROM PROFESSOR;

-- 아이디의 마지막 3글자만 *로 표시
SELECT 
    SUBSTR(ID, 1, LENGTH(ID)-3),
    RPAD(SUBSTR(ID, 1, LENGTH(ID)-3), LENGTH)ID), '*') AS ID
FROM PROFESSOR;

SELECT 
    RPAD(SUBSTR(ID, 1, LENGTH(ID)-3), LENGTH(ID), '*') AS ID,
    SUBSTR(ID, 1, LENGTH(ID)-3) || '***'
FROM PROFESSOR;


    