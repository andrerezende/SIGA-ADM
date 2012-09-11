--
-- PostgreSQL database dump
--

-- Started on 2008-09-22 16:15:28 BRT

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 3095 (class 1262 OID 88939)
-- Name: dbsiga; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE dbsiga WITH TEMPLATE = template0 ENCODING = 'UTF8';


\connect dbsiga

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1895 (class 1259 OID 88940)
-- Dependencies: 3
-- Name: ad_acessobolsa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_acessobolsa (
    idusuario integer NOT NULL,
    idbolsa character(3) NOT NULL
);


--
-- TOC entry 1896 (class 1259 OID 88943)
-- Dependencies: 3
-- Name: ad_acessouoreq; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_acessouoreq (
    idusuario integer NOT NULL,
    iduo integer NOT NULL
);


--
-- TOC entry 1897 (class 1259 OID 88946)
-- Dependencies: 3
-- Name: ad_andamento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_andamento (
    numpro character varying(12) NOT NULL,
    numanda integer NOT NULL,
    stampentr character varying(12),
    stampsai character varying(12),
    stampdesp character varying(12),
    inativo character varying(1),
    setor character varying(15),
    setordest character varying(15),
    despacho character varying(400),
    autor character varying(40)
);


--
-- TOC entry 1898 (class 1259 OID 88952)
-- Dependencies: 3
-- Name: ad_bolsa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_bolsa (
    idbolsa character(3) NOT NULL,
    descricao character varying(30),
    acumulavel character(1),
    paga character(1),
    fontepag character varying(40)
);


--
-- TOC entry 1899 (class 1259 OID 88955)
-- Dependencies: 3
-- Name: ad_bolsista; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_bolsista (
    idbolsista integer NOT NULL,
    datainclusao character(10),
    dataexclusao character(10),
    horasprevistas integer,
    dataalt character(10),
    idbolsa character(3),
    idpessoa integer
);


--
-- TOC entry 1900 (class 1259 OID 88958)
-- Dependencies: 3
-- Name: ad_catmat; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_catmat (
    codmaterial integer NOT NULL,
    nomematerial character varying(80),
    grupomaterial integer,
    nomegrupomaterial character varying(80),
    classematerial integer,
    nomeclassematerial character varying(80)
);


--
-- TOC entry 1901 (class 1259 OID 88961)
-- Dependencies: 3
-- Name: ad_classificador; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_classificador (
    idclassificador character varying(7) NOT NULL,
    descricao character varying(50)
);


--
-- TOC entry 1902 (class 1259 OID 88964)
-- Dependencies: 3
-- Name: ad_controle; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_controle (
    travapag character(1),
    anoref character(4)
);


--
-- TOC entry 1903 (class 1259 OID 88967)
-- Dependencies: 3
-- Name: ad_controleprot; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_controleprot (
    anopro integer NOT NULL,
    lastnumproc integer,
    lastnumprot integer
);


--
-- TOC entry 1904 (class 1259 OID 88970)
-- Dependencies: 3
-- Name: ad_dependencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_dependencia (
    iddependencia integer NOT NULL,
    idsetor integer,
    dependencia character varying(50)
);


--
-- TOC entry 1905 (class 1259 OID 88973)
-- Dependencies: 3
-- Name: ad_diaria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_diaria (
    categoriadiaria character(1) NOT NULL,
    categoriafunc character(3) NOT NULL,
    diaria numeric(10,2),
    meiadiaria numeric(10,2),
    dataini date NOT NULL,
    datafim date
);


--
-- TOC entry 1906 (class 1259 OID 88976)
-- Dependencies: 3
-- Name: ad_elemento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_elemento (
    idelemento character(6) NOT NULL,
    descricao character varying(60)
);


--
-- TOC entry 1907 (class 1259 OID 88979)
-- Dependencies: 3
-- Name: ad_empenhado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_empenhado (
    idempenhado integer NOT NULL,
    valoremp numeric(12,2),
    quantidadeemp numeric(8,2),
    idempenho integer NOT NULL,
    idlicitacao integer NOT NULL,
    item integer NOT NULL,
    dataorcamento date,
    status character(1),
    idorcamento integer NOT NULL,
    valoranulado numeric(12,2),
    dataanulacao date,
    motivoanulacao character varying(100),
    quantidadeanulada integer,
    numeroanulacao character varying(10)
);


--
-- TOC entry 1908 (class 1259 OID 88982)
-- Dependencies: 3
-- Name: ad_empenhadodist; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_empenhadodist (
    idempenhado integer NOT NULL,
    idrequisicao integer NOT NULL,
    valorunitario numeric(12,2),
    quantidade integer
);


--
-- TOC entry 1909 (class 1259 OID 88985)
-- Dependencies: 3
-- Name: ad_empenho; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_empenho (
    idempenho integer NOT NULL,
    numero character(12),
    dataempenho date,
    tipoempenho character(2),
    tipoentrega character(1),
    idfornecedor integer,
    status character(1),
    dataanulacao date,
    motivoanulacao character(1),
    modalidadeemp character(1),
    idempenhoref integer,
    numpro character varying(12),
    obs character varying(200),
    iduo integer
);


--
-- TOC entry 1910 (class 1259 OID 88988)
-- Dependencies: 3
-- Name: ad_empresapassagem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_empresapassagem (
    idempresapassagem integer NOT NULL,
    nome character varying(30),
    ativo character(1)
);


--
-- TOC entry 1911 (class 1259 OID 88991)
-- Dependencies: 3
-- Name: ad_estoque; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_estoque (
    idmaterial integer NOT NULL,
    estoquemin integer,
    estoque integer,
    valortotal numeric(14,4),
    localizacao character varying(50),
    iduo integer NOT NULL
);


--
-- TOC entry 1912 (class 1259 OID 88994)
-- Dependencies: 3
-- Name: ad_executa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_executa (
    idtiporeq integer NOT NULL,
    iduo integer NOT NULL,
    idrubrica character(20),
    ano character(4) NOT NULL
);


--
-- TOC entry 1913 (class 1259 OID 88997)
-- Dependencies: 3
-- Name: ad_executor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_executor (
    iduo integer NOT NULL,
    idusuario integer NOT NULL,
    datainicio date NOT NULL,
    datafim date
);


--
-- TOC entry 1914 (class 1259 OID 89000)
-- Dependencies: 3
-- Name: ad_executoralmox; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_executoralmox (
    idexecutoralmox integer NOT NULL,
    iduorequisitante integer NOT NULL,
    iduoexecutante integer NOT NULL
);


--
-- TOC entry 1915 (class 1259 OID 89003)
-- Dependencies: 3
-- Name: ad_executorservint; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_executorservint (
    idexecutorservint integer NOT NULL,
    idtiposervint integer,
    idusuario integer,
    datainicio date,
    datafim date
);


--
-- TOC entry 1916 (class 1259 OID 89006)
-- Dependencies: 3
-- Name: ad_fonte; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_fonte (
    idfonte character(10) NOT NULL,
    descricao character varying(50)
);


--
-- TOC entry 1917 (class 1259 OID 89009)
-- Dependencies: 3
-- Name: ad_fornecedor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_fornecedor (
    idfornecedor integer NOT NULL,
    contacorrente character varying(10),
    idinstituicao character(4),
    idpessoa integer,
    idbanco character(3),
    idagenc character(7)
);


--
-- TOC entry 1918 (class 1259 OID 89012)
-- Dependencies: 3
-- Name: ad_fpotencial; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_fpotencial (
    idmaterial integer NOT NULL,
    idfornecedor integer NOT NULL
);


--
-- TOC entry 1919 (class 1259 OID 89015)
-- Dependencies: 3
-- Name: ad_funcionarioresp; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_funcionarioresp (
    idfunc character(9) NOT NULL,
    idsetor integer NOT NULL,
    dataini date NOT NULL,
    datafim date
);


--
-- TOC entry 1920 (class 1259 OID 89018)
-- Dependencies: 3
-- Name: ad_gestor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_gestor (
    iduo integer NOT NULL,
    idusuario integer NOT NULL,
    datainicio date NOT NULL,
    datafim date
);


--
-- TOC entry 1921 (class 1259 OID 89021)
-- Dependencies: 3
-- Name: ad_hotel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_hotel (
    idhotel integer NOT NULL,
    nome character varying(30),
    ativo character(1) NOT NULL,
    valordiaria numeric(10,2)
);


--
-- TOC entry 1922 (class 1259 OID 89024)
-- Dependencies: 3
-- Name: ad_itemlicitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemlicitacao (
    idlicitacao integer NOT NULL,
    item integer NOT NULL,
    valor numeric(12,2),
    justificativa character varying(200),
    excecao character(1),
    quantidadelicitada integer
);


--
-- TOC entry 1923 (class 1259 OID 89027)
-- Dependencies: 3
-- Name: ad_itemnota; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemnota (
    iditemnota integer NOT NULL,
    idempenhado integer,
    idnotafiscal integer,
    quantitemnota numeric(8,2),
    valoritemnota numeric(12,2)
);


--
-- TOC entry 1924 (class 1259 OID 89030)
-- Dependencies: 3
-- Name: ad_itempatrimo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itempatrimo (
    idpatrimo integer NOT NULL,
    descricaoad character varying(60),
    datapatrimo date,
    empenho integer,
    tipoingresso character(1),
    tipoutilizacao character(1),
    estadoitem character(1),
    idmaterial integer,
    idsetor integer NOT NULL
);


--
-- TOC entry 1925 (class 1259 OID 89033)
-- Dependencies: 3
-- Name: ad_itempatrimonio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itempatrimonio (
    iditempatrimonio integer NOT NULL,
    descricao character varying(500),
    tipoingresso character(1),
    dataaquisicao date,
    marcamodelo character varying(50),
    valor numeric(12,2),
    notafiscal character varying(16),
    subelemento character(2),
    idmaterial integer,
    idempenhado integer,
    idclassificador character varying(7),
    numpro character varying(12),
    ativo character(1),
    iddependencia integer,
    idsetor integer NOT NULL,
    numeroserie character varying(15),
    numeroempenho character(12)
);


--
-- TOC entry 1926 (class 1259 OID 89039)
-- Dependencies: 3
-- Name: ad_itemreq; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreq (
    idrequisicao integer NOT NULL,
    idmaterial integer NOT NULL,
    quantpedida numeric(8,2),
    precoestimado numeric(12,2),
    quantautorizada numeric(8,2),
    status character(1),
    idlicitacao integer,
    item integer,
    prioridade character(1),
    descricaodetalhada character varying(500),
    valorreal numeric(12,2),
    motivorejeicao character varying(255),
    quantentregue numeric(8,2),
    quantempenhada integer,
    quantdevolvida integer
);


--
-- TOC entry 1828 (class 1259 OID 36951)
-- Dependencies: 5
-- Name: ad_itemreqbib; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqbib (
    idrequisicao integer NOT NULL,
    idmaterial integer NOT NULL,
    quantpedida numeric(8,2),
    precoestimado numeric(12,2),
    status character(1),
    idlicitacao integer,
    item integer,
    valorreal numeric(12,2),
    motivorejeicao character varying(255),
    quantentregue numeric(8,2),
    quantempenhada integer,
    quantdevolvida integer,
    titulo character varying(350),
    autor character varying(200),
    edicao character varying(30),
    localpublicacao character varying(200),
    editora character varying(120),
    datapublicacao character varying(30),
    subtitulo character varying(250),
    descfisica character varying(80),
    volume character varying(15)
);



--
-- TOC entry 1927 (class 1259 OID 89047)
-- Dependencies: 3
-- Name: ad_itemreqdiaria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqdiaria (
    idrequisicao integer NOT NULL,
    idvinculo character(7) NOT NULL,
    categoriafunc character(3),
    situacaofunc character(1),
    motivo character varying(200),
    datasaida date,
    dataretorno date,
    meiotransportediaria character(1),
    justdianaoutil character varying(200),
    valorest numeric(10,2),
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    ordembancaria character varying(16),
    dataordembancaria date,
    diariasconcedidas numeric(10,2),
    tiporeqdiaria character(1),
    idrequisicaooriginal integer,
    idvinculoprop character(7),
    idvinculochefe character(7),
    numpro character varying(12),
    passagemaerea character(1),
    bilhete character varying(20),
    idrequisicaoveiculo integer,
    nacional character(1)
);


--
-- TOC entry 1928 (class 1259 OID 89053)
-- Dependencies: 3
-- Name: ad_itemreqhotel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqhotel (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    motivo character varying(200),
    datahoraentprev date,
    datahorasaidaprev date,
    numerodiaria numeric(2,1),
    valorest numeric(10,2),
    datahoraent date,
    datahorasaida date,
    notafiscal character varying(16),
    datanotafiscal date,
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    idempenho integer,
    idhotelpref integer,
    informacoes character varying(200)
);


--
-- TOC entry 1929 (class 1259 OID 89059)
-- Dependencies: 3
-- Name: ad_itemreqpassagem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqpassagem (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    tipotransporte character(1),
    motivo character varying(200),
    valorest numeric(10,2),
    bilhete character varying(20),
    notafiscal character varying(16),
    datanotafiscal date,
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    idempenho integer,
    idmunicipioorigem character(5) NOT NULL,
    idmunicipiodestino character(5) NOT NULL,
    datahorapassagem date,
    classe character(1),
    idempresapassagem integer,
    email character varying(100),
    codigolocalizador character varying(10)
);


--
-- TOC entry 1930 (class 1259 OID 89065)
-- Dependencies: 3
-- Name: ad_itemreqrestaurante; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqrestaurante (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    motivo character varying(200),
    valorest numeric(10,2),
    notafiscal character varying(200),
    datanotafiscal date,
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    idempenho integer,
    idpessoaacompanhante integer,
    idrestaurantepref integer,
    datainicio date,
    datafim date,
    numeroalmocos integer,
    numerojantares integer
);


--
-- TOC entry 1931 (class 1259 OID 89071)
-- Dependencies: 3
-- Name: ad_itemreqservext; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqservext (
    idrequisicao integer NOT NULL,
    idservico integer NOT NULL,
    complemento character varying(1500),
    quantidade numeric(8,2),
    valorest numeric(12,2),
    valorreal numeric(12,2),
    idlicitacao integer,
    item integer,
    prioridade character(1),
    status character(1),
    unidade character varying(10),
    descricaodetalhada character varying(500),
    quantempenhada integer,
    quantentregue integer,
    quantdevolvida integer
);


--
-- TOC entry 1932 (class 1259 OID 89077)
-- Dependencies: 3
-- Name: ad_itemreqservint; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqservint (
    idrequisicao integer NOT NULL,
    idtiposervint integer NOT NULL,
    procedimento character varying(400),
    quantidade integer,
    unidade character varying(12),
    urgente character(1),
    motivourgencia character varying(200),
    dataprevisao date,
    dataconclusao date,
    valorreal numeric(12,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200)
);


--
-- TOC entry 1933 (class 1259 OID 89083)
-- Dependencies: 3
-- Name: ad_itemreqservpf; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqservpf (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    descricaoservico character varying(200),
    valorreal numeric(10,2),
    irrf numeric(10,2),
    inssprestador numeric(10,2),
    insscontratante numeric(10,2),
    datapagamento date,
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    idempenho integer
);


--
-- TOC entry 1934 (class 1259 OID 89089)
-- Dependencies: 3
-- Name: ad_itemreqveiculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqveiculo (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    tipotransporte character(1),
    enderecoorig character varying(100),
    bairroorig character varying(50),
    ceporig character varying(8),
    referenciaorig character varying(150),
    datahorasaidaorig timestamp with time zone,
    enderecodest character varying(100),
    bairrodest character varying(50),
    cepdest character varying(8),
    referenciadest character varying(150),
    prevdatahorachegdest timestamp with time zone,
    justificativa character varying(200),
    quilometragemest integer,
    valorest numeric(10,2),
    datahoraautexec timestamp with time zone,
    datahorasaidagar timestamp with time zone,
    datahoracheggar timestamp with time zone,
    odometrosaida integer,
    odometrocheg integer,
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character(1),
    obs character varying(200),
    placa character(7),
    idmotorista integer,
    idmunicipiodestino character(5) NOT NULL,
    idmunicipioorigem character(5) NOT NULL,
    tipoveiculo character(1),
    prevdatahoraretorno timestamp with time zone,
    outrospassageiros character varying(300)
);


--
-- TOC entry 1935 (class 1259 OID 89095)
-- Dependencies: 3
-- Name: ad_lancamentoint; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_lancamentoint (
    idlancamentoint integer NOT NULL,
    tipolancamento character(1),
    ano character(4),
    data date,
    valor numeric(18,2),
    obs character varying(200),
    iduoreq integer,
    iduoexec integer,
    idrubrica character(11),
    idrequisicao integer,
    idusuario integer,
    idlicitacao integer,
    item integer
);


--
-- TOC entry 1936 (class 1259 OID 89098)
-- Dependencies: 3
-- Name: ad_licitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_licitacao (
    idlicitacao integer NOT NULL,
    numero character varying(15),
    dataabertura date,
    datacriacao date,
    status character(1),
    pregao character(1),
    numpro character varying(12),
    idmodalidadelicitacao integer,
    imediato character(1),
    datahomologacao date,
    idtipolicitacao character(1),
    obs character varying(1000),
    validade character varying(20),
    tipoentrega character(1)
);


--
-- TOC entry 1937 (class 1259 OID 89104)
-- Dependencies: 3
-- Name: ad_liquidacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_liquidacao (
    idliquidacao integer NOT NULL,
    dataliquidacao date,
    valor numeric(12,2),
    obs character varying(200),
    pago character(1),
    valorirrf numeric(12,2),
    valorinss numeric(12,2),
    valoriss numeric(12,2)
);


--
-- TOC entry 1938 (class 1259 OID 89107)
-- Dependencies: 3
-- Name: ad_localidadediaria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_localidadediaria (
    idlocalidadediaria integer NOT NULL,
    quantdiarias numeric(5,1),
    idmunicipio character(5) NOT NULL,
    idrequisicao integer NOT NULL,
    idvinculo character(7) NOT NULL
);


--
-- TOC entry 1939 (class 1259 OID 89110)
-- Dependencies: 3
-- Name: ad_mapalicitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_mapalicitacao (
    idlicitacao integer NOT NULL,
    item integer NOT NULL,
    preco numeric(11,2),
    vencedor character(1),
    quantidade numeric(8,2),
    importado character(1),
    status character(1),
    idfornecedor integer NOT NULL,
    marcamodelo character varying(50)
);


--
-- TOC entry 1940 (class 1259 OID 89113)
-- Dependencies: 3
-- Name: ad_material; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_material (
    idmaterial integer NOT NULL,
    descricao character varying(810),
    unidade character varying(10),
    permcons character(1),
    estocavel character(1),
    codmaterial character(14) NOT NULL,
    idelemento character(6),
    idsubelemento character(2),
    ativo character(1),
    precoestimado numeric(12,2)
);


--
-- TOC entry 1941 (class 1259 OID 89119)
-- Dependencies: 3
-- Name: ad_modalidadelicitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_modalidadelicitacao (
    idmodalidadelicitacao integer NOT NULL,
    descricao character varying(30),
    valorinicial numeric(12,2),
    valorfinal numeric(12,2)
);


--
-- TOC entry 1942 (class 1259 OID 89122)
-- Dependencies: 3
-- Name: ad_motorista; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_motorista (
    idmotorista integer NOT NULL,
    carteirahab character varying(15),
    datavalidade date,
    categoria character(1),
    ativo character(1),
    idpessoa integer NOT NULL
);


--
-- TOC entry 1943 (class 1259 OID 89125)
-- Dependencies: 3
-- Name: ad_movimento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_movimento (
    idmovimento integer NOT NULL,
    tipomovimento character(1),
    datamov date,
    quantidade numeric(8,2),
    valortotal numeric(12,2),
    idordement integer,
    idrequisicao integer,
    idmaterial integer,
    iditemnota integer,
    idmovimentoref integer,
    iduoalmox integer
);


--
-- TOC entry 1944 (class 1259 OID 89128)
-- Dependencies: 3
-- Name: ad_movimentopat; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_movimentopat (
    idmovimentacao integer NOT NULL,
    tipomovimento character(1),
    motivobaixa character(1),
    numerotermo character varying(10),
    iditempatrimonio integer NOT NULL,
    idsetororigem integer NOT NULL,
    idsetordestino integer NOT NULL,
    data date,
    iddependenciaorigem integer,
    iddependenciadestino integer,
    numeroprocesso character(12)
);


--
-- TOC entry 1945 (class 1259 OID 89131)
-- Dependencies: 2407 2408 3
-- Name: ad_movimentoserv; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_movimentoserv (
    idmovimentoserv integer NOT NULL,
    tipomovimento character varying(20),
    datamov date,
    quantidade integer DEFAULT 0,
    valortotal numeric(12,0) DEFAULT 0,
    idrequisicao integer,
    iditemnota integer,
    idmovimentoservref integer
);


--
-- TOC entry 1946 (class 1259 OID 89136)
-- Dependencies: 3
-- Name: ad_notafiscal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_notafiscal (
    idnotafiscal integer NOT NULL,
    notafiscal character varying(16),
    datanotafiscal date,
    valor numeric(12,2),
    idliquidacao integer,
    idempenho integer,
    dataateste date,
    obs character varying(200),
    valordesconto numeric(12,2)
);


--
-- TOC entry 1947 (class 1259 OID 89139)
-- Dependencies: 2409 3
-- Name: ad_novomaterial; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_novomaterial (
    descricao character varying(500),
    iduoreq integer,
    status character(1),
    idnovomaterial integer NOT NULL,
    codmaterial integer,
    idusuario integer,
    aplicacao character varying(200),
    descricaodetalhada character varying(500),
    telefone character varying(20),
    datapedido date,
    ativo character(1) DEFAULT 'S'::bpchar
);


--
-- TOC entry 1948 (class 1259 OID 89146)
-- Dependencies: 2410 2411 2412 2413 2414 3
-- Name: ad_orcamento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_orcamento (
    idorcamento integer NOT NULL,
    ano character(4) NOT NULL,
    dotacao numeric(20,2) DEFAULT (0)::numeric,
    suplementacao numeric(20,2) DEFAULT (0)::numeric,
    bloqueio numeric(20,2) DEFAULT (0)::numeric,
    anulacao numeric(20,2) DEFAULT (0)::numeric,
    pago numeric(20,2) DEFAULT (0)::numeric,
    idptr character(7) NOT NULL,
    idfonte character(10) NOT NULL,
    idrubrica character(11) NOT NULL,
    esfera character(1)
);


--
-- TOC entry 1949 (class 1259 OID 89154)
-- Dependencies: 3
-- Name: ad_orcamentohist; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_orcamentohist (
    idorcamento integer NOT NULL,
    data date NOT NULL,
    tipoorc character(1) NOT NULL,
    valor numeric(18,2)
);


--
-- TOC entry 1950 (class 1259 OID 89157)
-- Dependencies: 3
-- Name: ad_orcamentointerno; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_orcamentointerno (
    iduo integer NOT NULL,
    idrubrica character(11) NOT NULL,
    ano character(4) NOT NULL,
    credito numeric(18,2),
    debito numeric(18,2),
    previsaodebito numeric(18,2),
    creditoexecutante numeric(18,2)
);


--
-- TOC entry 1951 (class 1259 OID 89160)
-- Dependencies: 3
-- Name: ad_ordembancaria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_ordembancaria (
    idordembancaria integer NOT NULL,
    numeroordembancaria character varying(16),
    dataordembancaria date,
    valor numeric(12,2),
    idliquidacao integer NOT NULL,
    darf character varying(12),
    gps character varying(12),
    datagps date
);


--
-- TOC entry 1952 (class 1259 OID 89163)
-- Dependencies: 3
-- Name: ad_ordentrega; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_ordentrega (
    idordement integer NOT NULL,
    dataordent date,
    numeroordem integer,
    iduoexec integer,
    impresso character(1)
);


--
-- TOC entry 1953 (class 1259 OID 89167)
-- Dependencies: 3
-- Name: ad_pagbolsa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_pagbolsa (
    idbolsista integer NOT NULL,
    mesano character(7) NOT NULL,
    valor numeric(15,2),
    horastrabalhadas integer,
    folha integer NOT NULL
);


--
-- TOC entry 1954 (class 1259 OID 89170)
-- Dependencies: 3
-- Name: ad_paiempenho; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_paiempenho (
    idempenhopai integer NOT NULL,
    idempenho integer NOT NULL,
    tipofilho character(1)
);


--
-- TOC entry 1955 (class 1259 OID 89173)
-- Dependencies: 3
-- Name: ad_participante; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_participante (
    idlicitacao integer NOT NULL,
    idfornecedor integer NOT NULL
);


--
-- TOC entry 1956 (class 1259 OID 89176)
-- Dependencies: 3
-- Name: ad_processo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_processo (
    numpro character varying(12) NOT NULL,
    stampaber character varying(12),
    instit integer,
    cxarq character varying(7),
    setororig character varying(15),
    tipo character varying(1),
    interes character varying(80),
    titulo character varying(80),
    assunto character varying(240)
);


--
-- TOC entry 1957 (class 1259 OID 89179)
-- Dependencies: 3
-- Name: ad_ptr; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_ptr (
    idptr character(7) NOT NULL,
    descricao character varying(50),
    progtrab character varying(17) NOT NULL,
    uorcamento character(5)
);


