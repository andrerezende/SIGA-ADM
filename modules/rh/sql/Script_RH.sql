-- 
-- TABLE: RH_PROGRESSAOCAPACITACAO
--

CREATE TABLE RH_PROGRESSAOCAPACITACAO(
    IDPROGRESSAOCAPACITACAO    INTEGER    NOT NULL,
    IDCLASSE                   INTEGER    NOT NULL,
    NIVELPADRAO                INTEGER    NOT NULL,
    CARGAHORARIACAPACITACAO    INTEGER,
    PRIMARY KEY (IDPROGRESSAOCAPACITACAO)
)
;

-- 
-- TABLE: CM_FOTO
--

CREATE TABLE CM_FOTO(
    IDFOTO      INTEGER    NOT NULL,
    IDPESSOA    INTEGER,
    MIMETYPE    VARCHAR(50),
    FOTO        OID,
    CONSTRAINT PK_CM_FOTO PRIMARY KEY (IDFOTO)
)
;

-- 
-- TABLE: GA_ESTAGIO 
--

CREATE TABLE GA_ESTAGIO(
    IDESTAGIO          INTEGER     NOT NULL,
    DATAINICIO         DATE,
    DATAFIM            DATE,
    OBRIGATORIO        CHAR(1),
    CARGAHORADIA       INTEGER,
    CARGAHORASEM       INTEGER,
    VALORBOLSA         INTEGER,
    SEGUROPOR          CHAR(1),
    PLANOATIV          VARCHAR(500),
    VALIDAPLANO        CHAR(1),
    SUPERVISOR         VARCHAR(50),
    CARGOSUP           CHAR(20),
    REGISTROSUP        CHAR(20),
    IRAINICIO          INTEGER,
    IRAFIM             INTEGER,
    CONCEITO           CHAR(1),
    IDVINCULOSUP       CHAR(7),
    MATRICULA          CHAR(20),
    IDINSTITUICAO      CHAR(6),
    MOTIVONAOVALIDA    VARCHAR(200),
    CONSTRAINT PK_GA_ESTAGIO PRIMARY KEY (IDESTAGIO)
)
;

-- 
-- TABLE: GA_DEPARTAMENTO 
--

CREATE TABLE GA_DEPARTAMENTO(
    IDDEPTO         CHAR(3)         NOT NULL,
    DEPTO           CHAR(20)    NOT NULL,
    NOME            VARCHAR(50)    NOT NULL,
    IDSETOR         INTEGER    NOT NULL,
    IDCHEFEDEPTO    CHAR(7),
    NIVEL           CHAR(1),
    AREA            CHAR(1),
    CONSTRAINT PK_GA_DEPARTAMENTO PRIMARY KEY (IDDEPTO)
)
;

-- 
-- TABLE: AD_CONTRATO 
--

CREATE TABLE AD_CONTRATO(
    IDCONTRATO      integer     NOT NULL,
    NUMCONTRATO      CHAR(12),
    DATAINICIO       DATE,
    DATAFIM          DATE,
    OBJETO           VARCHAR(200),
    OBS              VARCHAR(500),
    SITUACAO         CHAR(1),
    IDCONTRATOPAI    INTEGER,
    CONSTRAINT PK_AD_CONTRATO PRIMARY KEY (IDCONTRATO)
)
;

ALTER TABLE AD_CONTRATO ADD CONSTRAINT FK_AD_CONTRATO_TA 
    FOREIGN KEY (IDCONTRATOPAI)
    REFERENCES AD_CONTRATO(IDCONTRATO)
;
-- 
-- TABLE: GA_CURSO 
--

CREATE TABLE GA_CURSO(
    CURSO            CHAR(20)      NOT NULL,
    NOME             VARCHAR(100)     NOT NULL,
    HABILITACAO      VARCHAR(100)     NOT NULL,
    TITULO           VARCHAR(50)      NOT NULL,
    DECRETO          VARCHAR(100),
    ATIVO            CHAR(1),
    TIPO             CHAR(25),
    MSGCOORD         VARCHAR(3000),
    IDTIPOCURSO      CHAR(2)           NOT NULL,
    IDTURNO          CHAR(1)           NOT NULL,
    IDVINC           INTEGER,
    IDDOCENTE        INTEGER,
    IRA              INTEGER,
    IDSETOR          INTEGER      NOT NULL,
    CURSOENADE       CHAR(6),
    HABILENADE       CHAR(6),
    IDDOCENTEVICE    INTEGER,
    DATAINICIO       DATE,
    SEQPINGIFES      INTEGER,
    PRESENCIAL       CHAR(1),
    AREA             CHAR(50),
    COLAGRAU         VARCHAR(50),
    CONSTRAINT PK_GA_CURSO PRIMARY KEY (CURSO)
)
;



CREATE INDEX IDX_GA_CURSO1_GA_TI ON GA_CURSO(IDTIPOCURSO)
;
-- 
-- INDEX: IDX_GA_CURSO2_GA_TU 
--

CREATE INDEX IDX_GA_CURSO2_GA_TU ON GA_CURSO(IDTURNO)
;
-- 
-- INDEX: IDX_GA_CURSO3_GA_SE 
--

CREATE INDEX IDX_GA_CURSO3_GA_SE ON GA_CURSO(IDSETOR)
;


-- 
-- TABLE: RH_PERCQUALIFICACAO
--

CREATE TABLE rh_percqualificacao(
        idpercqualificacao integer not null primary key,
	nivelclassificacao varchar(50),
	idescolaridadepcctae integer,
	percentualdireto float,
	percentualindireto float);

-- 
-- TABLE: RH_HISTINCENTIVO
--


CREATE TABLE rh_histincentivo(
        idhistincentivo integer not null primary key,
        idhistformacao integer,
        idhisttitulacao integer,
        idpercqualificacao integer,
        idvinculo character(7),
        relacao varchar(50),
        percentualaplicado float,
        dataincentivo date);



-- 
-- TABLE: RH_HISTORICO
--

CREATE TABLE RH_HISTORICO(
    idhistorico integer not null primary key, 
    datainicio date, 
    datafim date, 
    obs varchar(5000), 
    idvinculo char(7));
)
;


-- 
-- TABLE: RH_ACESSOPROADES 
--

CREATE TABLE RH_ACESSOPROADES(
    IDPROADES    integer    NOT NULL,
    IDUSUARIO    integer    NOT NULL
)
;



-- 
-- TABLE: RH_ADICIONAL 
--

CREATE TABLE RH_ADICIONAL(
    IDVINCULO      CHAR(7)          NOT NULL,
    DATAINICIO     DATE             NOT NULL,
    DATAFIM        DATE,
    IDADICIONAL    CHAR(1)          NOT NULL,
    GRAU           varchar(6),
    OBS            varchar(500),
    CONSTRAINT PK_RH_ADICIONAL PRIMARY KEY (IDVINCULO, DATAINICIO)
)
;



-- 
-- TABLE: RH_AMBIENTE 
--

CREATE TABLE RH_AMBIENTE(
    IDAMBIENTE    integer    NOT NULL,
    DESCRICAO     varchar(50),
    CONSTRAINT PK_RH_AMBIENTE PRIMARY KEY (IDAMBIENTE)
)
;



-- 
-- TABLE: RH_ASSUNTO 
--

CREATE TABLE RH_ASSUNTO(
    IDREUNIAO    integer     NOT NULL,
    IDASSUNTO    integer     NOT NULL,
    ASSUNTO      varchar(500),
    CONSTRAINT PK_RH_ASSUNTO PRIMARY KEY (IDASSUNTO)
)
;



-- 
-- TABLE: RH_ATIVIDADE 
--

CREATE TABLE RH_ATIVIDADE(
    IDATIVIDADE    integer     NOT NULL,
    IDVINCULO      CHAR(7),
    DATAINICIO     DATE,
    DATAFIM        DATE,
    ATIVIDADE      varchar(500),
    CONSTRAINT PK_RH_ATIVIDADE PRIMARY KEY (IDATIVIDADE)
)
;



-- 
-- TABLE: RH_ATIVPROADES 
--

CREATE TABLE RH_ATIVPROADES(
    IDATIVIDADE    integer     NOT NULL,
    DESCRICAO      varchar(200),
    IDMETA         integer     NOT NULL
)
;



-- 
-- TABLE: RH_AUSENTE 
--

CREATE TABLE RH_AUSENTE(
    IDAUSENTE      integer    NOT NULL,
    IDVINCULO      CHAR(7)         NOT NULL,
    IDREUNIAO      integer    NOT NULL,
    JUSTIFICADO    CHAR(1)         NOT NULL,
    CONSTRAINT PK_RH_AUSENTE PRIMARY KEY (IDAUSENTE)
)
;



-- 
-- TABLE: RH_AVERBACAO 
--

CREATE TABLE RH_AVERBACAO(
    IDAVERBACAO    integer     NOT NULL,
    PROCESSO       CHAR(21),
    DATAINICIO     DATE,
    DATAFIM        DATE,
    TOTALDIAS      integer,
    TIPOTEMPO      varchar(7),
    INSTITUICAO    varchar(120),
    IDVINCULO      CHAR(7)          NOT NULL,
    CONSTRAINT PK_RH_AVERBACAO PRIMARY KEY (IDAVERBACAO)
)
;



-- 
-- TABLE: RH_AVERBFINALIDADE 
--

CREATE TABLE RH_AVERBFINALIDADE(
    IDAVERBACAO          integer    NOT NULL,
    IDAVERBFINALIDADE    integer    NOT NULL,
    PROCESSO             CHAR(21),
    FINALIDADE           CHAR(2),
    TOTALDIAS            integer,
    CONSTRAINT PK_RH_AVERBFINALIDADE PRIMARY KEY (IDAVERBACAO, IDAVERBFINALIDADE)
)
;



-- 
-- TABLE: RH_BASEAPOSENTADORIA 
--

CREATE TABLE RH_BASEAPOSENTADORIA(
    IDVINCULO    CHAR(7)          NOT NULL,
    MES          integer     NOT NULL,
    ANO          integer     NOT NULL,
    VALORBASE    integer,
    VALORPSS     integer,
    CONSTRAINT PK_RH_BASEAPOSENTADORIA PRIMARY KEY (IDVINCULO, ANO, MES)
)
;



-- 
-- TABLE: RH_CAPACITACAOCOINC 
--

CREATE TABLE RH_CAPACITACAOCOINC(
    IDMODULO1    integer    NOT NULL,
    IDMODULO2    integer    NOT NULL,
    CONSTRAINT PK_RH_CAPACITACAOCOINC PRIMARY KEY (IDMODULO1, IDMODULO2)
)
;



-- 
-- TABLE: RH_CAPACITACAOCOINC2 
--

CREATE TABLE RH_CAPACITACAOCOINC2(
    IDCURSO1    CHAR(5)    NOT NULL,
    IDCURSO2    CHAR(5)    NOT NULL
)
;



-- 
-- TABLE: RH_CAPACITACAOCURSO 
--

CREATE TABLE RH_CAPACITACAOCURSO(
    IDCURSO          INTEGER     NOT NULL,
    NOME             VARCHAR(100)    NOT NULL,
    IDINSTITUICAO    CHAR(6),
    CARGAHORARIA     CHAR(5),
    DATAINICIO       DATE,
    DATAFIM          DATE,
    OBS              VARCHAR(200),
    PRIMARY KEY (IDCURSO)
)
;



-- 
-- TABLE: RH_CAPACITACAOCURSO2 
--

CREATE TABLE RH_CAPACITACAOCURSO2(
    IDCURSO         CHAR(5)          NOT NULL,
    NOME            varchar(100)    NOT NULL,
    MODULO          varchar(100),
    DATAINICIO      DATE,
    DATAFIM         DATE,
    HORAINICIO      CHAR(5),
    HORAFIM         CHAR(5),
    CARGAHORARIA    CHAR(5),
    LOCAL           varchar(100),
    VAGAS           CHAR(3),
    TURNO           CHAR(1),
    STATUS          CHAR(1)
)
;



-- 
-- TABLE: RH_CAPACITACAOINSC 
--

CREATE TABLE RH_CAPACITACAOINSC(
    INSCRICAO        integer      NOT NULL,
    IDVINCULO        CHAR(7)           NOT NULL,
    IDMODULO         integer      NOT NULL,
    TELEFONE         CHAR(20),
    TURNO            CHAR(10),
    AMBIENTE         varchar(100),
    JUSTIFICATIVA    varchar(2000),
    STATUS           CHAR(1),
    TS               CHAR(20)          NOT NULL,
    IDAUTH           CHAR(7),
    TSAUTH           CHAR(20),
    CONSTRAINT PK_RH_CAPACITACAOINSC PRIMARY KEY (INSCRICAO)
)
;



-- 
-- TABLE: RH_CAPACITACAOINSC2 
--

CREATE TABLE RH_CAPACITACAOINSC2(
    INSCRICAO        integer      NOT NULL,
    IDVINCULO        CHAR(7)           NOT NULL,
    IDCURSO          CHAR(5)           NOT NULL,
    TELEFONE         CHAR(20),
    TURNO            CHAR(10),
    AMBIENTE         varchar(100),
    JUSTIFICATIVA    varchar(2000),
    STATUS           CHAR(1),
    TS               CHAR(20)          NOT NULL,
    IDAUTH           CHAR(7),
    TSAUTH           CHAR(20)
)
;



-- 
-- TABLE: RH_CAPACITACAOMODULO 
--

CREATE TABLE RH_CAPACITACAOMODULO(
    IDMODULO        integer     NOT NULL,
    IDCURSO         integer     NOT NULL,
    MODULO          CHAR(3)          NOT NULL,
    NOME            varchar(100)    NOT NULL,
    DATAINICIO      DATE,
    DATAFIM         DATE,
    HORAINICIO      CHAR(5),
    HORAFIM         CHAR(5),
    CARGAHORARIA    CHAR(5),
    LOCAL           varchar(100),
    VAGAS           CHAR(3),
    TURNO           CHAR(1),
    STATUS          CHAR(1),
    DIASEMANA       varchar(50),
    ANOSEMESTRE     CHAR(6),
    OBSERVACOES     varchar(200),
    CONSTRAINT PK_RH_CAPACITACAOMODULO PRIMARY KEY (IDMODULO)
)
;



-- 
-- TABLE: RH_CARGO 
--

CREATE TABLE RH_CARGO(
    IDGRUPOCARGO          integer    NOT NULL,
    IDCARGO               integer    NOT NULL,
    DESCRICAO             varchar(40),
    ESCOLARIDADEMINIMA    CHAR(2),
    IDJORNADA             integer,
    CONSTRAINT PK_RH_CARGO PRIMARY KEY (IDGRUPOCARGO, IDCARGO)
)
;



