Oracle 기본 문법 정리.

#Index
[1]  오라클의 데이터 타입(자료형)
[2]  @@ SELECT 기본함수 정리
[3]  INSERT 문
[4]  UPDATE 문
[5]  DELETE 문
[6]  MERGE INTO - 한번에 INSERT, UPDATE
[7]  PL/SQL 문법
[8]  DB 테이블 정의서 쿼리
[9]  Package 안에서 코딩한 단어 검색
[10] 1년 달력 생성 쿼리
[11] RANDOM.VALUE/STRING 랜덤 구하기
[12] 행을 열로, 열을 행으로 월별통계
[13] 행값 구분자 가져오기
[14] DECODE 조건
------------------------------------------------------------------------------------------------
[1] 오라클의 데이터 타입(자료형)


1) 데이터 타입 

- CHAR		고정길이 문자 DATA를 4000BYTE 저장
 
- VARCHAR2	가변길이 문자 DATA를 4000BYTE 저장  

- NUMBER	가변길이 숫자값을 -38 ~ +38자리수를 저장, (자릿수/2)+1 ,number(1)는 (1/2)+1 = 1.5 반올림해서 2byte가 됨.

- DATE		날짜를 저장

- TIMESTAMP	년, 월, 일, 시, 분, 초, mili-second까지 보여준다.

- CLOB: 	BINARY DATA를 4GB 저장, 문자 대형 객체(Character). Oracle Server는 CLOB과 VARCHAR2 사이에 암시적 변환을 수행.

- BLOB:		이진 대형 객체 (Binary). 이미지, 동영상, MP3 등
	
- NCLOB: 	내셔널 문자 대형 객체 (National). 오라클에서 정의되는 National Character Set을 따르는 문자.

- BFILE: 	OS에 저장되는 이진 파일의 이름과 위치를 저장. 읽기 전용 모드로만 액세스 가능.


2) 데이터 타입 변환.

* TO_CHAR(char_field)   숫자나 날짜를 문자열로 변환
 
* TO_DATE(char_field)   문자를 날짜로 변환
 
* TO_NUMBER(char_field) 문자를 숫자로 변환

- 날짜-> 문자

	SELECT SYSDATE FROM DUAL    --실제 기본 날짜 가져오기
	SELECT TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') SYS_DATE24 FROM DUAL    -- 24시로
	SELECT TO_CHAR(SYSDATE, 'YYYYMMDDHH12MISS') SYS_DATE12 FROM DUAL    -- 12시간

- 문자-> 날짜

	SELECT TO_DATE('20180401','YYYY-MM-DD') FROM DUAL;


3) DUAL 테이블????

	dual테이블은 산술 연산이나 가상 컬럼 등, 값을 한번만 출력하고 싶을 때. 


4) 문자열 byte 크기 조회 쿼리..

	select vsize('길은 내 앞에 놓여있다. :: ') as byteSize from dual;


5) DB 별 용량 체크 쿼리

	SELECT OWNER,SEGMENT_NAME,SEGMENT_TYPE,SUM(BYTES)/1024/1024 AS MB
          FROM DBA_SEGMENTS
         WHERE OWNER = 'DH'      --DB
           AND SEGMENT_TYPE = 'TABLE'  
         GROUP BY OWNER,SEGMENT_NAME,SEGMENT_TYPE
         ORDER BY MB DESC


6) 오라클 버전 확인 쿼리

	SELECT * FROM v$version WHERE banner LIKE 'Oracle%';



------------------------------------------------------------------------------------------------
[2] @@ select 기본함수 정리


* ||		-- mssql + 와 같음 문자열 붙여쓰기

* IS NULL	--널값 체크

* SELECT ENAME,COMM,NVL(COMM,0) FROM EMP;//NVL : NULL 값 처리


1) MSSQL에서 LEFT, RIGHT 비교..

* SELECT SUBSTR('123456789',-4) AS SHOW FROM DUAL;   -- LEFT 4자리

