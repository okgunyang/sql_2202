# MariaDB

## 서문
- MMORPG 같은 대형 게임에서도 MySQL을 사용하려는 움직임들을 보이고 있다.
- 구글과 타오바오에서 MariaDB의 소스코드에 기여하기 시작했다.
- MariaDB는 쉽게 사라지지 않을 것이다.

## 1.1 MariaDB란?
- MariaDB는 MySQL 커뮤니티 코드 베이스를 이용해서 탄생했다.
- MariaDB는 Monty Program AB에 의해서 다듬어진 MySQL이다.
- MariaDB는 오픈소스이다. 그리고 계속 오픈소스로 남기를 바란다.

## 1.2.1 MariaDB와 MySQL 그리고 PerconaServer
- MariaDB를 이해하기 위해서는 먼저 MySQL과 PerconaServer(퍼코나서버)를 알아야한다.
- PerconaServer는 Percona라는 회사에서 MySQL서버의 소스코드를 기반으로 만든 MySQL 서버의 또 다른 포크(fork) 버전이다.
- MariaDB는 PerconaServer의 XtraDB 스토리지 엔진을 배포 버전에 포함하고 있다.
- XtraDB는 MySQL 서버의 InnoDB의 소스코드를 개선해서 만든 새로운 스토리지 엔진이다.

## 1.2.2 공통점
- MariaDB의 실행 프로그램들과 유틸리티는 모두 MySQL과 이름이 동일하며, 호환된다.
- 모든 클라이언트 API와 통신 프로토콜은 서로 호환된다.
- MariaDB 5.x 버전에서는 사실 개발자가 MySQL 5.x 서버와 크게 구분해서 생각할 필요가 없을 정도다.
- MariaDB 10.x 버전부터는 개발자에게 노출되는 부분도 편의성과 효율성 그리고 성능과 관련해서 많은 부분들이 개선 되었다.

## 1.2.3 차이점
- MySQL의 이중 라이선스(커뮤니티와 엔터프라이즈 라이선스) 정책을 생각하면 뭔가 큰 차이가 있어 보이기도 한다.
- MariaDB가 MEMORY 스토리지 엔진의 가변 데이터 타입에 대해 지원을 언급하고 있지만 10.0 버전에서는 구현되지 않았다는 것이 확인되었다.
- MariaDB는 기본 내부 임시 테이블용 스토리지 엔진은 Aria를 사용한다. 이는 MySQL 기본엔진 MyISAM에 비해서는 빠른 처리를 보장한다.
- MariaDB는 기본 트랜젝션 지원 스토리지 엔진으로 XtraDB를 사용한다. 물론 InnoDB도 사용할 수 있다.
- 내부적으로 사용하는 스토리지 엔진이 다르기 때문에 튜닝을 해야하는 옵션들이 서로 차이가 있고, 장단점이 다르다고 볼 수 있다.
- MariaDB는 스레드 풀을 지원한다. MySQL은 엔터프라이즈 버전에서만 지원한다.
- MariaDB의 XtraDB에서는 SSD 기반의 디스크 I/O를 위한 블록 플러시 알고리즘을 지원한다.
- MariaDB는 서브 쿼리와 조인 쿼리 최적화를 지원한다.
- MariaDB는 멀티 스레드 리플리케이션을 지원한다.
- MariaDB는 롤(ROLE) 기반의 권한 관리를 지원한다.
- MariaDB는 가상 칼럼과 동적 칼럼을 지원한다.

## 1.2.4 버전별 호환성
- MariaDB 5.1 5.2 5.3은 MySQL 5.1과 호환된다.
- MariaDB 5.5 10.0은 MySQL 5.5와 호환된다.

## 1.2.5 성능 비교
- 누가 더 빠르다라는 이야기를 쉽게 할 수 있는 사람은 거의 없을 것이다.
- 누가 테스트를 했는지 어떤 시나리오로 벤치마크를 했는지에 따라서 결과가 서로 달라진다.
- 직접 우리 회사 서비스 모델로 테스트해 보고 그 결과를 비교해보는 것이 최선이라고 볼 수 있다.

