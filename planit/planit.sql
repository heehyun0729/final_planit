-- 계정 만들기(cmd)

sqlplus system/java1234

create user planit identified by admin1234;

grant resource, connect to planit;
grant create view to planit;
conn planit/admin1234;





-- 테이블 생성(sqlplus)
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
create table members(
	mem_id varchar2(15) NOT NULL,
	mem_pwd varchar2(100),
	mem_nickname varchar2(20),
	mem_email varchar2(30),
	buddy_gender char,
	buddy_birthYear number(4),
	mem_stat number(2),
	mem_api varchar2(10),
	PRIMARY KEY (mem_id)
);

DROP TABLE ACCOM CASCADE CONSTRAINTS;
create table accom(
	accom_num number(7) NOT NULL,
	accom_name varchar2(50),
	accom_addr varchar2(100),
	accom_comm varchar2(1000),
	acomm_contry varchar2(50),
	acomm_city varchar2(50)
	PRIMARY KEY (accom_num)
);
create sequence accom_num_seq;

DROP TABLE acommQna CASCADE CONSTRAINTS;

create table acommQna(
    acommQna_num number(7) NOT NULL,
    accom_num number(7) REFERENCES accom(accom_num),
    mem_id varchar2(15) REFERENCES members(mem_id),
    acommQna_content varchar2(2000),
    acommQna_date date,
    acommQna_ref number(7),
    acommQna_step number(2),
    PRIMARY KEY (acommQna_num)
);
create sequence acommQna_num_seq;

DROP TABLE qna CASCADE CONSTRAINTS;
create table qna(
   qna_num number(7) NOT NULL,
   mem_id varchar2(15) REFERENCES members(mem_id),
   qna_cate varchar2(30),
   qna_title varchar2(100),
   qna_content clob,
   qna_date date,
   PRIMARY KEY (qna_num)
);
create sequence qna_num_seq;

DROP TABLE qnaComm CASCADE CONSTRAINTS;
create table qnaComm(
    qcomm_num number(7) NOT NULL,
    rcomm_content varchar2(1000),
    rcomm_date date,
    rcomm_step number(3),
    rcomm_ref number(7),
    rcomm_lev number(3),
    PRIMARY KEY (qcomm_num)
);
create sequence qcomm_num_seq;


DROP TABLE qnaImage CASCADE CONSTRAINTS;
create table qnaImage(
   qnaImg_num number(7) NOT NULL,
   qna_num number(7) reference qna(qna_num),
   mem_id varchar2(15) reference members(mem_id),
   qnaImg_orgImg varchar2(50),
   qnaImg_saveImg varchar(50),
   PRIMARY KEY (qnaImg_num)
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

DROP TABLE buddy_apply CASCADE CONSTRAINTS;
DROP TABLE buddy CASCADE CONSTRAINTS;
CREATE TABLE buddy
(
	buddy_num number(7,0) NOT NULL,
	mem_id varchar2(15) NOT NULL,
	buddy_country varchar2(30),
	buddy_city varchar2(30),
	buddy_gender char,
	buddy_birthyear number(7,0),
	buddy_inDate date,
	buddy_outDate date,
	buddy_msg clob,
	buddy_state number(2,0) NOT NULL,
	PRIMARY KEY (buddy_num)
);
CREATE TABLE buddy_apply
(
	apply_num number(5,0) NOT NULL,
	buddy_num number(7,0) NOT NULL,
	mem_id varchar2(15) NOT NULL,
	PRIMARY KEY (apply_num)
);