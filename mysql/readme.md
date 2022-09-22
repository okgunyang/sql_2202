## 1. 데이터베이스의 시초__
    - 1960년부터 file의 한계를 극복하기 위한 시도가 본격적으로 시작됨
    - 거대기업과 엔지니어들이 누구나 쉽게 데이터를 정리정돈할 수 있는 전문적인 소프트웨어 고안하고자 함
    - 1970년 에드거 F. 테드는 IBM에서 일하는 동안 데이터베이스 관리를 위한 관계형 모델을 만듬
    - 테드의 이론에 기반해서 여러가지 관계형 데이터베이스 등장
　　　　　　　　<p><img src="https://user-images.githubusercontent.com/60066472/84589740-a15a3a00-ae6b-11ea-8209-64633047d7f1.PNG" width="300"></p>
- __Web + MySQL 동반성장__
    - 관계형 데이터베이스를 이용하면 데이터를 표의 형태로 정리정돈할 수 있고 정렬 검색과 같은 작업을 빠르고 편리하고 안전하게 할 수 있음
<br>

## 2. 데이터베이스의 목적
- __스프레드시트 / 데이터베이스의 공통점__
    - 데이터를 표로 표현해준다
    
- __스프레드시트 / 데이터베이스의 차이점__
    - 스프레드시트 : 마우스클릭을 통해 데이터 제어
    - 데이터베이스 : sql이라고 하는 컴퓨터 언어를 이용해서 데이터 제어
<br>

## 3. MySQL 설치
- __추천검색어__ : mysql community edition download

