create table board_member (
    memberid varchar2(50) primary key,
    name varchar2(50) not null,
    password varchar2(10) not null,
    regdate date not null);

create sequence article_seq
increment by 1
start with 1;

create table board_article (
    article_no number(10) auto_increment primary key,
    writer_id varchar2(50) not null,
    writer_name varchar2(50) not null,
    title varchar2(255) not null,
    regdate date not null,
    moddate date not null,
    read_cnt number(10)
) ;

create table board_article_content (
    article_no number(10) primary key,
    content varchar2(1000)
) ;

