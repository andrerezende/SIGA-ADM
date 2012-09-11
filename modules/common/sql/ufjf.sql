create sequence seq_cm_common      increment by 1 minvalue 0;
create sequence seq_cm_transacao   increment by 1 minvalue 0;
create sequence seq_cm_sessao      increment by 1 minvalue 0;
create sequence seq_cm_grupo       increment by 1 minvalue 0;
create sequence seq_cm_usuario     increment by 1 minvalue 0;
create sequence seq_cm_log         increment by 1 minvalue 0;
create sequence seq_cm_tabelageral increment by 1 minvalue 0;
create sequence seq_cm_noticia     increment by 1 minvalue 0;
create sequence seq_cm_sistema     increment by 1 minvalue 0;
create sequence seq_cm_pessoa      increment by 1 minvalue 0;

CREATE TABLE CM_INSTITUICAO ( 
       IDINSTITUICAO                 CHARACTER(4)        NOT NULL,
       INSTITUICAO                   CHARACTER VARYING(20),
       NOME                          CHARACTER VARYING(100),
       RUA                           CHARACTER VARYING(50),
       NUMERO                        CHARACTER VARYING(15),
       COMPLEMENTO                   CHARACTER VARYING(15),
       BAIRRO                        CHARACTER VARYING(50),
       CEP                           CHARACTER VARYING(8),
       TELEFONE                      CHARACTER VARYING(15),
       EMAIL                         CHARACTER VARYING(50),
       FAX                           CHARACTER VARYING(15),
       CGC                           CHARACTER VARYING(19),
       CAIXAPOSTAL                   CHARACTER VARYING(15),
       IDPAIS                        CHARACTER(4)        NOT NULL,
       IDMUNICIPIO                   CHARACTER(4)        NOT NULL);


CREATE TABLE CM_SETOR ( 
       IDSETOR                       CHARACTER VARYING(4)     NOT NULL,
       SIGLASETOR                    CHARACTER VARYING(15)     NOT NULL,
       DATAINI                       DATE           NOT NULL,
       NOMESETOR                     CHARACTER VARYING(50),
       TIPOSETOR                     CHARACTER VARYING(20),
       DATAFIM                       DATE,
       FONE                          CHARACTER VARYING(15),
       FAX                           CHARACTER VARYING(15),
       CENTROCUSTO                   CHARACTER VARYING(20),
       OBS                           CHARACTER VARYING(255),
       LOCALIZACAO                   CHARACTER VARYING(15),
       PAISETOR                      CHARACTER VARYING(15),
       PAIRELAT                      CHARACTER VARYING(15),
       IDSETORSIAPE                  CHARACTER(6));

CREATE TABLE CM_PESSOA ( 
       IDPESSOA                      INTEGER NOT NULL,
       NOME                          CHARACTER VARYING(55)     NOT NULL,
       RUA                           CHARACTER VARYING(52),
       NUMERO                        CHARACTER VARYING(15),
       COMPLEMENTO                   CHARACTER VARYING(20),
       BAIRRO                        CHARACTER VARYING(50),
       CEP                           CHARACTER VARYING(8)     NOT NULL,
       DATANASC                      DATE           NOT NULL,
       NOMEPAI                       CHARACTER VARYING(50),
       NOMEMAE                       CHARACTER VARYING(50),
       SEXO                          CHARACTER(1)        NOT NULL,
       ANOCHEGBRASIL                 CHARACTER VARYING(4),
       TELEFONE                      CHARACTER VARYING(20),
       CELULAR                       CHARACTER VARYING(20),
       EMAIL                         CHARACTER VARYING(50),
       GRUPOSANGUINEO                CHARACTER VARYING(3),
       CPF                           CHARACTER VARYING(11),
       NUMRG                         CHARACTER VARYING(15),
       TIPORG                        CHARACTER VARYING(20),
       ORGAORG                       CHARACTER VARYING(20),
       UFRG                          CHARACTER(2),
       NUMCARTPRO                    CHARACTER VARYING(7),
       SERIECARTPRO                  CHARACTER VARYING(4),
       UFCARTPRO                     CHARACTER(2),
       TITULOELEITOR                 CHARACTER VARYING(12),
       ZONATITULO                    CHARACTER VARYING(3),
       SECAOTITULO                   CHARACTER VARYING(4),
       UFTITULO                      CHARACTER(2),
       NUMDOCMILITAR                 CHARACTER VARYING(12),
       SERIEDOCMILITAR               CHARACTER(1),
       CATEGDOCMILITAR               CHARACTER VARYING(1),
       CONTA                         CHARACTER VARYING(20),
       NUMCERT                       CHARACTER VARYING(6),
       LIVROCERT                     CHARACTER VARYING(10),
       FOLHACERT                     CHARACTER VARYING(3),
       CARTORIO                      CHARACTER VARYING(60),
       PISPASEP                      CHARACTER VARYING(11),
       DATAPISPASEP                  DATE,
       BANCOPISPASEP                 CHARACTER VARYING(3),
       IDENTPROF                     CHARACTER VARYING(15),
       TIPOIDENTPROF                 CHARACTER VARYING(20),
       IDPAIS                        CHARACTER(4)        NOT NULL,
       IDMUNICIPIO                   CHARACTER(4)        NOT NULL,
       IDMUNICIPIONASCIMENTO         CHARACTER(4),
       IDPAISNASCIMENTO              CHARACTER(4)        NOT NULL,
       IDESTADOCIVIL                 CHARACTER(1),
       IDBANCO                       CHARACTER(3),
       IDAGENC                       CHARACTER(7));

