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
insert into member values('kkt','a1004','김기태','능곡동 123', '010-1004-1004', '2022-09-12');

-- 도서 테이블에 더미 데이터 추가
insert into book values(bseq.nextval, 'IT', '스프링프레임워크', 38000, 8, '김기태', '정복사', '2022-09-10');

-- 판매 테이블에 더미 데이터 추가
insert into sales values(sseq.nextval, 1, 'kkt', 2, (select bookprice from book where bookid=1)*2, sysdate);

-- 엑셀데이터를 다른 테이블로 생성하여 가져와 현재 테이블에 레코드로 한꺼번에 추가하기
-- 테이블에서 마우스 오른쪽 -> 데이터 임포트(A) -> 1단계 파일 선택에서 [찾아보기]하여 해당 엑셀 파일 선택 -> 2단계 테이블이름 입력 -> 3단계 해당 컬럼 선택 -> 4단계 각 각의 컬럼타입 및 크기와 제약조건 설정 -> 5단계 기타내용 확인 후 완료
insert into member(id, password, name, address, tel, reg_date) select * from member2;
insert into book(bookid, bookkind, booktitle, bookprice, bookcount, author, pubcom, pubdate) select * from book2;
insert into sales(sno, bno, id, amount, money, salesday) select * from sales2;

commit;