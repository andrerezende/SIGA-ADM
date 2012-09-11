/*===========================================================================*/
/*Metadata Extract performed 12-jun-2004 20:56                               */
/*===========================================================================*/
SET SQL DIALECT 3;

/*===========================================================================*/
/*Connect to Database                                                        */
/*===========================================================================*/
connect 'E:\miolo\miolo15\modules\common\sql\miolo.fdb' user 'SYSDBA';



/*===========================================================================*/
/*Generators                                                                 */
/*===========================================================================*/
create generator SEQ_CM_COMMON;
set generator SEQ_CM_COMMON to 100;
create generator SEQ_CM_GRUPO;
set generator SEQ_CM_GRUPO to 100;
create generator SEQ_CM_LOG;
set generator SEQ_CM_LOG to 100;
create generator SEQ_CM_NOTICIA;
set generator SEQ_CM_NOTICIA to 100;
create generator SEQ_CM_PESSOA;
set generator SEQ_CM_PESSOA to 100;
create generator SEQ_CM_SESSAO;
set generator SEQ_CM_SESSAO to 100;
create generator SEQ_CM_SISTEMA;
set generator SEQ_CM_SISTEMA to 100;
create generator SEQ_CM_TABELAGERAL;
set generator SEQ_CM_TABELAGERAL to 100;
create generator SEQ_CM_TRANSACAO;
set generator SEQ_CM_TRANSACAO to 100;
create generator SEQ_CM_USUARIO;
set generator SEQ_CM_USUARIO to 100;


/*===========================================================================*/
/*Table Definitions                                                          */
/*===========================================================================*/

/*Table: CM_ACESSO*/
create table CM_ACESSO(
     IDGRUPO integer not null,
     IDTRANS integer not null,
     DIREITO varchar(5) character set ISO8859_1 not null collate ISO8859_1);




