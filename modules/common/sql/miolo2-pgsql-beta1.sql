create sequence cmn_group_seq       increment 1 minvalue 100;
create sequence cmn_module_seq      increment 1 minvalue 100;
create sequence cmn_table_seq       increment 1 minvalue 100;
create sequence cmn_news_seq        increment 1 minvalue 100;
create sequence cmn_transaction_seq increment 1 minvalue 100;
create sequence cmn_person_seq      increment 1 minvalue 100;
create sequence cmn_user_seq        increment 1 minvalue 100;
create sequence cmn_session_seq     increment 1 minvalue 100;
create sequence cmn_log_seq         increment 1 minvalue 100;

create table cmn_group ( 
       idgroup                       integer not null,
       "group"                         character varying(50));

alter table cmn_group add constraint cmn_group_pk primary key(idgroup);

create table cmn_module ( 
       idmodule                      integer not null,
       name                          character varying(20) not null,
       description                   character varying(120) not null);
       
alter table cmn_module add constraint cmn_module_pk primary key(idmodule);

create table cmn_table ( 
       idtable                       integer not null,
       name                          character varying(30)     not null,
       item1                         character varying(30)     not null,
       item2                         character varying(30),
       item3                         character varying(200));

alter table cmn_table add constraint cmn_table_pk primary key(idtable);

create table cmn_news ( 
       idmodule                      integer not null,
       idnews                        integer not null,
       dtnews                        timestamp,
       news                          text);

alter table cmn_news add constraint cmn_news_pk primary key(idmodule, idnews);

alter table cmn_news add constraint cmn_news_fk_idmodule foreign key(idmodule) 
      references cmn_module on delete cascade;

create table cmn_transaction ( 
       idtransaction                 integer not null,
       transaction                   character varying(30),
       idmodule                      integer not null);

alter table cmn_transaction add constraint cmn_transaction_pk primary key(idtransaction);

alter table cmn_transaction add constraint cmn_transaction_fk_idmodule foreign key(idmodule) 
      references cmn_module on delete cascade;

create table cmn_person ( 
       idperson                      integer not null,
       name                          character varying(55)     not null,
       email                         character varying(50));

alter table cmn_person add constraint cmn_person_pk primary key(idperson);

create index cmn_person_name_key on cmn_person(name);

create table cmn_access ( 
       idgroup                       integer not null,
       idtransaction                 integer not null,
       "right"                         integer not null);

alter table cmn_access add constraint cmn_access_pk primary key(idgroup, idtransaction);

alter table cmn_access add constraint cmn_access_fk_idgroup foreign key(idgroup) 
      references cmn_group on delete cascade;

alter table cmn_access add constraint cmn_access_fk_idtransaction foreign key(idtransaction) 
      references cmn_transaction on delete cascade;

create table cmn_user ( 
       iduser                       integer not null,
       login                        character varying(20) not null,
       nickname                     character varying(20),
       theme                        character varying(20),
       "password"                   character varying(40),
       confirm_hash                 character varying(40),
       idperson                     integer not null);

alter table cmn_user add constraint cmn_user_pk primary key(iduser);

alter table cmn_user add constraint cmn_user_fk_idperson foreign key(idperson) 
      references cmn_person;
       
create table cmn_groupuser ( 
       idgroup                      integer not null,
       iduser                       integer not null);

alter table cmn_groupuser add constraint cmn_groupuser_pk primary key(idgroup, iduser);

alter table cmn_groupuser add constraint cmn_groupuser_fk_idgroup foreign key(idgroup) 
      references cmn_group on delete cascade;

alter table cmn_groupuser add constraint cmn_groupuser_fk_iduser foreign key(iduser) 
      references cmn_user on delete cascade;

create table cmn_session ( 
       idsession                     integer not null,
       ts_in                         timestamp,
       ts_out                        timestamp,
       name                          character varying(50),
       sid                           character(32),
       forced                        boolean default false,
       remoteaddr                    character varying(15),
       iduser                        integer not null);

alter table cmn_session add constraint cmn_session_pk primary key(idsession);

alter table cmn_session add constraint cmn_session_fk_idgroup foreign key(iduser) 
      references cmn_session on delete cascade;

create table cmn_log ( 
       idlog                         integer not null,
       ts                            timestamp,
       description                   character varying(200),
       operation                     character(3),
       module                        character varying(20)     not null,
       classE                        character varying(30)     not null,
       iduser                        integer not null,
       idtransaction                 integer not null);

alter table cmn_log add constraint cmn_log_pk primary key(idlog);

alter table cmn_log add constraint cmn_log_fk_iduser foreign key(iduser) 
      references cmn_user on delete cascade;

alter table cmn_log add constraint cmn_log_fk_idtransaction foreign key(idtransaction) 
      references cmn_transaction on delete cascade;

-- 
-- initial values
--

INSERT INTO cmn_module (idmodule, name, description) 
       VALUES (1,'common', 'MIOLO Common Module');
INSERT INTO cmn_module (idmodule, name, description) 
       VALUES (2,'tutorial', 'Tutorial');
INSERT INTO cmn_module (idmodule, name, description) 
       VALUES (3,'Scotty', 'Scotty - Chamados Técnicos');

INSERT INTO cmn_group (idgroup, "group") 
       VALUES (1, 'ADMIN');
