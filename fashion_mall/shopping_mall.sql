-- 총 수량과 판매량은 0으로 기본 설정
CREATE TABLE  Product  (
    p_code    Number(10)   NOT NULL,
    p_name    VARCHAR2(100)   NOT NULL,
    p_price    NUMBER(10)   NOT NULL,
    p_disprice NUMBER(10),
    p_type    VARCHAR2(50)   NOT NULL,
    p_content    VARCHAR2(2000)   NOT NULL,
    p_sale    NUMBER(10) default 0,
    t_amount    NUMBER(10) default 0
);

-- product 테이블 기본키 설정
ALTER TABLE  Product  ADD CONSTRAINT  PK_PRODUCT  PRIMARY KEY (
     p_code 
);

-- qna 테이블
CREATE TABLE  QnA  (
	 qno 	NUMBER(10)	NOT NULL primary key,
	 bno 	NUMBER(10)	NOT NULL,
     user_id 	VARCHAR2(100)	NOT NULL,
	 q_title 	VARCHAR2(100) NOT NULL,
	 q_content 	VARCHAR2(1000) NOT NULL,
     q_answer VARCHAR2(1000),
     quser_id 	VARCHAR2(100),
     reg_date 	 date default sysdate,
     update_date date default sysdate,
     qna_level char(1) default '0',
     qna_secret char(1) default '0',
     constraint fk_board_qna foreign key(bno) 
     references ProductBoard(bno) on delete cascade,
     constraint fk_member_qna foreign key(user_id) 
     references member(user_id) on delete cascade
);

-- Product 테이블에 reg_date 컬럼 추가
ALTER TABLE Product ADD reg_date 	date default sysdate;

-- member 테이블에 reg_date 컬럼 추가(필수)
ALTER TABLE member ADD reg_date 	date default sysdate;

CREATE TABLE  Member  (
	 user_id 	VARCHAR2(50)	NOT NULL,
	 password 	VARCHAR2(100)	NOT NULL,
	 name 	VARCHAR2(20)	NOT NULL,
	 person_num1 	VARCHAR2(10)	NOT NULL,
	 person_num2 	VARCHAR2(100)	NOT NULL,
	 email 	VARCHAR2(50)	NULL,
	 phone_num 	VARCHAR2(15)	NOT NULL,
	 address 	VARCHAR2(1000)	NULL
);
-- member 테이블 기본키 설정
alter table member add constraint member_pk primary key(user_id);

-- 주문 정보
CREATE TABLE  OrderInfo  (
     order_num     NUMBER(10)    NOT NULL,
     user_id     VARCHAR2(50)    NOT NULL,
     p_code     Number(10)    NOT NULL,
     p_name     VARCHAR2(100)    NOT NULL,
     po_size     VARCHAR2(50)    NOT NULL,
     po_color     VARCHAR2(50)    NOT NULL,
     p_amount     NUMBER(10)    NOT NULL,
     p_price     NUMBER(10)    NOT NULL,
     oreg_date  date default sysdate,
     constraint fk_orderinfo_member foreign key(user_id) 
     references member(user_id) on delete cascade
);

-- 장바구니(안씀)
CREATE TABLE  Basket  (
	 basket 	NUMBER(15)	NOT NULL,
	 p_code 	Number(10)	NOT NULL,
	 order_num 	NUMBER(15)	NOT NULL,
	 b_size 	VARCHAR2(50)	NOT NULL,
	 b_color 	VARCHAR2(50)	NOT NULL,
	 b_amount 	NUMBER(10)	NOT NULL,
	 total_price 	NUMBER(10)	NOT NULL
);

-- 유저 권한
CREATE TABLE  Auth  (
	 user_id 	VARCHAR2(50)	NOT NULL,
	 auth 	VARCHAR2(20)	NOT NULL
);

-- 로그인 권한 외래키 설정 및 cascade 설정
alter table auth add constraint auth_fk foreign key(user_id) references member(user_id)
on delete cascade;