CREATE TABLE CM_PAIS ( 
       IDPAIS                        CHARACTER(4)        NOT NULL,
       PAIS                          CHARACTER VARYING(50),
       NACIONALIDADE                 CHARACTER VARYING(50));

CREATE TABLE CM_MUNICIPIO ( 
       IDMUNICIPIO                   CHARACTER(4)        NOT NULL,
       MUNICIPIO                     CHARACTER VARYING(50),
       IDUF                          CHARACTER(4)        NOT NULL);

CREATE TABLE CM_UF ( 
       IDUF                          CHARACTER(4)        NOT NULL,
       UF                            CHARACTER VARYING(50));

CREATE TABLE CM_ESTADOCIVIL ( 
       IDESTADOCIVIL                 CHARACTER(1)        NOT NULL,
       ESTADOCIVIL                   CHARACTER VARYING(30));

CREATE TABLE CM_BANCO ( 
       IDBANCO                       CHARACTER(3)        NOT NULL,
       NOME                          CHARACTER VARYING(50));

CREATE TABLE CM_USUARIO ( 
       IDUSUARIO                     INTEGER    NOT NULL,
       LOGIN                         CHARACTER VARYING(20)     NOT NULL,
       PASSWORD                      CHARACTER VARYING(20)     NOT NULL,
       NICK                          CHARACTER VARYING(20),
       PASSMD5                       CHARACTER VARYING(32),
       IDPESSOA                      INTEGER,
       IDSETOR                       CHARACTER VARYING(4));

CREATE TABLE CM_LOG ( 
       IDLOG                         INTEGER  NOT NULL,
       TIMESTAMP                     DATE           NOT NULL,
       DESCRICAO                     CHARACTER VARYING(200),
       OPERACAO                      CHARACTER(3),
       MODULO                        CHARACTER VARYING(20)     NOT NULL,
       CLASSE                        CHARACTER VARYING(30)     NOT NULL,
       IDUSUARIO                     INTEGER  NOT NULL);

CREATE TABLE CM_GRUPOACESSO ( 
       IDGRUPO                       INTEGER  NOT NULL,
       GRUPO                         CHARACTER VARYING(50));

CREATE TABLE CM_TRANSACAO ( 
       IDTRANS                       INTEGER   NOT NULL,
       TRANSACAO                     CHARACTER VARYING(30),
       IDSISTEMA                     INTEGER);

CREATE TABLE CM_SISTEMA ( 
       IDSISTEMA                     INTEGER  NOT NULL,
       SISTEMA                       CHARACTER VARYING(30));

CREATE TABLE CM_TABELAGERAL ( 
       IDTABELAGERAL                 INTEGER NOT NULL,
       TABELA                        CHARACTER VARYING(30)     NOT NULL,
       ITEM1                         CHARACTER VARYING(30)     NOT NULL,
       ITEM2                         CHARACTER VARYING(30),
       ITEM3                         CHARACTER VARYING(200));

