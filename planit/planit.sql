-- 계정 만들기(cmd)

sqlplus system/java1234

create user planit identified by admin1234;

grant resource, connect to planit;
grant create view to planit;
conn planit/admin1234;





-- 테이블 생성(sqlplus)

create table members(
	mem_id varchar2(15) primary key,
	mem_pwd varchar2(100),
	mem_nickname varchar2(20),
	mem_email varchar2(30),
	buddy_gender char,
	buddy_birthYear number(4),
	mem_stat number(2),
	mem_api varchar2(10)
);


create table accom(
	accom_num number(7) primary key,
	accom_name varchar2(50),
	accom_addr varchar2(100),
	accom_comm varchar2(1000),
	acomm_contry varchar2(50),
	acomm_city varchar2(50)
);
create sequence accom_num_seq;

create table acommQna(
    acommQna_num number(7) primary key,
    accom_num number(7) reference accom(accom_num),
    mem_id varchar2(15) reference members(mem_id),
    acommQna_content varchar2(2000),
    acommQna_date date,
    acommQna_ref number(7),
    acommQna_step number(2)
);
create sequence acommQna_num_seq;

create table qna(
   qna_num number(7) primary key,
   mem_id varchar2(15) reference members(mem_id),
   qna_cate varchar2(30),
   qna_title varchar2(100),
   qna_content clob,
   qna_date date
);
create sequence qna_num_seq;

create table qnaComm(
    qcomm_num number(7) primary key,
    rcomm_content varchar2(1000),
    rcomm_date date,
    rcomm_step number(3),
    rcomm_ref number(7),
    rcomm_lev number(3)
);
create sequence qcomm_num_seq;

create table qnaImage(
   qnaImg_num number(7) primary key,
   qna_num number(7) reference qna(qna_num),
   mem_id varchar2(15) reference members(mem_id),
   qnaImg_orgImg varchar2(50),
   qnaImg_saveImg varchar(50)
);
create sequence qnaImg_num_seq;

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