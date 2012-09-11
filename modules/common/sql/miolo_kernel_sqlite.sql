BEGIN TRANSACTION;

create table miolo_sequence ( 
    sequence                    character(20),
    value                       integer
);

create table miolo_log ( 
       idlog                         integer  not null,
       timestamp                     timestamp without time zone not null,
       msg                           character(500),
       host                          character(15),
       PRIMARY KEY (idlog)
       );

CREATE INDEX miolo_log_ts_key ON miolo_log(timestamp);

create table miolo_session ( 
       idsession                     integer  not null,
       tsin                          timestamp,
       tsout                         timestamp,
       name                          character(50),
       sid                           character(32),
       forced                        character(1),
       host                          character(15),
       iduser                        integer,
       sessiondata		     text,
       PRIMARY KEY (idsession)
       );

insert into miolo_sequence (sequence,value)
  values ('seq_miolo_log',100);
insert into miolo_sequence (sequence,value)
  values ('seq_miolo_session',100);

END TRANSACTION;