CREATE TABLE CM_SESSAO ( 
       IDSESSAO                      INTEGER  NOT NULL,
       TSIN                          TIMESTAMP,
       TSOUT                         TIMESTAMP,
       NAME                          CHARACTER VARYING(50),
       SID                           CHARACTER(32),
       FORCED                        CHARACTER(1),
       REMOTEADDR                    CHARACTER VARYING(15),
       IDUSUARIO                     INTEGER NOT NULL);


CREATE TABLE CM_AGENCIA ( 
       IDBANCO                       CHARACTER(3)        NOT NULL,
       IDAGENC                       CHARACTER(7)        NOT NULL,
       NOME                          CHARACTER VARYING(50));

CREATE TABLE CM_NOTICIA ( 
       IDSISTEMA                     INTEGER  NOT NULL,
       IDNOTICIA                     INTEGER  NOT NULL,
       DTNOTICIA                     DATE,
       NOTICIA                       CHARACTER VARYING(500));

CREATE TABLE CM_GRPUSUARIO ( 
       IDGRUPO                       INTEGER NOT NULL,
       IDUSUARIO                     INTEGER NOT NULL);

CREATE TABLE CM_ACESSO ( 
       IDGRUPO                       INTEGER   NOT NULL,
       IDTRANS                       INTEGER   NOT NULL,
       DIREITO                       CHARACTER VARYING(5)     NOT NULL);

CREATE TABLE CM_SETORACESSO ( 
       IDSETOR_1                     CHARACTER VARYING(4)     NOT NULL,
       IDSETOR                       CHARACTER VARYING(4)     NOT NULL,
       FINALIDADE                    CHARACTER VARYING(15));


ALTER TABLE CM_INSTITUICAO ADD CONSTRAINT PK_CM_INSTITUICAO PRIMARY KEY(IDINSTITUICAO);

ALTER TABLE CM_SETOR ADD CONSTRAINT PK_CM_SETOR PRIMARY KEY(IDSETOR);

ALTER TABLE CM_PESSOA ADD CONSTRAINT PK_CM_PESSOA PRIMARY KEY(IDPESSOA);

ALTER TABLE CM_PAIS ADD CONSTRAINT PK_CM_PAIS PRIMARY KEY(IDPAIS);

ALTER TABLE CM_MUNICIPIO ADD CONSTRAINT PK_CM_MUNICIPIO PRIMARY KEY(IDMUNICIPIO);

ALTER TABLE CM_UF ADD CONSTRAINT PK_CM_UF PRIMARY KEY(IDUF);

ALTER TABLE CM_ESTADOCIVIL ADD CONSTRAINT PK_CM_ESTADOCIVIL PRIMARY KEY(IDESTADOCIVIL);

ALTER TABLE CM_BANCO ADD CONSTRAINT PK_CM_BANCO PRIMARY KEY(IDBANCO);

ALTER TABLE CM_USUARIO ADD CONSTRAINT PK_CM_USUARIO PRIMARY KEY(IDUSUARIO);

ALTER TABLE CM_LOG ADD CONSTRAINT PK_CM_LOG PRIMARY KEY(IDLOG);

ALTER TABLE CM_GRUPOACESSO ADD CONSTRAINT PK_CM_GRUPOACESSO PRIMARY KEY(IDGRUPO);

ALTER TABLE CM_TRANSACAO ADD CONSTRAINT PK_CM_TRANSACAO PRIMARY KEY(IDTRANS);

ALTER TABLE CM_SISTEMA ADD CONSTRAINT PK_CM_SISTEMA PRIMARY KEY(IDSISTEMA);

ALTER TABLE CM_TABELAGERAL ADD CONSTRAINT PK_CM_TABELAGERAL PRIMARY KEY(IDTABELAGERAL);

ALTER TABLE CM_SESSAO ADD CONSTRAINT PK_CM_SESSAO PRIMARY KEY(IDSESSAO);

ALTER TABLE CM_AGENCIA ADD CONSTRAINT PK_CM_AGENCIA PRIMARY KEY(IDBANCO,IDAGENC);

ALTER TABLE CM_NOTICIA ADD CONSTRAINT PK_CM_NOTICIA PRIMARY KEY(IDSISTEMA,IDNOTICIA);

ALTER TABLE CM_GRPUSUARIO ADD CONSTRAINT PK_CM_GRPUSUARIO PRIMARY KEY(IDGRUPO,IDUSUARIO);