-- 
-- TABLE: RH_CARGOCONFIANCA 
--

CREATE TABLE RH_CARGOCONFIANCA(
    IDCARGOCONFIANCA    integer    NOT NULL,
    DESCRICAO           varchar(60)    NOT NULL,
    CONSTRAINT PK_RH_CARGOCONFIANCA PRIMARY KEY (IDCARGOCONFIANCA)
)
;



-- 
-- TABLE: RH_CESSAO 
--

CREATE TABLE RH_CESSAO(
    IDVINCULO            CHAR(7)          NOT NULL,
    DATAINICIO           DATE             NOT NULL,
    DATAFIM              DATE,
    OBS                  varchar(500),
    TIPOONUS             varchar(15),
    TIPOCESSAO           varchar(20),
    TIPOINSTITUICAO      CHAR(1),
    IDGRUPOOCORRENCIA    integer     NOT NULL,
    IDOCORRENCIA         integer     NOT NULL,
    IDINSTITUICAO        CHAR(6)          NOT NULL,
    IDPUBLICACAO         integer,
    CONSTRAINT PK_RH_CESSAO PRIMARY KEY (IDVINCULO, DATAINICIO)
)
;



-- 
-- TABLE: RH_CIDCATEGORIA 
--

CREATE TABLE RH_CIDCATEGORIA(
    IDCIDCATEGORIA    CHAR(3)         NOT NULL,
    OPC               CHAR(1),
    DESCRICAO         varchar(60),
    CONSTRAINT PK_RH_CIDCATEGORIA PRIMARY KEY (IDCIDCATEGORIA)
)
;



-- 
-- TABLE: RH_CIDSUBCATEGORIA 
--

CREATE TABLE RH_CIDSUBCATEGORIA(
    IDCIDCATEGORIA       CHAR(3)         NOT NULL,
    IDCIDSUBCATEGORIA    CHAR(4)         NOT NULL,
    OPC                  CHAR(1),
    DESCRICAO            varchar(60),
    RESTRICAOSEXO        integer,
    CONSTRAINT PK_RH_CIDSUBCATEGORIA PRIMARY KEY (IDCIDCATEGORIA, IDCIDSUBCATEGORIA)
)
;



-- 
-- TABLE: RH_CLASSE 
--

CREATE TABLE RH_CLASSE(
    IDCLASSE           integer    NOT NULL,
    CLASSE             varchar(20)    NOT NULL,
    DESCRICAO          varchar(30)    NOT NULL,
    CATEGORIA          varchar(6)     NOT NULL,
    ORDEMPROGRESSAO    integer,
    CONSTRAINT PK_RH_CLASSE PRIMARY KEY (IDCLASSE)
)
;



-- 
-- TABLE: RH_CLASSEGRUPOCARGO 
--

CREATE TABLE RH_CLASSEGRUPOCARGO(
    IDCLASSE              integer,
    IDCLASSEGRUPOCARGO    integer    NOT NULL,
    IDGRUPOCARGO          integer,
    CONSTRAINT PK_RH_CLASSEGRUPOCARGO PRIMARY KEY (IDCLASSEGRUPOCARGO)
)
;



-- 
-- TABLE: RH_CONTAGEM 
--

CREATE TABLE RH_CONTAGEM(
    IDVINC         integer    NOT NULL,
    NOME           varchar(60),
    SEXO           CHAR(1),
    DTNASC         DATE,
    DTINGSP        DATE,
    GRUPOCARGO     CHAR(3),
    DIASAVERB      integer,
    DIASLICENCA    integer,
    DIASFALTA      integer,
    CONSTRAINT SYS_C002612 PRIMARY KEY (IDVINC)
)
;



-- 
-- TABLE: RH_CONTRATO 
--

CREATE TABLE RH_CONTRATO(
    IDCONTRATO         integer     NOT NULL,
    NUMCONTRATO        varchar(12),
    DATAINICIO         DATE,
    DATAFIM            DATE,
    DATAPRORROGACAO    DATE,
    IDINSTITUICAO      CHAR(6)          NOT NULL,
    IDSETOR            integer     NOT NULL,
    OBJETO             varchar(200),
    OBS                varchar(500),
    CONSTRAINT PK_RH_CONTRATO PRIMARY KEY (IDCONTRATO)
)
;



-- 
-- TABLE: RH_CONTRATOPROVTERCEIRIZADO 
--

CREATE TABLE RH_CONTRATOPROVTERCEIRIZADO(
    IDTERCEIRIZADO    integer    NOT NULL,
    DATAINICIO        DATE            NOT NULL,
    IDCONTRATO        integer    NOT NULL,
    CONSTRAINT PK_RH_CONPROVTER PRIMARY KEY (IDTERCEIRIZADO, DATAINICIO, IDCONTRATO)
)
;



-- 
-- TABLE: RH_DECISAO 
--

CREATE TABLE RH_DECISAO(
    IDREUNIAO    integer     NOT NULL,
    IDDECISAO    integer     NOT NULL,
    DECISAO      varchar(300),
    CONSTRAINT PK_RH_DECISAO PRIMARY KEY (IDDECISAO)
)
;



-- 
-- TABLE: RH_DEPENDENCIA 
--

CREATE TABLE RH_DEPENDENCIA(
    IDDEPENDENTE         integer    NOT NULL,
    IDTIPODEPENDENCIA    CHAR(2)         NOT NULL,
    DATAINICIO           DATE            NOT NULL,
    DATAFIM              DATE,
    CONSTRAINT PK_RH_DEPENDENCIA PRIMARY KEY (IDDEPENDENTE, IDTIPODEPENDENCIA, DATAINICIO)
)
;



-- 
-- TABLE: RH_DEPENDENTE 
--

CREATE TABLE RH_DEPENDENTE(
    IDDEPENDENTE     integer    NOT NULL,
    PARENTESCO       integer    NOT NULL,
    IDPESSOA         integer,
    IDFUNCIONARIO    CHAR(9)         NOT NULL,
    CONSTRAINT PK_RH_DEPENDENTE PRIMARY KEY (IDDEPENDENTE)
)
;



-- 
-- TABLE: RH_DESAVERBACAO 
--

CREATE TABLE RH_DESAVERBACAO(
    IDDESAVERBACAO    integer     NOT NULL,
    PROCESSO          CHAR(21),
    DATAINICIO        DATE,
    DATAFIM           DATE,
    TOTALDIAS         integer,
    DATA              DATE,
    MOTIVO            varchar(100),
    IDAVERBACAO       integer     NOT NULL,
    CONSTRAINT PK_RH_DESAVERBACAO PRIMARY KEY (IDDESAVERBACAO)
)
;



-- 
-- TABLE: RH_DIPLOMALEGAL 
--

CREATE TABLE RH_DIPLOMALEGAL(
    IDDIPLOMALEGAL    integer    NOT NULL,
    DESCRICAO         varchar(20),
    CONSTRAINT PK_RH_DIPLOMALEGAL PRIMARY KEY (IDDIPLOMALEGAL)
)
;



-- 
-- TABLE: RH_DTLIMITEFERIAS 
--

CREATE TABLE RH_DTLIMITEFERIAS(
    IDDTLIMITEFERIAS    integer    NOT NULL,
    MESPREVISTO         CHAR(2)         NOT NULL,
    ANOPREVISTO         CHAR(4)         NOT NULL,
    DTLIMITE            DATE,
    CONSTRAINT SYS_C006526 PRIMARY KEY (IDDTLIMITEFERIAS)
)
;



-- 
-- TABLE: RH_ENCAMINHAMENTO 
--

CREATE TABLE RH_ENCAMINHAMENTO(
    IDREUNIAO           integer     NOT NULL,
    IDENCAMINHAMENTO    integer     NOT NULL,
    ENCAMINHAMENTO      varchar(300),
    CONSTRAINT PK_RH_ENCAMINHAMENTO PRIMARY KEY (IDENCAMINHAMENTO)
)
;



-- 
-- TABLE: RH_EQUIPE 
--

CREATE TABLE RH_EQUIPE(
    IDEQUIPE           integer    NOT NULL,
    IDPROADES          integer    NOT NULL,
    CATEGORIAEQUIPE    integer,
    NOME               varchar(50),
    CONSTRAINT PK_RH_EQUIPE PRIMARY KEY (IDEQUIPE)
)
;



-- 
-- TABLE: RH_ESCALA 
--

CREATE TABLE RH_ESCALA(
    DESCRICAO    varchar(20),
    IDESCALA     integer    NOT NULL,
    CONSTRAINT SYS_C009267 PRIMARY KEY (IDESCALA)
)
;



-- 
-- TABLE: RH_ESCOLARIDADEPCCTAE 
--

CREATE TABLE RH_ESCOLARIDADEPCCTAE(
    IDESCOLARIDADEPCCTAE    integer     NOT NULL,
    ESCOLARIDADE            integer,
    DESCRICAO               varchar(100),
    CONSTRAINT SYS_C009826 PRIMARY KEY (IDESCOLARIDADEPCCTAE)
)
;



-- 
-- TABLE: RH_FERIAS 
--

CREATE TABLE RH_FERIAS(
    DATAINICIOPERAQ        DATE             NOT NULL,
    DATAINICIO             DATE             NOT NULL,
    DATAFIM                DATE             NOT NULL,
    ABONO                  CHAR(1)          NOT NULL,
    ADIANTAMENTO13         CHAR(1)          NOT NULL,
    ADIANTAMENTOSALARIO    CHAR(1)          NOT NULL,
    TOTALDIAS              integer     NOT NULL,
    INICIOFIMABONO         varchar(1),
    OBS                    varchar(500),
    NUMFOLHA               integer,
    DATAFIMPREVISTA        DATE,
    ABONOCONST             CHAR(1)          NOT NULL,
    IDVINCULOPERAQ         CHAR(7)          NOT NULL,
    CONSTRAINT PK_RH_FERIAS PRIMARY KEY (IDVINCULOPERAQ, DATAINICIOPERAQ, DATAINICIO)
)
;



-- 
-- TABLE: RH_FORMACAO 
--

CREATE TABLE RH_FORMACAO(
    IDFORMACAO      integer    NOT NULL,
    FORMACAO        varchar(40),
    ESCOLARIDADE    char(1),
    HABSIAPE        integer,
    CONSTRAINT PK_RH_FORMACAO PRIMARY KEY (IDFORMACAO)
)
;



-- 
-- TABLE: RH_FUNCAO 
--

CREATE TABLE RH_FUNCAO(
    IDFUNCAO              integer     NOT NULL,
    IDNIVEL               integer     NOT NULL,
    DATAINICIO            DATE             NOT NULL,
    DATAFIM               DATE,
    DESCRICAO             varchar(100)    NOT NULL,
    IDPUBLICACAOINICIO    integer,
    IDPUBLICACAOFIM       integer,
    IDSETOR               integer     NOT NULL,
    MANDATO               integer,
    IDCARGOCONFIANCA      integer,
    IDCURSO               varchar(20),
    CONSTRAINT PK_RH_FUNCAO PRIMARY KEY (IDFUNCAO)
)
;



-- 
-- TABLE: RH_FUNCAOATUAL 
--

CREATE TABLE RH_FUNCAOATUAL(
    IDVINCULO    CHAR(7)    NOT NULL,
    FUNCAO       CHAR(3),
    CONSTRAINT SYS_C006028 PRIMARY KEY (IDVINCULO)
)
;



-- 
-- TABLE: RH_FUNCAOTERCEIRIZADO 
--

CREATE TABLE RH_FUNCAOTERCEIRIZADO(
    IDFUNCAOTERCEIRIZADO    integer    NOT NULL,
    DESCRICAO               varchar(40),
    CONSTRAINT PK_RH_FUNCAOTERCEIRIZADO PRIMARY KEY (IDFUNCAOTERCEIRIZADO)
)
;



-- 
-- TABLE: RH_FUNCIONARIO 
--

CREATE TABLE RH_FUNCIONARIO(
    IDFUNCIONARIO          CHAR(9)         NOT NULL,
    ESCOLARIDADE           integer,
    UFEMPREGOANTERIOR      CHAR(2),
    DATAPRIMEIROEMPREGO    DATE,
    IDPESSOA               integer,
    CONSTRAINT PK_RH_FUNCIONARIO PRIMARY KEY (IDFUNCIONARIO)
)
;



-- 
-- TABLE: RH_GRUPOCARGO 
--

CREATE TABLE RH_GRUPOCARGO(
    IDGRUPOCARGO    integer    NOT NULL,
    DESCRICAO       varchar(40)    NOT NULL,
    CONSTRAINT PK_RH_GRUPOCARGO PRIMARY KEY (IDGRUPOCARGO)
)
;



-- 
-- TABLE: RH_GRUPOLICAFAST 
--

CREATE TABLE RH_GRUPOLICAFAST(
    IDTIPOLICAFAST       integer    NOT NULL,
    IDGRUPOOCORRENCIA    integer    NOT NULL,
    IDOCORRENCIA         integer    NOT NULL,
    CONSTRAINT PK_RH_GRUPOLICAFAST PRIMARY KEY (IDTIPOLICAFAST, IDGRUPOOCORRENCIA, IDOCORRENCIA)
)
;



-- 
-- TABLE: RH_GRUPOOCORRENCIA 
--

CREATE TABLE RH_GRUPOOCORRENCIA(
    IDGRUPOOCORRENCIA    integer    NOT NULL,
    DESCRICAO            varchar(30)    NOT NULL,
    CONSTRAINT PK_RH_GRUPOOCORRENCIA PRIMARY KEY (IDGRUPOOCORRENCIA)
)
;



-- 
-- TABLE: RH_HISTCAPACITACAO 
--

CREATE TABLE RH_HISTCAPACITACAO(
    IDHISTCAPACITACAO     INTEGER    NOT NULL,
    IDFUNCIONARIO         CHAR(9)         NOT NULL,
    IDCURSO               INTEGER,
    IDMODULO              INTEGER,
    DATACAPACITACAO       DATE,
    DATAPROGRESSAO        DATE,
    COMPATIVELCARGO       CHAR(1),
    COMPATIVELAMBIENTE    CHAR(1),
    PRIMARY KEY (IDHISTCAPACITACAO)
)
;


-- 
-- TABLE: RH_HISTFORMACAO 
--

