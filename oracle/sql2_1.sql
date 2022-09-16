select * from sales;
-- 구매한 적이 있는 회원이름(name)
select distinct name from member where id in (select id from sales);
select distinct a.name from member a inner join sales b on a.id=b.id;

-- 구매한 한 적이 없는 회원이름(name)
select distinct name from member where id not in (select id from sales);
select distinct a.name from member a left outer join sales b on a.id=b.id;

-- 회원 통합 뷰 만들기
create view tot_member as select * from member union select * from member2;
select * from tot_member;

-- 중복 회원 뷰 만들기
create view cross_member as select * from member intersect select * from member2;

-- 회원1에만 있는 회원 뷰 만들기
create view ori_member as select * from member minus select * from member2;