--
-- TOC entry 1958 (class 1259 OID 89182)
-- Dependencies: 3
-- Name: ad_reqrubrica; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_reqrubrica (
    idrubrica character(11) NOT NULL,
    idtiporeq integer NOT NULL
);


--
-- TOC entry 1959 (class 1259 OID 89185)
-- Dependencies: 3
-- Name: ad_requisicao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_requisicao (
    idrequisicao integer NOT NULL,
    datahorareq timestamp with time zone,
    datahoraautreq timestamp with time zone,
    status character(1) NOT NULL,
    motivorejeicao character varying(200),
    iduoreq integer NOT NULL,
    iduoexec integer NOT NULL,
    idusuarioreq integer,
    conceito character(1),
    obs character varying(200),
    idusuariogestor integer,
    coditemfinanciavel character(2),
    localentrega character varying(100),
    datahoraexecucao timestamp with time zone,
    datahoraavaliacao timestamp with time zone,
    suplementar character varying(50),
    tiporequisicao integer,
    justificativa character varying(200)
);


--
-- TOC entry 1960 (class 1259 OID 89191)
-- Dependencies: 3
-- Name: ad_requisita; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_requisita (
    idtiporeq integer NOT NULL,
    iduo integer NOT NULL,
    idrubrica character(11),
    ano character(4) NOT NULL,
    ativo character(1)
);


--
-- TOC entry 1961 (class 1259 OID 89194)
-- Dependencies: 3
-- Name: ad_restaurante; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_restaurante (
    idrestaurante integer NOT NULL,
    nome character varying(30),
    ativo character(1),
    valorrefeicao numeric(10,2)
);


--
-- TOC entry 1962 (class 1259 OID 89197)
-- Dependencies: 3
-- Name: ad_retencao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_retencao (
    numpro character varying(12) NOT NULL,
    setor character varying(15),
    setordest character varying(15),
    stampentr character varying(12),
    stampsai character varying(12),
    stampdesp character varying(12),
    inativo character varying(1),
    numanda integer
);


--
-- TOC entry 1963 (class 1259 OID 89200)
-- Dependencies: 3
-- Name: ad_rubrica; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_rubrica (
    idrubrica character(11) NOT NULL,
    descricao character varying(100)
);


--
-- TOC entry 1964 (class 1259 OID 89203)
-- Dependencies: 3
-- Name: ad_saldolic; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_saldolic (
    modalidadelic character(1),
    numerolic character varying(15) NOT NULL,
    item integer NOT NULL,
    idmaterial integer,
    qtde numeric(8,2),
    valor numeric(12,2),
    idfornecedor integer,
    descricaodetalhada character varying(500),
    idservico integer,
    iduoreq integer,
    autoria character(4)
);


--
-- TOC entry 1965 (class 1259 OID 89209)
-- Dependencies: 3
-- Name: ad_servico; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_servico (
    idservico integer NOT NULL,
    codservico integer,
    descricao character varying(200),
    idelemento character(6),
    idsubelemento character(2),
    ativo character(1)
);


--
-- TOC entry 1966 (class 1259 OID 89212)
-- Dependencies: 3
-- Name: ad_setoracesso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_setoracesso (
    setor character varying(15) NOT NULL,
    setorfilho character varying(15) NOT NULL
);


--
-- TOC entry 1967 (class 1259 OID 89215)
-- Dependencies: 3
-- Name: ad_solicitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_solicitacao (
    idlicitacao integer NOT NULL,
    item integer NOT NULL,
    data date NOT NULL,
    quantidade numeric(8,2),
    status character(1),
    numero character varying(10)
);


--
-- TOC entry 1968 (class 1259 OID 89218)
-- Dependencies: 3
-- Name: ad_sompal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_sompal (
    som character(4),
    numpro character varying(12)
);


--
-- TOC entry 1969 (class 1259 OID 89221)
-- Dependencies: 3
-- Name: ad_subelemento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_subelemento (
    idelemento character(6) NOT NULL,
    idsubelemento character(2) NOT NULL,
    descricao character varying(100)
);


--
-- TOC entry 1970 (class 1259 OID 89224)
-- Dependencies: 3
-- Name: ad_suplementacaoitem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_suplementacaoitem (
    idsuplementacaoitem integer NOT NULL,
    idlicitacao integer NOT NULL,
    item character(50),
    data date,
    quantidadesuplementar integer,
    valorunitsuplementar numeric(12,2),
    idsuplementacaoitemref integer,
    idrequisicao integer NOT NULL
);


--
-- TOC entry 1971 (class 1259 OID 89227)
-- Dependencies: 3
-- Name: ad_taxi; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_taxi (
    dataini date NOT NULL,
    datafim date NOT NULL,
    valor numeric(8,2)
);


--
-- TOC entry 1972 (class 1259 OID 89230)
-- Dependencies: 3
-- Name: ad_tipoprot; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_tipoprot (
    idtipoprot integer NOT NULL,
    tipo character varying(60),
    diretor character(1),
    gerente character(1),
    coord character(1)
);


--
-- TOC entry 1973 (class 1259 OID 89233)
-- Dependencies: 3
-- Name: ad_tiporeq; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_tiporeq (
    idtiporeq integer NOT NULL,
    descricao character varying(30),
    idrubrica character(11)
);


--
-- TOC entry 1974 (class 1259 OID 89236)
-- Dependencies: 3
-- Name: ad_tiposervint; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_tiposervint (
    idtiposervint integer NOT NULL,
    descricao character varying(30),
    idrubrica character(11),
    iduoprestadora integer
);


--
-- TOC entry 1975 (class 1259 OID 89239)
-- Dependencies: 3
-- Name: ad_tipoveiculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_tipoveiculo (
    tipoveiculo character(1) NOT NULL,
    descricao character varying(20),
    valorkm numeric(6,2),
    valorfixo numeric(8,2)
);


--
-- TOC entry 1976 (class 1259 OID 89242)
-- Dependencies: 3
-- Name: ad_trecho; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_trecho (
    idrequisicao integer NOT NULL,
    idpessoa integer NOT NULL,
    idtrecho integer NOT NULL,
    datahoraviagem date,
    origem character varying(50),
    destino character varying(50),
    codigoviagem character varying(20),
    situacao character(1)
);


--
-- TOC entry 1977 (class 1259 OID 89245)
-- Dependencies: 3
-- Name: ad_uo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_uo (
    iduo integer NOT NULL,
    sigla character varying(30),
    nome character varying(50),
    tipo character(1),
    documentoref character varying(200),
    idsetor integer NOT NULL,
    saldopublico character(1),
    ativo character(1)
);


--
-- TOC entry 1978 (class 1259 OID 89248)
-- Dependencies: 3
-- Name: ad_uoalmox; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_uoalmox (
    iduoreq integer NOT NULL,
    iduoalmox integer NOT NULL
);


--
-- TOC entry 1979 (class 1259 OID 89251)
-- Dependencies: 3
-- Name: ad_valetransporte; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_valetransporte (
    dataini date NOT NULL,
    datafim date,
    valor numeric(8,2)
);


--
-- TOC entry 1980 (class 1259 OID 89254)
-- Dependencies: 3
-- Name: ad_veiculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_veiculo (
    placa character(7) NOT NULL,
    renavam character varying(12),
    chassis character varying(20),
    marca character varying(15),
    modelo character varying(20),
    anofab character(4),
    anomod character(4),
    capacidade integer,
    combustivel character(1),
    ativo character(1),
    tipoveiculo character(1),
    valorkm numeric(9,2)
);


--
-- TOC entry 1981 (class 1259 OID 89257)
-- Dependencies: 3
-- Name: cm_acesso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_acesso (
    idgrupo integer NOT NULL,
    idtrans integer NOT NULL,
    direito integer NOT NULL
);


--
-- TOC entry 1982 (class 1259 OID 89260)
-- Dependencies: 3
-- Name: cm_agencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_agencia (
    idbanco character(3) NOT NULL,
    idagenc character(7) NOT NULL,
    nome character varying(50)
);


--
-- TOC entry 1983 (class 1259 OID 89263)
-- Dependencies: 3
-- Name: cm_arquivo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_arquivo (
    idarquivo integer NOT NULL,
    md5 character(32) NOT NULL,
    nome character varying(50) NOT NULL,
    caminho character varying(200),
    tipomime character varying(25),
    tamanho integer,
    mesreferencia character(2),
    anoreferencia character(4),
    idusuario integer,
    datagravacao date,
    processado character(1),
    dataprocessamento date,
    nomearqlog character varying(50),
    caminhoarqlog character varying(200),
    scriptprocessamento character varying(50),
    caminhoscript character varying(200),
    obs date
);


--
-- TOC entry 1984 (class 1259 OID 89269)
-- Dependencies: 3
-- Name: cm_banco; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_banco (
    idbanco character(3) NOT NULL,
    nome character varying(50),
    ativo character(1)
);


--
-- TOC entry 1985 (class 1259 OID 89272)
-- Dependencies: 3
-- Name: cm_estadocivil; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_estadocivil (
    idestadocivil character(1) NOT NULL,
    estadocivil character varying(30)
);


--
-- TOC entry 1986 (class 1259 OID 89275)
-- Dependencies: 3
-- Name: cm_feriado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_feriado (
    data date NOT NULL,
    descricao character varying(30),
    abrangencia character(1)
);


--
-- TOC entry 1987 (class 1259 OID 89278)
-- Dependencies: 3
-- Name: cm_grpusuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_grpusuario (
    idgrupo integer NOT NULL,
    idusuario integer NOT NULL
);


--
-- TOC entry 1988 (class 1259 OID 89281)
-- Dependencies: 3
-- Name: cm_grupoacesso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_grupoacesso (
    idgrupo integer NOT NULL,
    grupo character varying(50)
);


--
-- TOC entry 1989 (class 1259 OID 89284)
-- Dependencies: 3
-- Name: cm_indice; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_indice (
    sigla character varying(10) NOT NULL,
    nome character varying(60)
);


--
-- TOC entry 1990 (class 1259 OID 89287)
-- Dependencies: 3
-- Name: cm_indicemensal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_indicemensal (
    idindicemensal integer NOT NULL,
    ano integer NOT NULL,
    mes integer NOT NULL,
    valor numeric(18,6),
    sigla character varying(10) NOT NULL
);


--
-- TOC entry 2128 (class 1259 OID 96138)
-- Dependencies: 3
-- Name: cm_inss; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_inss (
    dataini timestamp with time zone,
    datafim timestamp with time zone,
    idinss integer NOT NULL,
    ate character varying(50),
    percentual character varying(100),
    fixo character varying(10),
    percpatronal character varying(50)
);


--
-- TOC entry 1991 (class 1259 OID 89290)
-- Dependencies: 3
-- Name: cm_instituicao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_instituicao (
    idinstituicao character(4) NOT NULL,
    instituicao character varying(20),
    nome character varying(100),
    rua character varying(80),
    bairro character varying(50),
    cep character varying(8),
    telefone character varying(15),
    email character varying(50),
    fax character varying(15),
    cgc character varying(19),
    caixapostal character varying(15),
    idpais character(4) NOT NULL,
    idmunicipio character(5) NOT NULL,
    numero character varying(15),
    complemento character varying(15)
);


--
-- TOC entry 2129 (class 1259 OID 96143)
-- Dependencies: 3
-- Name: cm_irrf; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_irrf (
    idirrf integer NOT NULL,
    dataini timestamp with time zone,
    datafim timestamp with time zone,
    aliquota character varying(50),
    ate character varying(50),
    percentual numeric(8,2),
    deducao numeric(8,2)
);


--
-- TOC entry 1992 (class 1259 OID 89293)
-- Dependencies: 3
-- Name: cm_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_log (
    idlog integer NOT NULL,
    "timestamp" date NOT NULL,
    descricao character varying(200),
    operacao character(3),
    idusuario integer NOT NULL,
    modulo character varying(20) NOT NULL,
    classe character varying(30) NOT NULL
);


--
-- TOC entry 1993 (class 1259 OID 89296)
-- Dependencies: 3
-- Name: cm_municipio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_municipio (
    idmunicipio character(5) NOT NULL,
    municipio character varying(50),
    iduf character(4) NOT NULL,
    idpais character(4) NOT NULL,
    categoriadiaria character(1),
    populacao integer
);


--
-- TOC entry 1994 (class 1259 OID 89299)
-- Dependencies: 3
-- Name: cm_noticia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_noticia (
    idsistema integer NOT NULL,
    idnoticia integer NOT NULL,
    dtnoticia date,
    noticia character varying(1000)
);


--
-- TOC entry 1995 (class 1259 OID 89305)
-- Dependencies: 3
-- Name: cm_organograma; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_organograma (
    idtipoorganograma integer NOT NULL,
    idsetor integer NOT NULL,
    idsetorpai integer NOT NULL
);


--
-- TOC entry 1996 (class 1259 OID 89308)
-- Dependencies: 3
-- Name: cm_pais; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_pais (
    idpais character(4) NOT NULL,
    pais character varying(50),
    nacionalidade character varying(50)
);


--
-- TOC entry 1997 (class 1259 OID 89311)
-- Dependencies: 3
-- Name: cm_pessoa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_pessoa (
    idpessoa integer NOT NULL,
    nome character varying(55) NOT NULL,
    bairro character varying(50),
    cep character varying(8) NOT NULL,
    datanasc date NOT NULL,
    nomepai character varying(55),
    nomemae character varying(55),
    sexo character(1) NOT NULL,
    anochegbrasil integer,
    telefone character varying(20),
    celular character varying(20),
    email character varying(50),
    gruposanguineo character varying(3),
    cpf character(11),
    numrg character varying(15),
    tiporg character varying(20),
    orgaorg character varying(20),
    ufrg character(2),
    numcartpro integer,
    seriecartpro integer,
    ufcartpro character(2),
    tituloeleitor character(12),
    zonatitulo integer,
    secaotitulo integer,
    uftitulo character(2),
    numdocmilitar character(12),
    seriedocmilitar character(1),
    categdocmilitar integer,
    conta character varying(20),
    numcert integer,
    livrocert character varying(10),
    folhacert integer,
    cartorio character varying(60),
    pispasep character(15),
    datapispasep date,
    bancopispasep integer,
    identprof character varying(15),
    tipoidentprof character varying(20),
    idpais character(4) NOT NULL,
    idmunicipio character(5) NOT NULL,
    idmunicipionascimento character(5),
    idpaisnascimento character(4) NOT NULL,
    idestadocivil character(1),
    idbanco character(3),
    idagenc character(7),
    idpaisnacionalidade character(4),
    tipodocmilitar character(3),
    orgexpdocmilitar character(3),
    dataultalt date,
    raca character(1),
    atvremunerada character(1),
    acessonet character(1),
    datarg date,
    endereco character varying(80),
    passaporte character varying(20),
    datacartest timestamp without time zone
);


--
-- TOC entry 1998 (class 1259 OID 89317)
-- Dependencies: 3
-- Name: cm_planosaude; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_planosaude (
    login character varying(50) NOT NULL,
    idpessoa integer,
    planosaude character varying(50)
);


--
-- TOC entry 1999 (class 1259 OID 89320)
-- Dependencies: 3
-- Name: cm_sessao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_sessao (
    idsessao integer NOT NULL,
    tsin date,
    tsout date,
    name character varying(50),
    sid character(32),
    forced character(1),
    idusuario integer,
    remoteaddr character varying(15)
);


--
-- TOC entry 2000 (class 1259 OID 89323)
-- Dependencies: 3
-- Name: cm_setor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_setor (
    idsetor integer NOT NULL,
    siglasetor character varying(15) NOT NULL,
    dataini date NOT NULL,
    nomesetor character varying(100),
    tiposetor character varying(20),
    datafim date,
    fone character varying(15),
    fax character varying(15),
    centrocusto character varying(20),
    obs character varying(255),
    localizacao character varying(15),
    paisetor character varying(15),
    pairelat character varying(15),
    idsetorsiape character(6),
    idpaisetor integer,
    codigo character(4)
);


--
-- TOC entry 2001 (class 1259 OID 89329)
-- Dependencies: 3
-- Name: cm_setoracesso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_setoracesso (
    idsetor integer NOT NULL,
    idsetoracesso integer NOT NULL,
    finalidade character varying(15) NOT NULL
);


--
-- TOC entry 2002 (class 1259 OID 89332)
-- Dependencies: 3
-- Name: cm_setorequivalente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_setorequivalente (
    idsetor integer NOT NULL,
    idsetorequivalente integer NOT NULL
);


--
-- TOC entry 2003 (class 1259 OID 89335)
-- Dependencies: 3
-- Name: cm_sistema; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_sistema (
    idsistema integer NOT NULL,
    sistema character varying(30)
);


--
-- TOC entry 2004 (class 1259 OID 89338)
-- Dependencies: 3
-- Name: cm_tabelageral; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_tabelageral (
    idtabelageral integer NOT NULL,
    tabela character varying(30) NOT NULL,
    item1 character varying(30) NOT NULL,
    item2 character varying(50),
    item3 character varying(200)
);


--
-- TOC entry 2130 (class 1259 OID 96148)
-- Dependencies: 3
-- Name: cm_temp; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_temp (
    idsetor integer NOT NULL,
    siglasetor character varying(15) NOT NULL,
    dataini date NOT NULL,
    nomesetor character varying(100),
    idpaisetor integer,
    codigo character(4)
);


--
-- TOC entry 2005 (class 1259 OID 89341)
-- Dependencies: 3
-- Name: cm_tipoorganograma; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_tipoorganograma (
    idtipoorganograma integer NOT NULL,
    sigla character(20),
    descricao character varying(100)
);


--
-- TOC entry 2006 (class 1259 OID 89344)
-- Dependencies: 3
-- Name: cm_transacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_transacao (
    idtrans integer NOT NULL,
    transacao character varying(30),
    idsistema integer NOT NULL
);


--
-- TOC entry 2007 (class 1259 OID 89347)
-- Dependencies: 3
-- Name: cm_uf; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_uf (
    iduf character(4) NOT NULL,
    uf character varying(50)
);


--
-- TOC entry 2008 (class 1259 OID 89350)
-- Dependencies: 3
-- Name: cm_usuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_usuario (
    idusuario integer NOT NULL,
    idpessoa integer NOT NULL,
    idsetor integer NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    nick character varying(80),
    passmd5 character varying(32)
);


--
-- TOC entry 2009 (class 1259 OID 89353)
-- Dependencies: 3
-- Name: rh_adicional; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_adicional (
    idvinculo character(7) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    idadicional integer NOT NULL,
    grau character varying(6)
);


--
-- TOC entry 2010 (class 1259 OID 89356)
-- Dependencies: 3
-- Name: rh_averbacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_averbacao (
    idaverbacao integer NOT NULL,
    processo character(21),
    datainicio date,
    datafim date,
    totaldias integer,
    tipotempo character varying(7),
    instituicao character varying(50),
    idvinculo character(7) NOT NULL
);


--
-- TOC entry 2011 (class 1259 OID 89359)
-- Dependencies: 3
-- Name: rh_averbfinalidade; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_averbfinalidade (
    idaverbacao integer NOT NULL,
    idaverbfinalidade integer NOT NULL,
    processo character(21),
    finalidade character(2),
    totaldias integer
);


--
-- TOC entry 2131 (class 1259 OID 96151)
-- Dependencies: 3
-- Name: rh_capacitacaocoinc; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_capacitacaocoinc (
    idcurso1 character(5) NOT NULL,
    idcurso2 character(5) NOT NULL
);


--
-- TOC entry 2132 (class 1259 OID 96156)
-- Dependencies: 3
-- Name: rh_capacitacaocurso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_capacitacaocurso (
    idcurso character(5) NOT NULL,
    nome character varying(100) NOT NULL,
    modulo character varying(100),
    datainicio date,
    datafim date,
    horainicio character(5),
    horafim character(5),
    cargahoraria character(5),
    local character varying(100),
    vagas character(3),
    turno character(1),
    status character(1)
);


--
-- TOC entry 2133 (class 1259 OID 96161)
-- Dependencies: 3
-- Name: rh_capacitacaoinsc; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_capacitacaoinsc (
    inscricao integer NOT NULL,
    idvinculo character(7) NOT NULL,
    idcurso character(5) NOT NULL,
    telefone character(10),
    turno character(10),
    ambiente character varying(100),
    justificativa character varying(2000),
    status character(1),
    ts character(20) NOT NULL,
    idauth character(7),
    tsauth character(20)
);


--
-- TOC entry 2012 (class 1259 OID 89362)
-- Dependencies: 3
-- Name: rh_cargo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_cargo (
    idgrupocargo integer NOT NULL,
    idcargo integer NOT NULL,
    descricao character varying(40),
    escolaridademinima character(2),
    idjornada integer
);


--
-- TOC entry 2013 (class 1259 OID 89365)
-- Dependencies: 3
-- Name: rh_cessao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_cessao (
    idvinculo character(7) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    obs character varying(500),
    tipoonus character varying(15),
    tipocessao character varying(20),
    tipoinstituicao character(1),
    idgrupoocorrencia integer NOT NULL,
    idocorrencia integer NOT NULL,
    idinstituicao character(4) NOT NULL,
    idpublicacao integer
);


--
-- TOC entry 2014 (class 1259 OID 89371)
-- Dependencies: 3
-- Name: rh_cidcategoria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_cidcategoria (
    idcidcategoria character(3) NOT NULL,
    opc character(1),
    descricao character varying(60)
);


--
-- TOC entry 2015 (class 1259 OID 89374)
-- Dependencies: 3
-- Name: rh_cidsubcategoria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_cidsubcategoria (
    idcidcategoria character(3) NOT NULL,
    idcidsubcategoria character(4) NOT NULL,
    opc character(1),
    descricao character varying(60),
    restricaosexo integer
);


--
-- TOC entry 2016 (class 1259 OID 89377)
-- Dependencies: 3
-- Name: rh_classe; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_classe (
    idclasse integer NOT NULL,
    classe character varying(10) NOT NULL,
    descricao character varying(20) NOT NULL,
    categoria character varying(6) NOT NULL
);


--
-- TOC entry 2134 (class 1259 OID 96169)
-- Dependencies: 3
-- Name: rh_classegrupocargo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_classegrupocargo (
    idclassegrupocargo integer NOT NULL,
    idclasse integer,
    idgrupocargo integer
);


--
-- TOC entry 2017 (class 1259 OID 89380)
-- Dependencies: 3
-- Name: rh_dependencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_dependencia (
    iddependente integer NOT NULL,
    idtipodependencia character(2) NOT NULL,
    datainicio date,
    datafim date
);


--
-- TOC entry 2018 (class 1259 OID 89383)
-- Dependencies: 3
-- Name: rh_dependente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_dependente (
    iddependente integer NOT NULL,
    parentesco integer NOT NULL,
    idpessoa integer,
    idfuncionario character(9) NOT NULL
);


--
-- TOC entry 2019 (class 1259 OID 89386)
-- Dependencies: 3
-- Name: rh_desaverbacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_desaverbacao (
    iddesaverbacao integer NOT NULL,
    processo character(21),
    datainicio date,
    datafim date,
    totaldias integer,
    data date,
    motivo character varying(100),
    idaverbacao integer NOT NULL
);


--
-- TOC entry 2020 (class 1259 OID 89389)
-- Dependencies: 3
-- Name: rh_designacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_designacao (
    idvinculo character(7) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    obs character varying(500),
    idsetor integer,
    idfuncao integer,
    idpublicacao integer
);


--
-- TOC entry 2021 (class 1259 OID 89395)
-- Dependencies: 3
-- Name: rh_diplomalegal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_diplomalegal (
    iddiplomalegal integer NOT NULL,
    descricao character varying(20)
);


--
-- TOC entry 2022 (class 1259 OID 89398)
-- Dependencies: 3
-- Name: rh_ferias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ferias (
    idvinculo character(7) NOT NULL,
    datainicioperaq date NOT NULL,
    datainicio date NOT NULL,
    datafim date NOT NULL,
    abono character(1) NOT NULL,
    adiantamento13 character(1) NOT NULL,
    adiantamentosalario character(1) NOT NULL,
    totaldias integer NOT NULL,
    iniciofimabono character varying(1),
    obs character varying(500),
    numfolha integer,
    datafimprevista date,
    abonoconst character(1) NOT NULL
);


--
-- TOC entry 2023 (class 1259 OID 89404)
-- Dependencies: 3
-- Name: rh_formacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_formacao (
    idformacao integer NOT NULL,
    formacao character varying(40),
    escolaridade character varying(50),
    habsiape character varying(50)
);


--
-- TOC entry 2024 (class 1259 OID 89407)
-- Dependencies: 3
-- Name: rh_funcao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_funcao (
    idfuncao integer NOT NULL,
    descricao character varying(60)
);


--
-- TOC entry 2025 (class 1259 OID 89410)
-- Dependencies: 3
-- Name: rh_funcionario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_funcionario (
    idfuncionario character(9) NOT NULL,
    escolaridade integer,
    ufempregoanterior character(2),
    dataprimeiroemprego date,
    idpessoa integer
);


--
-- TOC entry 2026 (class 1259 OID 89413)
-- Dependencies: 3
-- Name: rh_grupocargo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_grupocargo (
    idgrupocargo integer NOT NULL,
    descricao character varying(40) NOT NULL
);