## 1.2.6 MariaDB가 MySQL을 대체하게 될까?
- 정답은 알 수가 없다. 단지 저자의 개인적인 생각으로는 MariaDB는 아마도 지금보다는 더 넓은 사용자층을 가지게 될 것으로 보인다.
- 구글에서 MariaDB 오픈소스를 지원하겠다고 선언한 상황이어서, 앞으로 MariaDB가 쉽게 사라지지는 않을 것이다.
- 다만 오라클이 더 패쇄적으로 엔터프라이즈 버전의 기능과 성능에만 집중할지, 커뮤니티 버전을 더 활성화시킬지는 두고 볼 일이다.

## 1.2.7 MariaDB와 MySQL 선택
- DBMS를 선택할 때 가장 크게 고려해야 할 부분은 DBMS 성능, 안정성, DBMS 기능과 유틸리티, 기술 지원이다.
- 안정성 문제에 있어서 MySQL 서버의 대응은 조금 문제가 있어 보인다.
- MySQL 엔터프라이즈 버전과 MariaDB의 기능을 비교하자면 MariaDB가 무료로 기능을 사용 할 수 있는 부분이 많다.
- 스레드 풀, 백업 기능, 메모리 사용량 체크등 소소해 보이지만 꼭 필요한 기능은 MariaDB에서 더 많이 제공 하고 있다.
- 기술 지원에 있어서도 MariaDB가 오라클에 비해 대응이 미흡하지 않다.

## 2.2.1 윈도우 버전 설치
- XtraDB는 윈도우 버전을 지원하지 않는다. XtraDB 스토리지 엔진을 사용하려면 리눅스 계열의 운영체제에서 MariaDB를 설치해야 한다.

## 2.3 업그레이드
- 오래된 버전의 MySQL 서버에서 mysqldump로 데이터 백업
```shell
shell> mysqldump -u root -p --all-databases > backup.dump
```
- 새로운 버전의 MariaDB 설치 후 기동
- mysqldump로 백업된 덤프 파일을 새로운 버전의 MariaDB에서 실행
```shell
shell> mysql -u root -p < backup.dump
```
- 새로운 버전의 MariaDB에서 적재가 완료되면 mysql_upgrade 명령 실행
```shell
shell> mysql_upgrade --verbose
```

## 3.1.1 리눅스에서 MariaDB 서버의 시작과 종료
- MariaDB 서버의 InnoDB는 종료되었다가 나중에 다시 시작될 때 트랜잭션 로그를 이용해서 자동 복구가 되긴 하지만 "kill -9"로 MariaDB를 종료하는 것은 좋지 않은 방법이다.
- mysqladmin을 이용하거나 service mysql stop 명령을 이용하도록 하자.

## 3.2.1 서버 로그인 및 버전 확인
- MariaDB 서버가 로컬 컴퓨터인 경우에는 **-h 127.0.0.1** 옵션은 입력하지 않아도 된다.
- 기본 포트인 3306을 사용하는 경우 **-P 3306** 옵션은 입력하지 않아도 된다.
- mysql 클라이언트 프로그램에서 **\s** 또는 **status** 를 입력하면 서버의 버전이나 현재 클라이언트 접속 계정 그리고 문자셋 변환에 관련된 정보를 출력해준다.

## 3.2.2 mysql 클라이언트 프로그램 옵션
- **--auto-rehash** 테이블이나 칼럼명을 입력할 때, **TAB** 키를 이용해서 자동 완성이 가능하도록 해 준다.
- **--batch** 클라이언트 프로그램을 대화형(Interactive)모드가 아닌 배치 모드로 실행한다.
- **--execute, -e** 클라이언트 프로그램이 서버에 접속됨과 동시에 파라미터로 주어진 문장을 실행한다. 비대화형 모드로 사용된다.
- **--skip-column-names, -N** 실행된 쿼리의 결과에서 칼럼 이름을 출력하지 않고 버린다.
- **--safe-updates, -U** 안전모드로 실행한다. 안전모드는 INSERT를 제외한 SELECT나 UPDATE 그리고 DELETE쿼리가 인덱스를 사용하지 못하고 풀 테이블 스캔을 해야할 때, 자동으로 쿼리 실행을 멈추는 모드를 의미한다. 즉 안전모드는 중요한 테이블에 대해서 작업하는 경우 실수를 막아 주는 역할을 하는 것이다.
```shell
## --batch 모드로 --skip-column-names와 함께 --execute 옵션으로 mysql 클라이언트 실행
shell> mysql -u root -p -D test --batch --skip-column-names --execute="SELECT * FROM table"

1     Matt
```