CREATE TABLE RH_HISTFORMACAO(
    IDFUNCIONARIO           CHAR(9)          NOT NULL,
    IDFORMACAO              integer     NOT NULL,
    IDHISTFORMACAO          integer     NOT NULL,
    DATAFIM                 DATE,
    ENTIDADE                varchar(100),
    IDESCOLARIDADEPCCTAE    integer,
    DATAINCENTIVO           DATE,
    DATAATUALIZACAO         DATE,
    NOMECURSO               varchar(100),
    CONSTRAINT PK_RH_HISTFORMACAO PRIMARY KEY (IDHISTFORMACAO)
)
;



-- 
-- TABLE: RH_HISTTITULACAO 
--

CREATE TABLE RH_HISTTITULACAO(
    IDHISTTITULACAO         integer     NOT NULL,
    IDTITULACAO             integer     NOT NULL,
    DATAFIM                 DATE             NOT NULL,
    ENTIDADE                varchar(100),
    TITULOTRABALHOFINAL     varchar(120),
    TIPOTRABALHOFINAL       varchar(20),
    AREACONCENTRACAO        varchar(100),
    IDFUNCIONARIO           CHAR(9)          NOT NULL,
    NOMECURSO               varchar(100),
    IDESCOLARIDADEPCCTAE    integer,
    DATAINCENTIVO           DATE,
    DATAATUALIZACAO         DATE,
    CONSTRAINT PK_RH_HISTTITULACAO PRIMARY KEY (IDHISTTITULACAO)
)
;



-- 
-- TABLE: RH_HISTVANTAGEM 
--

CREATE TABLE RH_HISTVANTAGEM(
    IDVINCULO     CHAR(7)          NOT NULL,
    IDVANTAGEM    varchar(20)     NOT NULL,
    DATAINICIO    DATE             NOT NULL,
    DATAFIM       DATE,
    VALOR1        integer,
    INFO1         varchar(60),
    VALOR2        integer,
    INFO2         varchar(60),
    VALOR3        integer,
    INFO3         varchar(60),
    VALOR4        integer,
    INFO4         varchar(60),
    VALOR5        integer,
    INFO5         varchar(60),
    VALOR6        integer,
    INFO6         varchar(60),
    CONSTRAINT PK_RH_HISTVANTAGEM PRIMARY KEY (IDVINCULO, IDVANTAGEM, DATAINICIO)
)
;



-- 
-- TABLE: RH_IDUNICATEMP 
--

CREATE TABLE RH_IDUNICATEMP(
    IDFUNCIONARIO    CHAR(9),
    IDVINCULO        CHAR(7)
)
;



-- 
-- TABLE: RH_JORNADA 
--

CREATE TABLE RH_JORNADA(
    IDJORNADA    integer    NOT NULL,
    DESCRICAO    varchar(20)    NOT NULL,
    CONSTRAINT PK_RH_JORNADA PRIMARY KEY (IDJORNADA)
)
;



-- 
-- TABLE: RH_LICAFAST 
--

CREATE TABLE RH_LICAFAST(
    IDVINCULO            CHAR(7)          NOT NULL,
    DATAINICIO           DATE             NOT NULL,
    DATAFIM              DATE,
    MOTIVO               varchar(500),
    TIPOLICENCA          varchar(10),
    IDGRUPOOCORRENCIA    integer     NOT NULL,
    IDOCORRENCIA         integer     NOT NULL,
    IDCIDCATEGORIA       CHAR(3),
    IDCIDSUBCATEGORIA    CHAR(4),
    IDPUBLICACAO         integer,
    CONSTRAINT PK_RH_LICAFAST PRIMARY KEY (IDVINCULO, DATAINICIO)
)
;



-- 
-- TABLE: RH_LOCALTERCEIRIZADO 
--

CREATE TABLE RH_LOCALTERCEIRIZADO(
    IDLOCALTERCEIRIZADO    integer    NOT NULL,
    NOME                   varchar(40),
    IDSETOR                integer,
    CONSTRAINT PK_RH_LOCALTERCEIRIZADO PRIMARY KEY (IDLOCALTERCEIRIZADO)
)
;



-- 
-- TABLE: RH_MEMBRO 
--

CREATE TABLE RH_MEMBRO(
    IDMEMBRO        integer     NOT NULL,
    IDVINCULO       CHAR(7)          NOT NULL,
    IDEQUIPE        integer     NOT NULL,
    RESULTMEMBRO    integer,
    IDATIVIDADE     integer,
    ATIVIDADE       varchar(500),
    CONSTRAINT PK_RH_MEMBRO PRIMARY KEY (IDMEMBRO)
)
;



-- 
-- TABLE: RH_META 
--

CREATE TABLE RH_META(
    IDMETA       integer     NOT NULL,
    IDPROADES    integer     NOT NULL,
    PREVISAO     DATE,
    META         varchar(500),
    DEFINIDA     CHAR(1),
    CONSTRAINT PK_RH_META PRIMARY KEY (IDMETA)
)
;



-- 
-- TABLE: RH_NAOHABILITADO 
--

CREATE TABLE RH_NAOHABILITADO(
    IDNAOHABILITADO    integer     NOT NULL,
    IDPROADES          integer     NOT NULL,
    IDVINCULO          CHAR(7)          NOT NULL,
    JUSTIFICATIVA      varchar(300)    NOT NULL,
    CONSTRAINT PK_RH_NAOHABILITADO PRIMARY KEY (IDNAOHABILITADO)
)
;



-- 
-- TABLE: RH_NIVELFUNCAO 
--

CREATE TABLE RH_NIVELFUNCAO(
    IDNIVEL      integer     NOT NULL,
    DESCRICAO    varchar(20)     NOT NULL,
    SIGLA        CHAR(2)          NOT NULL,
    NIVEL        integer     NOT NULL,
    VALOR        integer,
    CONSTRAINT PK_RH_NIVELFUNCAO PRIMARY KEY (IDNIVEL)
)
;



-- 
-- TABLE: RH_OCORRENCIA 
--

CREATE TABLE RH_OCORRENCIA(
    IDGRUPOOCORRENCIA    integer    NOT NULL,
    IDOCORRENCIA         integer    NOT NULL,
    DESCRICAO            varchar(60)    NOT NULL,
    MNEMONICO            CHAR(3),
    PRAZOMAXIMO          integer,
    SEXO                 CHAR(1),
    EXCPGTO              CHAR(1),
    CONSTRAINT PK_RH_OCORRENCIA PRIMARY KEY (IDGRUPOOCORRENCIA, IDOCORRENCIA)
)
;



-- 
-- TABLE: RH_OCORRENCIATERCEIRIZADO 
--

CREATE TABLE RH_OCORRENCIATERCEIRIZADO(
    IDOCORRENCIATERCEIRIZADO    integer    NOT NULL,
    DESCRICAO                   varchar(30),
    CONSTRAINT PK_RH_OCORRENCIATERCEIRIZADO PRIMARY KEY (IDOCORRENCIATERCEIRIZADO)
)
;



-- 
-- TABLE: RH_OCUPACAOFUNCAO 
--

CREATE TABLE RH_OCUPACAOFUNCAO(
    IDOCUPACAOFUNCAO      integer    NOT NULL,
    IDFUNCAO              integer    NOT NULL,
    IDVINCULO             CHAR(7)         NOT NULL,
    DATAINICIO            DATE            NOT NULL,
    DATAFIM               DATE,
    IDPUBLICACAOINICIO    integer,
    IDPUBLICACAOFIM       integer,
    SUBSTITUICAO          CHAR(1),
    CONSTRAINT PK_RH_OCUPACAOFUNCAO PRIMARY KEY (IDOCUPACAOFUNCAO)
)
;



-- 
-- TABLE: RH_OCUPACAOVAGA 
--

CREATE TABLE RH_OCUPACAOVAGA(
    IDVINCULO     CHAR(7)    NOT NULL,
    NUMEROVAGA    CHAR(7)    NOT NULL,
    DATAINICIO    DATE       NOT NULL,
    DATAFIM       DATE,
    CONSTRAINT PK_RH_OCUPACAOVAGA PRIMARY KEY (IDVINCULO, NUMEROVAGA)
)
;



-- 
-- TABLE: RH_ORIGEMVAGA 
--

CREATE TABLE RH_ORIGEMVAGA(
    IDORIGEMVAGA    CHAR(2)         NOT NULL,
    DESCRICAO       varchar(40),
    CONSTRAINT SYS_C0010067 PRIMARY KEY (IDORIGEMVAGA)
)
;



-- 
-- TABLE: RH_PENSIONISTA 
--

CREATE TABLE RH_PENSIONISTA(
    IDPENSIONISTA                CHAR(8)         NOT NULL,
    IDPESSOA                     integer    NOT NULL,
    IDVINCULO                    CHAR(7),
    NUMLEIPENSAO                 varchar(5),
    DATALEIPENSAO                DATE,
    DATAPUBLEIPENSAO             DATE,
    NUMPROCPENSAO                varchar(15),
    DATAEXCLUSAOINSTITUIDOR      DATE,
    ORIGEMPENSAO                 CHAR(1),
    NUMPROCPENSIONISTA           CHAR(15),
    PARENTESCO                   varchar(2),
    UORGCONTROLE                 CHAR(9),
    UORGLOCAL                    CHAR(9),
    BANCOPGTO                    CHAR(3),
    AGENCIAPGTO                  CHAR(6),
    TIPOCONTAPGTO                CHAR(2),
    CONTAPGTO                    varchar(13),
    IDENTCONTAJUDICIAL           varchar(18),
    NUMBENEFINSS                 varchar(10),
    ESPECIEBENEFINSS             varchar(10),
    QTDDEPIR                     integer,
    TIPOPENSAO                   CHAR(2),
    NATUREZAPENSAO               CHAR(1),
    PERCENTPENSAO                varchar(3),
    DATAINICIOPENSAO             DATE,
    DATAFIMPENSAO                DATE,
    IDREPRESENTACAO              integer,
    NUMERADORCOTAPARTE           varchar(2),
    DENOMINADORCOTAPARTE         varchar(2),
    NUMERADORCOTACOMP            varchar(2),
    DENOMINADORCOTACOMP          varchar(2),
    MESINICIOPGTO                integer,
    ANOINICIOPGTO                integer,
    MESSUSPPGTO                  integer,
    ANOSUSPPGTO                  integer,
    IDGRUPOOCORRENCIAEXCLUSAO    integer,
    IDOCORRENCIAEXCLUSAO         integer,
    DATAEXCLUSAO                 DATE,
    CONSTRAINT PK_RH_PENSIONISTA PRIMARY KEY (IDPENSIONISTA)
)
;



-- 
-- TABLE: RH_PERIODOAQUISITIVO 
--

CREATE TABLE RH_PERIODOAQUISITIVO(
    IDVINCULO         CHAR(7)          NOT NULL,
    DATAINICIO        DATE             NOT NULL,
    DATAFIM           DATE,
    TOTALDIAS         integer,
    DIASUSUFRUIDOS    integer,
    FALTAS            integer,
    OBS               varchar(200),
    DATAPRESCRICAO    DATE,
    CONSTRAINT PK_RH_PERIODOAQUISITIVO PRIMARY KEY (IDVINCULO, DATAINICIO)
)
;



-- 
-- TABLE: RH_PRESENTE 
--

CREATE TABLE RH_PRESENTE(
    IDPRESENTE    integer    NOT NULL,
    IDVINCULO     CHAR(7)         NOT NULL,
    IDREUNIAO     integer    NOT NULL,
    CONSTRAINT PK_RH_PRESENTE PRIMARY KEY (IDPRESENTE)
)
;



-- 
-- TABLE: RH_PROADES 
--

CREATE TABLE RH_PROADES(
    IDPROADES        integer      NOT NULL,
    IDSETOR          integer      NOT NULL,
    IDDIRIGENTE      CHAR(7)           NOT NULL,
    DATAINICIO       DATE,
    DATAFIM          DATE,
    NUMPRO           varchar(12),
    MISSAO           varchar(500),
    OBJETIVOS        varchar(1000),
    RESULTPROADES    integer,
    STATUS           integer,
    IDPUBLICACAO     integer,
    NUMPORTDIR       varchar(20),
    DIAPORTDIR       integer,
    MESPORTDIR       integer,
    ANOPORTDIR       integer,
    CONSTRAINT PK_RH_PROADES PRIMARY KEY (IDPROADES)
)
;



-- 
-- TABLE: RH_PROADESCONFIG 
--

CREATE TABLE RH_PROADESCONFIG(
    IDPROADES         integer    NOT NULL,
    PRIMEIRAFASE      CHAR(1),
    SEGUNDAFASE       CHAR(1),
    TERCEIRAFASE      CHAR(1),
    SUBCOORD          CHAR(1),
    PEDIDOSUBCOORD    CHAR(1),
    QUANTSUBCOORD     CHAR(2),
    PROBLEMAEQUIPE    CHAR(1)
)
;



-- 
-- TABLE: RH_PRORROGACAO 
--

CREATE TABLE RH_PRORROGACAO(
    IDVINCULO    CHAR(7)          NOT NULL,
    DATAFIM      DATE             NOT NULL,
    OBS          varchar(200),
    CONSTRAINT PK_RH_PRORROGACAO PRIMARY KEY (IDVINCULO, DATAFIM)
)
;



-- 
-- TABLE: RH_PROVBKP 
--

CREATE TABLE RH_PROVBKP(
    IDVINCULO            CHAR(7)          NOT NULL,
    DATAINICIO           DATE             NOT NULL,
    DATAFIM              DATE,
    EXCEDELOTACAO        CHAR(1)          NOT NULL,
    OBS                  varchar(500),
    REGIMEJURIDICO       CHAR(3),
    IDSITUACAO           integer,
    IDGRUPOCARGO         integer     NOT NULL,
    IDCARGO              integer     NOT NULL,
    IDSETOR              integer     NOT NULL,
    IDCLASSE             integer,
    IDREFERENCIA         integer,
    IDJORNADA            integer,
    IDPUBLICACAO         integer,
    IDGRUPOOCORRENCIA    integer,
    IDOCORRENCIA         integer
)
;



-- 
-- TABLE: RH_PROVIMENTO 
--

