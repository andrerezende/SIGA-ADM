---
--- Miolo 1.5: Postgres Database Common
---

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;

---
--- Sequences
---

create sequence seq_cm_common      
    start with 100
    increment by 1
    no maxvalue
    minvalue 100
    cache 1;

create sequence seq_cm_transacao
    start with 100
    increment by 1
    no maxvalue
    minvalue 100
    cache 1;

create sequence seq_cm_sessao
    start with 100
    increment by 1
    no maxvalue
    minvalue 100
    cache 1;

create sequence seq_cm_grupo
    start with 100
    increment by 1
    no maxvalue
    minvalue 100
    cache 1;

create sequence seq_cm_usuario
    start with 100
    increment by 1
    no maxvalue
    minvalue 100
    cache 1;

create sequence seq_cm_log
    start with 100
    increment by 1
    no maxvalue
    minvalue 100
    cache 1;

create sequence seq_cm_tabelageral
    start with 100
    increment by 1
    no maxvalue
    minvalue 100
    cache 1;

create sequence seq_cm_noticia
    start with 100
    increment by 1
    no maxvalue
    minvalue 100
    cache 1;

create sequence seq_cm_sistema
    start with 100
    increment by 1
    no maxvalue
    minvalue 100
    cache 1;

create sequence seq_cm_pessoa
    start with 100
    increment by 1
    no maxvalue
    minvalue 100
    cache 1;

---
--- Tables
---

---
--- Instituicao
---
create table cm_instituicao ( 
       idinstituicao                 character(4)        not null,
       instituicao                   character varying(20),
       nome                          character varying(100),
       rua                           character varying(50),
       numero                        character varying(15),
       complemento                   character varying(15),
       bairro                        character varying(50),
       cep                           character varying(8),
       telefone                      character varying(15),
       email                         character varying(50),
       fax                           character varying(15),
       cgc                           character varying(19),
       caixapostal                   character varying(15),
       idpais                        character(4)        not null,
       idmunicipio                   character(4)        not null);

REVOKE ALL ON TABLE cm_instituicao FROM PUBLIC;
GRANT ALL ON TABLE cm_instituicao TO miolo;

ALTER TABLE ONLY cm_instituicao
    ADD CONSTRAINT cm_instituicao_pk PRIMARY KEY (idinstituicao);

---
--- Setor
---
create table cm_setor ( 
       idsetor                       character varying(4)     not null,
       siglasetor                    character varying(15)     not null,
       dataini                       date           not null,
       nomesetor                     character varying(50),
       tiposetor                     character varying(20),
       datafim                       date,
       fone                          character varying(15),
       fax                           character varying(15),
       centrocusto                   character varying(20),
       obs                           character varying(255),
       localizacao                   character varying(15),
       paisetor                      character varying(15),
       pairelat                      character varying(15),
       idsetorsiape                  character(6));

REVOKE ALL ON TABLE cm_setor FROM PUBLIC;
GRANT ALL ON TABLE cm_setor TO miolo;

ALTER TABLE ONLY cm_setor
    ADD CONSTRAINT cm_setor_pk PRIMARY KEY (idsetor);

---
--- Pessoa
---
create table cm_pessoa ( 
       idpessoa                      integer not null,
       nome                          character varying(55)     not null,
       rua                           character varying(52),
       numero                        character varying(15),
       complemento                   character varying(20),
       bairro                        character varying(50),
       cep                           character varying(8)     not null,
       datanasc                      date           not null,
       nomepai                       character varying(50),
       nomemae                       character varying(50),
       sexo                          character(1)        not null,
       anochegbrasil                 character varying(4),
       telefone                      character varying(20),
       celular                       character varying(20),
       email                         character varying(50),
       gruposanguineo                character varying(3),
       cpf                           character varying(11),
       numrg                         character varying(15),
       tiporg                        character varying(20),
       orgaorg                       character varying(20),
       ufrg                          character(2),
       numcartpro                    character varying(7),
       seriecartpro                  character varying(4),
       ufcartpro                     character(2),
       tituloeleitor                 character varying(12),
       zonatitulo                    character varying(3),
       secaotitulo                   character varying(4),
       uftitulo                      character(2),
       numdocmilitar                 character varying(12),
       seriedocmilitar               character(1),
       categdocmilitar               character varying(1),
       conta                         character varying(20),
       numcert                       character varying(6),
       livrocert                     character varying(10),
       folhacert                     character varying(3),
       cartorio                      character varying(60),
       pispasep                      character varying(11),
       datapispasep                  date,
       bancopispasep                 character varying(3),
       identprof                     character varying(15),
       tipoidentprof                 character varying(20),
       idpais                        character(4)        not null,
       idmunicipio                   character(4)        not null,
       idmunicipionascimento         character(4),
       idpaisnascimento              character(4)        not null,
       idestadocivil                 character(1),
       idbanco                       character(3),
       idagenc                       character(7));