--
-- TOC entry 2027 (class 1259 OID 89416)
-- Dependencies: 3
-- Name: rh_grupolicafast; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_grupolicafast (
    idtipolicafast integer NOT NULL,
    idgrupoocorrencia integer NOT NULL,
    idocorrencia integer NOT NULL
);


--
-- TOC entry 2028 (class 1259 OID 89419)
-- Dependencies: 3
-- Name: rh_grupoocorrencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_grupoocorrencia (
    idgrupoocorrencia integer NOT NULL,
    descricao character varying(30) NOT NULL
);


--
-- TOC entry 2029 (class 1259 OID 89422)
-- Dependencies: 3
-- Name: rh_histformacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_histformacao (
    idfuncionario character(9) NOT NULL,
    idformacao integer NOT NULL,
    idhistformacao integer,
    datafim date,
    entidade character varying(50)
);


--
-- TOC entry 2030 (class 1259 OID 89425)
-- Dependencies: 3
-- Name: rh_histpensionista; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_histpensionista (
    idvinculo character(7) NOT NULL,
    idpensionista integer NOT NULL,
    tipopensao character varying(20) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    percentual integer,
    isentoir character(1),
    obs character varying(200)
);


--
-- TOC entry 2031 (class 1259 OID 89428)
-- Dependencies: 3
-- Name: rh_histtitulacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_histtitulacao (
    idhisttitulacao integer NOT NULL,
    idtitulacao integer NOT NULL,
    datafim date NOT NULL,
    entidade character varying(50),
    titulotrabalhofinal character varying(120),
    tipotrabalhofinal character varying(20),
    areaconcentracao character varying(50),
    idfuncionario character(9) NOT NULL
);


--
-- TOC entry 2032 (class 1259 OID 89431)
-- Dependencies: 3
-- Name: rh_histvantagem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_histvantagem (
    idvantagem character varying(20) NOT NULL,
    idvinculo character(7) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    valor1 integer,
    info1 character varying(60),
    valor2 integer,
    info2 character varying(60),
    valor3 integer,
    info3 character varying(60),
    valor4 integer,
    info4 character varying(60),
    valor5 integer,
    info5 character varying(60),
    valor6 integer,
    info6 character varying(60)
);


--
-- TOC entry 2033 (class 1259 OID 89434)
-- Dependencies: 3
-- Name: rh_jornada; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_jornada (
    idjornada integer NOT NULL,
    descricao character varying(20) NOT NULL
);


--
-- TOC entry 2034 (class 1259 OID 89437)
-- Dependencies: 3
-- Name: rh_licafast; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_licafast (
    idvinculo character(7) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    motivo character varying(500),
    tipolicenca character varying(10),
    idgrupoocorrencia integer NOT NULL,
    idocorrencia integer NOT NULL,
    idcidcategoria character(3),
    idcidsubcategoria character(4),
    idpublicacao integer
);


--
-- TOC entry 2035 (class 1259 OID 89443)
-- Dependencies: 3
-- Name: rh_ocorrencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ocorrencia (
    idgrupoocorrencia integer NOT NULL,
    idocorrencia integer NOT NULL,
    descricao character varying(60) NOT NULL,
    mnemonico character(3) NOT NULL,
    prazomaximo integer,
    sexo character varying(50),
    excpgto character varying(50)
);


--
-- TOC entry 2036 (class 1259 OID 89446)
-- Dependencies: 3
-- Name: rh_ocupacaovaga; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ocupacaovaga (
    idvinculo character(7) NOT NULL,
    numerovaga integer NOT NULL,
    datainicio date,
    datafim date
);


--
-- TOC entry 2037 (class 1259 OID 89449)
-- Dependencies: 3
-- Name: rh_pensionista; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_pensionista (
    idvinculo character(7) NOT NULL,
    idpensionista integer NOT NULL,
    parentesco character varying(20) NOT NULL,
    obs character varying(200),
    idpessoa integer
);


--
-- TOC entry 2038 (class 1259 OID 89452)
-- Dependencies: 3
-- Name: rh_periodoaquisitivo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_periodoaquisitivo (
    idvinculo character(7) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    totaldias integer,
    diasusufruidos integer,
    faltas integer,
    obs character varying(200),
    dataprescricao date
);


--
-- TOC entry 2135 (class 1259 OID 96186)
-- Dependencies: 3
-- Name: rh_prorrogacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_prorrogacao (
    idvinculo integer NOT NULL,
    datafim date NOT NULL,
    obs character varying(150)
);


--
-- TOC entry 2039 (class 1259 OID 89455)
-- Dependencies: 3
-- Name: rh_provimento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_provimento (
    idvinculo character(7) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    excedelotacao character(1) NOT NULL,
    obs character varying(500),
    regimejuridico character(3),
    idjornada integer,
    idsituacao integer,
    idgrupocargo integer NOT NULL,
    idcargo integer NOT NULL,
    idsetor integer NOT NULL,
    idclasse integer,
    idreferencia integer,
    idpublicacao integer,
    idgrupoocorrencia integer,
    idocorrencia integer
);


--
-- TOC entry 2040 (class 1259 OID 89461)
-- Dependencies: 3
-- Name: rh_publicacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_publicacao (
    idpublicacao integer NOT NULL,
    data date,
    numero character varying(20),
    autoridade character varying(20),
    datado date,
    obs character varying(500),
    iddiplomalegal integer
);


--
-- TOC entry 2041 (class 1259 OID 89467)
-- Dependencies: 3
-- Name: rh_referencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_referencia (
    idclasse integer NOT NULL,
    idreferencia integer NOT NULL,
    nivelpadrao character varying(3),
    idclassegrupocargo integer NOT NULL
);


--
-- TOC entry 2042 (class 1259 OID 89470)
-- Dependencies: 3
-- Name: rh_situacaofuncional; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_situacaofuncional (
    idsituacao integer NOT NULL,
    descricao character varying(20) NOT NULL,
    regimejuridico character(3) NOT NULL
);


--
-- TOC entry 2043 (class 1259 OID 89473)
-- Dependencies: 3
-- Name: rh_situacaoocorrencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_situacaoocorrencia (
    idsituacao integer NOT NULL,
    idgrupoocorrencia integer NOT NULL,
    idocorrencia integer NOT NULL
);


--
-- TOC entry 2044 (class 1259 OID 89476)
-- Dependencies: 3
-- Name: rh_substituicao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_substituicao (
    idvinculo character(7) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    obs character varying(200),
    datainicioremuneracao date,
    datafimremuneracao date,
    idvinculosubst character(7),
    datainiciosubst date,
    idfuncao integer,
    idpublicacao integer
);


--
-- TOC entry 2045 (class 1259 OID 89479)
-- Dependencies: 3
-- Name: rh_tipolicafast; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_tipolicafast (
    idtipolicafast integer NOT NULL,
    tipolicafast character(25) NOT NULL,
    descricao character varying(50)
);


--
-- TOC entry 2046 (class 1259 OID 89482)
-- Dependencies: 3
-- Name: rh_vaga; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_vaga (
    numerovaga integer NOT NULL,
    idgrupocargo integer,
    idcargo integer
);


--
-- TOC entry 2047 (class 1259 OID 89485)
-- Dependencies: 3
-- Name: rh_vantagem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_vantagem (
    idvantagem character varying(20) NOT NULL,
    descricao character varying(60),
    ativos character(1),
    inativos character(1),
    manual character(1),
    funcdep character(1),
    falecido character(1)
);


--
-- TOC entry 2048 (class 1259 OID 89488)
-- Dependencies: 3
-- Name: rh_vinculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_vinculo (
    idvinculo character(7) NOT NULL,
    dvidvinculo character(1) NOT NULL,
    dataposse date,
    dataexercicio date,
    classificacaoconcurso integer,
    dataconcurso date,
    datafimcontrato date,
    datavacancia date,
    saualternativo character varying(6),
    numfunc integer,
    numvinculo integer,
    idpublicacao integer,
    idpublicacaovacancia integer,
    idfuncionario character(9) NOT NULL,
    idgrupoocorrencia integer,
    idocorrencia integer,
    idgrupoocorrencia_1 integer,
    idocorrencia_1 integer,
    idgrupoocorrenciavacancia integer,
    idocorrenciavacancia integer
);


--
-- TOC entry 2049 (class 1259 OID 89491)
-- Dependencies: 3
-- Name: seq_ad_bolsa; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_bolsa
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2050 (class 1259 OID 89493)
-- Dependencies: 3
-- Name: seq_ad_bolsista; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_bolsista
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2051 (class 1259 OID 89495)
-- Dependencies: 3
-- Name: seq_ad_dependencia; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_dependencia
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2052 (class 1259 OID 89497)
-- Dependencies: 3
-- Name: seq_ad_empenhado; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_empenhado
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2053 (class 1259 OID 89499)
-- Dependencies: 3
-- Name: seq_ad_empenho; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_empenho
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2054 (class 1259 OID 89501)
-- Dependencies: 3
-- Name: seq_ad_executoralmox; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_executoralmox
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2055 (class 1259 OID 89503)
-- Dependencies: 3
-- Name: seq_ad_fornecedor; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_fornecedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2056 (class 1259 OID 89505)
-- Dependencies: 3
-- Name: seq_ad_hotel; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_hotel
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2057 (class 1259 OID 89507)
-- Dependencies: 3
-- Name: seq_ad_itemnota; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_itemnota
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2058 (class 1259 OID 89509)
-- Dependencies: 3
-- Name: seq_ad_itempatrimonio; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_itempatrimonio
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2059 (class 1259 OID 89511)
-- Dependencies: 3
-- Name: seq_ad_lancamentoint; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_lancamentoint
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2060 (class 1259 OID 89513)
-- Dependencies: 3
-- Name: seq_ad_licitacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_licitacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2061 (class 1259 OID 89515)
-- Dependencies: 3
-- Name: seq_ad_liquidacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_liquidacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2062 (class 1259 OID 89517)
-- Dependencies: 3
-- Name: seq_ad_localidadediaria; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_localidadediaria
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2063 (class 1259 OID 89519)
-- Dependencies: 3
-- Name: seq_ad_material; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_material
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2064 (class 1259 OID 89521)
-- Dependencies: 3
-- Name: seq_ad_modalidadelicitacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_modalidadelicitacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2065 (class 1259 OID 89523)
-- Dependencies: 3
-- Name: seq_ad_motorista; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_motorista
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2066 (class 1259 OID 89525)
-- Dependencies: 3
-- Name: seq_ad_movimento; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_movimento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2067 (class 1259 OID 89527)
-- Dependencies: 3
-- Name: seq_ad_movimentopat; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_movimentopat
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2068 (class 1259 OID 89529)
-- Dependencies: 3
-- Name: seq_ad_movimentopat_termo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_movimentopat_termo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2069 (class 1259 OID 89531)
-- Dependencies: 3
-- Name: seq_ad_notafiscal; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_notafiscal
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2070 (class 1259 OID 89533)
-- Dependencies: 3
-- Name: seq_ad_novomaterial; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_novomaterial
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2071 (class 1259 OID 89535)
-- Dependencies: 3
-- Name: seq_ad_orcamento; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_orcamento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2136 (class 1259 OID 96189)
-- Dependencies: 3
-- Name: seq_ad_orcamentointerno; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_orcamentointerno
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2072 (class 1259 OID 89537)
-- Dependencies: 3
-- Name: seq_ad_ordembancaria; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_ordembancaria
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2073 (class 1259 OID 89539)
-- Dependencies: 3
-- Name: seq_ad_ordentrega; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_ordentrega
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2074 (class 1259 OID 89541)
-- Dependencies: 3
-- Name: seq_ad_requisicao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_requisicao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2075 (class 1259 OID 89543)
-- Dependencies: 3
-- Name: seq_ad_restaurante; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_restaurante
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2076 (class 1259 OID 89545)
-- Dependencies: 3
-- Name: seq_ad_servico; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_servico
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2077 (class 1259 OID 89547)
-- Dependencies: 3
-- Name: seq_ad_solicitacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_solicitacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2078 (class 1259 OID 89549)
-- Dependencies: 3
-- Name: seq_ad_suplementacaoitem; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_suplementacaoitem
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2079 (class 1259 OID 89551)
-- Dependencies: 3
-- Name: seq_ad_tipoprot; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_tipoprot
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2080 (class 1259 OID 89553)
-- Dependencies: 3
-- Name: seq_ad_tiporeq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_tiporeq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2081 (class 1259 OID 89555)
-- Dependencies: 3
-- Name: seq_ad_tiposervint; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_tiposervint
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2082 (class 1259 OID 89557)
-- Dependencies: 3
-- Name: seq_ad_uo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_uo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2083 (class 1259 OID 89559)
-- Dependencies: 3
-- Name: seq_bt_colecao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_colecao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2084 (class 1259 OID 89561)
-- Dependencies: 3
-- Name: seq_bt_emprestimo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_emprestimo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2085 (class 1259 OID 89563)
-- Dependencies: 3
-- Name: seq_bt_estado; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_estado
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2086 (class 1259 OID 89565)
-- Dependencies: 3
-- Name: seq_bt_etiqueta; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_etiqueta
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2087 (class 1259 OID 89567)
-- Dependencies: 3
-- Name: seq_bt_exemplar; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_exemplar
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2088 (class 1259 OID 89569)
-- Dependencies: 3
-- Name: seq_bt_ficha; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_ficha
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2089 (class 1259 OID 89571)
-- Dependencies: 3
-- Name: seq_bt_genero; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_genero
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2090 (class 1259 OID 89573)
-- Dependencies: 3
-- Name: seq_bt_grupo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_grupo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2091 (class 1259 OID 89575)
-- Dependencies: 3
-- Name: seq_bt_indicadores; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_indicadores
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2092 (class 1259 OID 89577)
-- Dependencies: 3
-- Name: seq_bt_infracao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_infracao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2093 (class 1259 OID 89579)
-- Dependencies: 3
-- Name: seq_bt_logoperacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_logoperacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2094 (class 1259 OID 89581)
-- Dependencies: 3
-- Name: seq_bt_material; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_material
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2095 (class 1259 OID 89583)
-- Dependencies: 3
-- Name: seq_bt_multa; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_multa
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2096 (class 1259 OID 89585)
-- Dependencies: 3
-- Name: seq_bt_notainfracao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_notainfracao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2097 (class 1259 OID 89587)
-- Dependencies: 3
-- Name: seq_bt_obra; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_obra
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2098 (class 1259 OID 89589)
-- Dependencies: 3
-- Name: seq_bt_obra_numerodaobra; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_obra_numerodaobra
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2099 (class 1259 OID 89591)
-- Dependencies: 3
-- Name: seq_bt_observacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_observacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2100 (class 1259 OID 89593)
-- Dependencies: 3
-- Name: seq_bt_opcao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_opcao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2101 (class 1259 OID 89595)
-- Dependencies: 3
-- Name: seq_bt_opcaolista; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_opcaolista
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2102 (class 1259 OID 89597)
-- Dependencies: 3
-- Name: seq_bt_operacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_operacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2103 (class 1259 OID 89599)
-- Dependencies: 3
-- Name: seq_bt_politica; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_politica
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2104 (class 1259 OID 89601)
-- Dependencies: 3
-- Name: seq_bt_regracirculacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_regracirculacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2105 (class 1259 OID 89603)
-- Dependencies: 3
-- Name: seq_bt_reserva; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_reserva
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2106 (class 1259 OID 89605)
-- Dependencies: 3
-- Name: seq_bt_situacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_situacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2107 (class 1259 OID 89607)
-- Dependencies: 3
-- Name: seq_bt_unidade; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_unidade
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2108 (class 1259 OID 89609)
-- Dependencies: 3
-- Name: seq_bt_validacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_validacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2109 (class 1259 OID 89611)
-- Dependencies: 3
-- Name: seq_cm_arquivo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_arquivo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2110 (class 1259 OID 89613)
-- Dependencies: 3
-- Name: seq_cm_common; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_common
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- TOC entry 2111 (class 1259 OID 89615)
-- Dependencies: 3
-- Name: seq_cm_estadocivil; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_estadocivil
    START WITH 8
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2112 (class 1259 OID 89617)
-- Dependencies: 3
-- Name: seq_cm_grupoacesso; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_grupoacesso
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- TOC entry 2137 (class 1259 OID 96191)
-- Dependencies: 3
-- Name: seq_cm_inss; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_inss
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2113 (class 1259 OID 89619)
-- Dependencies: 3
-- Name: seq_cm_instituicao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_instituicao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2138 (class 1259 OID 96193)
-- Dependencies: 3
-- Name: seq_cm_irrf; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_irrf
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2114 (class 1259 OID 89621)
-- Dependencies: 3
-- Name: seq_cm_log; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_log
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- TOC entry 2115 (class 1259 OID 89623)
-- Dependencies: 3
-- Name: seq_cm_noticia; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_noticia
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- TOC entry 2116 (class 1259 OID 89625)
-- Dependencies: 3
-- Name: seq_cm_pessoa; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_pessoa
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2117 (class 1259 OID 89627)
-- Dependencies: 3
-- Name: seq_cm_sessao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_sessao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- TOC entry 2118 (class 1259 OID 89629)
-- Dependencies: 3
-- Name: seq_cm_setor; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_setor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2119 (class 1259 OID 89631)
-- Dependencies: 3
-- Name: seq_cm_tabelageral; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_tabelageral
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- TOC entry 2120 (class 1259 OID 89633)
-- Dependencies: 3
-- Name: seq_cm_tipoorganograma; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_tipoorganograma
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2121 (class 1259 OID 89635)
-- Dependencies: 3
-- Name: seq_cm_transacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_transacao
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- TOC entry 2122 (class 1259 OID 89637)
-- Dependencies: 3
-- Name: seq_cm_usuario; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_usuario
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- TOC entry 2139 (class 1259 OID 96195)
-- Dependencies: 3
-- Name: seq_rh_capacitacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_capacitacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2123 (class 1259 OID 89639)
-- Dependencies: 3
-- Name: seq_rh_dependente; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_dependente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2124 (class 1259 OID 89641)
-- Dependencies: 3
-- Name: seq_rh_histcapacitacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_histcapacitacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2125 (class 1259 OID 89643)
-- Dependencies: 3
-- Name: seq_rh_histformacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_histformacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2126 (class 1259 OID 89645)
-- Dependencies: 3
-- Name: seq_rh_histtitulacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_histtitulacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2140 (class 1259 OID 96197)
-- Dependencies: 3
-- Name: seq_rh_publicacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_publicacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2127 (class 1259 OID 89647)
-- Dependencies: 3
-- Name: seq_rh_tipolicafast; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_tipolicafast
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2656 (class 2606 OID 96128)
-- Dependencies: 1958 1958 1958
-- Name: ad_reqrubrica_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_reqrubrica
    ADD CONSTRAINT ad_reqrubrica_pkey PRIMARY KEY (idrubrica, idtiporeq);


--
-- TOC entry 2692 (class 2606 OID 89652)
-- Dependencies: 1972 1972
-- Name: ad_tipoprot_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_tipoprot
    ADD CONSTRAINT ad_tipoprot_pkey PRIMARY KEY (idtipoprot);


--
-- TOC entry 2849 (class 2606 OID 96142)
-- Dependencies: 2128 2128
-- Name: cm_inss_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_inss
    ADD CONSTRAINT cm_inss_pkey PRIMARY KEY (idinss);


--
-- TOC entry 2851 (class 2606 OID 96147)
-- Dependencies: 2129 2129
-- Name: cm_irrf_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_irrf
    ADD CONSTRAINT cm_irrf_pkey PRIMARY KEY (idirrf);


--
-- TOC entry 2751 (class 2606 OID 89654)
-- Dependencies: 1998 1998
-- Name: cm_planosaude_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_planosaude
    ADD CONSTRAINT cm_planosaude_pkey PRIMARY KEY (login);


--
-- TOC entry 2418 (class 2606 OID 89656)
-- Dependencies: 1895 1895 1895
-- Name: pk_ad_acessobolsa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_acessobolsa
    ADD CONSTRAINT pk_ad_acessobolsa PRIMARY KEY (idusuario, idbolsa);


--
-- TOC entry 2422 (class 2606 OID 89658)
-- Dependencies: 1896 1896 1896
-- Name: pk_ad_acessouoreq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_acessouoreq
    ADD CONSTRAINT pk_ad_acessouoreq PRIMARY KEY (idusuario, iduo);


--
-- TOC entry 2424 (class 2606 OID 89660)
-- Dependencies: 1897 1897 1897
-- Name: pk_ad_andamento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_andamento
    ADD CONSTRAINT pk_ad_andamento PRIMARY KEY (numpro, numanda);


--
-- TOC entry 2426 (class 2606 OID 89662)
-- Dependencies: 1898 1898
-- Name: pk_ad_bolsa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_bolsa
    ADD CONSTRAINT pk_ad_bolsa PRIMARY KEY (idbolsa);


--
-- TOC entry 2430 (class 2606 OID 89664)
-- Dependencies: 1899 1899
-- Name: pk_ad_bolsista; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_bolsista
    ADD CONSTRAINT pk_ad_bolsista PRIMARY KEY (idbolsista);


--
-- TOC entry 2432 (class 2606 OID 89666)
-- Dependencies: 1900 1900
-- Name: pk_ad_catmat; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_catmat
    ADD CONSTRAINT pk_ad_catmat PRIMARY KEY (codmaterial);


--
-- TOC entry 2434 (class 2606 OID 89668)
-- Dependencies: 1901 1901
-- Name: pk_ad_classificador; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_classificador
    ADD CONSTRAINT pk_ad_classificador PRIMARY KEY (idclassificador);


--
-- TOC entry 2436 (class 2606 OID 89670)
-- Dependencies: 1903 1903
-- Name: pk_ad_controleprot; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_controleprot
    ADD CONSTRAINT pk_ad_controleprot PRIMARY KEY (anopro);


--
-- TOC entry 2439 (class 2606 OID 89672)
-- Dependencies: 1904 1904
-- Name: pk_ad_dependencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_dependencia
    ADD CONSTRAINT pk_ad_dependencia PRIMARY KEY (iddependencia);


--
-- TOC entry 2441 (class 2606 OID 89674)
-- Dependencies: 1905 1905 1905 1905
-- Name: pk_ad_diaria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_diaria
    ADD CONSTRAINT pk_ad_diaria PRIMARY KEY (dataini, categoriadiaria, categoriafunc);


--
-- TOC entry 2443 (class 2606 OID 89676)
-- Dependencies: 1906 1906
-- Name: pk_ad_elemento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_elemento
    ADD CONSTRAINT pk_ad_elemento PRIMARY KEY (idelemento);


--
-- TOC entry 2447 (class 2606 OID 89678)
-- Dependencies: 1907 1907
-- Name: pk_ad_empenhado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT pk_ad_empenhado PRIMARY KEY (idempenhado);


--
-- TOC entry 2449 (class 2606 OID 89680)
-- Dependencies: 1908 1908 1908
-- Name: pk_ad_empenhadodist; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_empenhadodist
    ADD CONSTRAINT pk_ad_empenhadodist PRIMARY KEY (idempenhado, idrequisicao);


--
-- TOC entry 2456 (class 2606 OID 89682)
-- Dependencies: 1909 1909
-- Name: pk_ad_empenho; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT pk_ad_empenho PRIMARY KEY (idempenho);


--
-- TOC entry 2458 (class 2606 OID 89684)
-- Dependencies: 1910 1910
-- Name: pk_ad_empresapassagem; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_empresapassagem
    ADD CONSTRAINT pk_ad_empresapassagem PRIMARY KEY (idempresapassagem);


--
-- TOC entry 2462 (class 2606 OID 89686)
-- Dependencies: 1911 1911 1911
-- Name: pk_ad_estoque; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_estoque
    ADD CONSTRAINT pk_ad_estoque PRIMARY KEY (idmaterial, iduo);


--
-- TOC entry 2467 (class 2606 OID 89688)
-- Dependencies: 1912 1912 1912 1912
-- Name: pk_ad_executa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT pk_ad_executa PRIMARY KEY (idtiporeq, iduo, ano);


--
-- TOC entry 2471 (class 2606 OID 89690)
-- Dependencies: 1913 1913 1913 1913
-- Name: pk_ad_executor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_executor
    ADD CONSTRAINT pk_ad_executor PRIMARY KEY (iduo, idusuario, datainicio);


--
-- TOC entry 2475 (class 2606 OID 89692)
-- Dependencies: 1914 1914
-- Name: pk_ad_executoralmox; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_executoralmox
    ADD CONSTRAINT pk_ad_executoralmox PRIMARY KEY (idexecutoralmox);


--
-- TOC entry 2479 (class 2606 OID 89694)
-- Dependencies: 1915 1915
-- Name: pk_ad_executorservint; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_executorservint
    ADD CONSTRAINT pk_ad_executorservint PRIMARY KEY (idexecutorservint);


--
-- TOC entry 2481 (class 2606 OID 89696)
-- Dependencies: 1916 1916
-- Name: pk_ad_fonte; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_fonte
    ADD CONSTRAINT pk_ad_fonte PRIMARY KEY (idfonte);


--
-- TOC entry 2486 (class 2606 OID 89698)
-- Dependencies: 1917 1917
-- Name: pk_ad_fornecedor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT pk_ad_fornecedor PRIMARY KEY (idfornecedor);


