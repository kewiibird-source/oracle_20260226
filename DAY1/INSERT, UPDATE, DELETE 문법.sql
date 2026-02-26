-- INSERT
SELECT * FROM STUDENT;

-- INSERT 컬럼 정의하는 방법
INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT)
VALUES(12345, '홍길동', '기계');
-- 순서와 개수는 같아야함
-- ORA-00001: 무결성 제약 조건(SYSTEM.SYS_C008336)에 위배됩니다
-- PK로 설정되면 중복 X

-- INSERT 컬럼 생략(모든 컬럼의 값을 넣어야 함)
INSERT INTO STUDENT
VALUES(12123, '김철수', '전기전자', 1, 'A', 'M', 170, NULL);
--------------------------------------------------------------------
-- UPDATE의 조건은 PK값으로 주는걸 권장
-- 학번이 12345 (홍길동)인 학생의 학과를 '컴퓨터정보', 학년을 1, CLASS를 'A'로 수정
UPDATE STUDENT SET
STU_DEPT = '컴퓨터정보', 
STU_GRADE = 1,
STU_CLASS = 'A'
WHERE STU_NO = 12345;
--------------------------------------------------------------------
-- DELETE 할때는 조건부터 작성하는걸 권장
-- 학번이 12123 이 학생 삭제
DELETE FROM STUDENT WHERE STU_NO = '12123';

COMMIT; -- 테이블에 영향을 주는일은 커밋 필수!!
