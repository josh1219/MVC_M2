select * from member03;

drop table member03;

create table member03 (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    grade varchar2(50) not null,    
    Primary Key (id)
    );
    
-- 더미 데이터 입력

insert into member03 (id, pass, name,grade)
values ('admin','1234','관리자','vip');

insert into member03 (id, pass, name,grade)
values ('hong','1234','홍길동','gold');

insert into member03 (id, pass, name,grade)
values ('kim','1234','김유신','silver');

commit;

select * from member03;