CREATE TABLE  ProductOpt  (
	 p_code 	Number(10)	NOT NULL,
	 po_size 	VARCHAR2(50)	NOT NULL,
	 po_color 	VARCHAR2(50)	NOT NULL,
	 p_amount 	NUMBER(10)	NOT NULL
);

CREATE TABLE  ProductBoard  (
	 bno 	NUMBER(10)	NOT NULL,
	 p_code 	Number(10)	NOT NULL,
	 pb_content 	VARCHAR2(2000)	NOT NULL,
	 reg_date 	date default sysdate
);

CREATE TABLE  Review  (
	 rno 	NUMBER(10)	NOT NULL,
	 bno 	NUMBER(10)	NOT NULL,
	 r_title 	VARCHAR2(50)	NOT NULL,
	 r_content 	VARCHAR2(2000)	NOT NULL,
	 replyer 	VARCHAR2(1000)	NOT NULL,
	 rv_image 	VARCHAR2(100)	NOT NULL,
	 reg_date 	date default sysdate
);

CREATE TABLE  ProductAttach  (
     p_code     Number(10)    NOT NULL,
     uuid   varchar2(100) NOT NULL,
     uploadpath varchar2(200) NOT NULL,
     filename     varchar2(200) NOT NULL
);

-- 첨부파일 외래키 설정
ALTER TABLE  ProductAttach  ADD CONSTRAINT  FK_P_Board_P_Attach_1  FOREIGN KEY (
     p_code
)
REFERENCES  Product  (
     p_code
);

-- 리뷰 사진 모음
CREATE TABLE  CustomerAttach  (
     bno     NUMBER(10)    NOT NULL,
     uuid varchar2(100) NOT NULL,
     uploadpath varchar2(200) NOT NULL,
     filename     VARCHAR2(200) NOT NULL,
     constraint fk_customer_attach foreign key(bno) 
     references ProductBoard(bno) on delete cascade
);

----------------------------------------------------------------

-- 위에서 실행
CREATE TABLE  ProductAttach  (
     p_code     Number(10)    NOT NULL,
     uuid   varchar2(100) NOT NULL,
     uploadpath varchar2(200) NOT NULL,
     filename     varchar2(200) NOT NULL
);

-- 로그인 기억하기 테이블(아래 그대로 만들어 줘야 알아서 인식.)
create table persistent_logins(
	username varchar(64) not null,
	series varchar(64) primary key,
	token varchar(64) not null,
	last_used timestamp not null
);

-- 장바구니 테이블(이걸로 사용)
CREATE TABLE  Cart  (
     user_id     VARCHAR2(50)    NOT NULL,
     p_code     Number(10)    NOT NULL,
     p_name     VARCHAR2(100)    NOT NULL,
     po_size     VARCHAR2(50)    NOT NULL,
     po_color     VARCHAR2(50)    NOT NULL,
     p_amount     NUMBER(10)    NOT NULL,
     p_price     NUMBER(10)    NOT NULL
);
-- 총 가격 컬럼 추가(필수)
alter table cart add valid_price number(10);

-- 장바구니 외래키 설정
alter table Cart add constraint fk_cart_member foreign key(user_id) references member(user_id) on delete cascade;

-- 위에 있음
CREATE TABLE  OrderInfo  (
     order_num     NUMBER(10)    NOT NULL,
     user_id     VARCHAR2(50)    NOT NULL,
     p_code Number(10)    NOT NULL,
     p_name     VARCHAR2(100)    NOT NULL,
     po_size     VARCHAR2(50)    NOT NULL,
     po_color     VARCHAR2(50)    NOT NULL,
     p_amount     NUMBER(10)    NOT NULL,
     p_price     NUMBER(10)    NOT NULL,
     oreg_date  date default sysdate,
     constraint fk_orderinfo_member foreign key(user_id) 
     references member(user_id) on delete cascade
);

-- p_code 시퀀스(필수)
create SEQUENCE product_seq
    increment by 1
    start with 1
    maxvalue 99999999
    minvalue 1
    nocycle;
    
-- bno 시퀀스(필수)
create SEQUENCE bno_seq
    increment by 1
    start with 1
    maxvalue 99999999
    minvalue 1
    nocycle;