REVOKE ALL ON TABLE cm_pessoa FROM PUBLIC;
GRANT ALL ON TABLE cm_pessoa TO miolo;

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT cm_pessoa_pk PRIMARY KEY (idpessoa);

CREATE INDEX cm_pessoa_nome_key ON cm_pessoa USING btree (nome);

---
--- Pais
---
create table cm_pais ( 
       idpais                        character(4)        not null,
       pais                          character varying(50),
       nacionalidade                 character varying(50));

REVOKE ALL ON TABLE cm_pais FROM PUBLIC;
GRANT ALL ON TABLE cm_pais TO miolo;

ALTER TABLE ONLY cm_pais
    ADD CONSTRAINT cm_pais_pk PRIMARY KEY (idpais);

---
--- Municipio
---
create table cm_municipio ( 
       idmunicipio                   character(4)        not null,
       municipio                     character varying(50),
       iduf                          character(4)        not null);

REVOKE ALL ON TABLE cm_municipio FROM PUBLIC;
GRANT ALL ON TABLE cm_municipio TO miolo;

ALTER TABLE ONLY cm_municipio
    ADD CONSTRAINT cm_municipio_pk PRIMARY KEY (idmunicipio);

---
--- UF
---
create table cm_uf ( 
       iduf                          character(4)        not null,
       uf                            character varying(50));

REVOKE ALL ON TABLE cm_uf FROM PUBLIC;
GRANT ALL ON TABLE cm_uf TO miolo;

ALTER TABLE ONLY cm_uf
    ADD CONSTRAINT cm_uf_pk PRIMARY KEY (iduf);

---
--- Estado Civil
---
create table cm_estadocivil ( 
       idestadocivil                 character(1)        not null,
       estadocivil                   character varying(30));

REVOKE ALL ON TABLE cm_estadocivil FROM PUBLIC;
GRANT ALL ON TABLE cm_estadocivil TO miolo;

ALTER TABLE ONLY cm_estadocivil
    ADD CONSTRAINT cm_estadocivil_pk PRIMARY KEY (idestadocivil);

---
--- Banco
---
create table cm_banco ( 
       idbanco                       character(3)        not null,
       nome                          character varying(50));

REVOKE ALL ON TABLE cm_banco FROM PUBLIC;
GRANT ALL ON TABLE cm_banco TO miolo;

ALTER TABLE ONLY cm_banco
    ADD CONSTRAINT cm_banco_pk PRIMARY KEY (idbanco);

---
--- Usuario
---
create table cm_usuario ( 
       idusuario                     integer    not null,
       login                         character varying(20)     not null,
       password                      character varying(20)     not null,
       nick                          character varying(20),
       passmd5                       character varying(32),
       idpessoa                      integer,
       idsetor                       character varying(4));

REVOKE ALL ON TABLE cm_usuario FROM PUBLIC;
GRANT ALL ON TABLE cm_usuario TO miolo;

ALTER TABLE ONLY cm_usuario
    ADD CONSTRAINT cm_usuario_pk PRIMARY KEY (idusuario);

alter table only cm_usuario 
add constraint uk_cm_usuario_login unique (login);

