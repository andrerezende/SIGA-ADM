drop sequence seq_rh_capacitacao;
create sequence seq_rh_capacitacao increment BY 1 minvalue 1 nocache;

create table rh_capacitacaocurso (
   idcurso		char(5)		not null,
   nome			varchar2(100)	not null,
   modulo		varchar2(100)	,
   datainicio		date		,
   datafim		date		,
   horainicio		char(5)		,
   horafim		char(5)		,
   cargahoraria		char(5)		,
   local		varchar2(100)	,
   vagas                char(3)         ,
   turno                char(1)         ,
   status		char(1)
);

alter table rh_capacitacaocurso add constraint pk_rh_capacitacaocurso primary key (idcurso);

create table rh_capacitacaoinsc (
   inscricao		number(5)	not null,
   idvinculo		char(7)		not null,
   idcurso		char(5)		not null,
   telefone		char(10)	,
   turno		char(10)	,
   ambiente		varchar2(100)	,
   justificativa	varchar2(2000)	,
   status		char(1)         ,
   ts			char(20)	not null,
   idauth               char(7)         ,
   tsauth               char(20)
);

alter table rh_capacitacaoinsc add constraint pk_rh_capacitacaoinsc primary key (inscricao);
alter table rh_capacitacaoinsc add constraint fk_rh_capacitacaoinsc_vinculo foreign key (idvinculo) references rh_vinculo(idvinculo);
alter table rh_capacitacaoinsc add constraint fk_rh_capacitacaoinsc_curso foreign key (idcurso) references rh_capacitacaocurso(idcurso);

insert into rh_capacitacaocurso values ('00001','Gestão e Tecnologia de Alimentos','','06/06/07','06/07/07','10:00','12:00','90','Somewhere','A');
insert into rh_capacitacaocurso values ('00002','Seminário de Integração servidores PRORH','','10/06/07','10/07/07','10:00','12:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00003','Seminário de integração para servidores ingressantes e aposentados','','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00004','Mostra de Artes "Um artista ao seu lado"','','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00005','Desenvolvimento Gerencial','Ética','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00006','Desenvolvimento Gerencial','Relações interpessoais','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00007','Desenvolvimento Gerencial','Motivação e auto-motivação','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00008','Desenvolvimento Gerencial','Empreendedorismo no trabalho','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00009','Desenvolvimento Gerencial','Formação de Equipes de alta performance','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00010','Desenvolvimento Gerencial','Instrumentos de melhoria de processos aplicáveis ao serviço público','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00011','Desenvolvimento Gerencial','Introdução ao Direito Público com foco no Direito Administrativo','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00012','Desenvolvimento Gerencial','Gestão da mudança e Clima Organizacional','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00013','Desenvolvimento Gerencial','Como avaliar o desempenho humano','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00014','Desenvolvimento Gerencial','Gestão por competências','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');
insert into rh_capacitacaocurso values ('00015','Informática','','06/06/07','06/07/07','08:00','10:00','4','Somewhere','A');

create unique index idx_rh_capacitacaoinsc on rh_capacitacaoinsc(idcurso,idvinculo);

-- 2008

create table rh_capacitacaocoinc (
   idcurso1		char(5)		not null,
   idcurso2		char(5)		not null
);

alter table rh_capacitacaocoinc add constraint pk_rh_capacitacaocoinc primary key (idcurso1,idcurso2);
alter table rh_capacitacaocoinc add constraint fk_rh_capcoinc_idcurso1 foreign key (idcurso1) references rh_capacitacaocurso(idcurso);
alter table rh_capacitacaocoinc add constraint fk_rh_capcoinc_idcurso2 foreign key (idcurso2) references rh_capacitacaocurso(idcurso);

insert into rh_capacitacaocoinc values ('09013',	'09073');
insert into rh_capacitacaocoinc values ('09013',	'09083');
insert into rh_capacitacaocoinc values ('09013',	'09113');
insert into rh_capacitacaocoinc values ('09013',	'09133');
insert into rh_capacitacaocoinc values ('09023',	'09123');
insert into rh_capacitacaocoinc values ('09023',	'09143');
insert into rh_capacitacaocoinc values ('09031',	'09091');
insert into rh_capacitacaocoinc values ('09041',	'09091');
insert into rh_capacitacaocoinc values ('09052',	'09102');
insert into rh_capacitacaocoinc values ('09062',	'09102');
insert into rh_capacitacaocoinc values ('09073',	'09013');
insert into rh_capacitacaocoinc values ('09083',	'09013');
insert into rh_capacitacaocoinc values ('09091',	'09031');
insert into rh_capacitacaocoinc values ('09091',	'09041');
insert into rh_capacitacaocoinc values ('09102',	'09052');
insert into rh_capacitacaocoinc values ('09102',	'09062');
insert into rh_capacitacaocoinc values ('09113',	'09013');
insert into rh_capacitacaocoinc values ('09113',	'09133');
insert into rh_capacitacaocoinc values ('09123',	'09023');
insert into rh_capacitacaocoinc values ('09123',	'09143');
insert into rh_capacitacaocoinc values ('09133',	'09113');
insert into rh_capacitacaocoinc values ('09133',	'09013');
insert into rh_capacitacaocoinc values ('09143',	'09123');
insert into rh_capacitacaocoinc values ('09143',	'09023');

drop sequence seq_rh_capacitacao;
create sequence seq_rh_capacitacao increment BY 1 minvalue 5000 nocache;   