* SELECT SUBSTR('123456789',1,3) AS SHOW FROM DUAL;  -- RIGHT 3자리

* SELECT SUBSTR('123456789', 3) AS SHOW FROM DUAL;   --  3째 자리부터 문자 편집.


* SELECT MIN(FIELD1), MIN(FIELD2) KEEP(DENSE_RANK FIRST ORDER BY FIELD1) AS FIELD2 FROM TABLE1 --최소값 및 행의 다른 필드값

* SELECT MAX(FIELD1), MAX(FIELD2) KEEP(DENSE_RANK LAST  ORDER BY FIELD1) AS FIELD2 FROM TABLE11--최대값 및 행의 다른 필드값


2) 순위 반환 함수.

- RANK() OVER (ORDER BY salary DESC)       : 중복 순위 다음은 해당 개수만큼 건너뛰고 반환.

- DENSE_RANK() OVER (ORDER BY salary DESC) : 중복 순위 상관없이 순차적으로 반환.

- ROW_NUMBER() OVER (ORDER BY salary DESC) : 중복과 관계 없이 무조건 순서대로 반환.


3) top 1  (MSSQL) 오라클 검색

- SELECT MIN(ename) KEEP(DENSE_RANK FIRST ORDER BY hirday desc) from IM_EMP         --일반

- SELECT * FROM (SELECT * FROM IM_EMP ORDER BY HIRDAY DESC) WHERE ROWNUM <= 10;     --서브쿼리


4) like 검색

- WHERE ename LIKE '%A%';    --단일 검색

- WHERE REGEXP_LIKE(TEXT, 'Word1|Word2|Word3')  -- 다중 검색 '단어|단어|단어' 


5) UNION 

	SELECT deptno FROM dept
 	(UNION, UNION ALL, INTERSECT, MINUS)
	SELECT deptno FROM emp;

- UNION     	합집합(중복 제거)

- UNOIN ALL 	합집합(중복 포함)

- INTERSECT	교집합(두 행중 공통된 행만 반환)

- MINUS		차집합(두번째 테이블에 존재하지 않는 첫번째 테이블의 행을 반환)


6) 정렬  ORDER BY 

- ASC는 default값이다.(작은 값부터..)    // 내림차순 : DESC;
- 값이 Null일 때 가장 큰 값이 된다. (ASC일 때...맨 뒤에 붙는다.) 



------------------------------------------------------------------------------------------------
[3] INSERT 문
 

1) 기본 삽입.

	INSERT INTO USERS(USERSNO,EMAIL,PWD,NAME,PNO) VALUES (USER_SEQ.NEXTVAL,'GUEST2','1234','손님2','11111111111');

2-1) 원본은 있고 대상 테이블 새로 생성.

	SELECT * INTO A_COPY FROM A

2-2) 특정컬럼만 가져와서 테이블 새로 생성.

	SELECT * INTO A_COPY FROM ( SELECT COL1,COL2,COL3.... FROM A ) AS TEMP_TABLE

3-1) 원본과 대상테이블이 모두 있을 경우
 
	INSERT INTO B SELECT * FROM A

3-2) 만약 컬럼수가 적을 경우

	INSERT INTO B SELECT COL1,COL2,COL3 FROM A



------------------------------------------------------------------------------------------------
[4] UPDATE 문

1) 기본 업데이트

	UPDATE 테이블 SET 필드 = '' WHERE 조건

2) 다중 업데이트

	UPDATE table_name
	SET (column_name, column_name, ...) = (value, value, ... ) 
	WHERE 조건

3) SET 절 서브쿼리 업데이트

	ex) BONUS 테이블에서 10번 사원의 직책을 PM으로 변경하고, BONUS 를 평균에서 10%인상한 값으로 변경하시오.
 
	UPDATE BONUS_TB
      	SET emp_job = 'PM’, bonus = (SELECT 1.1 * AVG(bonus) FROM bonuses)
      	WHERE eno = 10;

