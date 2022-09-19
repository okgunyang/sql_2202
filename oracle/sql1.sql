create table member(id varchar2(12) PRIMARY KEY, -- 회원아이디
password varchar2(12) not null, -- 비밀번호
name varchar2(20) not null,
address varchar2(100),
tel varchar2(20) not null,
reg_date date default sysdate);

create table book(bookid number(10) primary key,
bookkind varchar2(3) not null,
booktitle VARCHAR2(50) not null,
bookprice NUMBER(10) not null,
bookcount NUMBER(5) not null,
author varchar2(40),
pubcom varchar2(40),
pubdate date);

create table sales(sno number primary key,
bno number(10) not null,
id varchar2(12) not null,
amount number(5) default 1,
money number,
salesday date default sysdate);

create sequence bseq INCREMENT by 1 start with 1;

create sequence sseq increment by 1 start with 1;

commit;

desc book;

-- 회원 테이블에 더미 데이터 추가


-- 도서 테이블에 더미 데이터 추가
Insert into BOOK (BOOKID,BOOKKIND,BOOKTITLE,BOOKPRICE,BOOKCOUNT,AUTHOR,PUBCOM,PUBDATE) values (1,'IT','이것이 자바다',30000,10,'신용권','한빛미디어',to_date('21/08/20','RR/MM/DD'));
Insert into BOOK (BOOKID,BOOKKIND,BOOKTITLE,BOOKPRICE,BOOKCOUNT,AUTHOR,PUBCOM,PUBDATE) values (2,'IT','자바웹개발워크북',31500,19,'구멍가게코딩단','남가람북스',to_date('22/08/04','RR/MM/DD'));
Insert into BOOK (BOOKID,BOOKKIND,BOOKTITLE,BOOKPRICE,BOOKCOUNT,AUTHOR,PUBCOM,PUBDATE) values (3,'NV','하얼빈',14400,15,'김훈','문학동네',to_date('22/08/03','RR/MM/DD'));
Insert into BOOK (BOOKID,BOOKKIND,BOOKTITLE,BOOKPRICE,BOOKCOUNT,AUTHOR,PUBCOM,PUBDATE) values (4,'NV','불편한편의점',12600,10,'김호연','나무옆의자',to_date('22/08/10','RR/MM/DD'));
Insert into BOOK (BOOKID,BOOKKIND,BOOKTITLE,BOOKPRICE,BOOKCOUNT,AUTHOR,PUBCOM,PUBDATE) values (5,'DV','역행자',15750,8,'자청','웅진출판',to_date('22/05/30','RR/MM/DD'));
Insert into BOOK (BOOKID,BOOKKIND,BOOKTITLE,BOOKPRICE,BOOKCOUNT,AUTHOR,PUBCOM,PUBDATE) values (6,'DV','자소서바이블',18000,15,'이형','엔알디',to_date('22/08/25','RR/MM/DD'));
Insert into BOOK (BOOKID,BOOKKIND,BOOKTITLE,BOOKPRICE,BOOKCOUNT,AUTHOR,PUBCOM,PUBDATE) values (7,'HC','벌거벗은한국사',17500,10,'tvn','프런트페이지',to_date('22/08/22','RR/MM/DD'));
Insert into BOOK (BOOKID,BOOKKIND,BOOKTITLE,BOOKPRICE,BOOKCOUNT,AUTHOR,PUBCOM,PUBDATE) values (8,'HC','난중일기',14000,30,'이순신','스타북스',to_date('22/07/27','RR/MM/DD'));
Insert into BOOK (BOOKID,BOOKKIND,BOOKTITLE,BOOKPRICE,BOOKCOUNT,AUTHOR,PUBCOM,PUBDATE) values (9,'TC','진짜쓰는실무엑셀',20000,10,'전진권','제이펍',to_date('22/02/15','RR/MM/DD'));
Insert into BOOK (BOOKID,BOOKKIND,BOOKTITLE,BOOKPRICE,BOOKCOUNT,AUTHOR,PUBCOM,PUBDATE) values (10,'TC','빅데이터인공지능',25000,15,'박해선','한빛미디어',to_date('20/12/21','RR/MM/DD'));

-- 판매 테이블에 더미 데이터 추가
insert into sales values(sseq.nextval, 1, 'kkt', 2, (select bookprice from book where bookid=1)*2, sysdate);

-- 엑셀데이터를 다른 테이블로 생성하여 가져와 현재 테이블에 레코드로 한꺼번에 추가하기
-- 테이블에서 마우스 오른쪽 -> 데이터 임포트(A) -> 1단계 파일 선택에서 [찾아보기]하여 해당 엑셀 파일 선택 -> 2단계 테이블이름 입력 -> 3단계 해당 컬럼 선택 -> 4단계 각 각의 컬럼타입 및 크기와 제약조건 설정 -> 5단계 기타내용 확인 후 완료
insert into member(id, password, name, address, tel, reg_date) select * from member2;
insert into book(bookid, bookkind, booktitle, bookprice, bookcount, author, pubcom, pubdate) select * from book2;
insert into sales(sno, bno, id, amount, money, salesday) select * from sales2;

commit;