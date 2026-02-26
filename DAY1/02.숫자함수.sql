-- 숫자 함수
-- 임의의 데이터 생성 DUAL
SELECT 'QQQ' ZZ FROM DUAL;

-- 1) ROUND : 반올림
SELECT ROUND(123.45678, 2)
FROM DUAL;

-- 2) CEIL : 올림
SELECT CEIL(123.001)
FROM DUAL;

-- 3) FLOOR : 내림
SELECT FLOOR(123.999)
FROM DUAL;

-- 4) TRUNC : 특정 위치까지 출력
SELECT TRUNC(123.4567, 2)
FROM DUAL;

-- 5) MOD : 나머지 값 (컬럼사용)
SELECT STU_NAME, MOD(STU_HEIGHT, 2)
FROM STUDENT;

-- 6) SIGN : 숫자 부호를 반환 -> 양수면 1, 음수면 -1, 0이면 0
SELECT SIGN(-10) AS ZZ
FROM DUAL;

-- 7) ABS : 절대 값
SELECT ABS(-10)
FROM DUAL;

-- 8) POWER : 재곱 
SELECT POWER(2, 10)
FROM DUAL; -- 1024