4) WHERE 절 서브쿼리 업데이트

	ex) ORDERS 테이블에서 MYLEE 사원이 받은 주문량을 50개씩 줄이시오.
 
	UPDATE orders
	SET qty = qty - 50
	WHERE eno IN (SELECT eno
        	        FROM employee
        	       WHERE ename ='MYLEE');

5)


------------------------------------------------------------------------------------------------
[5] DELETE 문

1) DELETE 삭제

	DELETE FROM USERS WHERE EMAIL='GUEST3';

- 데이터만 삭제 되며 테이블 용량은 줄어 들지 않는다. 또한 삭제후 잘못 삭제한 것을 되돌릴 수 있음
- TABLE이나 CLUSTER에 행이 많으면 행이 삭제될 때마다 많은 SYSTEM 자원이 소모 됨
- Commit이전에는 Rollback이 가능
- 롤백정보를 기록 하므로 Truncate에 비해서 느림
- 전체 또는 일부만 삭제 가능
- 삭제 행수를 반환
- 데이터를 모두 Delete해도 사용했던 Storage는 Release 처리 되지 않음


2) TRUNCATE 삭제 (테이블의 모든 로우를 제거 Truncate Table)

	TRUNCATE TABLE USERS;

- 테이블을 최초 생성된 초기상태로 만듬
- 용량이 줄어들고, 인덱스 등도 모두 삭제
- Rollback 불가능
- 무조건 전체 삭제만 가능
- 삭제 행수를 반환 하지 않음
- 테이블이 사용했던 Storage중 최초 테이블 생성시 할당된 Storage만 남기고 Release 처리


3) Drop table (테이블 구조 자체 제거)

- 기존 테이블의 존재를 제한다. (테이블의 정의 자체를 완전히 삭제)
- Rollback 불가능
- 테이블이 사용했던 Storage는 모두 Release 처리



------------------------------------------------------------------------------------------------
[6] MERGE INTO - 한번에 INSERT, UPDATE

* 특정 조건의 데이터가 존재하면 해당값 update, 없는 경우 새로 데이터를 insert 해줌.


	MERGE INTO table_name alias                  	    -- UPDATE, INSERT, DELETE 할 테이블
             USING (table | view | subquery) alias   	    -- 비교대상 테이블 (하나의 테이블만 이용한다면 DUAL 활용)
                ON (join condition)                  	    -- WHERE절에 조건 쓰듯이

              WHEN MATCHED THEN                      	    -- ON 이하의 조건에 해당하는 데이터가 있는 경우 
                   UPDATE SET col1 = val1[, ...]            -- UPDATE 실행
                   DELETE WHERE (m.deptno = 20)             -- DELETE 실행
 
              WHEN NOT MATCHED THEN                  	    -- ON 이하의 조건에 해당하는 데이터가 없는 경우
                   INSERT (column lists) VALUES (values);   -- INSERT 실행

!주의 : 오라클 9버전 이상에서 사용가능, 
        10G부터 DELETE문 사용가능,
        트리거 발생안함,
        조건절 사용 컬럼은 업데이트 불가.(조건은 키만)



------------------------------------------------------------------------------------------------
[7] PL/SQL 문법


-- @@ if 문
if   	~~~ then    		--시작
begin				--블록 가능
end;

elsif 	~~  then		-- else의 'e'가 빠짐
end if;

-- @@ case 문


case when ~~ then
case when ~~ then
else
end

end case;   --이건 쿼리문 외 조건 사용시..? 

-- @@ while 문

while 조건 loop

end loop;

-- @@ loop 문

loop ~~
EXIT WHEN v_cnt > 110;   --루프문 빠져나가기 조건.
end loop;


-- @@ for 문 

ex) for i in reverse 1..10 loop

