//
// Interbase/Firebird
//

create table ISR_WORD (
   IDWORD  integer NOT NULL,
   WORD    char(50)
);

alter table ISR_WORD add constraint ISR_WORD_PK primary key (IDWORD);
create index IDX_ISR_WORD_WORD on ISR_WORD(WORD);

create table ISR_FIELD (
   IDFIELD  integer NOT NULL,
   TABLENAME    char(50),
   FIELDNAME    char(50)
);

alter table ISR_FIELD add constraint ISR_FIELD_PK primary key (IDFIELD);
create index IDX_ISR_FIELD_TF on ISR_FIELD(TABLENAME, FIELDNAME);

create table ISR_INDEX (
   IDWORD   integer NOT NULL,
   IDFIELD  integer NOT NULL,
   PK       char(50) NOT NULL
);

alter table ISR_INDEX add constraint ISR_INDEX_PK primary key (IDWORD,IDFIELD,PK);

create table ISR_WORDFONO (
   IDWORD  integer NOT NULL,
   WORD    char(50)
);

alter table ISR_WORDFONO add constraint ISR_WORDFONO_PK primary key (IDWORD);
create index IDX_ISR_WORDFONO_WORD on ISR_WORDFONO(WORD);

create table ISR_INDEXFONO (
   IDWORD   integer NOT NULL,
   IDFIELD  integer NOT NULL,
   PK       char(50) NOT NULL
);

alter table ISR_INDEXFONO add constraint ISR_INDEXFONO_PK primary key (IDWORD,IDFIELD,PK);

create generator SEQ_ISR_WORD;
set generator SEQ_ISR_WORD to 1;

create generator SEQ_ISR_FIELD;
set generator SEQ_ISR_FIELD to 1;

//
// Oracle8
//

create sequence SEQ_ISR_WORD increment by 1 minvalue 1;
create sequence SEQ_ISR_FIELD  increment by 1 minvalue 1;

create table ISR_INDEX (
   IDWORD   integer NOT NULL,
   IDFIELD  integer NOT NULL,
   PK       char(50) NOT NULL,
   constraint ISR_INDEX_PK primary key (IDWORD,IDFIELD,PK)
)
ORGANIZATION INDEX;

create table ISR_INDEXFONO (
   IDWORD   integer NOT NULL,
   IDFIELD  integer NOT NULL,
   PK       char(50) NOT NULL,
   constraint ISR_INDEXFONO_PK primary key (IDWORD,IDFIELD,PK)
)
ORGANIZATION INDEX;

create table ISR_WORD (
   IDWORD  integer NOT NULL,
   WORD    char(50)
);

alter table ISR_WORD add constraint ISR_WORD_PK primary key (IDWORD);
create index IDX_ISR_WORD_WORD on ISR_WORD(WORD);

create table ISR_FIELD (
   IDFIELD  integer NOT NULL,
   TABLENAME    char(50),
   FIELDNAME    char(50)
);

alter table ISR_FIELD add constraint ISR_FIELD_PK primary key (IDFIELD);
create index IDX_ISR_FIELD_TF on ISR_FIELD(TABLENAME, FIELDNAME);

create table ISR_WORDFONO (
   IDWORD  integer NOT NULL,
   WORD    char(50)
);

alter table ISR_WORDFONO add constraint ISR_WORDFONO_PK primary key (IDWORD);
create index IDX_ISR_WORDFONO_WORD on ISR_WORDFONO(WORD);

// para recomeçar 

drop sequence SEQ_ISR_WORD;
drop sequence SEQ_ISR_FIELD;

delete from ISR_WORD;
delete from ISR_FIELD;
delete from ISR_INDEX;
delete from ISR_WORDFONO;
delete from ISR_INDEXFONO;