## 3.3.1 MariaDB의 사용자 계정 인식과 권한
- MySQL과 MariaDB의 유저 정보는 다른 RDMBS와는 조금은 차이가 있는데, 단순히 유저의 이름 뿐만 아니라 유저가 접속을 시도하는 클라이언트(클라이언트가 실행된 호스트 명이나 도메인 또는 IP주소)도 인증의 일부가 된다는 것이다.
- 계정을 언급할 때에는 항상 아이디와 호스트를 함께 명시해야 한다.
- 항상 권한이나 계정 정보에 있어서 MariaDB는 범위가 가장 작은 것을 먼저 선택한다.
```
'svc_id'@'192.168.0.10' (이 계정의 비밀번호는 123)
'svc_id'@'%' (이 계정의 비밀번호는 abc)

위와 같이 중첩 된다면 IP가 '192.168.0.10'의 'svc_id'의 사용자는 비밀번호 'abc'로 접속할 수 없다.
```
- MariaDB 10.0 버전부터는 권한들을 묶어서 권한 그룹(Role)을 생성하고, 특정 사용자에게 권한 그룹을 부여하는 것도 가능하다.
- 권한은 영향력의 범위에 따라서 서버 전체와 데이터베이스 및 테이블 그리고 스토어드 프로그램 관련 권한으로 나누어 볼 수 있다.
- 칼럼 레벨까지도 권한을 부여할 수 있지만 이 정도까지의 권한은 사실 그다지 사용되지 않고, 사용시 성능상 좋지 않다고 알려져 있다.
- SUPER 권한은 유닉스의 root 사용자와 같은 권한을 의미하지는 않지만, 특정한 상황에서는 제한을 넘어서서 뭔가 작업을 할 수 있는 권한이다. 즉 read_only 설정으로 인해서 읽기 전용으로 설정 된 MySQL 서버에서 데이터를 변경할 수 있으며, max_connections 제한으로 더 이상 커넥션을 생성할 수 없는 상황에서도 SUPER 권한을 가진 사용자에 대해서 1개의 커넥션을 더 생성할 수 있다.

## 3.3.2 MariaDB의 기본 사용자
- 초기에 생성되는 사용자와 데이터베이스는 보안적인 문제들을 야기할 수 있으므로, 이런 문제들을 없애려면 **mysql_secure_installation** 유틸리티를 이용해서 초기 데이터베이스를 생성하면 된다.

## 3.3.3 MariaDB의 기본 데이터베이스
- 기본적으로 생성되어 있는 데이터베이스는 **information_schema**, **mysql**, **performance_schema**, **test** 이다.
- mysql 데이터베이스는 MariaDB 서버의 사용자 인증 정보나 스토어드 프로그램과 이벤트 정보 그리고 타임 존이나 복제에 관련된 정보들이 저장된다.
- mysql 데이터베이스는 관리자 이외의 사용자가 접근하도록 허용해서는 안되며, 가능하면 직접 데이터를 변경해서는 안된다.
- information_schema 데이터베이스의 테이블들은 실제 디스크에 데이터 파일을 가진 테이블이 아니라 MariaDB 서버가 시작되면서 모든 데이터베이스와 테이블 그리고 칼럼의 정보와 스토어드 프로그램과 같은 메타 정보들을 메모리에 읽어들이는데, 그 정보들을 테이블 형태로 접근할 수 있도록 해주는 테이터베이스이다.
- information_schema 데이터베이스의 테이블들을 잘 이용하면 MariaDB 서버의 스키마 정보와 스토어드 프로그램의 정보 그리고 인덱스의 통계 정보들까지 확인할 수 있다.
- performance_schema 데이터베이스는 요청된 쿼리들을 MariaDB 서버가 처리할 때 발생하는 각종 이벤트와 잠금 그리고 잠금 대기 현상들을 숫자로 기록하는 테이블들이 저장되어 있다.
- performance_schema 데이터베이스의 테이블들 또한 디스크에는 테이블의 구조만 저장되어 있으며, 실제 데이터는 모두 메모리상에서 관리되며 MariaDB가 재시작되면 모두 초기화된다.
- test 데이터베이스는 말 그대로 테스트용으로 사용하는 데이터베이스이며, 서비스용으로 사용될 MariaDB에서는 불필요하므로 삭제해 버리는 것이 일반적이다.
- 디폴트로 MariaDB 서버의 권한 정보에 "test"라는 단어가 들어간 데이터베이스는 누구든지 볼 수 있는 권한이 설정되어 있다. 그래서 서비스용 MariaDB에서는 이 권한을 삭제하는 것이 좋다.
```sql
DELETE FROM mysql.user WHERE USER='' AND host='%';
DELETE FROM mysql.db WHERE USER='' AND host='%' AND db LIKE 'test%';
FLUSH PRIVILEGES;
```