ALTER TABLE CM_ACESSO ADD CONSTRAINT PK_CM_ACESSO PRIMARY KEY(IDGRUPO,IDTRANS);

ALTER TABLE CM_SETORACESSO ADD CONSTRAINT PK_CM_SETORACESSO PRIMARY KEY(IDSETOR_1,IDSETOR);

ALTER TABLE CM_INSTITUICAO ADD CONSTRAINT FK_CM_INSTITUICAO2_CM_MU FOREIGN KEY(IDMUNICIPIO) REFERENCES CM_MUNICIPIO;

ALTER TABLE CM_INSTITUICAO ADD CONSTRAINT FK_CM_INSTITUICAO1_CM_PA FOREIGN KEY(IDPAIS) REFERENCES CM_PAIS;

ALTER TABLE CM_PESSOA ADD CONSTRAINT FK_CM_PESSOA7_CM_AG FOREIGN KEY(IDBANCO,IDAGENC) REFERENCES CM_AGENCIA;

ALTER TABLE CM_PESSOA ADD CONSTRAINT FK_CM_PESSOA6_CM_ES FOREIGN KEY(IDESTADOCIVIL) REFERENCES CM_ESTADOCIVIL;

ALTER TABLE CM_PESSOA ADD CONSTRAINT FK_CM_PESSOA3_CM_MU FOREIGN KEY(IDMUNICIPIO) REFERENCES CM_MUNICIPIO;

ALTER TABLE CM_PESSOA ADD CONSTRAINT FK_CM_PESSOA4_CM_MU FOREIGN KEY(IDMUNICIPIONASCIMENTO) REFERENCES CM_MUNICIPIO;

ALTER TABLE CM_PESSOA ADD CONSTRAINT FK_CM_PESSOA2_CM_PA FOREIGN KEY(IDPAIS) REFERENCES CM_PAIS;

ALTER TABLE CM_PESSOA ADD CONSTRAINT FK_CM_PESSOA5_CM_PA FOREIGN KEY(IDPAISNASCIMENTO) REFERENCES CM_PAIS;

ALTER TABLE CM_MUNICIPIO ADD CONSTRAINT FK_CM_MUNICIPIO1_CM_UF FOREIGN KEY(IDUF) REFERENCES CM_UF;

ALTER TABLE CM_USUARIO ADD CONSTRAINT FK_CM_USUARIO1_CM_PE FOREIGN KEY(IDPESSOA) REFERENCES CM_PESSOA;

ALTER TABLE CM_USUARIO ADD CONSTRAINT FK_CM_USUARIO2_CM_SE FOREIGN KEY(IDSETOR) REFERENCES CM_SETOR;


ALTER TABLE CM_LOG ADD CONSTRAINT FK_CM_LOG1_CM_US FOREIGN KEY(IDUSUARIO) REFERENCES CM_USUARIO;

ALTER TABLE CM_TRANSACAO ADD CONSTRAINT FK_CM_TRANSACAO1_CM_SI FOREIGN KEY(IDSISTEMA) REFERENCES CM_SISTEMA;

ALTER TABLE CM_SESSAO ADD CONSTRAINT FK_CM_SESSAO1_CM_US FOREIGN KEY(IDUSUARIO) REFERENCES CM_USUARIO;

ALTER TABLE CM_AGENCIA ADD CONSTRAINT FK_CM_AGENCIA1_CM_BA FOREIGN KEY(IDBANCO) REFERENCES CM_BANCO ON DELETE CASCADE;

ALTER TABLE CM_NOTICIA ADD CONSTRAINT FK_CM_NOTICIA1_CM_SI FOREIGN KEY(IDSISTEMA) REFERENCES CM_SISTEMA ON DELETE CASCADE;

ALTER TABLE CM_GRPUSUARIO ADD CONSTRAINT FK_CM_GRPUSUARIO2_CM_GR FOREIGN KEY(IDGRUPO) REFERENCES CM_GRUPOACESSO ON DELETE CASCADE;

ALTER TABLE CM_GRPUSUARIO ADD CONSTRAINT FK_CM_GRPUSUARIO1_CM_US FOREIGN KEY(IDUSUARIO) REFERENCES CM_USUARIO ON DELETE CASCADE;

ALTER TABLE CM_ACESSO ADD CONSTRAINT FK_CM_ACESSO2_CM_GR FOREIGN KEY(IDGRUPO) REFERENCES CM_GRUPOACESSO ON DELETE CASCADE;