/*Table: CM_AGENCIA*/
create table CM_AGENCIA(
     IDBANCO char(3) character set ISO8859_1 not null collate ISO8859_1,
     IDAGENCIA char(7) character set ISO8859_1 not null collate ISO8859_1,
     NOME varchar(50) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_BANCO*/
create table CM_BANCO(
     IDBANCO char(3) character set ISO8859_1 not null collate ISO8859_1,
     NOME varchar(50) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_ESTADOCIVIL*/
create table CM_ESTADOCIVIL(
     IDESTADOCIVIL char(1) character set ISO8859_1 not null collate ISO8859_1,
     ESTADOCIVIL varchar(30) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_GRPUSUARIO*/
create table CM_GRPUSUARIO(
     IDGRUPO integer not null,
     IDUSUARIO integer not null);




/*Table: CM_GRUPOACESSO*/
create table CM_GRUPOACESSO(
     IDGRUPO integer not null,
     GRUPO varchar(50) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_INSTITUICAO*/
create table CM_INSTITUICAO(
     IDINSTITUICAO char(4) character set ISO8859_1 not null collate ISO8859_1,
     INSTITUICAO varchar(20) character set ISO8859_1 collate ISO8859_1,
     NOME varchar(100) character set ISO8859_1 collate ISO8859_1,
     RUA varchar(50) character set ISO8859_1 collate ISO8859_1,
     NUMERO varchar(15) character set ISO8859_1 collate ISO8859_1,
     COMPLEMENTO varchar(15) character set ISO8859_1 collate ISO8859_1,
     BAIRRO varchar(50) character set ISO8859_1 collate ISO8859_1,
     CEP varchar(8) character set ISO8859_1 collate ISO8859_1,
     TELEFONE varchar(15) character set ISO8859_1 collate ISO8859_1,
     EMAIL varchar(50) character set ISO8859_1 collate ISO8859_1,
     FAX varchar(15) character set ISO8859_1 collate ISO8859_1,
     CGC varchar(19) character set ISO8859_1 collate ISO8859_1,
     CAIXAPOSTAL varchar(15) character set ISO8859_1 collate ISO8859_1,
     IDPAIS char(4) character set ISO8859_1 not null collate ISO8859_1,
     IDMUNICIPIO char(4) character set ISO8859_1 not null collate ISO8859_1);




/*Table: CM_LOG*/
create table CM_LOG(
     IDLOG integer not null,
     TIMESTAMP timestamp not null,
     DESCRICAO varchar(200) character set ISO8859_1 collate ISO8859_1,
     OPERACAO char(3) character set ISO8859_1 collate ISO8859_1,
     MODULO varchar(20) character set ISO8859_1 not null collate ISO8859_1,
     CLASSE varchar(30) character set ISO8859_1 not null collate ISO8859_1,
     IDUSUARIO integer not null);




/*Table: CM_MUNICIPIO*/
create table CM_MUNICIPIO(
     IDMUNICIPIO char(4) character set ISO8859_1 not null collate ISO8859_1,
     MUNICIPIO varchar(50) character set ISO8859_1 collate ISO8859_1,
     IDUF char(4) character set ISO8859_1 not null collate ISO8859_1);




/*Table: CM_NOTICIA*/
create table CM_NOTICIA(
     IDSISTEMA integer not null,
     IDNOTICIA integer not null,
     DTNOTICIA timestamp,
     NOTICIA varchar(500) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_PAIS*/
create table CM_PAIS(
     IDPAIS char(4) character set ISO8859_1 not null collate ISO8859_1,
     PAIS varchar(50) character set ISO8859_1 collate ISO8859_1,
     NACIONALIDADE varchar(50) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_PESSOA*/
create table CM_PESSOA(
     IDPESSOA integer not null,
     NOME varchar(55) character set ISO8859_1 not null collate ISO8859_1,
     RUA varchar(52) character set ISO8859_1 collate ISO8859_1,
     NUMERO varchar(15) character set ISO8859_1 collate ISO8859_1,
     COMPLEMENTO varchar(20) character set ISO8859_1 collate ISO8859_1,
     BAIRRO varchar(50) character set ISO8859_1 collate ISO8859_1,
     CEP varchar(8) character set ISO8859_1 not null collate ISO8859_1,
     DATANASC timestamp not null,
     NOMEPAI varchar(50) character set ISO8859_1 collate ISO8859_1,
     NOMEMAE varchar(50) character set ISO8859_1 collate ISO8859_1,
     SEXO char(1) character set ISO8859_1 not null collate ISO8859_1,
     ANOCHEGBRASIL varchar(4) character set ISO8859_1 collate ISO8859_1,
     TELEFONE varchar(20) character set ISO8859_1 collate ISO8859_1,
     CELULAR varchar(20) character set ISO8859_1 collate ISO8859_1,
     EMAIL varchar(50) character set ISO8859_1 collate ISO8859_1,
     GRUPOSANGUINEO varchar(3) character set ISO8859_1 collate ISO8859_1,
     CPF varchar(11) character set ISO8859_1 collate ISO8859_1,
     NUMRG varchar(15) character set ISO8859_1 collate ISO8859_1,
     TIPORG varchar(20) character set ISO8859_1 collate ISO8859_1,
     ORGAORG varchar(20) character set ISO8859_1 collate ISO8859_1,
     UFRG char(2) character set ISO8859_1 collate ISO8859_1,
     NUMCARTPRO varchar(7) character set ISO8859_1 collate ISO8859_1,
     SERIECARTPRO varchar(4) character set ISO8859_1 collate ISO8859_1,
     UFCARTPRO char(2) character set ISO8859_1 collate ISO8859_1,
     TITULOELEITOR varchar(12) character set ISO8859_1 collate ISO8859_1,
     ZONATITULO varchar(3) character set ISO8859_1 collate ISO8859_1,
     SECAOTITULO varchar(4) character set ISO8859_1 collate ISO8859_1,
     UFTITULO char(2) character set ISO8859_1 collate ISO8859_1,
     NUMDOCMILITAR varchar(12) character set ISO8859_1 collate ISO8859_1,
     SERIEDOCMILITAR char(1) character set ISO8859_1 collate ISO8859_1,
     CATEGDOCMILITAR varchar(1) character set ISO8859_1 collate ISO8859_1,
     CONTA varchar(20) character set ISO8859_1 collate ISO8859_1,
     NUMCERT varchar(6) character set ISO8859_1 collate ISO8859_1,
     LIVROCERT varchar(10) character set ISO8859_1 collate ISO8859_1,
     FOLHACERT varchar(3) character set ISO8859_1 collate ISO8859_1,
     CARTORIO varchar(60) character set ISO8859_1 collate ISO8859_1,
     PISPASEP varchar(11) character set ISO8859_1 collate ISO8859_1,
     DATAPISPASEP timestamp,
     BANCOPISPASEP varchar(3) character set ISO8859_1 collate ISO8859_1,
     IDENTPROF varchar(15) character set ISO8859_1 collate ISO8859_1,
     TIPOIDENTPROF varchar(20) character set ISO8859_1 collate ISO8859_1,
     IDPAIS char(4) character set ISO8859_1 not null collate ISO8859_1,
     IDMUNICIPIO char(4) character set ISO8859_1 not null collate ISO8859_1,
     IDMUNICIPIONASCIMENTO char(4) character set ISO8859_1 collate ISO8859_1,
     IDPAISNASCIMENTO char(4) character set ISO8859_1 not null collate ISO8859_1,
     IDESTADOCIVIL char(1) character set ISO8859_1 collate ISO8859_1,
     IDBANCO char(3) character set ISO8859_1 collate ISO8859_1,
     IDAGENC char(7) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_SESSAO*/
create table CM_SESSAO(
     IDSESSAO integer not null,
     TSIN timestamp,
     TSOUT timestamp,
     NAME varchar(50) character set ISO8859_1 collate ISO8859_1,
     SID char(32) character set ISO8859_1 collate ISO8859_1,
     FORCED char(1) character set ISO8859_1 collate ISO8859_1,
     REMOTEADDR varchar(15) character set ISO8859_1 collate ISO8859_1,
     IDUSUARIO integer not null);




/*Table: CM_SETOR*/
create table CM_SETOR(
     IDSETOR varchar(4) character set ISO8859_1 not null collate ISO8859_1,
     SIGLASETOR varchar(15) character set ISO8859_1 not null collate ISO8859_1,
     DATAINI timestamp not null,
     NOMESETOR varchar(50) character set ISO8859_1 collate ISO8859_1,
     TIPOSETOR varchar(20) character set ISO8859_1 collate ISO8859_1,
     DATAFIM timestamp,
     FONE varchar(15) character set ISO8859_1 collate ISO8859_1,
     FAX varchar(15) character set ISO8859_1 collate ISO8859_1,
     CENTROCUSTO varchar(20) character set ISO8859_1 collate ISO8859_1,
     OBS varchar(255) character set ISO8859_1 collate ISO8859_1,
     LOCALIZACAO varchar(15) character set ISO8859_1 collate ISO8859_1,
     PAISETOR varchar(15) character set ISO8859_1 collate ISO8859_1,
     PAIRELAT varchar(15) character set ISO8859_1 collate ISO8859_1,
     IDSETORSIAPE char(6) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_SETORACESSO*/
create table CM_SETORACESSO(
     IDSETORPAI varchar(4) character set ISO8859_1 not null collate ISO8859_1,
     IDSETORFILHO varchar(4) character set ISO8859_1 not null collate ISO8859_1,
     FINALIDADE varchar(15) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_SISTEMA*/
create table CM_SISTEMA(
     IDSISTEMA integer not null,
     SISTEMA varchar(30) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_TABELAGERAL*/
create table CM_TABELAGERAL(
     IDTABELAGERAL integer not null,
     TABELA varchar(30) character set ISO8859_1 not null collate ISO8859_1,
     ITEM1 varchar(30) character set ISO8859_1 not null collate ISO8859_1,
     ITEM2 varchar(30) character set ISO8859_1 collate ISO8859_1,
     ITEM3 varchar(200) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_TRANSACAO*/
create table CM_TRANSACAO(
     IDTRANS integer not null,
     TRANSACAO varchar(30) character set ISO8859_1 collate ISO8859_1,
     IDSISTEMA integer);




/*Table: CM_UF*/
create table CM_UF(
     IDUF char(4) character set ISO8859_1 not null collate ISO8859_1,
     UF varchar(50) character set ISO8859_1 collate ISO8859_1);




/*Table: CM_USUARIO*/
create table CM_USUARIO(
     IDUSUARIO integer not null,
     LOGIN varchar(20) character set ISO8859_1 not null collate ISO8859_1,
     PASSWORD varchar(20) character set ISO8859_1 not null collate ISO8859_1,
     NICK varchar(20) character set ISO8859_1 collate ISO8859_1,
     PASSMD5 varchar(32) character set ISO8859_1 collate ISO8859_1,
     IDPESSOA integer,
     IDSETOR varchar(4) character set ISO8859_1 collate ISO8859_1);






/*===========================================================================*/
/*Table Data for CM_ACESSO                                                   */
/*===========================================================================*/
insert into CM_ACESSO(IDGRUPO, IDTRANS, DIREITO) values (1, 0, '31');
insert into CM_ACESSO(IDGRUPO, IDTRANS, DIREITO) values (2, 8, '1');
insert into CM_ACESSO(IDGRUPO, IDTRANS, DIREITO) values (4, 25, '31');

/*===========================================================================*/
/*Table Data for CM_AGENCIA                                                  */
/*===========================================================================*/

/*===========================================================================*/
/*Table Data for CM_BANCO                                                    */
/*===========================================================================*/

/*===========================================================================*/
/*Table Data for CM_ESTADOCIVIL                                              */
/*===========================================================================*/

/*===========================================================================*/
/*Table Data for CM_GRPUSUARIO                                               */
/*===========================================================================*/
insert into CM_GRPUSUARIO(IDGRUPO, IDUSUARIO) values (1, 1);
insert into CM_GRPUSUARIO(IDGRUPO, IDUSUARIO) values (2, 2);
insert into CM_GRPUSUARIO(IDGRUPO, IDUSUARIO) values (4, 1);

/*===========================================================================*/
/*Table Data for CM_GRUPOACESSO                                              */
/*===========================================================================*/
insert into CM_GRUPOACESSO(IDGRUPO, GRUPO) values (1, 'ADMIN');
insert into CM_GRUPOACESSO(IDGRUPO, GRUPO) values (2, 'COMMON_RO');
insert into CM_GRUPOACESSO(IDGRUPO, GRUPO) values (3, 'COMMON_RW');
insert into CM_GRUPOACESSO(IDGRUPO, GRUPO) values (4, 'DEVEL');

/*===========================================================================*/
/*Table Data for CM_INSTITUICAO                                              */
/*===========================================================================*/

/*===========================================================================*/
/*Table Data for CM_LOG                                                      */
/*===========================================================================*/

/*===========================================================================*/
/*Table Data for CM_MUNICIPIO                                                */
/*===========================================================================*/
insert into CM_MUNICIPIO(IDMUNICIPIO, MUNICIPIO, IDUF) values ('1', 'Juiz de Fora', 'MG');
insert into CM_MUNICIPIO(IDMUNICIPIO, MUNICIPIO, IDUF) values ('2', 'Lajeado', 'RS');

/*===========================================================================*/
/*Table Data for CM_NOTICIA                                                  */
/*===========================================================================*/

/*===========================================================================*/
/*Table Data for CM_PAIS                                                     */
/*===========================================================================*/
insert into CM_PAIS(IDPAIS, PAIS, NACIONALIDADE) values ('1', 'BRASIL', 'Brasileira');

/*===========================================================================*/
/*Table Data for CM_PESSOA                                                   */
/*===========================================================================*/
insert into CM_PESSOA(IDPESSOA, NOME, RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, DATANASC, NOMEPAI, NOMEMAE, SEXO, ANOCHEGBRASIL, TELEFONE, CELULAR, EMAIL, GRUPOSANGUINEO, CPF, NUMRG, TIPORG, ORGAORG, UFRG, NUMCARTPRO, SERIECARTPRO, UFCARTPRO, TITULOELEITOR, ZONATITULO, SECAOTITULO, UFTITULO, NUMDOCMILITAR, SERIEDOCMILITAR, CATEGDOCMILITAR, CONTA, NUMCERT, LIVROCERT, FOLHACERT, CARTORIO, PISPASEP, DATAPISPASEP, BANCOPISPASEP, IDENTPROF, TIPOIDENTPROF, IDPAIS, IDMUNICIPIO, IDMUNICIPIONASCIMENTO, IDPAISNASCIMENTO, IDESTADOCIVIL, IDBANCO, IDAGENC) values (1, 'Miolo Administrator', NULL, NULL, NULL, NULL, '3000000', '01-JAN-2001 00:00:00.00', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL);
insert into CM_PESSOA(IDPESSOA, NOME, RUA, NUMERO, COMPLEMENTO, BAIRRO, CEP, DATANASC, NOMEPAI, NOMEMAE, SEXO, ANOCHEGBRASIL, TELEFONE, CELULAR, EMAIL, GRUPOSANGUINEO, CPF, NUMRG, TIPORG, ORGAORG, UFRG, NUMCARTPRO, SERIECARTPRO, UFCARTPRO, TITULOELEITOR, ZONATITULO, SECAOTITULO, UFTITULO, NUMDOCMILITAR, SERIEDOCMILITAR, CATEGDOCMILITAR, CONTA, NUMCERT, LIVROCERT, FOLHACERT, CARTORIO, PISPASEP, DATAPISPASEP, BANCOPISPASEP, IDENTPROF, TIPOIDENTPROF, IDPAIS, IDMUNICIPIO, IDMUNICIPIONASCIMENTO, IDPAISNASCIMENTO, IDESTADOCIVIL, IDBANCO, IDAGENC) values (2, 'Sample User Common', NULL, NULL, NULL, NULL, '3000000', '01-JAN-2001 00:00:00.00', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', '2', '1', NULL, NULL, NULL);

/*===========================================================================*/
/*Table Data for CM_SESSAO                                                   */
/*===========================================================================*/

/*===========================================================================*/
/*Table Data for CM_SETOR                                                    */
/*===========================================================================*/
insert into CM_SETOR(IDSETOR, SIGLASETOR, DATAINI, NOMESETOR, TIPOSETOR, DATAFIM, FONE, FAX, CENTROCUSTO, OBS, LOCALIZACAO, PAISETOR, PAIRELAT, IDSETORSIAPE) values ('1', 'SampleSector', '01-JAN-2001 00:00:00.00', 'Sample Sector for Common', 'UNIDADE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into CM_SETOR(IDSETOR, SIGLASETOR, DATAINI, NOMESETOR, TIPOSETOR, DATAFIM, FONE, FAX, CENTROCUSTO, OBS, LOCALIZACAO, PAISETOR, PAIRELAT, IDSETORSIAPE) values ('2', 'CommonSector', '01-JAN-2001 00:00:00.00', 'Other Sample Sector for Common', 'UNIDADE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

/*===========================================================================*/
/*Table Data for CM_SETORACESSO                                              */
/*===========================================================================*/

/*===========================================================================*/
/*Table Data for CM_SISTEMA                                                  */
/*===========================================================================*/
insert into CM_SISTEMA(IDSISTEMA, SISTEMA) values (1, 'common');
insert into CM_SISTEMA(IDSISTEMA, SISTEMA) values (2, 'siga');
insert into CM_SISTEMA(IDSISTEMA, SISTEMA) values (3, 'tutorial');

/*===========================================================================*/
/*Table Data for CM_TABELAGERAL                                              */
/*===========================================================================*/
insert into CM_TABELAGERAL(IDTABELAGERAL, TABELA, ITEM1, ITEM2, ITEM3) values (1, 'RIGHTS', '1', 'Consultar', '');
insert into CM_TABELAGERAL(IDTABELAGERAL, TABELA, ITEM1, ITEM2, ITEM3) values (2, 'RIGHTS', '2', 'Inserir', '');
insert into CM_TABELAGERAL(IDTABELAGERAL, TABELA, ITEM1, ITEM2, ITEM3) values (3, 'RIGHTS', '4', 'Remover', '');
insert into CM_TABELAGERAL(IDTABELAGERAL, TABELA, ITEM1, ITEM2, ITEM3) values (4, 'RIGHTS', '8', 'Atualizar', '');
insert into CM_TABELAGERAL(IDTABELAGERAL, TABELA, ITEM1, ITEM2, ITEM3) values (5, 'RIGHTS', '15', 'Processar', '');
insert into CM_TABELAGERAL(IDTABELAGERAL, TABELA, ITEM1, ITEM2, ITEM3) values (6, 'RIGHTS', '31', 'Admin', '');
insert into CM_TABELAGERAL(IDTABELAGERAL, TABELA, ITEM1, ITEM2, ITEM3) values (7, 'RIGHTS', '32', 'Developer', '');

/*===========================================================================*/
/*Table Data for CM_TRANSACAO                                                */
/*===========================================================================*/
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (0, 'ALL', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (1, 'ADMIN', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (2, 'TRANSACAO', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (3, 'USUARIO', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (4, 'SISTEMA', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (5, 'SETOR', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (6, 'GRUPOACESSO', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (7, 'LOG', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (8, 'NOTICIA', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (9, 'BANCO', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (10, 'AGENCIA', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (11, 'ESTADOCIVIL', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (12, 'INSTITUICAO', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (13, 'MUNICIPIO', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (14, 'PAIS', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (15, 'UF', 1);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (16, 'DISCIPLINA', 2);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (17, 'ALUNO', 2);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (18, 'DOCENTE', 2);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (19, 'CURRICULO', 2);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (20, 'CURSO', 2);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (21, 'REQUISITO', 2);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (22, 'EQUIVALENCIA', 2);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (23, 'GRADE', 2);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (24, 'PLANODEP', 2);
insert into CM_TRANSACAO(IDTRANS, TRANSACAO, IDSISTEMA) values (25, 'DEVEL', 1);

/*===========================================================================*/
/*Table Data for CM_UF                                                       */
/*===========================================================================*/
insert into CM_UF(IDUF, UF) values ('MG', 'Minas Gerais');
insert into CM_UF(IDUF, UF) values ('RS', 'Rio Grande do Sul');

/*===========================================================================*/
/*Table Data for CM_USUARIO                                                  */
/*===========================================================================*/
insert into CM_USUARIO(IDUSUARIO, LOGIN, PASSWORD, NICK, PASSMD5, IDPESSOA, IDSETOR) values (1, 'admin', 'admin', NULL, NULL, 1, '1');
insert into CM_USUARIO(IDUSUARIO, LOGIN, PASSWORD, NICK, PASSMD5, IDPESSOA, IDSETOR) values (2, 'guest', 'guest', NULL, NULL, 2, '2');


/*===========================================================================*/
/*Table Primary Key Definitions                                              */
/*===========================================================================*/
alter table CM_ACESSO add constraint CM_ACESSO_PK primary key (IDGRUPO, IDTRANS);
alter table CM_AGENCIA add constraint CM_AGENCIA_PK primary key (IDBANCO, IDAGENCIA);
alter table CM_BANCO add constraint CM_BANCO_PK primary key (IDBANCO);
alter table CM_ESTADOCIVIL add constraint CM_ESTADOCIVIL_PK primary key (IDESTADOCIVIL);
alter table CM_GRPUSUARIO add constraint CM_GRPUSUARIO_PK primary key (IDGRUPO, IDUSUARIO);
alter table CM_GRUPOACESSO add constraint CM_GRUPOACESSO_PK primary key (IDGRUPO);
alter table CM_INSTITUICAO add constraint CM_INSTITUICAO_PK primary key (IDINSTITUICAO);
alter table CM_LOG add constraint CM_LOG_PK primary key (IDLOG);
alter table CM_MUNICIPIO add constraint CM_MUNICIPIO_PK primary key (IDMUNICIPIO);
alter table CM_NOTICIA add constraint CM_NOTICIA_PK primary key (IDSISTEMA, IDNOTICIA);
alter table CM_PAIS add constraint CM_PAIS_PK primary key (IDPAIS);
alter table CM_PESSOA add constraint CM_PESSOA_PK primary key (IDPESSOA);
alter table CM_SESSAO add constraint CM_SESSAO_PK primary key (IDSESSAO);
alter table CM_SETOR add constraint CM_SETOR_PK primary key (IDSETOR);
alter table CM_SETORACESSO add constraint CM_SETORACESSO_PK primary key (IDSETORPAI, IDSETORFILHO);
alter table CM_SISTEMA add constraint CM_SISTEMA_PK primary key (IDSISTEMA);
alter table CM_TABELAGERAL add constraint CM_TABELAGERAL_PK primary key (IDTABELAGERAL);
alter table CM_TRANSACAO add constraint CM_TRANSACAO_PK primary key (IDTRANS);
alter table CM_UF add constraint CM_UF_PK primary key (IDUF);
alter table CM_USUARIO add constraint CM_USUARIO_PK primary key (IDUSUARIO);
/*===========================================================================*/
/*Table Foreign Key Definitions                                              */
/*===========================================================================*/
alter table CM_ACESSO add constraint FK_CM_ACESSO_IDGRUPO foreign key (IDGRUPO) references CM_GRUPOACESSO(IDGRUPO) on delete CASCADE;
alter table CM_ACESSO add constraint FK_CM_ACESSO_IDTRANS foreign key (IDTRANS) references CM_TRANSACAO(IDTRANS) on delete CASCADE;

alter table CM_AGENCIA add constraint FK_CM_AGENCIA_IDBANCO foreign key (IDBANCO) references CM_BANCO(IDBANCO) on delete CASCADE;

alter table CM_GRPUSUARIO add constraint FK_CM_GRPUSUARIO_IDGRUPO foreign key (IDGRUPO) references CM_GRUPOACESSO(IDGRUPO) on delete CASCADE;
alter table CM_GRPUSUARIO add constraint FK_CM_GRPUSUARIO_IDUSUARIO foreign key (IDUSUARIO) references CM_USUARIO(IDUSUARIO) on delete CASCADE;

alter table CM_INSTITUICAO add constraint FK_CM_INSTITUICAO_IDMUNICIPIO foreign key (IDMUNICIPIO) references CM_MUNICIPIO(IDMUNICIPIO);
alter table CM_INSTITUICAO add constraint FK_CM_INSTITUICAO_IDPAIS foreign key (IDPAIS) references CM_PAIS(IDPAIS);

alter table CM_LOG add constraint FK_CM_LOG_IDUSUARIO foreign key (IDUSUARIO) references CM_USUARIO(IDUSUARIO);

alter table CM_MUNICIPIO add constraint FK_CM_MUNICIPIO_IDUF foreign key (IDUF) references CM_UF(IDUF);

alter table CM_NOTICIA add constraint FK_CM_NOTICIA_IDSISTEMA foreign key (IDSISTEMA) references CM_SISTEMA(IDSISTEMA) on delete CASCADE;

alter table CM_PESSOA add constraint FK_CM_PESSOA_IDAGENCIA foreign key (IDBANCO, IDAGENC) references CM_AGENCIA(IDBANCO, IDAGENCIA);
alter table CM_PESSOA add constraint FK_CM_PESSOA_IDESTADOCIVIL foreign key (IDESTADOCIVIL) references CM_ESTADOCIVIL(IDESTADOCIVIL);
alter table CM_PESSOA add constraint FK_CM_PESSOA_IDMUNICIPIO foreign key (IDMUNICIPIO) references CM_MUNICIPIO(IDMUNICIPIO);
alter table CM_PESSOA add constraint FK_CM_PESSOA_IDMUNICIPIONASC foreign key (IDMUNICIPIONASCIMENTO) references CM_MUNICIPIO(IDMUNICIPIO);
alter table CM_PESSOA add constraint FK_CM_PESSOA_IDPAIS foreign key (IDPAIS) references CM_PAIS(IDPAIS);
alter table CM_PESSOA add constraint FK_CM_PESSOA_IDPAISNASC foreign key (IDPAISNASCIMENTO) references CM_PAIS(IDPAIS);

alter table CM_SESSAO add constraint FK_CM_SESSAO_IDUSUARIO foreign key (IDUSUARIO) references CM_USUARIO(IDUSUARIO);

alter table CM_SETORACESSO add constraint FK_CM_SETORACESSO_IDSETORPAI foreign key (IDSETORPAI) references CM_SETOR(IDSETOR) on delete CASCADE;
alter table CM_SETORACESSO add constraint FK_CM_SETORACESSO_IDSETORFILHO foreign key (IDSETORFILHO) references CM_SETOR(IDSETOR) on delete CASCADE;

alter table CM_TRANSACAO add constraint FK_CM_TRANSACAO_IDSISTEMA foreign key (IDSISTEMA) references CM_SISTEMA(IDSISTEMA);

alter table CM_USUARIO add constraint FK_CM_USUARIO_IDPESSOA foreign key (IDPESSOA) references CM_PESSOA(IDPESSOA);
alter table CM_USUARIO add constraint FK_CM_USUARIO_IDSETOR foreign key (IDSETOR) references CM_SETOR(IDSETOR);



/*===========================================================================*/
/*Table Index Definitions                                                    */
/*===========================================================================*/
create index CM_LOG_LOGIN_KEY on CM_LOG(TIMESTAMP);

create index CM_PESSOA_NOME_KEY on CM_PESSOA(NOME);

create unique index UK_CM_USUARIO_LOGIN on CM_USUARIO(LOGIN);
create index CM_USUARIO_LOGIN_KEY on CM_USUARIO(LOGIN);

/*===========================================================================*/
/*Table Grants                                                               */
/*===========================================================================*/
grant select on CM_ACESSO to sysdba with grant option;
grant insert on CM_ACESSO to sysdba with grant option;
grant update on CM_ACESSO to sysdba with grant option;
grant delete on CM_ACESSO to sysdba with grant option;
grant references on CM_ACESSO to sysdba with grant option;

grant select on CM_AGENCIA to sysdba with grant option;
grant insert on CM_AGENCIA to sysdba with grant option;
grant update on CM_AGENCIA to sysdba with grant option;
grant delete on CM_AGENCIA to sysdba with grant option;
grant references on CM_AGENCIA to sysdba with grant option;

grant select on CM_BANCO to sysdba with grant option;
grant insert on CM_BANCO to sysdba with grant option;
grant update on CM_BANCO to sysdba with grant option;
grant delete on CM_BANCO to sysdba with grant option;
grant references on CM_BANCO to sysdba with grant option;

grant select on CM_ESTADOCIVIL to sysdba with grant option;
grant insert on CM_ESTADOCIVIL to sysdba with grant option;
grant update on CM_ESTADOCIVIL to sysdba with grant option;
grant delete on CM_ESTADOCIVIL to sysdba with grant option;
grant references on CM_ESTADOCIVIL to sysdba with grant option;

grant select on CM_GRPUSUARIO to sysdba with grant option;
grant insert on CM_GRPUSUARIO to sysdba with grant option;
grant update on CM_GRPUSUARIO to sysdba with grant option;
grant delete on CM_GRPUSUARIO to sysdba with grant option;
grant references on CM_GRPUSUARIO to sysdba with grant option;

grant select on CM_GRUPOACESSO to sysdba with grant option;
grant insert on CM_GRUPOACESSO to sysdba with grant option;
grant update on CM_GRUPOACESSO to sysdba with grant option;
grant delete on CM_GRUPOACESSO to sysdba with grant option;
grant references on CM_GRUPOACESSO to sysdba with grant option;

grant select on CM_INSTITUICAO to sysdba with grant option;
grant insert on CM_INSTITUICAO to sysdba with grant option;
grant update on CM_INSTITUICAO to sysdba with grant option;
grant delete on CM_INSTITUICAO to sysdba with grant option;
grant references on CM_INSTITUICAO to sysdba with grant option;

grant select on CM_LOG to sysdba with grant option;
grant insert on CM_LOG to sysdba with grant option;
grant update on CM_LOG to sysdba with grant option;
grant delete on CM_LOG to sysdba with grant option;
grant references on CM_LOG to sysdba with grant option;

grant select on CM_MUNICIPIO to sysdba with grant option;
grant insert on CM_MUNICIPIO to sysdba with grant option;
grant update on CM_MUNICIPIO to sysdba with grant option;
grant delete on CM_MUNICIPIO to sysdba with grant option;
grant references on CM_MUNICIPIO to sysdba with grant option;

grant select on CM_NOTICIA to sysdba with grant option;
grant insert on CM_NOTICIA to sysdba with grant option;
grant update on CM_NOTICIA to sysdba with grant option;
grant delete on CM_NOTICIA to sysdba with grant option;
grant references on CM_NOTICIA to sysdba with grant option;

grant select on CM_PAIS to sysdba with grant option;
grant insert on CM_PAIS to sysdba with grant option;
grant update on CM_PAIS to sysdba with grant option;
grant delete on CM_PAIS to sysdba with grant option;
grant references on CM_PAIS to sysdba with grant option;

grant select on CM_PESSOA to sysdba with grant option;
grant insert on CM_PESSOA to sysdba with grant option;
grant update on CM_PESSOA to sysdba with grant option;
grant delete on CM_PESSOA to sysdba with grant option;
grant references on CM_PESSOA to sysdba with grant option;

grant select on CM_SESSAO to sysdba with grant option;
grant insert on CM_SESSAO to sysdba with grant option;
grant update on CM_SESSAO to sysdba with grant option;
grant delete on CM_SESSAO to sysdba with grant option;
grant references on CM_SESSAO to sysdba with grant option;

grant select on CM_SETOR to sysdba with grant option;
grant insert on CM_SETOR to sysdba with grant option;
grant update on CM_SETOR to sysdba with grant option;
grant delete on CM_SETOR to sysdba with grant option;
grant references on CM_SETOR to sysdba with grant option;

grant select on CM_SETORACESSO to sysdba with grant option;
grant insert on CM_SETORACESSO to sysdba with grant option;
grant update on CM_SETORACESSO to sysdba with grant option;
grant delete on CM_SETORACESSO to sysdba with grant option;
grant references on CM_SETORACESSO to sysdba with grant option;

grant select on CM_SISTEMA to sysdba with grant option;
grant insert on CM_SISTEMA to sysdba with grant option;
grant update on CM_SISTEMA to sysdba with grant option;
grant delete on CM_SISTEMA to sysdba with grant option;
grant references on CM_SISTEMA to sysdba with grant option;

grant select on CM_TABELAGERAL to sysdba with grant option;
grant insert on CM_TABELAGERAL to sysdba with grant option;
grant update on CM_TABELAGERAL to sysdba with grant option;
grant delete on CM_TABELAGERAL to sysdba with grant option;
grant references on CM_TABELAGERAL to sysdba with grant option;

grant select on CM_TRANSACAO to sysdba with grant option;
grant insert on CM_TRANSACAO to sysdba with grant option;
grant update on CM_TRANSACAO to sysdba with grant option;
grant delete on CM_TRANSACAO to sysdba with grant option;
grant references on CM_TRANSACAO to sysdba with grant option;

grant select on CM_UF to sysdba with grant option;
grant insert on CM_UF to sysdba with grant option;
grant update on CM_UF to sysdba with grant option;
grant delete on CM_UF to sysdba with grant option;
grant references on CM_UF to sysdba with grant option;

grant select on CM_USUARIO to sysdba with grant option;
grant insert on CM_USUARIO to sysdba with grant option;
grant update on CM_USUARIO to sysdba with grant option;
grant delete on CM_USUARIO to sysdba with grant option;
grant references on CM_USUARIO to sysdba with grant option;

/*===========================================================================*/
/*View Grants                                                                */
/*===========================================================================*/
/*===========================================================================*/
/*Stored Procedure Grants                                                    */
/*===========================================================================*/