--
-- TOC entry 2490 (class 2606 OID 89700)
-- Dependencies: 1918 1918 1918
-- Name: pk_ad_fpotencial; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_fpotencial
    ADD CONSTRAINT pk_ad_fpotencial PRIMARY KEY (idmaterial, idfornecedor);


--
-- TOC entry 2494 (class 2606 OID 89702)
-- Dependencies: 1919 1919 1919 1919
-- Name: pk_ad_funcionarioresp; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_funcionarioresp
    ADD CONSTRAINT pk_ad_funcionarioresp PRIMARY KEY (idfunc, idsetor, dataini);


--
-- TOC entry 2498 (class 2606 OID 89704)
-- Dependencies: 1920 1920 1920 1920
-- Name: pk_ad_gestor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_gestor
    ADD CONSTRAINT pk_ad_gestor PRIMARY KEY (iduo, idusuario, datainicio);


--
-- TOC entry 2500 (class 2606 OID 89706)
-- Dependencies: 1921 1921
-- Name: pk_ad_hotel; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_hotel
    ADD CONSTRAINT pk_ad_hotel PRIMARY KEY (idhotel);


--
-- TOC entry 2503 (class 2606 OID 89708)
-- Dependencies: 1922 1922 1922
-- Name: pk_ad_itemlicitacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemlicitacao
    ADD CONSTRAINT pk_ad_itemlicitacao PRIMARY KEY (idlicitacao, item);


--
-- TOC entry 2507 (class 2606 OID 89710)
-- Dependencies: 1923 1923
-- Name: pk_ad_itemnota; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemnota
    ADD CONSTRAINT pk_ad_itemnota PRIMARY KEY (iditemnota);


--
-- TOC entry 2511 (class 2606 OID 89712)
-- Dependencies: 1924 1924
-- Name: pk_ad_itempatrimo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itempatrimo
    ADD CONSTRAINT pk_ad_itempatrimo PRIMARY KEY (idpatrimo);


--
-- TOC entry 2519 (class 2606 OID 89714)
-- Dependencies: 1925 1925
-- Name: pk_ad_itempatrimonio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT pk_ad_itempatrimonio PRIMARY KEY (iditempatrimonio);


--
-- TOC entry 2524 (class 2606 OID 89716)
-- Dependencies: 1926 1926 1926
-- Name: pk_ad_itemreq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT pk_ad_itemreq PRIMARY KEY (idrequisicao, idmaterial);


--
-- TOC entry 2198 (class 2606 OID 36957)
-- Dependencies: 1828 1828 1828
-- Name: pk_ad_itemreqbib; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqbib
    ADD CONSTRAINT pk_ad_itemreqbib PRIMARY KEY (idrequisicao, idmaterial);


--
-- TOC entry 2531 (class 2606 OID 89718)
-- Dependencies: 1927 1927 1927
-- Name: pk_ad_itemreqdiaria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT pk_ad_itemreqdiaria PRIMARY KEY (idrequisicao, idvinculo);


--
-- TOC entry 2537 (class 2606 OID 89720)
-- Dependencies: 1928 1928 1928
-- Name: pk_ad_itemreqhotel; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT pk_ad_itemreqhotel PRIMARY KEY (idrequisicao, idpessoa);


--
-- TOC entry 2545 (class 2606 OID 89722)
-- Dependencies: 1929 1929 1929
-- Name: pk_ad_itemreqpassagem; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT pk_ad_itemreqpassagem PRIMARY KEY (idrequisicao, idpessoa);


--
-- TOC entry 2552 (class 2606 OID 89724)
-- Dependencies: 1930 1930 1930
-- Name: pk_ad_itemreqrestaurante; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT pk_ad_itemreqrestaurante PRIMARY KEY (idrequisicao, idpessoa);


--
-- TOC entry 2556 (class 2606 OID 89726)
-- Dependencies: 1931 1931 1931
-- Name: pk_ad_itemreqservext; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT pk_ad_itemreqservext PRIMARY KEY (idrequisicao, idservico);


--
-- TOC entry 2560 (class 2606 OID 89728)
-- Dependencies: 1932 1932 1932
-- Name: pk_ad_itemreqservint; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqservint
    ADD CONSTRAINT pk_ad_itemreqservint PRIMARY KEY (idrequisicao, idtiposervint);


--
-- TOC entry 2565 (class 2606 OID 89730)
-- Dependencies: 1933 1933 1933
-- Name: pk_ad_itemreqservpf; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT pk_ad_itemreqservpf PRIMARY KEY (idrequisicao, idpessoa);


--
-- TOC entry 2574 (class 2606 OID 89732)
-- Dependencies: 1934 1934 1934
-- Name: pk_ad_itemreqveiculo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT pk_ad_itemreqveiculo PRIMARY KEY (idrequisicao, idpessoa);


--
-- TOC entry 2580 (class 2606 OID 89734)
-- Dependencies: 1935 1935
-- Name: pk_ad_lancamentoint; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT pk_ad_lancamentoint PRIMARY KEY (idlancamentoint);


--
-- TOC entry 2584 (class 2606 OID 89736)
-- Dependencies: 1936 1936
-- Name: pk_ad_licitacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_licitacao
    ADD CONSTRAINT pk_ad_licitacao PRIMARY KEY (idlicitacao);


--
-- TOC entry 2586 (class 2606 OID 89738)
-- Dependencies: 1937 1937
-- Name: pk_ad_liquidacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_liquidacao
    ADD CONSTRAINT pk_ad_liquidacao PRIMARY KEY (idliquidacao);


--
-- TOC entry 2590 (class 2606 OID 89740)
-- Dependencies: 1938 1938
-- Name: pk_ad_localidadediaria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_localidadediaria
    ADD CONSTRAINT pk_ad_localidadediaria PRIMARY KEY (idlocalidadediaria);


--
-- TOC entry 2594 (class 2606 OID 89742)
-- Dependencies: 1939 1939 1939 1939
-- Name: pk_ad_mapalicitacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_mapalicitacao
    ADD CONSTRAINT pk_ad_mapalicitacao PRIMARY KEY (idlicitacao, item, idfornecedor);


--
-- TOC entry 2598 (class 2606 OID 89744)
-- Dependencies: 1940 1940
-- Name: pk_ad_material; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_material
    ADD CONSTRAINT pk_ad_material PRIMARY KEY (idmaterial);


--
-- TOC entry 2600 (class 2606 OID 89746)
-- Dependencies: 1941 1941
-- Name: pk_ad_modalidadelicitacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_modalidadelicitacao
    ADD CONSTRAINT pk_ad_modalidadelicitacao PRIMARY KEY (idmodalidadelicitacao);


--
-- TOC entry 2603 (class 2606 OID 89748)
-- Dependencies: 1942 1942
-- Name: pk_ad_motorista; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_motorista
    ADD CONSTRAINT pk_ad_motorista PRIMARY KEY (idmotorista);


--
-- TOC entry 2608 (class 2606 OID 89750)
-- Dependencies: 1943 1943
-- Name: pk_ad_movimento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT pk_ad_movimento PRIMARY KEY (idmovimento);


--
-- TOC entry 2615 (class 2606 OID 89752)
-- Dependencies: 1944 1944
-- Name: pk_ad_movimentopat; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT pk_ad_movimentopat PRIMARY KEY (idmovimentacao);


--
-- TOC entry 2617 (class 2606 OID 89754)
-- Dependencies: 1945 1945
-- Name: pk_ad_movimentoserv; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_movimentoserv
    ADD CONSTRAINT pk_ad_movimentoserv PRIMARY KEY (idmovimentoserv);


--
-- TOC entry 2621 (class 2606 OID 89756)
-- Dependencies: 1946 1946
-- Name: pk_ad_notafiscal; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_notafiscal
    ADD CONSTRAINT pk_ad_notafiscal PRIMARY KEY (idnotafiscal);


--
-- TOC entry 2630 (class 2606 OID 89758)
-- Dependencies: 1948 1948
-- Name: pk_ad_orcamento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT pk_ad_orcamento PRIMARY KEY (idorcamento);


--
-- TOC entry 2633 (class 2606 OID 89760)
-- Dependencies: 1949 1949 1949 1949
-- Name: pk_ad_orcamentohist; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_orcamentohist
    ADD CONSTRAINT pk_ad_orcamentohist PRIMARY KEY (idorcamento, data, tipoorc);


--
-- TOC entry 2637 (class 2606 OID 89762)
-- Dependencies: 1950 1950 1950 1950
-- Name: pk_ad_orcamentointerno; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_orcamentointerno
    ADD CONSTRAINT pk_ad_orcamentointerno PRIMARY KEY (iduo, idrubrica, ano);


--
-- TOC entry 2640 (class 2606 OID 89764)
-- Dependencies: 1951 1951
-- Name: pk_ad_ordembancaria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_ordembancaria
    ADD CONSTRAINT pk_ad_ordembancaria PRIMARY KEY (idordembancaria);


--
-- TOC entry 2643 (class 2606 OID 89766)
-- Dependencies: 1952 1952
-- Name: pk_ad_ordentrega; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_ordentrega
    ADD CONSTRAINT pk_ad_ordentrega PRIMARY KEY (idordement);


--
-- TOC entry 2646 (class 2606 OID 89768)
-- Dependencies: 1953 1953 1953 1953
-- Name: pk_ad_pagbolsa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_pagbolsa
    ADD CONSTRAINT pk_ad_pagbolsa PRIMARY KEY (idbolsista, mesano, folha);


--
-- TOC entry 2650 (class 2606 OID 89770)
-- Dependencies: 1954 1954 1954
-- Name: pk_ad_paiempenho; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_paiempenho
    ADD CONSTRAINT pk_ad_paiempenho PRIMARY KEY (idempenhopai, idempenho);


--
-- TOC entry 2652 (class 2606 OID 89772)
-- Dependencies: 1956 1956
-- Name: pk_ad_processo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_processo
    ADD CONSTRAINT pk_ad_processo PRIMARY KEY (numpro);


--
-- TOC entry 2654 (class 2606 OID 89774)
-- Dependencies: 1957 1957
-- Name: pk_ad_ptr; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_ptr
    ADD CONSTRAINT pk_ad_ptr PRIMARY KEY (idptr);


--
-- TOC entry 2661 (class 2606 OID 89776)
-- Dependencies: 1959 1959
-- Name: pk_ad_requisicao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT pk_ad_requisicao PRIMARY KEY (idrequisicao);


--
-- TOC entry 2666 (class 2606 OID 89778)
-- Dependencies: 1960 1960 1960 1960
-- Name: pk_ad_requisita; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT pk_ad_requisita PRIMARY KEY (idtiporeq, iduo, ano);


--
-- TOC entry 2668 (class 2606 OID 89780)
-- Dependencies: 1961 1961
-- Name: pk_ad_restaurante; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_restaurante
    ADD CONSTRAINT pk_ad_restaurante PRIMARY KEY (idrestaurante);


--
-- TOC entry 2670 (class 2606 OID 89782)
-- Dependencies: 1962 1962
-- Name: pk_ad_retencao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_retencao
    ADD CONSTRAINT pk_ad_retencao PRIMARY KEY (numpro);


--
-- TOC entry 2672 (class 2606 OID 89784)
-- Dependencies: 1963 1963
-- Name: pk_ad_rubrica; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_rubrica
    ADD CONSTRAINT pk_ad_rubrica PRIMARY KEY (idrubrica);


--
-- TOC entry 2676 (class 2606 OID 89786)
-- Dependencies: 1964 1964 1964
-- Name: pk_ad_saldolic; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT pk_ad_saldolic PRIMARY KEY (numerolic, item);


--
-- TOC entry 2679 (class 2606 OID 89788)
-- Dependencies: 1965 1965
-- Name: pk_ad_servico; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_servico
    ADD CONSTRAINT pk_ad_servico PRIMARY KEY (idservico);


--
-- TOC entry 2681 (class 2606 OID 89790)
-- Dependencies: 1966 1966 1966
-- Name: pk_ad_setoracesso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_setoracesso
    ADD CONSTRAINT pk_ad_setoracesso PRIMARY KEY (setor, setorfilho);


--
-- TOC entry 2683 (class 2606 OID 89792)
-- Dependencies: 1967 1967 1967 1967
-- Name: pk_ad_solicitacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_solicitacao
    ADD CONSTRAINT pk_ad_solicitacao PRIMARY KEY (idlicitacao, item, data);


--
-- TOC entry 2686 (class 2606 OID 89794)
-- Dependencies: 1969 1969 1969
-- Name: pk_ad_subelemento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_subelemento
    ADD CONSTRAINT pk_ad_subelemento PRIMARY KEY (idelemento, idsubelemento);


--
-- TOC entry 2688 (class 2606 OID 89796)
-- Dependencies: 1970 1970
-- Name: pk_ad_suplementacaoitem; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_suplementacaoitem
    ADD CONSTRAINT pk_ad_suplementacaoitem PRIMARY KEY (idsuplementacaoitem);


--
-- TOC entry 2690 (class 2606 OID 89798)
-- Dependencies: 1971 1971
-- Name: pk_ad_taxi; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_taxi
    ADD CONSTRAINT pk_ad_taxi PRIMARY KEY (dataini);


--
-- TOC entry 2695 (class 2606 OID 89800)
-- Dependencies: 1973 1973
-- Name: pk_ad_tiporeq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_tiporeq
    ADD CONSTRAINT pk_ad_tiporeq PRIMARY KEY (idtiporeq);


--
-- TOC entry 2698 (class 2606 OID 89802)
-- Dependencies: 1974 1974
-- Name: pk_ad_tiposervint; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_tiposervint
    ADD CONSTRAINT pk_ad_tiposervint PRIMARY KEY (idtiposervint);


--
-- TOC entry 2700 (class 2606 OID 89804)
-- Dependencies: 1975 1975
-- Name: pk_ad_tipoveiculo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_tipoveiculo
    ADD CONSTRAINT pk_ad_tipoveiculo PRIMARY KEY (tipoveiculo);


--
-- TOC entry 2703 (class 2606 OID 89806)
-- Dependencies: 1976 1976 1976 1976
-- Name: pk_ad_trecho; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_trecho
    ADD CONSTRAINT pk_ad_trecho PRIMARY KEY (idrequisicao, idpessoa, idtrecho);


--
-- TOC entry 2706 (class 2606 OID 89808)
-- Dependencies: 1977 1977
-- Name: pk_ad_uo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_uo
    ADD CONSTRAINT pk_ad_uo PRIMARY KEY (iduo);


--
-- TOC entry 2710 (class 2606 OID 89810)
-- Dependencies: 1978 1978 1978
-- Name: pk_ad_uoalmox; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_uoalmox
    ADD CONSTRAINT pk_ad_uoalmox PRIMARY KEY (iduoreq, iduoalmox);


--
-- TOC entry 2712 (class 2606 OID 89812)
-- Dependencies: 1979 1979
-- Name: pk_ad_valetransporte; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_valetransporte
    ADD CONSTRAINT pk_ad_valetransporte PRIMARY KEY (dataini);


--
-- TOC entry 2715 (class 2606 OID 89814)
-- Dependencies: 1980 1980
-- Name: pk_ad_veiculo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_veiculo
    ADD CONSTRAINT pk_ad_veiculo PRIMARY KEY (placa);


--
-- TOC entry 2717 (class 2606 OID 89816)
-- Dependencies: 1981 1981 1981
-- Name: pk_cm_acesso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_acesso
    ADD CONSTRAINT pk_cm_acesso PRIMARY KEY (idgrupo, idtrans);


--
-- TOC entry 2719 (class 2606 OID 89818)
-- Dependencies: 1982 1982 1982
-- Name: pk_cm_agencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_agencia
    ADD CONSTRAINT pk_cm_agencia PRIMARY KEY (idbanco, idagenc);


--
-- TOC entry 2721 (class 2606 OID 89820)
-- Dependencies: 1983 1983
-- Name: pk_cm_arquivo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_arquivo
    ADD CONSTRAINT pk_cm_arquivo PRIMARY KEY (idarquivo);


--
-- TOC entry 2723 (class 2606 OID 89822)
-- Dependencies: 1984 1984
-- Name: pk_cm_banco; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_banco
    ADD CONSTRAINT pk_cm_banco PRIMARY KEY (idbanco);


--
-- TOC entry 2725 (class 2606 OID 89824)
-- Dependencies: 1985 1985
-- Name: pk_cm_estadocivil; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_estadocivil
    ADD CONSTRAINT pk_cm_estadocivil PRIMARY KEY (idestadocivil);


--
-- TOC entry 2727 (class 2606 OID 89826)
-- Dependencies: 1986 1986
-- Name: pk_cm_feriado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_feriado
    ADD CONSTRAINT pk_cm_feriado PRIMARY KEY (data);


--
-- TOC entry 2729 (class 2606 OID 89828)
-- Dependencies: 1987 1987 1987
-- Name: pk_cm_grpusuario; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_grpusuario
    ADD CONSTRAINT pk_cm_grpusuario PRIMARY KEY (idgrupo, idusuario);


--
-- TOC entry 2731 (class 2606 OID 89830)
-- Dependencies: 1988 1988
-- Name: pk_cm_grupoacesso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_grupoacesso
    ADD CONSTRAINT pk_cm_grupoacesso PRIMARY KEY (idgrupo);


--
-- TOC entry 2733 (class 2606 OID 89832)
-- Dependencies: 1989 1989
-- Name: pk_cm_indice; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_indice
    ADD CONSTRAINT pk_cm_indice PRIMARY KEY (sigla);


--
-- TOC entry 2735 (class 2606 OID 89834)
-- Dependencies: 1990 1990
-- Name: pk_cm_indicemensal; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_indicemensal
    ADD CONSTRAINT pk_cm_indicemensal PRIMARY KEY (idindicemensal);


--
-- TOC entry 2737 (class 2606 OID 89836)
-- Dependencies: 1991 1991
-- Name: pk_cm_instituicao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_instituicao
    ADD CONSTRAINT pk_cm_instituicao PRIMARY KEY (idinstituicao);


--
-- TOC entry 2739 (class 2606 OID 89838)
-- Dependencies: 1992 1992
-- Name: pk_cm_log; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_log
    ADD CONSTRAINT pk_cm_log PRIMARY KEY (idlog);


--
-- TOC entry 2741 (class 2606 OID 89840)
-- Dependencies: 1993 1993
-- Name: pk_cm_municipio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_municipio
    ADD CONSTRAINT pk_cm_municipio PRIMARY KEY (idmunicipio);


--
-- TOC entry 2743 (class 2606 OID 89842)
-- Dependencies: 1994 1994 1994
-- Name: pk_cm_noticia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_noticia
    ADD CONSTRAINT pk_cm_noticia PRIMARY KEY (idsistema, idnoticia);


--
-- TOC entry 2745 (class 2606 OID 89844)
-- Dependencies: 1995 1995 1995 1995
-- Name: pk_cm_organograma; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_organograma
    ADD CONSTRAINT pk_cm_organograma PRIMARY KEY (idtipoorganograma, idsetor, idsetorpai);


--
-- TOC entry 2747 (class 2606 OID 89846)
-- Dependencies: 1996 1996
-- Name: pk_cm_pais; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_pais
    ADD CONSTRAINT pk_cm_pais PRIMARY KEY (idpais);


--
-- TOC entry 2749 (class 2606 OID 89848)
-- Dependencies: 1997 1997
-- Name: pk_cm_pessoa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT pk_cm_pessoa PRIMARY KEY (idpessoa);


--
-- TOC entry 2753 (class 2606 OID 89850)
-- Dependencies: 1999 1999
-- Name: pk_cm_sessao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_sessao
    ADD CONSTRAINT pk_cm_sessao PRIMARY KEY (idsessao);


--
-- TOC entry 2755 (class 2606 OID 89852)
-- Dependencies: 2000 2000
-- Name: pk_cm_setor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_setor
    ADD CONSTRAINT pk_cm_setor PRIMARY KEY (idsetor);


--
-- TOC entry 2757 (class 2606 OID 89854)
-- Dependencies: 2001 2001 2001 2001
-- Name: pk_cm_setoracesso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_setoracesso
    ADD CONSTRAINT pk_cm_setoracesso PRIMARY KEY (idsetor, idsetoracesso, finalidade);


--
-- TOC entry 2759 (class 2606 OID 89856)
-- Dependencies: 2002 2002 2002
-- Name: pk_cm_setorequivalente; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_setorequivalente
    ADD CONSTRAINT pk_cm_setorequivalente PRIMARY KEY (idsetor, idsetorequivalente);


--
-- TOC entry 2761 (class 2606 OID 89858)
-- Dependencies: 2003 2003
-- Name: pk_cm_sistema; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_sistema
    ADD CONSTRAINT pk_cm_sistema PRIMARY KEY (idsistema);


--
-- TOC entry 2763 (class 2606 OID 89860)
-- Dependencies: 2004 2004
-- Name: pk_cm_tabelageral; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_tabelageral
    ADD CONSTRAINT pk_cm_tabelageral PRIMARY KEY (idtabelageral);


--
-- TOC entry 2765 (class 2606 OID 89862)
-- Dependencies: 2005 2005
-- Name: pk_cm_tipoorganograma; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_tipoorganograma
    ADD CONSTRAINT pk_cm_tipoorganograma PRIMARY KEY (idtipoorganograma);


--
-- TOC entry 2767 (class 2606 OID 89864)
-- Dependencies: 2006 2006
-- Name: pk_cm_transacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_transacao
    ADD CONSTRAINT pk_cm_transacao PRIMARY KEY (idtrans);


--
-- TOC entry 2769 (class 2606 OID 89866)
-- Dependencies: 2007 2007
-- Name: pk_cm_uf; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_uf
    ADD CONSTRAINT pk_cm_uf PRIMARY KEY (iduf);


--
-- TOC entry 2771 (class 2606 OID 89868)
-- Dependencies: 2008 2008
-- Name: pk_cm_usuario; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_usuario
    ADD CONSTRAINT pk_cm_usuario PRIMARY KEY (idusuario);


--
-- TOC entry 2773 (class 2606 OID 89870)
-- Dependencies: 2009 2009 2009
-- Name: pk_rh_adicional; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_adicional
    ADD CONSTRAINT pk_rh_adicional PRIMARY KEY (idvinculo, datainicio);


--
-- TOC entry 2775 (class 2606 OID 89872)
-- Dependencies: 2010 2010
-- Name: pk_rh_averbacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_averbacao
    ADD CONSTRAINT pk_rh_averbacao PRIMARY KEY (idaverbacao);


--
-- TOC entry 2777 (class 2606 OID 89874)
-- Dependencies: 2011 2011 2011
-- Name: pk_rh_averbfinalidade; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_averbfinalidade
    ADD CONSTRAINT pk_rh_averbfinalidade PRIMARY KEY (idaverbacao, idaverbfinalidade);


--
-- TOC entry 2853 (class 2606 OID 96155)
-- Dependencies: 2131 2131 2131
-- Name: pk_rh_capacitacaocoinc; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_capacitacaocoinc
    ADD CONSTRAINT pk_rh_capacitacaocoinc PRIMARY KEY (idcurso1, idcurso2);


--
-- TOC entry 2855 (class 2606 OID 96160)
-- Dependencies: 2132 2132
-- Name: pk_rh_capacitacaocurso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_capacitacaocurso
    ADD CONSTRAINT pk_rh_capacitacaocurso PRIMARY KEY (idcurso);


--
-- TOC entry 2857 (class 2606 OID 96168)
-- Dependencies: 2133 2133
-- Name: pk_rh_capacitacaoinsc; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_capacitacaoinsc
    ADD CONSTRAINT pk_rh_capacitacaoinsc PRIMARY KEY (inscricao);


--
-- TOC entry 2779 (class 2606 OID 89876)
-- Dependencies: 2012 2012 2012
-- Name: pk_rh_cargo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_cargo
    ADD CONSTRAINT pk_rh_cargo PRIMARY KEY (idgrupocargo, idcargo);


--
-- TOC entry 2781 (class 2606 OID 89878)
-- Dependencies: 2013 2013 2013
-- Name: pk_rh_cessao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_cessao
    ADD CONSTRAINT pk_rh_cessao PRIMARY KEY (idvinculo, datainicio);


--
-- TOC entry 2783 (class 2606 OID 89880)
-- Dependencies: 2016 2016
-- Name: pk_rh_classe; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_classe
    ADD CONSTRAINT pk_rh_classe PRIMARY KEY (idclasse);


--
-- TOC entry 2785 (class 2606 OID 89882)
-- Dependencies: 2017 2017 2017
-- Name: pk_rh_dependencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_dependencia
    ADD CONSTRAINT pk_rh_dependencia PRIMARY KEY (iddependente, idtipodependencia);


--
-- TOC entry 2787 (class 2606 OID 89884)
-- Dependencies: 2018 2018
-- Name: pk_rh_dependente; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_dependente
    ADD CONSTRAINT pk_rh_dependente PRIMARY KEY (iddependente);


--
-- TOC entry 2789 (class 2606 OID 89886)
-- Dependencies: 2019 2019
-- Name: pk_rh_desaverbacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_desaverbacao
    ADD CONSTRAINT pk_rh_desaverbacao PRIMARY KEY (iddesaverbacao);


