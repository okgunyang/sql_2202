# PostgreSQL

## 0. 접속 명령
```sql
psql -U postgres -d postgres
```

## 1. 사용자 목록 조회
```sql
\du
또는
select * from pg_user;
```

## 2. 사용자 생성
```sql
create user 아이디 with encrypted password '비밀번호';
```

## 3. 사용자 비밀번호 변경
```sql
alter user 아이디 with password '비밀번호';
```

## 4. DB 생성 및 소유주 설정
```sql
create database DB명 owner 아이디;
```


## 5. 데이터베이스 목록 조회
```sql
\l
```

## 6. 모든 테이블 목록 조회
```sql
select * from pg_tables where tableowner = 'paas'
또는
\d
```

## 7. DB 백업
```sql
pg_dump 디비명 > 파일명
```

## 8. DB 복원
```sql
psql -f 파일명 디비명
```

## 9. psql 도움말
```sql
\?
```

## 10. sql 명령 목록
```sql
\h
```

## 11. 특정 명령 문법
```sql
\h 명령
```


## 12. 테이블 작성
```sql
CREATE TABLE 테이블명 ( [
  컬럼명1 데이터타입 [제약조건]
  컬럼명2 데이터타입 [제약조건]
  ...
  [전체제약조건]
  …
] )
ex)
CREATE TABLE films (
    code        char(5) NOT NULL,
    title       varchar(40),
    did         integer,
    date_prod   date,
    kind        varchar(10),
    len         interval hour to minute,
    CONSTRAINT production UNIQUE(date_prod)
);
```

## 13. 테이블 변경
```sql
ALTER TABLE 테이블명 [ADD|DROP|ALTER|SET|RENAME] 컬럼명 데이터타입 [제약조건];
```
###    - 컬럼 추가
```sql
    ALTER TABLE distributors ADD COLUMN address varchar(50);
```

###    - 컬럼명 변경
```sql
    ALTER TABLE distributors RENAME COLUMN address TO city;
```

###    - 제약조건 삭제
```sql
    ALTER TABLE distributors DROP CONSTRAINT zipchk;
```

###    - 테이블 공간 이동
```sql
    ALTER TABLE distributors SET TABLESPACE fasttablespace;
```

###    - 컬럼 타입 변경
```sql
    ALTER TABLE distributors ALTER COLUMN address TYPE varchar(80), ALTER COLUMN name TYPE varchar(100);
```


## 14. 테이블 삭제
```sql
DROP TABLE [IF EXISTS] 테이블명 [, ...] [ CASCADE | RESTRICT ]
ex) DROP TABLE films, distributors;
```
    - CASCADE : 연쇄삭제로 연관되어 있는 테이블도 같이 삭제
    - RESTRICT : 연관되어 있으면 해당 삭제할 테이블을 삭제하지 않음


## 15. 레코드 추가(삽입)
```sql
INSERT INTO 테이블명 (컬럼1, 컬럼2,...) VALUES(값1, 값2,...);
ex) INSERT INTO products (product_no, name) VALUES (1, 'Cheese');
```

## 16. 레코드 변경
```sql
UPDATE 테이블명 SET 컬럼명=값 [WHERE 조건식];
ex) UPDATE products SET price = price * 1.10;
```

## 17. 레코드 삭제
```sql
DELETE FROM 테이블명 [WHERE 조건식];
DELETE FROM products WHERE price <= 100;
```

## 18. 레코드 검색
```sql
SELECT [ ALL | DISTINCT [ ON ( 컬럼명 [, ...] ) ] ]
    [ * | 컬럼명 [ [ AS ] 알리아스 ] [, ...] ]
    [ FROM 테이블명 [, ...] ]
    [ WHERE 조건식 ]
    [ GROUP BY 컬럼명 [, ...] ]
    [ HAVING 조건식 [, ...] ]
    [ { UNION | INTERSECT | EXCEPT } [ ALL | DISTINCT ] select ]
    [ ORDER BY 컬럼명 [ ASC | DESC | USING operator ] [ NULLS { FIRST | LAST } ] [, ...] 
    [ LIMIT { 개수 | ALL } ]
    [ OFFSET 시작위치 [ ROW | ROWS ] ]
```
    - Weather_reports 테이블에서 time, report, location컬럼을 추출합니다. 이때 location컬럼에서 중복되는 컬럼은 제거합니다. 마지막으로 행을 정렬할 때 location은 오름차순, time은 내림차순으로 정렬합니다.