-- i는 자동으로 생성되는 변수 이므로 선언할 필요 없음
-- reverse 옵션을 사용할 경우 1씩 감소, reverse를 사용해도 최소값, 최대값의 순서로 적용.
-- in 안에 꼭 최소값..최대값 형태로 사용해야 되는 것은 아님


for ~~ loop

end loop;


------------------------------------------------------------------------------------------------
[8] DB 테이블 정의서 쿼리

SELECT TT.* ,
       C1.DATA_DEFAULT
  FROM (SELECT A1.TABLE_COMMENTS ,
               A1.TABLE_NAME ,
               A1.COLUMN_ID ,
               A1.COLUMN_NAME ,
               A1.COLUMN_COMMENTS ,
               (
                                       CASE
                                         WHEN B1.CONSTRAINT_TYPE = 'P' THEN 'Y'
                                       END) PK_FLAG ,
               NVL(A1.NULL_FLAG, 'N') AS NULL_FLAG ,
               A1.DATA_TYPE|| (
                                       CASE A1.DATA_TYPE
                                         WHEN 'NUMBER' THEN '('||TO_CHAR(A1.DATA_LENGTH)||','||TO_CHAR(A1.DATA_PRECISION)||')'
                                         WHEN 'DATE' THEN ' '
                                         ELSE '('||A1.DATA_LENGTH||')'
                                       END) DATA_TYPE
          FROM (SELECT B.COMMENTS TABLE_COMMENTS ,
                       A.TABLE_NAME TABLE_NAME ,
                       C.COMMENTS COLUMN_COMMENTS ,
                       A.COLUMN_NAME COLUMN_NAME ,
                       (
                                                       CASE A.NULLABLE
                                                         WHEN 'Y' THEN 'Y'
                                                       END) NULL_FLAG ,
                       A.DATA_TYPE DATA_TYPE ,
                       A.DATA_LENGTH ,
                       A.COLUMN_ID AS COLUMN_ID ,
                       A.DATA_PRECISION
                  FROM USER_TAB_COLUMNS A ,
                       USER_TAB_COMMENTS B ,
                       USER_COL_COMMENTS C
                 WHERE (A.TABLE_NAME = B.TABLE_NAME)
                   AND (A.TABLE_NAME = C.TABLE_NAME
                           AND A.COLUMN_NAME = C.COLUMN_NAME)
                   AND B.TABLE_TYPE = 'TABLE' ) A1 ,
               (SELECT A.TABLE_NAME ,
                       A.COLUMN_NAME ,
                       B.CONSTRAINT_TYPE
                  FROM USER_CONS_COLUMNS A,
                       USER_CONSTRAINTS B
                 WHERE (A.CONSTRAINT_NAME = B.CONSTRAINT_NAME)
                   AND B.CONSTRAINT_TYPE IN ('P',
                               'R') ) B1
         WHERE A1.TABLE_NAME = B1.TABLE_NAME(+)
           AND A1.COLUMN_NAME = B1.COLUMN_NAME(+) 
           --AND A1.TABLE_NAME LIKE 'AC_BANK%'
           ) TT ,
           
       COLS C1
 WHERE TT.TABLE_NAME = C1.TABLE_NAME
   AND TT.COLUMN_NAME = C1.COLUMN_NAME
 ORDER BY TT.TABLE_NAME, TT.COLUMN_ID;

--------------------------------------------------------------------------
[9] Package 안에서 코딩한 단어 검색

SELECT DISTINCT NAME, TYPE FROM USER_SOURCE WHERE TEXT LIKE '%FindText%'

--------------------------------------------------------------------------
[10] 1년 달력 생성 쿼리