## 3.3.5 사용자 생성
- **CREATE USER**는 단순히 새로운 사용자를 생성만 하되, 실제 그 사용자의 권한을 부여하지는 않는다.
- **GRANT** 명령에 명시된 사용자가 존재하지 않는 경우에는 그 유저를 생성한 후 권한을 부여하므로, **CREATE USER** 명령어는 사용하지 않아도 된다.
- 관리자 계정에는 모든 권한을 부여하는 것이 일반적이지만 로컬 서버에서만 접속이 가능하도록 'admin'@'localhost'와 'admin'@'127.0.0.1'만 허용해 주는 것이 좋다.
- 기본적으로 GRANT 명령을 실행하면 즉시 계정이 생성되지만, 가끔 그렇지 않은 경우에는 **FLUSH PRIVALEGES** 명령을 실행해 주면 된다.

## 3.4.1 테이블 생성
- 테이블이나 컬럼을 생성할 때는 IF NOT EXISTS 라는 조건이 포함 될 수 있다. 해당 조건은 에러를 내지 않고 경고만 노출하는 식으로 쿼리를 실행한다.
- 테이블 구조를 한눈에 보기 위해서는 DESC 명령문의 결과보다 **SHOW CREATE TABLE**로 출력되는 문장이 더 좋다.

```sql
CREATE [OR REPLACE] TABLE [IF NOT EXISTS] 테이블명 (
    컬럼명1 데이터타입(크기) [제약조건],
    컬럼명2 데이터타입(크기) [제약조건],
    ,..
    [CONSTRAINT 제약조건이름 PRIMARY KEY (필드이름)]
    [CONSTRAINT 제약조건이름
    FOREIGN KEY (필드이름)
    REFERENCES 테이블이름 (필드이름)]
);
```

## 3.4.2 테이블 변경(온라인 및 오프라인)
- MariaDB 10.0 버전과 MySQL 5.6 이상의 버전에서는 온라인 스키마 변경 기능이 도입되었다.
- 기존 테이블에 컬럼을 추가하거나 삭제 또는 인덱스를 추가하거나 삭제하는 작업은 모두 **ALTER TABLE** 명령으로 가능하다.
- 스키마 변경 문장이 실행되면, 항상 마지막에 몇 건의 레코드가 처리되었는지 그리고 작업 과정 중에서 중복된 레코드 발생이 몇 건 있었는지 또는 다른 경고성 내용이 있었는지를 보여준다.
- 오프라인 스키마 변경 작업 순서
  1. tab_test 테이블 잠금 설정
  2. 변경 요청된 내용이 적용된 형태의 임시 테이블 생성
  3. tab_test 테이블의 레코드를 한 건씩 읽어서 1번에서 생성된 테이블로 복사
  4. tab_test 테이블의 모든 레코드가 임시 테이블로 복사될 때까지 3번 과정을 반복 실행
  5. tab_test 테이블을 삭제하고, 임시 테이블의 이름을 tab_test로 RENAME
  6. tab_test 테이블의 잠금 해제