CREATE TABLE RH_PROVIMENTO(
    IDVINCULO            CHAR(7)          NOT NULL,
    DATAINICIO           DATE             NOT NULL,
    DATAFIM              DATE,
    EXCEDELOTACAO        CHAR(1)          NOT NULL,
    OBS                  varchar(500),
    REGIMEJURIDICO       CHAR(3),
    IDSITUACAO           integer,
    IDGRUPOCARGO         integer     NOT NULL,
    IDCARGO              integer     NOT NULL,
    IDSETOR              integer     NOT NULL,
    IDCLASSE             integer,
    IDREFERENCIA         integer,
    IDJORNADA            integer,
    IDPUBLICACAO         integer,
    IDGRUPOOCORRENCIA    integer,
    IDOCORRENCIA         integer,
    IDAMBIENTE           integer,
    CONSTRAINT PK_RH_PROVIMENTO PRIMARY KEY (IDVINCULO, DATAINICIO)
)
;



-- 
-- TABLE: RH_PROVIMENTOAUX 
--

CREATE TABLE RH_PROVIMENTOAUX(
    IDVINCULO            CHAR(7)          NOT NULL,
    DATAINICIO           DATE             NOT NULL,
    DATAFIM              DATE,
    EXCEDELOTACAO        CHAR(1)          NOT NULL,
    OBS                  varchar(500),
    REGIMEJURIDICO       CHAR(3),
    IDSITUACAO           integer,
    IDGRUPOCARGO         integer     NOT NULL,
    IDCARGO              integer     NOT NULL,
    IDSETOR              integer     NOT NULL,
    IDCLASSE             integer,
    IDREFERENCIA         integer,
    IDJORNADA            integer,
    IDPUBLICACAO         integer,
    IDGRUPOOCORRENCIA    integer,
    IDOCORRENCIA         integer,
    IDAMBIENTE           integer
)
;



-- 
-- TABLE: RH_PROVTERCEIRIZADO 
--

CREATE TABLE RH_PROVTERCEIRIZADO(
    IDTERCEIRIZADO              integer    NOT NULL,
    DATAINICIO                  DATE            NOT NULL,
    DATAFIM                     DATE,
    IDFUNCAOTERCEIRIZADO        integer,
    IDJORNADA                   integer    NOT NULL,
    IDOCORRENCIATERCEIRIZADO    integer,
    IDINSTITUICAO               CHAR(6)         NOT NULL,
    IDLOCALTERCEIRIZADO         integer,
    IDESCALA                    integer,
    IDCONTRATO                  integer,
    CONSTRAINT PK_RH_PROVTERCEIRIZADO PRIMARY KEY (IDTERCEIRIZADO, DATAINICIO)
)
;



-- 
-- TABLE: RH_PUBLICACAO 
--

CREATE TABLE RH_PUBLICACAO(
    IDPUBLICACAO      integer     NOT NULL,
    DATA              DATE,
    NUMERO            varchar(20),
    AUTORIDADE        varchar(20),
    DATADO            DATE,
    OBS               varchar(500),
    IDDIPLOMALEGAL    integer,
    CONSTRAINT PK_RH_PUBLICACAO PRIMARY KEY (IDPUBLICACAO)
)
;



-- 
-- TABLE: RH_REFERENCIA 
--

CREATE TABLE RH_REFERENCIA(
    IDCLASSE              integer    NOT NULL,
    IDREFERENCIA          integer    NOT NULL,
    NIVELPADRAO           varchar(3),
    IDCLASSEGRUPOCARGO    integer,
    CONSTRAINT PK_RH_REFERENCIA PRIMARY KEY (IDCLASSE, IDREFERENCIA)
)
;



-- 
-- TABLE: RH_REPRESENTACAOPENSAO 
--

CREATE TABLE RH_REPRESENTACAOPENSAO(
    IDREPRESENTACAO    integer    NOT NULL,
    DATAINICIO         DATE            NOT NULL,
    DATAFIM            DATE,
    IDPESSOA           integer    NOT NULL,
    IDVINCULO          CHAR(7),
    IDPENSIONISTA      CHAR(8)         NOT NULL,
    CARTORIO           varchar(50),
    LIVRO              varchar(8),
    FOLHA              varchar(6),
    CONSTRAINT PK_RH_REPRESENTACAOPENSAO PRIMARY KEY (IDREPRESENTACAO)
)
;



-- 
-- TABLE: RH_RESULTADOREUNIAO 
--

CREATE TABLE RH_RESULTADOREUNIAO(
    IDREUNIAO        integer    NOT NULL,
    IDMETA           integer    NOT NULL,
    RESULTREUNIAO    integer,
    CONSTRAINT PK_RH_RESULTADOREUNIAO PRIMARY KEY (IDREUNIAO, IDMETA)
)
;



-- 
-- TABLE: RH_REUNIAO 
--

CREATE TABLE RH_REUNIAO(
    IDREUNIAO        integer    NOT NULL,
    IDPROADES        integer    NOT NULL,
    DATA             DATE,
    LOCAL            varchar(50),
    INICIO           integer,
    TERMINO          integer,
    RESULTREUNIAO    integer,
    NUMERO           integer,
    CONSTRAINT PK_RH_REUNIAO PRIMARY KEY (IDREUNIAO)
)
;



-- 
-- TABLE: RH_REUNIAOANEXO 
--

CREATE TABLE RH_REUNIAOANEXO(
    IDANEXO      integer     NOT NULL,
    IDREUNIAO    integer,
    NOME         varchar(100),
    DESCRICAO    varchar(500),
    TIPO         varchar(30),
    ARQUIVO      OID,
    CONSTRAINT PK_RH_REUNIAOANEXO PRIMARY KEY (IDANEXO)
)
;



-- 
-- TABLE: RH_REUNIAOFATOR 
--

CREATE TABLE RH_REUNIAOFATOR(
    IDREUNIAO        integer     NOT NULL,
    IDFATOR          integer     NOT NULL,
    FATORDIFICULT    varchar(100)    NOT NULL,
    OUTRO            CHAR(1),
    IDMETA           integer,
    CONSTRAINT PK_RH_REUNIAOFATOR PRIMARY KEY (IDFATOR)
)
;



-- 
-- TABLE: RH_SITUACAOFUNCIONAL 
--

CREATE TABLE RH_SITUACAOFUNCIONAL(
    IDSITUACAO        integer    NOT NULL,
    DESCRICAO         varchar(20)    NOT NULL,
    REGIMEJURIDICO    CHAR(3)         NOT NULL,
    CONSTRAINT PK_RH_SITUACAOFUNCIONAL PRIMARY KEY (IDSITUACAO)
)
;



-- 
-- TABLE: RH_SITUACAOOCORRENCIA 
--

CREATE TABLE RH_SITUACAOOCORRENCIA(
    IDSITUACAO           integer    NOT NULL,
    IDGRUPOOCORRENCIA    integer    NOT NULL,
    IDOCORRENCIA         integer    NOT NULL,
    CONSTRAINT PK_RH_SITUACAOOCORRENCIA PRIMARY KEY (IDSITUACAO, IDGRUPOOCORRENCIA, IDOCORRENCIA)
)
;



-- 
-- TABLE: RH_TERCEIRIZADO 
--

CREATE TABLE RH_TERCEIRIZADO(
    IDTERCEIRIZADO    integer    NOT NULL,
    ESCOLARIDADE      varchar(50),
    IDPESSOA          integer    NOT NULL,
    CONSTRAINT PK_RH_TERCEIRIZADO PRIMARY KEY (IDTERCEIRIZADO)
)
;



-- 
-- TABLE: RH_TIPO0 
--

CREATE TABLE RH_TIPO0(
    ANOMES    CHAR(6),
    QUANT     integer
)
;



-- 
-- TABLE: RH_TIPO1 
--

CREATE TABLE RH_TIPO1(
    UNID_PAGADORA      varchar(9),
    SIAPE              varchar(7)     NOT NULL,
    DV_MATRICULA       varchar(1),
    TIPO_REGISTRO      varchar(1),
    SIGLA_UF           varchar(2),
    NOME_SERVIDOR      varchar(60),
    TELEFONE	       varchar(20),
    CPF                varchar(11),
    PIS_PASEP          varchar(11),
    NOME_MAE           varchar(50),
    SEXO               varchar(1),
    DT_NASCIMENTO      varchar(8),
    ESTADO_CIVIL       varchar(1),
    ESCOLARIDADE       varchar(2),
    TITULACAO          varchar(2),
    FILLER1            varchar(5),
    NACIONALIDADE      varchar(1),
    NATURALIDADE       varchar(2),
    PAIS               varchar(3),
    ANO_CHEGADA        varchar(4),
    QUANT_DEP_IR       varchar(2),
    QUANT_DEP_SF       varchar(2),
    DT_PRIM_EMP        varchar(8),
    IDENTIF_ORIGEM     varchar(8),
    END_LOGRADOURO     varchar(40),
    END_NUMERO         varchar(6),
    END_COMPLEMENTO    varchar(21),
    END_BAIRRO         varchar(25),
    END_MUNICIPIO      varchar(30),
    END_CEP            varchar(8),
    END_UF             varchar(2),
    RG_NUMERO          varchar(14),
    RG_ORGAO           varchar(5),
    RG_DT_EMISSAO      varchar(8),
    RG_UF              varchar(2),
    TIT_ELEITOR        varchar(13),
    ANOMES             CHAR(6)         NOT NULL,
    CONSTRAINT PK_RH_TIPO1 PRIMARY KEY (ANOMES, SIAPE)
)
;



-- 
-- TABLE: RH_TIPO2 
--

CREATE TABLE RH_TIPO2(
    UNID_PAGADORA      varchar(9),
    SIAPE              varchar(7)     NOT NULL,
    DV_MATRICULA       varchar(1),
    TIPO_REGISTRO      varchar(1),
    SIGLA_UF           varchar(2),
    REGIME_JURIDICO    varchar(3),
    COD_SITUACAO       varchar(2),
    CART_TRAB_NUM      varchar(6),
    CART_TRAB_SERIE    varchar(5),
    CART_TRAB_UF       varchar(2),
    BANCO              varchar(3),
    AGENCIA            varchar(6),
    CONTA              varchar(13),
    FGTS_DT_OPCAO      varchar(8),
    FGTS_BANCO         varchar(3),
    FGTS_AGENCIA       varchar(6),
    FGTS_CONTA         varchar(13),
    JORNADA_TRAB       varchar(2),
    PERC_TEMPO_SERV    varchar(2),
    DT_CADAST_SERV     varchar(8),
    IND_SUPR_PAGTO     varchar(1),
    DT_SUPR_PAGTO      varchar(6),
    PROPORC_NUMERAD    varchar(2),
    PROPORC_DENOMIN    varchar(2),
    CARGO_GRUPO        varchar(3),
    CARGO_NOME         varchar(3),
    CARGO_CLASSE       varchar(1),
    CARGO_REF_NIVEL    varchar(3),
    CARGO_DT_ENTRAD    varchar(8),
    CARGO_DT_SAIDA     varchar(8),
    FUNCAO_SIGLA       varchar(3),
    FUNCAO_CODNIVEL    varchar(5),
    FUNCAO_ESCOLAR     varchar(2),
    FUNCAO_OPCAO       varchar(1),
    FUNCAO_DT_INGR     varchar(8),
    FUNCAO_DT_SAIDA    varchar(8),
    FUNCAO_UNID_ORG    varchar(9),
    NOV_FC_SIGLA       varchar(3),
    NOV_FC_CODNIVEL    varchar(5),
    NOV_FC_ESCOLAR     varchar(2),
    NOV_FC_OPCAO       varchar(1),
    NOV_FC_DT_INGR     varchar(8),
    NOV_FC_DT_SAIDA    varchar(8),
    NOV_FC_UNID_ORG    varchar(9),
    ATIVID_FUNCAO      varchar(4),
    LOTAC_UNID_ORG     varchar(9),
    LOTAC_UNID_DT      varchar(8),
    LOCAL_ORGAO        varchar(5),
    LOCAL_UNID_ORG     varchar(9),
    ING_ORG_GRUPO      varchar(2),
    ING_ORG_OCOR       varchar(3),
    ING_ORG_DT         varchar(8),
    ING_ORG_DIP_COD    varchar(2),
    ING_ORG_DIP_NUM    varchar(9),
    ING_ORG_DIP_DT     varchar(8),
    ING_SP_GRUPO       varchar(2),
    ING_SP_OCOR        varchar(3),
    ING_SP_DT          varchar(8),
    ING_SP_DIP_COD     varchar(2),
    ING_SP_DIP_NUM     varchar(9),
    ING_SP_DIP_DT      varchar(8),
    EXCLUS_GRUPO       varchar(2),
    EXCLUS_OCOR        varchar(3),
    EXCLUS_DT          varchar(8),
    EXCLUS_DIP_COD     varchar(2),
    EXCLUS_DIP_NUM     varchar(9),
    EXCLUS_DIP_DT      varchar(8),
    AFAST_GRUPO        varchar(2),
    AFAST_OCOR         varchar(3),
    AFAST_DT_INIC      varchar(8),
    AFAST_DT_TERM      varchar(8),
    AFAST_DIP_COD      varchar(2),
    AFAST_DIP_NUM      varchar(9),
    AFAST_DIP_DT       varchar(8),
    INATIV_GRUPO       varchar(2),
    INATIV_OCOR        varchar(3),
    INATIV_DT          varchar(8),
    INATIV_DIP_COD     varchar(2),
    INATIV_DIP_NUM     varchar(9),
    INATIV_DIP_DT      varchar(8),
    APOS_NUM_PROC      varchar(15),
    APOS_ANO_PREV      varchar(4),
    APOS_OPCAO_INT     varchar(1),
    UORG_CONTROLE      varchar(9),
    MOD_FUN_GRUPO      varchar(2),
    MOD_FUN_OCOR       varchar(3),
    MOD_FUN_DT         varchar(8),
    MOD_FUN_DIP_COD    varchar(2),
    MOD_FUN_DIP_NUM    varchar(9),
    MOD_FUN_DIP_DT     varchar(8),
    REG_JUR_ANT        varchar(3),
    SIT_SERV_ANT       varchar(2),
    MUD_ORG_DESTINO    varchar(5),
    MUD_ORG_DT_LIB     varchar(8),
    MUD_ORG_ORIGEM     varchar(5),
    ORGAO_ANTERIOR     varchar(5),
    MATRIC_ANTERIOR    varchar(7),
    COD_ORG_EXTINTO    varchar(5),
    MAT_SERV_EXTINT    varchar(7),
    ORGAO_ATUAL        varchar(5),
    MATRIC_ATUAL       varchar(7),
    MUD_UPAG_CODIGO    varchar(9),
    MUD_UPAG_DT_LIB    varchar(8),
    MUD_UPAG_MOTIVO    varchar(1),
    INDIC_PAG_SERV     varchar(1),
    OBITO_CARTORI0     varchar(50),
    OBITO_LIVRO        varchar(8),
    OBITO_FOLHA        varchar(6),
    OBITO_REGISTRO     varchar(8),
    OBITO_DT           varchar(8),
    IND_EXC_INSTIT     varchar(1),
    DT_EXC_INSTIT      varchar(8),
    VALE_AL_TIPO       varchar(1),
    VALE_AL_DT_INIC    varchar(8),
    VALE_AL_DT_FIM     varchar(8),
    IND_OPER_RAIOX     varchar(1),
    ORGAO_REQUISIT     varchar(5),
    CODIGO_VAGA        varchar(7),
    MES_ANUENIO        varchar(2),
    PERC_OPER_RAIOX    varchar(5),
    POSSE_GRUPO        varchar(2),
    POSSE_OCOR         varchar(3),
    POSSE_DT           varchar(8),
    POSSE_DIP_COD      varchar(2),
    POSSE_DIP_DT       varchar(8),
    POSSE_DIP_NUM      varchar(9),
    REV_ATI_GRUPO      varchar(2),
    REV_ATI_OCOR       varchar(3),
    REV_ATI_DT         varchar(8),
    REV_ATI_DIP_COD    varchar(2),
    REV_ATI_DIP_DT     varchar(8),
    REV_ATI_DIP_NUM    varchar(9),
    ICA_CARGO          varchar(1),
    ICA_FUNCAO         varchar(1),
    ICA_SAL_FAMILIA    varchar(1),
    ICA_ADIC_TEMPO     varchar(1),
    ICA_FGTS           varchar(1),
    ICA_INSS           varchar(1),
    ICA_IR             varchar(1),
    ICA_MARGEM_CONS    varchar(1),
    ICA_CONT_SIND      varchar(1),
    ICA_ADIANT_13      varchar(1),
    ICA_ABATE_TETO     varchar(1),
    ICA_13_SALARIO     varchar(1),
    ICA_PSS_6          varchar(1),
    ICA_FERIAS         varchar(1),
    ICA_PENSAO         varchar(1),
    ICA_BENEFICIOS     varchar(1),
    ICA_IPMF_CPMF      varchar(1),
    ICA_RAIS           varchar(1),
    ICA_DIF_URV        varchar(1),
    ICA_ADIANT         varchar(1),
    ICA_REND_PASEP     varchar(1),
    ANOMES             CHAR(6)         NOT NULL,
    CONSTRAINT PK_RH_TIPO2 PRIMARY KEY (ANOMES, SIAPE)
)
;



