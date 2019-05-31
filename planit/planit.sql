-- ���� �����(cmd)

sqlplus system/java1234

create user planit identified by admin1234;

grant resource, connect to planit;
grant create view to planit;
conn planit/admin1234;





-- ���̺� ����(sqlplus)
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
CREATE TABLE members(
	mem_id varchar2(40) PRIMARY KEY,
	mem_pwd varchar2(100) NOT NULL,
	mem_nickname varchar2(25) UNIQUE,
	mem_email varchar2(50) UNIQUE,
	mem_gender char NOT NULL,
	mem_birthYear number(4) NOT NULL,
	mem_stat number(2) NOT NULL,
	-- � ���� ���� ���� �ϳ� ����� �Ӵϴ�
	mem_api varchar2(10)
);

DROP TABLE ACCOM CASCADE CONSTRAINTS;
drop sequence accom_num_seq;
create table accom(
	accom_num number(7) NOT NULL,
	accom_name varchar2(50),
	accom_addr varchar2(100),
	accom_comm varchar2(1000),
	acomm_contry varchar2(50),
	acomm_city varchar2(50),
	PRIMARY KEY (accom_num)
);
create sequence accom_num_seq;

DROP TABLE acommQna CASCADE CONSTRAINTS;
drop sequence acommQna_num_seq;
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
drop sequence qna_num_seq;
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
drop sequence qcomm_num_seq;
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
drop sequence qnaImg_num_seq;
create table qnaImage(
   qnaImg_num number(7) NOT NULL,
   qna_num number(7) references qna(qna_num),
   mem_id varchar2(15) references members(mem_id),
   qnaImg_orgImg varchar2(50),
   qnaImg_saveImg varchar(50),
   PRIMARY KEY (qnaImg_num)
);
create sequence qnaImg_num_seq;

DROP TABLE ad CASCADE CONSTRAINTS;
drop sequence ad_num_seq;
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

drop table plan cascade constraints;
create table plan(
    plan_num number(7) primary key,
    mem_id varchar2(40) references members(mem_id),
    plan_title varchar2(50),
    plan_img clob,
    plan_public number(2)   -- 0: ����, 1: �����
);

drop table planDetail cascade constraints;
create table planDetail(
    planDetail_num number(7) primary key,
    plan_num number(7) references plan(plan_num),
    planDetail_order number(3),
    planDetail_country varchar2(30),
    planDetail_city varchar2(40),
    planDetail_inDate date,
    planDetail_outDate date,
    planDetail_detail clob
);

DROP TABLE buddy_city CASCADE CONSTRAINTS;
DROP TABLE buddy_country CASCADE CONSTRAINTS;
DROP TABLE buddy_apply CASCADE CONSTRAINTS;
DROP TABLE buddy CASCADE CONSTRAINTS;

CREATE TABLE buddy
(
	buddy_num number(7,0) NOT NULL,
	mem_id varchar2(15) NOT NULL,
	buddy_gender char,
	buddy_birthyear number(7,0),
	buddy_inDate date,
	buddy_outDate date,
	buddy_msg clob,
	buddy_state number(2,0) NOT NULL,
	PRIMARY KEY (buddy_num)
);

CREATE TABLE buddy_country
(
	country_num number(5,0) primary key,
	buddy_num number(7,0) CONSTRAINT fk_buddyCountry
    REFERENCES buddy(buddy_num) ON DELETE CASCADE,
	buddy_country varchar2(30)
);

CREATE TABLE buddy_city
(
	city_num number(5,0) primary key,
	country_num number(7,0) CONSTRAINT fk_buddyCity
    REFERENCES buddy_country(country_num) ON DELETE CASCADE,
	buddy_city varchar2(30)
);

CREATE TABLE buddy_apply
(
	apply_num number(5,0) PRIMARY KEY,
	buddy_num number(7,0) CONSTRAINT fk_buddyapply
    REFERENCES buddy(buddy_num) ON DELETE CASCADE,
	mem_id varchar2(15) NOT NULL
);
drop SEQUENCE buddy_seq;
drop SEQUENCE buddyCountry_seq;
drop SEQUENCE buddyCity_seq;
drop SEQUENCE buddyApply_seq;
CREATE SEQUENCE buddy_seq;
CREATE SEQUENCE buddyCountry_seq;
CREATE SEQUENCE buddyCity_seq;
CREATE SEQUENCE buddyApply_seq;