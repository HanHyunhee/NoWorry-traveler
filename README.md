table query

//회원(member) table
create table member(
user_name varchar2(20) not null,
user_id varchar2(20) primary key,
user_pass varchar2(20) not null,
user_phone_num varchar2(20) not null,
user_email varchar2(20) not null);

//숙소(accomodation) 테이블
create table accomodation(
accnum number(3) primary key,
accid varchar2(20) not null,
accwriter varchar2(20) not null,
acctitle varchar2(20) not null,
acccontents varchar2(200) not null,
accdate timestamp default sysdate,
CONSTRAINT accid_fk FOREIGN KEY (accid) REFERENCES member(user_id)on delete cascade 
);

create sequence accanswer_seq;

//숙소 파일 테이블
create table Files (
Num number(3) ,
Filename varchar2(100),
foreign key (num) references accomodation (accnum) on delete cascade
);


//여행지 게시판 테이블
create table tripview(
view_num number(4) primary key,
view_region varchar2(4) not null,
view_wr varchar2(20) not null,
view_star number(1) not null,
view_title varchar2(100) not null,
view_comment varchar2(1000) not null,
view_date timestamp default sysdate,
view_cnt number(3),
CONSTRAINT trip_fk FOREIGN KEY (view_wr) REFERENCES member(user_id)on delete cascade);

create sequence tv_seq;

//여행지 파일 테이블
create table tripview_files(
file_num number(3),
view_num number(3),
file_name varchar2(100),
foreign key (view_num) references tripview(view_num) on delete cascade);

create sequence tvf_seq;

//예약 테이블
create table reservation(
res_num varchar2(30)primary key,
res_title varchar2(80)not null,
res_addr varchar2(80)not null,
res_img_addr varchar2(80)not null,
res_price varchar2(15)not null,
res_id varchar2(20)not null,
res_start date not null,
res_end date not null,
CONSTRAINT id_fk FOREIGN KEY (res_id) REFERENCES member(user_id)on delete cascade );

create sequence res_seq;

// 갤러리 table
create table gallery(
gallery_num number(5) primary key,
userid varchar2(20) not null,
gallery_title varchar2(20) not null,
gallery_text varchar2(300) not null,
gallery_region varchar2(20) not null,
gallery_cnt number(5) default 0 not null,
gallery_good number(5) default 0 not null,
gallery_date timestamp default sysdate);
CONSTRAINT userid_fk FOREIGN KEY (userid) REFERENCES member(user_id)on delete cascade );
create sequence gallery_seq;

// 갤러리 파일 테이블
create table files(
files_num varchar2(100),
gallery_filename varchar2(100),
foreign key (files_num) references gallery(gallery_num) on delete cascade);

// 갤러리 댓글 테이블
create table gcomment(
cmt_num number(3) not null,
comment_num varchar2(50) not null,
comment_text varchar2(150) not null,
comment_date timestamp default sysdate not null,
comment_id varchar2(20) not null,
CONSTRAINT cmt_fk FOREIGN KEY (comment_num) REFERENCES gallery(gallery_num) on delete cascade );

create sequence gcomment_seq;