INSERT INTO cmn_group (idgroup, "group") 
       VALUES (2, 'USER');
INSERT INTO cmn_group (idgroup, "group") 
       VALUES (3, 'GUEST');

INSERT INTO cmn_table (idtable, name, item1, item2, item3) 
       VALUES (1, 'RIGHTS', '1', 'Consultar', '');
INSERT INTO cmn_table (idtable, name, item1, item2, item3) 
       VALUES (2, 'RIGHTS', '2', 'Inserir', '');
INSERT INTO cmn_table (idtable, name, item1, item2, item3) 
       VALUES (3, 'RIGHTS', '4', 'Remover', '');
INSERT INTO cmn_table (idtable, name, item1, item2, item3) 
       VALUES (4, 'RIGHTS', '8', 'Atualizar', '');
INSERT INTO cmn_table (idtable, name, item1, item2, item3) 
       VALUES (5, 'RIGHTS', '15', 'Processar', '');
INSERT INTO cmn_table (idtable, name, item1, item2, item3) 
       VALUES (6, 'RIGHTS', '31', 'Admin', '');
INSERT INTO cmn_table (idtable, name, item1, item2, item3) 
       VALUES (7, 'RIGHTS', '32', 'Developer', '');

INSERT INTO cmn_transaction (idtransaction, transaction, idmodule) 
       VALUES (  1, 'TRANSACTION', 1);
INSERT INTO cmn_transaction (idtransaction, transaction, idmodule) 
       VALUES (  2, 'USER', 1);
INSERT INTO cmn_transaction (idtransaction, transaction, idmodule) 
       VALUES (  3, 'PASSWORD', 1);
INSERT INTO cmn_transaction (idtransaction, transaction, idmodule) 
       VALUES (  4, 'GROUP', 1);
INSERT INTO cmn_transaction (idtransaction, transaction, idmodule) 
       VALUES (  5, 'LOG', 1);
INSERT INTO cmn_transaction (idtransaction, transaction, idmodule) 
       VALUES (  6, 'NEWS', 1);
INSERT INTO cmn_transaction (idtransaction, transaction, idmodule) 
       VALUES (  7, 'TABLE', 1);
INSERT INTO cmn_transaction (idtransaction, transaction, idmodule) 
       VALUES (  8, 'PERSON', 1);
INSERT INTO cmn_transaction (idtransaction, transaction, idmodule) 
       VALUES (  9, 'SESSION', 1);
INSERT INTO cmn_transaction (idtransaction, transaction, idmodule) 
       VALUES ( 10, 'MODULE', 1);

INSERT INTO cmn_person (idperson, name, email) 
       VALUES (  0, 'Guest', '');
INSERT INTO cmn_person (idperson, name, email) 
       VALUES (  1, 'Vilson Cristiano Gartner', 'vilson@miolo.org.br');
INSERT INTO cmn_person (idperson, name, email) 
       VALUES (  2, 'Thomas Spriestersbach', 'ts@interact2000.com.br');

--
-- right in cmn_access (Admin group has all rigths in all transactions)
--
-- A_ACCESS  -> 1
-- A_QUERY   -> 1
-- A_INSERT  -> 2
-- A_DELETE  -> 4
-- A_UPDATE  -> 8
-- A_EXECUTE -> 15
-- A_SYSTEM  -> 31
-- A_ADMIN   -> 31
-- A_DEVELOP -> 32

INSERT INTO cmn_access (idgroup, idtransaction, "right") 
       VALUES (  2, 3, 15);
INSERT INTO cmn_access (idgroup, idtransaction, "right") 
       VALUES (  2, 6, 1);
INSERT INTO cmn_access (idgroup, idtransaction, "right") 
       VALUES (  2, 8, 15);
INSERT INTO cmn_access (idgroup, idtransaction, "right") 
       VALUES (  3, 6, 1);

INSERT INTO cmn_user (iduser, login, nickname, theme, "password", confirm_hash, idperson)
       VALUES (1, 'Admin', 'MIOLO Admin', NULL, 'a2a748c9c53cfc96f750245bdbe69ae9', 'a2a748c9c53cfc96f750245bdbe69ae9', 1);
INSERT INTO cmn_user (iduser, login, nickname, theme, "password", confirm_hash, idperson)
       VALUES (2, 'ts', 'Thomas', NULL, '4d682ec4eed27c53849758bc13b6e179', '4d682ec4eed27c53849758bc13b6e179', 2);
INSERT INTO cmn_user (iduser, login, nickname, theme, "password", confirm_hash, idperson)
       VALUES (3, 'vilson', 'Vilson', NULL, 'a2e63ee01401aaeca78be023dfbb8c59', 'a2e63ee01401aaeca78be023dfbb8c59', 1);

INSERT INTO cmn_groupuser (idgroup, iduser) 
       VALUES (  1, 1);
INSERT INTO cmn_groupuser (idgroup, iduser) 
       VALUES (  2, 2);
INSERT INTO cmn_groupuser (idgroup, iduser) 
       VALUES (  2, 3);

----
grant all on database miolo to miolo;

grant all on table cmn_access, cmn_group, cmn_groupuser, 
cmn_log, cmn_module, cmn_news, cmn_person, cmn_session, cmn_table, cmn_transaction, cmn_user
to miolo;

grant all on ga_aluno to miolo;
