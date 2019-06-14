-- 계정 만들기(cmd)

sqlplus system/java1234

create user planit identified by admin1234;

grant resource, connect to planit;
grant create view to planit;
conn planit/admin1234;





-- 테이블 생성(sqlplus)
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
CREATE TABLE members(
	mem_id varchar2(40) PRIMARY KEY,
	mem_pwd varchar2(100) NOT NULL,
	mem_nickname varchar2(25) UNIQUE,
	mem_email varchar2(50) UNIQUE,
	mem_gender char NOT NULL,
	mem_birthYear number(4) NOT NULL,
	mem_stat number(2) NOT NULL,
	-- 어떤 값이 들어갈지 몰라 하나 만들어 둡니다
	mem_api varchar2(10)
);

DROP TABLE USERAUTH CASCADE CONSTRAINTS;
CREATE TABLE USERAUTH (
    mem_email varchar2(50) PRIMARY KEY,
    authKey varchar2(100) NOT NULL,
    mem_id varchar2(40) NOT NULL,
    CONSTRAINT userAuth_mem_id_fk FOREIGN KEY(mem_id)
    REFERENCES MEMBERS(mem_id)
);

DROP TABLE PROFILE CASCADE CONSTRAINTS;
DROP SEQUENCE PROFILE_SEQ;
CREATE TABLE PROFILE(
	profile_no number(7) PRIMARY KEY,
	mem_id varchar2(40) NOT NULL,
	profile_open number(2,0),
	profile_comm varchar2(1000),
	CONSTRAINT profile_mem_id_fk FOREIGN KEY (mem_id)
	REFERENCES MEMBERS (mem_id)
);
CREATE SEQUENCE PROFILE_SEQ;

DROP TABLE FOLLOW_LIST CASCADE CONSTRAINTS;
DROP SEQUENCE FOLLOW_SEQ;
CREATE TABLE FOLLOW_LIST(
	followno number(5) PRIMARY KEY,
	mem_id varchar2(40) NOT NULL,
	profile_no number(7,0) NOT NULL,
	follow_grade number(2,0),
	CONSTRAINT follow_profile_no_fk FOREIGN KEY (profile_no)
	REFERENCES PROFILE (profile_no),
	CONSTRAINT follow_mem_id_fk FOREIGN KEY (mem_id)
	REFERENCES MEMBERS (mem_id)
);
CREATE SEQUENCE FOLLOW_SEQ;

DROP TABLE MEMIMAGE CASCADE CONSTRAINTS;
DROP SEQUENCE MEMIMAGE_SEQ;
CREATE TABLE MEMIMAGE(
	img_num number(7,0) PRIMARY KEY,
	mem_id varchar2(40) NOT NULL,
	img_orgImg varchar2(150),
	img_saveImg varchar2(150),
	CONSTRAINT memimage_profile_no_fk FOREIGN KEY (mem_id)
	REFERENCES MEMBERS (mem_id)
);
CREATE SEQUENCE MEMIMAGE_SEQ;

ALTER TABLE MEMIMAGE MODIFY(IMG_ORGIMG VARCHAR2(150));
ALTER TABLE MEMIMAGE MODIFY(IMG_SAVEIMG VARCHAR2(150));


--판매자 테이블
DROP TABLE SELLER;
DROP SEQUENCE SELLER_SEQ;
CREATE TABLE SELLER(
	SELL_NUM NUMBER(5) PRIMARY KEY,
	MEM_ID VARCHAR2(40) NOT NULL,
	SELL_COMPANY VARCHAR2(100) NOT NULL,
	SELL_POSTCODE NUMBER(5,0),
	SELL_ADDR VARCHAR2(200),
	SELL_TEL VARCHAR2(20) NOT NULL
);
CREATE SEQUENCE SELLER_SEQ;


--숙소테이블
drop table accom CASCADE CONSTRAINTS;
create table accom(
    accom_num number(7,0) primary key,
    sell_num number(5) references seller(sell_num),
    accom_name varchar2(100),
    accom_addr varchar2(200),
    accom_comm varchar2(300),
    accom_country varchar2(50),
    accom_city varchar2(50),
    accommImg_orgImg varchar(500),
    accommImg_saveImg varchar(500),
    accomChk number(1)
);
drop SEQUENCE accom_seq;
CREATE SEQUENCE accom_seq;

--방정보 테이블
drop table room CASCADE CONSTRAINTS;
create table room(
    room_num number(7,0) primary key,
    accom_num number(7,0) references accom(accom_num),
    room_type varchar2(100),
    room_price number(10,0),
    room_comm varchar2(1000),
    roomChk number(1),
    room_capa number(2)
);
drop SEQUENCE room_seq;
CREATE SEQUENCE room_seq;

--방이미지 테이블
drop table roomImage CASCADE CONSTRAINTS;
create table roomImage(
    roomImg_num number(7,0) primary key,
    room_num number(7,0) references room(room_num),
    roomImg_orgImg varchar2(500),
    roomImg_saveImg varchar2(500),
    roomImageChk number(1)
);
drop SEQUENCE roomImage_seq;
CREATE SEQUENCE roomImage_seq;