-- 
-- TABLE: RH_TIPO3 
--

CREATE TABLE RH_TIPO3(
    UNID_PAGADORA     varchar(9),
    SIAPE             varchar(7),
    DV_MATRICULA      varchar(1),
    TIPO_REGISTRO     varchar(1),
    SIGLA_UF          varchar(2),
    RUB_REND_DESC     varchar(1),
    RUB_CODIGO        varchar(5),
    RUB_SEQUENCIA     varchar(1),
    RUB_VALOR         varchar(11),
    RUB_PRAZO         varchar(3),
    PARAM_PERCENT     varchar(5),
    PARAM_FRAC_NUM    varchar(3),
    PARAM_FRAC_DEN    varchar(3),
    PARAM_ASSUNTO     varchar(2),
    PARAM_NIV_SCN     varchar(1),
    PARAM_NIV_CEMP    varchar(12),
    BENEF_NOME        varchar(40),
    BENEF_BANCO       varchar(3),
    BENEF_AGENCIA     varchar(6),
    BENEF_CONTA       varchar(13),
    BENEF_ANOMES      varchar(6),
    ANOMES            CHAR(6)
)
;



-- 
-- TABLE: RH_TIPO4 
--

CREATE TABLE RH_TIPO4(
    UNID_PAGADORA      varchar(9),
    SIAPE              varchar(7)     NOT NULL,
    DV_MATRICULA       varchar(1),
    TIPO_REGISTRO      varchar(1),
    SIGLA_UF           varchar(2),
    TOTAL_BRUTO        varchar(12),
    TOTAL_DESCONTOS    varchar(12),
    LIQUIDO            varchar(12),
    TOTAL_REG_3        varchar(3),
    ANOMES             CHAR(6)         NOT NULL,
    CONSTRAINT PK_RH_TIPO4 PRIMARY KEY (ANOMES, SIAPE)
)
;



-- 
-- TABLE: RH_TIPOLICAFAST 
--

CREATE TABLE RH_TIPOLICAFAST(
    IDTIPOLICAFAST    integer    NOT NULL,
    TIPOLICAFAST      CHAR(25)        NOT NULL,
    DESCRICAO         varchar(50),
    CONSTRAINT PK_RH_TIPOLICAFAST PRIMARY KEY (IDTIPOLICAFAST)
)
;



-- 
-- TABLE: RH_TITULACAOTEMP 
--

CREATE TABLE RH_TITULACAOTEMP(
    IDVINCULO    CHAR(7)         NOT NULL,
    TITULACAO    varchar(30),
    CONSTRAINT PK_RH_TITULACAOTEMP PRIMARY KEY (IDVINCULO)
)
;



-- 
-- TABLE: RH_VAGA 
--

CREATE TABLE RH_VAGA(
    NUMEROVAGA      CHAR(7)          NOT NULL,
    ORIGEM          CHAR(2),
    DATAINICIO      DATE,
    DATAFIM         DATE,
    OBS             varchar(180),
    IDGRUPOCARGO    integer,
    IDCARGO         integer,
    IDSETOR         integer,
    CONSTRAINT PK_RH_VAGA PRIMARY KEY (NUMEROVAGA)
)
;



-- 
-- TABLE: RH_VANTAGEM 
--

CREATE TABLE RH_VANTAGEM(
    IDVANTAGEM    varchar(20)    NOT NULL,
    DESCRICAO     varchar(60),
    ATIVOS        CHAR(1),
    INATIVOS      CHAR(1),
    MANUAL        CHAR(1),
    FUNCDEP       CHAR(1),
    FALECIDO      CHAR(1),
    CONSTRAINT PK_RH_VANTAGEM PRIMARY KEY (IDVANTAGEM)
)
;



-- 
-- TABLE: RH_VINCULO 
--

CREATE TABLE RH_VINCULO(
    IDVINCULO                    CHAR(7)         NOT NULL,
    DVIDVINCULO                  CHAR(1)         NOT NULL,
    DATAPOSSE                    DATE,
    DATAEXERCICIO                DATE,
    CLASSIFICACAOCONCURSO        integer,
    DATACONCURSO                 DATE,
    DATAFIMCONTRATO              DATE,
    DATAVACANCIA                 DATE,
    SAUALTERNATIVO               varchar(6),
    NUMFUNC                      integer,
    NUMVINCULO                   integer,
    IDPUBLICACAOVACANCIA         integer,
    IDFUNCIONARIO                CHAR(9)         NOT NULL,
    IDGRUPOOCORRENCIAVACANCIA    integer,
    IDOCORRENCIAVACANCIA         integer,
    CONSTRAINT PK_RH_VINCULO PRIMARY KEY (IDVINCULO)
)
;



-- 
-- INDEX: IDX_RH_ADICIONAL1_RH_VI 
--