- MariaDB에서 ALTER 명령문에 사용된 ONLINE 옵션은 레코드의 복사가 필요치 않은 경우에만 스키마 변경이 실행되도록 하는 안전 장치로 사용된다.
- 온라인 스키마 변경이라 함은 하나의 커넥션에서 테이블의 구조를 변경하는 문장이 실행되고 있는 상태에서도 다른 커넥션의 INSERT와 UPDATE 그리고 DELETE 문장들이 대기 상태로 빠지지 않고 즉시 처리되는 것을 의미한다.
- 온라인 스키마 변경 기능은 아직 도입된지 오래되지 않은 걸음마 단계라 많은 기능이 개선되고 보완되어야 한다.

- 필드(컬럼) 추가
```sql
ALTER TABLE 테이블이름 ADD 필드이름 필드타입
```

- 필드(컬럼) 삭제
```sql
ALTER TABLE 테이블이름 DROP 필드이름
``` 

- 필드(컬럼) 타입 변경
```sql
ALTER TABLE 테이블이름 MODIFY COLUMN 필드이름 필드타입
``` 

- 필드(컬럼) 이름 변경
```sql
ALTER TABLE 테이블이름 CHANGE 원래필드이름 변경필드이름;
``` 

- 기본키 추가
```sql
ALTER TABLE 테이블이름 ADD 필드이름 필드타입 PRIMARY KEY
또는
ALTER TABLE 테이블이름 ADD [CONSTRAINT 제약조건이름] PRIMARY KEY (필드이름)
```

- 기존 필드(컬럼)을 기본키로 설정
```sql
ALTER TABLE 테이블이름 MODIFY COLUMN 필드이름 필드타입 PRIMARY KEY
또는
ALTER TABLE 테이블이름 MODIFY COLUMN [CONSTRAINT 제약조건이름] PRIMARY KEY (필드이름)
```

- 기본키 삭제
```sql
ALTER TABLE 테이블이름 DROP PRIMARY KEY
```

- 외래키 추가
```sql
ALTER TABLE 테이블이름 ADD [CONSTRAINT 제약조건이름] FOREIGN KEY (필드이름) REFERENCES 테이블이름 (필드이름)
```

- 외래키 삭제
```sql
ALTER TABLE 테이블이름 DROP FOREIGN KEY 제약조건이름
```

## 3.5.1 INSERT
- **ON DUPLICATE KEY UPDATE** 옵션이 사용되면 중복된 레코드가 이미 존재할 때에는 UPDATE가 실행되고 그렇지 않을 때는 INSERT가 실행된다.

```sql
INSERT INTO 테이블이름(필드이름1, 필드이름2, 필드이름3, ...) VALUES (데이터값1, 데이터값2, 데이터값3, ...)
또는
INSERT INTO 테이블이름 VALUES (데이터값1, 데이터값2, 데이터값3, ...)
```


## 3.5.3 UPDATE
- UPDATE 문장은 INSERT된 레코드를 삭제하지 않고, 레코드의 일부 칼럼을 변경하기 위한 SQL 문장이다.

```sql
UPDATE 테이블이름 SET 필드이름1=데이터값1, 필드이름2=데이터값2, ...[WHERE 필드이름=데이터값]
```


## 3.5.4 REPLACE
- REPLACE 문장은 중복된 레코드가 있을 경우 레코드를 삭제하고 다시 INSERT를 하게 되므로 **ON DUPLICATE KEY UPDATE** 옵션보다 부하도 높고 시스템의 자원을 많이 소모하게 된다.


## 3.5.5 DELETE
- MariaDB나 MySQL에서는 모든 SQL 문장이 기본적으로 AUTO-COMMIT 모드로 작동한다. 즉 SQL 문장이 성공적으로 완료되면 자동으로 COMMIT이 실행되어 변경 내용이 영구적으로 적용됨을 의미한다.
- 가능하다면 서비스환경에서는 AUTO-COMMIT 모드를 끄고 DELETE와 UPDATE 문장을 실행할 것을 권장한다.

```sql
DELETE FROM 테이블이름 [WHERE 필드이름=데이터값]
```