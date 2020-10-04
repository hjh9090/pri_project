--member ������
create table pro_member (
id      VARCHAR2(20) PRIMARY KEY,
password    VARCHAR2(20) not NULL,
name    VARCHAR2(20) NOT NULL,
phone   VARCHAR2(20),
email   VARCHAR2(50)
);

--board������
create table dog_board (
boardnum     NUMBER PRIMARY KEY,
id           VARCHAR2(20) not null,
title       VARCHAR2(100) not null,
content      VARCHAR2(1000),
INPUTDATE DATE DEFAULT sysdate,
originalfile VARCHAR2(1000),
SAVEDFILE VARCHAR2(1000) 
);

create table cat_board (
boardnum     NUMBER PRIMARY KEY,
id           VARCHAR2(20) not null,
title       VARCHAR2(100) not null,
content      VARCHAR2(1000),
INPUTDATE DATE DEFAULT sysdate,
originalfile VARCHAR2(1000),
SAVEDFILE VARCHAR2(1000) 
);

--board ��ȣ ������
CREATE SEQUENCE board_dog_seq;
CREATE SEQUENCE board_cat_seq;



drop table pro_board;
commit;

SELECT
    *
FROM dog_board;