--
-- TOC entry 2791 (class 2606 OID 89888)
-- Dependencies: 2020 2020 2020
-- Name: pk_rh_designacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_designacao
    ADD CONSTRAINT pk_rh_designacao PRIMARY KEY (idvinculo, datainicio);


--
-- TOC entry 2793 (class 2606 OID 89890)
-- Dependencies: 2021 2021
-- Name: pk_rh_diplomalegal; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_diplomalegal
    ADD CONSTRAINT pk_rh_diplomalegal PRIMARY KEY (iddiplomalegal);


--
-- TOC entry 2795 (class 2606 OID 89892)
-- Dependencies: 2022 2022 2022 2022
-- Name: pk_rh_ferias; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_ferias
    ADD CONSTRAINT pk_rh_ferias PRIMARY KEY (idvinculo, datainicioperaq, datainicio);


--
-- TOC entry 2797 (class 2606 OID 89894)
-- Dependencies: 2023 2023
-- Name: pk_rh_formacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_formacao
    ADD CONSTRAINT pk_rh_formacao PRIMARY KEY (idformacao);


--
-- TOC entry 2799 (class 2606 OID 89896)
-- Dependencies: 2024 2024
-- Name: pk_rh_funcao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_funcao
    ADD CONSTRAINT pk_rh_funcao PRIMARY KEY (idfuncao);


--
-- TOC entry 2801 (class 2606 OID 89898)
-- Dependencies: 2025 2025
-- Name: pk_rh_funcionario; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_funcionario
    ADD CONSTRAINT pk_rh_funcionario PRIMARY KEY (idfuncionario);


--
-- TOC entry 2803 (class 2606 OID 89900)
-- Dependencies: 2026 2026
-- Name: pk_rh_grupocargo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_grupocargo
    ADD CONSTRAINT pk_rh_grupocargo PRIMARY KEY (idgrupocargo);


--
-- TOC entry 2805 (class 2606 OID 89902)
-- Dependencies: 2027 2027 2027 2027
-- Name: pk_rh_grupolicafast; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_grupolicafast
    ADD CONSTRAINT pk_rh_grupolicafast PRIMARY KEY (idtipolicafast, idgrupoocorrencia, idocorrencia);


--
-- TOC entry 2807 (class 2606 OID 89904)
-- Dependencies: 2028 2028
-- Name: pk_rh_grupoocorrencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_grupoocorrencia
    ADD CONSTRAINT pk_rh_grupoocorrencia PRIMARY KEY (idgrupoocorrencia);


--
-- TOC entry 2809 (class 2606 OID 89906)
-- Dependencies: 2029 2029 2029
-- Name: pk_rh_histformacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_histformacao
    ADD CONSTRAINT pk_rh_histformacao PRIMARY KEY (idfuncionario, idformacao);


--
-- TOC entry 2811 (class 2606 OID 89908)
-- Dependencies: 2030 2030 2030 2030 2030
-- Name: pk_rh_histpensionista; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_histpensionista
    ADD CONSTRAINT pk_rh_histpensionista PRIMARY KEY (idvinculo, idpensionista, tipopensao, datainicio);


--
-- TOC entry 2813 (class 2606 OID 89910)
-- Dependencies: 2031 2031
-- Name: pk_rh_histtitulacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_histtitulacao
    ADD CONSTRAINT pk_rh_histtitulacao PRIMARY KEY (idhisttitulacao);


--
-- TOC entry 2815 (class 2606 OID 89912)
-- Dependencies: 2032 2032 2032 2032
-- Name: pk_rh_histvantagem; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_histvantagem
    ADD CONSTRAINT pk_rh_histvantagem PRIMARY KEY (idvantagem, idvinculo, datainicio);


--
-- TOC entry 2817 (class 2606 OID 89914)
-- Dependencies: 2033 2033
-- Name: pk_rh_jornada; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_jornada
    ADD CONSTRAINT pk_rh_jornada PRIMARY KEY (idjornada);


--
-- TOC entry 2819 (class 2606 OID 89916)
-- Dependencies: 2034 2034 2034
-- Name: pk_rh_licafast; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_licafast
    ADD CONSTRAINT pk_rh_licafast PRIMARY KEY (idvinculo, datainicio);


--
-- TOC entry 2821 (class 2606 OID 89918)
-- Dependencies: 2035 2035 2035
-- Name: pk_rh_ocorrencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_ocorrencia
    ADD CONSTRAINT pk_rh_ocorrencia PRIMARY KEY (idgrupoocorrencia, idocorrencia);


--
-- TOC entry 2823 (class 2606 OID 89920)
-- Dependencies: 2036 2036 2036
-- Name: pk_rh_ocupacaovaga; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_ocupacaovaga
    ADD CONSTRAINT pk_rh_ocupacaovaga PRIMARY KEY (idvinculo, numerovaga);


--
-- TOC entry 2825 (class 2606 OID 89922)
-- Dependencies: 2037 2037 2037
-- Name: pk_rh_pensionista; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_pensionista
    ADD CONSTRAINT pk_rh_pensionista PRIMARY KEY (idvinculo, idpensionista);


--
-- TOC entry 2827 (class 2606 OID 89924)
-- Dependencies: 2038 2038 2038
-- Name: pk_rh_periodoaquisitivo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_periodoaquisitivo
    ADD CONSTRAINT pk_rh_periodoaquisitivo PRIMARY KEY (idvinculo, datainicio);


--
-- TOC entry 2829 (class 2606 OID 89926)
-- Dependencies: 2039 2039 2039
-- Name: pk_rh_provimento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT pk_rh_provimento PRIMARY KEY (idvinculo, datainicio);


--
-- TOC entry 2831 (class 2606 OID 89928)
-- Dependencies: 2040 2040
-- Name: pk_rh_publicacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_publicacao
    ADD CONSTRAINT pk_rh_publicacao PRIMARY KEY (idpublicacao);


--
-- TOC entry 2833 (class 2606 OID 89930)
-- Dependencies: 2041 2041 2041
-- Name: pk_rh_referencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_referencia
    ADD CONSTRAINT pk_rh_referencia PRIMARY KEY (idclasse, idreferencia);


--
-- TOC entry 2835 (class 2606 OID 89932)
-- Dependencies: 2042 2042
-- Name: pk_rh_situacaofuncional; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_situacaofuncional
    ADD CONSTRAINT pk_rh_situacaofuncional PRIMARY KEY (idsituacao);


--
-- TOC entry 2837 (class 2606 OID 89934)
-- Dependencies: 2043 2043 2043 2043
-- Name: pk_rh_situacaoocorrencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_situacaoocorrencia
    ADD CONSTRAINT pk_rh_situacaoocorrencia PRIMARY KEY (idsituacao, idgrupoocorrencia, idocorrencia);


--
-- TOC entry 2839 (class 2606 OID 89936)
-- Dependencies: 2044 2044 2044
-- Name: pk_rh_substituicao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_substituicao
    ADD CONSTRAINT pk_rh_substituicao PRIMARY KEY (idvinculo, datainicio);


--
-- TOC entry 2841 (class 2606 OID 89938)
-- Dependencies: 2045 2045
-- Name: pk_rh_tipolicafast; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_tipolicafast
    ADD CONSTRAINT pk_rh_tipolicafast PRIMARY KEY (idtipolicafast);


--
-- TOC entry 2843 (class 2606 OID 89940)
-- Dependencies: 2046 2046
-- Name: pk_rh_vaga; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_vaga
    ADD CONSTRAINT pk_rh_vaga PRIMARY KEY (numerovaga);


--
-- TOC entry 2845 (class 2606 OID 89942)
-- Dependencies: 2047 2047
-- Name: pk_rh_vantagem; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_vantagem
    ADD CONSTRAINT pk_rh_vantagem PRIMARY KEY (idvantagem);


--
-- TOC entry 2847 (class 2606 OID 89944)
-- Dependencies: 2048 2048
-- Name: pk_rh_vinculo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_vinculo
    ADD CONSTRAINT pk_rh_vinculo PRIMARY KEY (idvinculo);


--
-- TOC entry 2859 (class 2606 OID 96173)
-- Dependencies: 2134 2134
-- Name: rh_classegrupocargo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_classegrupocargo
    ADD CONSTRAINT rh_classegrupocargo_pkey PRIMARY KEY (idclassegrupocargo);


--
-- TOC entry 2625 (class 2606 OID 89946)
-- Dependencies: 1947 1947
-- Name: sys_c006134; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_novomaterial
    ADD CONSTRAINT sys_c006134 PRIMARY KEY (idnovomaterial);


--
-- TOC entry 2415 (class 1259 OID 89947)
-- Dependencies: 1895
-- Name: idx_ad_acessobolsa1_ad_bo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_acessobolsa1_ad_bo ON ad_acessobolsa USING btree (idbolsa);


--
-- TOC entry 2416 (class 1259 OID 89948)
-- Dependencies: 1895
-- Name: idx_ad_acessobolsa2_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_acessobolsa2_cm_us ON ad_acessobolsa USING btree (idusuario);


--
-- TOC entry 2419 (class 1259 OID 89949)
-- Dependencies: 1896
-- Name: idx_ad_acessouoreq1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_acessouoreq1_ad_uo ON ad_acessouoreq USING btree (iduo);


--
-- TOC entry 2420 (class 1259 OID 89950)
-- Dependencies: 1896
-- Name: idx_ad_acessouoreq2_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_acessouoreq2_cm_us ON ad_acessouoreq USING btree (idusuario);


--
-- TOC entry 2427 (class 1259 OID 89951)
-- Dependencies: 1899
-- Name: idx_ad_bolsista1_ad_bo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_bolsista1_ad_bo ON ad_bolsista USING btree (idbolsa);


--
-- TOC entry 2428 (class 1259 OID 89952)
-- Dependencies: 1899
-- Name: idx_ad_bolsista2_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_bolsista2_cm_pe ON ad_bolsista USING btree (idpessoa);


--
-- TOC entry 2437 (class 1259 OID 89953)
-- Dependencies: 1904
-- Name: idx_ad_dependencia1_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_dependencia1_cm_se ON ad_dependencia USING btree (idsetor);


--
-- TOC entry 2444 (class 1259 OID 89954)
-- Dependencies: 1907
-- Name: idx_ad_empenhado1_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenhado1_ad_em ON ad_empenhado USING btree (idempenho);


--
-- TOC entry 2445 (class 1259 OID 89955)
-- Dependencies: 1907 1907
-- Name: idx_ad_empenhado2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenhado2_ad_it ON ad_empenhado USING btree (idlicitacao, item);


--
-- TOC entry 2450 (class 1259 OID 89956)
-- Dependencies: 1909
-- Name: idx_ad_empenho; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_ad_empenho ON ad_empenho USING btree (numero);


--
-- TOC entry 2451 (class 1259 OID 89957)
-- Dependencies: 1909
-- Name: idx_ad_empenho1_ad_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenho1_ad_fo ON ad_empenho USING btree (idfornecedor);


--
-- TOC entry 2452 (class 1259 OID 89958)
-- Dependencies: 1909
-- Name: idx_ad_empenho3_ad_pr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenho3_ad_pr ON ad_empenho USING btree (numpro);


--
-- TOC entry 2453 (class 1259 OID 89959)
-- Dependencies: 1909
-- Name: idx_ad_empenho4_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenho4_ad_uo ON ad_empenho USING btree (iduo);


--
-- TOC entry 2454 (class 1259 OID 89960)
-- Dependencies: 1909
-- Name: idx_ad_empenho5_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenho5_ad_em ON ad_empenho USING btree (idempenhoref);


--
-- TOC entry 2459 (class 1259 OID 89961)
-- Dependencies: 1911
-- Name: idx_ad_estoque1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_estoque1_ad_uo ON ad_estoque USING btree (iduo);


--
-- TOC entry 2460 (class 1259 OID 89962)
-- Dependencies: 1911
-- Name: idx_ad_estoque2_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_estoque2_ad_ma ON ad_estoque USING btree (idmaterial);


--
-- TOC entry 2463 (class 1259 OID 89963)
-- Dependencies: 1912
-- Name: idx_ad_executa1_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executa1_ad_ru ON ad_executa USING btree (idrubrica);


--
-- TOC entry 2464 (class 1259 OID 89964)
-- Dependencies: 1912
-- Name: idx_ad_executa1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executa1_ad_uo ON ad_executa USING btree (iduo);


--
-- TOC entry 2465 (class 1259 OID 89965)
-- Dependencies: 1912
-- Name: idx_ad_executa2_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executa2_ad_ti ON ad_executa USING btree (idtiporeq);


--
-- TOC entry 2468 (class 1259 OID 89966)
-- Dependencies: 1913
-- Name: idx_ad_executor1_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executor1_cm_us ON ad_executor USING btree (idusuario);


--
-- TOC entry 2469 (class 1259 OID 89967)
-- Dependencies: 1913
-- Name: idx_ad_executor2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executor2_ad_uo ON ad_executor USING btree (iduo);


--
-- TOC entry 2472 (class 1259 OID 89968)
-- Dependencies: 1914
-- Name: idx_ad_executoralmox1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executoralmox1_ad_uo ON ad_executoralmox USING btree (iduoexecutante);


--
-- TOC entry 2473 (class 1259 OID 89969)
-- Dependencies: 1914
-- Name: idx_ad_executoralmox2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executoralmox2_ad_uo ON ad_executoralmox USING btree (iduorequisitante);


--
-- TOC entry 2476 (class 1259 OID 89970)
-- Dependencies: 1915
-- Name: idx_ad_executorservint1_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executorservint1_ad_ti ON ad_executorservint USING btree (idtiposervint);


--
-- TOC entry 2477 (class 1259 OID 89971)
-- Dependencies: 1915
-- Name: idx_ad_executorservint2_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executorservint2_cm_us ON ad_executorservint USING btree (idusuario);


--
-- TOC entry 2482 (class 1259 OID 89972)
-- Dependencies: 1917
-- Name: idx_ad_fornecedor1_cm_in; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_fornecedor1_cm_in ON ad_fornecedor USING btree (idinstituicao);


--
-- TOC entry 2483 (class 1259 OID 89973)
-- Dependencies: 1917
-- Name: idx_ad_fornecedor2_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_fornecedor2_cm_pe ON ad_fornecedor USING btree (idpessoa);


--
-- TOC entry 2484 (class 1259 OID 89974)
-- Dependencies: 1917
-- Name: idx_ad_fornecedor3_cm_ag; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_fornecedor3_cm_ag ON ad_fornecedor USING btree (idagenc);


--
-- TOC entry 2487 (class 1259 OID 89975)
-- Dependencies: 1918
-- Name: idx_ad_fpotencial1_ad_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_fpotencial1_ad_fo ON ad_fpotencial USING btree (idfornecedor);


--
-- TOC entry 2488 (class 1259 OID 89976)
-- Dependencies: 1918
-- Name: idx_ad_fpotencial2_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_fpotencial2_ad_ma ON ad_fpotencial USING btree (idmaterial);


--
-- TOC entry 2491 (class 1259 OID 89977)
-- Dependencies: 1919
-- Name: idx_ad_funcionarioresp1_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_funcionarioresp1_cm_se ON ad_funcionarioresp USING btree (idsetor);


--
-- TOC entry 2492 (class 1259 OID 89978)
-- Dependencies: 1919
-- Name: idx_ad_funcionarioresp2_rh_fu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_funcionarioresp2_rh_fu ON ad_funcionarioresp USING btree (idfunc);


--
-- TOC entry 2495 (class 1259 OID 89979)
-- Dependencies: 1920
-- Name: idx_ad_gestor1_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_gestor1_cm_us ON ad_gestor USING btree (idusuario);


--
-- TOC entry 2496 (class 1259 OID 89980)
-- Dependencies: 1920
-- Name: idx_ad_gestor2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_gestor2_ad_uo ON ad_gestor USING btree (iduo);


--
-- TOC entry 2501 (class 1259 OID 89981)
-- Dependencies: 1922
-- Name: idx_ad_itemlicitacao1_ad_li; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemlicitacao1_ad_li ON ad_itemlicitacao USING btree (idlicitacao);


--
-- TOC entry 2504 (class 1259 OID 89982)
-- Dependencies: 1923
-- Name: idx_ad_itemnota1_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemnota1_ad_em ON ad_itemnota USING btree (idempenhado);


--
-- TOC entry 2505 (class 1259 OID 89983)
-- Dependencies: 1923
-- Name: idx_ad_itemnota2_ad_no; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemnota2_ad_no ON ad_itemnota USING btree (idnotafiscal);


--
-- TOC entry 2508 (class 1259 OID 89984)
-- Dependencies: 1924
-- Name: idx_ad_itempatrimo1_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimo1_ad_ma ON ad_itempatrimo USING btree (idmaterial);


--
-- TOC entry 2509 (class 1259 OID 89985)
-- Dependencies: 1924
-- Name: idx_ad_itempatrimo2_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimo2_cm_se ON ad_itempatrimo USING btree (idsetor);


--
-- TOC entry 2512 (class 1259 OID 89986)
-- Dependencies: 1925
-- Name: idx_ad_itempatrimonio1_ad_de; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio1_ad_de ON ad_itempatrimonio USING btree (iddependencia);


--
-- TOC entry 2513 (class 1259 OID 89987)
-- Dependencies: 1925
-- Name: idx_ad_itempatrimonio2_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio2_ad_ma ON ad_itempatrimonio USING btree (idmaterial);


--
-- TOC entry 2514 (class 1259 OID 89988)
-- Dependencies: 1925
-- Name: idx_ad_itempatrimonio3_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio3_cm_se ON ad_itempatrimonio USING btree (idsetor);


--
-- TOC entry 2515 (class 1259 OID 89989)
-- Dependencies: 1925
-- Name: idx_ad_itempatrimonio4_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio4_ad_em ON ad_itempatrimonio USING btree (idempenhado);


--
-- TOC entry 2516 (class 1259 OID 89990)
-- Dependencies: 1925
-- Name: idx_ad_itempatrimonio5_ad_cl; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio5_ad_cl ON ad_itempatrimonio USING btree (idclassificador);


--
-- TOC entry 2517 (class 1259 OID 89991)
-- Dependencies: 1925
-- Name: idx_ad_itempatrimonio6_proce; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio6_proce ON ad_itempatrimonio USING btree (numpro);


--
-- TOC entry 2520 (class 1259 OID 89992)
-- Dependencies: 1926
-- Name: idx_ad_itemreq1_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreq1_ad_ma ON ad_itemreq USING btree (idmaterial);


--
-- TOC entry 2521 (class 1259 OID 89993)
-- Dependencies: 1926
-- Name: idx_ad_itemreq2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreq2_ad_re ON ad_itemreq USING btree (idrequisicao);


--
-- TOC entry 2522 (class 1259 OID 89994)
-- Dependencies: 1926 1926
-- Name: idx_ad_itemreq3_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreq3_ad_it ON ad_itemreq USING btree (idlicitacao, item);

--
-- TOC entry 2197 (class 1259 OID 37423)
-- Dependencies: 1828
-- Name: idx_ad_itemreqbib1_ad_ma; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_ad_itemreqbib1_ad_ma ON ad_itemreqbib USING btree (idmaterial);


--
-- TOC entry 2198 (class 1259 OID 37424)
-- Dependencies: 1828
-- Name: idx_ad_itemreqbib2_ad_re; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_ad_itemreqbib2_ad_re ON ad_itemreqbib USING btree (idrequisicao);


--
-- TOC entry 2199 (class 1259 OID 37425)
-- Dependencies: 1828 1828
-- Name: idx_ad_itemreqbib3_ad_it; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_ad_itemreqbib3_ad_it ON ad_itemreqbib USING btree (idlicitacao, item);


--
-- TOC entry 2525 (class 1259 OID 89995)
-- Dependencies: 1927
-- Name: idx_ad_itemreqdiaria1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria1_rh_vi ON ad_itemreqdiaria USING btree (idvinculo);


--
-- TOC entry 2526 (class 1259 OID 89996)
-- Dependencies: 1927
-- Name: idx_ad_itemreqdiaria2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria2_ad_re ON ad_itemreqdiaria USING btree (idrequisicao);


--
-- TOC entry 2527 (class 1259 OID 89997)
-- Dependencies: 1927
-- Name: idx_ad_itemreqdiaria2_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria2_rh_vi ON ad_itemreqdiaria USING btree (idvinculoprop);


--
-- TOC entry 2528 (class 1259 OID 89998)
-- Dependencies: 1927
-- Name: idx_ad_itemreqdiaria3_ad_pr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria3_ad_pr ON ad_itemreqdiaria USING btree (numpro);


--
-- TOC entry 2529 (class 1259 OID 89999)
-- Dependencies: 1927
-- Name: idx_ad_itemreqdiaria4_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria4_rh_vi ON ad_itemreqdiaria USING btree (idvinculochefe);


--
-- TOC entry 2532 (class 1259 OID 90000)
-- Dependencies: 1928
-- Name: idx_ad_itemreqhotel1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel1_cm_pe ON ad_itemreqhotel USING btree (idpessoa);


--
-- TOC entry 2533 (class 1259 OID 90001)
-- Dependencies: 1928
-- Name: idx_ad_itemreqhotel2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel2_ad_re ON ad_itemreqhotel USING btree (idrequisicao);


--
-- TOC entry 2534 (class 1259 OID 90002)
-- Dependencies: 1928
-- Name: idx_ad_itemreqhotel3_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel3_ad_em ON ad_itemreqhotel USING btree (idempenho);


--
-- TOC entry 2535 (class 1259 OID 90003)
-- Dependencies: 1928
-- Name: idx_ad_itemreqhotel4_ad_ho; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel4_ad_ho ON ad_itemreqhotel USING btree (idhotelpref);


--
-- TOC entry 2538 (class 1259 OID 90004)
-- Dependencies: 1929
-- Name: idx_ad_itemreqpassagem1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem1_cm_pe ON ad_itemreqpassagem USING btree (idpessoa);


--
-- TOC entry 2539 (class 1259 OID 90005)
-- Dependencies: 1929
-- Name: idx_ad_itemreqpassagem2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem2_ad_re ON ad_itemreqpassagem USING btree (idrequisicao);


--
-- TOC entry 2540 (class 1259 OID 90006)
-- Dependencies: 1929
-- Name: idx_ad_itemreqpassagem3_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem3_ad_em ON ad_itemreqpassagem USING btree (idempenho);


--
-- TOC entry 2541 (class 1259 OID 90007)
-- Dependencies: 1929
-- Name: idx_ad_itemreqpassagem4_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem4_cm_mu ON ad_itemreqpassagem USING btree (idmunicipioorigem);


--
-- TOC entry 2542 (class 1259 OID 90008)
-- Dependencies: 1929
-- Name: idx_ad_itemreqpassagem5_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem5_cm_mu ON ad_itemreqpassagem USING btree (idmunicipiodestino);


--
-- TOC entry 2543 (class 1259 OID 90009)
-- Dependencies: 1929
-- Name: idx_ad_itemreqpassagem7_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem7_ad_em ON ad_itemreqpassagem USING btree (idempresapassagem);


--
-- TOC entry 2546 (class 1259 OID 90010)
-- Dependencies: 1930
-- Name: idx_ad_itemreqrest1_cm_p; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest1_cm_p ON ad_itemreqrestaurante USING btree (idpessoa);


--
-- TOC entry 2547 (class 1259 OID 90011)
-- Dependencies: 1930
-- Name: idx_ad_itemreqrest2_ad_r; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest2_ad_r ON ad_itemreqrestaurante USING btree (idrequisicao);


--
-- TOC entry 2548 (class 1259 OID 90012)
-- Dependencies: 1930
-- Name: idx_ad_itemreqrest3_ad_e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest3_ad_e ON ad_itemreqrestaurante USING btree (idempenho);


--
-- TOC entry 2549 (class 1259 OID 90013)
-- Dependencies: 1930
-- Name: idx_ad_itemreqrest4_cm_p; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest4_cm_p ON ad_itemreqrestaurante USING btree (idpessoaacompanhante);


--
-- TOC entry 2550 (class 1259 OID 90014)
-- Dependencies: 1930
-- Name: idx_ad_itemreqrest5_ad_r; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest5_ad_r ON ad_itemreqrestaurante USING btree (idrestaurantepref);


--
-- TOC entry 2553 (class 1259 OID 90015)
-- Dependencies: 1931
-- Name: idx_ad_itemreqservext1_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservext1_ad_re ON ad_itemreqservext USING btree (idrequisicao);


--
-- TOC entry 2554 (class 1259 OID 90016)
-- Dependencies: 1931 1931
-- Name: idx_ad_itemreqservext2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservext2_ad_it ON ad_itemreqservext USING btree (idlicitacao, item);


--
-- TOC entry 2557 (class 1259 OID 90017)
-- Dependencies: 1932
-- Name: idx_ad_itemreqservint1_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservint1_ad_ti ON ad_itemreqservint USING btree (idtiposervint);


--
-- TOC entry 2558 (class 1259 OID 90018)
-- Dependencies: 1932
-- Name: idx_ad_itemreqservint2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservint2_ad_re ON ad_itemreqservint USING btree (idrequisicao);


--
-- TOC entry 2561 (class 1259 OID 90019)
-- Dependencies: 1933
-- Name: idx_ad_itemreqservpf1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservpf1_cm_pe ON ad_itemreqservpf USING btree (idpessoa);