--2018년 01월부터 12월 기간의 달력 생성 쿼리
SELECT DATES, 
       WEEKDAY, 
       DECODE(WEEKDAY,'1','일','2','월','3','화','4','수','5','목','6','금','7','토') "WEEKDAY(요일)", 
       WEEK_CNT "WEEK_CNT(주차)"
  FROM (
        SELECT TO_DATE(DAYS,'YYYYMMDD') AS DATES,
                 TO_CHAR(TO_DATE(DAYS,'YYYYMMDD'), 'D') AS WEEKDAY, 
                 WEEK_CNT
          FROM (SELECT TO_CHAR(MONTHS,'YYYYMM') AS MONTHS, 
                       TO_CHAR(MONTHS,'YYYYMM') || LPAD(LV, 2, '0') AS DAYS,
                       DAY_CNT,
                       (LV + (7-TO_CHAR(MONTHS+(LV-1), 'D')) + (TO_CHAR(TO_DATE(TO_CHAR(MONTHS, 'YYYYMM')||'01', 'YYYYMMDD'), 'D')-1)) / 7 AS WEEK_CNT
                  FROM (SELECT ADD_MONTHS(TO_DATE(201801,'YYYYMM'), LV - 1) AS MONTHS, 
                               TO_CHAR(LAST_DAY(ADD_MONTHS(TO_DATE(201801,'YYYYMM'), LV-1)), 'DD') AS DAY_CNT
                          FROM DUAL SA, 
                                  (SELECT LEVEL LV
                                     FROM DUAL
                                  CONNECT BY LEVEL <= MONTHS_BETWEEN(TO_DATE(201812,'YYYYMM'), TO_DATE(201801,'YYYYMM'))+1)
                       ) A, 
                          (SELECT LEVEL LV
                             FROM DUAL 
                          CONNECT BY LEVEL <= 31 
                          ) B 
               ) M
         WHERE MONTHS||DAY_CNT >= DAYS
         ORDER BY MONTHS, DAYS
       );
       
       
--------------------------------------------------------------------------
[11] RANDOM.VALUE/STRING 랜덤 구하기

--VALUE
SELECT CEIL(DBMS_RANDOM.VALUE(1000, 10000)) rand 
FROM DUAL
CONNECT BY LEVEL <= 10;

--STRING
WITH TT AS(
    SELECT DBMS_RANDOM.STRING('U',  10) rand FROM DUAL  -- 대문자   VSBSMPRSWU
    UNION ALL
    SELECT DBMS_RANDOM.STRING('L',  10) rand  FROM DUAL -- 소문자   myhhapzbgg
    UNION ALL
    SELECT DBMS_RANDOM.STRING('A',  10) rand  FROM DUAL -- 영문자   SdObPAOuSw
    UNION ALL
    SELECT DBMS_RANDOM.STRING('X',  10) rand FROM DUAL  -- 영숫자   ZYRA0IV2WH
    UNION ALL
    SELECT DBMS_RANDOM.STRING('P',  10) rand FROM DUAL  -- 문자혼합 Yf^I,p"JR; 
)
SELECT * FROM TT;


--------------------------------------------------------------------------
[12] 행을 열로, 열을 행으로 월별통계

--행을 열로
WITH TEMP_TABLE AS (
  
  SELECT TO_NUMBER(TO_CHAR(TO_DATE('20180101'), 'MM'))+LEVEL-1 AS MON,
         FLOOR(DBMS_RANDOM.VALUE(0,999)) PRICE   --0~999까지 임의 값.
  FROM DUAL
  CONNECT BY LEVEL <= 12   --조건까지 LEVEL 1씩 증가
  
--  SELECT (TO_DATE('20160101','YYYYMMDD') + LEVEL-1) MON
--  FROM DUAL
--  CONNECT BY LEVEL-1 <= TO_DATE('20171231','YYYYMMDD') - TO_DATE('20160101','YYYYMMDD')
)

  SELECT "1월"+"2월"+"3월"+"4월"+"5월"+"6월"+"7월"+"8월"+"9월"+"10월"+"11월"+"12월" TT_KUM, 
         AA.*
    FROM (SELECT --*                 
                 NVL(일월, '0') "1월",
                 NVL(이월, '0') "2월",
                 NVL(삼월, '0') "3월",
                 NVL(사월, '0') "4월",
                 NVL(오월, '0') "5월",
                 NVL(육월, '0') "6월",
                 NVL(칠월, '0') "7월",
                 NVL(팔월, '0') "8월",
                 NVL(구월, '0') "9월",
                 NVL(십월, '0') "10월",
                 NVL(십일월, '0') "11월",
                 NVL(십이월, '0') "12월"    
    
            FROM (
                  SELECT * 
                    FROM TEMP_TABLE
                 )
           PIVOT ( SUM (PRICE) FOR MON IN (1 일월, 2 이월, 3 삼월,  4  사월,  5  오월,  6  육월,
                                           7 칠월, 8 팔월, 9 구월, 10 십월, 11 십일월, 12 십이월)
                 )
         ) AA;


