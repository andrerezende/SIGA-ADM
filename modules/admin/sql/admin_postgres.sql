GRANT ALL ON SCHEMA public TO miolo;

CREATE SEQUENCE seq_miolo_user INCREMENT 1 MINVALUE 1 CACHE 1;
CREATE SEQUENCE seq_miolo_transaction INCREMENT 1 MINVALUE 1 CACHE 1;
CREATE SEQUENCE seq_miolo_group INCREMENT 1 MINVALUE 1 CACHE 1;
CREATE SEQUENCE seq_miolo_session INCREMENT 1 MINVALUE 1 CACHE 1;
CREATE SEQUENCE seq_miolo_log INCREMENT 1 MINVALUE 1 CACHE 1;

create table miolo_sequence ( 
       sequence                      character(30)       not null primary key,
       value                         integer);

create table miolo_user ( 
       iduser                        integer        not null primary key,
       login                         character(25),
       name                          character varying(80),
       nickname                      character(25),
       m_password                    character(40),
       confirm_hash                  character(40),
       theme                         character(20));

create table miolo_transaction ( 
       idtransaction                 integer        not null primary key,
       m_transaction                 character(30));

create table miolo_group ( 
       idgroup                       integer        not null primary key,
       m_group                       character(50));

create table miolo_access ( 
       idgroup                       integer        not null,
       idtransaction                 integer        not null,
       rights                        integer);

create table miolo_session ( 
       idsession                     integer        not null primary key,
       tsin                          character(15),
       tsout                         character(15),
       name                          character(50),
       sid                           character(40),
       forced                        character(1),
       remoteaddr                    character(15),
       iduser                        integer        not null);

create table miolo_log ( 
       idlog                         integer        not null primary key,
       m_timestamp                   character(15),
       description                   character varying(200),
       module                        character(25),
       class                         character(25),
       iduser                        integer        not null,
       idtransaction                 integer        not null);

create table miolo_groupuser ( 
       iduser                        integer        not null,
       idgroup                       integer        not null);

insert into miolo_user (iduser,login,name,nickname,m_password,confirm_hash,theme)
   values (nextval('seq_miolo_user'),'admin','Miolo Administrator','admin','admin','','miolo');
insert into miolo_user (iduser,login,name,nickname,m_password,confirm_hash,theme)
   values (nextval('seq_miolo_user'),'guest','Guest User','guest','guest','','miolo');

insert into miolo_transaction (idtransaction, m_transaction) values (nextval('seq_miolo_transaction'),'ADMIN');
insert into miolo_transaction (idtransaction, m_transaction) values (nextval('seq_miolo_transaction'),'USER');
insert into miolo_transaction (idtransaction, m_transaction) values (nextval('seq_miolo_transaction'),'GROUP');
insert into miolo_transaction (idtransaction, m_transaction) values (nextval('seq_miolo_transaction'),'LOG');
insert into miolo_transaction (idtransaction, m_transaction) values (nextval('seq_miolo_transaction'),'TRANSACTION');
insert into miolo_transaction (idtransaction, m_transaction) values (nextval('seq_miolo_transaction'),'SESSION');

insert into miolo_group (idgroup, m_group) values (nextval('seq_miolo_group'),'ADMIN');
insert into miolo_group (idgroup, m_group) values (nextval('seq_miolo_group'),'MAIN_RO');
insert into miolo_group (idgroup, m_group) values (nextval('seq_miolo_group'),'MAIN_RW');

insert into miolo_access (idgroup, idtransaction, rights) values (2,1,1);
insert into miolo_access (idgroup, idtransaction, rights) values (2,2,1);
insert into miolo_access (idgroup, idtransaction, rights) values (2,3,1);
insert into miolo_access (idgroup, idtransaction, rights) values (2,4,1);
insert into miolo_access (idgroup, idtransaction, rights) values (2,5,1);
insert into miolo_access (idgroup, idtransaction, rights) values (2,6,1);
insert into miolo_access (idgroup, idtransaction, rights) values (3,1,15);
insert into miolo_access (idgroup, idtransaction, rights) values (3,2,15);
insert into miolo_access (idgroup, idtransaction, rights) values (3,3,15);
insert into miolo_access (idgroup, idtransaction, rights) values (3,4,15);
insert into miolo_access (idgroup, idtransaction, rights) values (3,5,15);
insert into miolo_access (idgroup, idtransaction, rights) values (3,6,15);

insert into miolo_groupuser (idgroup, iduser) values (1,1);
insert into miolo_groupuser (idgroup, iduser) values (2,1);
insert into miolo_groupuser (idgroup, iduser) values (3,1);
insert into miolo_groupuser (idgroup, iduser) values (2,2);

alter table miolo_sequence owner to miolo;
alter table miolo_user owner to miolo;
alter table miolo_transaction owner to miolo;
alter table miolo_group owner to miolo;
alter table miolo_access owner to miolo;
alter table miolo_session owner to miolo;
alter table miolo_log owner to miolo;
alter table miolo_groupuser owner to miolo;
alter table seq_miolo_user owner to miolo;
alter table seq_miolo_transaction owner to miolo;
alter table seq_miolo_group owner to miolo;
alter table seq_miolo_session owner to miolo;
alter table seq_miolo_log owner to miolo;

