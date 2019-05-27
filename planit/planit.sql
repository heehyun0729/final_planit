-- 계정 만들기(cmd)

sqlplus system/java1234

create user planit identified by admin1234;

grant resource, connect to planit;
grant create view to planit;
conn planit/admin1234;





-- 테이블 생성(sqlplus)


create table acommQna(
    acommQna_num number(7) primary key,
    acommQna_content varchar2(2000),
    acommQna_date date,
    acommQna_ref number(7),
    acommQna_step number(2)
);


create table qna(
   qna_num number(7) primary key,
   qna_cate varchar2(30),
   qna_title varchar2(100),
   qna_content clob,
   qna_date date
);

create table qnaComm(
    qcomm_num number(7) primary key,
    rcomm_content varchar2(1000),
    rcomm_date date,
    rcomm_step number(3),
    rcomm_ref number(7),
    rcomm_lev number(3)
);

create table qnaImage(
   qnaImg_num number(7) primary key,
   qnaImg_orgImg varchar2(50),
   qnaImg_saveImg varchar(50)
);

CREATE TABLE ad
(
	ad_num number(7,0) NOT NULL,
	mem_id varchar2(15) NOT NULL,
	ad_company varchar2(50),
	ad_url varchar2(100),
	ad_startDate date,
	ad_endDate date,
	ad_chance number(4,0),
	ad_hit number(7,0),
	ad_click number(7,0),
	ad_status number(2,0),
	ad_price number(7,0),
	ad_requestDate date,
	ad_approveDate date,
	PRIMARY KEY (ad_num)
);
create sequence ad_num_seq;