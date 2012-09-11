create table cm_instituicao ( 
       idinstituicao                 character(4)        not null primary key,
       instituicao                   varchar(20),
       nome                          varchar(100),
       rua                           varchar(50),
       numero                        varchar(15),
       complemento                   varchar(15),
       bairro                        varchar(50),
       cep                           varchar(8),
       telefone                      varchar(15),
       email                         varchar(50),
       fax                           varchar(15),
       cgc                           varchar(19),
       caixapostal                   varchar(15),
       idpais                        character(4)        not null,
       idmunicipio                   character(4)        not null);


create table cm_setor ( 
       idsetor                       varchar(4)     not null primary key,
       siglasetor                    varchar(15)     not null,
       dataini                       date           not null,
       nomesetor                     varchar(50),
       tiposetor                     varchar(20),
       datafim                       date,
       fone                          varchar(15),
       fax                           varchar(15),
       centrocusto                   varchar(20),
       obs                           varchar(255),
       localizacao                   varchar(15),
       paisetor                      varchar(15),
       pairelat                      varchar(15),
       idsetorsiape                  character(6));

create table cm_pessoa ( 
       idpessoa                      int not null auto_increment  primary key,
       nome                          varchar(55)     not null,
       rua                           varchar(52),
       numero                        varchar(15),
       complemento                   varchar(20),
       bairro                        varchar(50),
       cep                           varchar(8)     not null,
       datanasc                      date           not null,
       nomepai                       varchar(50),
       nomemae                       varchar(50),
       sexo                          character(1)        not null,
       anochegbrasil                 varchar(4),
       telefone                      varchar(20),
       celular                       varchar(20),
       email                         varchar(50),
       gruposanguineo                varchar(3),
       cpf                           varchar(11),
       numrg                         varchar(15),
       tiporg                        varchar(20),
       orgaorg                       varchar(20),
       ufrg                          character(2),
       numcartpro                    varchar(7),
       seriecartpro                  varchar(4),
       ufcartpro                     character(2),
       tituloeleitor                 varchar(12),
       zonatitulo                    varchar(3),
       secaotitulo                   varchar(4),
       uftitulo                      character(2),
       numdocmilitar                 varchar(12),
       seriedocmilitar               character(1),
       categdocmilitar               varchar(1),
       conta                         varchar(20),
       numcert                       varchar(6),
       livrocert                     varchar(10),
       folhacert                     varchar(3),
       cartorio                      varchar(60),
       pispasep                      varchar(11),
       datapispasep                  date,
       bancopispasep                 varchar(3),
       identprof                     varchar(15),
       tipoidentprof                 varchar(20),
       idpais                        character(4)        not null,
       idmunicipio                   character(4)        not null,
       idmunicipionascimento         character(4),
       idpaisnascimento              character(4)        not null,
       idestadocivil                 character(1),
       idbanco                       character(3),
       idagenc                       character(7));

create table cm_pais ( 
       idpais                        character(4)        not null primary key,
       pais                          varchar(50),
       nacionalidade                 varchar(50));

create table cm_municipio ( 
       idmunicipio                   character(4)        not null primary key,
       municipio                     varchar(50),
       iduf                          character(4)        not null);

create table cm_uf ( 
       iduf                          character(4)        not null primary key,
       uf                            varchar(50));

create table cm_estadocivil ( 
       idestadocivil                 character(1)        not null primary key,
       estadocivil                   varchar(30));

create table cm_banco ( 
       idbanco                       character(3)        not null primary key,
       nome                          varchar(50));

create table cm_usuario ( 
       idusuario                     int    not null auto_increment primary key,
       login                         varchar(20)     not null,
       password                      varchar(20)     not null,
       nick                          varchar(20),
       passmd5                       varchar(32),
       idpessoa                      int,
       idsetor                       varchar(4));

create table cm_log ( 
       idlog                         int  not null auto_increment primary key,
       timestamp                     date           not null,
       descricao                     varchar(200),
       operacao                      character(3),
       modulo                        varchar(20)     not null,
       classe                        varchar(30)     not null,
       idusuario                     int  not null);

create table cm_grupoacesso ( 
       idgrupo                       int  not null auto_increment primary key,
       grupo                         varchar(50));

create table cm_transacao ( 
       idtrans                       int   not null auto_increment primary key,
       transacao                     varchar(30),
       idsistema                     int);

create table cm_sistema ( 
       idsistema                     int  not null auto_increment primary key,
       sistema                       varchar(30));

create table cm_tabelageral ( 
       idtabelageral                 int not null auto_increment primary key,
       tabela                        varchar(30)     not null,
       item1                         varchar(30)     not null,
       item2                         varchar(30),
       item3                         varchar(200));

create table cm_sessao ( 
       idsessao                      int  not null auto_increment primary key,
       tsin                          timestamp,
       tsout                         timestamp,
       name                          varchar(50),
       sid                           character(32),
       forced                        character(1),
       remoteaddr                    varchar(15),
       idusuario                     int not null);



create table cm_grpusuario ( 
       idgrupo                       int not null,
       idusuario                     int not null);

create table cm_acesso ( 
       idgrupo                       int   not null,
       idtrans                       int   not null,
       direito                       varchar(5)     not null);

create table cm_agencia ( 
       idbanco                       character(3)        not null,
       idagenc                       character(7)        not null,
       nome                          varchar(50));