--
-- TOC entry 2562 (class 1259 OID 90020)
-- Dependencies: 1933
-- Name: idx_ad_itemreqservpf2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservpf2_ad_re ON ad_itemreqservpf USING btree (idrequisicao);


--
-- TOC entry 2563 (class 1259 OID 90021)
-- Dependencies: 1933
-- Name: idx_ad_itemreqservpf3_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservpf3_ad_em ON ad_itemreqservpf USING btree (idempenho);


--
-- TOC entry 2566 (class 1259 OID 90022)
-- Dependencies: 1934
-- Name: idx_ad_itemreqveiculo1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo1_cm_pe ON ad_itemreqveiculo USING btree (idpessoa);


--
-- TOC entry 2567 (class 1259 OID 90023)
-- Dependencies: 1934
-- Name: idx_ad_itemreqveiculo2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo2_ad_re ON ad_itemreqveiculo USING btree (idrequisicao);


--
-- TOC entry 2568 (class 1259 OID 90024)
-- Dependencies: 1934
-- Name: idx_ad_itemreqveiculo3_ad_ve; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo3_ad_ve ON ad_itemreqveiculo USING btree (placa);


--
-- TOC entry 2569 (class 1259 OID 90025)
-- Dependencies: 1934
-- Name: idx_ad_itemreqveiculo4_ad_mo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo4_ad_mo ON ad_itemreqveiculo USING btree (idmotorista);


--
-- TOC entry 2570 (class 1259 OID 90026)
-- Dependencies: 1934
-- Name: idx_ad_itemreqveiculo5_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo5_cm_mu ON ad_itemreqveiculo USING btree (idmunicipiodestino);


--
-- TOC entry 2571 (class 1259 OID 90027)
-- Dependencies: 1934
-- Name: idx_ad_itemreqveiculo6_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo6_cm_mu ON ad_itemreqveiculo USING btree (idmunicipioorigem);


--
-- TOC entry 2572 (class 1259 OID 90028)
-- Dependencies: 1934
-- Name: idx_ad_itemreqveiculo7_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo7_ad_ti ON ad_itemreqveiculo USING btree (tipoveiculo);


--
-- TOC entry 2575 (class 1259 OID 90029)
-- Dependencies: 1935
-- Name: idx_ad_lancamentoint1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint1_ad_uo ON ad_lancamentoint USING btree (iduoreq);


--
-- TOC entry 2576 (class 1259 OID 90030)
-- Dependencies: 1935
-- Name: idx_ad_lancamentoint2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint2_ad_uo ON ad_lancamentoint USING btree (iduoexec);


--
-- TOC entry 2577 (class 1259 OID 90031)
-- Dependencies: 1935
-- Name: idx_ad_lancamentoint3_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint3_ad_ru ON ad_lancamentoint USING btree (idrubrica);


--
-- TOC entry 2578 (class 1259 OID 90032)
-- Dependencies: 1935
-- Name: idx_ad_lancamentoint4_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint4_ad_re ON ad_lancamentoint USING btree (idrequisicao);


--
-- TOC entry 2581 (class 1259 OID 90033)
-- Dependencies: 1936
-- Name: idx_ad_licitacao1_ad_mo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_licitacao1_ad_mo ON ad_licitacao USING btree (idmodalidadelicitacao);


--
-- TOC entry 2582 (class 1259 OID 90034)
-- Dependencies: 1936
-- Name: idx_ad_licitacao2_ad_pr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_licitacao2_ad_pr ON ad_licitacao USING btree (numpro);


--
-- TOC entry 2587 (class 1259 OID 90035)
-- Dependencies: 1938
-- Name: idx_ad_localidadediaria1_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_localidadediaria1_cm_mu ON ad_localidadediaria USING btree (idmunicipio);


--
-- TOC entry 2588 (class 1259 OID 90036)
-- Dependencies: 1938 1938
-- Name: idx_ad_localidadediaria2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_localidadediaria2_ad_it ON ad_localidadediaria USING btree (idrequisicao, idvinculo);


--
-- TOC entry 2591 (class 1259 OID 90037)
-- Dependencies: 1939
-- Name: idx_ad_mapalicitacao1_ad_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_mapalicitacao1_ad_fo ON ad_mapalicitacao USING btree (idfornecedor);


--
-- TOC entry 2592 (class 1259 OID 90038)
-- Dependencies: 1939 1939
-- Name: idx_ad_mapalicitacao2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_mapalicitacao2_ad_it ON ad_mapalicitacao USING btree (idlicitacao, item);


--
-- TOC entry 2595 (class 1259 OID 90039)
-- Dependencies: 1940
-- Name: idx_ad_material1_ad_ca; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_material1_ad_ca ON ad_material USING btree (codmaterial);


--
-- TOC entry 2596 (class 1259 OID 90040)
-- Dependencies: 1940 1940
-- Name: idx_ad_material2_ad_su; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_material2_ad_su ON ad_material USING btree (idelemento, idsubelemento);


--
-- TOC entry 2601 (class 1259 OID 90041)
-- Dependencies: 1942
-- Name: idx_ad_motorista1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_motorista1_cm_pe ON ad_motorista USING btree (idpessoa);


--
-- TOC entry 2604 (class 1259 OID 90042)
-- Dependencies: 1943
-- Name: idx_ad_movimento1_ad_mo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimento1_ad_mo ON ad_movimento USING btree (iditemnota);


--
-- TOC entry 2605 (class 1259 OID 90043)
-- Dependencies: 1943
-- Name: idx_ad_movimento1_ad_or; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimento1_ad_or ON ad_movimento USING btree (idordement);


--
-- TOC entry 2606 (class 1259 OID 90044)
-- Dependencies: 1943 1943
-- Name: idx_ad_movimento2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimento2_ad_it ON ad_movimento USING btree (idrequisicao, idmaterial);


--
-- TOC entry 2609 (class 1259 OID 90045)
-- Dependencies: 1944
-- Name: idx_ad_movimentopat1_ad_de; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat1_ad_de ON ad_movimentopat USING btree (iddependenciaorigem);


--
-- TOC entry 2610 (class 1259 OID 90046)
-- Dependencies: 1944
-- Name: idx_ad_movimentopat2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat2_ad_it ON ad_movimentopat USING btree (iditempatrimonio);


--
-- TOC entry 2611 (class 1259 OID 90047)
-- Dependencies: 1944
-- Name: idx_ad_movimentopat3_ad_de; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat3_ad_de ON ad_movimentopat USING btree (iddependenciadestino);


--
-- TOC entry 2612 (class 1259 OID 90048)
-- Dependencies: 1944
-- Name: idx_ad_movimentopat4_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat4_cm_se ON ad_movimentopat USING btree (idsetororigem);


--
-- TOC entry 2613 (class 1259 OID 90049)
-- Dependencies: 1944
-- Name: idx_ad_movimentopat5_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat5_cm_se ON ad_movimentopat USING btree (idsetordestino);


--
-- TOC entry 2618 (class 1259 OID 90050)
-- Dependencies: 1946
-- Name: idx_ad_notafiscal1_ad_li; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_notafiscal1_ad_li ON ad_notafiscal USING btree (idliquidacao);


--
-- TOC entry 2619 (class 1259 OID 90051)
-- Dependencies: 1946
-- Name: idx_ad_notafiscal2_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_notafiscal2_ad_em ON ad_notafiscal USING btree (idempenho);


--
-- TOC entry 2622 (class 1259 OID 90052)
-- Dependencies: 1947
-- Name: idx_ad_novomaterial1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_novomaterial1_ad_uo ON ad_novomaterial USING btree (iduoreq);


--
-- TOC entry 2623 (class 1259 OID 90053)
-- Dependencies: 1947
-- Name: idx_ad_novomaterial2_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_novomaterial2_cm_us ON ad_novomaterial USING btree (idusuario);


--
-- TOC entry 2626 (class 1259 OID 90054)
-- Dependencies: 1948
-- Name: idx_ad_orcamento1_ad_pt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamento1_ad_pt ON ad_orcamento USING btree (idptr);


--
-- TOC entry 2627 (class 1259 OID 90055)
-- Dependencies: 1948
-- Name: idx_ad_orcamento2_ad_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamento2_ad_fo ON ad_orcamento USING btree (idfonte);


--
-- TOC entry 2628 (class 1259 OID 90056)
-- Dependencies: 1948
-- Name: idx_ad_orcamento3_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamento3_ad_ru ON ad_orcamento USING btree (idrubrica);


--
-- TOC entry 2631 (class 1259 OID 90057)
-- Dependencies: 1949
-- Name: idx_ad_orcamentohist1_ad_or; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamentohist1_ad_or ON ad_orcamentohist USING btree (idorcamento);


--
-- TOC entry 2634 (class 1259 OID 90058)
-- Dependencies: 1950
-- Name: idx_ad_orcamentointerno1_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamentointerno1_ad_ru ON ad_orcamentointerno USING btree (idrubrica);


--
-- TOC entry 2635 (class 1259 OID 90059)
-- Dependencies: 1950
-- Name: idx_ad_orcamentointerno2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamentointerno2_ad_uo ON ad_orcamentointerno USING btree (iduo);


--
-- TOC entry 2638 (class 1259 OID 90060)
-- Dependencies: 1951
-- Name: idx_ad_ordembancaria1_ad_li; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_ordembancaria1_ad_li ON ad_ordembancaria USING btree (idliquidacao);


--
-- TOC entry 2641 (class 1259 OID 90061)
-- Dependencies: 1952
-- Name: idx_ad_ordentrega1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_ordentrega1_ad_uo ON ad_ordentrega USING btree (iduoexec);


--
-- TOC entry 2644 (class 1259 OID 90062)
-- Dependencies: 1953
-- Name: idx_ad_pagbolsa1_ad_bo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_pagbolsa1_ad_bo ON ad_pagbolsa USING btree (idbolsista);


--
-- TOC entry 2647 (class 1259 OID 90063)
-- Dependencies: 1954
-- Name: idx_ad_paiempenho1_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_paiempenho1_ad_em ON ad_paiempenho USING btree (idempenhopai);


--
-- TOC entry 2648 (class 1259 OID 90064)
-- Dependencies: 1954
-- Name: idx_ad_paiempenho2_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_paiempenho2_ad_em ON ad_paiempenho USING btree (idempenho);


--
-- TOC entry 2657 (class 1259 OID 90065)
-- Dependencies: 1959
-- Name: idx_ad_requisicao2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisicao2_ad_uo ON ad_requisicao USING btree (iduoreq);


--
-- TOC entry 2658 (class 1259 OID 90066)
-- Dependencies: 1959
-- Name: idx_ad_requisicao3_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisicao3_ad_uo ON ad_requisicao USING btree (iduoexec);


--
-- TOC entry 2659 (class 1259 OID 90067)
-- Dependencies: 1959
-- Name: idx_ad_requisicao4_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisicao4_cm_us ON ad_requisicao USING btree (idusuarioreq);


--
-- TOC entry 2662 (class 1259 OID 90068)
-- Dependencies: 1960
-- Name: idx_ad_requisita1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisita1_ad_uo ON ad_requisita USING btree (iduo);


--
-- TOC entry 2663 (class 1259 OID 90069)
-- Dependencies: 1960
-- Name: idx_ad_requisita2_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisita2_ad_ti ON ad_requisita USING btree (idtiporeq);


--
-- TOC entry 2664 (class 1259 OID 90070)
-- Dependencies: 1960
-- Name: idx_ad_requisita3_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisita3_ad_ru ON ad_requisita USING btree (idrubrica);


--
-- TOC entry 2673 (class 1259 OID 90071)
-- Dependencies: 1964
-- Name: idx_ad_saldolic1_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_saldolic1_ad_ma ON ad_saldolic USING btree (idmaterial);


--
-- TOC entry 2674 (class 1259 OID 90072)
-- Dependencies: 1964
-- Name: idx_ad_saldolic2_ad_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_saldolic2_ad_fo ON ad_saldolic USING btree (idfornecedor);


--
-- TOC entry 2677 (class 1259 OID 90073)
-- Dependencies: 1965 1965
-- Name: idx_ad_servico1_ad_su; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_servico1_ad_su ON ad_servico USING btree (idelemento, idsubelemento);


--
-- TOC entry 2684 (class 1259 OID 90074)
-- Dependencies: 1969
-- Name: idx_ad_subelemento1_ad_el; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_subelemento1_ad_el ON ad_subelemento USING btree (idelemento);


--
-- TOC entry 2693 (class 1259 OID 90075)
-- Dependencies: 1973
-- Name: idx_ad_tiporeq1_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_tiporeq1_ad_ru ON ad_tiporeq USING btree (idrubrica);


--
-- TOC entry 2696 (class 1259 OID 90076)
-- Dependencies: 1974
-- Name: idx_ad_tiposervint1_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_tiposervint1_ad_ru ON ad_tiposervint USING btree (idrubrica);


--
-- TOC entry 2701 (class 1259 OID 90077)
-- Dependencies: 1976 1976
-- Name: idx_ad_trecho1_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_trecho1_ad_it ON ad_trecho USING btree (idrequisicao, idpessoa);


--
-- TOC entry 2704 (class 1259 OID 90078)
-- Dependencies: 1977
-- Name: idx_ad_uo1_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_uo1_cm_se ON ad_uo USING btree (idsetor);


--
-- TOC entry 2707 (class 1259 OID 90079)
-- Dependencies: 1978
-- Name: idx_ad_uoalmox1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_uoalmox1_ad_uo ON ad_uoalmox USING btree (iduoalmox);


--
-- TOC entry 2708 (class 1259 OID 90080)
-- Dependencies: 1978
-- Name: idx_ad_uoalmox2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_uoalmox2_ad_uo ON ad_uoalmox USING btree (iduoreq);


--
-- TOC entry 2713 (class 1259 OID 90081)
-- Dependencies: 1980
-- Name: idx_ad_veiculo1_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_veiculo1_ad_ti ON ad_veiculo USING btree (tipoveiculo);


--
-- TOC entry 2981 (class 2606 OID 96129)
-- Dependencies: 2671 1963 1958
-- Name: ad_reqrubrica_idrubrica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_reqrubrica
    ADD CONSTRAINT ad_reqrubrica_idrubrica_fkey FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- TOC entry 2980 (class 2606 OID 90087)
-- Dependencies: 2694 1958 1973
-- Name: ad_reqrubrica_idtiporeq_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_reqrubrica
    ADD CONSTRAINT ad_reqrubrica_idtiporeq_fkey FOREIGN KEY (idtiporeq) REFERENCES ad_tiporeq(idtiporeq);


--
-- TOC entry 2860 (class 2606 OID 90092)
-- Dependencies: 1898 2425 1895
-- Name: fk_ad_acessobolsa1_ad_bo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_acessobolsa
    ADD CONSTRAINT fk_ad_acessobolsa1_ad_bo FOREIGN KEY (idbolsa) REFERENCES ad_bolsa(idbolsa);


--
-- TOC entry 2861 (class 2606 OID 90097)
-- Dependencies: 2008 1895 2770
-- Name: fk_ad_acessobolsa2_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_acessobolsa
    ADD CONSTRAINT fk_ad_acessobolsa2_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- TOC entry 2862 (class 2606 OID 90102)
-- Dependencies: 1896 2705 1977
-- Name: fk_ad_acessouoreq1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_acessouoreq
    ADD CONSTRAINT fk_ad_acessouoreq1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);


--
-- TOC entry 2863 (class 2606 OID 90107)
-- Dependencies: 2770 2008 1896
-- Name: fk_ad_acessouoreq2_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_acessouoreq
    ADD CONSTRAINT fk_ad_acessouoreq2_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- TOC entry 2864 (class 2606 OID 90112)
-- Dependencies: 1956 1897 2651
-- Name: fk_ad_andamento1_ad_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_andamento
    ADD CONSTRAINT fk_ad_andamento1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro) ON DELETE CASCADE;


--
-- TOC entry 2865 (class 2606 OID 90117)
-- Dependencies: 1899 1898 2425
-- Name: fk_ad_bolsista1_ad_bo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_bolsista
    ADD CONSTRAINT fk_ad_bolsista1_ad_bo FOREIGN KEY (idbolsa) REFERENCES ad_bolsa(idbolsa);


--
-- TOC entry 2866 (class 2606 OID 90122)
-- Dependencies: 1997 2748 1899
-- Name: fk_ad_bolsista2_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_bolsista
    ADD CONSTRAINT fk_ad_bolsista2_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 2867 (class 2606 OID 90127)
-- Dependencies: 2754 1904 2000
-- Name: fk_ad_dependencia1_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_dependencia
    ADD CONSTRAINT fk_ad_dependencia1_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- TOC entry 2868 (class 2606 OID 90132)
-- Dependencies: 2455 1907 1909
-- Name: fk_ad_empenhado1_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT fk_ad_empenhado1_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- TOC entry 2869 (class 2606 OID 90137)
-- Dependencies: 1907 1948 2629
-- Name: fk_ad_empenhado2_ad_or; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT fk_ad_empenhado2_ad_or FOREIGN KEY (idorcamento) REFERENCES ad_orcamento(idorcamento);


--
-- TOC entry 2870 (class 2606 OID 90142)
-- Dependencies: 1907 1922 1922 1907 2502
-- Name: fk_ad_empenhado3_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT fk_ad_empenhado3_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- TOC entry 2871 (class 2606 OID 90147)
-- Dependencies: 1908 1907 2446
-- Name: fk_ad_empenhadodist_empenhadoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhadodist
    ADD CONSTRAINT fk_ad_empenhadodist_empenhadoid FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);


--
-- TOC entry 2872 (class 2606 OID 90152)
-- Dependencies: 1959 1908 2660
-- Name: fk_ad_empenhadodist_requisicaoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhadodist
    ADD CONSTRAINT fk_ad_empenhadodist_requisicaoid FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2873 (class 2606 OID 90157)
-- Dependencies: 1917 1909 2485
-- Name: fk_ad_empenho1_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho1_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);


--
-- TOC entry 2874 (class 2606 OID 90162)
-- Dependencies: 2651 1956 1909
-- Name: fk_ad_empenho1_ad_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);


--
-- TOC entry 2875 (class 2606 OID 90167)
-- Dependencies: 1977 1909 2705
-- Name: fk_ad_empenho1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);


--
-- TOC entry 2876 (class 2606 OID 90172)
-- Dependencies: 1909 1909 2455
-- Name: fk_ad_empenho2_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho2_ad_em FOREIGN KEY (idempenhoref) REFERENCES ad_empenho(idempenho);


--
-- TOC entry 2877 (class 2606 OID 90177)
-- Dependencies: 1940 2597 1911
-- Name: fk_ad_estoque2_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_estoque
    ADD CONSTRAINT fk_ad_estoque2_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- TOC entry 2878 (class 2606 OID 90182)
-- Dependencies: 1963 2671 1912
-- Name: fk_ad_executa1_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT fk_ad_executa1_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- TOC entry 2879 (class 2606 OID 90187)
-- Dependencies: 2705 1912 1977
-- Name: fk_ad_executa1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT fk_ad_executa1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);


--
-- TOC entry 2880 (class 2606 OID 90192)
-- Dependencies: 2694 1912 1973
-- Name: fk_ad_executa2_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT fk_ad_executa2_ad_ti FOREIGN KEY (idtiporeq) REFERENCES ad_tiporeq(idtiporeq);


--
-- TOC entry 2881 (class 2606 OID 90197)
-- Dependencies: 2705 1914 1977
-- Name: fk_ad_executoralmox1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executoralmox
    ADD CONSTRAINT fk_ad_executoralmox1_ad_uo FOREIGN KEY (iduorequisitante) REFERENCES ad_uo(iduo);


--
-- TOC entry 2882 (class 2606 OID 90202)
-- Dependencies: 1977 2705 1914
-- Name: fk_ad_executoralmox2_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executoralmox
    ADD CONSTRAINT fk_ad_executoralmox2_ad_uo FOREIGN KEY (iduoexecutante) REFERENCES ad_uo(iduo);


--
-- TOC entry 2883 (class 2606 OID 90207)
-- Dependencies: 1974 2697 1915
-- Name: fk_ad_executorservint1_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executorservint
    ADD CONSTRAINT fk_ad_executorservint1_ad_ti FOREIGN KEY (idtiposervint) REFERENCES ad_tiposervint(idtiposervint);


--
-- TOC entry 2884 (class 2606 OID 90212)
-- Dependencies: 1915 2770 2008
-- Name: fk_ad_executorservint1_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executorservint
    ADD CONSTRAINT fk_ad_executorservint1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- TOC entry 2885 (class 2606 OID 90217)
-- Dependencies: 1917 1991 2736
-- Name: fk_ad_fornecedor1_cm_in; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT fk_ad_fornecedor1_cm_in FOREIGN KEY (idinstituicao) REFERENCES cm_instituicao(idinstituicao);


--
-- TOC entry 2886 (class 2606 OID 90222)
-- Dependencies: 1997 2748 1917
-- Name: fk_ad_fornecedor2_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT fk_ad_fornecedor2_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 2887 (class 2606 OID 90227)
-- Dependencies: 1982 2718 1917 1917 1982
-- Name: fk_ad_fornecedor3_cm_ag; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT fk_ad_fornecedor3_cm_ag FOREIGN KEY (idbanco, idagenc) REFERENCES cm_agencia(idbanco, idagenc);


--
-- TOC entry 2888 (class 2606 OID 90232)
-- Dependencies: 1917 2485 1918
-- Name: fk_ad_fpotencial1_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_fpotencial
    ADD CONSTRAINT fk_ad_fpotencial1_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);


--
-- TOC entry 2889 (class 2606 OID 90237)
-- Dependencies: 1918 2597 1940
-- Name: fk_ad_fpotencial2_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_fpotencial
    ADD CONSTRAINT fk_ad_fpotencial2_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- TOC entry 2890 (class 2606 OID 90242)
-- Dependencies: 2754 2000 1919
-- Name: fk_ad_funcionarioresp0_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_funcionarioresp
    ADD CONSTRAINT fk_ad_funcionarioresp0_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- TOC entry 2891 (class 2606 OID 90247)
-- Dependencies: 2025 2800 1919
-- Name: fk_ad_funcionarioresp1_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_funcionarioresp
    ADD CONSTRAINT fk_ad_funcionarioresp1_rh_fu FOREIGN KEY (idfunc) REFERENCES rh_funcionario(idfuncionario);


--
-- TOC entry 2892 (class 2606 OID 90252)
-- Dependencies: 1922 2583 1936
-- Name: fk_ad_itemlicitacao1_ad_li; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemlicitacao
    ADD CONSTRAINT fk_ad_itemlicitacao1_ad_li FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);


--
-- TOC entry 2893 (class 2606 OID 90257)
-- Dependencies: 2446 1907 1923
-- Name: fk_ad_itemnota1_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemnota
    ADD CONSTRAINT fk_ad_itemnota1_ad_em FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);


--
-- TOC entry 2894 (class 2606 OID 90262)
-- Dependencies: 1923 1946 2620
-- Name: fk_ad_itemnota2_ad_no; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemnota
    ADD CONSTRAINT fk_ad_itemnota2_ad_no FOREIGN KEY (idnotafiscal) REFERENCES ad_notafiscal(idnotafiscal);


--
-- TOC entry 2895 (class 2606 OID 90267)
-- Dependencies: 1940 1924 2597
-- Name: fk_ad_itempatrimo1_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimo
    ADD CONSTRAINT fk_ad_itempatrimo1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- TOC entry 2896 (class 2606 OID 90272)
-- Dependencies: 2000 1924 2754
-- Name: fk_ad_itempatrimo2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimo
    ADD CONSTRAINT fk_ad_itempatrimo2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- TOC entry 2897 (class 2606 OID 90277)
-- Dependencies: 2438 1904 1925
-- Name: fk_ad_itempatrimonio1_ad_de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio1_ad_de FOREIGN KEY (iddependencia) REFERENCES ad_dependencia(iddependencia);


--
-- TOC entry 2898 (class 2606 OID 90282)
-- Dependencies: 1940 1925 2597
-- Name: fk_ad_itempatrimonio1_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- TOC entry 2899 (class 2606 OID 90287)
-- Dependencies: 2754 2000 1925
-- Name: fk_ad_itempatrimonio1_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio1_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- TOC entry 2900 (class 2606 OID 90292)
-- Dependencies: 2446 1925 1907
-- Name: fk_ad_itempatrimonio3_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio3_ad_em FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);


--
-- TOC entry 2901 (class 2606 OID 90297)
-- Dependencies: 2433 1901 1925
-- Name: fk_ad_itempatrimonio4_ad_cl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio4_ad_cl FOREIGN KEY (idclassificador) REFERENCES ad_classificador(idclassificador);


--
-- TOC entry 2902 (class 2606 OID 90302)
-- Dependencies: 2651 1956 1925
-- Name: fk_ad_itempatrimonio5_proce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio5_proce FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);


--
-- TOC entry 2903 (class 2606 OID 90307)
-- Dependencies: 1940 2597 1926
-- Name: fk_ad_itemreq1_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT fk_ad_itemreq1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- TOC entry 2904 (class 2606 OID 90312)
-- Dependencies: 2660 1926 1959
-- Name: fk_ad_itemreq2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT fk_ad_itemreq2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2905 (class 2606 OID 90317)
-- Dependencies: 1926 2502 1922 1922 1926
-- Name: fk_ad_itemreq4_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT fk_ad_itemreq4_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);