```sql
ex1) SELECT DISTINCT ON (location) location, time, report
  FROM weather_reports
 ORDER BY location, time DESC;
```

###    - Student 테이블에서 student_no가 5인 사람의 모든 정보를 출력합니다.
```sql
ex2) SELECT * 
  FROM student 
 WHERE student_no= 5;
```

###    - films테이블에서 kind컬럼이 같은 것끼리 그룹을 짓습니다. 그리고 len컬럼의 총합을 total로 지정합니다. 그리고 sum(len)의 값이 5시간보다 작은 것들을 선택해서 출력합니다.
```sql
ex3) SELECT kind, sum(len) AS total
  FROM films
 GROUP BY kind
HAVING sum(len) < interval '5 hours';
```

###    - Distributors테이블에서 name이 W로 시작하는 사람을 추출하고 actors테이블에서 name이 W로 시작하는 사람을 추출하여 함께 출력합니다.
```sql
ex4) SELECT distributors.name
  FROM distributors
 WHERE distributors.name LIKE 'W%'
 UNION
SELECT actors.name
  FROM actors
 WHERE actors.name LIKE 'W%';
```


## 19. 조인
```sql
SELECT T1.컬럼명 [AS 알리아스], T2.컬럼명 [AS 알리아스] FROM 테이블1 T1
[INNER] JOIN | LEFT [OUTER] JOIN | RIGHT [OUTER] JOIN | FULL [OUTER] JOIN | CROSS JOIN
테이블2 T2 ON T1.컬럼명=T2.컬럼명
[WHERE 조건] [GROUP BY 컬럼명 ASC | DESC] [ORDER BY 컬럼명]
```

###     - 예시 테이블 만들기 및 레코드 추가
```sql
CREATE TABLE T1(
    num integer PRIMARY KEY,
    name varchar(5)
);
CREATE TABLE T2(
    num integer PRIMARY KEY,
    value varchar(5)
);
INSERT INTO T1 VALUES(1, 'a');
INSERT INTO T1 VALUES(2, 'b');
INSERT INTO T1 VALUES(3, 'c');
INSERT INTO T2 VALUES(1, 'aaa');
INSERT INTO T2 VALUES(3, 'bbb');
INSERT INTO T2 VALUES(5, 'ccc');
```

```
num | name      //T1테이블
-----+------
   1 | a
   2 | b
   3 | c
num | value     //T2테이블
-----+-------
   1 | xxx
   3 | yyy
   5 | zzz
```

###    - T1, T2테이블의 INNER JOIN
```sql
SELECT * FROM T1 INNER JOIN T2 ON T1.num = T2.num;
```
```
 num | name | num | value
 -----+-------+------+-------
   1 | a     |    1 | xxx
   3 | c     |    3 | yyy
```

###    - T1, T2테이블의 LEFT OUTER JOIN
```sql
SELECT * FROM T1 LEFT JOIN T2 USING (num);
```
```
 num | name | value
-----+------+-------
   1 | a    | xxx
   2 | b    |
   3 | c    | yyy
```

###    - T1, T2테이블의 RIGHT OUTER JOIN
```sql
SELECT * FROM T1 RIGHT JOIN T2 ON T1.num =T2.num;
```
```
 num | name | num | value
-----+------+-----+-------
   1 | a    |   1 | xxx
   3 | c    |   3 | yyy
     |      |   5 | zzz
```

###    - T1, T2테이블의 FULL OUTER JOIN
```sql
SELECT * 
  FROM T1 
  FULL OUTER JOIN T2 
    ON T1.num = T2.num;
```
```
num | name | num | value
-----+------+-----+-------
   1 | a    |   1 | xxx
   2 | b    |     |
   3 | c    |   3 | yyy
     |      |   5 | zzz
```

###    - T1, T2테이블의 CROSS JOIN
```sql
SELECT * 
  FROM t1 
 CROSS JOIN t2;
```
```
num | name | num | value
 -----+-------+------+-------
   1 | a     |    1 | xxx
   1 | a     |    3 | yyy
   1 | a     |    5 | zzz
   2 | b     |    1 | xxx
   2 | b     |    3 | yyy
   2 | b     |    5 | zzz
   3 | c     |    1 | xxx
   3 | c     |    3 | yyy
   3 | c     |    5 | zzz
```


## 20. 종료
```sql
\q
```