CREATE INDEX IDX_RH_ADICIONAL1_RH_VI ON RH_ADICIONAL(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_ATIVIDADE1_RH_VI 
--

CREATE INDEX IDX_RH_ATIVIDADE1_RH_VI ON RH_ATIVIDADE(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_AVERBACAO1_RH_VI 
--

CREATE INDEX IDX_RH_AVERBACAO1_RH_VI ON RH_AVERBACAO(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_AVERBFINALIDADE1_RH_AV 
--

CREATE INDEX IDX_RH_AVERBFINALIDADE1_RH_AV ON RH_AVERBFINALIDADE(IDAVERBACAO)
;
-- 
-- INDEX: IDX_RH_CAPACITACAOINSC 
--

CREATE UNIQUE INDEX IDX_RH_CAPACITACAOINSC ON RH_CAPACITACAOINSC(IDMODULO, IDVINCULO)
;
-- 
-- INDEX: IDX_RH_CARGO1_RH_GR 
--

CREATE INDEX IDX_RH_CARGO1_RH_GR ON RH_CARGO(IDGRUPOCARGO)
;
-- 
-- INDEX: IDX_RH_CARGO2_RH_JO 
--

CREATE INDEX IDX_RH_CARGO2_RH_JO ON RH_CARGO(IDJORNADA)
;
-- 
-- INDEX: IDX_RH_CESSAO3_CM_IN 
--

CREATE INDEX IDX_RH_CESSAO3_CM_IN ON RH_CESSAO(IDINSTITUICAO)
;
-- 
-- INDEX: IDX_RH_CESSAO2_RH_OC 
--

CREATE INDEX IDX_RH_CESSAO2_RH_OC ON RH_CESSAO(IDGRUPOOCORRENCIA, IDOCORRENCIA)
;
-- 
-- INDEX: IDX_RH_CESSAO4_RH_PU 
--

CREATE INDEX IDX_RH_CESSAO4_RH_PU ON RH_CESSAO(IDPUBLICACAO)
;
-- 
-- INDEX: IDX_RH_CESSAO1_RH_VI 
--

CREATE INDEX IDX_RH_CESSAO1_RH_VI ON RH_CESSAO(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_CIDSUBCATEGORIA1_RH_CI 
--

CREATE INDEX IDX_RH_CIDSUBCATEGORIA1_RH_CI ON RH_CIDSUBCATEGORIA(IDCIDCATEGORIA)
;
-- 
-- INDEX: IDX_RH_CLASSEGRUPOCARGO1_RH_CL 
--

CREATE INDEX IDX_RH_CLASSEGRUPOCARGO1_RH_CL ON RH_CLASSEGRUPOCARGO(IDCLASSE)
;
-- 
-- INDEX: IDX_RH_CLASSEGRUPOCARGO2_RH_GR 
--

CREATE INDEX IDX_RH_CLASSEGRUPOCARGO2_RH_GR ON RH_CLASSEGRUPOCARGO(IDGRUPOCARGO)
;
-- 
-- INDEX: IDX_RH_DEPENDENCIA1_RH_DE 
--

CREATE INDEX IDX_RH_DEPENDENCIA1_RH_DE ON RH_DEPENDENCIA(IDDEPENDENTE)
;
-- 
-- INDEX: IDX_RH_DEPENDENTE1_CM_PE 
--

CREATE INDEX IDX_RH_DEPENDENTE1_CM_PE ON RH_DEPENDENTE(IDPESSOA)
;
-- 
-- INDEX: IDX_RH_DEPENDENTE2_RH_FU 
--

CREATE INDEX IDX_RH_DEPENDENTE2_RH_FU ON RH_DEPENDENTE(IDFUNCIONARIO)
;
-- 
-- INDEX: IDX_RH_DESAVERBACAO1_RH_AV 
--

CREATE INDEX IDX_RH_DESAVERBACAO1_RH_AV ON RH_DESAVERBACAO(IDAVERBACAO)
;
-- 
-- INDEX: IDX_RH_FERIAS1_RH_PE 
--

CREATE INDEX IDX_RH_FERIAS1_RH_PE ON RH_FERIAS(IDVINCULOPERAQ, DATAINICIOPERAQ)
;
-- 
-- INDEX: IDX_RH_FUNCAO1_RH_PU 
--

CREATE INDEX IDX_RH_FUNCAO1_RH_PU ON RH_FUNCAO(IDPUBLICACAOINICIO)
;
-- 
-- INDEX: IDX_RH_FUNCAO2_RH_PU 
--

CREATE INDEX IDX_RH_FUNCAO2_RH_PU ON RH_FUNCAO(IDPUBLICACAOFIM)
;
-- 
-- INDEX: IDX_RH_FUNCAO3_CM_SE 
--

CREATE INDEX IDX_RH_FUNCAO3_CM_SE ON RH_FUNCAO(IDSETOR)
;
-- 
-- INDEX: IDX_RH_FUNCAO4_RH_NI 
--

CREATE INDEX IDX_RH_FUNCAO4_RH_NI ON RH_FUNCAO(IDNIVEL)
;
-- 
-- INDEX: IDX_RH_FUNCIONARIO1_CM_PE 
--

CREATE INDEX IDX_RH_FUNCIONARIO1_CM_PE ON RH_FUNCIONARIO(IDPESSOA)
;
-- 
-- INDEX: IDX_RH_GRUPOLICAFAST1_RH_OC 
--

CREATE INDEX IDX_RH_GRUPOLICAFAST1_RH_OC ON RH_GRUPOLICAFAST(IDGRUPOOCORRENCIA, IDOCORRENCIA)
;
-- 
-- INDEX: IDX_RH_GRUPOLICAFAST2_RH_TI 
--

CREATE INDEX IDX_RH_GRUPOLICAFAST2_RH_TI ON RH_GRUPOLICAFAST(IDTIPOLICAFAST)
;
-- 
-- INDEX: IDX_RH_HISTCAPACITACAO1_RH_FU 
--

CREATE INDEX IDX_RH_HISTCAPACITACAO1_RH_FU ON RH_HISTCAPACITACAO(IDFUNCIONARIO)
;
-- 
-- INDEX: IDX_RH_HISTFORMACAO1_RH_FO 
--

CREATE INDEX IDX_RH_HISTFORMACAO1_RH_FO ON RH_HISTFORMACAO(IDFORMACAO)
;
-- 
-- INDEX: IDX_RH_HISTFORMACAO2_RH_FU 
--

CREATE INDEX IDX_RH_HISTFORMACAO2_RH_FU ON RH_HISTFORMACAO(IDFUNCIONARIO)
;
-- 
-- INDEX: IDX_RH_HISTTITULACAO1_RH_FU 
--

CREATE INDEX IDX_RH_HISTTITULACAO1_RH_FU ON RH_HISTTITULACAO(IDFUNCIONARIO)
;
-- 
-- INDEX: IDX_RH_HISTVANTAGEM2_RH_VA 
--

CREATE INDEX IDX_RH_HISTVANTAGEM2_RH_VA ON RH_HISTVANTAGEM(IDVANTAGEM)
;
-- 
-- INDEX: IDX_RH_HISTVANTAGEM1_RH_VI 
--

CREATE INDEX IDX_RH_HISTVANTAGEM1_RH_VI ON RH_HISTVANTAGEM(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_LICAFAST3_RH_CI 
--

CREATE INDEX IDX_RH_LICAFAST3_RH_CI ON RH_LICAFAST(IDCIDCATEGORIA, IDCIDSUBCATEGORIA)
;
-- 
-- INDEX: IDX_RH_LICAFAST2_RH_OC 
--

CREATE INDEX IDX_RH_LICAFAST2_RH_OC ON RH_LICAFAST(IDGRUPOOCORRENCIA, IDOCORRENCIA)
;
-- 
-- INDEX: IDX_RH_LICAFAST4_RH_PU 
--

CREATE INDEX IDX_RH_LICAFAST4_RH_PU ON RH_LICAFAST(IDPUBLICACAO)
;
-- 
-- INDEX: IDX_RH_LICAFAST1_RH_VI 
--

CREATE INDEX IDX_RH_LICAFAST1_RH_VI ON RH_LICAFAST(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_OCORRENCIA1_RH_GR 
--

CREATE INDEX IDX_RH_OCORRENCIA1_RH_GR ON RH_OCORRENCIA(IDGRUPOOCORRENCIA)
;
-- 
-- INDEX: IDX_RH_OCUPACAOFUNCAO1_RH_FU 
--

CREATE INDEX IDX_RH_OCUPACAOFUNCAO1_RH_FU ON RH_OCUPACAOFUNCAO(IDFUNCAO)
;
-- 
-- INDEX: IDX_RH_OCUPACAOFUNCAO2_RH_VI 
--

CREATE INDEX IDX_RH_OCUPACAOFUNCAO2_RH_VI ON RH_OCUPACAOFUNCAO(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_OCUPACAOFUNCAO3_RH_PU 
--

CREATE INDEX IDX_RH_OCUPACAOFUNCAO3_RH_PU ON RH_OCUPACAOFUNCAO(IDPUBLICACAOINICIO)
;
-- 
-- INDEX: IDX_RH_OCUPACAOFUNCAO4_RH_PU 
--

CREATE INDEX IDX_RH_OCUPACAOFUNCAO4_RH_PU ON RH_OCUPACAOFUNCAO(IDPUBLICACAOFIM)
;
-- 
-- INDEX: IDX_RH_OCUPACAOVAGA1_RH_VA 
--

CREATE INDEX IDX_RH_OCUPACAOVAGA1_RH_VA ON RH_OCUPACAOVAGA(NUMEROVAGA)
;
-- 
-- INDEX: IDX_RH_OCUPACAOVAGA2_RH_VI 
--

CREATE INDEX IDX_RH_OCUPACAOVAGA2_RH_VI ON RH_OCUPACAOVAGA(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_PENSIONISTA1_CM_PE 
--

CREATE INDEX IDX_RH_PENSIONISTA1_CM_PE ON RH_PENSIONISTA(IDPESSOA)
;
-- 
-- INDEX: IDX_RH_PENSIONISTA2_RH_VI 
--

CREATE INDEX IDX_RH_PENSIONISTA2_RH_VI ON RH_PENSIONISTA(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_PERIODOAQUIS1_RH_VI 
--

CREATE INDEX IDX_RH_PERIODOAQUIS1_RH_VI ON RH_PERIODOAQUISITIVO(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_PRORROGACAO1_RH_VI 
--

CREATE INDEX IDX_RH_PRORROGACAO1_RH_VI ON RH_PRORROGACAO(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_PROVIMENTO4_CM_SE 
--

CREATE INDEX IDX_RH_PROVIMENTO4_CM_SE ON RH_PROVIMENTO(IDSETOR)
;
-- 
-- INDEX: IDX_RH_PROVIMENTO3_RH_CA 
--

CREATE INDEX IDX_RH_PROVIMENTO3_RH_CA ON RH_PROVIMENTO(IDGRUPOCARGO, IDCARGO)
;
-- 
-- INDEX: IDX_RH_PROVIMENTO6_RH_JO 
--

CREATE INDEX IDX_RH_PROVIMENTO6_RH_JO ON RH_PROVIMENTO(IDJORNADA)
;
-- 
-- INDEX: IDX_RH_PROVIMENTO8_RH_OC 
--

CREATE INDEX IDX_RH_PROVIMENTO8_RH_OC ON RH_PROVIMENTO(IDGRUPOOCORRENCIA, IDOCORRENCIA)
;
-- 
-- INDEX: IDX_RH_PROVIMENTO7_RH_PU 
--

CREATE INDEX IDX_RH_PROVIMENTO7_RH_PU ON RH_PROVIMENTO(IDPUBLICACAO)
;
-- 
-- INDEX: IDX_RH_PROVIMENTO5_RH_RE 
--

CREATE INDEX IDX_RH_PROVIMENTO5_RH_RE ON RH_PROVIMENTO(IDCLASSE, IDREFERENCIA)
;
-- 
-- INDEX: IDX_RH_PROVIMENTO2_RH_SI 
--

CREATE INDEX IDX_RH_PROVIMENTO2_RH_SI ON RH_PROVIMENTO(IDSITUACAO)
;
-- 
-- INDEX: IDX_RH_PROVIMENTO1_RH_VI 
--

CREATE INDEX IDX_RH_PROVIMENTO1_RH_VI ON RH_PROVIMENTO(IDVINCULO)
;
-- 
-- INDEX: IDX_RH_PUBLICACAO1_RH_DI 
--

CREATE INDEX IDX_RH_PUBLICACAO1_RH_DI ON RH_PUBLICACAO(IDDIPLOMALEGAL)
;
-- 
-- INDEX: IDX_RH_REFERENCIA1_RH_CL 
--

CREATE INDEX IDX_RH_REFERENCIA1_RH_CL ON RH_REFERENCIA(IDCLASSE)
;
-- 
-- INDEX: IDX_RH_REFERENCIA1_RH_CG 
--

CREATE INDEX IDX_RH_REFERENCIA1_RH_CG ON RH_REFERENCIA(IDCLASSEGRUPOCARGO)
;
-- 
-- INDEX: IDX_RH_SITUACAOOCOR1_RH_O 
--

CREATE INDEX IDX_RH_SITUACAOOCOR1_RH_O ON RH_SITUACAOOCORRENCIA(IDGRUPOOCORRENCIA, IDOCORRENCIA)
;
-- 
-- INDEX: IDX_RH_SITUACAOOCOR2_RH_S 
--

CREATE INDEX IDX_RH_SITUACAOOCOR2_RH_S ON RH_SITUACAOOCORRENCIA(IDSITUACAO)
;
-- 
-- INDEX: IDX_RH_TIPO3 
--

CREATE INDEX IDX_RH_TIPO3 ON RH_TIPO3(ANOMES, SIAPE, RUB_CODIGO)
;
-- 
-- INDEX: IDX_RH_VAGA1_RH_CA 
--

CREATE INDEX IDX_RH_VAGA1_RH_CA ON RH_VAGA(IDGRUPOCARGO, IDCARGO)
;
-- 
-- INDEX: IDX_RH_VINCULO3_RH_FU 
--

CREATE INDEX IDX_RH_VINCULO3_RH_FU ON RH_VINCULO(IDFUNCIONARIO)
;
-- 
-- INDEX: IDX_RH_VINCULO2_RH_PU 
--

CREATE INDEX IDX_RH_VINCULO2_RH_PU ON RH_VINCULO(IDPUBLICACAOVACANCIA)
;
-- 
-- INDEX: IDX_RH_VINCULO5_RH_OC 
--

CREATE INDEX IDX_RH_VINCULO5_RH_OC ON RH_VINCULO(IDGRUPOOCORRENCIAVACANCIA, IDOCORRENCIAVACANCIA)
;

-- 
-- TABLE: RH_ACESSOPROADES 
--

ALTER TABLE RH_ACESSOPROADES ADD CONSTRAINT FK_RH_ACESSOPROADES_CM_USUARIO 
    FOREIGN KEY (IDUSUARIO)
    REFERENCES CM_USUARIO(IDUSUARIO)
;

ALTER TABLE RH_ACESSOPROADES ADD CONSTRAINT FK_RH_ACESSOPROADES_RH_PROADES 
    FOREIGN KEY (IDPROADES)
    REFERENCES RH_PROADES(IDPROADES)
;


-- 
-- TABLE: RH_ADICIONAL 
--

ALTER TABLE RH_ADICIONAL ADD CONSTRAINT FK_RH_ADICIONAL1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO) ON DELETE CASCADE
;


-- 
-- TABLE: RH_ASSUNTO 
--

ALTER TABLE RH_ASSUNTO ADD CONSTRAINT FK_RH_ASSUNTO_RH_REUNIAO 
    FOREIGN KEY (IDREUNIAO)
    REFERENCES RH_REUNIAO(IDREUNIAO)
;


-- 
-- TABLE: RH_ATIVIDADE 
--

ALTER TABLE RH_ATIVIDADE ADD CONSTRAINT FK_RH_ATIVIDADE1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;


-- 
-- TABLE: RH_AUSENTE 
--

ALTER TABLE RH_AUSENTE ADD CONSTRAINT FK_RH_AUSENTE_RH_REUNIAO 
    FOREIGN KEY (IDREUNIAO)
    REFERENCES RH_REUNIAO(IDREUNIAO)
;

ALTER TABLE RH_AUSENTE ADD CONSTRAINT FK_RH_AUSENTE_RH_VINCULO 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;


-- 
-- TABLE: RH_AVERBACAO 
--

ALTER TABLE RH_AVERBACAO ADD CONSTRAINT FK_RH_AVERBACAO1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;


-- 
-- TABLE: RH_AVERBFINALIDADE 
--

ALTER TABLE RH_AVERBFINALIDADE ADD CONSTRAINT FK_RH_AVERBFINALIDADE1_RH_AV 
    FOREIGN KEY (IDAVERBACAO)
    REFERENCES RH_AVERBACAO(IDAVERBACAO) ON DELETE CASCADE
;


-- 
-- TABLE: RH_BASEAPOSENTADORIA 
--

ALTER TABLE RH_BASEAPOSENTADORIA ADD CONSTRAINT FK_RH_BASEAPOSENTADORIA1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO) ON DELETE CASCADE
;


-- 
-- TABLE: RH_CAPACITACAOCOINC 
--

ALTER TABLE RH_CAPACITACAOCOINC ADD CONSTRAINT FK_RH_CAPACITACAOCOINC_1 
    FOREIGN KEY (IDMODULO1)
    REFERENCES RH_CAPACITACAOMODULO(IDMODULO)
;

ALTER TABLE RH_CAPACITACAOCOINC ADD CONSTRAINT FK_RH_CAPACITACAOCOINC_2 
    FOREIGN KEY (IDMODULO2)
    REFERENCES RH_CAPACITACAOMODULO(IDMODULO)
;


-- 
-- TABLE: RH_CAPACITACAOINSC 
--

ALTER TABLE RH_CAPACITACAOINSC ADD CONSTRAINT FK_RH_CAPACITACAOINSC_MODULO 
    FOREIGN KEY (IDMODULO)
    REFERENCES RH_CAPACITACAOMODULO(IDMODULO)
;

ALTER TABLE RH_CAPACITACAOINSC ADD CONSTRAINT FK_RH_CAPACITACAOINSC_VINCULO 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;


-- 
-- TABLE: RH_CARGO 
--

ALTER TABLE RH_CARGO ADD CONSTRAINT FK_RH_CARGO1_RH_GR 
    FOREIGN KEY (IDGRUPOCARGO)
    REFERENCES RH_GRUPOCARGO(IDGRUPOCARGO) ON DELETE CASCADE
;

ALTER TABLE RH_CARGO ADD CONSTRAINT FK_RH_CARGO2_RH_JO 
    FOREIGN KEY (IDJORNADA)
    REFERENCES RH_JORNADA(IDJORNADA)
;


-- 
-- TABLE: RH_CESSAO 
--

ALTER TABLE RH_CESSAO ADD CONSTRAINT FK_RH_CESSAO1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO) ON DELETE CASCADE
;

ALTER TABLE RH_CESSAO ADD CONSTRAINT FK_RH_CESSAO2_RH_OC 
    FOREIGN KEY (IDGRUPOOCORRENCIA, IDOCORRENCIA)
    REFERENCES RH_OCORRENCIA(IDGRUPOOCORRENCIA, IDOCORRENCIA)
;

ALTER TABLE RH_CESSAO ADD CONSTRAINT FK_RH_CESSAO3_CM_IN 
    FOREIGN KEY (IDINSTITUICAO)
    REFERENCES CM_INSTITUICAO(IDINSTITUICAO)
;

ALTER TABLE RH_CESSAO ADD CONSTRAINT FK_RH_CESSAO4_RH_PU 
    FOREIGN KEY (IDPUBLICACAO)
    REFERENCES RH_PUBLICACAO(IDPUBLICACAO)
;


-- 
-- TABLE: RH_CIDSUBCATEGORIA 
--

ALTER TABLE RH_CIDSUBCATEGORIA ADD CONSTRAINT FK_RH_CIDSUBCATEGORIA1_RH_CI 
    FOREIGN KEY (IDCIDCATEGORIA)
    REFERENCES RH_CIDCATEGORIA(IDCIDCATEGORIA) ON DELETE CASCADE
;


-- 
-- TABLE: RH_CLASSEGRUPOCARGO 
--

ALTER TABLE RH_CLASSEGRUPOCARGO ADD CONSTRAINT FK_RH_CLASSEGRUPOCARGO1_RH_CL 
    FOREIGN KEY (IDCLASSE)
    REFERENCES RH_CLASSE(IDCLASSE)
;

ALTER TABLE RH_CLASSEGRUPOCARGO ADD CONSTRAINT FK_RH_CLASSEGRUPOCARGO2_RH_GR 
    FOREIGN KEY (IDGRUPOCARGO)
    REFERENCES RH_GRUPOCARGO(IDGRUPOCARGO)
;


-- 
-- TABLE: RH_CONTRATO 
--

ALTER TABLE RH_CONTRATO ADD CONSTRAINT FK_RH_CONTRATO0_CM_IN 
    FOREIGN KEY (IDINSTITUICAO)
    REFERENCES CM_INSTITUICAO(IDINSTITUICAO)
;

ALTER TABLE RH_CONTRATO ADD CONSTRAINT FK_RH_CONTRATO1_CM_SE 
    FOREIGN KEY (IDSETOR)
    REFERENCES CM_SETOR(IDSETOR)
;


-- 
-- TABLE: RH_CONTRATOPROVTERCEIRIZADO 
--

ALTER TABLE RH_CONTRATOPROVTERCEIRIZADO ADD CONSTRAINT FK_RH_CONPROVTER_AD_CONTRATO 
    FOREIGN KEY (IDCONTRATO)
    REFERENCES AD_CONTRATO(IDCONTRATO)
;

ALTER TABLE RH_CONTRATOPROVTERCEIRIZADO ADD CONSTRAINT FK_RH_CONPROVTER_RH_PROTER 
    FOREIGN KEY (IDTERCEIRIZADO, DATAINICIO)
    REFERENCES RH_PROVTERCEIRIZADO(IDTERCEIRIZADO, DATAINICIO)
;


-- 
-- TABLE: RH_DECISAO 
--

ALTER TABLE RH_DECISAO ADD CONSTRAINT FK_RH_DECISAO_RH_REUNIAO 
    FOREIGN KEY (IDREUNIAO)
    REFERENCES RH_REUNIAO(IDREUNIAO)
;


-- 
-- TABLE: RH_DEPENDENCIA 
--

ALTER TABLE RH_DEPENDENCIA ADD CONSTRAINT FK_RH_DEPENDENCIA1_RH_DE 
    FOREIGN KEY (IDDEPENDENTE)
    REFERENCES RH_DEPENDENTE(IDDEPENDENTE) ON DELETE CASCADE
;


-- 
-- TABLE: RH_DEPENDENTE 
--

ALTER TABLE RH_DEPENDENTE ADD CONSTRAINT FK_RH_DEPENDENTE1_CM_PE 
    FOREIGN KEY (IDPESSOA)
    REFERENCES CM_PESSOA(IDPESSOA)
;

ALTER TABLE RH_DEPENDENTE ADD CONSTRAINT FK_RH_DEPENDENTE2_RH_FU 
    FOREIGN KEY (IDFUNCIONARIO)
    REFERENCES RH_FUNCIONARIO(IDFUNCIONARIO)
;


-- 
-- TABLE: RH_DESAVERBACAO 
--

ALTER TABLE RH_DESAVERBACAO ADD CONSTRAINT FK_RH_DESAVERBACAO1_RH_AV 
    FOREIGN KEY (IDAVERBACAO)
    REFERENCES RH_AVERBACAO(IDAVERBACAO)
;


-- 
-- TABLE: RH_EQUIPE 
--

ALTER TABLE RH_EQUIPE ADD CONSTRAINT FK_RH_EQUIPE_RH_PROADES 
    FOREIGN KEY (IDPROADES)
    REFERENCES RH_PROADES(IDPROADES)
;


-- 
-- TABLE: RH_FERIAS 
--

ALTER TABLE RH_FERIAS ADD CONSTRAINT FK_RH_FERIAS1_RH_PE 
    FOREIGN KEY (IDVINCULOPERAQ, DATAINICIOPERAQ)
    REFERENCES RH_PERIODOAQUISITIVO(IDVINCULO, DATAINICIO)
;


-- 
-- TABLE: RH_FUNCAO 
--

ALTER TABLE RH_FUNCAO ADD CONSTRAINT FK_RH_FUNCAO1_RH_PU 
    FOREIGN KEY (IDPUBLICACAOINICIO)
    REFERENCES RH_PUBLICACAO(IDPUBLICACAO)
;

ALTER TABLE RH_FUNCAO ADD CONSTRAINT FK_RH_FUNCAO2_RH_PU 
    FOREIGN KEY (IDPUBLICACAOFIM)
    REFERENCES RH_PUBLICACAO(IDPUBLICACAO)
;

ALTER TABLE RH_FUNCAO ADD CONSTRAINT FK_RH_FUNCAO3_CM_SE 
    FOREIGN KEY (IDSETOR)
    REFERENCES CM_SETOR(IDSETOR)
;

ALTER TABLE RH_FUNCAO ADD CONSTRAINT FK_RH_FUNCAO4_RH_NI 
    FOREIGN KEY (IDNIVEL)
    REFERENCES RH_NIVELFUNCAO(IDNIVEL)
;

ALTER TABLE RH_FUNCAO ADD CONSTRAINT FK_RH_FUNCAO5_RH_CA 
    FOREIGN KEY (IDCARGOCONFIANCA)
    REFERENCES RH_CARGOCONFIANCA(IDCARGOCONFIANCA)
;

ALTER TABLE RH_FUNCAO ADD CONSTRAINT FK_RH_FUNCAO6_GA_CU 
    FOREIGN KEY (IDCURSO)
    REFERENCES GA_CURSO(CURSO)
;


-- 
-- TABLE: RH_FUNCAOATUAL 
--

ALTER TABLE RH_FUNCAOATUAL ADD CONSTRAINT FK_RH_FUNCAOATUAL1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;


-- 
-- TABLE: RH_FUNCIONARIO 
--

ALTER TABLE RH_FUNCIONARIO ADD CONSTRAINT FK_RH_FUNCIONARIO1_CM_PE 
    FOREIGN KEY (IDPESSOA)
    REFERENCES CM_PESSOA(IDPESSOA)
;


-- 
-- TABLE: RH_GRUPOLICAFAST 
--

ALTER TABLE RH_GRUPOLICAFAST ADD CONSTRAINT FK_RH_GRUPOLICAFAST1_RH_OC 
    FOREIGN KEY (IDGRUPOOCORRENCIA, IDOCORRENCIA)
    REFERENCES RH_OCORRENCIA(IDGRUPOOCORRENCIA, IDOCORRENCIA)
;

ALTER TABLE RH_GRUPOLICAFAST ADD CONSTRAINT FK_RH_GRUPOLICAFAST2_RH_TI 
    FOREIGN KEY (IDTIPOLICAFAST)
    REFERENCES RH_TIPOLICAFAST(IDTIPOLICAFAST) ON DELETE CASCADE
;


-- 
-- TABLE: RH_HISTCAPACITACAO 
--

ALTER TABLE RH_HISTCAPACITACAO ADD CONSTRAINT FK_RH_HISTCAPACITACAO1_RH_FU 
    FOREIGN KEY (IDFUNCIONARIO)
    REFERENCES RH_FUNCIONARIO(IDFUNCIONARIO)
;

ALTER TABLE RH_HISTCAPACITACAO ADD CONSTRAINT SYS_C0010242 
    FOREIGN KEY (IDCURSO)
    REFERENCES RH_CAPACITACAOCURSO(IDCURSO)
;

ALTER TABLE RH_HISTCAPACITACAO ADD CONSTRAINT SYS_C0010243 
    FOREIGN KEY (IDMODULO)
    REFERENCES RH_CAPACITACAOMODULO(IDMODULO)
;


-- 
-- TABLE: RH_HISTFORMACAO 
--

ALTER TABLE RH_HISTFORMACAO ADD CONSTRAINT FK_RH_HISTFORMACAO1_RH_FO 
    FOREIGN KEY (IDFORMACAO)
    REFERENCES RH_FORMACAO(IDFORMACAO) ON DELETE CASCADE
;

ALTER TABLE RH_HISTFORMACAO ADD CONSTRAINT FK_RH_HISTFORMACAO2_RH_FU 
    FOREIGN KEY (IDFUNCIONARIO)
    REFERENCES RH_FUNCIONARIO(IDFUNCIONARIO) ON DELETE CASCADE
;

ALTER TABLE RH_HISTFORMACAO ADD CONSTRAINT SYS_C009962 
    FOREIGN KEY (IDESCOLARIDADEPCCTAE)
    REFERENCES RH_ESCOLARIDADEPCCTAE(IDESCOLARIDADEPCCTAE)
;


-- 
-- TABLE: RH_HISTTITULACAO 
--

ALTER TABLE RH_HISTTITULACAO ADD CONSTRAINT FK_RH_HISTTITULACAO1_RH_FU 
    FOREIGN KEY (IDFUNCIONARIO)
    REFERENCES RH_FUNCIONARIO(IDFUNCIONARIO)
;


-- 
-- TABLE: RH_HISTVANTAGEM 
--

ALTER TABLE RH_HISTVANTAGEM ADD CONSTRAINT FK_RH_HISTVANTAGEM1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO) ON DELETE CASCADE
;

ALTER TABLE RH_HISTVANTAGEM ADD CONSTRAINT FK_RH_HISTVANTAGEM2_RH_VA 
    FOREIGN KEY (IDVANTAGEM)
    REFERENCES RH_VANTAGEM(IDVANTAGEM) ON DELETE CASCADE
;


-- 
-- TABLE: RH_LICAFAST 
--

ALTER TABLE RH_LICAFAST ADD CONSTRAINT FK_RH_LICAFAST1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO) ON DELETE CASCADE
;

ALTER TABLE RH_LICAFAST ADD CONSTRAINT FK_RH_LICAFAST2_RH_OC 
    FOREIGN KEY (IDGRUPOOCORRENCIA, IDOCORRENCIA)
    REFERENCES RH_OCORRENCIA(IDGRUPOOCORRENCIA, IDOCORRENCIA)
;

ALTER TABLE RH_LICAFAST ADD CONSTRAINT FK_RH_LICAFAST3_RH_CI 
    FOREIGN KEY (IDCIDCATEGORIA, IDCIDSUBCATEGORIA)
    REFERENCES RH_CIDSUBCATEGORIA(IDCIDCATEGORIA, IDCIDSUBCATEGORIA)
;

ALTER TABLE RH_LICAFAST ADD CONSTRAINT FK_RH_LICAFAST4_RH_PU 
    FOREIGN KEY (IDPUBLICACAO)
    REFERENCES RH_PUBLICACAO(IDPUBLICACAO)
;


-- 
-- TABLE: RH_LOCALTERCEIRIZADO 
--

ALTER TABLE RH_LOCALTERCEIRIZADO ADD CONSTRAINT FK_RH_LOCALTERCEIRIZADO1_CM_SE 
    FOREIGN KEY (IDSETOR)
    REFERENCES CM_SETOR(IDSETOR)
;


-- 
-- TABLE: RH_MEMBRO 
--

ALTER TABLE RH_MEMBRO ADD CONSTRAINT FK_RH_MEMBRO_RH_EQUIPE 
    FOREIGN KEY (IDEQUIPE)
    REFERENCES RH_EQUIPE(IDEQUIPE)
;

ALTER TABLE RH_MEMBRO ADD CONSTRAINT FK_RH_MEMBRO_RH_VINCULO 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;


-- 
-- TABLE: RH_META 
--

ALTER TABLE RH_META ADD CONSTRAINT FK_RH_META_RH_PROADES 
    FOREIGN KEY (IDPROADES)
    REFERENCES RH_PROADES(IDPROADES)
;


-- 
-- TABLE: RH_NAOHABILITADO 
--

ALTER TABLE RH_NAOHABILITADO ADD CONSTRAINT FK_RH_NAOHABILITADO_RH_PROADES 
    FOREIGN KEY (IDPROADES)
    REFERENCES RH_PROADES(IDPROADES)
;

ALTER TABLE RH_NAOHABILITADO ADD CONSTRAINT FK_RH_NAOHABILITADO_RH_VINCULO 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;


-- 
-- TABLE: RH_OCORRENCIA 
--

ALTER TABLE RH_OCORRENCIA ADD CONSTRAINT FK_RH_OCORRENCIA1_RH_GR 
    FOREIGN KEY (IDGRUPOOCORRENCIA)
    REFERENCES RH_GRUPOOCORRENCIA(IDGRUPOOCORRENCIA) ON DELETE CASCADE
;


-- 
-- TABLE: RH_OCUPACAOFUNCAO 
--

ALTER TABLE RH_OCUPACAOFUNCAO ADD CONSTRAINT FK_RH_OCUPACAOFUNCAO1_RH_FU 
    FOREIGN KEY (IDFUNCAO)
    REFERENCES RH_FUNCAO(IDFUNCAO)
;

ALTER TABLE RH_OCUPACAOFUNCAO ADD CONSTRAINT FK_RH_OCUPACAOFUNCAO2_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;

ALTER TABLE RH_OCUPACAOFUNCAO ADD CONSTRAINT FK_RH_OCUPACAOFUNCAO3_RH_PU 
    FOREIGN KEY (IDPUBLICACAOINICIO)
    REFERENCES RH_PUBLICACAO(IDPUBLICACAO)
;

ALTER TABLE RH_OCUPACAOFUNCAO ADD CONSTRAINT FK_RH_OCUPACAOFUNCAO4_RH_PU 
    FOREIGN KEY (IDPUBLICACAOFIM)
    REFERENCES RH_PUBLICACAO(IDPUBLICACAO)
;


-- 
-- TABLE: RH_OCUPACAOVAGA 
--

ALTER TABLE RH_OCUPACAOVAGA ADD CONSTRAINT FK_RH_OCUPACAOVAGA1_RH_VA 
    FOREIGN KEY (NUMEROVAGA)
    REFERENCES RH_VAGA(NUMEROVAGA) ON DELETE CASCADE
;

ALTER TABLE RH_OCUPACAOVAGA ADD CONSTRAINT FK_RH_OCUPACAOVAGA2_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO) ON DELETE CASCADE
;


-- 
-- TABLE: RH_PENSIONISTA 
--

ALTER TABLE RH_PENSIONISTA ADD CONSTRAINT FK_RH_PENSIONISTA1_CM_PE 
    FOREIGN KEY (IDPESSOA)
    REFERENCES CM_PESSOA(IDPESSOA)
;

ALTER TABLE RH_PENSIONISTA ADD CONSTRAINT FK_RH_PENSIONISTA2_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;


-- 
-- TABLE: RH_PERIODOAQUISITIVO 
--

ALTER TABLE RH_PERIODOAQUISITIVO ADD CONSTRAINT FK_RH_PERIODOAQUISITIVO1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO) ON DELETE CASCADE
;


-- 
-- TABLE: RH_PRESENTE 
--

ALTER TABLE RH_PRESENTE ADD CONSTRAINT FK_RH_PRESENTE_RH_REUNIAO 
    FOREIGN KEY (IDREUNIAO)
    REFERENCES RH_REUNIAO(IDREUNIAO)
;

ALTER TABLE RH_PRESENTE ADD CONSTRAINT FK_RH_PRESENTE_RH_VINCULO 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;


-- 
-- TABLE: RH_PROADES 
--

ALTER TABLE RH_PROADES ADD CONSTRAINT FK_RH_PROADES_CM_SETOR 
    FOREIGN KEY (IDSETOR)
    REFERENCES CM_SETOR(IDSETOR)
;


-- 
-- TABLE: RH_PRORROGACAO 
--

ALTER TABLE RH_PRORROGACAO ADD CONSTRAINT FK_RH_PRORROGACAO1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO) ON DELETE CASCADE
;


-- 
-- TABLE: RH_PROVIMENTO 
--

ALTER TABLE RH_PROVIMENTO ADD CONSTRAINT FK_RH_PROVIMENTO1_RH_AM 
    FOREIGN KEY (IDAMBIENTE)
    REFERENCES RH_AMBIENTE(IDAMBIENTE)
;

ALTER TABLE RH_PROVIMENTO ADD CONSTRAINT FK_RH_PROVIMENTO1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;

ALTER TABLE RH_PROVIMENTO ADD CONSTRAINT FK_RH_PROVIMENTO2_RH_SI 
    FOREIGN KEY (IDSITUACAO)
    REFERENCES RH_SITUACAOFUNCIONAL(IDSITUACAO)
;

ALTER TABLE RH_PROVIMENTO ADD CONSTRAINT FK_RH_PROVIMENTO3_RH_CA 
    FOREIGN KEY (IDGRUPOCARGO, IDCARGO)
    REFERENCES RH_CARGO(IDGRUPOCARGO, IDCARGO)
;

ALTER TABLE RH_PROVIMENTO ADD CONSTRAINT FK_RH_PROVIMENTO4_CM_SE 
    FOREIGN KEY (IDSETOR)
    REFERENCES CM_SETOR(IDSETOR)
;

ALTER TABLE RH_PROVIMENTO ADD CONSTRAINT FK_RH_PROVIMENTO5_RH_RE 
    FOREIGN KEY (IDCLASSE, IDREFERENCIA)
    REFERENCES RH_REFERENCIA(IDCLASSE, IDREFERENCIA)
;

ALTER TABLE RH_PROVIMENTO ADD CONSTRAINT FK_RH_PROVIMENTO6_RH_JO 
    FOREIGN KEY (IDJORNADA)
    REFERENCES RH_JORNADA(IDJORNADA)
;

ALTER TABLE RH_PROVIMENTO ADD CONSTRAINT FK_RH_PROVIMENTO7_RH_PU 
    FOREIGN KEY (IDPUBLICACAO)
    REFERENCES RH_PUBLICACAO(IDPUBLICACAO)
;

ALTER TABLE RH_PROVIMENTO ADD CONSTRAINT FK_RH_PROVIMENTO8_RH_OC 
    FOREIGN KEY (IDGRUPOOCORRENCIA, IDOCORRENCIA)
    REFERENCES RH_OCORRENCIA(IDGRUPOOCORRENCIA, IDOCORRENCIA)
;


-- 
-- TABLE: RH_PROVTERCEIRIZADO 
--

ALTER TABLE RH_PROVTERCEIRIZADO ADD CONSTRAINT FK_RH_PROVTERCEIRIZADO1_CM_IN 
    FOREIGN KEY (IDINSTITUICAO)
    REFERENCES CM_INSTITUICAO(IDINSTITUICAO)
;

ALTER TABLE RH_PROVTERCEIRIZADO ADD CONSTRAINT FK_RH_PROVTERCEIRIZADO1_RH_LO 
    FOREIGN KEY (IDLOCALTERCEIRIZADO)
    REFERENCES RH_LOCALTERCEIRIZADO(IDLOCALTERCEIRIZADO)
;

ALTER TABLE RH_PROVTERCEIRIZADO ADD CONSTRAINT FK_RH_PROVTERCEIRIZADO1_RH_OC 
    FOREIGN KEY (IDOCORRENCIATERCEIRIZADO)
    REFERENCES RH_OCORRENCIATERCEIRIZADO(IDOCORRENCIATERCEIRIZADO)
;

ALTER TABLE RH_PROVTERCEIRIZADO ADD CONSTRAINT FK_RH_PROVTERCEIRIZADO1_RH_TE 
    FOREIGN KEY (IDTERCEIRIZADO)
    REFERENCES RH_TERCEIRIZADO(IDTERCEIRIZADO)
;

ALTER TABLE RH_PROVTERCEIRIZADO ADD CONSTRAINT FK_RH_PROVTERCEIRIZADO2_RH_FU 
    FOREIGN KEY (IDFUNCAOTERCEIRIZADO)
    REFERENCES RH_FUNCAOTERCEIRIZADO(IDFUNCAOTERCEIRIZADO)
;

ALTER TABLE RH_PROVTERCEIRIZADO ADD CONSTRAINT FK_RH_PROVTERCEIRIZADO4_RH_JO 
    FOREIGN KEY (IDJORNADA)
    REFERENCES RH_JORNADA(IDJORNADA)
;

ALTER TABLE RH_PROVTERCEIRIZADO ADD CONSTRAINT SYS_C009268 
    FOREIGN KEY (IDESCALA)
    REFERENCES RH_ESCALA(IDESCALA)
;

ALTER TABLE RH_PROVTERCEIRIZADO ADD CONSTRAINT SYS_C009783 
    FOREIGN KEY (IDCONTRATO)
    REFERENCES RH_CONTRATO(IDCONTRATO)
;


-- 
-- TABLE: RH_PUBLICACAO 
--

ALTER TABLE RH_PUBLICACAO ADD CONSTRAINT FK_RH_PUBLICACAO1_RH_DI 
    FOREIGN KEY (IDDIPLOMALEGAL)
    REFERENCES RH_DIPLOMALEGAL(IDDIPLOMALEGAL)
;


-- 
-- TABLE: RH_REFERENCIA 
--

ALTER TABLE RH_REFERENCIA ADD CONSTRAINT FK_RH_REFERENCIA1_RH_CG 
    FOREIGN KEY (IDCLASSEGRUPOCARGO)
    REFERENCES RH_CLASSEGRUPOCARGO(IDCLASSEGRUPOCARGO)
;

ALTER TABLE RH_REFERENCIA ADD CONSTRAINT FK_RH_REFERENCIA1_RH_CL 
    FOREIGN KEY (IDCLASSE)
    REFERENCES RH_CLASSE(IDCLASSE) ON DELETE CASCADE
;


-- 
-- TABLE: RH_REPRESENTACAOPENSAO 
--

ALTER TABLE RH_REPRESENTACAOPENSAO ADD CONSTRAINT FK_RH_REPPENSAO1_CM_PE 
    FOREIGN KEY (IDPESSOA)
    REFERENCES CM_PESSOA(IDPESSOA)
;

ALTER TABLE RH_REPRESENTACAOPENSAO ADD CONSTRAINT FK_RH_REPPENSAO2_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;

ALTER TABLE RH_REPRESENTACAOPENSAO ADD CONSTRAINT FK_RH_REPPENSAO3_RH_PE 
    FOREIGN KEY (IDPENSIONISTA)
    REFERENCES RH_PENSIONISTA(IDPENSIONISTA)
;


-- 
-- TABLE: RH_RESULTADOREUNIAO 
--

ALTER TABLE RH_RESULTADOREUNIAO ADD CONSTRAINT FK_RH_RESULTADOREUNIAO_RH_META 
    FOREIGN KEY (IDMETA)
    REFERENCES RH_META(IDMETA)
;

ALTER TABLE RH_RESULTADOREUNIAO ADD CONSTRAINT FK_RH_RESULTREUNIAO_RH_REUNIAO 
    FOREIGN KEY (IDREUNIAO)
    REFERENCES RH_REUNIAO(IDREUNIAO)
;


-- 
-- TABLE: RH_REUNIAOANEXO 
--

ALTER TABLE RH_REUNIAOANEXO ADD CONSTRAINT FK_RH_REUNIAOANEXO 
    FOREIGN KEY (IDREUNIAO)
    REFERENCES RH_REUNIAO(IDREUNIAO)
;


-- 
-- TABLE: RH_REUNIAOFATOR 
--

ALTER TABLE RH_REUNIAOFATOR ADD CONSTRAINT FK_RH_REUNIAOFATOR_RH_META 
    FOREIGN KEY (IDMETA)
    REFERENCES RH_META(IDMETA)
;

ALTER TABLE RH_REUNIAOFATOR ADD CONSTRAINT FK_RH_REUNIAOFATOR_RH_REUNIAO 
    FOREIGN KEY (IDREUNIAO)
    REFERENCES RH_REUNIAO(IDREUNIAO)
;


-- 
-- TABLE: RH_SITUACAOOCORRENCIA 
--

ALTER TABLE RH_SITUACAOOCORRENCIA ADD CONSTRAINT FK_RH_SITUACAOOCORRENCIA1_RH_O 
    FOREIGN KEY (IDGRUPOOCORRENCIA, IDOCORRENCIA)
    REFERENCES RH_OCORRENCIA(IDGRUPOOCORRENCIA, IDOCORRENCIA) ON DELETE CASCADE
;

ALTER TABLE RH_SITUACAOOCORRENCIA ADD CONSTRAINT FK_RH_SITUACAOOCORRENCIA2_RH_S 
    FOREIGN KEY (IDSITUACAO)
    REFERENCES RH_SITUACAOFUNCIONAL(IDSITUACAO)
;


-- 
-- TABLE: RH_TERCEIRIZADO 
--

ALTER TABLE RH_TERCEIRIZADO ADD CONSTRAINT FK_RH_TERCEIRIZADO1_CM_PE 
    FOREIGN KEY (IDPESSOA)
    REFERENCES CM_PESSOA(IDPESSOA)
;


-- 
-- TABLE: RH_VAGA 
--

ALTER TABLE RH_VAGA ADD CONSTRAINT FK_RH_VAGA1_RH_CA 
    FOREIGN KEY (IDGRUPOCARGO, IDCARGO)
    REFERENCES RH_CARGO(IDGRUPOCARGO, IDCARGO)
;

ALTER TABLE RH_VAGA ADD CONSTRAINT FK_RH_VAGA3_CM_SE 
    FOREIGN KEY (IDSETOR)
    REFERENCES CM_SETOR(IDSETOR)
;


-- 
-- TABLE: RH_VINCULO 
--

ALTER TABLE RH_VINCULO ADD CONSTRAINT FK_RH_VINCULO2_RH_PU 
    FOREIGN KEY (IDPUBLICACAOVACANCIA)
    REFERENCES RH_PUBLICACAO(IDPUBLICACAO)
;

ALTER TABLE RH_VINCULO ADD CONSTRAINT FK_RH_VINCULO3_RH_FU 
    FOREIGN KEY (IDFUNCIONARIO)
    REFERENCES RH_FUNCIONARIO(IDFUNCIONARIO)
;

ALTER TABLE RH_VINCULO ADD CONSTRAINT FK_RH_VINCULO4_RH_OC 
    FOREIGN KEY (IDGRUPOOCORRENCIAVACANCIA, IDOCORRENCIAVACANCIA)
    REFERENCES RH_OCORRENCIA(IDGRUPOOCORRENCIA, IDOCORRENCIA)
;


-- 
-- TABLE: AD_FUNCIONARIORESP 
--

ALTER TABLE AD_FUNCIONARIORESP ADD CONSTRAINT FK_AD_FUNCIONARIORESP1_RH_FU 
    FOREIGN KEY (IDFUNC)
    REFERENCES RH_FUNCIONARIO(IDFUNCIONARIO)
;

-- 
-- TABLE: AD_ITEMREQDIARIA 
--

ALTER TABLE AD_ITEMREQDIARIA ADD CONSTRAINT FK_AD_ITEMREQDIARIA1_RH_VI 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;

ALTER TABLE AD_ITEMREQDIARIA ADD CONSTRAINT FK_AD_ITEMREQDIARIA2_RH_VI 
    FOREIGN KEY (IDVINCULOPROP)
    REFERENCES RH_VINCULO(IDVINCULO)
;

ALTER TABLE AD_ITEMREQDIARIA ADD CONSTRAINT FK_AD_ITEMREQDIARIA5_RH_VI 
    FOREIGN KEY (IDVINCULOCHEFE)
    REFERENCES RH_VINCULO(IDVINCULO)
;


-- 
-- TABLE: GA_DEPARTAMENTO 
--

ALTER TABLE GA_DEPARTAMENTO ADD CONSTRAINT FK_GA_DEPARTAMENTO1_CM_SE 
    FOREIGN KEY (IDSETOR)
    REFERENCES CM_SETOR(IDSETOR)
;

ALTER TABLE GA_DEPARTAMENTO ADD CONSTRAINT FK_GA_DEPARTAMENTO1_RH_VI 
    FOREIGN KEY (IDCHEFEDEPTO)
    REFERENCES RH_VINCULO(IDVINCULO)
;

-- 
-- TABLE: GA_ESTAGIO 
--

ALTER TABLE GA_ESTAGIO ADD CONSTRAINT FK_GA_ESTAGIO1_RH_VI 
    FOREIGN KEY (IDVINCULOSUP)
    REFERENCES RH_VINCULO(IDVINCULO)
;



-- 
-- TABLE: RH_HISTORICO 
--

ALTER TABLE RH_HISTORICO ADD CONSTRAINT FK_RH_HISTORICO_1 
    FOREIGN KEY (idvinculo)
    REFERENCES RH_VINCULO(idvinculo)
;

    
-- 
-- TABLE: RH_HISTINCENTIVO
--

ALTER TABLE RH_HISTINCENTIVO ADD CONSTRAINT FK_RH_HISTINCENTIVO_1 
    FOREIGN KEY (idhistformacao)
    REFERENCES RH_HISTFORMACAO(idhistformacao)
;

-- 
-- TABLE: RH_HISTINCENTIVO
--

ALTER TABLE RH_HISTINCENTIVO ADD CONSTRAINT FK_RH_HISTINCENTIVO_2
    FOREIGN KEY (IDHISTTITULACAO)
    REFERENCES RH_HISTTITULACAO(IDHISTTITULACAO)
;
   
-- 
-- TABLE: RH_HISTINCENTIVO
--

ALTER TABLE RH_HISTINCENTIVO ADD CONSTRAINT FK_RH_HISTINCENTIVO_3 
    FOREIGN KEY (IDPERCQUALIFICACAO)
    REFERENCES RH_PERCQUALIFICACAO(IDPERCQUALIFICACAO)
;

-- 
-- TABLE: RH_HISTINCENTIVO
--

ALTER TABLE RH_HISTINCENTIVO ADD CONSTRAINT FK_RH_HISTINCENTIVO_4 
    FOREIGN KEY (IDVINCULO)
    REFERENCES RH_VINCULO(IDVINCULO)
;    

-- 
-- TABLE: RH_PERCQUALIFICACAO
--

ALTER TABLE RH_PERCQUALIFICACAO ADD CONSTRAINT FK_RH_PERCQUALIFICACAO_1 
    FOREIGN KEY (idescolaridadepcctae)
    REFERENCES RH_escolaridadepcctae(idescolaridadepcctae)
;      