--
-- TOC entry 2202 (class 2606 OID 36958)
-- Dependencies: 1828 1627
-- Name: fk_ad_itemreqbib1_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ad_itemreqbib
    ADD CONSTRAINT fk_ad_itemreqbib1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- TOC entry 2203 (class 2606 OID 36963)
-- Dependencies: 1828 1646
-- Name: fk_ad_itemreqbib2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ad_itemreqbib
    ADD CONSTRAINT fk_ad_itemreqbib2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2204 (class 2606 OID 36968)
-- Dependencies: 1609 1609 1828 1828
-- Name: fk_ad_itemreqbib4_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ad_itemreqbib
    ADD CONSTRAINT fk_ad_itemreqbib4_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- TOC entry 2906 (class 2606 OID 90322)
-- Dependencies: 1927 2660 1959
-- Name: fk_ad_itemreqdiaria2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT fk_ad_itemreqdiaria2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2907 (class 2606 OID 90327)
-- Dependencies: 2048 1927 2846
-- Name: fk_ad_itemreqdiaria2_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT fk_ad_itemreqdiaria2_rh_vi FOREIGN KEY (idvinculoprop) REFERENCES rh_vinculo(idvinculo);


--
-- TOC entry 2908 (class 2606 OID 90332)
-- Dependencies: 1956 2651 1927
-- Name: fk_ad_itemreqdiaria5_ad_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT fk_ad_itemreqdiaria5_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);


--
-- TOC entry 2909 (class 2606 OID 90337)
-- Dependencies: 2846 2048 1927
-- Name: fk_ad_itemreqdiaria5_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT fk_ad_itemreqdiaria5_rh_vi FOREIGN KEY (idvinculochefe) REFERENCES rh_vinculo(idvinculo);


--
-- TOC entry 2910 (class 2606 OID 90342)
-- Dependencies: 1928 2748 1997
-- Name: fk_ad_itemreqhotel1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 2911 (class 2606 OID 90347)
-- Dependencies: 1928 1959 2660
-- Name: fk_ad_itemreqhotel2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2912 (class 2606 OID 90352)
-- Dependencies: 2455 1909 1928
-- Name: fk_ad_itemreqhotel3_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel3_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- TOC entry 2913 (class 2606 OID 90357)
-- Dependencies: 1928 1921 2499
-- Name: fk_ad_itemreqhotel4_ad_ho; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel4_ad_ho FOREIGN KEY (idhotelpref) REFERENCES ad_hotel(idhotel);


--
-- TOC entry 2914 (class 2606 OID 90362)
-- Dependencies: 1929 1997 2748
-- Name: fk_ad_itemreqpassagem1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 2915 (class 2606 OID 90367)
-- Dependencies: 1929 2660 1959
-- Name: fk_ad_itemreqpassagem2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2916 (class 2606 OID 90372)
-- Dependencies: 2455 1909 1929
-- Name: fk_ad_itemreqpassagem3_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem3_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- TOC entry 2917 (class 2606 OID 90377)
-- Dependencies: 1993 2740 1929
-- Name: fk_ad_itemreqpassagem4_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem4_cm_mu FOREIGN KEY (idmunicipioorigem) REFERENCES cm_municipio(idmunicipio);


--
-- TOC entry 2918 (class 2606 OID 90382)
-- Dependencies: 1929 2740 1993
-- Name: fk_ad_itemreqpassagem5_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem5_cm_mu FOREIGN KEY (idmunicipiodestino) REFERENCES cm_municipio(idmunicipio);


--
-- TOC entry 2919 (class 2606 OID 90387)
-- Dependencies: 1997 1930 2748
-- Name: fk_ad_itemreqrestaurante1_cm_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante1_cm_p FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 2920 (class 2606 OID 90392)
-- Dependencies: 1959 1930 2660
-- Name: fk_ad_itemreqrestaurante2_ad_r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante2_ad_r FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2921 (class 2606 OID 90397)
-- Dependencies: 1930 1909 2455
-- Name: fk_ad_itemreqrestaurante3_ad_e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante3_ad_e FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- TOC entry 2922 (class 2606 OID 90402)
-- Dependencies: 2748 1997 1930
-- Name: fk_ad_itemreqrestaurante4_cm_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante4_cm_p FOREIGN KEY (idpessoaacompanhante) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 2923 (class 2606 OID 90407)
-- Dependencies: 1930 2667 1961
-- Name: fk_ad_itemreqrestaurante5_ad_r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante5_ad_r FOREIGN KEY (idrestaurantepref) REFERENCES ad_restaurante(idrestaurante);


--
-- TOC entry 2924 (class 2606 OID 90412)
-- Dependencies: 1931 1959 2660
-- Name: fk_ad_itemreqservext1_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT fk_ad_itemreqservext1_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2925 (class 2606 OID 90417)
-- Dependencies: 1931 1965 2678
-- Name: fk_ad_itemreqservext1_ad_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT fk_ad_itemreqservext1_ad_se FOREIGN KEY (idservico) REFERENCES ad_servico(idservico);


--
-- TOC entry 2926 (class 2606 OID 90422)
-- Dependencies: 1922 1931 1931 1922 2502
-- Name: fk_ad_itemreqservext3_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT fk_ad_itemreqservext3_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- TOC entry 2927 (class 2606 OID 90427)
-- Dependencies: 1932 1974 2697
-- Name: fk_ad_itemreqservint1_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservint
    ADD CONSTRAINT fk_ad_itemreqservint1_ad_ti FOREIGN KEY (idtiposervint) REFERENCES ad_tiposervint(idtiposervint);


--
-- TOC entry 2928 (class 2606 OID 90432)
-- Dependencies: 1932 1959 2660
-- Name: fk_ad_itemreqservint2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservint
    ADD CONSTRAINT fk_ad_itemreqservint2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2929 (class 2606 OID 90437)
-- Dependencies: 1933 1997 2748
-- Name: fk_ad_itemreqservpf1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT fk_ad_itemreqservpf1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 2930 (class 2606 OID 90442)
-- Dependencies: 1933 1959 2660
-- Name: fk_ad_itemreqservpf2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT fk_ad_itemreqservpf2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2931 (class 2606 OID 90447)
-- Dependencies: 1933 1909 2455
-- Name: fk_ad_itemreqservpf3_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT fk_ad_itemreqservpf3_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- TOC entry 2932 (class 2606 OID 90452)
-- Dependencies: 1934 1997 2748
-- Name: fk_ad_itemreqveiculo1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 2933 (class 2606 OID 90457)
-- Dependencies: 1934 1959 2660
-- Name: fk_ad_itemreqveiculo2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2934 (class 2606 OID 90462)
-- Dependencies: 1934 1980 2714
-- Name: fk_ad_itemreqveiculo3_ad_ve; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo3_ad_ve FOREIGN KEY (placa) REFERENCES ad_veiculo(placa);


--
-- TOC entry 2935 (class 2606 OID 90467)
-- Dependencies: 1934 1942 2602
-- Name: fk_ad_itemreqveiculo4_ad_mo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo4_ad_mo FOREIGN KEY (idmotorista) REFERENCES ad_motorista(idmotorista);


--
-- TOC entry 2936 (class 2606 OID 90472)
-- Dependencies: 1934 1993 2740
-- Name: fk_ad_itemreqveiculo5_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo5_cm_mu FOREIGN KEY (idmunicipiodestino) REFERENCES cm_municipio(idmunicipio);


--
-- TOC entry 2937 (class 2606 OID 90477)
-- Dependencies: 1934 1993 2740
-- Name: fk_ad_itemreqveiculo6_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo6_cm_mu FOREIGN KEY (idmunicipioorigem) REFERENCES cm_municipio(idmunicipio);


--
-- TOC entry 2938 (class 2606 OID 90482)
-- Dependencies: 1934 1975 2699
-- Name: fk_ad_itemreqveiculo7_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo7_ad_ti FOREIGN KEY (tipoveiculo) REFERENCES ad_tipoveiculo(tipoveiculo);


--
-- TOC entry 2939 (class 2606 OID 90487)
-- Dependencies: 1935 1977 2705
-- Name: fk_ad_lancamentoint1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint1_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);


--
-- TOC entry 2940 (class 2606 OID 90492)
-- Dependencies: 1935 2008 2770
-- Name: fk_ad_lancamentoint1_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- TOC entry 2941 (class 2606 OID 90497)
-- Dependencies: 2705 1935 1977
-- Name: fk_ad_lancamentoint2_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint2_ad_uo FOREIGN KEY (iduoexec) REFERENCES ad_uo(iduo);


--
-- TOC entry 2942 (class 2606 OID 90502)
-- Dependencies: 1935 1963 2671
-- Name: fk_ad_lancamentoint3_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint3_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- TOC entry 2943 (class 2606 OID 90507)
-- Dependencies: 1935 1935 1922 1922 2502
-- Name: fk_ad_lancamentoint4_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint4_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- TOC entry 2944 (class 2606 OID 90512)
-- Dependencies: 1935 1959 2660
-- Name: fk_ad_lancamentoint4_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint4_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 2945 (class 2606 OID 90517)
-- Dependencies: 1936 1941 2599
-- Name: fk_ad_licitacao1_ad_mo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_licitacao
    ADD CONSTRAINT fk_ad_licitacao1_ad_mo FOREIGN KEY (idmodalidadelicitacao) REFERENCES ad_modalidadelicitacao(idmodalidadelicitacao);


--
-- TOC entry 2946 (class 2606 OID 90522)
-- Dependencies: 1936 1956 2651
-- Name: fk_ad_licitacao1_ad_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_licitacao
    ADD CONSTRAINT fk_ad_licitacao1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);


--
-- TOC entry 2947 (class 2606 OID 90527)
-- Dependencies: 1938 1993 2740
-- Name: fk_ad_localidadediaria1_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_localidadediaria
    ADD CONSTRAINT fk_ad_localidadediaria1_cm_mu FOREIGN KEY (idmunicipio) REFERENCES cm_municipio(idmunicipio);


--
-- TOC entry 2948 (class 2606 OID 90532)
-- Dependencies: 1938 1938 1927 1927 2530
-- Name: fk_ad_localidadediaria2_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_localidadediaria
    ADD CONSTRAINT fk_ad_localidadediaria2_ad_it FOREIGN KEY (idrequisicao, idvinculo) REFERENCES ad_itemreqdiaria(idrequisicao, idvinculo);


--
-- TOC entry 2949 (class 2606 OID 90537)
-- Dependencies: 1939 1917 2485
-- Name: fk_ad_mapalicitacao1_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_mapalicitacao
    ADD CONSTRAINT fk_ad_mapalicitacao1_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);


--
-- TOC entry 2950 (class 2606 OID 90542)
-- Dependencies: 1939 1939 1922 1922 2502
-- Name: fk_ad_mapalicitacao2_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_mapalicitacao
    ADD CONSTRAINT fk_ad_mapalicitacao2_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- TOC entry 2951 (class 2606 OID 90547)
-- Dependencies: 1940 1940 1969 1969 2685
-- Name: fk_ad_material2_ad_su; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_material
    ADD CONSTRAINT fk_ad_material2_ad_su FOREIGN KEY (idelemento, idsubelemento) REFERENCES ad_subelemento(idelemento, idsubelemento);


--
-- TOC entry 2952 (class 2606 OID 90552)
-- Dependencies: 1942 1997 2748
-- Name: fk_ad_motorista1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_motorista
    ADD CONSTRAINT fk_ad_motorista1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 2953 (class 2606 OID 90557)
-- Dependencies: 1943 1923 2506
-- Name: fk_ad_movimento1_ad_mo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento1_ad_mo FOREIGN KEY (iditemnota) REFERENCES ad_itemnota(iditemnota);


--
-- TOC entry 2954 (class 2606 OID 90562)
-- Dependencies: 1943 1952 2642
-- Name: fk_ad_movimento1_ad_or; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento1_ad_or FOREIGN KEY (idordement) REFERENCES ad_ordentrega(idordement);


--
-- TOC entry 2955 (class 2606 OID 90567)
-- Dependencies: 1943 1943 1926 1926 2523
-- Name: fk_ad_movimento2_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento2_ad_it FOREIGN KEY (idrequisicao, idmaterial) REFERENCES ad_itemreq(idrequisicao, idmaterial);


--
-- TOC entry 2956 (class 2606 OID 90572)
-- Dependencies: 1943 1943 2607
-- Name: fk_ad_movimento2_ad_mo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento2_ad_mo FOREIGN KEY (idmovimentoref) REFERENCES ad_movimento(idmovimento);


--
-- TOC entry 2957 (class 2606 OID 90577)
-- Dependencies: 1944 1904 2438
-- Name: fk_ad_movimentopat1_ad_de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat1_ad_de FOREIGN KEY (iddependenciaorigem) REFERENCES ad_dependencia(iddependencia);


--
-- TOC entry 2958 (class 2606 OID 90582)
-- Dependencies: 1944 1925 2518
-- Name: fk_ad_movimentopat1_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat1_ad_it FOREIGN KEY (iditempatrimonio) REFERENCES ad_itempatrimonio(iditempatrimonio);


--
-- TOC entry 2959 (class 2606 OID 90587)
-- Dependencies: 1944 1904 2438
-- Name: fk_ad_movimentopat2_ad_de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat2_ad_de FOREIGN KEY (iddependenciadestino) REFERENCES ad_dependencia(iddependencia);


--
-- TOC entry 2960 (class 2606 OID 90592)
-- Dependencies: 1944 2000 2754
-- Name: fk_ad_movimentopat2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat2_cm_se FOREIGN KEY (idsetororigem) REFERENCES cm_setor(idsetor);


--
-- TOC entry 2961 (class 2606 OID 90597)
-- Dependencies: 1944 2000 2754
-- Name: fk_ad_movimentopat3_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat3_cm_se FOREIGN KEY (idsetordestino) REFERENCES cm_setor(idsetor);


--
-- TOC entry 2962 (class 2606 OID 90602)
-- Dependencies: 1945 1923 2506
-- Name: fk_ad_movimentoserv_itemnota; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentoserv
    ADD CONSTRAINT fk_ad_movimentoserv_itemnota FOREIGN KEY (iditemnota) REFERENCES ad_itemnota(iditemnota);


--
-- TOC entry 2963 (class 2606 OID 90607)
-- Dependencies: 1946 1937 2585
-- Name: fk_ad_notafiscal1_ad_li; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_notafiscal
    ADD CONSTRAINT fk_ad_notafiscal1_ad_li FOREIGN KEY (idliquidacao) REFERENCES ad_liquidacao(idliquidacao);


--
-- TOC entry 2964 (class 2606 OID 90612)
-- Dependencies: 1946 1909 2455
-- Name: fk_ad_notafiscal2_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_notafiscal
    ADD CONSTRAINT fk_ad_notafiscal2_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- TOC entry 2965 (class 2606 OID 90617)
-- Dependencies: 1947 1977 2705
-- Name: fk_ad_novomaterial2_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_novomaterial
    ADD CONSTRAINT fk_ad_novomaterial2_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);


--
-- TOC entry 2966 (class 2606 OID 90622)
-- Dependencies: 1947 2008 2770
-- Name: fk_ad_novomaterial3_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_novomaterial
    ADD CONSTRAINT fk_ad_novomaterial3_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- TOC entry 2967 (class 2606 OID 90627)
-- Dependencies: 1948 1957 2653
-- Name: fk_ad_orcamento1_ad_pt; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT fk_ad_orcamento1_ad_pt FOREIGN KEY (idptr) REFERENCES ad_ptr(idptr);


--
-- TOC entry 2968 (class 2606 OID 90632)
-- Dependencies: 1948 1916 2480
-- Name: fk_ad_orcamento2_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT fk_ad_orcamento2_ad_fo FOREIGN KEY (idfonte) REFERENCES ad_fonte(idfonte);


--
-- TOC entry 2969 (class 2606 OID 90637)
-- Dependencies: 2671 1948 1963
-- Name: fk_ad_orcamento3_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT fk_ad_orcamento3_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- TOC entry 2971 (class 2606 OID 90642)
-- Dependencies: 1949 1948 2629
-- Name: fk_ad_orcamentohist1_ad_or; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamentohist
    ADD CONSTRAINT fk_ad_orcamentohist1_ad_or FOREIGN KEY (idorcamento) REFERENCES ad_orcamento(idorcamento);


--
-- TOC entry 2972 (class 2606 OID 90647)
-- Dependencies: 1950 1963 2671
-- Name: fk_ad_orcamentointerno0_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamentointerno
    ADD CONSTRAINT fk_ad_orcamentointerno0_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- TOC entry 2973 (class 2606 OID 90652)
-- Dependencies: 1950 1977 2705
-- Name: fk_ad_orcamentointerno1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamentointerno
    ADD CONSTRAINT fk_ad_orcamentointerno1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);


--
-- TOC entry 2974 (class 2606 OID 90657)
-- Dependencies: 1951 1937 2585
-- Name: fk_ad_ordembancaria1_ad_li; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_ordembancaria
    ADD CONSTRAINT fk_ad_ordembancaria1_ad_li FOREIGN KEY (idliquidacao) REFERENCES ad_liquidacao(idliquidacao);


--
-- TOC entry 2975 (class 2606 OID 90662)
-- Dependencies: 1953 1899 2429
-- Name: fk_ad_pagbolsa1_ad_bo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_pagbolsa
    ADD CONSTRAINT fk_ad_pagbolsa1_ad_bo FOREIGN KEY (idbolsista) REFERENCES ad_bolsista(idbolsista);


--
-- TOC entry 2976 (class 2606 OID 90667)
-- Dependencies: 1954 1909 2455
-- Name: fk_ad_paiempenho0_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_paiempenho
    ADD CONSTRAINT fk_ad_paiempenho0_ad_em FOREIGN KEY (idempenhopai) REFERENCES ad_empenho(idempenho);


--
-- TOC entry 2977 (class 2606 OID 90672)
-- Dependencies: 1954 1909 2455
-- Name: fk_ad_paiempenho1_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_paiempenho
    ADD CONSTRAINT fk_ad_paiempenho1_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- TOC entry 2978 (class 2606 OID 90677)
-- Dependencies: 1955 1917 2485
-- Name: fk_ad_participante_fornecedorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_participante
    ADD CONSTRAINT fk_ad_participante_fornecedorid FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);


--
-- TOC entry 2979 (class 2606 OID 90682)
-- Dependencies: 1955 1936 2583
-- Name: fk_ad_participante_licitacaoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_participante
    ADD CONSTRAINT fk_ad_participante_licitacaoid FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);


--
-- TOC entry 2982 (class 2606 OID 90687)
-- Dependencies: 1959 1977 2705
-- Name: fk_ad_requisicao2_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao2_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);


--
-- TOC entry 2983 (class 2606 OID 90692)
-- Dependencies: 1959 1977 2705
-- Name: fk_ad_requisicao3_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao3_ad_uo FOREIGN KEY (iduoexec) REFERENCES ad_uo(iduo);


--
-- TOC entry 2984 (class 2606 OID 90697)
-- Dependencies: 1959 2008 2770
-- Name: fk_ad_requisicao4_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao4_cm_us FOREIGN KEY (idusuarioreq) REFERENCES cm_usuario(idusuario);


--
-- TOC entry 2985 (class 2606 OID 90702)
-- Dependencies: 1959 2008 2770
-- Name: fk_ad_requisicao5_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao5_cm_us FOREIGN KEY (idusuariogestor) REFERENCES cm_usuario(idusuario);


--
-- TOC entry 2986 (class 2606 OID 90707)
-- Dependencies: 1960 1977 2705
-- Name: fk_ad_requisita1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT fk_ad_requisita1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);


--
-- TOC entry 2987 (class 2606 OID 90712)
-- Dependencies: 1960 1973 2694
-- Name: fk_ad_requisita2_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT fk_ad_requisita2_ad_ti FOREIGN KEY (idtiporeq) REFERENCES ad_tiporeq(idtiporeq);


--
-- TOC entry 2988 (class 2606 OID 90717)
-- Dependencies: 1960 1963 2671
-- Name: fk_ad_requisita3_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT fk_ad_requisita3_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- TOC entry 2989 (class 2606 OID 90722)
-- Dependencies: 1962 1956 2651
-- Name: fk_ad_retencao1_ad_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_retencao
    ADD CONSTRAINT fk_ad_retencao1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro) ON DELETE CASCADE;


--
-- TOC entry 2990 (class 2606 OID 90727)
-- Dependencies: 1964 1940 2597
-- Name: fk_ad_saldolic2_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic2_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- TOC entry 2991 (class 2606 OID 90732)
-- Dependencies: 1964 1917 2485
-- Name: fk_ad_saldolic3_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic3_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);


--
-- TOC entry 2992 (class 2606 OID 90737)
-- Dependencies: 1964 1965 2678
-- Name: fk_ad_saldolic3_adse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic3_adse FOREIGN KEY (idservico) REFERENCES ad_servico(idservico);


--
-- TOC entry 2993 (class 2606 OID 90742)
-- Dependencies: 1964 1977 2705
-- Name: fk_ad_saldolic4_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic4_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);


--
-- TOC entry 2994 (class 2606 OID 90747)
-- Dependencies: 1965 1965 1969 1969 2685
-- Name: fk_ad_servico1_ad_su; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_servico
    ADD CONSTRAINT fk_ad_servico1_ad_su FOREIGN KEY (idelemento, idsubelemento) REFERENCES ad_subelemento(idelemento, idsubelemento);


--
-- TOC entry 2995 (class 2606 OID 90752)
-- Dependencies: 1967 1967 1922 1922 2502
-- Name: fk_ad_solicitacao1_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_solicitacao
    ADD CONSTRAINT fk_ad_solicitacao1_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- TOC entry 2996 (class 2606 OID 90757)
-- Dependencies: 1969 1906 2442
-- Name: fk_ad_subelemento1_ad_el; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_subelemento
    ADD CONSTRAINT fk_ad_subelemento1_ad_el FOREIGN KEY (idelemento) REFERENCES ad_elemento(idelemento);


--
-- TOC entry 2999 (class 2606 OID 90762)
-- Dependencies: 1973 1963 2671
-- Name: fk_ad_tiporeq1_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_tiporeq
    ADD CONSTRAINT fk_ad_tiporeq1_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- TOC entry 3000 (class 2606 OID 90767)
-- Dependencies: 1974 1963 2671
-- Name: fk_ad_tiposervint1_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_tiposervint
    ADD CONSTRAINT fk_ad_tiposervint1_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- TOC entry 3001 (class 2606 OID 90772)
-- Dependencies: 1976 1976 1929 1929 2544
-- Name: fk_ad_trecho1_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_trecho
    ADD CONSTRAINT fk_ad_trecho1_ad_it FOREIGN KEY (idrequisicao, idpessoa) REFERENCES ad_itemreqpassagem(idrequisicao, idpessoa);


--
-- TOC entry 3002 (class 2606 OID 90777)
-- Dependencies: 1977 2000 2754
-- Name: fk_ad_uo2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_uo
    ADD CONSTRAINT fk_ad_uo2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- TOC entry 3003 (class 2606 OID 90782)
-- Dependencies: 1978 1977 2705
-- Name: fk_ad_uoalmox1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_uoalmox
    ADD CONSTRAINT fk_ad_uoalmox1_ad_uo FOREIGN KEY (iduoalmox) REFERENCES ad_uo(iduo) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 90787)
-- Dependencies: 1978 1977 2705
-- Name: fk_ad_uoalmox2_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_uoalmox
    ADD CONSTRAINT fk_ad_uoalmox2_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo) ON DELETE CASCADE;


--
-- TOC entry 3005 (class 2606 OID 90792)
-- Dependencies: 1980 1975 2699
-- Name: fk_ad_veiculo1_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_veiculo
    ADD CONSTRAINT fk_ad_veiculo1_ad_ti FOREIGN KEY (tipoveiculo) REFERENCES ad_tipoveiculo(tipoveiculo);


--
-- TOC entry 3006 (class 2606 OID 90797)
-- Dependencies: 1981 2006 2766
-- Name: fk_cm_acesso1_cm_tr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_acesso
    ADD CONSTRAINT fk_cm_acesso1_cm_tr FOREIGN KEY (idtrans) REFERENCES cm_transacao(idtrans);


--
-- TOC entry 3007 (class 2606 OID 90802)
-- Dependencies: 1981 1988 2730
-- Name: fk_cm_acesso2_cm_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_acesso
    ADD CONSTRAINT fk_cm_acesso2_cm_gr FOREIGN KEY (idgrupo) REFERENCES cm_grupoacesso(idgrupo);


--
-- TOC entry 3008 (class 2606 OID 90807)
-- Dependencies: 1982 1984 2722
-- Name: fk_cm_agencia1_cm_ba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_agencia
    ADD CONSTRAINT fk_cm_agencia1_cm_ba FOREIGN KEY (idbanco) REFERENCES cm_banco(idbanco) ON DELETE CASCADE;


--
-- TOC entry 3009 (class 2606 OID 90812)
-- Dependencies: 1987 2008 2770
-- Name: fk_cm_grpusuario1_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_grpusuario
    ADD CONSTRAINT fk_cm_grpusuario1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- TOC entry 3010 (class 2606 OID 90817)
