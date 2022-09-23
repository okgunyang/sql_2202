# SQLite

## 1. 데이터베이스 작성
```sql
C:\sqlite>sqlite3 DB파일명.db
(확장자는 없어도 되고 아무거나 가능하다.)
ex) C:\sqlite>sqlite3 dbTest.db
```

## 2. 테이블 작성
```sql
정수값、2컬럼의 경우 CREATE TABLE 테이블명 컬럼1 INTEGER, 컬럼2 VARCHAR(정수));
ex) CREATE TABLE db_list (id INTEGER, name VARCHAR(16));
```

## 3. 레코드를 추가
```sql
INSERT INTO 테이블명 (컬럼1, 컬럼2) VALUES(값1, 값2);
ex) INSERT INTO db_list (id, name) VALUES(1, "PC");
```

## 4. 테이블의 레코드를 참조
```sql
SELECT 컬럼명 FROM 테이블명
ex) SELECT * FROM db_list;
```

## 5. 조건식으로 데이터 검색
```sql
SELECT 컬럼명 FROM 테이블명 WHERE 조건식;
ex) SELECT * FROM db_list WHERE id=3;
```

## 6. 레코드 정렬
```sql
SELECT 컬럼명 FROM 테이블명 ORDER BY 컬럼명;
ex) SELECT * FROM db_list ORDER BY id;
```

## 7. 참조하는 레코드 수를 지정
```sql
SELECT 컬럼명 FROM 테이블명 LIMIT 수;
ex) SELECT * FROM db_list LIMIT 3;
```

## 8. 레코드 변경
```sql
UPDATE 테이블명 SET 컬럼명=값 WHERE 조건식;
ex) UPDATE db_list SET name="Printer" WHERE id=1;
```

## 9. 레코드 삭제
```sql
DELETE FROM 테이블명 WHERE 조건식;
ex) DELETE FROM db_list WHERE id=5;
```

## 10. 레코드의 삭제
```sql
DELETE FROM 테이블명 [WHERE 조건식];
ex) DELETE FROM db_list;
```

## 11. 파일로부터 데이터 입력
```sql
.import! 파일명 테이블명;
ex) .import! ./db.txt new_db;
```

## 12. 백업 등、같은 구성의 테이블 작성
```sql
CREATE TABLE 새로운테이블명 AS SELECT * FROM 기존테이블명;
ex) CREATE TABLE new_db AS SELECT * FROM db_list;
```

## 13. 테이블명 변경
```sql
ALTER TABLE 현재테이블명 RENAME TO 새로운테이블명;
ex) ALTER TABLE db_list RENAME TO new_tb;
```

## 14. 테이블 삭제
```sql
DROP TABLE 테이블명;
ex) DROP TABLE db_list;
```

## 15. 컬럼추가
```sql
ALTER TABLE 테이블명 ADD 추가컬럼명 테이터형;
ex) ALTER TABLE db_list ADD price INTEGER;
```

## 16. 사용중의 데이터베이스 표시
```sql
. database
```

## 17. 작성된 테이블명 표시
```sql
. table
```

## 18. 도움말 표시
```sql
. help
```

## 19. 종료
```sql
. quit
```