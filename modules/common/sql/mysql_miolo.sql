# phpMyAdmin SQL Dump
# version 2.5.3-rc2
# http://www.phpmyadmin.net
#
# Host: localhost
# Generation Time: Apr 19, 2004 at 11:57 AM
# Server version: 4.0.15
# PHP Version: 4.3.2
# 
# Database : `miolo`
# 

# --------------------------------------------------------

#
# Table structure for table `cm_acesso`
#

CREATE TABLE `cm_acesso` (
  `idgrupo` int(11) NOT NULL default '0',
  `idtrans` int(11) NOT NULL default '0',
  `direito` varchar(5) NOT NULL default '',
  PRIMARY KEY  (`idgrupo`,`idtrans`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_acesso`
#

INSERT INTO `cm_acesso` VALUES (1, 0, '31');
INSERT INTO `cm_acesso` VALUES (8, 25, '31');

# --------------------------------------------------------

#
# Table structure for table `cm_agencia`
#

CREATE TABLE `cm_agencia` (
  `idbanco` char(3) NOT NULL default '',
  `idagenc` varchar(7) NOT NULL default '',
  `nome` varchar(50) default NULL,
  PRIMARY KEY  (`idbanco`,`idagenc`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_agencia`
#


# --------------------------------------------------------

#
# Table structure for table `cm_banco`
#

CREATE TABLE `cm_banco` (
  `idbanco` char(3) NOT NULL default '',
  `nome` varchar(50) default NULL,
  PRIMARY KEY  (`idbanco`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_banco`
#


# --------------------------------------------------------

#
# Table structure for table `cm_estadocivil`
#

CREATE TABLE `cm_estadocivil` (
  `idestadocivil` char(1) NOT NULL default '',
  `estadocivil` varchar(30) default NULL,
  PRIMARY KEY  (`idestadocivil`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_estadocivil`
#


# --------------------------------------------------------

#
# Table structure for table `cm_grpusuario`
#

CREATE TABLE `cm_grpusuario` (
  `idgrupo` int(11) NOT NULL default '0',
  `idusuario` int(11) NOT NULL default '0',
  PRIMARY KEY  (`idgrupo`,`idusuario`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_grpusuario`
#

INSERT INTO `cm_grpusuario` VALUES (1, 1);
INSERT INTO `cm_grpusuario` VALUES (8, 1);

# --------------------------------------------------------

#
# Table structure for table `cm_grupoacesso`
#

CREATE TABLE `cm_grupoacesso` (
  `idgrupo` int(11) NOT NULL auto_increment,
  `grupo` varchar(50) default NULL,
  PRIMARY KEY  (`idgrupo`)
) TYPE=MyISAM AUTO_INCREMENT=9 ;

#
# Dumping data for table `cm_grupoacesso`
#

INSERT INTO `cm_grupoacesso` VALUES (1, 'ADMIN');
INSERT INTO `cm_grupoacesso` VALUES (2, 'COMMON_RO');
INSERT INTO `cm_grupoacesso` VALUES (3, 'COMMON_RW');
INSERT INTO `cm_grupoacesso` VALUES (4, 'SIGA_RO');
INSERT INTO `cm_grupoacesso` VALUES (5, 'SIGA_RW');
INSERT INTO `cm_grupoacesso` VALUES (6, 'SIGA_COORDCURSO');
INSERT INTO `cm_grupoacesso` VALUES (7, 'SIGA_PLANODEP');
INSERT INTO `cm_grupoacesso` VALUES (8, 'DEVEL');

# --------------------------------------------------------

#
# Table structure for table `cm_instituicao`
#

CREATE TABLE `cm_instituicao` (
  `idinstituicao` varchar(4) NOT NULL default '',
  `instituicao` varchar(20) default NULL,
  `nome` varchar(100) default NULL,
  `rua` varchar(50) default NULL,
  `numero` varchar(15) default NULL,
  `complemento` varchar(15) default NULL,
  `bairro` varchar(50) default NULL,
  `cep` varchar(8) default NULL,
  `telefone` varchar(15) default NULL,
  `email` varchar(50) default NULL,
  `fax` varchar(15) default NULL,
  `cgc` varchar(19) default NULL,
  `caixapostal` varchar(15) default NULL,
  `idpais` varchar(4) NOT NULL default '',
  `idmunicipio` varchar(4) NOT NULL default '',
  PRIMARY KEY  (`idinstituicao`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_instituicao`
#


# --------------------------------------------------------

#
# Table structure for table `cm_log`
#

CREATE TABLE `cm_log` (
  `idlog` int(11) NOT NULL auto_increment,
  `timestamp` date NOT NULL default '0000-00-00',
  `descricao` varchar(200) default NULL,
  `operacao` char(3) default NULL,
  `modulo` varchar(20) NOT NULL default '',
  `classe` varchar(30) NOT NULL default '',
  `idusuario` int(11) NOT NULL default '0',
  PRIMARY KEY  (`idlog`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

#
# Dumping data for table `cm_log`
#


# --------------------------------------------------------

#
# Table structure for table `cm_municipio`
#

CREATE TABLE `cm_municipio` (
  `idmunicipio` varchar(4) NOT NULL default '',
  `municipio` varchar(50) default NULL,
  `iduf` varchar(4) NOT NULL default '',
  PRIMARY KEY  (`idmunicipio`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_municipio`
#

INSERT INTO `cm_municipio` VALUES ('3912', 'JUIZ DE FORA', 'MG');

# --------------------------------------------------------

#
# Table structure for table `cm_noticia`
#

CREATE TABLE `cm_noticia` (
  `idsistema` int(11) NOT NULL default '0',
  `idnoticia` int(11) NOT NULL default '0',
  `dtnoticia` date default NULL,
  `noticia` varchar(200) default NULL,
  PRIMARY KEY  (`idsistema`,`idnoticia`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_noticia`
#


# --------------------------------------------------------

#
# Table structure for table `cm_pais`
#

CREATE TABLE `cm_pais` (
  `idpais` varchar(4) NOT NULL default '',
  `pais` varchar(50) default NULL,
  `nacionalidade` varchar(50) default NULL,
  PRIMARY KEY  (`idpais`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_pais`
#

INSERT INTO `cm_pais` VALUES ('1', 'BRASIL', 'BRASILEIRA');

# --------------------------------------------------------

#
# Table structure for table `cm_pessoa`
#

CREATE TABLE `cm_pessoa` (
  `idpessoa` int(11) NOT NULL auto_increment,
  `nome` varchar(55) NOT NULL default '',
  `rua` varchar(52) default NULL,
  `numero` varchar(15) default NULL,
  `complemento` varchar(20) default NULL,
  `bairro` varchar(50) default NULL,
  `cep` varchar(8) NOT NULL default '',
  `datanasc` date NOT NULL default '0000-00-00',
  `nomepai` varchar(50) default NULL,
  `nomemae` varchar(50) default NULL,
  `sexo` char(1) NOT NULL default '',
  `anochegbrasil` varchar(4) default NULL,
  `telefone` varchar(20) default NULL,
  `celular` varchar(20) default NULL,
  `email` varchar(50) default NULL,
  `gruposanguineo` char(3) default NULL,
  `cpf` varchar(11) default NULL,
  `numrg` varchar(15) default NULL,
  `tiporg` varchar(20) default NULL,
  `orgaorg` varchar(20) default NULL,
  `ufrg` char(2) default NULL,
  `numcartpro` varchar(7) default NULL,
  `seriecartpro` varchar(4) default NULL,
  `ufcartpro` char(2) default NULL,
  `tituloeleitor` varchar(12) default NULL,
  `zonatitulo` char(3) default NULL,
  `secaotitulo` varchar(4) default NULL,
  `uftitulo` char(2) default NULL,
  `numdocmilitar` varchar(12) default NULL,
  `seriedocmilitar` char(1) default NULL,
  `categdocmilitar` char(1) default NULL,
  `conta` varchar(20) default NULL,
  `numcert` varchar(6) default NULL,
  `livrocert` varchar(10) default NULL,
  `folhacert` char(3) default NULL,
  `cartorio` varchar(60) default NULL,
  `pispasep` varchar(11) default NULL,
  `datapispasep` date default NULL,
  `bancopispasep` char(3) default NULL,
  `identprof` varchar(15) default NULL,
  `tipoidentprof` varchar(20) default NULL,
  `idpais` varchar(4) NOT NULL default '',
  `idmunicipio` varchar(4) NOT NULL default '',
  `idmunicipionascimento` varchar(4) default NULL,
  `idpaisnascimento` varchar(4) NOT NULL default '',
  `idestadocivil` char(1) default NULL,
  `idbanco` char(3) default NULL,
  `idagenc` varchar(7) default NULL,
  PRIMARY KEY  (`idpessoa`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

#
# Dumping data for table `cm_pessoa`
#

INSERT INTO `cm_pessoa` VALUES (1, 'Administrador', NULL, NULL, NULL, NULL, '3610000', '2001-01-01', NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '3912', '3912', '1', NULL, NULL, NULL);

# --------------------------------------------------------

#
# Table structure for table `cm_sessao`
#

CREATE TABLE `cm_sessao` (
  `idsessao` int(11) NOT NULL auto_increment,
  `tsin` timestamp(14) NOT NULL,
  `tsout` timestamp(14) NOT NULL,
  `name` varchar(50) default NULL,
  `sid` varchar(32) default NULL,
  `forced` char(1) default NULL,
  `remoteaddr` varchar(15) default NULL,
  `idusuario` int(11) NOT NULL default '0',
  PRIMARY KEY  (`idsessao`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

#
# Dumping data for table `cm_sessao`
#


# --------------------------------------------------------

#
# Table structure for table `cm_setor`
#

CREATE TABLE `cm_setor` (
  `idsetor` varchar(4) NOT NULL default '',
  `siglasetor` varchar(15) NOT NULL default '',
  `dataini` date NOT NULL default '0000-00-00',
  `nomesetor` varchar(50) default NULL,
  `tiposetor` varchar(20) default NULL,
  `datafim` date default NULL,
  `fone` varchar(15) default NULL,
  `fax` varchar(15) default NULL,
  `centrocusto` varchar(20) default NULL,
  `obs` varchar(255) default NULL,
  `localizacao` varchar(15) default NULL,
  `paisetor` varchar(15) default NULL,
  `pairelat` varchar(15) default NULL,
  `idsetorsiape` varchar(6) default NULL,
  PRIMARY KEY  (`idsetor`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_setor`
#

INSERT INTO `cm_setor` VALUES ('1', 'REITORIA', '2001-01-01', 'REITORIA DA UFJF', 'UNIDADE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

# --------------------------------------------------------

#
# Table structure for table `cm_setoracesso`
#

CREATE TABLE `cm_setoracesso` (
  `idsetor_1` varchar(4) NOT NULL default '',
  `idsetor` varchar(4) NOT NULL default '',
  `finalidade` varchar(15) default NULL,
  PRIMARY KEY  (`idsetor_1`,`idsetor`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_setoracesso`
#


# --------------------------------------------------------

#
# Table structure for table `cm_sistema`
#

CREATE TABLE `cm_sistema` (
  `idsistema` int(11) NOT NULL auto_increment,
  `sistema` varchar(30) default NULL,
  PRIMARY KEY  (`idsistema`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

#
# Dumping data for table `cm_sistema`
#

INSERT INTO `cm_sistema` VALUES (1, 'COMMON');
INSERT INTO `cm_sistema` VALUES (2, 'SIGA');

# --------------------------------------------------------

#
# Table structure for table `cm_tabelageral`
#

CREATE TABLE `cm_tabelageral` (
  `idtabelageral` int(11) NOT NULL auto_increment,
  `tabela` varchar(30) NOT NULL default '',
  `item1` varchar(30) NOT NULL default '',
  `item2` varchar(30) default NULL,
  `item3` varchar(200) default NULL,
  PRIMARY KEY  (`idtabelageral`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

#
# Dumping data for table `cm_tabelageral`
#


# --------------------------------------------------------

#
# Table structure for table `cm_transacao`
#

CREATE TABLE `cm_transacao` (
  `idtrans` int(11) NOT NULL auto_increment,
  `transacao` varchar(30) default NULL,
  `idsistema` int(11) default NULL,
  PRIMARY KEY  (`idtrans`)
) TYPE=MyISAM AUTO_INCREMENT=28 ;

#
# Dumping data for table `cm_transacao`
#

INSERT INTO `cm_transacao` VALUES (2, 'ALL', 1);
INSERT INTO `cm_transacao` VALUES (3, 'ADMIN', 1);
INSERT INTO `cm_transacao` VALUES (4, 'TRANSACAO', 1);
INSERT INTO `cm_transacao` VALUES (5, 'USUARIO', 1);
INSERT INTO `cm_transacao` VALUES (6, 'SISTEMA', 1);
INSERT INTO `cm_transacao` VALUES (7, 'SETOR', 1);
INSERT INTO `cm_transacao` VALUES (8, 'GRUPOACESSO', 1);
INSERT INTO `cm_transacao` VALUES (9, 'LOG', 1);
INSERT INTO `cm_transacao` VALUES (10, 'NOTICIA', 1);
INSERT INTO `cm_transacao` VALUES (11, 'BANCO', 1);
INSERT INTO `cm_transacao` VALUES (12, 'AGENCIA', 1);
INSERT INTO `cm_transacao` VALUES (13, 'ESTADOCIVIL', 1);
INSERT INTO `cm_transacao` VALUES (14, 'INSTITUICAO', 1);
INSERT INTO `cm_transacao` VALUES (15, 'MUNICIPIO', 1);
INSERT INTO `cm_transacao` VALUES (16, 'PAIS', 1);
INSERT INTO `cm_transacao` VALUES (17, 'UF', 1);
INSERT INTO `cm_transacao` VALUES (18, 'DISCIPLINA', 2);
INSERT INTO `cm_transacao` VALUES (19, 'ALUNO', 2);
INSERT INTO `cm_transacao` VALUES (20, 'DOCENTE', 2);
INSERT INTO `cm_transacao` VALUES (21, 'CURRICULO', 2);
INSERT INTO `cm_transacao` VALUES (22, 'CURSO', 2);
INSERT INTO `cm_transacao` VALUES (23, 'REQUISITO', 2);
INSERT INTO `cm_transacao` VALUES (24, 'EQUIVALENCIA', 2);
INSERT INTO `cm_transacao` VALUES (25, 'GRADE', 2);
INSERT INTO `cm_transacao` VALUES (26, 'PLANODEP', 2);
INSERT INTO `cm_transacao` VALUES (27, 'DEVEL', 1);
INSERT INTO `cm_transacao` VALUES (1, 'COMMON', 1);

# --------------------------------------------------------

#
# Table structure for table `cm_uf`
#

CREATE TABLE `cm_uf` (
  `iduf` varchar(4) NOT NULL default '',
  `uf` varchar(50) default NULL,
  PRIMARY KEY  (`iduf`)
) TYPE=MyISAM;

#
# Dumping data for table `cm_uf`
#

INSERT INTO `cm_uf` VALUES ('MG', 'MINAS GERAIS');

# --------------------------------------------------------

#
# Table structure for table `cm_usuario`
#

CREATE TABLE `cm_usuario` (
  `idusuario` int(11) NOT NULL auto_increment,
  `login` varchar(20) NOT NULL default '',
  `password` varchar(20) NOT NULL default '',
  `nick` varchar(20) default NULL,
  `passmd5` varchar(32) default NULL,
  `idpessoa` int(11) default NULL,
  `idsetor` varchar(4) default NULL,
  PRIMARY KEY  (`idusuario`)
) TYPE=MyISAM AUTO_INCREMENT=3 ;

#
# Dumping data for table `cm_usuario`
#

INSERT INTO `cm_usuario` VALUES (1, 'admin', 'admin', NULL, NULL, 1, '1');
    