CREATE INDEX cm_usuario_login_key ON cm_usuario USING btree (login);

---
--- Log
---
create table cm_log ( 
       idlog                         integer  not null,
       timestamp                     timestamp without time zone not null,
       descricao                     character varying(200),
       operacao                      character(3),
       modulo                        character varying(20)     not null,
       classe                        character varying(30)     not null,
       idusuario                     integer  not null);

REVOKE ALL ON TABLE cm_log FROM PUBLIC;
GRANT ALL ON TABLE cm_log TO miolo;

ALTER TABLE ONLY cm_log
    ADD CONSTRAINT cm_log_pk PRIMARY KEY (idlog);

CREATE INDEX cm_log_login_key ON cm_log USING btree (timestamp);

---
--- GrupoAcesso
---
create table cm_grupoacesso ( 
       idgrupo                       integer  not null,
       grupo                         character varying(50));

REVOKE ALL ON TABLE cm_grupoacesso FROM PUBLIC;
GRANT ALL ON TABLE cm_grupoacesso TO miolo;

ALTER TABLE ONLY cm_grupoacesso
    ADD CONSTRAINT cm_grupoacesso_pk PRIMARY KEY (idgrupo);

---
--- Transacao
---
create table cm_transacao ( 
       idtrans                       integer   not null,
       transacao                     character varying(30),
       idsistema                     integer);

REVOKE ALL ON TABLE cm_transacao FROM PUBLIC;
GRANT ALL ON TABLE cm_transacao TO miolo;

ALTER TABLE ONLY cm_transacao
    ADD CONSTRAINT cm_transacao_pk PRIMARY KEY (idtrans);

---
--- Sistema
---
create table cm_sistema ( 
       idsistema                     integer  not null,
       sistema                       character varying(30));

REVOKE ALL ON TABLE cm_sistema FROM PUBLIC;
GRANT ALL ON TABLE cm_sistema TO miolo;

ALTER TABLE ONLY cm_sistema
    ADD CONSTRAINT cm_sistema_pk PRIMARY KEY (idsistema);

---
--- TabelaGeral
---
create table cm_tabelageral ( 
       idtabelageral                 integer not null,
       tabela                        character varying(30)     not null,
       item1                         character varying(30)     not null,
       item2                         character varying(30),
       item3                         character varying(200));

REVOKE ALL ON TABLE cm_tabelageral FROM PUBLIC;
GRANT ALL ON TABLE cm_tabelageral TO miolo;

ALTER TABLE ONLY cm_tabelageral
    ADD CONSTRAINT cm_tabelageral_pk PRIMARY KEY (idtabelageral);

---
--- Sessao
---
create table cm_sessao ( 
       idsessao                      integer  not null,
       tsin                          timestamp,
       tsout                         timestamp,
       name                          character varying(50),
       sid                           character(32),
       forced                        character(1),
       remoteaddr                    character varying(15),
       idusuario                     integer not null);


REVOKE ALL ON TABLE cm_sessao FROM PUBLIC;
GRANT ALL ON TABLE cm_sessao TO miolo;

ALTER TABLE ONLY cm_sessao
    ADD CONSTRAINT cm_sessao_pk PRIMARY KEY (idsessao);

---
--- Agencia
---
create table cm_agencia ( 
       idbanco                       character(3)        not null,
       idagencia                     character(7)        not null,
       nome                          character varying(50));

REVOKE ALL ON TABLE cm_agencia FROM PUBLIC;
GRANT ALL ON TABLE cm_agencia TO miolo;

ALTER TABLE ONLY cm_agencia
    ADD CONSTRAINT cm_agencia_pk PRIMARY KEY (idbanco,idagencia);

---
--- Noticia
---
create table cm_noticia ( 
       idsistema                     integer  not null,
       idnoticia                     integer  not null,
       dtnoticia                     date,
       noticia                       character varying(500));

REVOKE ALL ON TABLE cm_noticia FROM PUBLIC;
GRANT ALL ON TABLE cm_noticia TO miolo;