--열을 행으로
WITH TEMP_LOGIN_HIS AS (
    SELECT 'Name1' 이름, '2' 일월, '1' 이월 FROM DUAL 
    UNION ALL
    SELECT 'Name2' 이름, '1' 일월, '1' 이월 FROM DUAL
)
SELECT * FROM TEMP_LOGIN_HIS
UNPIVOT (  Cnt FOR 월 IN (일월, 이월) );


--------------------------------------------------------------------------
[13] 행값 구분자 가져오기

1)WM_CONCAT

WITH TEMPLOGINLOG AS (
SELECT 'COLUMN1' AS ID, 'NAME1' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN2' AS ID, 'NAME2' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME3' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME4' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN2' AS ID, 'NAME5' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN2' AS ID, 'NAME6' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME7' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME8' AS NAME FROM DUAL
)
--1번 방법 :  정렬불가 피벗
SELECT ID, WM_CONCAT(NAME) NAME
FROM TEMPLOGINLOG
GROUP BY ID;


2)LISTAGG -- Oracle 11g 이상만 사용가능

WITH TEMPLOGINLOG AS (
SELECT 'COLUMN1' AS ID, 'NAME1' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN2' AS ID, 'NAME2' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME3' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME4' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN2' AS ID, 'NAME5' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN2' AS ID, 'NAME6' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME7' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME8' AS NAME FROM DUAL
)

-- 장점 : 정렬가능, 구분자 변경 가능
SELECT
  ID,
  LISTAGG(NAME,',') WITHIN GROUP(ORDER BY NAME) NAME
FROM TEMPLOGINLOG
GROUP BY ID;

3)xmlelement

WITH TEMPLOGINLOG AS (
SELECT 'COLUMN1' AS ID, 'NAME1' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN2' AS ID, 'NAME2' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME3' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME4' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN2' AS ID, 'NAME5' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN2' AS ID, 'NAME6' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME7' AS NAME FROM DUAL
UNION ALL SELECT 'COLUMN1' AS ID, 'NAME8' AS NAME FROM DUAL
)
--장점 : 정렬가능
SELECT
  ID,
  SUBSTR(XMLAGG(XMLELEMENT(A,',' || NAME) ORDER BY NAME).EXTRACT('//TEXT()'), 2) NAME
FROM TEMPLOGINLOG
GROUP BY ID;


--------------------------------------------------------------------------
[14] DECODE 조건

- DECODE(VALUE, IF1, THEN1, IF2, THEN2...,ELSE..) 형태로 사용
- VALUE 값이 IF1일 경우에 THEN1 값을 반환하고, VALUE 값이 IF2일 경우에는 THEN2 값을 반환
- DECODE 함수 안에 DECODE함수를 중첩으로 사용 가능

SELECT NVL(DECODE('2', '1', '1이다'),0) FROM DUAL;                         --조건 ELSE 없으면 NULL 반환       
SELECT NVL(DECODE(DECODE('2', '1', 'YES'),'YES','1이 맞음'),0) FROM DUAL;  --중복 가능.