create table cm_noticia ( 
       idsistema                     int  not null,
       idnoticia                     int  not null,
       dtnoticia                     date,
       noticia                       varchar(200));

create table cm_setoracesso ( 
       idsetor_1                     varchar(4)     not null,
       idsetor                       varchar(4)     not null,
       finalidade                    varchar(15));


alter table cm_agencia add constraint pk_cm_agencia primary key(idbanco,idagenc);

alter table cm_noticia add constraint pk_cm_noticia primary key(idsistema,idnoticia);

alter table cm_grpusuario add constraint pk_cm_grpusuario primary key(idgrupo,idusuario);

alter table cm_acesso add constraint pk_cm_acesso primary key(idgrupo,idtrans);

alter table cm_setoracesso add constraint pk_cm_setoracesso primary key(idsetor_1,idsetor);

insert into cm_pais (idpais, pais, nacionalidade)
  values (1,'BRASIL','BRASILEIRA');

insert into cm_uf (iduf,uf) values ('MG','MINAS GERAIS');

insert into cm_municipio(IDMUNICIPIO,MUNICIPIO,IDUF)
  values (3912,'JUIZ DE FORA','MG');


INSERT INTO cm_pessoa
(nome,cep,datanasc,sexo,idpais,idmunicipio,idmunicipionascimento,idpaisnascimento)
VALUES
('Administrador',
'3610000',
'01/01/01',
'M',
1, 3912,3912,1)
;

insert into cm_setor(idsetor,siglasetor,dataini,nomesetor,tiposetor)
  values (1,'REITORIA','01/01/01','REITORIA DA UFJF', 'UNIDADE');



insert into cm_usuario (idusuario, idpessoa, idsetor, login, password)
  values (1,1,1, 'admin','admin');
insert into cm_usuario (idusuario, idpessoa, idsetor, login, password)
  values (2,1,1, '2146509','azul');

insert into cm_sistema (idsistema, sistema) values (1, 'COMMON');
insert into cm_sistema (idsistema, sistema) values (2, 'SIGA');

insert into cm_transacao (transacao,idsistema) values ('ALL',1);
insert into cm_transacao (transacao,idsistema) values ('ADMIN',1);
insert into cm_transacao (transacao,idsistema) values ('TRANSACAO',1);
insert into cm_transacao (transacao,idsistema) values ('USUARIO',1);
insert into cm_transacao (transacao,idsistema) values ('SISTEMA',1);
insert into cm_transacao (transacao,idsistema) values ('SETOR',1);
insert into cm_transacao (transacao,idsistema) values ('GRUPOACESSO',1);
insert into cm_transacao (transacao,idsistema) values ('LOG',1);
insert into cm_transacao (transacao,idsistema) values ('NOTICIA',1);
insert into cm_transacao (transacao,idsistema) values ('BANCO',1);
insert into cm_transacao (transacao,idsistema) values ('AGENCIA',1);
insert into cm_transacao (transacao,idsistema) values ('ESTADOCIVIL',1);
insert into cm_transacao (transacao,idsistema) values ('INSTITUICAO',1);
insert into cm_transacao (transacao,idsistema) values ('MUNICIPIO',1);
insert into cm_transacao (transacao,idsistema) values ('PAIS',1);
insert into cm_transacao (transacao,idsistema) values ('UF',1);
insert into cm_transacao (transacao,idsistema) values ('DISCIPLINA',2);
insert into cm_transacao (transacao,idsistema) values ('ALUNO',2);
insert into cm_transacao (transacao,idsistema) values ('DOCENTE',2);
insert into cm_transacao (transacao,idsistema) values ('CURRICULO',2);
insert into cm_transacao (transacao,idsistema) values ('CURSO',2);
insert into cm_transacao (transacao,idsistema) values ('REQUISITO',2);
insert into cm_transacao (transacao,idsistema) values ('EQUIVALENCIA',2);
insert into cm_transacao (transacao,idsistema) values ('GRADE',2);
insert into cm_transacao (transacao,idsistema) values ('PLANODEP',2);
insert into cm_transacao (transacao,idsistema) values ('DEVEL',1);

insert into cm_grupoacesso (idgrupo, grupo) values (1,'ADMIN');
insert into cm_grupoacesso (idgrupo, grupo) values (2,'COMMON_RO');
insert into cm_grupoacesso (idgrupo, grupo) values (3,'COMMON_RW');
insert into cm_grupoacesso (idgrupo, grupo) values (4,'SIGA_RO');
insert into cm_grupoacesso (idgrupo, grupo) values (5,'SIGA_RW');
insert into cm_grupoacesso (idgrupo, grupo) values (6,'SIGA_COORDCURSO');
insert into cm_grupoacesso (idgrupo, grupo) values (7,'SIGA_PLANODEP');
insert into cm_grupoacesso (idgrupo, grupo) values (8,'DEVEL');

insert into cm_acesso(idgrupo, idtrans, direito) values (1,0,31);
insert into cm_acesso(idgrupo, idtrans, direito) values (8,25,31);

insert into cm_grpusuario (idgrupo, idusuario) values (1,1);
insert into cm_grpusuario (idgrupo, idusuario) values (1,2);
insert into cm_grpusuario (idgrupo, idusuario) values (8,1);