-- Dependencies: 1987 1988 2730
-- Name: fk_cm_grpusuario2_cm_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_grpusuario
    ADD CONSTRAINT fk_cm_grpusuario2_cm_gr FOREIGN KEY (idgrupo) REFERENCES cm_grupoacesso(idgrupo);


--
-- TOC entry 3011 (class 2606 OID 90822)
-- Dependencies: 1990 1989 2732
-- Name: fk_cm_indicemensal1_cm_in; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_indicemensal
    ADD CONSTRAINT fk_cm_indicemensal1_cm_in FOREIGN KEY (sigla) REFERENCES cm_indice(sigla);


--
-- TOC entry 3012 (class 2606 OID 90827)
-- Dependencies: 1991 1996 2746
-- Name: fk_cm_instituicao1_cm_pa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_instituicao
    ADD CONSTRAINT fk_cm_instituicao1_cm_pa FOREIGN KEY (idpais) REFERENCES cm_pais(idpais);


--
-- TOC entry 3013 (class 2606 OID 90832)
-- Dependencies: 1991 1993 2740
-- Name: fk_cm_instituicao2_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_instituicao
    ADD CONSTRAINT fk_cm_instituicao2_cm_mu FOREIGN KEY (idmunicipio) REFERENCES cm_municipio(idmunicipio);


--
-- TOC entry 3014 (class 2606 OID 90837)
-- Dependencies: 1992 2008 2770
-- Name: fk_cm_log1_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_log
    ADD CONSTRAINT fk_cm_log1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- TOC entry 3015 (class 2606 OID 90842)
-- Dependencies: 1993 2007 2768
-- Name: fk_cm_municipio1_cm_uf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_municipio
    ADD CONSTRAINT fk_cm_municipio1_cm_uf FOREIGN KEY (iduf) REFERENCES cm_uf(iduf);


--
-- TOC entry 3016 (class 2606 OID 90847)
-- Dependencies: 1993 1996 2746
-- Name: fk_cm_municipio2_cm_pa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_municipio
    ADD CONSTRAINT fk_cm_municipio2_cm_pa FOREIGN KEY (idpais) REFERENCES cm_pais(idpais);


--
-- TOC entry 3017 (class 2606 OID 90852)
-- Dependencies: 1994 2003 2760
-- Name: fk_cm_noticia1_cm_si; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_noticia
    ADD CONSTRAINT fk_cm_noticia1_cm_si FOREIGN KEY (idsistema) REFERENCES cm_sistema(idsistema) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 90857)
-- Dependencies: 1995 2005 2764
-- Name: fk_cm_organograma1_cm_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_organograma
    ADD CONSTRAINT fk_cm_organograma1_cm_ti FOREIGN KEY (idtipoorganograma) REFERENCES cm_tipoorganograma(idtipoorganograma) ON DELETE CASCADE;


--
-- TOC entry 3019 (class 2606 OID 90862)
-- Dependencies: 1995 2000 2754
-- Name: fk_cm_organograma2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_organograma
    ADD CONSTRAINT fk_cm_organograma2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor) ON DELETE CASCADE;


--
-- TOC entry 3020 (class 2606 OID 90867)
-- Dependencies: 1995 2000 2754
-- Name: fk_cm_organograma3_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_organograma
    ADD CONSTRAINT fk_cm_organograma3_cm_se FOREIGN KEY (idsetorpai) REFERENCES cm_setor(idsetor) ON DELETE CASCADE;


--
-- TOC entry 3021 (class 2606 OID 90872)
-- Dependencies: 1997 1996 2746
-- Name: fk_cm_pessoa2_cm_pa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa2_cm_pa FOREIGN KEY (idpais) REFERENCES cm_pais(idpais);


--
-- TOC entry 3022 (class 2606 OID 90877)
-- Dependencies: 1997 1993 2740
-- Name: fk_cm_pessoa3_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa3_cm_mu FOREIGN KEY (idmunicipio) REFERENCES cm_municipio(idmunicipio);


--
-- TOC entry 3023 (class 2606 OID 90882)
-- Dependencies: 1997 1993 2740
-- Name: fk_cm_pessoa4_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa4_cm_mu FOREIGN KEY (idmunicipionascimento) REFERENCES cm_municipio(idmunicipio);


--
-- TOC entry 3024 (class 2606 OID 90887)
-- Dependencies: 1997 1996 2746
-- Name: fk_cm_pessoa5_cm_pa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa5_cm_pa FOREIGN KEY (idpaisnascimento) REFERENCES cm_pais(idpais);


--
-- TOC entry 3025 (class 2606 OID 90892)
-- Dependencies: 1997 1985 2724
-- Name: fk_cm_pessoa6_cm_es; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa6_cm_es FOREIGN KEY (idestadocivil) REFERENCES cm_estadocivil(idestadocivil);


--
-- TOC entry 3026 (class 2606 OID 90897)
-- Dependencies: 1997 1996 2746
-- Name: fk_cm_pessoa6_cm_pa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa6_cm_pa FOREIGN KEY (idpaisnacionalidade) REFERENCES cm_pais(idpais);


--
-- TOC entry 3027 (class 2606 OID 90902)
-- Dependencies: 1997 1997 1982 1982 2718
-- Name: fk_cm_pessoa7_cm_ag; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa7_cm_ag FOREIGN KEY (idbanco, idagenc) REFERENCES cm_agencia(idbanco, idagenc);


--
-- TOC entry 3028 (class 2606 OID 90907)
-- Dependencies: 2001 2000 2754
-- Name: fk_cm_setoracesso01; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_setoracesso
    ADD CONSTRAINT fk_cm_setoracesso01 FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- TOC entry 3029 (class 2606 OID 90912)
-- Dependencies: 2001 2000 2754
-- Name: fk_cm_setoracesso02; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_setoracesso
    ADD CONSTRAINT fk_cm_setoracesso02 FOREIGN KEY (idsetoracesso) REFERENCES cm_setor(idsetor);


--
-- TOC entry 3030 (class 2606 OID 90917)
-- Dependencies: 2002 2000 2754
-- Name: fk_cm_setorequivalente1_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_setorequivalente
    ADD CONSTRAINT fk_cm_setorequivalente1_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor) ON DELETE CASCADE;


--
-- TOC entry 3031 (class 2606 OID 90922)
-- Dependencies: 2002 2000 2754
-- Name: fk_cm_setorequivalente2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_setorequivalente
    ADD CONSTRAINT fk_cm_setorequivalente2_cm_se FOREIGN KEY (idsetorequivalente) REFERENCES cm_setor(idsetor) ON DELETE CASCADE;


--
-- TOC entry 3032 (class 2606 OID 90927)
-- Dependencies: 2006 2003 2760
-- Name: fk_cm_transacao1_cm_si; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_transacao
    ADD CONSTRAINT fk_cm_transacao1_cm_si FOREIGN KEY (idsistema) REFERENCES cm_sistema(idsistema);


--
-- TOC entry 3033 (class 2606 OID 90932)
-- Dependencies: 2008 1997 2748
-- Name: fk_cm_usuario1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_usuario
    ADD CONSTRAINT fk_cm_usuario1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 3034 (class 2606 OID 90937)
-- Dependencies: 2754 2000 2008
-- Name: fk_cm_usuario2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_usuario
    ADD CONSTRAINT fk_cm_usuario2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- TOC entry 2970 (class 2606 OID 90942)
-- Dependencies: 2480 1948 1916
-- Name: fk_orcamento2_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT fk_orcamento2_ad_fo FOREIGN KEY (idfonte) REFERENCES ad_fonte(idfonte);


--
-- TOC entry 3035 (class 2606 OID 90947)
-- Dependencies: 2009 2048 2846
-- Name: fk_rh_adicional1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_adicional
    ADD CONSTRAINT fk_rh_adicional1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- TOC entry 3036 (class 2606 OID 90952)
-- Dependencies: 2010 2048 2846
-- Name: fk_rh_averbacao1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_averbacao
    ADD CONSTRAINT fk_rh_averbacao1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- TOC entry 3037 (class 2606 OID 90957)
-- Dependencies: 2011 2010 2774
-- Name: fk_rh_averbfinalidade1_rh_av; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_averbfinalidade
    ADD CONSTRAINT fk_rh_averbfinalidade1_rh_av FOREIGN KEY (idaverbacao) REFERENCES rh_averbacao(idaverbacao) ON DELETE CASCADE;


--
-- TOC entry 3038 (class 2606 OID 90962)
-- Dependencies: 2012 2026 2802
-- Name: fk_rh_cargo1_rh_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cargo
    ADD CONSTRAINT fk_rh_cargo1_rh_gr FOREIGN KEY (idgrupocargo) REFERENCES rh_grupocargo(idgrupocargo) ON DELETE CASCADE;


--
-- TOC entry 3039 (class 2606 OID 90967)
-- Dependencies: 2012 2033 2816
-- Name: fk_rh_cargo2_rh_jo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cargo
    ADD CONSTRAINT fk_rh_cargo2_rh_jo FOREIGN KEY (idjornada) REFERENCES rh_jornada(idjornada);


--
-- TOC entry 3040 (class 2606 OID 90972)
-- Dependencies: 2013 2048 2846
-- Name: fk_rh_cessao1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cessao
    ADD CONSTRAINT fk_rh_cessao1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- TOC entry 3041 (class 2606 OID 90977)
-- Dependencies: 2013 2013 2035 2035 2820
-- Name: fk_rh_cessao2_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cessao
    ADD CONSTRAINT fk_rh_cessao2_rh_oc FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- TOC entry 3042 (class 2606 OID 90982)
-- Dependencies: 2013 1991 2736
-- Name: fk_rh_cessao3_cm_in; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cessao
    ADD CONSTRAINT fk_rh_cessao3_cm_in FOREIGN KEY (idinstituicao) REFERENCES cm_instituicao(idinstituicao);


--
-- TOC entry 3043 (class 2606 OID 90987)
-- Dependencies: 2013 2040 2830
-- Name: fk_rh_cessao4_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cessao
    ADD CONSTRAINT fk_rh_cessao4_rh_pu FOREIGN KEY (idpublicacao) REFERENCES rh_publicacao(idpublicacao);


--
-- TOC entry 3044 (class 2606 OID 90992)
-- Dependencies: 2017 2018 2786
-- Name: fk_rh_dependencia1_rh_de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_dependencia
    ADD CONSTRAINT fk_rh_dependencia1_rh_de FOREIGN KEY (iddependente) REFERENCES rh_dependente(iddependente) ON DELETE CASCADE;


--
-- TOC entry 3045 (class 2606 OID 90997)
-- Dependencies: 2018 1997 2748
-- Name: fk_rh_dependente1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_dependente
    ADD CONSTRAINT fk_rh_dependente1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 3046 (class 2606 OID 91002)
-- Dependencies: 2018 2025 2800
-- Name: fk_rh_dependente2_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_dependente
    ADD CONSTRAINT fk_rh_dependente2_rh_fu FOREIGN KEY (idfuncionario) REFERENCES rh_funcionario(idfuncionario);


--
-- TOC entry 3047 (class 2606 OID 91007)
-- Dependencies: 2019 2010 2774
-- Name: fk_rh_desaverbacao1_rh_av; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_desaverbacao
    ADD CONSTRAINT fk_rh_desaverbacao1_rh_av FOREIGN KEY (idaverbacao) REFERENCES rh_averbacao(idaverbacao);


--
-- TOC entry 3048 (class 2606 OID 91012)
-- Dependencies: 2020 2048 2846
-- Name: fk_rh_designacao1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_designacao
    ADD CONSTRAINT fk_rh_designacao1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- TOC entry 3049 (class 2606 OID 91017)
-- Dependencies: 2020 2000 2754
-- Name: fk_rh_designacao2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_designacao
    ADD CONSTRAINT fk_rh_designacao2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- TOC entry 3050 (class 2606 OID 91022)
-- Dependencies: 2020 2024 2798
-- Name: fk_rh_designacao3_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_designacao
    ADD CONSTRAINT fk_rh_designacao3_rh_fu FOREIGN KEY (idfuncao) REFERENCES rh_funcao(idfuncao);


--
-- TOC entry 3051 (class 2606 OID 91027)
-- Dependencies: 2020 2040 2830
-- Name: fk_rh_designacao4_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_designacao
    ADD CONSTRAINT fk_rh_designacao4_rh_pu FOREIGN KEY (idpublicacao) REFERENCES rh_publicacao(idpublicacao);


--
-- TOC entry 3052 (class 2606 OID 91032)
-- Dependencies: 2022 2022 2038 2038 2826
-- Name: fk_rh_ferias1_rh_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ferias
    ADD CONSTRAINT fk_rh_ferias1_rh_pe FOREIGN KEY (idvinculo, datainicioperaq) REFERENCES rh_periodoaquisitivo(idvinculo, datainicio) ON DELETE CASCADE;


--
-- TOC entry 3053 (class 2606 OID 91037)
-- Dependencies: 2025 1997 2748
-- Name: fk_rh_funcionario1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_funcionario
    ADD CONSTRAINT fk_rh_funcionario1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 3054 (class 2606 OID 91042)
-- Dependencies: 2027 2027 2035 2035 2820
-- Name: fk_rh_grupolicafast1_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_grupolicafast
    ADD CONSTRAINT fk_rh_grupolicafast1_rh_oc FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- TOC entry 3055 (class 2606 OID 91047)
-- Dependencies: 2027 2045 2840
-- Name: fk_rh_grupolicafast2_rh_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_grupolicafast
    ADD CONSTRAINT fk_rh_grupolicafast2_rh_ti FOREIGN KEY (idtipolicafast) REFERENCES rh_tipolicafast(idtipolicafast) ON DELETE CASCADE;


--
-- TOC entry 3056 (class 2606 OID 91052)
-- Dependencies: 2029 2023 2796
-- Name: fk_rh_histformacao1_rh_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histformacao
    ADD CONSTRAINT fk_rh_histformacao1_rh_fo FOREIGN KEY (idformacao) REFERENCES rh_formacao(idformacao) ON DELETE CASCADE;


--
-- TOC entry 3057 (class 2606 OID 91057)
-- Dependencies: 2029 2025 2800
-- Name: fk_rh_histformacao2_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histformacao
    ADD CONSTRAINT fk_rh_histformacao2_rh_fu FOREIGN KEY (idfuncionario) REFERENCES rh_funcionario(idfuncionario) ON DELETE CASCADE;


--
-- TOC entry 3058 (class 2606 OID 91062)
-- Dependencies: 2030 2030 2037 2037 2824
-- Name: fk_rh_histpensionista1_rh_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histpensionista
    ADD CONSTRAINT fk_rh_histpensionista1_rh_pe FOREIGN KEY (idvinculo, idpensionista) REFERENCES rh_pensionista(idvinculo, idpensionista) ON DELETE CASCADE;


--
-- TOC entry 3059 (class 2606 OID 91067)
-- Dependencies: 2031 2025 2800
-- Name: fk_rh_histtitulacao1_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histtitulacao
    ADD CONSTRAINT fk_rh_histtitulacao1_rh_fu FOREIGN KEY (idfuncionario) REFERENCES rh_funcionario(idfuncionario);


--
-- TOC entry 3060 (class 2606 OID 91072)
-- Dependencies: 2032 2048 2846
-- Name: fk_rh_histvantagem1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histvantagem
    ADD CONSTRAINT fk_rh_histvantagem1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- TOC entry 3061 (class 2606 OID 91077)
-- Dependencies: 2032 2047 2844
-- Name: fk_rh_histvantagem2_rh_va; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histvantagem
    ADD CONSTRAINT fk_rh_histvantagem2_rh_va FOREIGN KEY (idvantagem) REFERENCES rh_vantagem(idvantagem) ON DELETE CASCADE;


--
-- TOC entry 3062 (class 2606 OID 91082)
-- Dependencies: 2034 2048 2846
-- Name: fk_rh_licafast1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_licafast
    ADD CONSTRAINT fk_rh_licafast1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- TOC entry 3063 (class 2606 OID 91087)
-- Dependencies: 2034 2034 2035 2035 2820
-- Name: fk_rh_licafast2_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_licafast
    ADD CONSTRAINT fk_rh_licafast2_rh_oc FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- TOC entry 3064 (class 2606 OID 91092)
-- Dependencies: 2040 2830 2034
-- Name: fk_rh_licafast4_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_licafast
    ADD CONSTRAINT fk_rh_licafast4_rh_pu FOREIGN KEY (idpublicacao) REFERENCES rh_publicacao(idpublicacao);


--
-- TOC entry 3065 (class 2606 OID 91097)
-- Dependencies: 2035 2806 2028
-- Name: fk_rh_ocorrencia1_rh_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ocorrencia
    ADD CONSTRAINT fk_rh_ocorrencia1_rh_gr FOREIGN KEY (idgrupoocorrencia) REFERENCES rh_grupoocorrencia(idgrupoocorrencia) ON DELETE CASCADE;


--
-- TOC entry 3066 (class 2606 OID 91102)
-- Dependencies: 2842 2036 2046
-- Name: fk_rh_ocupacaovaga1_rh_va; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ocupacaovaga
    ADD CONSTRAINT fk_rh_ocupacaovaga1_rh_va FOREIGN KEY (numerovaga) REFERENCES rh_vaga(numerovaga) ON DELETE CASCADE;


--
-- TOC entry 3067 (class 2606 OID 91107)
-- Dependencies: 2846 2048 2036
-- Name: fk_rh_ocupacaovaga2_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ocupacaovaga
    ADD CONSTRAINT fk_rh_ocupacaovaga2_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- TOC entry 3068 (class 2606 OID 91112)
-- Dependencies: 2037 2846 2048
-- Name: fk_rh_pensionista1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_pensionista
    ADD CONSTRAINT fk_rh_pensionista1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- TOC entry 3069 (class 2606 OID 91117)
-- Dependencies: 2037 2748 1997
-- Name: fk_rh_pensionista2_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_pensionista
    ADD CONSTRAINT fk_rh_pensionista2_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- TOC entry 3070 (class 2606 OID 91122)
-- Dependencies: 2038 2846 2048
-- Name: fk_rh_periodoaquisitivo1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_periodoaquisitivo
    ADD CONSTRAINT fk_rh_periodoaquisitivo1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- TOC entry 3071 (class 2606 OID 91127)
-- Dependencies: 2846 2048 2039
-- Name: fk_rh_provimento1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- TOC entry 3072 (class 2606 OID 91132)
-- Dependencies: 2033 2816 2039
-- Name: fk_rh_provimento2_rh_jo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento2_rh_jo FOREIGN KEY (idjornada) REFERENCES rh_jornada(idjornada);


--
-- TOC entry 3073 (class 2606 OID 91137)
-- Dependencies: 2042 2834 2039
-- Name: fk_rh_provimento3_rh_si; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento3_rh_si FOREIGN KEY (idsituacao) REFERENCES rh_situacaofuncional(idsituacao);


--
-- TOC entry 3074 (class 2606 OID 91142)
-- Dependencies: 2012 2778 2012 2039 2039
-- Name: fk_rh_provimento4_rh_ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento4_rh_ca FOREIGN KEY (idgrupocargo, idcargo) REFERENCES rh_cargo(idgrupocargo, idcargo);


--
-- TOC entry 3075 (class 2606 OID 91147)
-- Dependencies: 2754 2039 2000
-- Name: fk_rh_provimento5_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento5_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- TOC entry 3076 (class 2606 OID 91152)
-- Dependencies: 2039 2039 2832 2041 2041
-- Name: fk_rh_provimento6_rh_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento6_rh_re FOREIGN KEY (idclasse, idreferencia) REFERENCES rh_referencia(idclasse, idreferencia);


--
-- TOC entry 3077 (class 2606 OID 91157)
-- Dependencies: 2039 2040 2830
-- Name: fk_rh_provimento7_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento7_rh_pu FOREIGN KEY (idpublicacao) REFERENCES rh_publicacao(idpublicacao);


--
-- TOC entry 3078 (class 2606 OID 91162)
-- Dependencies: 2039 2039 2035 2035 2820
-- Name: fk_rh_provimento8_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento8_rh_oc FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- TOC entry 3079 (class 2606 OID 91167)
-- Dependencies: 2040 2021 2792
-- Name: fk_rh_publicacao1_rh_di; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_publicacao
    ADD CONSTRAINT fk_rh_publicacao1_rh_di FOREIGN KEY (iddiplomalegal) REFERENCES rh_diplomalegal(iddiplomalegal);


--
-- TOC entry 3080 (class 2606 OID 91172)
-- Dependencies: 2782 2016 2041
-- Name: fk_rh_referencia1_rh_cl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_referencia
    ADD CONSTRAINT fk_rh_referencia1_rh_cl FOREIGN KEY (idclasse) REFERENCES rh_classe(idclasse) ON DELETE CASCADE;


--
-- TOC entry 3081 (class 2606 OID 91177)
-- Dependencies: 2035 2820 2043 2043 2035
-- Name: fk_rh_situacaoocorrencia1_rh_o; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_situacaoocorrencia
    ADD CONSTRAINT fk_rh_situacaoocorrencia1_rh_o FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia) ON DELETE CASCADE;


--
-- TOC entry 3082 (class 2606 OID 91182)
-- Dependencies: 2043 2042 2834
-- Name: fk_rh_situacaoocorrencia2_rh_s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_situacaoocorrencia
    ADD CONSTRAINT fk_rh_situacaoocorrencia2_rh_s FOREIGN KEY (idsituacao) REFERENCES rh_situacaofuncional(idsituacao);


--
-- TOC entry 3083 (class 2606 OID 91187)
-- Dependencies: 2044 2048 2846
-- Name: fk_rh_substituicao1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_substituicao
    ADD CONSTRAINT fk_rh_substituicao1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- TOC entry 3084 (class 2606 OID 91192)
-- Dependencies: 2044 2044 2020 2020 2790
-- Name: fk_rh_substituicao2_rh_de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_substituicao
    ADD CONSTRAINT fk_rh_substituicao2_rh_de FOREIGN KEY (idvinculosubst, datainiciosubst) REFERENCES rh_designacao(idvinculo, datainicio);


--
-- TOC entry 3085 (class 2606 OID 91197)
-- Dependencies: 2044 2024 2798
-- Name: fk_rh_substituicao3_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_substituicao
    ADD CONSTRAINT fk_rh_substituicao3_rh_fu FOREIGN KEY (idfuncao) REFERENCES rh_funcao(idfuncao);


--
-- TOC entry 3086 (class 2606 OID 91202)
-- Dependencies: 2044 2040 2830
-- Name: fk_rh_substituicao4_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_substituicao
    ADD CONSTRAINT fk_rh_substituicao4_rh_pu FOREIGN KEY (idpublicacao) REFERENCES rh_publicacao(idpublicacao);


--
-- TOC entry 3087 (class 2606 OID 91207)
-- Dependencies: 2046 2046 2012 2012 2778
-- Name: fk_rh_vaga1_rh_ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vaga
    ADD CONSTRAINT fk_rh_vaga1_rh_ca FOREIGN KEY (idgrupocargo, idcargo) REFERENCES rh_cargo(idgrupocargo, idcargo);


--
-- TOC entry 3088 (class 2606 OID 91212)
-- Dependencies: 2040 2048 2830
-- Name: fk_rh_vinculo1_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculo
    ADD CONSTRAINT fk_rh_vinculo1_rh_pu FOREIGN KEY (idpublicacao) REFERENCES rh_publicacao(idpublicacao);


--
-- TOC entry 3089 (class 2606 OID 91217)
-- Dependencies: 2040 2048 2830
-- Name: fk_rh_vinculo2_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculo
    ADD CONSTRAINT fk_rh_vinculo2_rh_pu FOREIGN KEY (idpublicacaovacancia) REFERENCES rh_publicacao(idpublicacao);


--
-- TOC entry 3090 (class 2606 OID 91222)
-- Dependencies: 2048 2025 2800
-- Name: fk_rh_vinculo3_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculo
    ADD CONSTRAINT fk_rh_vinculo3_rh_fu FOREIGN KEY (idfuncionario) REFERENCES rh_funcionario(idfuncionario);


--
-- TOC entry 3091 (class 2606 OID 91227)
-- Dependencies: 2048 2048 2035 2035 2820
-- Name: fk_rh_vinculo4_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculo
    ADD CONSTRAINT fk_rh_vinculo4_rh_oc FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- TOC entry 3092 (class 2606 OID 91232)
-- Dependencies: 2048 2048 2035 2035 2820
-- Name: fk_rh_vinculo5_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculo
    ADD CONSTRAINT fk_rh_vinculo5_rh_oc FOREIGN KEY (idgrupoocorrencia_1, idocorrencia_1) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- TOC entry 2997 (class 2606 OID 91237)
-- Dependencies: 1970 1936 2583
-- Name: fk_suplementacaoitem_licitacaoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_suplementacaoitem
    ADD CONSTRAINT fk_suplementacaoitem_licitacaoid FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);


--
-- TOC entry 2998 (class 2606 OID 91242)
-- Dependencies: 1959 2660 1970
-- Name: fk_suplementacaoitem_requisicaoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_suplementacaoitem
    ADD CONSTRAINT fk_suplementacaoitem_requisicaoid FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2008-09-22 16:15:30 BRT

--
-- PostgreSQL database dump complete
--