ALTER TABLE ONLY cm_noticia
    ADD CONSTRAINT cm_noticia_pk PRIMARY KEY (idsistema, idnoticia);

---
--- GrpUsuario
---
create table cm_grpusuario ( 
       idgrupo                       integer not null,
       idusuario                     integer not null);

REVOKE ALL ON TABLE cm_grpusuario FROM PUBLIC;
GRANT ALL ON TABLE cm_grpusuario TO miolo;

ALTER TABLE ONLY cm_grpusuario
    ADD CONSTRAINT cm_grpusuario_pk PRIMARY KEY (idgrupo, idusuario);

---
--- Acesso
---
create table cm_acesso ( 
       idgrupo                       integer   not null,
       idtrans                       integer   not null,
       direito                       character varying(5)     not null);

REVOKE ALL ON TABLE cm_acesso FROM PUBLIC;
GRANT ALL ON TABLE cm_acesso TO miolo;

ALTER TABLE ONLY cm_acesso
    ADD CONSTRAINT cm_acesso_pk PRIMARY KEY (idgrupo,idtrans);

---
--- SetorAcesso
---
create table cm_setoracesso ( 
       idsetorpai                    character varying(4)     not null,
       idsetorfilho                  character varying(4)     not null,
       finalidade                    character varying(15));

REVOKE ALL ON TABLE cm_setoracesso FROM PUBLIC;
GRANT ALL ON TABLE cm_setoracesso TO miolo;

ALTER TABLE ONLY cm_setoracesso
    ADD CONSTRAINT cm_setoracesso_pk PRIMARY KEY (idsetorpai, idsetorfilho);

---
--- Foreign Key
---

alter table only cm_instituicao 
add constraint fk_cm_instituicao_idmunicipio foreign key (idmunicipio) references cm_municipio;

alter table only cm_instituicao 
add constraint fk_cm_instituicao_idpais foreign key(idpais) references cm_pais;

alter table only cm_pessoa 
add constraint fk_cm_pessoa_idagencia foreign key(idbanco,idagenc) references cm_agencia;

alter table only cm_pessoa 
add constraint fk_cm_pessoa_idestadocivil foreign key(idestadocivil) references cm_estadocivil;

alter table only cm_pessoa 
add constraint fk_cm_pessoa_idmunicipio foreign key(idmunicipio) references cm_municipio;

alter table only cm_pessoa 
add constraint fk_cm_pessoa_idmunicipionascimento foreign key(idmunicipionascimento) references cm_municipio;

alter table only cm_pessoa 
add constraint fk_cm_pessoa_idpais foreign key(idpais) references cm_pais;

alter table only cm_pessoa 
add constraint fk_cm_pessoa_idpaisnascimento foreign key(idpaisnascimento) references cm_pais;

alter table only cm_municipio 
add constraint fk_cm_municipio_iduf foreign key(iduf) references cm_uf;

alter table only cm_usuario 
add constraint fk_cm_usuario_idpessoa foreign key(idpessoa) references cm_pessoa;

alter table only cm_usuario 
add constraint fk_cm_usuario_idsetor foreign key(idsetor) references cm_setor;

alter table only cm_log 
add constraint fk_cm_log_idusuario foreign key(idusuario) references cm_usuario;

alter table only cm_transacao 
add constraint fk_cm_transacao_idsistema foreign key(idsistema) references cm_sistema;

alter table only cm_sessao 
add constraint fk_cm_sessao_idusuario foreign key(idusuario) references cm_usuario;

alter table only cm_agencia 
add constraint fk_cm_agencia_idbanco foreign key(idbanco) references cm_banco on delete cascade;

alter table only cm_noticia 
add constraint fk_cm_noticia_idsistema foreign key(idsistema) references cm_sistema on delete cascade;

alter table only cm_grpusuario 
add constraint fk_cm_grpusuario_idgrupo foreign key(idgrupo) references cm_grupoacesso on delete cascade;

alter table only cm_grpusuario 
add constraint fk_cm_grpusuario_idusuario foreign key(idusuario) references cm_usuario on delete cascade;