- [MySQL Server 다운로드](https://www.mysql.com/products/community/)
    - 학습에 필요한 MySQL Server만 다운로드
    - Download MySQL Community Edition » 클릭
    - MySQL Community Server 클릭
- [MySQL 통합 다운로드](https://dev.mysql.com/downloads/windows/installer/8.0.html)
    - 또는 workbench를 포함한 전체 한번에 설치 [(설치방법 참조)](https://velog.io/@secho/node.js-04-js%EC%97%90%EC%84%9C%EC%9D%98-DB%EC%97%B0%EB%8F%99-%EB%B0%8F-%ED%85%8C%EC%8A%A4%ED%8A%B8mysql-workbench-nodejs)
    - 설치 중 "No compatible server were found. You'll need to cancel this wizard and install one" 에러 메세지가 뜸
    - 설치방법 참조링크에 따라 윈도우 포맷하면서 없어진 [Visual Studio](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads) 를 다시 설치하니 해결됨
    <p><img src="https://user-images.githubusercontent.com/60066472/84591467-a0c8a000-ae79-11ea-9d23-6d1da64bc8e6.PNG" width="500"></p> 
    <p><img src="https://user-images.githubusercontent.com/60066472/84590181-4591b000-ae6f-11ea-9000-1f4914cbb49c.PNG" width="400"></p>
- 다운로드 후 사용법
    - 터미널에서 `cd /usr/local/mysql/bin/` 이동 및 MySQL 실행`./mysql -uroot -p` 
    - `mysql>`과 같은 프롬프트가 표시되고 있어야 정상적으로 작동하는 것
　　　<p><img src="https://user-images.githubusercontent.com/60066472/84590307-64447680-ae70-11ea-9bf8-67e2867a725c.jpg" width="500"></p>

<br>

## 4. MySQL의 구조
- __3가지 구성요소__: 표 > 스키마(데이터베이스) > 데이터베이스 서버

    - __표__ : 데이터를 기록하는 최종적인 곳
    - __스키마__ : 표들을 서로 그룹핑할 때 사용하는 일종의 폴더, 서로 연관된 표의 모음
    - __데이터베이스 서버__ : 스키마를 저장
 　   <p><img src="https://user-images.githubusercontent.com/60066472/84590055-33fbd880-ae6e-11ea-9d40-5100f85acfdb.jpg" width="700"></p> 
<br>

## 5. MySQL 서버 접속
- __데이터 베이스의 효용__

    - 자체적인 보안체계로 안전하게 데이터 보관
    - 자체적인 권한기능으로 여러 사용자의 권한을 차등적으로 구분
- __MySQL 실행__ `./mysql -uroot -p`
    - u옵션 : user 사용자 입력
    - p옵션 : password 비밀번호 입력 (바로 입력하면 비밀번호가 노출되니까 저기까지만 입력하고 엔터)
<br>

## 6. MySQL 스키마(schema)의 사용
- __추천검색어__ : mysql create database / how to show database list in mysql

- __데이터베이스 생성__
    - mysql> `CREATE DATABASE nameofdatabase;`
    - 이미 같은 이름의 데이터베이스가 있을 경우 다음과 같은 에러발생
        - ERROR 1007 (HY000): Can't create databbase 'nameofdatabase'; database exists
- __데이터베이스 삭제__
    - mysql> `DROP DATABASE nameofdatabase;`
- __데이터베이스 조회__
    - mysql> `SHOW DATBASES;`
- __데이터베이스 선택__
    - mysql> `USE nameofdatabase;`
- Query OK 가 뜨면 잘 되었다는 뜻
<br>

## 7. SQL과 테이블 구조
- __SQL의 뜻__
    - Structured 표로 정리되어 구조화 되어있다
    - Query 데이터베이스에게 '데이터를 넣어줘, 삭제해줘, 수정해줘, 읽어줘' 요청한다
    - Language 데이터베이스도 이해할 수 있고 사용자도 이해할 수 있는 언어로 요청한다
- __SQL의 특징__
    - 쉽다 : html과 함께 쉬운 언어로 꼽음
    - 중요하다: 관계형 데이터베이스에 쓰이는 표준화된 언어
- 표(table) 와 관련된 용어
   - 수직, column, 열 : 데이터의타입
   - 수평 row, record 행 : 데이터 하나하나
   <p><img src="https://user-images.githubusercontent.com/60066472/84590580-d4ec9280-ae72-11ea-8c73-ea536ab3d6a9.jpg" width="500"></p> 
<br>

## 8. MySQL 테이블의 생성
- __추천검색어__ : create table in mysql cheat sheet / mysql datatype number

- __MySQL 테이블 생성__
    - mysql> `CREATE TABLE nameoftable(<br>id INT(11) NOT NULL AUTO_INCREMENT,`<br>`title  , description, ;`<br>`id INT(11) NOT NULL AUTO_INCREMENT,`<br>`title VARCHAR(100) NOT NULL,`<br>`description TEXT NULL,`<br>`created DATETIME NOT NULL,`<br>`author VARCHAR(30) NULL,`<br>`profile VARCHAR(100) NULL,`<br>`PRIMARY KEY(id));`
    - __datatype(length)__: length는 데이터를 얼마까지 보여줄지 정함
    - __NOT NULL__: 항상 값이 있어야 함
    - __NULL__: 값이 없어도 됨
    - __AUTO_INCREMENT__: id 값 자동 1씩 증가(값이 중복되는 것 방지할 수 있음)
    - __PRIMARY KEY()__: 테이블의 어떤 컬럼이 메인 키인지 정함
- MySQL 기본 비밀번호를 쓰는 경우 발생하는 에러
    - ERROR 1820 (HY000): You must reset your password using ALTERUSER statement before executing this statement
    - mysql> `SET PASSWORD = PASSWORD('1234');`
    - mysql> `exit`
    - `./mysql -uroot -p` 새로운 비밀번호 입력
<br>

## 9. MySQL의 CRUD
- __데이터베이스의 본질__: CRUD

    - __항상 사용하는 기능__: Create Read 
    - __없을수도 있는 기능__: Update, Delete

<br>

## 10. SQL의 INSERT 구문
- __추천검색어__: mysql create row
    - mysql> `DESC nameoftable` 참조해서 작성
    - mysql> `INSERT INTO topic (title,description,created,author,profile) VALUES('MySQL','MySQL is ...',NOW(),'egoing','developer');`
    - PRIMARY KEY는 안적으면 알아서 1씩 증가함
    - __NOW()__: 현재시간
<br>

## 11. SQL의 SELECT 구문
- __추천검색어__: how to read row in mysql / mysql select syntax
    - mysql> `SELECT * FROM nameoftable;`
    - mysql> `SELECT id, title,created,author FROM topic WHERE author='egoing' ORDER BY id DESC LIMIT 2;`
    - WHERE author='egoing': 특정 값을 갖는 경우만 읽기
    - ORDER BY id DESC : 오름차/내림차 순으로 읽기
    - LIMIT 2 : 최대 2개만 보여주기
<br>

## 12. SQL의 UPDATE 구문
- __추천검색어__: mysql update
    - mysql> `UPDATE nameoftable SET description='newcontents...', title='Oracle' WHERE id=2;`
    - (주의) WHERE 조건을 빼먹으면 모든 값이 변경되어버림..!
<br>

## 13. SQL의 DELETE 구문
- __추천검색어__: sql delete in mysql
    - mysql> `DELETE FROM nameoftable WHERE id = 5`
    - (주의) WHERE 조건을 빼먹으면 모든 값이 삭제되어버림..!
<br>

## 14. 데이터베이스
　　<p><img src="https://user-images.githubusercontent.com/60066472/84616920-53dfda80-af08-11ea-9038-1d32909f02c9.jpg" width="500"></p>
<br>

## 15. 관계형 데이터베이스의 필요성
- __중복 제거를 가능하게 함__
    - 데이터의 중복이 발생할 경우, 특히 중복되는 데이터의 용량이 클 경우 데이터 처리과정이 비효율적이게 됨
    - 중복되는 부분을 또 하나의 테이블로 저장해서 중복을 없애면 효율을 높일 수 있음
    - 관계형 데이터베이스는 join기능으로 분산된 테이블을 결합하여 한눈에 볼 수 있게해줌
　　　<p><img src="https://user-images.githubusercontent.com/60066472/84620350-b938c900-af12-11ea-8204-199700e9b834.jpg" width="400"><img src="https://user-images.githubusercontent.com/60066472/84620354-bb028c80-af12-11ea-92d0-68001a9dcd3e.jpg" width="500"></p>
   
<br>

## 16. 테이블 분리하기
- __테이블 분리__
    - topic테이블 --(분리)--> topic테이블 + author테이블
- __테이블 이름 변경__
    - mysql> `RENAME TABLE topic TO topic_backup;`
<br>

## 17. 관계형 데이터베이스의 꽃 JOIN
- __Join 기능__

    - 독립적으로 분리되어 저장된 테이블을 결합하여 하나의 테이블로 볼 수 있는 기능
    - mysql> `SELECT * FROM topic LEFT JOIN author;`
        - (주의) ON 조건을 빼먹으면 syntax 에러 발생
    - mysql> `SELECT * FROM topic LEFT JOIN author ON topic.author_id = author.id;`
        - topic의 author_id 와 author의 id 값이 같을 때
    - mysql> `SELECT id,title,description,create,name,profile FROM topic LEFT JOIN author ON topic.author_id = author.id;`
        - (주의) "ERROR 1052(23000): Column 'id' in field list is ambiguous"
        - 두 테이블에 모두 id 칼럼이 있어서 어느 값을 기준으로할지 모호해서 에러 발생
    - mysql> `SELECT topic.id,title,description,create,name,profile FROM topic LEFT JOIN author ON topic.author_id = author.id;`
        - topic.id 로 어느테이블의 id칼럼인지 명시해서 해결
    - mysql> `SELECT topic.id AS topic_id,title,description,create,name,profile FROM topic LEFT JOIN author ON topic.author_id = author.id;`
        - 결과물에 topic.id를 topic_id로 표현해줌
　　<p><img src="https://user-images.githubusercontent.com/60066472/84621325-36653d80-af15-11ea-8e30-edafaa1479b7.jpg" width="500"></p>
<br>

## 18. 인터넷과 데이터베이스
- __인터넷__
    - 인터넷은 흩어져있는 컴퓨터가 연결되어 컴퓨터 간의 사회가 만들어지는 것
    - 인터넷이 동작하기 위해서 최소 컴퓨터 2대 필요함
    - 한대의 컴퓨터는 다른 컴퓨터에게 정보를 요청(client, 갑), 다른 컴퓨터는 요청한 정보를 응답해줌(server, 을)
    
- __Database Server__
    - 데이터베이스 서버에는 데이터가 저장되고, 데이터베이스 서버는 반드시 데이터베이스 클라이언트를 사용해야 함
    - MySQL을 설치하면 MySQL client와 MySQL server 두 개가 동시에 설치됨
    - 지금까지 데이터베이스 서버를 직접 다룬 것처럼 느껴지지만 사실 우리가 사용했던 것은 데이터베이스 클라이언트 중 하나
    - __MySQL Monitor__
        - MySQL 서버에 접속할 수 있도록 기본적으로 번들로써 제공하는 클라이언트
        - 명령어로 데이터베이스 서버를 제어하는 프로그램
　　　　　<p><img src="https://user-images.githubusercontent.com/60066472/84623197-bbeaec80-af19-11ea-8fbb-98ce8ae9af7a.jpg" width="400"></p>
    - MySQL은 내부적으로 인터넷을 활용할 수 있도록 고안된 시스템
    - 전세계에 있는 수많은 데이터베이스 클라이언트들이 하나의 데이터베이스 서버를 통해서 서로 데이터를 주고받고 관리하는 것이 가능해짐
- _"수학에서 사물은 이해하는 것이 아니라, 그저 익숙해지는 것일 뿐이다"_ - 폰 노이만
<br>

## 19. MySQL 클라이언트
- __MySQL Monitor__
    - 명령어 기반 클라이언트
    - 어디서든 실행할 수 있지만 명령어를 알아야 제어할 수 있다
- __MySQL Workbench__
    - GUI 기반 클라이언트
    - 명령어를 몰라도 클릭만으로 제어할 수 있다
- __추천검색어__: mysql client
　　<p><img src="https://user-images.githubusercontent.com/60066472/84625452-3b7aba80-af1e-11ea-9d28-2d53d5a83af4.PNG" width="400"></p>
출처: https://www.slant.co/topics/53/~best-mysql-client-applications-for-windows
<br>

## 20. MySQL Workbench
- MySQL 에서 공식적으로 제공하는 클라이언트 중 하나
- GUI 환경에서 엑셀을 다루듯 데이터베이스를 다룰 수 있음
- `./mysql -uroot -p -hlocalhost` // -h 서버에 해당되는 컴퓨터, 쓰지 않으면 기본으로 localhost

- __작성한 쿼리문 실행__
　　<p><img src="https://user-images.githubusercontent.com/60066472/84628025-e3928280-af22-11ea-83e8-ffcadfdb933b.jpg" width="600"></p>
  
- __스키마 생성__
　　<p><img src="https://user-images.githubusercontent.com/60066472/84628028-e55c4600-af22-11ea-8ec7-884cbbfdba03.jpg" width="600"></p>
  
- __현재 활성화되어있는 스키마에서 테이블 생성__
　　<p><img src="https://user-images.githubusercontent.com/60066472/84628183-23596a00-af23-11ea-9062-3e196323f720.jpg" width="600"></p>
  
- __데이터 설정__
    - PK: Primary Key
    - NN: Not Null
    - AI: Auto Increment
　<p><img src="https://user-images.githubusercontent.com/60066472/84628520-c14d3480-af23-11ea-8faf-fc2e2893874d.jpg" width="600"></p>
  
- __서버에 전송__
    - Apply 버튼을 눌러 생성된 sql문을 MySQL 서버에 전송함으로서 데이터베이스 서버를 제어함
<br>

## 21. 수업을 마치며
- __색인(index)__
    - 이미 뒤져놨기 때문에 빠르게 찾을 수 있다
    
- __모델링(modeling)__
    - 어떻게하면 데이터의 중복없이 테이블의 효율적으로 설계할 것인가
    
- __백업(backup)__
    - 하드디스크는 언제 고장날지 모르지만 반드시 고장난다
    
- __클라우드(cloud)__
    - 아마존, 네이버 같은 큰 회사들이 운영하고 있는 인프라 위에 있는 컴퓨터를 임대하여 사용하는 것
    - 추천키워드: AWS RDS, Google Cloud SQL for MySQL, AZURE Database for MySQL
    
- __프로그래밍__
    - 프로그래밍 언어로 데이터베이스 서버에 sql을 던져줄 수 있는 방법만 알면 자신의 웹사이트에 데이터 분석과 같은 것을 수행할 수 있음
    - 추천키워드: Python mysql api, PHP mysql api, Java mysql api, ...




# MySQL_기본 문법정리 #1 CREATE

---

# 데이터베이스 생성 및 사용하기

## SHOW DATABASESE;

현재 서버에 어떤 데이터베이스가 있는지 확인합니다.

```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)
```

<br />

## CREATE DATABASES 데이터베이스_이름;

새로운 데이터 베이스를 생성할수 있습니다.

```
mysql> create databases testsql;
mysql> show databases;
```

위와 같이 명령어를 실행하면 아래와 같이 `testsql`이 생성 되었습니다.

```
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testsql            |
+--------------------+
5 rows in set (0.00 sec)
```

<br />

## USE 데이터베이스_이름;

use는 사용할 데이터베이스를 지정합니다. 데이터베이스를 이용해 테이블을 만들거나 수정하거나 삭제 하는 등의 작업을 하려면 use명령어를 꼭 사용해야 합니다.

```
mysql> use testsql
Database changed
```

<br />

---

# 테이블 생성 및 조회하기

## CREATE TABLE 테이블이름(정보);

USE 를 이용해 데이터베이스를 선택했다면 해당 데이터베이스의 테이블을 생성할수 있습니다.

```
mysql> create table user(
    -> id int(11) not null auto_increment,
    -> title varchar(100) not null,
    -> description text null,
    -> created datetime not null,
    -> author varchar(15) null,
    -> profile varchar(200) null,
    -> primary key(id)
    -> );
Query OK, 0 rows affected, 1 warning (0.01 sec)
```

1. id값을 설정할때 데이터 타입 넘버를 참고 하길 (무난하게 INT)
2. NOT NULL은 값이 없는것을 허용하지 않겠다란 뜻입니다.
3. AUTO_INCREMENT는 자동으로 1씩 증가하고 중복되지 않은 식별자를 갖게 됩니다.
4. VARCHAR(size)는 글자제한을 의미합니다.(255까지 가능)  

데이터 타입을 참고하면서 작성하는 것을 권장합니다. [데이터타입참고](http://www.incodom.kr/DB_-_%EB%8D%B0%EC%9D%B4%ED%84%B0_%ED%83%80%EC%9E%85/MYSQL)

<br />

## DESCRIBE 테이블이름;

만약 위에 생성된 테이블의 결과를 확인하고 싶으면 아래와 같이 입력하면 됩니다.

```
mysql> DESCRIBE user;
```

아래와 같이 위에 작성했던 테이블에 대한 정보가 나옵니다.

```
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| title       | varchar(100) | NO   |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| created     | datetime     | NO   |     | NULL    |                |
| author      | varchar(15)  | YES  |     | NULL    |                |
| profile     | varchar(200) | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
6 rows in set (0.01 sec)
```

<br />

---

# 테이블 내용 삽입하기 및 선택하기(조회)

## INSERT INTO 테이블이름(field정보) VALUES(해당하는field내용)

INSERT INTO 테이블이름() VALUES()는 해당 테이블에 대한 정보를 입력할수 있습니다. 테이블 이름과 벨류의 문자열 순으로 정보가 나열 됩니다.

```
mysql> insert into user(title,description,created,author,profile) 
values('joy','coding',now(),'jangh','developer');
Query OK, 1 row affected (0.00 sec)
```

<br />

## select * from 테이블이름;

위에 insert into로 입력한 정보를 선택해서 조회할수 있습니다. *은 전체를 조회할수 있습니다.

```
mysql> select * from user;
```

아래와 같이 위에 작성했던 테이블에 대한 정보가 나옵니다.

```
+----+-------+-------------+---------------------+--------+-----------+
| id | title | description | created             | author | profile   |
+----+-------+-------------+---------------------+--------+-----------+
|  1 | joy   | coding      | 2021-07-23 01:03:26 | jangh  | developer |
+----+-------+-------------+---------------------+--------+-----------+
1 row in set (0.00 sec)
```

번외 적으로 데이터를 하나 더 추가하고 싶으면 INSERT INTO를 다시 활용해서 작성하면 됩니다.

```
mysql> insert into user (title,description,created,author,profile) 
values('happy','coco',now(),'teemo','developer');
Query OK, 1 row affected (0.00 sec)
```

위와같이 정보를 추가하고 select * 을 사용해서 전체 정보를 선택합니다.

```
mysql> select * from user;
+----+-------+-------------+---------------------+--------+-----------+
| id | title | description | created             | author | profile   |
+----+-------+-------------+---------------------+--------+-----------+
|  1 | joy   | coding      | 2021-07-23 01:03:26 | jangh  | developer |
|  2 | happy | coco        | 2021-07-23 01:05:18 | teemo  | developer |
+----+-------+-------------+---------------------+--------+-----------+
2 rows in set (0.00 sec)
```




# MySQL_기본 문법정리 #2 READ UPDATE DELETE

---

# SELECT 기본 문법

## SELECT * from 테이블이름

문법정리#1에 이어서 SELECT * 는 전체 정보를 선택해서 가져올수 있습니다.

```
mysql> select * from user;
+----+---------+-------------+---------------------+--------+-----------+
| id | title   | description | created             | author | profile   |
+----+---------+-------------+---------------------+--------+-----------+
|  1 | joy     | coding      | 2021-07-23 01:03:26 | jangh  | developer |
|  2 | happy   | coco        | 2021-07-23 01:05:18 | teemo  | developer |
|  3 | art     | cat         | 2021-07-23 01:46:20 | toto   | md        |
|  4 | love    | opa         | 2021-07-23 01:47:40 | puma   | teacher   |
|  5 | fashion | sexy        | 2021-07-23 01:49:15 | dior   | designer  |
+----+---------+-------------+---------------------+--------+-----------+
5 rows in set (0.00 sec)
```

<br />

## SELECT (원하는 Field) from 테이블이름

SELECT에서 원하는 값만 정보를 불러올수 있습니다. 예를들어 description과 profile을 제외한 field를 가져오려면 아래와 같습니다.

```
mysql> select id,title,created,author from user;
+----+---------+---------------------+--------+
| id | title   | created             | author |
+----+---------+---------------------+--------+
|  1 | joy     | 2021-07-23 01:03:26 | jangh  |
|  2 | happy   | 2021-07-23 01:05:18 | teemo  |
|  3 | art     | 2021-07-23 01:46:20 | toto   |
|  4 | love    | 2021-07-23 01:47:40 | puma   |
|  5 | fashion | 2021-07-23 01:49:15 | dior   |
+----+---------+---------------------+--------+
5 rows in set (0.00 sec)
```

<br />

## SELECT (원하는 Field) from 테이블이름 WHERE FIELD='해당정보'

추가적으로 WHERE옆에 field = '해당정보'를 입력하면 해당정보에 대한 세부적인 내용을 출력할수 있습니다. 예를들어 field는 title이고 title에서 'happy'라는 정보를 출력하고 싶을떄 아래와 같습니다.

```
mysql> select id,title,created,author from user where title='happy';
+----+-------+---------------------+--------+
| id | title | created             | author |
+----+-------+---------------------+--------+
|  2 | happy | 2021-07-23 01:05:18 | teemo  |
+----+-------+---------------------+--------+
1 row in set (0.00 sec)
```

<br />

## SELECT (원하는 Field) from 테이블이름 ORDER BY 기준(숫자,아이디) DESC;

OREDER BY id DESC;는 id값을 기준으로 정렬순서를 역전시킬수 있습니다(내림차순)

```
mysql> select id,title,created,author from user order by id desc;
+----+---------+---------------------+--------+
| id | title   | created             | author |
+----+---------+---------------------+--------+
|  5 | fashion | 2021-07-23 01:49:15 | dior   |
|  4 | love    | 2021-07-23 01:47:40 | puma   |
|  3 | art     | 2021-07-23 01:46:20 | toto   |
|  2 | happy   | 2021-07-23 01:05:18 | teemo  |
|  1 | joy     | 2021-07-23 01:03:26 | jangh  |
+----+---------+---------------------+--------+
5 rows in set (0.00 sec)
```

만약에 여기서 내림차순 기준으로 3개의 데이터만 볼수있게 제한을 걸고 싶으면 옆에 `LIMIT 3;`을 입력하면 됩니다. (광범위한 데이터를 제한 걸어서 효율적으로 관리할수 있습니다.)

```
mysql> select id,title,created,author from user order by id desc limit 3;
+----+---------+---------------------+--------+
| id | title   | created             | author |
+----+---------+---------------------+--------+
|  5 | fashion | 2021-07-23 01:49:15 | dior   |
|  4 | love    | 2021-07-23 01:47:40 | puma   |
|  3 | art     | 2021-07-23 01:46:20 | toto   |
+----+---------+---------------------+--------+
3 rows in set (0.00 sec)
```

<br />

## UPDATE 테이블 SET (원하는 Field) WHERE (아이디값)

UPDATE를 통해 해당 아이디에 있는 Field값을 수정할수 있습니다. 주의할점은 where문을 꼭!! 기입하기

```
mysql> update user set title='mysql',author='kakao' where id=2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from user;
+----+---------+-------------+---------------------+--------+-----------+
| id | title   | description | created             | author | profile   |
+----+---------+-------------+---------------------+--------+-----------+
|  1 | joy     | coding      | 2021-07-23 01:03:26 | jangh  | developer |
|  2 | mysql   | coco        | 2021-07-23 01:05:18 | kakao  | developer |
|  3 | art     | cat         | 2021-07-23 01:46:20 | toto   | md        |
|  4 | love    | opa         | 2021-07-23 01:47:40 | puma   | teacher   |
|  5 | fashion | sexy        | 2021-07-23 01:49:15 | dior   | designer  |
+----+---------+-------------+---------------------+--------+-----------+
5 rows in set (0.00 sec)
```

<br />

## DELETE from 테이블 WHERE (삭제하고싶은값)

delete는 from ... where 은 원치않은 값을 삭제할수 있습니다. 만약 위에 있는 테이블에서 id값이 3인 정보를 삭제하고 싶으면 아래와 같습니다.

```
mysql> delete from user where id=3;
Query OK, 1 row affected (0.00 sec)

mysql> select * from user;
+----+---------+-------------+---------------------+--------+-----------+
| id | title   | description | created             | author | profile   |
+----+---------+-------------+---------------------+--------+-----------+
|  1 | joy     | coding      | 2021-07-23 01:03:26 | jangh  | developer |
|  2 | mysql   | coco        | 2021-07-23 01:05:18 | kakao  | developer |
|  4 | love    | opa         | 2021-07-23 01:47:40 | puma   | teacher   |
|  5 | fashion | sexy        | 2021-07-23 01:49:15 | dior   | designer  |
+----+---------+-------------+---------------------+--------+-----------+
4 rows in set (0.00 sec)
```





# MySQL_ JOIN

---

## JOIN

조인은 관계형 데이터 베이스에서 자주 쓰이면서 중요한 쿼리문중 하나입니다. 즉 각각의 테이블을 JOIN을 통해서 관계를 가질수 있게 합니다.

<br />

## INNER JOIN ON

아래는 INNER JOIN의 기본 구조입니다.

```
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
```

table1과 table2를 합친다란 뜻입니다. 중요한 부분은 ON입니다. ON은 관계의 기준을 말합니다. 즉 table1의 컬럼이름과 table2의 컬럼이름을 기준으로 관계를 형성하고 합친다 라는 뜻으로 이해하면 됩니다.

<br />

## JOIN image

아래 이미지는 JOIN에 대한 이미지입니다. 5가지가 있지만 순서만 바꿔서 해결할수 있기 때문에 왼쪽 3개만 알아도 충분히 JOIN문을 사용할수 있습니다.

![](https://github.dev/leejanghe/Today-I-Learned/blob/master/MySQL/image/join.png)