ALTER TABLE CM_SETORACESSO ADD CONSTRAINT FK_CM_SETORACESSO1_CM_SE FOREIGN KEY(IDSETOR) REFERENCES CM_SETOR ON DELETE CASCADE;

alter table cm_usuario add constraint UK_CM_USUARIO_LOGIN UNIQUE (LOGIN);


ALTER TABLE CM_SETORACESSO ADD CONSTRAINT FK_CM_SETORACESSO2_CM_SE FOREIGN KEY(IDSETOR_1) REFERENCES CM_SETOR ON DELETE CASCADE;

ALTER TABLE CM_ACESSO ADD CONSTRAINT FK_CM_ACESSO1_CM_TR FOREIGN KEY(IDTRANS) REFERENCES CM_TRANSACAO ON DELETE CASCADE;


insert into cm_pais (idpais, pais, nacionalidade)
  values (1,'BRASIL','BRASILEIRA');

insert into cm_uf (iduf,uf) values ('MG','MINAS GERAIS');

insert into cm_municipio(IDMUNICIPIO,MUNICIPIO,IDUF)
  values (3912,'JUIZ DE FORA','MG');


INSERT INTO CM_PESSOA
(IDPESSOA,NOME,CEP,DATANASC,SEXO,IDPAIS,IDMUNICIPIO,
IDMUNICIPIONASCIMENTO,IDPAISNASCIMENTO)
VALUES
( nextval('seq_cm_pessoa'),
'ELY EDISON MATOS',
'3610000',
'01/01/01',
'M',
1, 3912,3912,1)
;

insert into cm_setor(IDSETOR,SIGLASETOR,DATAINI,NOMESETOR)
  values (1,'REITORIA','01/01/01','REITORIA DA UFJF');



insert into cm_usuario (idusuario, idpessoa, idsetor, login, password)
  values (1,1,1, 'admin','admin');
insert into cm_usuario (idusuario, idpessoa, idsetor, login, password)
  values (2,1,1, '2146509','azul');

insert into cm_sistema (idsistema, sistema) values (1, 'COMMON');
insert into cm_sistema (idsistema, sistema) values (2, 'SIGA');

insert into cm_transacao (idtrans,transacao,idsistema) values (0,'ALL',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (1,'ADMIN',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (2,'TRANSACAO',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (3,'USUARIO',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (4,'SISTEMA',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (5,'SETOR',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (6,'GRUPOACESSO',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (7,'LOG',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (8,'NOTICIA',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (9,'BANCO',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (10,'AGENCIA',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (11,'ESTADOCIVIL',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (12,'INSTITUICAO',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (13,'MUNICIPIO',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (14,'PAIS',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (15,'UF',1);
insert into cm_transacao (idtrans,transacao,idsistema) values (16,'DISCIPLINA',2);
insert into cm_transacao (idtrans,transacao,idsistema) values (17,'ALUNO',2);
insert into cm_transacao (idtrans,transacao,idsistema) values (18,'DOCENTE',2);
insert into cm_transacao (idtrans,transacao,idsistema) values (19,'CURRICULO',2);
insert into cm_transacao (idtrans,transacao,idsistema) values (20,'CURSO',2);
insert into cm_transacao (idtrans,transacao,idsistema) values (21,'REQUISITO',2);
insert into cm_transacao (idtrans,transacao,idsistema) values (22,'EQUIVALENCIA',2);
insert into cm_transacao (idtrans,transacao,idsistema) values (23,'GRADE',2);
insert into cm_transacao (idtrans,transacao,idsistema) values (24,'PLANODEP',2);
insert into cm_transacao (idtrans,transacao,idsistema) values (25,'DEVEL',1);

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


grant all on table 
CM_INSTITUICAO ,
CM_SETOR ,
CM_PESSOA ,
CM_PAIS ,
CM_MUNICIPIO ,
CM_UF ,
CM_ESTADOCIVIL ,
CM_BANCO ,
CM_USUARIO ,
CM_LOG ,
CM_GRUPOACESSO ,
CM_TRANSACAO ,
CM_SISTEMA ,
CM_TABELAGERAL ,
CM_SESSAO ,
CM_AGENCIA ,
CM_NOTICIA , 
CM_GRPUSUARIO ,
CM_ACESSO ,
CM_SETORACESSO 
to ufjf;