--쪽지 테이블
drop table MsgTable CASCADE CONSTRAINTS;
CREATE TABLE MsgTable
(
	msgNum number(4) primary key,
	msgContent varchar2(1000) NOT NULL,
	receiveMemId varchar2(20) REFERENCES Members (mem_id),
	sendMemId varchar2(20) REFERENCES Members (mem_id),
	msgWdate date NOT NULL,
	msgCheck number(1) NOT NULL,
            msgDelete varchar(50),
            msgDeletee varchar(50)

);

--숙소문의 게시판
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


-- 자유문의 게시판 --

DROP TABLE qna CASCADE CONSTRAINTS;
drop sequence qna_num_seq;
create table qna(
   qna_num number(7) NOT NULL,
   mem_id varchar2(15) REFERENCES members(mem_id),
   qna_cate varchar2(30),
   qna_title varchar2(100),
   qna_content clob,
   PRIMARY KEY (qna_num)
);
create sequence qna_num_seq;

--자유문의 게시판 댓글--

create table qnacomm
(
    QCOMM_NUM number(7) PRIMARY KEY, --댓글 번호
    MEM_ID VARCHAR2(15) REFERENCES MEMBERS(MEM_ID) NOT NULL, --멤버 아이디
    QCOMM_CONTENT varchar(300), --댓글 내용
    QCOMM_DATE DATE NOT NULL, -- 댓글 작성 날짜
    QNA_NUM NUMBER(7) REFERENCES QNA(QNA_NUM) NOT NULL, -- 문의게시판번호
    CONSTRAINT QNA_NUM_FK FOREIGN KEY(QNA_NUM) 
    REFERENCES QNA(QNA_NUM)ON DELETE CASCADE
);
CREATE SEQUENCE QCOMM_NUM_SEQ;

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



DROP TABLE ad CASCADE CONSTRAINTS;
drop sequence ad_num_seq;
CREATE TABLE ad
(
	ad_num number(7,0) NOT NULL,
	mem_id varchar2(40) NOT NULL,
	ad_company varchar2(50),
	ad_url varchar2(500),
	ad_requestDate date,
	ad_approveDate date,
	ad_price number(10,0),
	ad_payment varchar2(20),
	ad_tid varchar2(500),
	ad_progress number(2,0),
	PRIMARY KEY (ad_num)
);
create sequence ad_num_seq;

DROP TABLE adInfo CASCADE CONSTRAINTS;
drop sequence adInfo_num_seq;
CREATE TABLE adInfo
(
	adInfo_num number(7,0) NOT NULL,
	ad_num number(7,0) NOT NULL,
	adInfo_date date,
	adInfo_chance number(4,0),
	adInfo_hit number(7,0),
	adInfo_click number(7,0),
	adInfo_status number(2,0),
	adInfo_price number(7,0),
	PRIMARY KEY (adInfo_num)
);
create sequence adInfo_num_seq;

DROP TABLE adImage CASCADE CONSTRAINTS;
CREATE TABLE adImage
(
	adImg_num number(7,0) NOT NULL,
	adInfo_num number(7,0) NOT NULL,
	adImg_orgImg varchar2(500),
	adImg_saveImg varchar2(500),
	adImg_status number(1),
	adimg_changeOrgImg varchar2(500),
	adimg_changeSaveImg varchar2(500),
	PRIMARY KEY (adImg_num)
);
drop SEQUENCE adImage_num_seq;
create sequence adImage_num_seq;

drop table plan cascade constraints;
create table plan(
    plan_num number(7) primary key,
    mem_id varchar2(40) references members(mem_id),
    plan_title varchar2(50),
    plan_startDate date,
    plan_stays number(3),
    plan_img clob,
    plan_public number(2)   -- 0: 공개, 1: 비공개
);

drop table planDetail cascade constraints;
create table planDetail(
    planDetail_num number(7) primary key,
    plan_num number(7) references plan(plan_num),
    planDetail_order number(3),
    planDetail_country varchar2(50),
    planDetail_city varchar2(50),
    planDetail_lat number,
    planDetail_lng number,
    planDetail_inDate date,
    planDetail_outDate date,
    planDetail_stay number(3),
    planDetail_detail clob
);

--동행게시판 테이블
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
	mem_id varchar2(15) NOT NULL,
    apply_state number(2,0)
);
drop SEQUENCE buddy_seq;
drop SEQUENCE buddyCountry_seq;
drop SEQUENCE buddyCity_seq;
drop SEQUENCE buddyApply_seq;
CREATE SEQUENCE buddy_seq;
CREATE SEQUENCE buddyCountry_seq;
CREATE SEQUENCE buddyCity_seq;
CREATE SEQUENCE buddyApply_seq;

drop table rsvn CASCADE CONSTRAINTS;
create table rsvn
(
    rsvn_num number(7) primary key,
    mem_id varchar2(40) references members(mem_id),
    room_num number(7) references room(room_num),
    rsvn_checkin date,
    rsvn_checkout date,
    rsvn_cnt number(3), 
    rsvn_name varchar2(50),
    rsvn_email varchar2(50),
    rsvn_phone varchar2(20)
);

drop table rsvnPay CASCADE CONSTRAINTS;
create table rsvnPay
(
    rsvnPay_id varchar2(30) primary key,
    rsvn_num number(7) references rsvn(rsvn_num),
    rsvnPay_total number(10), 
    rsvnPay_stat number(2),
    rsvnPay_date date
);