alter table only cm_acesso 
add constraint fk_cm_acesso_idgrupo foreign key(idgrupo) references cm_grupoacesso on delete cascade;

alter table only cm_setoracesso 
add constraint fk_cm_setoracesso_idsetorpai foreign key(idsetorpai) references cm_setor(idsetor) on delete cascade;

alter table only cm_setoracesso 
add constraint fk_cm_setoracesso_idsetorfilho foreign key(idsetorfilho) references cm_setor(idsetor) on delete cascade;

alter table only cm_acesso 
add constraint fk_cm_acesso_idtrans foreign key(idtrans) references cm_transacao on delete cascade;

---
--- Inicializacao
---

insert into cm_pais (idpais, pais, nacionalidade)
  values (1,'BRASIL','Brasileira');

insert into cm_uf (iduf,uf) 
  values ('MG','Minas Gerais');
insert into cm_uf (iduf,uf) 
  values ('RS','Rio Grande do Sul');

insert into cm_municipio(idmunicipio,municipio,iduf)
  values (1,'Juiz de Fora','MG');
insert into cm_municipio(idmunicipio,municipio,iduf)
  values (2,'Lajeado','RS');

insert into cm_pessoa
  (idpessoa,nome,cep,datanasc,sexo,idpais,idmunicipio,idmunicipionascimento,idpaisnascimento)
  values ( 1, 'Miolo Administrator', '3000000', '01/01/01', 'M', 1, 1,1,1);
insert into cm_pessoa
  (idpessoa,nome,cep,datanasc,sexo,idpais,idmunicipio,idmunicipionascimento,idpaisnascimento)
  values ( 2, 'Sample User Common', '3000000', '01/01/01', 'M', 1, 2,2,1);

insert into cm_setor(idsetor,siglasetor,dataini,nomesetor,tiposetor)
  values (1,'SampleSector','01/01/01','Sample Sector for Common','UNIDADE');
insert into cm_setor(idsetor,siglasetor,dataini,nomesetor)
  values (2,'CommonSector','01/01/01','Other Sample Sector for Common','UNIDADE');

insert into cm_usuario (idusuario, idpessoa, idsetor, login, password)
  values (1,1,1, 'admin','admin');
insert into cm_usuario (idusuario, idpessoa, idsetor, login, password)
  values (2,2,2, 'guest','guest');

insert into cm_sistema (idsistema, sistema) values (1, 'common');
insert into cm_sistema (idsistema, sistema) values (2, 'siga');
insert into cm_sistema (idsistema, sistema) values (3, 'tutorial');

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
insert into cm_grupoacesso (idgrupo, grupo) values (4,'DEVEL');

insert into cm_acesso(idgrupo, idtrans, direito) values (1,0,31);
insert into cm_acesso(idgrupo, idtrans, direito) values (2,8,1);
insert into cm_acesso(idgrupo, idtrans, direito) values (4,25,31);

insert into cm_grpusuario (idgrupo, idusuario) values (1,1);
insert into cm_grpusuario (idgrupo, idusuario) values (2,2);
insert into cm_grpusuario (idgrupo, idusuario) values (4,1);

insert into cm_tabelageral(idtabelageral, tabela, item1, item2, item3)
  values(1,'RIGHTS','1','Consultar','');
insert into cm_tabelageral(idtabelageral, tabela, item1, item2, item3)
  values(2,'RIGHTS','2','Inserir','');
insert into cm_tabelageral(idtabelageral, tabela, item1, item2, item3)
  values(3,'RIGHTS','4','Remover','');
insert into cm_tabelageral(idtabelageral, tabela, item1, item2, item3)
  values(4,'RIGHTS','8','Atualizar','');
insert into cm_tabelageral(idtabelageral, tabela, item1, item2, item3)
  values(5,'RIGHTS','15','Processar','');
insert into cm_tabelageral(idtabelageral, tabela, item1, item2, item3)
  values(6,'RIGHTS','31','Admin','');
insert into cm_tabelageral(idtabelageral, tabela, item1, item2, item3)
  values(7,'RIGHTS','32','Developer','');
