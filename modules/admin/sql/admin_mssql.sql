-- Simulating Oracle Sequences in T-SQL Code
-- ref: http://www.sqlmag.com/Article/ArticleID/46900/sql_server_46900.html

-- example usage
--     exec sp_CreateSequence 'prod_seq' 
--     DECLARE @n int 
--     select dbo.CurrVal ('prod_seq')
--     exec NextVal 'prod_seq',@n output
--     print @n

Create proc sp_CreateSequence (@sequenceName varchar(40),
@startVal int =1,
@increment int =1)
AS
BEGIN
   declare @sqlStmt varchar(100)
   set nocount on
   set @sqlStmt = 'Create Table ' + @sequenceName + 
      ' ( sqVal int IDENTITY (' + convert (varchar(10),@startVal) + ',' + 
      convert (varchar(10),@increment) + '))'
   exec (@sqlStmt)
   set nocount off
end
go

Create function dbo.CurrVal (@sequenceName varchar(40))
returns int
as
   begin
      return (IDENT_CURRENT(@sequenceName))
   end
go

Create proc NextVal (@sequenceName varchar(40) , 
@nextVal int output)
as
begin
   declare @sqlStmt varchar(100)
   set nocount on
   set @sqlStmt = 'insert ' + @sequenceName + ' DEFAULT VALUES '
   exec (@sqlStmt)
   SET @nextVal=IDENT_CURRENT(@sequenceName)
   set nocount off
end 
go




exec sp_CreateSequence 'seq_miolo_user'
go
exec sp_CreateSequence 'seq_miolo_transaction'
go
exec sp_CreateSequence 'seq_miolo_group'
go
exec sp_CreateSequence 'seq_miolo_session'
go
exec sp_CreateSequence 'seq_miolo_log'
go

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

go

DECLARE @n int 

exec NextVal 'seq_miolo_user',@n output
insert into miolo_user (iduser,login,name,nickname,m_password,confirm_hash,theme)
   values (@n,'admin','Miolo Administrator','admin','admin','','miolo');
exec NextVal 'seq_miolo_user',@n output
insert into miolo_user (iduser,login,name,nickname,m_password,confirm_hash,theme)
   values (@n,'guest','Guest User','guest','guest','','miolo');

exec NextVal 'seq_miolo_transaction',@n output
insert into miolo_transaction (idtransaction, m_transaction) values (@n,'ADMIN');
exec NextVal 'seq_miolo_transaction',@n output
insert into miolo_transaction (idtransaction, m_transaction) values (@n,'USER');
exec NextVal 'seq_miolo_transaction',@n output
insert into miolo_transaction (idtransaction, m_transaction) values (@n,'GROUP');
exec NextVal 'seq_miolo_transaction',@n output
insert into miolo_transaction (idtransaction, m_transaction) values (@n,'LOG');
exec NextVal 'seq_miolo_transaction',@n output
insert into miolo_transaction (idtransaction, m_transaction) values (@n,'TRANSACTION');
exec NextVal 'seq_miolo_transaction',@n output
insert into miolo_transaction (idtransaction, m_transaction) values (@n,'SESSION');

exec NextVal 'seq_miolo_group',@n output
insert into miolo_group (idgroup, m_group) values (@n,'ADMIN');
exec NextVal 'seq_miolo_group',@n output
insert into miolo_group (idgroup, m_group) values (@n,'MAIN_RO');
exec NextVal 'seq_miolo_group',@n output
insert into miolo_group (idgroup, m_group) values (@n,'MAIN_RW');

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
