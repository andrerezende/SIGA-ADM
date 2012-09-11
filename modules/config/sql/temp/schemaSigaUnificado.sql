--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: dbsiga; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE dbsiga WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.utf8' LC_CTYPE = 'pt_BR.utf8';


\connect dbsiga

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- Name: fn_ad_fornecedor_ins(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fn_ad_fornecedor_ins() RETURNS trigger
    LANGUAGE plpgsql
    AS '
BEGIN
	NEW.idagenc  = trim(NEW.idagenc);
	RETURN NEW;
END;
';


--
-- Name: fn_cm_agencia_ins(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fn_cm_agencia_ins() RETURNS trigger
    LANGUAGE plpgsql
    AS '
BEGIN
	NEW.idagenc  = trim(NEW.idagenc);
	RETURN NEW;
END;
';


--
-- Name: fn_cm_instituicao_ins(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fn_cm_instituicao_ins() RETURNS trigger
    LANGUAGE plpgsql
    AS '
BEGIN
	NEW.sigla  = trim(NEW.sigla);
	NEW.uasg  = trim(NEW.uasg);
	NEW.ug  = trim(NEW.ug);
	RETURN NEW;
END;
';


--
-- Name: fn_cm_uf_ins(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fn_cm_uf_ins() RETURNS trigger
    LANGUAGE plpgsql
    AS '
BEGIN
	NEW.iduf  = trim(NEW.iduf);
	NEW.uf  = trim(NEW.uf);
	RETURN NEW;
END;
';


--
-- Name: nvl(bigint, bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(bigint, bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(bit, bit); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(bit, bit) RETURNS bit
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(bit varying, bit varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(bit varying, bit varying) RETURNS bit varying
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(boolean, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(boolean, boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(box, box); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(box, box) RETURNS box
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(bytea, bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(bytea, bytea) RETURNS bytea
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(character varying, character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(character, character); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(character, character) RETURNS character
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(cidr, cidr); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(cidr, cidr) RETURNS cidr
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(circle, circle); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(circle, circle) RETURNS circle
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(date, date) RETURNS date
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(double precision, double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(inet, inet); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(inet, inet) RETURNS inet
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(integer, integer) RETURNS integer
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(interval, interval); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(interval, interval) RETURNS interval
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(line, line); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(line, line) RETURNS line
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(lseg, lseg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(lseg, lseg) RETURNS lseg
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(macaddr, macaddr); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(macaddr, macaddr) RETURNS macaddr
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(money, money); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(money, money) RETURNS money
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(numeric, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(numeric, numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(path, path); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(path, path) RETURNS path
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(point, point); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(point, point) RETURNS point
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(polygon, polygon); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(polygon, polygon) RETURNS polygon
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(real, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(real, real) RETURNS real
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(smallint, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(smallint, smallint) RETURNS smallint
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(text, text) RETURNS text
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(time without time zone, time without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(time without time zone, time without time zone) RETURNS time without time zone
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


--
-- Name: nvl(timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nvl(timestamp without time zone, timestamp without time zone) RETURNS timestamp without time zone
    LANGUAGE plpgsql
    AS 'DECLARE 
		ENTRADA ALIAS FOR $1;
		ALTERNATIVA ALIAS FOR $2; 
	BEGIN 
		if (ENTRADA isnull) then return ALTERNATIVA;  
		else return ENTRADA; 
	end if; 
END';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ad_abastecimento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_abastecimento (
    idabastecimento integer NOT NULL,
    posto character varying(50),
    enderecoposto character varying(50),
    cidadeposto character varying(50),
    datahoraabastecimento timestamp with time zone,
    valorabastecimento numeric(8,2),
    quantidade numeric(4,2),
    combustivel character(1)
);


--
-- Name: ad_abastecimentorequisicao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_abastecimentorequisicao (
    idabastecimento integer NOT NULL,
    idrequisicao integer NOT NULL
);


--
-- Name: ad_acessobolsa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_acessobolsa (
    idusuario numeric(9,0) NOT NULL,
    idbolsa numeric(9,0) NOT NULL
);


--
-- Name: ad_acessouoreq; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_acessouoreq (
    idusuario numeric(9,0) NOT NULL,
    iduo numeric(9,0) NOT NULL
);


--
-- Name: ad_andamento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_andamento (
    numpro character varying(12) NOT NULL,
    numanda numeric(9,0) NOT NULL,
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
-- Name: ad_bolsa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_bolsa (
    idbolsa numeric(9,0) NOT NULL,
    descricao character varying(30),
    acumulavel character varying(1),
    paga character varying(1),
    fontepag character varying(40)
);


--
-- Name: ad_bolsista; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_bolsista (
    idbolsista numeric(5,0) NOT NULL,
    datainclusao character varying(10),
    dataexclusao character varying(10),
    horasprevistas numeric(5,0),
    dataalt character varying(10),
    idbolsa numeric(9,0),
    idpessoa numeric(9,0)
);


--
-- Name: ad_catmat; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_catmat (
    codmaterial numeric(14,0) NOT NULL,
    nomematerial character varying(80),
    grupomaterial numeric(4,0),
    nomegrupomaterial character varying(80),
    classematerial numeric(5,0),
    nomeclassematerial character varying(80)
);


--
-- Name: ad_classificador; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_classificador (
    idclassificador character varying(12) NOT NULL,
    descricao character varying(50)
);


--
-- Name: ad_contrato; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_contrato (
    idcontrato numeric(9,0) NOT NULL,
    numcontrato character varying(12),
    datainicio date,
    datafim date,
    objeto character varying(200),
    obs character varying(500),
    situacao character varying(1),
    idcontratopai numeric(9,0)
);


--
-- Name: ad_controle; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_controle (
    travapag character varying(1),
    anoref numeric(4,0)
);


--
-- Name: ad_controleprot; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_controleprot (
    anopro numeric(4,0) NOT NULL,
    lastnumproc numeric(6,0),
    lastnumprot numeric(6,0),
    uasg character varying(6) NOT NULL
);


--
-- Name: ad_dependencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_dependencia (
    iddependencia numeric(5,0) NOT NULL,
    idsetor numeric(9,0),
    dependencia character varying(50)
);


--
-- Name: ad_diaria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_diaria (
    categoriadiaria character varying(1) NOT NULL,
    categoriafunc character varying(3) NOT NULL,
    diaria numeric(9,2),
    meiadiaria numeric(9,2),
    dataini date NOT NULL,
    datafim date
);


--
-- Name: ad_elemento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_elemento (
    idelemento numeric(6,0) NOT NULL,
    descricao character varying(60)
);


--
-- Name: ad_empenhado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_empenhado (
    idempenhado numeric(9,0) NOT NULL,
    valoremp numeric(12,2),
    quantidadeemp numeric(8,2),
    idempenho numeric(9,0) NOT NULL,
    idlicitacao numeric(9,0) NOT NULL,
    item numeric(9,0) NOT NULL,
    dataorcamento date,
    status character varying(1),
    idorcamento numeric(9,0) NOT NULL,
    valoranulado numeric(12,2),
    dataanulacao date,
    motivoanulacao character varying(100),
    numeroanulacao character varying(10),
    quantidadeanulada numeric(9,0)
);


--
-- Name: ad_empenhado_numeroanulacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ad_empenhado_numeroanulacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: ad_empenhado_numeroanulacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ad_empenhado_numeroanulacao_seq OWNED BY ad_empenhado.numeroanulacao;


--
-- Name: ad_empenhadodist; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_empenhadodist (
    idempenhado numeric(9,0) NOT NULL,
    idrequisicao numeric(9,0) NOT NULL,
    valorunitario numeric(12,2),
    quantidade numeric(8,2)
);


--
-- Name: ad_empenho; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_empenho (
    idempenho numeric(9,0) NOT NULL,
    numero character varying(12),
    dataempenho date,
    tipoempenho character varying(2),
    tipoentrega character varying(1),
    idfornecedor numeric(9,0),
    status character varying(1),
    dataanulacao date,
    motivoanulacao character varying(1),
    modalidadeemp character varying(1),
    idempenhoref numeric(9,0),
    numpro character varying(12),
    obs character varying(200),
    iduo numeric(9,0),
    ug character varying
);


--
-- Name: ad_empresamanutencaoveiculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_empresamanutencaoveiculo (
    idempresa integer NOT NULL,
    cnpj character(18),
    nome character varying(50),
    razaosocial character varying(50),
    rua character varying(40),
    numero character(5),
    bairro character varying(50),
    cep character(9),
    telefone character varying(10),
    idmunicipio character varying(5) NOT NULL
);


--
-- Name: ad_empresapassagem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_empresapassagem (
    idempresapassagem numeric(9,0) NOT NULL,
    nome character varying(30),
    ativo character varying(1)
);


--
-- Name: ad_estoque; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_estoque (
    idmaterial numeric(9,0) NOT NULL,
    estoquemin numeric(6,0),
    estoque numeric(6,0),
    valortotal numeric(14,4),
    localizacao character varying(50),
    iduo numeric(9,0) NOT NULL
);


--
-- Name: ad_executa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_executa (
    idtiporeq numeric(5,0) NOT NULL,
    iduo numeric(9,0) NOT NULL,
    idrubrica character varying(20),
    ano numeric(4,0) NOT NULL
);


--
-- Name: ad_executor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_executor (
    iduo numeric(9,0) NOT NULL,
    idusuario numeric(9,0) NOT NULL,
    datainicio date NOT NULL,
    datafim date
);


--
-- Name: ad_executoralmox; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_executoralmox (
    idexecutoralmox numeric(5,0) NOT NULL,
    iduorequisitante numeric(9,0) NOT NULL,
    iduoexecutante numeric(9,0) NOT NULL
);


--
-- Name: ad_executorservint; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_executorservint (
    idexecutorservint numeric(9,0) NOT NULL,
    idtiposervint numeric(5,0),
    idusuario numeric(9,0),
    datainicio date,
    datafim date
);


--
-- Name: ad_fonte; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_fonte (
    idfonte character varying(10) NOT NULL,
    descricao character varying(50),
    fontecompleta character varying(10),
    fonteresumida character varying(3)
);


--
-- Name: ad_fornecedor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_fornecedor (
    idfornecedor numeric(9,0) NOT NULL,
    contacorrente character varying(10),
    idinstituicao numeric(9,0),
    idpessoa numeric(9,0),
    idbanco numeric(4,0),
    idagenc character varying(7)
);


--
-- Name: ad_fpotencial; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_fpotencial (
    idmaterial numeric(9,0) NOT NULL,
    idfornecedor numeric(9,0) NOT NULL
);


--
-- Name: ad_funcionarioresp; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_funcionarioresp (
    idfunc character varying(9) NOT NULL,
    idsetor numeric(9,0) NOT NULL,
    dataini date NOT NULL,
    datafim date
);


--
-- Name: ad_gestor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_gestor (
    iduo numeric(9,0) NOT NULL,
    idusuario numeric(9,0) NOT NULL,
    datainicio date NOT NULL,
    datafim date
);


--
-- Name: ad_hotel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_hotel (
    idhotel numeric(5,0) NOT NULL,
    nome character varying(30),
    ativo character varying(1) NOT NULL,
    valordiaria numeric(10,2)
);


--
-- Name: ad_itemlicitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemlicitacao (
    idlicitacao numeric(9,0) NOT NULL,
    item numeric(9,0) NOT NULL,
    valor numeric(12,2),
    justificativa character varying(200),
    excecao character varying(1),
    quantidadelicitada numeric(9,0)
);


--
-- Name: ad_itemnota; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemnota (
    iditemnota numeric(9,0) NOT NULL,
    idempenhado numeric(9,0),
    idnotafiscal integer,
    quantitemnota numeric(8,2),
    valoritemnota numeric(12,2)
);


--
-- Name: ad_itempatrimo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itempatrimo (
    idpatrimo numeric(9,0) NOT NULL,
    descricaoad character varying(60),
    datapatrimo date,
    empenho numeric(9,0),
    tipoingresso character varying(1),
    tipoutilizacao character varying(1),
    estadoitem character varying(1),
    idmaterial numeric(9,0),
    idsetor numeric(9,0) NOT NULL
);


--
-- Name: ad_itempatrimonio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itempatrimonio (
    iditempatrimonio numeric(9,0) NOT NULL,
    descricao character varying(1000),
    tipoingresso character varying(1),
    dataaquisicao date,
    marcamodelo character varying(50),
    valor numeric(12,2),
    notafiscal character varying(16),
    subelemento numeric(2,0),
    idmaterial numeric(9,0),
    idempenhado numeric(9,0),
    idclassificador character varying(12),
    numpro character varying(12),
    ativo character varying(1),
    iddependencia numeric(5,0),
    idsetor numeric(9,0) NOT NULL,
    numeroserie character varying(15),
    numeroempenho character varying(12),
    descricaoestado character varying(100)
);


--
-- Name: ad_itemreq; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreq (
    idrequisicao numeric(9,0) NOT NULL,
    idmaterial numeric(9,0) NOT NULL,
    quantpedida numeric(8,2),
    precoestimado numeric(12,2),
    quantautorizada numeric(8,2),
    status character varying(1),
    idlicitacao numeric(9,0),
    item numeric(9,0),
    prioridade character varying(1),
    descricaodetalhada character varying(500),
    valorreal numeric(12,2),
    motivorejeicao character varying(255),
    quantentregue numeric(8,2),
    quantempenhada numeric(9,0),
    quantdevolvida numeric(9,0)
);


--
-- Name: ad_itemreqbib; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqbib (
    idrequisicao numeric(9,0) NOT NULL,
    idmaterial numeric(9,0) NOT NULL,
    quantpedida numeric(8,2),
    precoestimado numeric(12,2),
    status character varying(1),
    idlicitacao numeric(9,0),
    item numeric(9,0),
    valorreal numeric(12,2),
    motivorejeicao character varying(255),
    quantentregue numeric(8,2),
    quantempenhada numeric(9,0),
    quantdevolvida numeric(9,0),
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
-- Name: ad_itemreqdiaria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqdiaria (
    idrequisicao numeric(9,0) NOT NULL,
    idvinculo character varying(7) NOT NULL,
    categoriafunc character varying(3),
    situacaofunc character varying(1),
    motivo character varying(200),
    datasaida date,
    dataretorno date,
    meiotransportediaria character varying(1),
    justdianaoutil character varying(200),
    valorest numeric(10,2),
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character varying(1),
    obs character varying(200),
    ordembancaria character varying(16),
    dataordembancaria date,
    diariasconcedidas numeric(10,2),
    tiporeqdiaria character varying(1),
    idrequisicaooriginal numeric(9,0),
    idvinculoprop character varying(7),
    idvinculochefe character varying(7),
    numpro character varying(12),
    passagemaerea character varying(1),
    bilhete character varying(20),
    idrequisicaoveiculo numeric(9,0),
    nacional character varying(1)
);


--
-- Name: ad_itemreqhotel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqhotel (
    idrequisicao numeric(9,0) NOT NULL,
    idpessoa numeric(9,0) NOT NULL,
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
    conceito character varying(1),
    obs character varying(200),
    idempenho numeric(9,0),
    idhotelpref numeric(5,0),
    informacoes character varying(200)
);


--
-- Name: ad_itemreqpassagem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqpassagem (
    idrequisicao numeric(9,0) NOT NULL,
    idpessoa numeric(9,0) NOT NULL,
    tipotransporte character varying(1),
    motivo character varying(200),
    valorest numeric(10,2),
    bilhete character varying(20),
    notafiscal character varying(16),
    datanotafiscal date,
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character varying(1),
    obs character varying(200),
    idempenho numeric(9,0),
    idmunicipioorigem character varying(5) NOT NULL,
    idmunicipiodestino character varying(5) NOT NULL,
    datahorapassagem date,
    classe character varying(1),
    idempresapassagem numeric(9,0),
    email character varying(100),
    codigolocalizador character varying(10)
);


--
-- Name: ad_itemreqrestaurante; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqrestaurante (
    idrequisicao numeric(9,0) NOT NULL,
    idpessoa numeric(9,0) NOT NULL,
    motivo character varying(200),
    valorest numeric(10,2),
    notafiscal character varying(200),
    datanotafiscal date,
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character varying(1),
    obs character varying(200),
    idempenho numeric(9,0),
    idpessoaacompanhante numeric(10,0),
    idrestaurantepref numeric(5,0),
    datainicio date,
    datafim date,
    numeroalmocos numeric(5,0),
    numerojantares numeric(5,0)
);


--
-- Name: ad_itemreqservext; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqservext (
    idrequisicao numeric(9,0) NOT NULL,
    idservico numeric(9,0) NOT NULL,
    complemento character varying(1500),
    quantidade numeric(8,2),
    valorest numeric(12,2),
    valorreal numeric(12,2),
    idlicitacao numeric(9,0),
    item numeric(9,0),
    prioridade character varying(1),
    status character varying(1),
    unidade character varying(10),
    descricaodetalhada character varying(500),
    quantempenhada numeric(9,0),
    quantentregue numeric(9,2),
    quantdevolvida numeric(9,0)
);


--
-- Name: ad_itemreqservint; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqservint (
    idrequisicao numeric(9,0) NOT NULL,
    idtiposervint numeric(5,0) NOT NULL,
    procedimento character varying(400),
    quantidade numeric(9,0),
    unidade character varying(12),
    urgente character varying(1),
    motivourgencia character varying(200),
    dataprevisao date,
    dataconclusao date,
    valorreal numeric(12,2),
    ocorrencias character varying(200),
    conceito character varying(1),
    obs character varying(200)
);


--
-- Name: ad_itemreqservpf; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqservpf (
    idrequisicao numeric(9,0) NOT NULL,
    idpessoa numeric(9,0) NOT NULL,
    descricaoservico character varying(200),
    valorreal numeric(10,2),
    irrf numeric(10,2),
    inssprestador numeric(10,2),
    insscontratante numeric(10,2),
    datapagamento date,
    ocorrencias character varying(200),
    conceito character varying(1),
    obs character varying(200),
    idempenho numeric(9,0)
);


--
-- Name: ad_itemreqveiculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqveiculo (
    idrequisicao numeric(9,0) NOT NULL,
    idpessoa numeric(9,0) NOT NULL,
    tipotransporte numeric(1,0),
    enderecoorig character varying(200),
    bairroorig character varying(50),
    ceporig character varying(8),
    referenciaorig character varying(150),
    datahorasaidaorig timestamp with time zone,
    enderecodest character varying(200),
    bairrodest character varying(50),
    cepdest character varying(8),
    referenciadest character varying(150),
    prevdatahorachegdest timestamp with time zone,
    justificativa character varying(500),
    quilometragemest numeric(9,0),
    valorest numeric(10,2),
    datahoraautexec timestamp with time zone,
    datahorasaidagar timestamp with time zone,
    datahoracheggar timestamp with time zone,
    odometrosaida numeric(9,0),
    odometrocheg numeric(9,0),
    valorreal numeric(10,2),
    ocorrencias character varying(200),
    conceito character varying(1),
    obs character varying(500),
    placa character varying(7),
    idmotorista numeric(6,0),
    idmunicipiodestino character varying(5) NOT NULL,
    idmunicipioorigem character varying(5) NOT NULL,
    tipoveiculo numeric(1,0),
    prevdatahoraretorno timestamp with time zone,
    outrospassageiros character varying(500)
);


--
-- Name: ad_itemreqxerox; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_itemreqxerox (
    idrequisicao numeric(9,0) NOT NULL,
    disciplina character varying,
    tipomaterial character varying,
    numoriginais numeric(9,0),
    numcopiaspororiginal numeric(9,0),
    valorxerox numeric(6,2),
    localentrega character varying,
    totalparcial numeric(6,2)
);


--
-- Name: ad_lancamentoint; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_lancamentoint (
    idlancamentoint numeric(9,0) NOT NULL,
    tipolancamento character varying(1),
    ano numeric(4,0),
    data date,
    valor numeric(18,2),
    obs character varying(200),
    iduoreq numeric(9,0),
    iduoexec numeric(9,0),
    idrubrica character varying(20),
    idrequisicao numeric(9,0),
    idusuario numeric(9,0),
    idlicitacao numeric(9,0),
    item numeric(9,0)
);


--
-- Name: ad_lancamentoint_idlicitacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ad_lancamentoint_idlicitacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: ad_licitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_licitacao (
    idlicitacao numeric(9,0) NOT NULL,
    numero character varying(15),
    dataabertura timestamp without time zone,
    datacriacao timestamp without time zone,
    status character varying(1),
    pregao character varying(1),
    numpro character varying(12),
    idmodalidadelicitacao numeric(4,0),
    imediato character varying(1),
    datahomologacao timestamp without time zone,
    idtipolicitacao character varying(1),
    obs character varying(1000),
    validade character varying(20),
    tipoentrega character varying(1)
);


--
-- Name: ad_liquidacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_liquidacao (
    idliquidacao numeric(9,0) NOT NULL,
    dataliquidacao date,
    valor numeric(12,2),
    obs character varying(200),
    pago character varying(1),
    valorirrf numeric(12,2),
    valorinss numeric(12,2),
    valoriss numeric(12,2)
);


--
-- Name: ad_localidadediaria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_localidadediaria (
    idlocalidadediaria numeric(6,0) NOT NULL,
    quantdiarias numeric(5,1),
    idmunicipio character varying(5) NOT NULL,
    idrequisicao numeric(9,0) NOT NULL,
    idvinculo character varying(7) NOT NULL
);


--
-- Name: ad_manutencaoveiculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_manutencaoveiculo (
    idmanutencao integer NOT NULL,
    idtipomanutencao integer NOT NULL,
    idnotafiscal integer NOT NULL,
    valor numeric(8,2),
    obs character varying(500)
);


--
-- Name: ad_mapalicitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_mapalicitacao (
    idlicitacao numeric(9,0) NOT NULL,
    item numeric(9,0) NOT NULL,
    preco numeric(11,2),
    vencedor character varying(1),
    quantidade numeric(9,2),
    importado character varying(1),
    status character varying(1),
    idfornecedor numeric(9,0) NOT NULL,
    marcamodelo character varying(50)
);


--
-- Name: ad_material; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_material (
    idmaterial numeric(9,0) NOT NULL,
    descricao character varying(810),
    unidade character varying(10),
    permcons character varying(1),
    estocavel character varying(1),
    idelemento numeric(6,0),
    idsubelemento numeric(2,0),
    ativo character varying(1),
    codmaterial numeric(14,0),
    precoestimado numeric(12,2),
    descresum character varying(200)
);


--
-- Name: ad_modalidadelicitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_modalidadelicitacao (
    idmodalidadelicitacao numeric(4,0) NOT NULL,
    descricao character varying(30),
    valorinicial numeric(12,2),
    valorfinal numeric(12,2)
);


--
-- Name: ad_motorista; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_motorista (
    idmotorista numeric(6,0) NOT NULL,
    carteirahab character varying(15),
    datavalidade date,
    categoria character varying(1),
    ativo character varying(1),
    idpessoa numeric(9,0) NOT NULL
);


--
-- Name: ad_movimento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_movimento (
    idmovimento numeric(9,0) NOT NULL,
    tipomovimento character varying(1),
    datamov date,
    quantidade numeric(9,2),
    valortotal numeric(12,2),
    idordement numeric(9,0),
    idrequisicao numeric(9,0),
    idmaterial numeric(9,0),
    iditemnota numeric(9,0),
    idmovimentoref numeric(9,0),
    iduoalmox numeric(9,0)
);


--
-- Name: ad_movimentopat; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_movimentopat (
    idmovimentacao numeric(9,0) NOT NULL,
    tipomovimento character varying(1),
    motivobaixa character varying(1),
    numerotermo character varying(10),
    iditempatrimonio numeric(9,0) NOT NULL,
    idsetororigem numeric(9,0) NOT NULL,
    idsetordestino numeric(9,0) NOT NULL,
    data date,
    iddependenciaorigem numeric(5,0),
    iddependenciadestino numeric(5,0),
    numeroprocesso character varying(12)
);


--
-- Name: ad_movimentoserv; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_movimentoserv (
    idmovimentoserv numeric(9,0) NOT NULL,
    tipomovimento character varying(20),
    datamov date,
    quantidade numeric(9,0) DEFAULT 0,
    valortotal numeric(12,0) DEFAULT 0,
    idrequisicao numeric(9,0),
    iditemnota numeric(9,0),
    idmovimentoservref numeric(9,0)
);


--
-- Name: ad_notafiscal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_notafiscal (
    idnotafiscal integer NOT NULL,
    notafiscal character varying(16),
    datanotafiscal date,
    valor numeric(12,2),
    idliquidacao numeric(9,0),
    idempenho numeric(9,0),
    dataateste date,
    obs character varying(200),
    valordesconto numeric(12,2)
);


--
-- Name: ad_notafiscalmanutencaoveiculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_notafiscalmanutencaoveiculo (
    idnotafiscal integer NOT NULL,
    placa character(7) NOT NULL,
    idempresa integer NOT NULL,
    idprevrevisao integer,
    data_manutencao date,
    valortotal numeric(8,2)
);


--
-- Name: ad_novomaterial; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_novomaterial (
    idnovomaterial numeric(5,0) NOT NULL,
    descricao character varying(500),
    iduoreq numeric(9,0),
    status character varying(1),
    codmaterial numeric(14,0),
    idusuario numeric(9,0),
    aplicacao character varying(200),
    descricaodetalhada character varying(500),
    telefone character varying(20),
    datapedido date,
    ativo character varying(1),
    precoestimado numeric(12,2)
);


--
-- Name: ad_orcamento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_orcamento (
    idorcamento numeric(9,0) NOT NULL,
    ano numeric(4,0) NOT NULL,
    dotacao numeric(20,2),
    suplementacao numeric(20,2),
    bloqueio numeric(20,2),
    anulacao numeric(20,2),
    pago numeric(20,2),
    idptr character varying(7) NOT NULL,
    idfonte character varying(10) NOT NULL,
    idrubrica character varying(20) NOT NULL,
    esfera character varying(1),
    ug character varying
);


--
-- Name: ad_orcamentohist; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_orcamentohist (
    idorcamento numeric(9,0) NOT NULL,
    data date NOT NULL,
    tipoorc character varying(1) NOT NULL,
    valor numeric(18,2)
);


--
-- Name: ad_orcamentointerno; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_orcamentointerno (
    iduo numeric(9,0) NOT NULL,
    idrubrica character varying(20) NOT NULL,
    ano numeric(4,0) NOT NULL,
    credito numeric(18,2),
    debito numeric(18,2),
    previsaodebito numeric(18,2),
    creditoexecutante numeric(18,2)
);


--
-- Name: ad_orcamentotermo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_orcamentotermo (
    idlicitacao numeric(9,0) NOT NULL,
    item numeric(9,0) NOT NULL,
    idinstituicao numeric(9,0),
    iduser numeric(9,0),
    empresa1 character varying(30),
    orcamento1 numeric(12,2),
    empresa2 character varying(30),
    orcamento2 numeric(12,2),
    empresa3 character varying(30),
    orcamento3 numeric(12,2),
    termoref text,
    itemdef numeric(9,0),
    datalimite date DEFAULT '0001-01-01'::date,
    status character varying(1)
);


--
-- Name: ad_orcinttemp; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_orcinttemp (
    iduo numeric(9,0) NOT NULL,
    idrubrica character varying(20) NOT NULL,
    ano numeric(4,0) NOT NULL,
    credito numeric(18,2),
    debito numeric(18,2),
    previsaodebito numeric(18,2),
    creditoexecutante numeric(18,2)
);


--
-- Name: ad_orctermo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_orctermo (
    idlicitacao numeric(9,0) NOT NULL,
    item numeric(9,0) NOT NULL,
    numpro character varying(12),
    idmaterial numeric(9,0),
    descricao character varying(500),
    quantpedida numeric(9,0),
    precoestimado numeric(12,2),
    campus character varying(30),
    empresa1 character varying(30),
    orcamento1 numeric(12,2),
    orcamento2 numeric(12,2),
    empresa3 character varying(30),
    orcamento3 numeric(12,2),
    empresa2 character varying(30),
    valortotal numeric(12,2),
    termoref character varying(8000),
    processo numeric(6,0),
    iduser numeric(9,0),
    itemdef numeric(9,0),
    itemold numeric(9,0),
    datalimite date DEFAULT '0001-01-01'::date
);


--
-- Name: ad_ordembancaria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_ordembancaria (
    idordembancaria numeric(9,0) NOT NULL,
    numeroordembancaria character varying(16),
    dataordembancaria date,
    valor numeric(12,2),
    idliquidacao numeric(9,0) NOT NULL,
    darf character varying(12),
    gps character varying(12),
    datagps date
);


--
-- Name: ad_ordentrega; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_ordentrega (
    idordement numeric(9,0) NOT NULL,
    dataordent date,
    numeroordem numeric(9,0),
    iduoexec numeric(9,0),
    impresso character varying(1)
);


--
-- Name: ad_pagbolsa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_pagbolsa (
    idbolsista numeric(5,0) NOT NULL,
    mesano character varying(7) NOT NULL,
    valor numeric(15,2),
    horastrabalhadas numeric(5,0),
    folha numeric(5,0) NOT NULL
);


--
-- Name: ad_paiempenho; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_paiempenho (
    idempenhopai numeric(9,0) NOT NULL,
    idempenho numeric(9,0) NOT NULL,
    tipofilho character varying(1)
);


--
-- Name: ad_participante; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_participante (
    idlicitacao numeric(9,0) NOT NULL,
    idfornecedor numeric(9,0) NOT NULL
);


--
-- Name: ad_prevrevisao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_prevrevisao (
    idprevrevisao integer NOT NULL,
    placa character(7) NOT NULL,
    data_prevista date,
    kmestimada numeric(8,2),
    situacao character(1)
);


--
-- Name: ad_processo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_processo (
    numpro character varying(12) NOT NULL,
    stampaber character varying(12),
    instit numeric(9,0),
    cxarq character varying(7),
    setororig character varying(15),
    tipo character varying(1),
    interes character varying(80),
    titulo character varying(80),
    assunto character varying(240)
);


--
-- Name: ad_ptr; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_ptr (
    idptr character varying(7) NOT NULL,
    descricao character varying(100),
    progtrab character varying(17) NOT NULL,
    uorcamento character varying(5)
);


--
-- Name: ad_reqrubrica; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_reqrubrica (
    idrubrica character varying(20) NOT NULL,
    idtiporeq numeric(5,0) NOT NULL
);


--
-- Name: ad_requisicao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_requisicao (
    idrequisicao numeric(9,0) NOT NULL,
    datahorareq timestamp with time zone,
    datahoraautreq timestamp with time zone,
    tiporequisicao numeric(5,0),
    status character varying(1) NOT NULL,
    motivorejeicao character varying(200),
    iduoreq numeric(9,0) NOT NULL,
    iduoexec numeric(9,0) NOT NULL,
    idusuarioreq numeric(9,0),
    conceito character varying(1),
    obs character varying(200),
    idusuariogestor numeric(9,0),
    coditemfinanciavel character varying(2),
    localentrega character varying(100),
    datahoraexecucao timestamp with time zone,
    datahoraavaliacao timestamp with time zone,
    suplementar character varying(50),
    justificativa character varying(200),
    datahorareq2 timestamp with time zone
);


--
-- Name: ad_requisita; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_requisita (
    idtiporeq numeric(5,0) NOT NULL,
    iduo numeric(9,0) NOT NULL,
    idrubrica character varying(20),
    ano numeric(4,0) NOT NULL,
    ativo character varying(1)
);


--
-- Name: ad_restaurante; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_restaurante (
    idrestaurante numeric(5,0) NOT NULL,
    nome character varying(30),
    ativo character varying(1),
    valorrefeicao numeric(10,2)
);


--
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
    numanda numeric(9,0)
);


--
-- Name: ad_rubrica; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_rubrica (
    idrubrica character varying(20) NOT NULL,
    descricao character varying(100)
);


--
-- Name: ad_saldolic; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_saldolic (
    modalidadelic numeric(4,0),
    numerolic character varying(15) NOT NULL,
    item numeric(9,0) NOT NULL,
    idmaterial numeric(9,0),
    qtde numeric(8,2),
    valor numeric(12,2),
    idfornecedor numeric(9,0),
    descricaodetalhada character varying(500),
    idservico numeric(9,0),
    iduoreq numeric(9,0),
    autoria character varying(4)
);


--
-- Name: ad_servico; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_servico (
    idservico numeric(9,0) NOT NULL,
    codservico numeric(9,0),
    descricao character varying(200),
    idelemento numeric(6,0),
    idsubelemento numeric(2,0),
    ativo character varying(1)
);


--
-- Name: ad_setoracesso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_setoracesso (
    setor character varying(15) NOT NULL,
    setorfilho character varying(15) NOT NULL
);


--
-- Name: ad_solicitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_solicitacao (
    idlicitacao numeric(9,0) NOT NULL,
    item numeric(9,0) NOT NULL,
    data date NOT NULL,
    quantidade numeric(8,2),
    status character varying(1),
    numero character varying(10)
);


--
-- Name: ad_sompal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_sompal (
    som character varying(4),
    numpro character varying(12)
);


--
-- Name: ad_subelemento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_subelemento (
    idelemento numeric(6,0) NOT NULL,
    idsubelemento numeric(2,0) NOT NULL,
    descricao character varying(100)
);


--
-- Name: ad_suplementacaoitem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_suplementacaoitem (
    idsuplementacaoitem numeric(9,0) NOT NULL,
    idlicitacao numeric(9,0) NOT NULL,
    item character varying(50),
    data date,
    quantidadesuplementar numeric(8,2),
    valorunitsuplementar numeric(12,2),
    idsuplementacaoitemref numeric(9,0),
    idrequisicao numeric(9,0) NOT NULL
);


--
-- Name: ad_taxi; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_taxi (
    dataini date NOT NULL,
    datafim date NOT NULL,
    valor numeric(8,2)
);


--
-- Name: ad_tipomanutencao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_tipomanutencao (
    idtipomanutencao integer NOT NULL,
    tipomanutencao character varying(30) NOT NULL
);


--
-- Name: ad_tipoprot; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_tipoprot (
    idtipoprot numeric(5,0) NOT NULL,
    tipo character varying(60),
    diretor character varying(1),
    gerente character varying(1),
    coord character varying(1)
);


--
-- Name: ad_tiporeq; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_tiporeq (
    idtiporeq numeric(5,0) NOT NULL,
    descricao character varying(30),
    idrubrica character varying(20)
);


--
-- Name: ad_tiposervint; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_tiposervint (
    idtiposervint numeric(5,0) NOT NULL,
    descricao character varying(30),
    idrubrica character varying(20),
    iduoprestadora numeric(9,0)
);


--
-- Name: ad_tipoveiculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_tipoveiculo (
    tipoveiculo numeric(1,0) NOT NULL,
    descricao character varying(20),
    valorkm numeric(6,2),
    valorfixo numeric(8,2)
);


--
-- Name: ad_trecho; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_trecho (
    idrequisicao numeric(9,0) NOT NULL,
    idpessoa numeric(9,0) NOT NULL,
    idtrecho numeric(9,0) NOT NULL,
    datahoraviagem date,
    origem character varying(50),
    destino character varying(50),
    codigoviagem character varying(20),
    situacao character varying(1)
);


--
-- Name: ad_uo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_uo (
    iduo numeric(9,0) NOT NULL,
    sigla character varying(30),
    nome character varying(50),
    tipo character varying(1),
    documentoref character varying(200),
    idsetor numeric(9,0) NOT NULL,
    saldopublico character varying(1),
    ativo character varying(1)
);


--
-- Name: cm_instituicao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_instituicao (
    idinstituicao numeric(9,0) NOT NULL,
    instituicao character varying(80),
    nome character varying(100),
    rua character varying(80),
    bairro character varying(50),
    cep character varying(8),
    telefone character varying(15),
    email character varying(50),
    fax character varying(15),
    cgc character varying(19),
    caixapostal character varying(15),
    idpais numeric(4,0) NOT NULL,
    idmunicipio character varying(5) NOT NULL,
    numero character varying(15),
    complemento character varying(15),
    mesmoif character varying(13) DEFAULT 'N'::character varying,
    sigla character varying(14),
    uasg character varying(6),
    campus character varying(50),
    status character varying(1) DEFAULT 'A'::bpchar NOT NULL,
    ug character varying(9)
);


--
-- Name: COLUMN cm_instituicao.mesmoif; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN cm_instituicao.mesmoif IS 'Identifica se a instituição pertence ao mesmo Instituto Federal';


--
-- Name: COLUMN cm_instituicao.sigla; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN cm_instituicao.sigla IS 'Sigla que irá identificar a instituição a qual o setor pertence';


--
-- Name: COLUMN cm_instituicao.uasg; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN cm_instituicao.uasg IS 'No. de identificação da Unidade Administrativa dos Serviços Gerais - UASG';


--
-- Name: COLUMN cm_instituicao.campus; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN cm_instituicao.campus IS 'Identifica o Estado e o campus da instituicao.';


--
-- Name: cm_setor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_setor (
    idsetor numeric(9,0) NOT NULL,
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
    idsetorsiape character varying(7),
    idpaisetor numeric(9,0),
    codigo character varying(4),
    idinstituicao numeric(9,0),
    siglas character varying(3),
    siglai character varying(14)
);


--
-- Name: COLUMN cm_setor.idinstituicao; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN cm_setor.idinstituicao IS 'Vinculo com a instituição que contém este setor';


--
-- Name: ad_uo_campus; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW ad_uo_campus AS
    SELECT ad_uo.iduo, cm_instituicao.instituicao AS campus, cm_setor.idsetor AS setor_origem FROM ad_uo, cm_setor, cm_instituicao WHERE ((ad_uo.idsetor = cm_setor.idsetor) AND (cm_setor.idinstituicao = cm_instituicao.idinstituicao));


--
-- Name: ad_uoalmox; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_uoalmox (
    iduoreq numeric(9,0) NOT NULL,
    iduoalmox numeric(9,0) NOT NULL
);


--
-- Name: ad_valetransporte; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_valetransporte (
    dataini date NOT NULL,
    datafim date,
    valor numeric(8,2)
);


--
-- Name: ad_veiculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ad_veiculo (
    placa character varying(7) NOT NULL,
    renavam character varying(12),
    chassis character varying(20),
    marca character varying(15),
    modelo character varying(20),
    anofab numeric(4,0),
    anomod numeric(4,0),
    capacidade numeric(3,0),
    combustivel character varying(1),
    ativo character varying(1),
    tipoveiculo numeric(1,0),
    valorkm numeric(9,2),
    idinstituicao numeric(9,0)
);


--
-- Name: bt_artigo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_artigo (
    idartigo integer NOT NULL,
    outrosautores character varying(400),
    resumos character varying(3000),
    idexemplarperiodico integer
);


--
-- Name: bt_assunto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_assunto (
    idassunto integer NOT NULL,
    idetiqueta integer NOT NULL,
    subcampo character(1),
    conteudo character varying(3000),
    indicador character(1),
    linha integer,
    ocorrencia integer,
    classificacao character varying(15)
);


--
-- Name: bt_assuntoobra; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_assuntoobra (
    idassunto integer NOT NULL,
    idobra integer NOT NULL,
    idmaterial integer NOT NULL,
    ocorrencia integer NOT NULL
);


--
-- Name: bt_autor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_autor (
    idautor integer DEFAULT 0 NOT NULL,
    sobrenome character varying(100),
    prenome character varying(100),
    cutter character varying(40)
);


--
-- Name: bt_camposfixos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_camposfixos (
    idetiqueta integer NOT NULL,
    idobra integer NOT NULL,
    conteudo character varying(50) NOT NULL,
    obra_temp integer,
    etiqueta_temp character varying(3)
);


--
-- Name: bt_camposfixosperiodico; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_camposfixosperiodico (
    idetiqueta integer NOT NULL,
    idperiodico integer NOT NULL,
    conteudo character varying(50) NOT NULL,
    periodico_temp integer,
    etiqueta_temp character varying(3)
);


--
-- Name: bt_camposubficha; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_camposubficha (
    idficha integer NOT NULL,
    idsubficha integer NOT NULL,
    idetiqueta integer NOT NULL,
    subcampo character(1) NOT NULL,
    ordem integer
);


--
-- Name: bt_codigobarra; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_codigobarra (
    idcodigobarra integer NOT NULL,
    numcodigobarra character(10),
    descricao character(2)
);


--
-- Name: bt_colecao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_colecao (
    idcolecao integer NOT NULL,
    mnemonico character varying(10),
    descricao character varying(45)
);


--
-- Name: bt_consulta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_consulta (
    idconsulta integer NOT NULL,
    mnemonico character varying(10)
);


--
-- Name: bt_consultacampo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_consultacampo (
    idconsulta integer NOT NULL,
    idetiqueta integer NOT NULL,
    subcampo character(1) NOT NULL
);


--
-- Name: bt_direito; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_direito (
    idregracirculacao integer NOT NULL,
    idoperacao integer NOT NULL,
    idgrupo integer NOT NULL
);


--
-- Name: bt_editora; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_editora (
    ideditora integer NOT NULL,
    descricao character varying(50) NOT NULL,
    endereco character varying(60),
    municipio character varying(40),
    cep character varying(12),
    telefone character varying(18),
    email character varying(50),
    site character varying(50),
    mnemonico character varying(20),
    cnpj character varying(18)
);


--
-- Name: bt_emprestimo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_emprestimo (
    idemprestimo integer NOT NULL,
    datahoradoemprestimo timestamp with time zone,
    datahoraprevisaodevolucao timestamp with time zone,
    datahoradadevolucao timestamp with time zone,
    quantidadederenovacoes integer,
    emprhoras character(1),
    idusuario numeric(9,0),
    idexemplar integer,
    usuario_temp character varying(20),
    exemplar_temp character varying(15)
);


--
-- Name: bt_estado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_estado (
    idestado integer NOT NULL,
    descricao character varying(40),
    mnemonico character varying(20)
);


--
-- Name: bt_etiqueta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_etiqueta (
    idetiqueta integer NOT NULL,
    tag character(3) NOT NULL,
    indicador1 character(1),
    indicador2 character(1),
    mnemonico character varying(10),
    descricao character varying(80),
    observacao character varying(80),
    temrepeticoes character(1),
    temsubcampos character(1),
    estaativo character(1),
    emlistas character(1),
    emdemonstracao character(1),
    obsoleto character(1)
);


--
-- Name: bt_etiquetalombada; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_etiquetalombada (
    idetiqueta integer NOT NULL,
    tipo character(1) NOT NULL,
    campo character(3) NOT NULL,
    subcampo character(1)
);


--
-- Name: bt_exemplar; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_exemplar (
    idexemplar integer NOT NULL,
    numerodotombo character varying(20) NOT NULL,
    codigodoexemplar character varying(20),
    notainterna character varying(200),
    volume character varying(15),
    preco character varying(30),
    notaopac character varying(100),
    notacirculacao character varying(100),
    numinventario character varying(200),
    idestado integer NOT NULL,
    idregracirculacao integer NOT NULL,
    idunidade integer NOT NULL,
    idcolecao integer,
    idobra integer NOT NULL,
    obra_temp integer,
    colecao_temp character varying(10)
);


--
-- Name: bt_exemplarperiodico; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_exemplarperiodico (
    volume character varying(15),
    numero character varying(30),
    ano integer,
    tituloedicao character varying(350),
    numerodotombo character varying(20),
    idexemplarperiodico integer NOT NULL,
    idperiodico integer NOT NULL,
    idestado integer NOT NULL,
    idregracirculacao integer NOT NULL,
    idunidade integer NOT NULL,
    idcolecao integer,
    edicao character varying(30),
    notaopac character varying(100),
    notacirculacao character varying(100) NOT NULL,
    codigoexemplar character varying(20),
    obra_temp integer,
    colecao_temp character varying(10),
    notainterna character varying(200),
    preco character varying(30)
);


--
-- Name: bt_exemplarperiodico_notacirculacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bt_exemplarperiodico_notacirculacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: bt_exemplarperiodico_notacirculacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bt_exemplarperiodico_notacirculacao_seq OWNED BY bt_exemplarperiodico.notacirculacao;


--
-- Name: bt_exportacao_temp; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_exportacao_temp (
    idobra integer NOT NULL,
    titulo text
);


--
-- Name: bt_ficha; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_ficha (
    idficha integer NOT NULL,
    categoria character(2) NOT NULL,
    nivel character(1) NOT NULL
);


--
-- Name: bt_genero; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_genero (
    idgenero integer NOT NULL,
    descricao character varying(40),
    idficha integer
);


--
-- Name: bt_grupo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_grupo (
    idgrupo integer NOT NULL,
    descricao character varying(40),
    nivel integer
);


--
-- Name: bt_indicadores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_indicadores (
    idindicador integer NOT NULL,
    idetiqueta integer,
    idobra integer,
    indicador character(1) NOT NULL,
    conteudo character(1),
    ocorrencia integer NOT NULL,
    obra_temp integer,
    etiqueta_temp character varying(3)
);


--
-- Name: bt_indicadoresperiodico; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_indicadoresperiodico (
    idindicador integer NOT NULL,
    idetiqueta integer,
    idperiodico integer,
    indicador character(1) NOT NULL,
    conteudo character(1),
    ocorrencia integer NOT NULL,
    periodico_temp integer,
    etiqueta_temp character varying(3)
);


--
-- Name: bt_infracao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_infracao (
    idinfracao integer NOT NULL,
    descricao character varying(40)
);


--
-- Name: bt_logoperacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_logoperacao (
    idlogoperacao integer NOT NULL,
    data date,
    identificador character varying(100),
    idusuario numeric(9,0),
    idoperacao integer NOT NULL,
    usuario_temp character varying(20),
    obra_temp integer,
    exemplar_temp character varying(20)
);


--
-- Name: bt_logoperacaodetalhe; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_logoperacaodetalhe (
    idlogoperacao integer NOT NULL,
    campo character varying(20) NOT NULL,
    valoranterior character varying(200),
    valornovo character varying(200)
);


--
-- Name: bt_material; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_material (
    idobra integer,
    idetiqueta integer,
    subcampo character(1) NOT NULL,
    conteudo character varying(3000),
    linha integer,
    idmaterial integer NOT NULL,
    ocorrencia integer,
    obra_temp integer,
    etiqueta_temp character varying(3)
);


--
-- Name: bt_material_assunto_artigo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_material_assunto_artigo (
    idmaterialassuntoartigo integer NOT NULL,
    idartigo integer,
    idassunto integer,
    idetiqueta integer,
    ocorrencia integer
);


--
-- Name: bt_material_autor_artigo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_material_autor_artigo (
    idartigo integer,
    idautor integer,
    idetiqueta integer,
    ocorrencia integer,
    idmaterialautorartigo integer NOT NULL
);


--
-- Name: bt_material_autor_artigo_idmaterialautorartigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bt_material_autor_artigo_idmaterialautorartigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: bt_material_autor_artigo_idmaterialautorartigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bt_material_autor_artigo_idmaterialautorartigo_seq OWNED BY bt_material_autor_artigo.idmaterialautorartigo;


--
-- Name: bt_materialartigo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_materialartigo (
    idetiqueta integer,
    idartigo integer,
    subcampo character(1) NOT NULL,
    conteudo character varying(3000),
    linha integer,
    idmaterial integer NOT NULL,
    ocorrencia integer,
    artigo_temp integer,
    etiqueta_temp character varying(3)
);


--
-- Name: bt_materialperiodico; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_materialperiodico (
    idperiodico integer,
    idetiqueta integer,
    subcampo character(1) NOT NULL,
    conteudo character varying(3000),
    linha integer,
    idmaterial integer NOT NULL,
    periodico_temp integer,
    etiqueta_temp character varying(3),
    ocorrencia integer
);


--
-- Name: bt_multa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_multa (
    idmulta integer NOT NULL,
    datahora date,
    valor numeric(10,2),
    observacao character varying(130),
    foipaga character(1),
    datahorapagamento date,
    idemprestimo integer
);


--
-- Name: bt_notainfracao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_notainfracao (
    idinfracao integer NOT NULL,
    idusuario numeric(9,0),
    notainfracao character varying(100),
    idnotainfracao integer NOT NULL,
    usuario_temp character varying(20)
);


--
-- Name: bt_obra; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_obra (
    idobra integer NOT NULL,
    numerodaobra integer NOT NULL,
    titulo character varying(350),
    autor character varying(200),
    edicao character varying(30),
    localpublicacao character varying(200),
    datapublicacao character varying(30),
    idgenero integer NOT NULL,
    subtitulo character varying(250),
    descfisica character varying(80),
    ideditora integer,
    idautor integer,
    editora character varying(50)
);


--
-- Name: bt_observacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_observacao (
    idusuario numeric(9,0),
    idobservacao integer NOT NULL,
    descricao character varying(150),
    usuario_temp character varying(20)
);


--
-- Name: bt_opcao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_opcao (
    idopcao integer NOT NULL,
    descricao character varying(50)
);


--
-- Name: bt_opcaolista; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_opcaolista (
    idopcao integer NOT NULL,
    idopcaolista integer NOT NULL,
    indice character varying(10),
    texto character varying(100),
    ordem character varying(10)
);


--
-- Name: bt_operacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_operacao (
    idoperacao integer NOT NULL,
    descricao character varying(40),
    mnemonico character varying(20)
);


--
-- Name: bt_periodico; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_periodico (
    idperiodico integer NOT NULL,
    ideditora integer,
    idgenero integer
);


--
-- Name: bt_permitemulta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_permitemulta (
    idpermitemulta integer NOT NULL,
    permitemulta character(1),
    CONSTRAINT bt_permitemulta_permitemulta_check CHECK ((permitemulta = ANY (ARRAY['M'::bpchar, 'N'::bpchar, 'P'::bpchar])))
);


--
-- Name: bt_politica; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_politica (
    idgrupo integer NOT NULL,
    idregracirculacao integer NOT NULL,
    diasdeemprestimo integer NOT NULL,
    limitedeemprestimo integer NOT NULL,
    limitederenovacao integer NOT NULL,
    limitedereserva integer NOT NULL,
    valordamulta numeric(10,2) NOT NULL,
    diasdereserva integer NOT NULL,
    idpolitica integer NOT NULL,
    horadevolucao character varying(8) NOT NULL
);


--
-- Name: bt_posicao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_posicao (
    idetiqueta integer NOT NULL,
    posicao character(3) NOT NULL,
    descricao character varying(50),
    idopcao integer
);


--
-- Name: bt_posicaosubficha; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_posicaosubficha (
    idetiqueta integer NOT NULL,
    posicao character(3) NOT NULL,
    idficha integer NOT NULL,
    idsubficha integer NOT NULL
);


--
-- Name: bt_regracirculacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_regracirculacao (
    idregracirculacao integer NOT NULL,
    descricao character varying(40)
);


--
-- Name: bt_reserva; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_reserva (
    idreserva integer NOT NULL,
    datahoradareserva date,
    datahoradasituacao date,
    datahoraentrada date,
    datahoralimite date,
    foiavisado character(1),
    foiconfirmada character(1),
    idsituacao integer NOT NULL,
    idusuario numeric(9,0),
    idexemplar integer,
    usuario_temp character varying(20),
    exemplar_temp character varying(15)
);


--
-- Name: bt_situacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_situacao (
    idsituacao integer NOT NULL,
    descricao character varying(40),
    mnemonico character varying(20)
);


--
-- Name: bt_subcampo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_subcampo (
    idetiqueta integer NOT NULL,
    subcampo character(1) NOT NULL,
    descricao character varying(80),
    temrepeticoes integer,
    estaativo integer,
    emlistas integer,
    emdemonstracao integer,
    obsoleto integer,
    mnemonico character varying(10),
    observacao character varying(400),
    emconsultas integer,
    idopcao integer
);


--
-- Name: bt_subficha; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_subficha (
    idficha integer NOT NULL,
    idsubficha integer NOT NULL,
    titulo character varying(40) NOT NULL
);


--
-- Name: bt_transicao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_transicao (
    idestadopresente integer NOT NULL,
    idestadofuturo integer NOT NULL,
    idoperacao integer NOT NULL
);


--
-- Name: bt_unidade; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_unidade (
    idunidade integer NOT NULL,
    descricao character varying(50),
    mnemonico character varying(6),
    idsetor integer
);


--
-- Name: bt_usuarioexterno; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_usuarioexterno (
    idusuario numeric(9,0) NOT NULL,
    numrg character varying(15) NOT NULL,
    nome character varying(55) NOT NULL,
    telefone character varying(20) NOT NULL,
    endereco character varying(80),
    bairro character varying(50),
    cep character varying(8),
    idmunicipio character varying(5) NOT NULL,
    datanasc date NOT NULL,
    datapermissaoemprestimo date DEFAULT ('now'::text)::date
);


--
-- Name: bt_validacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_validacao (
    idvalidacao integer NOT NULL,
    dtvalidacao date,
    dtvalidacaoant date,
    codigoacesso character(10),
    idusuario numeric(9,0),
    usuario_temp character varying(20),
    datapermissaoemprestimo date DEFAULT ('now'::text)::date
);


--
-- Name: bt_vinculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bt_vinculo (
    idgrupo integer NOT NULL,
    idusuario numeric(9,0) NOT NULL,
    usuario_temp character varying(20)
);


--
-- Name: cm_acesso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_acesso (
    idgrupo numeric(5,0) NOT NULL,
    idtrans numeric(9,0) NOT NULL,
    direito numeric(9,0) NOT NULL
);


--
-- Name: cm_agencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_agencia (
    idbanco numeric(4,0) NOT NULL,
    idagenc character varying(7) NOT NULL,
    nome character varying(50)
);


--
-- Name: cm_arquivo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_arquivo (
    idarquivo numeric(9,0) NOT NULL,
    md5 character varying(32) NOT NULL,
    nome character varying(50) NOT NULL,
    caminho character varying(200),
    tipomime character varying(25),
    tamanho numeric(10,0),
    mesreferencia numeric(2,0),
    anoreferencia numeric(4,0),
    idusuario numeric(9,0),
    datagravacao date,
    processado character varying(1),
    dataprocessamento date,
    nomearqlog character varying(50),
    caminhoarqlog character varying(200),
    scriptprocessamento character varying(50),
    caminhoscript character varying(200),
    obs date
);


--
-- Name: cm_banco; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_banco (
    idbanco numeric(4,0) NOT NULL,
    nome character varying(50),
    ativo character varying(1)
);


--
-- Name: cm_estadocivil; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_estadocivil (
    idestadocivil numeric(1,0) NOT NULL,
    estadocivil character varying(30)
);


--
-- Name: cm_feriado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_feriado (
    data date NOT NULL,
    descricao character varying(30),
    abrangencia character(1)
);


--
-- Name: cm_grpusuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_grpusuario (
    idgrupo numeric(5,0) NOT NULL,
    idusuario numeric(9,0) NOT NULL
);


--
-- Name: cm_grupoacesso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_grupoacesso (
    idgrupo numeric(5,0) NOT NULL,
    grupo character varying(50)
);


--
-- Name: cm_indice; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_indice (
    sigla character varying(10) NOT NULL,
    nome character varying(60)
);


--
-- Name: cm_indicemensal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_indicemensal (
    idindicemensal numeric(5,0) NOT NULL,
    ano numeric(4,0) NOT NULL,
    mes numeric(2,0) NOT NULL,
    valor numeric(18,6),
    sigla character varying(10) NOT NULL
);


--
-- Name: cm_inss; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_inss (
    dataini timestamp with time zone,
    datafim timestamp with time zone,
    idinss numeric(9,0) NOT NULL,
    ate character varying(50),
    percentual character varying(100),
    fixo character varying(10),
    percpatronal character varying(50)
);


--
-- Name: cm_irrf; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_irrf (
    idirrf numeric(5,0) NOT NULL,
    dataini timestamp with time zone,
    datafim timestamp with time zone,
    aliquota character varying(50),
    ate character varying(50),
    percentual numeric(9,2),
    deducao numeric(9,2)
);


--
-- Name: cm_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_log (
    idlog numeric(15,0) NOT NULL,
    "timestamp" date NOT NULL,
    descricao character varying(200),
    operacao character varying(3),
    idusuario numeric(9,0) NOT NULL,
    modulo character varying(20) NOT NULL,
    classe character varying(30) NOT NULL
);


--
-- Name: cm_logant; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_logant (
    idlog integer NOT NULL,
    "timestamp" date NOT NULL,
    descricao character varying(200),
    operacao character(3),
    idusuario integer NOT NULL,
    modulo character varying(20) NOT NULL,
    classe character varying(30) NOT NULL
);


--
-- Name: cm_municipio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_municipio (
    idmunicipio character varying(5) NOT NULL,
    municipio character varying(50),
    iduf character varying(4) NOT NULL,
    idpais numeric(4,0) NOT NULL,
    categoriadiaria character varying(1),
    populacao numeric(9,0)
);


--
-- Name: cm_noticia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_noticia (
    idsistema numeric(4,0) NOT NULL,
    idnoticia numeric(9,0) NOT NULL,
    dtnoticia date,
    noticia character varying(1000)
);


--
-- Name: cm_organograma; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_organograma (
    idtipoorganograma numeric(5,0) NOT NULL,
    idsetor numeric(9,0) NOT NULL,
    idsetorpai numeric(9,0) NOT NULL
);


--
-- Name: cm_pais; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_pais (
    idpais numeric(4,0) NOT NULL,
    pais character varying(50),
    nacionalidade character varying(50)
);


--
-- Name: cm_pessoa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_pessoa (
    idpessoa numeric(9,0) NOT NULL,
    nome character varying(55) NOT NULL,
    bairro character varying(50),
    cep character varying(8) NOT NULL,
    datanasc date NOT NULL,
    nomepai character varying(55),
    nomemae character varying(55),
    sexo character varying(1) NOT NULL,
    anochegbrasil character varying(4),
    telefone character varying(20),
    celular character varying(20),
    email character varying(50),
    gruposanguineo character varying(3),
    cpf character varying(11),
    numrg character varying(15),
    tiporg character varying(20),
    orgaorg character varying(20),
    ufrg character varying(2),
    numcartpro character varying(10),
    seriecartpro character varying(5),
    ufcartpro character varying(2),
    tituloeleitor character varying(20),
    zonatitulo numeric(5,0),
    secaotitulo numeric(5,0),
    uftitulo character varying(2),
    numdocmilitar character varying(12),
    seriedocmilitar character varying(1),
    categdocmilitar numeric(5,0),
    conta character varying(20),
    numcert numeric(5,0),
    livrocert character varying(10),
    folhacert numeric(5,0),
    cartorio character varying(60),
    pispasep character varying(15),
    datapispasep date,
    bancopispasep numeric(4,0),
    identprof character varying(15),
    tipoidentprof character varying(20),
    idpais numeric(4,0) NOT NULL,
    idmunicipio character varying(5) NOT NULL,
    idmunicipionascimento character varying(5),
    idpaisnascimento numeric(4,0) NOT NULL,
    idestadocivil numeric(1,0),
    idbanco numeric(4,0),
    idagenc character varying(7),
    idpaisnacionalidade numeric(4,0),
    tipodocmilitar character varying(3),
    orgexpdocmilitar character varying(3),
    dataultalt date,
    raca character varying(1),
    atvremunerada character varying(1),
    acessonet character varying(1),
    datarg date,
    endereco character varying(80),
    passaporte character varying(20),
    datacartest timestamp without time zone
);


--
-- Name: cm_planosaude; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_planosaude (
    login character varying(50) NOT NULL,
    idpessoa numeric(9,0),
    planosaude character varying(50)
);


--
-- Name: cm_sessao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_sessao (
    idsessao numeric(10,0) NOT NULL,
    tsin date,
    tsout date,
    name character varying(50),
    sid character varying(32),
    forced character varying(1),
    idusuario numeric(9,0),
    remoteaddr character varying(15)
);


--
-- Name: cm_setoracesso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_setoracesso (
    idsetor numeric(9,0) NOT NULL,
    idsetoracesso numeric(9,0) NOT NULL,
    finalidade character varying(15) NOT NULL
);


--
-- Name: cm_setorequivalente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_setorequivalente (
    idsetor numeric(9,0) NOT NULL,
    idsetorequivalente numeric(9,0) NOT NULL
);


--
-- Name: cm_setornovo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_setornovo (
    idsetor numeric(9,0) NOT NULL,
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
    idsetorsiape character varying(7),
    idpaisetor numeric(9,0),
    codigo character varying(4),
    idinstituicao numeric(9,0)
);


--
-- Name: cm_sistema; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_sistema (
    idsistema numeric(4,0) NOT NULL,
    sistema character varying(30)
);


--
-- Name: cm_tabelageral; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_tabelageral (
    idtabelageral numeric(9,0) NOT NULL,
    tabela character varying(30) NOT NULL,
    item1 character varying(30) NOT NULL,
    item2 character varying(50),
    item3 character varying(200)
);


--
-- Name: cm_tabelasigaept; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_tabelasigaept (
    idtabelasigaept numeric(5,0) NOT NULL,
    tabela character varying(30) NOT NULL,
    item1 character varying(30) NOT NULL,
    item2 character varying(50),
    item3 character varying(200)
);


--
-- Name: cm_tipoorganograma; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_tipoorganograma (
    idtipoorganograma numeric(5,0) NOT NULL,
    sigla character varying(20),
    descricao character varying(100)
);


--
-- Name: cm_transacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_transacao (
    idtrans numeric(9,0) NOT NULL,
    transacao character varying(30),
    idsistema numeric(4,0) NOT NULL
);


--
-- Name: cm_uf; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_uf (
    iduf character varying(4) NOT NULL,
    uf character varying(50)
);


--
-- Name: cm_usuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cm_usuario (
    idusuario numeric(9,0) NOT NULL,
    idpessoa numeric(9,0) NOT NULL,
    idsetor numeric(9,0) NOT NULL,
    login character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    nick character varying(80),
    passmd5 character varying(32)
);


--
-- Name: ga_aluno; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ga_aluno (
    matricula character(20) NOT NULL,
    anoconcl2gr character varying(4),
    anoingresso character varying(4) NOT NULL,
    semingresso character varying(1) NOT NULL,
    situacaoaluno character varying(15) NOT NULL,
    idtipoingresso character(2) NOT NULL,
    idmotivosaida character(2),
    idsituacao character(2) NOT NULL,
    idinstituicao numeric(9,0) NOT NULL,
    idpessoa numeric(9,0) NOT NULL,
    escola2g integer,
    cidade2g integer,
    pais2g integer,
    idinstituicaodest numeric(9,0),
    obs character varying(300),
    obsperiodo character varying(300)
);


--
-- Name: ga_situacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ga_situacao (
    idsituacao character(2) NOT NULL,
    situacao character varying(20)
);


--
-- Name: rh_acessoproades; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_acessoproades (
    idproades integer NOT NULL,
    idusuario integer NOT NULL
);


--
-- Name: rh_adicional; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_adicional (
    idvinculo numeric(7,0) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    idadicional character(1) NOT NULL,
    grau character varying(6),
    obs character varying(500)
);


--
-- Name: rh_ambiente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ambiente (
    idambiente integer NOT NULL,
    descricao character varying(50)
);


--
-- Name: rh_assunto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_assunto (
    idreuniao integer NOT NULL,
    idassunto integer NOT NULL,
    assunto character varying(500)
);


--
-- Name: rh_atividade; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_atividade (
    idatividade integer NOT NULL,
    idvinculo numeric(7,0),
    datainicio date,
    datafim date,
    atividade character varying(500)
);


--
-- Name: rh_ativproades; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ativproades (
    idatividade integer NOT NULL,
    descricao character varying(200),
    idmeta integer NOT NULL
);


--
-- Name: rh_ausente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ausente (
    idausente integer NOT NULL,
    idvinculo numeric(7,0) NOT NULL,
    idreuniao integer NOT NULL,
    justificado character(1) NOT NULL
);


--
-- Name: rh_averbacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_averbacao (
    idaverbacao integer NOT NULL,
    processo character(21),
    datainicio date,
    datafim date,
    totaldias integer,
    tipotempo character varying(7),
    instituicao character varying(120),
    idvinculo numeric(7,0) NOT NULL
);


--
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
-- Name: rh_baseaposentadoria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_baseaposentadoria (
    idvinculo numeric(7,0) NOT NULL,
    mes integer NOT NULL,
    ano integer NOT NULL,
    valorbase integer,
    valorpss integer
);


--
-- Name: rh_capacitacaocoinc; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_capacitacaocoinc (
    idmodulo1 integer NOT NULL,
    idmodulo2 integer NOT NULL
);


--
-- Name: rh_capacitacaocoinc2; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_capacitacaocoinc2 (
    idcurso1 character(5) NOT NULL,
    idcurso2 character(5) NOT NULL
);


--
-- Name: rh_capacitacaocurso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_capacitacaocurso (
    idcurso integer NOT NULL,
    nome character varying(100) NOT NULL,
    idinstituicao numeric(9,0),
    obs character varying(50),
    cargahoraria character varying(50),
    datainicio timestamp without time zone,
    datafim timestamp without time zone
);


--
-- Name: rh_capacitacaocurso2; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_capacitacaocurso2 (
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
-- Name: rh_capacitacaoinsc; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_capacitacaoinsc (
    inscricao integer NOT NULL,
    idvinculo numeric(7,0) NOT NULL,
    idmodulo integer NOT NULL,
    telefone character(20),
    turno character(10),
    ambiente character varying(100),
    justificativa character varying(2000),
    status character(1),
    ts character(20) NOT NULL,
    idauth character(7),
    tsauth character(20)
);


--
-- Name: rh_capacitacaoinsc2; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_capacitacaoinsc2 (
    inscricao integer NOT NULL,
    idvinculo numeric(7,0) NOT NULL,
    idcurso character(5) NOT NULL,
    telefone character(20),
    turno character(10),
    ambiente character varying(100),
    justificativa character varying(2000),
    status character(1),
    ts character(20) NOT NULL,
    idauth character(7),
    tsauth character(20)
);


--
-- Name: rh_capacitacaomodulo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_capacitacaomodulo (
    idmodulo integer NOT NULL,
    idcurso integer NOT NULL,
    modulo character(3) NOT NULL,
    nome character varying(100) NOT NULL,
    datainicio date,
    datafim date,
    horainicio character(5),
    horafim character(5),
    cargahoraria character(5),
    local character varying(100),
    vagas character(3),
    turno character(1),
    status character(1),
    diasemana character varying(50),
    anosemestre character(6),
    observacoes character varying(200)
);


--
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
-- Name: rh_cargoconfianca; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_cargoconfianca (
    idcargoconfianca integer NOT NULL,
    descricao character varying(60) NOT NULL
);


--
-- Name: rh_cessao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_cessao (
    idvinculo numeric(7,0) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    obs character varying(500),
    tipoonus character varying(15),
    tipocessao character varying(20),
    tipoinstituicao character(1),
    idgrupoocorrencia integer NOT NULL,
    idocorrencia integer NOT NULL,
    idinstituicao numeric(9,0) NOT NULL,
    idpublicacao integer
);


--
-- Name: rh_cidcategoria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_cidcategoria (
    idcidcategoria character(3) NOT NULL,
    opc character(1),
    descricao character varying(60)
);


--
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
-- Name: rh_cirurgia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_cirurgia (
    codigo integer NOT NULL,
    descricao character varying(125) NOT NULL,
    sexo character(1) NOT NULL
);


--
-- Name: rh_classe; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_classe (
    idclasse integer NOT NULL,
    classe character varying(20) NOT NULL,
    descricao character varying(30) NOT NULL,
    categoria character varying(6) NOT NULL,
    ordemprogressao integer
);


--
-- Name: rh_classegrupocargo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_classegrupocargo (
    idclasse integer,
    idclassegrupocargo integer NOT NULL,
    idgrupocargo integer
);


--
-- Name: rh_contagem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_contagem (
    idvinc integer NOT NULL,
    nome character varying(60),
    sexo character(1),
    dtnasc date,
    dtingsp date,
    grupocargo character(3),
    diasaverb integer,
    diaslicenca integer,
    diasfalta integer
);


--
-- Name: rh_contrato; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_contrato (
    idcontrato integer NOT NULL,
    numcontrato character varying(12),
    datainicio date,
    datafim date,
    dataprorrogacao date,
    idinstituicao numeric(9,0) NOT NULL,
    idsetor integer NOT NULL,
    objeto character varying(200),
    obs character varying(500)
);


--
-- Name: rh_contratoprovterceirizado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_contratoprovterceirizado (
    idterceirizado integer NOT NULL,
    datainicio date NOT NULL,
    idcontrato integer NOT NULL
);


--
-- Name: rh_decisao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_decisao (
    idreuniao integer NOT NULL,
    iddecisao integer NOT NULL,
    decisao character varying(300)
);


--
-- Name: rh_dependencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_dependencia (
    iddependente integer NOT NULL,
    idtipodependencia character(2) NOT NULL,
    datainicio date NOT NULL,
    datafim date
);


--
-- Name: rh_dependente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_dependente (
    iddependente integer NOT NULL,
    parentesco integer NOT NULL,
    idpessoa integer,
    idfuncionario numeric(9,0) NOT NULL
);


--
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
-- Name: rh_diplomalegal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_diplomalegal (
    iddiplomalegal integer NOT NULL,
    descricao character varying(20)
);


--
-- Name: rh_dtlimiteferias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_dtlimiteferias (
    iddtlimiteferias integer NOT NULL,
    mesprevisto character(2) NOT NULL,
    anoprevisto character(4) NOT NULL,
    dtlimite date
);


--
-- Name: rh_encaminhamento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_encaminhamento (
    idreuniao integer NOT NULL,
    idencaminhamento integer NOT NULL,
    encaminhamento character varying(300)
);


--
-- Name: rh_equipe; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_equipe (
    idequipe integer NOT NULL,
    idproades integer NOT NULL,
    categoriaequipe integer,
    nome character varying(50)
);


--
-- Name: rh_escala; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_escala (
    descricao character varying(20),
    idescala integer NOT NULL
);


--
-- Name: rh_escolaridadepcctae; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_escolaridadepcctae (
    idescolaridadepcctae integer NOT NULL,
    escolaridade integer,
    descricao character varying(100)
);


--
-- Name: rh_ferias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ferias (
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
    abonoconst character(1) NOT NULL,
    idvinculoperaq numeric(7,0) NOT NULL
);


--
-- Name: rh_fichaclinica; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_fichaclinica (
    idfichaclinica integer NOT NULL,
    idvinculo numeric(7,0) NOT NULL,
    data date NOT NULL,
    tipoexame character(1) NOT NULL,
    funcanterior character varying(150),
    queixaclinica character varying(2000),
    antclinico character varying(2000),
    cidantclinico character varying(2000),
    antcirurgico character varying(2000),
    sihantcirurgico character varying(2000),
    epilepsia character varying(2000),
    medicamento character varying(2000),
    tabagismo character varying(2000),
    etilismo character varying(2000),
    alergia character varying(2000),
    pa character varying(75),
    pulso character varying(75),
    complementar character varying(2000),
    pendente character varying(2000),
    tempoprof character varying(150),
    tempoufjf character varying(150),
    atvfisica character varying(2000),
    frequencia character varying(150),
    turno character(1),
    colegas character(1),
    superiores character(1),
    familiares character(1),
    agrada character(1),
    ferias date,
    cndtrabalho character varying(2000),
    peso character varying(25),
    altura character varying(25),
    imc character varying(25),
    r character varying(25),
    ca character varying(25),
    dntfrequencia character(1),
    dntperdido character(1),
    exmvista character(1),
    audicao character(1),
    dorlocal character varying(150),
    anmpostural character varying(150),
    supdor character varying(150),
    suplocal character varying(150),
    supoutro character varying(2000),
    infdor character varying(150),
    infparesia character(1),
    infoutro character varying(2000),
    fncintestinal character varying(2000),
    avaurologica character varying(2000),
    uroutro character varying(2000),
    diurese character varying(150),
    menarca character varying(25),
    clcmenstrual character varying(25),
    dum character varying(25),
    dstmenstrual character varying(150),
    preventivo date,
    g character varying(25),
    p character varying(25),
    a character varying(25),
    flhvivo character varying(25),
    parto character varying(150),
    contraceptivo character varying(150),
    rubeola character(1),
    meningite character(1),
    hepatite character(1),
    tuberculose character(1),
    sarampo character(1),
    tetano character(1),
    poliomelite character(1),
    coqueluche character(1),
    gripe character(1),
    vcnoutros character varying(2000),
    cage_1 character(1),
    cage_2 character(1),
    cage_3 character(1),
    cage_4 character(1),
    fage_1 character(1),
    fage_2 character(1),
    fage_3 character(1),
    fage_4 character(1),
    fage_5 character(1),
    fage_6 character(1),
    antocupacional character varying(2000),
    adcoutros character varying(2000),
    infalteracoes character varying(150),
    inflocal character varying(150),
    intalteracoes character varying(2000),
    risco_quimico character(1),
    risco_fisico character(1),
    risco_biologico character(1),
    risco_ruido character(1),
    deformidade character(1),
    edema character(1),
    variz character(1),
    infparestesia character(1),
    suparesia character(1),
    suparestesia character(1),
    fisico character varying(2000),
    jornadaufjf character varying(150),
    jornadatotal character varying(150)
);


--
-- Name: rh_fitaespelho; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_fitaespelho (
    afast_dip_cod character varying(10),
    afast_dip_dt character varying(10),
    afast_dip_num character varying(10),
    afast_dt_inic character varying(10),
    afast_dt_term character varying(10),
    afast_grupo character varying(10),
    afast_ocor character varying(10),
    agencia character varying(10),
    ano_chegada character varying(10),
    anomes character varying(10),
    apos_ano_prev character varying(10),
    apos_num_proc character varying(10),
    apos_opcao_int character varying(10),
    ativid_funcao character varying(10),
    banco character varying(10),
    cargo_classe character varying(10),
    cargo_dt_entrad character varying(10),
    cargo_dt_saida character varying(10),
    cargo_grupo character varying(10),
    cargo_nome character varying(10),
    cargo_ref_nivel character varying(10),
    cart_trab_num character varying(10),
    cart_trab_serie character varying(10),
    cart_trab_uf character varying(10),
    cod_org_extinto character varying(10),
    cod_situacao character varying(10),
    codigo_vaga character varying(10),
    conta character varying(10),
    cpf character varying(10),
    dt_cadast_serv character varying(10),
    dt_exc_instit character varying(10),
    dt_nascimento character varying(10),
    dt_prim_emp character varying(10),
    dt_supr_pagto character varying(10),
    dv_matricula character varying(10),
    end_bairro character varying(10),
    end_cep character varying(10),
    end_complemento character varying(10),
    end_logradouro character varying(10),
    end_municipio character varying(10),
    end_numero character varying(10),
    end_uf character varying(10),
    escolaridade character varying(10),
    estado_civil character varying(10),
    exclus_dip_cod character varying(10),
    exclus_dip_dt character varying(10),
    exclus_dip_num character varying(10),
    exclus_dt character varying(10),
    exclus_grupo character varying(10),
    exclus_ocor character varying(10),
    fgts_agencia character varying(10),
    fgts_banco character varying(10),
    fgts_conta character varying(10),
    fgts_dt_opcao character varying(10),
    filler1 character varying(10),
    funcao_codnivel character varying(10),
    funcao_dt_ingr character varying(10),
    funcao_dt_saida character varying(10),
    funcao_escolar character varying(10),
    funcao_opcao character varying(10),
    funcao_sigla character varying(10),
    funcao_unid_org character varying(10),
    ica_13_salario character varying(10),
    ica_abate_teto character varying(10),
    ica_adiant_13 character varying(10),
    ica_adiant character varying(10),
    ica_adic_tempo character varying(10),
    ica_beneficios character varying(10),
    ica_cargo character varying(10),
    ica_cont_sind character varying(10),
    ica_dif_urv character varying(10),
    ica_ferias character varying(10),
    ica_fgts character varying(10),
    ica_funcao character varying(10),
    ica_inss character varying(10),
    ica_ipmf_cpmf character varying(10),
    ica_ir character varying(10),
    ica_margem_cons character varying(10),
    ica_pensao character varying(10),
    ica_pss_6 character varying(10),
    ica_rais character varying(10),
    ica_rend_pasep character varying(10),
    ica_sal_familia character varying(10),
    identif_origem character varying(10),
    inativ_dip_cod character varying(10),
    inativ_dip_dt character varying(10),
    inativ_dip_num character varying(10),
    inativ_dt character varying(10),
    inativ_grupo character varying(10),
    inativ_ocor character varying(10),
    ind_exc_instit character varying(10),
    ind_oper_raiox character varying(10),
    ind_supr_pagto character varying(10),
    indic_pag_serv character varying(10),
    ing_org_dip_cod character varying(10),
    ing_org_dip_dt character varying(10),
    ing_org_dip_num character varying(10),
    ing_org_dt character varying(10),
    ing_org_grupo character varying(10),
    ing_org_ocor character varying(10),
    ing_sp_dip_cod character varying(10),
    ing_sp_dip_dt character varying(10),
    ing_sp_dip_num character varying(10),
    ing_sp_dt character varying(10),
    ing_sp_grupo character varying(10),
    ing_sp_ocor character varying(10),
    jornada_trab character varying(10),
    local_orgao character varying(10),
    local_unid_org character varying(10),
    lotac_unid_dt character varying(10),
    lotac_unid_org character varying(10),
    mat_serv_extint character varying(10),
    matric_anterior character varying(10),
    matric_atual character varying(10),
    mes_anuenio character varying(10),
    mod_fun_dip_cod character varying(10),
    mod_fun_dip_dt character varying(10),
    mod_fun_dip_num character varying(10),
    mod_fun_dt character varying(10),
    mod_fun_grupo character varying(10),
    mod_fun_ocor character varying(10),
    mud_org_destino character varying(10),
    mud_org_dt_lib character varying(10),
    mud_org_origem character varying(10),
    mud_upag_codigo character varying(10),
    mud_upag_dt_lib character varying(10),
    mud_upag_motivo character varying(10),
    nacionalidade character varying(10),
    naturalidade character varying(10),
    nome_mae character varying(10),
    nome_servidor character varying(10),
    nov_fc_codnivel character varying(10),
    nov_fc_dt_ingr character varying(10),
    nov_fc_dt_saida character varying(10),
    nov_fc_escolar character varying(10),
    nov_fc_opcao character varying(10),
    nov_fc_sigla character varying(10),
    nov_fc_unid_org character varying(10),
    obito_cartori0 character varying(10),
    obito_dt character varying(10),
    obito_folha character varying(10),
    obito_livro character varying(10),
    obito_registro character varying(10),
    orgao_anterior character varying(10),
    orgao_atual character varying(10),
    orgao_requisit character varying(10),
    pais character varying(10),
    perc_oper_raiox character varying(10),
    perc_tempo_serv character varying(10),
    pis_pasep character varying(10),
    posse_dip_cod character varying(10),
    posse_dip_dt character varying(10),
    posse_dip_num character varying(10),
    posse_dt character varying(10),
    posse_grupo character varying(10),
    posse_ocor character varying(10),
    proporc_denomin character varying(10),
    proporc_numerad character varying(10),
    quant_dep_ir character varying(10),
    quant_dep_sf character varying(10),
    reg_jur_ant character varying(10),
    regime_juridico character varying(10),
    rev_ati_dip_cod character varying(10),
    rev_ati_dip_dt character varying(10),
    rev_ati_dip_num character varying(10),
    rev_ati_dt character varying(10),
    rev_ati_grupo character varying(10),
    rev_ati_ocor character varying(10),
    rg_dt_emissao character varying(10),
    rg_numero character varying(10),
    rg_orgao character varying(10),
    rg_uf character varying(10),
    sexo character varying(10),
    siape character varying(10),
    sigla_uf character varying(10),
    sit_serv_ant character varying(10),
    tipo_registro character varying(10),
    tit_eleitor character varying(10),
    titulacao character varying(10),
    unid_pagadora character varying(10),
    uorg_controle character varying(10),
    vale_al_dt_fim character varying(10),
    vale_al_dt_inic character varying(10),
    vale_al_tipo character varying(10)
);


--
-- Name: rh_formacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_formacao (
    idformacao integer NOT NULL,
    formacao character varying(40),
    escolaridade character(2),
    habsiape integer
);


--
-- Name: rh_funcao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_funcao (
    idfuncao integer NOT NULL,
    idnivel integer NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    descricao character varying(100) NOT NULL,
    idpublicacaoinicio integer,
    idpublicacaofim integer,
    idsetor integer NOT NULL,
    mandato integer,
    idcargoconfianca integer,
    idcurso character varying(20)
);


--
-- Name: rh_funcaoatual; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_funcaoatual (
    idvinculo numeric(7,0) NOT NULL,
    funcao character(3)
);


--
-- Name: rh_funcaoterceirizado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_funcaoterceirizado (
    idfuncaoterceirizado integer NOT NULL,
    descricao character varying(40)
);


--
-- Name: rh_funcionario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_funcionario (
    idfuncionario numeric(9,0) NOT NULL,
    escolaridade integer,
    ufempregoanterior character(2),
    dataprimeiroemprego date,
    idpessoa integer
);


--
-- Name: rh_grupocargo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_grupocargo (
    idgrupocargo integer NOT NULL,
    descricao character varying(40) NOT NULL
);


--
-- Name: rh_grupolicafast; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_grupolicafast (
    idtipolicafast integer NOT NULL,
    idgrupoocorrencia integer NOT NULL,
    idocorrencia integer NOT NULL
);


--
-- Name: rh_grupoocorrencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_grupoocorrencia (
    idgrupoocorrencia integer NOT NULL,
    descricao character varying(30) NOT NULL
);


--
-- Name: rh_histcapacitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_histcapacitacao (
    idhistcapacitacao integer NOT NULL,
    idfuncionario numeric(9,0) NOT NULL,
    idcurso integer,
    idmodulo integer,
    datacapacitacao date,
    dataprogressao date,
    compativelcargo character(1),
    compativelambiente character(1)
);


--
-- Name: rh_histformacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_histformacao (
    idfuncionario numeric(9,0) NOT NULL,
    idformacao integer NOT NULL,
    idhistformacao integer NOT NULL,
    datafim date,
    entidade character varying(100),
    idescolaridadepcctae integer,
    dataincentivo date,
    dataatualizacao date,
    nomecurso character varying(100)
);


--
-- Name: rh_histincentivo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_histincentivo (
    idhistincentivo integer NOT NULL,
    idhistformacao integer,
    idhisttitulacao integer,
    idpercqualificacao integer,
    idvinculo numeric(7,0),
    relacao character varying(50),
    percentualaplicado double precision,
    dataincentivo date
);


--
-- Name: rh_historico; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_historico (
    idhistorico integer NOT NULL,
    datainicio date,
    datafim date,
    obs character varying(5000),
    idvinculo numeric(7,0)
);


--
-- Name: rh_histtitulacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_histtitulacao (
    idhisttitulacao integer NOT NULL,
    idtitulacao integer NOT NULL,
    datafim date NOT NULL,
    entidade character varying(100),
    titulotrabalhofinal character varying(120),
    tipotrabalhofinal character varying(20),
    areaconcentracao character varying(100),
    idfuncionario numeric(9,0) NOT NULL,
    nomecurso character varying(100),
    idescolaridadepcctae integer,
    dataincentivo date,
    dataatualizacao date
);


--
-- Name: rh_histvantagem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_histvantagem (
    idvinculo numeric(7,0) NOT NULL,
    idvantagem character varying(20) NOT NULL,
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
-- Name: rh_idunicatemp; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_idunicatemp (
    idfuncionario numeric(9,0),
    idvinculo numeric(7,0)
);


--
-- Name: rh_jornada; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_jornada (
    idjornada integer NOT NULL,
    descricao character varying(20) NOT NULL
);


--
-- Name: rh_licafast; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_licafast (
    idvinculo numeric(7,0) NOT NULL,
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
-- Name: rh_localterceirizado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_localterceirizado (
    idlocalterceirizado integer NOT NULL,
    nome character varying(40),
    idsetor integer
);


--
-- Name: rh_membro; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_membro (
    idmembro integer NOT NULL,
    idvinculo numeric(7,0) NOT NULL,
    idequipe integer NOT NULL,
    resultmembro integer,
    idatividade integer,
    atividade character varying(500)
);


--
-- Name: rh_meta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_meta (
    idmeta integer NOT NULL,
    idproades integer NOT NULL,
    previsao date,
    meta character varying(500),
    definida character(1),
    tipo integer
);


--
-- Name: rh_naohabilitado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_naohabilitado (
    idnaohabilitado integer NOT NULL,
    idproades integer NOT NULL,
    idvinculo numeric(7,0) NOT NULL,
    justificativa character varying(300) NOT NULL
);


--
-- Name: rh_nivelfuncao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_nivelfuncao (
    idnivel integer NOT NULL,
    descricao character varying(20) NOT NULL,
    sigla character(2) NOT NULL,
    nivel integer NOT NULL,
    valor integer
);


--
-- Name: rh_ocorrencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ocorrencia (
    idgrupoocorrencia integer NOT NULL,
    idocorrencia integer NOT NULL,
    descricao character varying(60) NOT NULL,
    mnemonico character(3),
    prazomaximo integer,
    sexo character(1),
    excpgto character(1)
);


--
-- Name: rh_ocorrenciaterceirizado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ocorrenciaterceirizado (
    idocorrenciaterceirizado integer NOT NULL,
    descricao character varying(30)
);


--
-- Name: rh_ocupacaofuncao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ocupacaofuncao (
    idocupacaofuncao integer NOT NULL,
    idfuncao integer NOT NULL,
    idvinculo numeric(7,0) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    idpublicacaoinicio integer,
    idpublicacaofim integer,
    substituicao character(1)
);


--
-- Name: rh_ocupacaovaga; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_ocupacaovaga (
    idvinculo numeric(7,0) NOT NULL,
    numerovaga character(7) NOT NULL,
    datainicio date NOT NULL,
    datafim date
);


--
-- Name: rh_origemvaga; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_origemvaga (
    idorigemvaga character(2) NOT NULL,
    descricao character varying(40)
);


--
-- Name: rh_pensionista; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_pensionista (
    idpensionista character(8) NOT NULL,
    idpessoa integer NOT NULL,
    idvinculo numeric(7,0),
    numleipensao character varying(5),
    dataleipensao date,
    datapubleipensao date,
    numprocpensao character varying(15),
    dataexclusaoinstituidor date,
    origempensao character(1),
    numprocpensionista character(15),
    parentesco character varying(2),
    uorgcontrole character(9),
    uorglocal character(9),
    bancopgto character(3),
    agenciapgto character(6),
    tipocontapgto character(2),
    contapgto character varying(13),
    identcontajudicial character varying(18),
    numbenefinss character varying(10),
    especiebenefinss character varying(10),
    qtddepir integer,
    tipopensao character(2),
    naturezapensao character(1),
    percentpensao character varying(3),
    datainiciopensao date,
    datafimpensao date,
    idrepresentacao integer,
    numeradorcotaparte character varying(2),
    denominadorcotaparte character varying(2),
    numeradorcotacomp character varying(2),
    denominadorcotacomp character varying(2),
    mesiniciopgto integer,
    anoiniciopgto integer,
    messusppgto integer,
    anosusppgto integer,
    idgrupoocorrenciaexclusao integer,
    idocorrenciaexclusao integer,
    dataexclusao date
);


--
-- Name: rh_percqualificacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_percqualificacao (
    idpercqualificacao integer NOT NULL,
    nivelclassificacao character varying(50),
    idescolaridadepcctae integer,
    percentualdireto double precision,
    percentualindireto double precision
);


--
-- Name: rh_periodoaquisitivo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_periodoaquisitivo (
    idvinculo numeric(7,0) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    totaldias integer,
    diasusufruidos integer,
    faltas integer,
    obs character varying(200),
    dataprescricao date
);


--
-- Name: rh_presente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_presente (
    idpresente integer NOT NULL,
    idvinculo numeric(7,0) NOT NULL,
    idreuniao integer NOT NULL
);


--
-- Name: rh_proades; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_proades (
    idproades integer NOT NULL,
    idsetor integer NOT NULL,
    iddirigente character(7) NOT NULL,
    datainicio date,
    datafim date,
    numpro character varying(12),
    missao character varying(500),
    objetivos character varying(1000),
    resultproades integer,
    status integer,
    idpublicacao integer,
    numportdir character varying(20),
    diaportdir integer,
    mesportdir integer,
    anoportdir integer
);


--
-- Name: rh_proadesconfig; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_proadesconfig (
    idproades integer NOT NULL,
    primeirafase character(1),
    segundafase character(1),
    terceirafase character(1),
    subcoord character(1),
    pedidosubcoord character(1),
    quantsubcoord character(2),
    problemaequipe character(1)
);


--
-- Name: rh_progressaocapacitacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_progressaocapacitacao (
    idprogressaocapacitacao integer NOT NULL,
    idclasse integer NOT NULL,
    cargahorariacapacitacao integer,
    nivelpadrao integer NOT NULL
);


--
-- Name: rh_prorrogacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_prorrogacao (
    idvinculo numeric(7,0) NOT NULL,
    datafim date NOT NULL,
    obs character varying(200)
);


--
-- Name: rh_provbkp; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_provbkp (
    idvinculo numeric(7,0) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    excedelotacao character(1) NOT NULL,
    obs character varying(500),
    regimejuridico character(3),
    idsituacao integer,
    idgrupocargo integer NOT NULL,
    idcargo integer NOT NULL,
    idsetor integer NOT NULL,
    idclasse integer,
    idreferencia integer,
    idjornada integer,
    idpublicacao integer,
    idgrupoocorrencia integer,
    idocorrencia integer
);


--
-- Name: rh_provimento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_provimento (
    idvinculo numeric(7,0) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    excedelotacao character(1) NOT NULL,
    obs character varying(500),
    regimejuridico character(3),
    idsituacao integer,
    idgrupocargo integer NOT NULL,
    idcargo integer NOT NULL,
    idsetor integer NOT NULL,
    idclasse integer,
    idreferencia integer,
    idjornada integer,
    idpublicacao integer,
    idgrupoocorrencia integer,
    idocorrencia integer,
    idambiente integer
);


--
-- Name: rh_provimentoaux; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_provimentoaux (
    idvinculo numeric(7,0) NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    excedelotacao character(1) NOT NULL,
    obs character varying(500),
    regimejuridico character(3),
    idsituacao integer,
    idgrupocargo integer NOT NULL,
    idcargo integer NOT NULL,
    idsetor integer NOT NULL,
    idclasse integer,
    idreferencia integer,
    idjornada integer,
    idpublicacao integer,
    idgrupoocorrencia integer,
    idocorrencia integer,
    idambiente integer
);


--
-- Name: rh_provterceirizado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_provterceirizado (
    idterceirizado integer NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    idfuncaoterceirizado integer,
    idjornada integer NOT NULL,
    idocorrenciaterceirizado integer,
    idinstituicao numeric(9,0) NOT NULL,
    idlocalterceirizado integer,
    idescala integer,
    idcontrato integer
);


--
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
-- Name: rh_referencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_referencia (
    idclasse integer NOT NULL,
    idreferencia integer NOT NULL,
    nivelpadrao character varying(3),
    idclassegrupocargo integer
);


--
-- Name: rh_relatorioimportacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_relatorioimportacao (
    idrelatorio integer NOT NULL,
    relatorio character varying(500),
    siape character(7),
    tipo character(1),
    anomes character(6)
);


--
-- Name: rh_representacaopensao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_representacaopensao (
    idrepresentacao integer NOT NULL,
    datainicio date NOT NULL,
    datafim date,
    idpessoa integer NOT NULL,
    idvinculo numeric(7,0),
    idpensionista character(8) NOT NULL,
    cartorio character varying(50),
    livro character varying(8),
    folha character varying(6)
);


--
-- Name: rh_resultadoreuniao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_resultadoreuniao (
    idreuniao integer NOT NULL,
    idmeta integer NOT NULL,
    resultreuniao integer,
    justificativa character varying(300)
);


--
-- Name: rh_reuniao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_reuniao (
    idreuniao integer NOT NULL,
    idproades integer NOT NULL,
    data date,
    local character varying(50),
    inicio integer,
    termino integer,
    resultreuniao integer,
    numero integer
);


--
-- Name: rh_reuniaoanexo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_reuniaoanexo (
    idanexo integer NOT NULL,
    idreuniao integer,
    nome character varying(100),
    descricao character varying(500),
    tipo character varying(30),
    arquivo oid
);


--
-- Name: rh_reuniaofator; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_reuniaofator (
    idreuniao integer NOT NULL,
    idfator integer NOT NULL,
    fatordificult character varying(100) NOT NULL,
    outro character(1),
    idmeta integer
);


--
-- Name: rh_situacaofuncional; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_situacaofuncional (
    idsituacao integer NOT NULL,
    descricao character varying(20) NOT NULL,
    regimejuridico character(3) NOT NULL
);


--
-- Name: rh_situacaoocorrencia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_situacaoocorrencia (
    idsituacao integer NOT NULL,
    idgrupoocorrencia integer NOT NULL,
    idocorrencia integer NOT NULL
);


--
-- Name: rh_terceirizado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_terceirizado (
    idterceirizado integer NOT NULL,
    escolaridade character varying(50),
    idpessoa integer NOT NULL
);


--
-- Name: rh_tipo0; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_tipo0 (
    anomes character(6),
    quant integer
);


--
-- Name: rh_tipo1; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_tipo1 (
    unid_pagadora character varying(9),
    siape character varying(7) NOT NULL,
    dv_matricula character varying(1),
    tipo_registro character varying(1),
    sigla_uf character varying(2),
    nome_servidor character varying(60),
    cpf character varying(11),
    pis_pasep character varying(11),
    nome_mae character varying(50),
    sexo character varying(1),
    dt_nascimento character varying(8),
    estado_civil character varying(1),
    escolaridade character varying(2),
    titulacao character varying(2),
    filler1 character varying(5),
    nacionalidade character varying(1),
    naturalidade character varying(2),
    pais character varying(3),
    ano_chegada character varying(4),
    quant_dep_ir character varying(2),
    quant_dep_sf character varying(2),
    dt_prim_emp character varying(8),
    identif_origem character varying(8),
    end_logradouro character varying(40),
    end_numero character varying(6),
    end_complemento character varying(21),
    end_bairro character varying(25),
    end_municipio character varying(30),
    end_cep character varying(8),
    end_uf character varying(2),
    rg_numero character varying(14),
    rg_orgao character varying(5),
    rg_dt_emissao character varying(8),
    rg_uf character varying(2),
    tit_eleitor character varying(13),
    anomes character(6) NOT NULL,
    telefone character varying(20)
);


--
-- Name: rh_tipo2; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_tipo2 (
    unid_pagadora character varying(9),
    siape character varying(7) NOT NULL,
    dv_matricula character varying(1),
    tipo_registro character varying(1),
    sigla_uf character varying(2),
    regime_juridico character varying(3),
    cod_situacao character varying(2),
    cart_trab_num character varying(6),
    cart_trab_serie character varying(5),
    cart_trab_uf character varying(2),
    banco character varying(3),
    agencia character varying(6),
    conta character varying(13),
    fgts_dt_opcao character varying(8),
    fgts_banco character varying(3),
    fgts_agencia character varying(6),
    fgts_conta character varying(13),
    jornada_trab character varying(2),
    perc_tempo_serv character varying(2),
    dt_cadast_serv character varying(8),
    ind_supr_pagto character varying(1),
    dt_supr_pagto character varying(6),
    proporc_numerad character varying(2),
    proporc_denomin character varying(2),
    cargo_grupo character varying(3),
    cargo_nome character varying(3),
    cargo_classe character varying(1),
    cargo_ref_nivel character varying(3),
    cargo_dt_entrad character varying(8),
    cargo_dt_saida character varying(8),
    funcao_sigla character varying(3),
    funcao_codnivel character varying(5),
    funcao_escolar character varying(2),
    funcao_opcao character varying(1),
    funcao_dt_ingr character varying(8),
    funcao_dt_saida character varying(8),
    funcao_unid_org character varying(9),
    nov_fc_sigla character varying(3),
    nov_fc_codnivel character varying(5),
    nov_fc_escolar character varying(2),
    nov_fc_opcao character varying(1),
    nov_fc_dt_ingr character varying(8),
    nov_fc_dt_saida character varying(8),
    nov_fc_unid_org character varying(9),
    ativid_funcao character varying(4),
    lotac_unid_org character varying(9),
    lotac_unid_dt character varying(8),
    local_orgao character varying(5),
    local_unid_org character varying(9),
    ing_org_grupo character varying(2),
    ing_org_ocor character varying(3),
    ing_org_dt character varying(8),
    ing_org_dip_cod character varying(2),
    ing_org_dip_num character varying(9),
    ing_org_dip_dt character varying(8),
    ing_sp_grupo character varying(2),
    ing_sp_ocor character varying(3),
    ing_sp_dt character varying(8),
    ing_sp_dip_cod character varying(2),
    ing_sp_dip_num character varying(9),
    ing_sp_dip_dt character varying(8),
    exclus_grupo character varying(2),
    exclus_ocor character varying(3),
    exclus_dt character varying(8),
    exclus_dip_cod character varying(2),
    exclus_dip_num character varying(9),
    exclus_dip_dt character varying(8),
    afast_grupo character varying(2),
    afast_ocor character varying(3),
    afast_dt_inic character varying(8),
    afast_dt_term character varying(8),
    afast_dip_cod character varying(2),
    afast_dip_num character varying(9),
    afast_dip_dt character varying(8),
    inativ_grupo character varying(2),
    inativ_ocor character varying(3),
    inativ_dt character varying(8),
    inativ_dip_cod character varying(2),
    inativ_dip_num character varying(9),
    inativ_dip_dt character varying(8),
    apos_num_proc character varying(15),
    apos_ano_prev character varying(4),
    apos_opcao_int character varying(1),
    uorg_controle character varying(9),
    mod_fun_grupo character varying(2),
    mod_fun_ocor character varying(3),
    mod_fun_dt character varying(8),
    mod_fun_dip_cod character varying(2),
    mod_fun_dip_num character varying(9),
    mod_fun_dip_dt character varying(8),
    reg_jur_ant character varying(3),
    sit_serv_ant character varying(2),
    mud_org_destino character varying(5),
    mud_org_dt_lib character varying(8),
    mud_org_origem character varying(5),
    orgao_anterior character varying(5),
    matric_anterior character varying(7),
    cod_org_extinto character varying(5),
    mat_serv_extint character varying(7),
    orgao_atual character varying(5),
    matric_atual character varying(7),
    mud_upag_codigo character varying(9),
    mud_upag_dt_lib character varying(8),
    mud_upag_motivo character varying(1),
    indic_pag_serv character varying(1),
    obito_cartori0 character varying(50),
    obito_livro character varying(8),
    obito_folha character varying(6),
    obito_registro character varying(8),
    obito_dt character varying(8),
    ind_exc_instit character varying(1),
    dt_exc_instit character varying(8),
    vale_al_tipo character varying(1),
    vale_al_dt_inic character varying(8),
    vale_al_dt_fim character varying(8),
    ind_oper_raiox character varying(1),
    orgao_requisit character varying(5),
    codigo_vaga character varying(7),
    mes_anuenio character varying(2),
    perc_oper_raiox character varying(5),
    posse_grupo character varying(2),
    posse_ocor character varying(3),
    posse_dt character varying(8),
    posse_dip_cod character varying(2),
    posse_dip_dt character varying(8),
    posse_dip_num character varying(9),
    rev_ati_grupo character varying(2),
    rev_ati_ocor character varying(3),
    rev_ati_dt character varying(8),
    rev_ati_dip_cod character varying(2),
    rev_ati_dip_dt character varying(8),
    rev_ati_dip_num character varying(9),
    ica_cargo character varying(1),
    ica_funcao character varying(1),
    ica_sal_familia character varying(1),
    ica_adic_tempo character varying(1),
    ica_fgts character varying(1),
    ica_inss character varying(1),
    ica_ir character varying(1),
    ica_margem_cons character varying(1),
    ica_cont_sind character varying(1),
    ica_adiant_13 character varying(1),
    ica_abate_teto character varying(1),
    ica_13_salario character varying(1),
    ica_pss_6 character varying(1),
    ica_ferias character varying(1),
    ica_pensao character varying(1),
    ica_beneficios character varying(1),
    ica_ipmf_cpmf character varying(1),
    ica_rais character varying(1),
    ica_dif_urv character varying(1),
    ica_adiant character varying(1),
    ica_rend_pasep character varying(1),
    anomes character(6) NOT NULL
);


--
-- Name: rh_tipo3; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_tipo3 (
    unid_pagadora character varying(9),
    siape character varying(7),
    dv_matricula character varying(1),
    tipo_registro character varying(1),
    sigla_uf character varying(2),
    rub_rend_desc character varying(1),
    rub_codigo character varying(5),
    rub_sequencia character varying(1),
    rub_valor character varying(11),
    rub_prazo character varying(3),
    param_percent character varying(5),
    param_frac_num character varying(3),
    param_frac_den character varying(3),
    param_assunto character varying(2),
    param_niv_scn character varying(1),
    param_niv_cemp character varying(12),
    benef_nome character varying(40),
    benef_banco character varying(3),
    benef_agencia character varying(6),
    benef_conta character varying(13),
    benef_anomes character varying(6),
    anomes character(6)
);


--
-- Name: rh_tipo4; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_tipo4 (
    unid_pagadora character varying(9),
    siape character varying(7) NOT NULL,
    dv_matricula character varying(1),
    tipo_registro character varying(1),
    sigla_uf character varying(2),
    total_bruto character varying(12),
    total_descontos character varying(12),
    liquido character varying(12),
    total_reg_3 character varying(3),
    anomes character(6) NOT NULL
);


--
-- Name: rh_tipolicafast; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_tipolicafast (
    idtipolicafast integer NOT NULL,
    tipolicafast character(25) NOT NULL,
    descricao character varying(50)
);


--
-- Name: rh_titulacaotemp; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_titulacaotemp (
    idvinculo numeric(7,0) NOT NULL,
    titulacao character varying(30)
);


--
-- Name: rh_vaga; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_vaga (
    numerovaga character(7) NOT NULL,
    origem character(2),
    datainicio date,
    datafim date,
    obs character varying(180),
    idgrupocargo integer,
    idcargo integer,
    idsetor integer
);


--
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
-- Name: rh_vinculo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_vinculo (
    idvinculo numeric(7,0) NOT NULL,
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
    idpublicacaovacancia integer,
    idfuncionario numeric(9,0) NOT NULL,
    idgrupoocorrenciavacancia integer,
    idocorrenciavacancia integer
);


--
-- Name: rh_vinculocid; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_vinculocid (
    idvinculocid integer NOT NULL,
    idvinculo numeric(7,0) NOT NULL,
    cid character(3) NOT NULL,
    sub character(4) NOT NULL
);


--
-- Name: rh_vinculosih; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rh_vinculosih (
    idvinculosih integer NOT NULL,
    idvinculo numeric(7,0) NOT NULL,
    idcirurgia integer NOT NULL
);


--
-- Name: seq_ad_bolsa; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_bolsa
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_bolsista; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_bolsista
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_dependencia; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_dependencia
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_empenhado; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_empenhado
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_empenho; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_empenho
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_empresamanutencaoveiculo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_empresamanutencaoveiculo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_executoralmox; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_executoralmox
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_executorservint; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_executorservint
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_fornecedor; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_fornecedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_hotel; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_hotel
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_itemnota; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_itemnota
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_itempatrimonio; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_itempatrimonio
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_lancamentoint; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_lancamentoint
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_licitacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_licitacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_liquidacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_liquidacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_localidadediaria; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_localidadediaria
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_manutencaoveiculo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_manutencaoveiculo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_material; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_material
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_modalidadelicitacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_modalidadelicitacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_motorista; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_motorista
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_movimento; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_movimento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_movimentopat; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_movimentopat
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_movimentopat_termo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_movimentopat_termo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_notafiscal; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_notafiscal
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_notafiscalmanutencaoveiculo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_notafiscalmanutencaoveiculo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_novomaterial; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_novomaterial
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_orcamento; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_orcamento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_orcamentointerno; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_orcamentointerno
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_ordembancaria; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_ordembancaria
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_ordementrega; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_ordementrega
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_ordentrega; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_ordentrega
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_prevrevisao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_prevrevisao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_requisicao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_requisicao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_restaurante; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_restaurante
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_servico; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_servico
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_solicitacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_solicitacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_suplementacaoitem; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_suplementacaoitem
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_tipomanutencao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_tipomanutencao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_tipoprot; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_tipoprot
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_tiporeq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_tiporeq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_tiposervint; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_tiposervint
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_ad_uo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_ad_uo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_artigo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_artigo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_assunto; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_assunto
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_autor; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_autor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_colecao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_colecao
    START WITH 403
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_editora; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_editora
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_emprestimo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_emprestimo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_estado; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_estado
    START WITH 21
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_etiqueta; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_etiqueta
    START WITH 211
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_exemplar; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_exemplar
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_exemplar_periodico; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_exemplar_periodico
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_ficha; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_ficha
    START WITH 21
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_genero; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_genero
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_grupo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_grupo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_indicadores; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_indicadores
    START WITH 1248084
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_indicadoresperiodico; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_indicadoresperiodico
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_infracao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_infracao
    START WITH 22
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_logoperacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_logoperacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_material; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_material
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_materialartigo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_materialartigo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_materialperiodico; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_materialperiodico
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_multa; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_multa
    START WITH 105474
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_notainfracao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_notainfracao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_obra; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_obra
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_obra_numerodaobra; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_obra_numerodaobra
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_observacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_observacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_opcao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_opcao
    START WITH 81
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_opcaolista; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_opcaolista
    START WITH 1818
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_operacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_operacao
    START WITH 121
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_periodico; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_periodico
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_politica; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_politica
    START WITH 81
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_regracirculacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_regracirculacao
    START WITH 70
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_reserva; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_reserva
    START WITH 53271
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_situacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_situacao
    START WITH 21
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_unidade; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_unidade
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_bt_validacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_bt_validacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_arquivo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_arquivo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_common; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_common
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_estadocivil; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_estadocivil
    START WITH 8
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_grupoacesso; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_grupoacesso
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_inss; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_inss
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_instituicao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_instituicao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_irrf; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_irrf
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_log; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_log
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_municipio; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_municipio
    START WITH 10000
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_noticia; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_noticia
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_pais; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_pais
    START WITH 270
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_pessoa; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_pessoa
    START WITH 0
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- Name: seq_cm_sessao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_sessao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_setor; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_setor
    START WITH 0
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- Name: seq_cm_sistema; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_sistema
    START WITH 8
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_tabelageral; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_tabelageral
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_tabelasigaept; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_tabelasigaept
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_tipoorganograma; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_tipoorganograma
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_transacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_transacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_cm_usuario; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_cm_usuario
    START WITH 0
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


--
-- Name: seq_rh_adicional; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_adicional
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_assunto; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_assunto
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_atividade; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_atividade
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_ativproades; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_ativproades
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_ausente; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_ausente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_averbacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_averbacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_averbfinalidade; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_averbfinalidade
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_calendarioferias; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_calendarioferias
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_capacitacaocurso; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_capacitacaocurso
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_capacitacaoinsc; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_capacitacaoinsc
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_capacitacaomodulo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_capacitacaomodulo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_cargoconfianca; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_cargoconfianca
    START WITH 16
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_cirurgia; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_cirurgia
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_classe; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_classe
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_contrato; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_contrato
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_decisao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_decisao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_dependente; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_dependente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_desaverbacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_desaverbacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_dtlimiteferias; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_dtlimiteferias
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_encaminhamento; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_encaminhamento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_equipe; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_equipe
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_fichaclinica; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_fichaclinica
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_funcao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_funcao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_histcapacitacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_histcapacitacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_histformacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_histformacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_histincentivo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_histincentivo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_historico; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_historico
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_histtitulacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_histtitulacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_localterceirizado; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_localterceirizado
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_membro; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_membro
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_meta; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_meta
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_naohabilitado; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_naohabilitado
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_ocupacaofuncao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_ocupacaofuncao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_presente; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_presente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_proades; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_proades
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_provimento; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_provimento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_publicacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_publicacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_relatorioimportacao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_relatorioimportacao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_representacaopensao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_representacaopensao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_reuniao; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_reuniao
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_reuniaoanexo; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_reuniaoanexo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_reuniaofator; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_reuniaofator
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_terceirizado; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_terceirizado
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_tipolicafast; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_tipolicafast
    START WITH 1
    INCREMENT BY 41
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_vinculocid; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_vinculocid
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: seq_rh_vinculosih; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seq_rh_vinculosih
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: temp; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE temp (
    id integer
);


--
-- Name: teste; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE teste (
    ativo character(1) DEFAULT 'S'::bpchar
);


--
-- Name: idmaterialautorartigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE bt_material_autor_artigo ALTER COLUMN idmaterialautorartigo SET DEFAULT nextval('bt_material_autor_artigo_idmaterialautorartigo_seq'::regclass);


--
-- Name: ad_abastecimento_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_abastecimento
    ADD CONSTRAINT ad_abastecimento_pkey PRIMARY KEY (idabastecimento);


--
-- Name: ad_empenhadodist_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_empenhadodist
    ADD CONSTRAINT ad_empenhadodist_pkey PRIMARY KEY (idempenhado, idrequisicao);


--
-- Name: ad_empresamanutencaoveiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_empresamanutencaoveiculo
    ADD CONSTRAINT ad_empresamanutencaoveiculo_pkey PRIMARY KEY (idempresa);


--
-- Name: ad_itemreqxerox_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqxerox
    ADD CONSTRAINT ad_itemreqxerox_pkey PRIMARY KEY (idrequisicao);


--
-- Name: ad_manutencaoveiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_manutencaoveiculo
    ADD CONSTRAINT ad_manutencaoveiculo_pkey PRIMARY KEY (idmanutencao);


--
-- Name: ad_notafiscalmanutencaoveiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_notafiscalmanutencaoveiculo
    ADD CONSTRAINT ad_notafiscalmanutencaoveiculo_pkey PRIMARY KEY (idnotafiscal);


--
-- Name: ad_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_abastecimentorequisicao
    ADD CONSTRAINT ad_pkey PRIMARY KEY (idabastecimento, idrequisicao);


--
-- Name: ad_prevrevisao_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_prevrevisao
    ADD CONSTRAINT ad_prevrevisao_pkey PRIMARY KEY (idprevrevisao);


--
-- Name: ad_reqrubrica_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_reqrubrica
    ADD CONSTRAINT ad_reqrubrica_pkey PRIMARY KEY (idrubrica, idtiporeq);


--
-- Name: ad_tipomanutencao_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_tipomanutencao
    ADD CONSTRAINT ad_tipomanutencao_pkey PRIMARY KEY (idtipomanutencao);


--
-- Name: ad_tipoprot_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_tipoprot
    ADD CONSTRAINT ad_tipoprot_pkey PRIMARY KEY (idtipoprot);


--
-- Name: bt_artigo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_artigo
    ADD CONSTRAINT bt_artigo_pkey PRIMARY KEY (idartigo);


--
-- Name: bt_codigobarra_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_codigobarra
    ADD CONSTRAINT bt_codigobarra_pkey PRIMARY KEY (idcodigobarra);


--
-- Name: bt_etiquetalombada_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_etiquetalombada
    ADD CONSTRAINT bt_etiquetalombada_pkey PRIMARY KEY (idetiqueta);


--
-- Name: bt_exemplarperiodico_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_pkey PRIMARY KEY (idexemplarperiodico);


--
-- Name: bt_indicadoresperiodico_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_indicadoresperiodico
    ADD CONSTRAINT bt_indicadoresperiodico_pkey PRIMARY KEY (idindicador);


--
-- Name: bt_material_assunto_artigo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_material_assunto_artigo
    ADD CONSTRAINT bt_material_assunto_artigo_pkey PRIMARY KEY (idmaterialassuntoartigo);


--
-- Name: bt_material_autor_artigo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_material_autor_artigo
    ADD CONSTRAINT bt_material_autor_artigo_pkey PRIMARY KEY (idmaterialautorartigo);


--
-- Name: bt_materialartigo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_materialartigo
    ADD CONSTRAINT bt_materialartigo_pkey PRIMARY KEY (idmaterial);


--
-- Name: bt_materialperiodico_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_materialperiodico
    ADD CONSTRAINT bt_materialperiodico_pkey PRIMARY KEY (idmaterial);


--
-- Name: bt_periodico_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_periodico
    ADD CONSTRAINT bt_periodico_pkey PRIMARY KEY (idperiodico);


--
-- Name: cm_inss_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_inss
    ADD CONSTRAINT cm_inss_pkey PRIMARY KEY (idinss);


--
-- Name: cm_irrf_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_irrf
    ADD CONSTRAINT cm_irrf_pkey PRIMARY KEY (idirrf);


--
-- Name: cm_planosaude_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_planosaude
    ADD CONSTRAINT cm_planosaude_pkey PRIMARY KEY (login);


--
-- Name: pk_ad_acessobolsa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_acessobolsa
    ADD CONSTRAINT pk_ad_acessobolsa PRIMARY KEY (idusuario, idbolsa);


--
-- Name: pk_ad_acessouoreq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_acessouoreq
    ADD CONSTRAINT pk_ad_acessouoreq PRIMARY KEY (idusuario, iduo);


--
-- Name: pk_ad_ad_orcinttemp; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_orcinttemp
    ADD CONSTRAINT pk_ad_ad_orcinttemp PRIMARY KEY (iduo, idrubrica, ano);


--
-- Name: pk_ad_andamento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_andamento
    ADD CONSTRAINT pk_ad_andamento PRIMARY KEY (numpro, numanda);


--
-- Name: pk_ad_bolsa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_bolsa
    ADD CONSTRAINT pk_ad_bolsa PRIMARY KEY (idbolsa);


--
-- Name: pk_ad_bolsista; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_bolsista
    ADD CONSTRAINT pk_ad_bolsista PRIMARY KEY (idbolsista);


--
-- Name: pk_ad_catmat; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_catmat
    ADD CONSTRAINT pk_ad_catmat PRIMARY KEY (codmaterial);


--
-- Name: pk_ad_classificador; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_classificador
    ADD CONSTRAINT pk_ad_classificador PRIMARY KEY (idclassificador);


--
-- Name: pk_ad_contrato; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_contrato
    ADD CONSTRAINT pk_ad_contrato PRIMARY KEY (idcontrato);


--
-- Name: pk_ad_controleprot; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_controleprot
    ADD CONSTRAINT pk_ad_controleprot PRIMARY KEY (anopro, uasg);


--
-- Name: pk_ad_dependencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_dependencia
    ADD CONSTRAINT pk_ad_dependencia PRIMARY KEY (iddependencia);


--
-- Name: pk_ad_diaria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_diaria
    ADD CONSTRAINT pk_ad_diaria PRIMARY KEY (dataini, categoriadiaria, categoriafunc);


--
-- Name: pk_ad_elemento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_elemento
    ADD CONSTRAINT pk_ad_elemento PRIMARY KEY (idelemento);


--
-- Name: pk_ad_empenhado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT pk_ad_empenhado PRIMARY KEY (idempenhado);


--
-- Name: pk_ad_empenho; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT pk_ad_empenho PRIMARY KEY (idempenho);


--
-- Name: pk_ad_empresapassagem; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_empresapassagem
    ADD CONSTRAINT pk_ad_empresapassagem PRIMARY KEY (idempresapassagem);


--
-- Name: pk_ad_estoque; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_estoque
    ADD CONSTRAINT pk_ad_estoque PRIMARY KEY (idmaterial, iduo);


--
-- Name: pk_ad_executa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT pk_ad_executa PRIMARY KEY (idtiporeq, iduo, ano);


--
-- Name: pk_ad_executor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_executor
    ADD CONSTRAINT pk_ad_executor PRIMARY KEY (iduo, idusuario, datainicio);


--
-- Name: pk_ad_executoralmox; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_executoralmox
    ADD CONSTRAINT pk_ad_executoralmox PRIMARY KEY (idexecutoralmox);


--
-- Name: pk_ad_executorservint; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_executorservint
    ADD CONSTRAINT pk_ad_executorservint PRIMARY KEY (idexecutorservint);


--
-- Name: pk_ad_fonte; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_fonte
    ADD CONSTRAINT pk_ad_fonte PRIMARY KEY (idfonte);


--
-- Name: pk_ad_fornecedor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT pk_ad_fornecedor PRIMARY KEY (idfornecedor);


--
-- Name: pk_ad_fpotencial; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_fpotencial
    ADD CONSTRAINT pk_ad_fpotencial PRIMARY KEY (idmaterial, idfornecedor);


--
-- Name: pk_ad_funcionarioresp; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_funcionarioresp
    ADD CONSTRAINT pk_ad_funcionarioresp PRIMARY KEY (idfunc, idsetor, dataini);


--
-- Name: pk_ad_gestor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_gestor
    ADD CONSTRAINT pk_ad_gestor PRIMARY KEY (iduo, idusuario, datainicio);


--
-- Name: pk_ad_hotel; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_hotel
    ADD CONSTRAINT pk_ad_hotel PRIMARY KEY (idhotel);


--
-- Name: pk_ad_itemlicitacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemlicitacao
    ADD CONSTRAINT pk_ad_itemlicitacao PRIMARY KEY (idlicitacao, item);


--
-- Name: pk_ad_itemnota; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemnota
    ADD CONSTRAINT pk_ad_itemnota PRIMARY KEY (iditemnota);


--
-- Name: pk_ad_itempatrimo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itempatrimo
    ADD CONSTRAINT pk_ad_itempatrimo PRIMARY KEY (idpatrimo);


--
-- Name: pk_ad_itempatrimonio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT pk_ad_itempatrimonio PRIMARY KEY (iditempatrimonio);


--
-- Name: pk_ad_itemreq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT pk_ad_itemreq PRIMARY KEY (idrequisicao, idmaterial);


--
-- Name: pk_ad_itemreqbib; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqbib
    ADD CONSTRAINT pk_ad_itemreqbib PRIMARY KEY (idrequisicao, idmaterial);


--
-- Name: pk_ad_itemreqdiaria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT pk_ad_itemreqdiaria PRIMARY KEY (idrequisicao, idvinculo);


--
-- Name: pk_ad_itemreqhotel; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT pk_ad_itemreqhotel PRIMARY KEY (idrequisicao, idpessoa);


--
-- Name: pk_ad_itemreqpassagem; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT pk_ad_itemreqpassagem PRIMARY KEY (idrequisicao, idpessoa);


--
-- Name: pk_ad_itemreqrestaurante; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT pk_ad_itemreqrestaurante PRIMARY KEY (idrequisicao, idpessoa);


--
-- Name: pk_ad_itemreqservext; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT pk_ad_itemreqservext PRIMARY KEY (idrequisicao, idservico);


--
-- Name: pk_ad_itemreqservint; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqservint
    ADD CONSTRAINT pk_ad_itemreqservint PRIMARY KEY (idrequisicao, idtiposervint);


--
-- Name: pk_ad_itemreqservpf; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT pk_ad_itemreqservpf PRIMARY KEY (idrequisicao, idpessoa);


--
-- Name: pk_ad_itemreqveiculo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT pk_ad_itemreqveiculo PRIMARY KEY (idrequisicao, idpessoa);


--
-- Name: pk_ad_lancamentoint; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT pk_ad_lancamentoint PRIMARY KEY (idlancamentoint);


--
-- Name: pk_ad_licitacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_licitacao
    ADD CONSTRAINT pk_ad_licitacao PRIMARY KEY (idlicitacao);


--
-- Name: pk_ad_liquidacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_liquidacao
    ADD CONSTRAINT pk_ad_liquidacao PRIMARY KEY (idliquidacao);


--
-- Name: pk_ad_localidadediaria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_localidadediaria
    ADD CONSTRAINT pk_ad_localidadediaria PRIMARY KEY (idlocalidadediaria);


--
-- Name: pk_ad_mapalicitacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_mapalicitacao
    ADD CONSTRAINT pk_ad_mapalicitacao PRIMARY KEY (idlicitacao, item, idfornecedor);


--
-- Name: pk_ad_material; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_material
    ADD CONSTRAINT pk_ad_material PRIMARY KEY (idmaterial);


--
-- Name: pk_ad_modalidadelicitacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_modalidadelicitacao
    ADD CONSTRAINT pk_ad_modalidadelicitacao PRIMARY KEY (idmodalidadelicitacao);


--
-- Name: pk_ad_motorista; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_motorista
    ADD CONSTRAINT pk_ad_motorista PRIMARY KEY (idmotorista);


--
-- Name: pk_ad_movimento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT pk_ad_movimento PRIMARY KEY (idmovimento);


--
-- Name: pk_ad_movimentopat; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT pk_ad_movimentopat PRIMARY KEY (idmovimentacao);


--
-- Name: pk_ad_movimentoserv; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_movimentoserv
    ADD CONSTRAINT pk_ad_movimentoserv PRIMARY KEY (idmovimentoserv);


--
-- Name: pk_ad_notafiscal; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_notafiscal
    ADD CONSTRAINT pk_ad_notafiscal PRIMARY KEY (idnotafiscal);


--
-- Name: pk_ad_orcamento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT pk_ad_orcamento PRIMARY KEY (idorcamento);


--
-- Name: pk_ad_orcamentohist; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_orcamentohist
    ADD CONSTRAINT pk_ad_orcamentohist PRIMARY KEY (idorcamento, data, tipoorc);


--
-- Name: pk_ad_orcamentointerno; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_orcamentointerno
    ADD CONSTRAINT pk_ad_orcamentointerno PRIMARY KEY (iduo, idrubrica, ano);


--
-- Name: pk_ad_orcamentotermo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_orcamentotermo
    ADD CONSTRAINT pk_ad_orcamentotermo PRIMARY KEY (item, idlicitacao);


--
-- Name: pk_ad_orctermo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_orctermo
    ADD CONSTRAINT pk_ad_orctermo PRIMARY KEY (item, idlicitacao);


--
-- Name: pk_ad_ordembancaria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_ordembancaria
    ADD CONSTRAINT pk_ad_ordembancaria PRIMARY KEY (idordembancaria);


--
-- Name: pk_ad_ordentrega; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_ordentrega
    ADD CONSTRAINT pk_ad_ordentrega PRIMARY KEY (idordement);


--
-- Name: pk_ad_pagbolsa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_pagbolsa
    ADD CONSTRAINT pk_ad_pagbolsa PRIMARY KEY (idbolsista, mesano, folha);


--
-- Name: pk_ad_paiempenho; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_paiempenho
    ADD CONSTRAINT pk_ad_paiempenho PRIMARY KEY (idempenhopai, idempenho);


--
-- Name: pk_ad_processo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_processo
    ADD CONSTRAINT pk_ad_processo PRIMARY KEY (numpro);


--
-- Name: pk_ad_ptr; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_ptr
    ADD CONSTRAINT pk_ad_ptr PRIMARY KEY (idptr);


--
-- Name: pk_ad_requisicao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT pk_ad_requisicao PRIMARY KEY (idrequisicao);


--
-- Name: pk_ad_requisita; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT pk_ad_requisita PRIMARY KEY (idtiporeq, iduo, ano);


--
-- Name: pk_ad_restaurante; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_restaurante
    ADD CONSTRAINT pk_ad_restaurante PRIMARY KEY (idrestaurante);


--
-- Name: pk_ad_retencao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_retencao
    ADD CONSTRAINT pk_ad_retencao PRIMARY KEY (numpro);


--
-- Name: pk_ad_rubrica; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_rubrica
    ADD CONSTRAINT pk_ad_rubrica PRIMARY KEY (idrubrica);


--
-- Name: pk_ad_saldolic; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT pk_ad_saldolic PRIMARY KEY (numerolic, item);


--
-- Name: pk_ad_servico; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_servico
    ADD CONSTRAINT pk_ad_servico PRIMARY KEY (idservico);


--
-- Name: pk_ad_setoracesso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_setoracesso
    ADD CONSTRAINT pk_ad_setoracesso PRIMARY KEY (setor, setorfilho);


--
-- Name: pk_ad_solicitacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_solicitacao
    ADD CONSTRAINT pk_ad_solicitacao PRIMARY KEY (idlicitacao, item, data);


--
-- Name: pk_ad_subelemento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_subelemento
    ADD CONSTRAINT pk_ad_subelemento PRIMARY KEY (idelemento, idsubelemento);


--
-- Name: pk_ad_suplementacaoitem; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_suplementacaoitem
    ADD CONSTRAINT pk_ad_suplementacaoitem PRIMARY KEY (idsuplementacaoitem);


--
-- Name: pk_ad_taxi; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_taxi
    ADD CONSTRAINT pk_ad_taxi PRIMARY KEY (dataini);


--
-- Name: pk_ad_tiporeq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_tiporeq
    ADD CONSTRAINT pk_ad_tiporeq PRIMARY KEY (idtiporeq);


--
-- Name: pk_ad_tiposervint; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_tiposervint
    ADD CONSTRAINT pk_ad_tiposervint PRIMARY KEY (idtiposervint);


--
-- Name: pk_ad_tipoveiculo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_tipoveiculo
    ADD CONSTRAINT pk_ad_tipoveiculo PRIMARY KEY (tipoveiculo);


--
-- Name: pk_ad_trecho; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_trecho
    ADD CONSTRAINT pk_ad_trecho PRIMARY KEY (idrequisicao, idpessoa, idtrecho);


--
-- Name: pk_ad_uo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_uo
    ADD CONSTRAINT pk_ad_uo PRIMARY KEY (iduo);


--
-- Name: pk_ad_uoalmox; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_uoalmox
    ADD CONSTRAINT pk_ad_uoalmox PRIMARY KEY (iduoreq, iduoalmox);


--
-- Name: pk_ad_valetransporte; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_valetransporte
    ADD CONSTRAINT pk_ad_valetransporte PRIMARY KEY (dataini);


--
-- Name: pk_ad_veiculo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_veiculo
    ADD CONSTRAINT pk_ad_veiculo PRIMARY KEY (placa);


--
-- Name: pk_bt_assunto; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_assunto
    ADD CONSTRAINT pk_bt_assunto PRIMARY KEY (idassunto);


--
-- Name: pk_bt_camposfixos; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_camposfixos
    ADD CONSTRAINT pk_bt_camposfixos PRIMARY KEY (idetiqueta, idobra);


--
-- Name: pk_bt_camposfixosperiodico; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_camposfixosperiodico
    ADD CONSTRAINT pk_bt_camposfixosperiodico PRIMARY KEY (idetiqueta, idperiodico);


--
-- Name: pk_bt_camposubficha; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_camposubficha
    ADD CONSTRAINT pk_bt_camposubficha PRIMARY KEY (idficha, idsubficha, idetiqueta, subcampo);


--
-- Name: pk_bt_colecao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_colecao
    ADD CONSTRAINT pk_bt_colecao PRIMARY KEY (idcolecao);


--
-- Name: pk_bt_consulta; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_consulta
    ADD CONSTRAINT pk_bt_consulta PRIMARY KEY (idconsulta);


--
-- Name: pk_bt_consultacampo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_consultacampo
    ADD CONSTRAINT pk_bt_consultacampo PRIMARY KEY (idconsulta, idetiqueta, subcampo);


--
-- Name: pk_bt_direito; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_direito
    ADD CONSTRAINT pk_bt_direito PRIMARY KEY (idregracirculacao, idoperacao, idgrupo);


--
-- Name: pk_bt_editora; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_editora
    ADD CONSTRAINT pk_bt_editora PRIMARY KEY (ideditora);


--
-- Name: pk_bt_emprestimo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_emprestimo
    ADD CONSTRAINT pk_bt_emprestimo PRIMARY KEY (idemprestimo);


--
-- Name: pk_bt_estado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_estado
    ADD CONSTRAINT pk_bt_estado PRIMARY KEY (idestado);


--
-- Name: pk_bt_etiqueta; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_etiqueta
    ADD CONSTRAINT pk_bt_etiqueta PRIMARY KEY (idetiqueta);


--
-- Name: pk_bt_exemplar; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT pk_bt_exemplar PRIMARY KEY (idexemplar);


--
-- Name: pk_bt_ficha; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_ficha
    ADD CONSTRAINT pk_bt_ficha PRIMARY KEY (idficha);


--
-- Name: pk_bt_genero; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_genero
    ADD CONSTRAINT pk_bt_genero PRIMARY KEY (idgenero);


--
-- Name: pk_bt_grupo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_grupo
    ADD CONSTRAINT pk_bt_grupo PRIMARY KEY (idgrupo);


--
-- Name: pk_bt_indicadores; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_indicadores
    ADD CONSTRAINT pk_bt_indicadores PRIMARY KEY (idindicador);


--
-- Name: pk_bt_infracao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_infracao
    ADD CONSTRAINT pk_bt_infracao PRIMARY KEY (idinfracao);


--
-- Name: pk_bt_logoperacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_logoperacao
    ADD CONSTRAINT pk_bt_logoperacao PRIMARY KEY (idlogoperacao);


--
-- Name: pk_bt_logoperacaodetalhe; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_logoperacaodetalhe
    ADD CONSTRAINT pk_bt_logoperacaodetalhe PRIMARY KEY (idlogoperacao, campo);


--
-- Name: pk_bt_material; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_material
    ADD CONSTRAINT pk_bt_material PRIMARY KEY (idmaterial);


--
-- Name: pk_bt_multa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_multa
    ADD CONSTRAINT pk_bt_multa PRIMARY KEY (idmulta);


--
-- Name: pk_bt_notainfracao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_notainfracao
    ADD CONSTRAINT pk_bt_notainfracao PRIMARY KEY (idnotainfracao);


--
-- Name: pk_bt_obra; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_obra
    ADD CONSTRAINT pk_bt_obra PRIMARY KEY (idobra);


--
-- Name: pk_bt_observacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_observacao
    ADD CONSTRAINT pk_bt_observacao PRIMARY KEY (idobservacao);


--
-- Name: pk_bt_opcao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_opcao
    ADD CONSTRAINT pk_bt_opcao PRIMARY KEY (idopcao);


--
-- Name: pk_bt_opcaolista; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_opcaolista
    ADD CONSTRAINT pk_bt_opcaolista PRIMARY KEY (idopcao, idopcaolista);


--
-- Name: pk_bt_operacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_operacao
    ADD CONSTRAINT pk_bt_operacao PRIMARY KEY (idoperacao);


--
-- Name: pk_bt_politica; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_politica
    ADD CONSTRAINT pk_bt_politica PRIMARY KEY (idpolitica);


--
-- Name: pk_bt_posicao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_posicao
    ADD CONSTRAINT pk_bt_posicao PRIMARY KEY (idetiqueta, posicao);


--
-- Name: pk_bt_posicaosubficha; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_posicaosubficha
    ADD CONSTRAINT pk_bt_posicaosubficha PRIMARY KEY (idetiqueta, posicao, idficha, idsubficha);


--
-- Name: pk_bt_regracirculacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_regracirculacao
    ADD CONSTRAINT pk_bt_regracirculacao PRIMARY KEY (idregracirculacao);


--
-- Name: pk_bt_reserva; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_reserva
    ADD CONSTRAINT pk_bt_reserva PRIMARY KEY (idreserva);


--
-- Name: pk_bt_situacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_situacao
    ADD CONSTRAINT pk_bt_situacao PRIMARY KEY (idsituacao);


--
-- Name: pk_bt_subcampo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_subcampo
    ADD CONSTRAINT pk_bt_subcampo PRIMARY KEY (idetiqueta, subcampo);


--
-- Name: pk_bt_subficha; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_subficha
    ADD CONSTRAINT pk_bt_subficha PRIMARY KEY (idficha, idsubficha);


--
-- Name: pk_bt_unidade; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_unidade
    ADD CONSTRAINT pk_bt_unidade PRIMARY KEY (idunidade);


--
-- Name: pk_bt_usuarioexterno; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_usuarioexterno
    ADD CONSTRAINT pk_bt_usuarioexterno PRIMARY KEY (idusuario);


--
-- Name: pk_bt_validacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_validacao
    ADD CONSTRAINT pk_bt_validacao PRIMARY KEY (idvalidacao);


--
-- Name: pk_bt_vinculo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_vinculo
    ADD CONSTRAINT pk_bt_vinculo PRIMARY KEY (idgrupo, idusuario);


--
-- Name: pk_cm_acesso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_acesso
    ADD CONSTRAINT pk_cm_acesso PRIMARY KEY (idgrupo, idtrans);


--
-- Name: pk_cm_agencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_agencia
    ADD CONSTRAINT pk_cm_agencia PRIMARY KEY (idbanco, idagenc);


--
-- Name: pk_cm_arquivo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_arquivo
    ADD CONSTRAINT pk_cm_arquivo PRIMARY KEY (idarquivo);


--
-- Name: pk_cm_banco; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_banco
    ADD CONSTRAINT pk_cm_banco PRIMARY KEY (idbanco);


--
-- Name: pk_cm_estadocivil; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_estadocivil
    ADD CONSTRAINT pk_cm_estadocivil PRIMARY KEY (idestadocivil);


--
-- Name: pk_cm_feriado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_feriado
    ADD CONSTRAINT pk_cm_feriado PRIMARY KEY (data);


--
-- Name: pk_cm_grpusuario; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_grpusuario
    ADD CONSTRAINT pk_cm_grpusuario PRIMARY KEY (idgrupo, idusuario);


--
-- Name: pk_cm_grupoacesso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_grupoacesso
    ADD CONSTRAINT pk_cm_grupoacesso PRIMARY KEY (idgrupo);


--
-- Name: pk_cm_indice; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_indice
    ADD CONSTRAINT pk_cm_indice PRIMARY KEY (sigla);


--
-- Name: pk_cm_indicemensal; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_indicemensal
    ADD CONSTRAINT pk_cm_indicemensal PRIMARY KEY (idindicemensal);


--
-- Name: pk_cm_instituicao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_instituicao
    ADD CONSTRAINT pk_cm_instituicao PRIMARY KEY (idinstituicao);


--
-- Name: pk_cm_log; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_log
    ADD CONSTRAINT pk_cm_log PRIMARY KEY (idlog);


--
-- Name: pk_cm_logant; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_logant
    ADD CONSTRAINT pk_cm_logant PRIMARY KEY (idlog);


--
-- Name: pk_cm_municipio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_municipio
    ADD CONSTRAINT pk_cm_municipio PRIMARY KEY (idmunicipio);


--
-- Name: pk_cm_noticia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_noticia
    ADD CONSTRAINT pk_cm_noticia PRIMARY KEY (idsistema, idnoticia);


--
-- Name: pk_cm_organograma; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_organograma
    ADD CONSTRAINT pk_cm_organograma PRIMARY KEY (idtipoorganograma, idsetor, idsetorpai);


--
-- Name: pk_cm_pais; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_pais
    ADD CONSTRAINT pk_cm_pais PRIMARY KEY (idpais);


--
-- Name: pk_cm_pessoa; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT pk_cm_pessoa PRIMARY KEY (idpessoa);


--
-- Name: pk_cm_sessao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_sessao
    ADD CONSTRAINT pk_cm_sessao PRIMARY KEY (idsessao);


--
-- Name: pk_cm_setor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_setor
    ADD CONSTRAINT pk_cm_setor PRIMARY KEY (idsetor);


--
-- Name: pk_cm_setoracesso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_setoracesso
    ADD CONSTRAINT pk_cm_setoracesso PRIMARY KEY (idsetor, idsetoracesso, finalidade);


--
-- Name: pk_cm_setorequivalente; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_setorequivalente
    ADD CONSTRAINT pk_cm_setorequivalente PRIMARY KEY (idsetor, idsetorequivalente);


--
-- Name: pk_cm_sistema; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_sistema
    ADD CONSTRAINT pk_cm_sistema PRIMARY KEY (idsistema);


--
-- Name: pk_cm_tabelageral; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_tabelageral
    ADD CONSTRAINT pk_cm_tabelageral PRIMARY KEY (idtabelageral);


--
-- Name: pk_cm_tabelasigaept; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_tabelasigaept
    ADD CONSTRAINT pk_cm_tabelasigaept PRIMARY KEY (idtabelasigaept);


--
-- Name: pk_cm_tipoorganograma; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_tipoorganograma
    ADD CONSTRAINT pk_cm_tipoorganograma PRIMARY KEY (idtipoorganograma);


--
-- Name: pk_cm_transacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_transacao
    ADD CONSTRAINT pk_cm_transacao PRIMARY KEY (idtrans);


--
-- Name: pk_cm_uf; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_uf
    ADD CONSTRAINT pk_cm_uf PRIMARY KEY (iduf);


--
-- Name: pk_cm_usuario; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cm_usuario
    ADD CONSTRAINT pk_cm_usuario PRIMARY KEY (idusuario);


--
-- Name: pk_filmes; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_autor
    ADD CONSTRAINT pk_filmes PRIMARY KEY (idautor);


--
-- Name: pk_ga_aluno; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ga_aluno
    ADD CONSTRAINT pk_ga_aluno PRIMARY KEY (matricula);


--
-- Name: pk_ga_situacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ga_situacao
    ADD CONSTRAINT pk_ga_situacao PRIMARY KEY (idsituacao);


--
-- Name: pk_permitemulta; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bt_permitemulta
    ADD CONSTRAINT pk_permitemulta PRIMARY KEY (idpermitemulta);


--
-- Name: pk_rh_adicional; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_adicional
    ADD CONSTRAINT pk_rh_adicional PRIMARY KEY (idvinculo, datainicio);


--
-- Name: pk_rh_ambiente; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_ambiente
    ADD CONSTRAINT pk_rh_ambiente PRIMARY KEY (idambiente);


--
-- Name: pk_rh_assunto; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_assunto
    ADD CONSTRAINT pk_rh_assunto PRIMARY KEY (idassunto);


--
-- Name: pk_rh_atividade; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_atividade
    ADD CONSTRAINT pk_rh_atividade PRIMARY KEY (idatividade);


--
-- Name: pk_rh_ausente; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_ausente
    ADD CONSTRAINT pk_rh_ausente PRIMARY KEY (idausente);


--
-- Name: pk_rh_averbacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_averbacao
    ADD CONSTRAINT pk_rh_averbacao PRIMARY KEY (idaverbacao);


--
-- Name: pk_rh_averbfinalidade; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_averbfinalidade
    ADD CONSTRAINT pk_rh_averbfinalidade PRIMARY KEY (idaverbacao, idaverbfinalidade);


--
-- Name: pk_rh_baseaposentadoria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_baseaposentadoria
    ADD CONSTRAINT pk_rh_baseaposentadoria PRIMARY KEY (idvinculo, ano, mes);


--
-- Name: pk_rh_capacitacaocoinc; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_capacitacaocoinc
    ADD CONSTRAINT pk_rh_capacitacaocoinc PRIMARY KEY (idmodulo1, idmodulo2);


--
-- Name: pk_rh_capacitacaocurso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_capacitacaocurso
    ADD CONSTRAINT pk_rh_capacitacaocurso PRIMARY KEY (idcurso);


--
-- Name: pk_rh_capacitacaoinsc; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_capacitacaoinsc
    ADD CONSTRAINT pk_rh_capacitacaoinsc PRIMARY KEY (inscricao);


--
-- Name: pk_rh_capacitacaomodulo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_capacitacaomodulo
    ADD CONSTRAINT pk_rh_capacitacaomodulo PRIMARY KEY (idmodulo);


--
-- Name: pk_rh_cargo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_cargo
    ADD CONSTRAINT pk_rh_cargo PRIMARY KEY (idgrupocargo, idcargo);


--
-- Name: pk_rh_cargoconfianca; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_cargoconfianca
    ADD CONSTRAINT pk_rh_cargoconfianca PRIMARY KEY (idcargoconfianca);


--
-- Name: pk_rh_cessao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_cessao
    ADD CONSTRAINT pk_rh_cessao PRIMARY KEY (idvinculo, datainicio);


--
-- Name: pk_rh_cidcategoria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_cidcategoria
    ADD CONSTRAINT pk_rh_cidcategoria PRIMARY KEY (idcidcategoria);


--
-- Name: pk_rh_cidsubcategoria; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_cidsubcategoria
    ADD CONSTRAINT pk_rh_cidsubcategoria PRIMARY KEY (idcidcategoria, idcidsubcategoria);


--
-- Name: pk_rh_classe; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_classe
    ADD CONSTRAINT pk_rh_classe PRIMARY KEY (idclasse);


--
-- Name: pk_rh_classegrupocargo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_classegrupocargo
    ADD CONSTRAINT pk_rh_classegrupocargo PRIMARY KEY (idclassegrupocargo);


--
-- Name: pk_rh_conprovter; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_contratoprovterceirizado
    ADD CONSTRAINT pk_rh_conprovter PRIMARY KEY (idterceirizado, datainicio, idcontrato);


--
-- Name: pk_rh_contrato; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_contrato
    ADD CONSTRAINT pk_rh_contrato PRIMARY KEY (idcontrato);


--
-- Name: pk_rh_decisao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_decisao
    ADD CONSTRAINT pk_rh_decisao PRIMARY KEY (iddecisao);


--
-- Name: pk_rh_dependencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_dependencia
    ADD CONSTRAINT pk_rh_dependencia PRIMARY KEY (iddependente, idtipodependencia, datainicio);


--
-- Name: pk_rh_dependente; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_dependente
    ADD CONSTRAINT pk_rh_dependente PRIMARY KEY (iddependente);


--
-- Name: pk_rh_desaverbacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_desaverbacao
    ADD CONSTRAINT pk_rh_desaverbacao PRIMARY KEY (iddesaverbacao);


--
-- Name: pk_rh_diplomalegal; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_diplomalegal
    ADD CONSTRAINT pk_rh_diplomalegal PRIMARY KEY (iddiplomalegal);


--
-- Name: pk_rh_encaminhamento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_encaminhamento
    ADD CONSTRAINT pk_rh_encaminhamento PRIMARY KEY (idencaminhamento);


--
-- Name: pk_rh_equipe; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_equipe
    ADD CONSTRAINT pk_rh_equipe PRIMARY KEY (idequipe);


--
-- Name: pk_rh_ferias; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_ferias
    ADD CONSTRAINT pk_rh_ferias PRIMARY KEY (idvinculoperaq, datainicioperaq, datainicio);


--
-- Name: pk_rh_formacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_formacao
    ADD CONSTRAINT pk_rh_formacao PRIMARY KEY (idformacao);


--
-- Name: pk_rh_funcao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_funcao
    ADD CONSTRAINT pk_rh_funcao PRIMARY KEY (idfuncao);


--
-- Name: pk_rh_funcaoterceirizado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_funcaoterceirizado
    ADD CONSTRAINT pk_rh_funcaoterceirizado PRIMARY KEY (idfuncaoterceirizado);


--
-- Name: pk_rh_funcionario; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_funcionario
    ADD CONSTRAINT pk_rh_funcionario PRIMARY KEY (idfuncionario);


--
-- Name: pk_rh_grupocargo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_grupocargo
    ADD CONSTRAINT pk_rh_grupocargo PRIMARY KEY (idgrupocargo);


--
-- Name: pk_rh_grupolicafast; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_grupolicafast
    ADD CONSTRAINT pk_rh_grupolicafast PRIMARY KEY (idtipolicafast, idgrupoocorrencia, idocorrencia);


--
-- Name: pk_rh_grupoocorrencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_grupoocorrencia
    ADD CONSTRAINT pk_rh_grupoocorrencia PRIMARY KEY (idgrupoocorrencia);


--
-- Name: pk_rh_histformacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_histformacao
    ADD CONSTRAINT pk_rh_histformacao PRIMARY KEY (idhistformacao);


--
-- Name: pk_rh_histtitulacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_histtitulacao
    ADD CONSTRAINT pk_rh_histtitulacao PRIMARY KEY (idhisttitulacao);


--
-- Name: pk_rh_histvantagem; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_histvantagem
    ADD CONSTRAINT pk_rh_histvantagem PRIMARY KEY (idvinculo, idvantagem, datainicio);


--
-- Name: pk_rh_jornada; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_jornada
    ADD CONSTRAINT pk_rh_jornada PRIMARY KEY (idjornada);


--
-- Name: pk_rh_licafast; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_licafast
    ADD CONSTRAINT pk_rh_licafast PRIMARY KEY (idvinculo, datainicio);


--
-- Name: pk_rh_localterceirizado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_localterceirizado
    ADD CONSTRAINT pk_rh_localterceirizado PRIMARY KEY (idlocalterceirizado);


--
-- Name: pk_rh_membro; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_membro
    ADD CONSTRAINT pk_rh_membro PRIMARY KEY (idmembro);


--
-- Name: pk_rh_meta; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_meta
    ADD CONSTRAINT pk_rh_meta PRIMARY KEY (idmeta);


--
-- Name: pk_rh_naohabilitado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_naohabilitado
    ADD CONSTRAINT pk_rh_naohabilitado PRIMARY KEY (idnaohabilitado);


--
-- Name: pk_rh_nivelfuncao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_nivelfuncao
    ADD CONSTRAINT pk_rh_nivelfuncao PRIMARY KEY (idnivel);


--
-- Name: pk_rh_ocorrencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_ocorrencia
    ADD CONSTRAINT pk_rh_ocorrencia PRIMARY KEY (idgrupoocorrencia, idocorrencia);


--
-- Name: pk_rh_ocorrenciaterceirizado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_ocorrenciaterceirizado
    ADD CONSTRAINT pk_rh_ocorrenciaterceirizado PRIMARY KEY (idocorrenciaterceirizado);


--
-- Name: pk_rh_ocupacaofuncao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_ocupacaofuncao
    ADD CONSTRAINT pk_rh_ocupacaofuncao PRIMARY KEY (idocupacaofuncao);


--
-- Name: pk_rh_ocupacaovaga; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_ocupacaovaga
    ADD CONSTRAINT pk_rh_ocupacaovaga PRIMARY KEY (idvinculo, numerovaga);


--
-- Name: pk_rh_pensionista; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_pensionista
    ADD CONSTRAINT pk_rh_pensionista PRIMARY KEY (idpensionista);


--
-- Name: pk_rh_periodoaquisitivo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_periodoaquisitivo
    ADD CONSTRAINT pk_rh_periodoaquisitivo PRIMARY KEY (idvinculo, datainicio);


--
-- Name: pk_rh_presente; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_presente
    ADD CONSTRAINT pk_rh_presente PRIMARY KEY (idpresente);


--
-- Name: pk_rh_proades; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_proades
    ADD CONSTRAINT pk_rh_proades PRIMARY KEY (idproades);


--
-- Name: pk_rh_prorrogacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_prorrogacao
    ADD CONSTRAINT pk_rh_prorrogacao PRIMARY KEY (idvinculo, datafim);


--
-- Name: pk_rh_provimento; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT pk_rh_provimento PRIMARY KEY (idvinculo, datainicio);


--
-- Name: pk_rh_provterceirizado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_provterceirizado
    ADD CONSTRAINT pk_rh_provterceirizado PRIMARY KEY (idterceirizado, datainicio);


--
-- Name: pk_rh_publicacao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_publicacao
    ADD CONSTRAINT pk_rh_publicacao PRIMARY KEY (idpublicacao);


--
-- Name: pk_rh_referencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_referencia
    ADD CONSTRAINT pk_rh_referencia PRIMARY KEY (idclasse, idreferencia);


--
-- Name: pk_rh_representacaopensao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_representacaopensao
    ADD CONSTRAINT pk_rh_representacaopensao PRIMARY KEY (idrepresentacao);


--
-- Name: pk_rh_resultadoreuniao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_resultadoreuniao
    ADD CONSTRAINT pk_rh_resultadoreuniao PRIMARY KEY (idreuniao, idmeta);


--
-- Name: pk_rh_reuniao; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_reuniao
    ADD CONSTRAINT pk_rh_reuniao PRIMARY KEY (idreuniao);


--
-- Name: pk_rh_reuniaoanexo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_reuniaoanexo
    ADD CONSTRAINT pk_rh_reuniaoanexo PRIMARY KEY (idanexo);


--
-- Name: pk_rh_reuniaofator; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_reuniaofator
    ADD CONSTRAINT pk_rh_reuniaofator PRIMARY KEY (idfator);


--
-- Name: pk_rh_situacaofuncional; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_situacaofuncional
    ADD CONSTRAINT pk_rh_situacaofuncional PRIMARY KEY (idsituacao);


--
-- Name: pk_rh_situacaoocorrencia; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_situacaoocorrencia
    ADD CONSTRAINT pk_rh_situacaoocorrencia PRIMARY KEY (idsituacao, idgrupoocorrencia, idocorrencia);


--
-- Name: pk_rh_terceirizado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_terceirizado
    ADD CONSTRAINT pk_rh_terceirizado PRIMARY KEY (idterceirizado);


--
-- Name: pk_rh_tipo1_temp; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_tipo1
    ADD CONSTRAINT pk_rh_tipo1_temp PRIMARY KEY (siape);


--
-- Name: pk_rh_tipo2; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_tipo2
    ADD CONSTRAINT pk_rh_tipo2 PRIMARY KEY (anomes, siape);


--
-- Name: pk_rh_tipo4; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_tipo4
    ADD CONSTRAINT pk_rh_tipo4 PRIMARY KEY (anomes, siape);


--
-- Name: pk_rh_tipolicafast; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_tipolicafast
    ADD CONSTRAINT pk_rh_tipolicafast PRIMARY KEY (idtipolicafast);


--
-- Name: pk_rh_titulacaotemp; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_titulacaotemp
    ADD CONSTRAINT pk_rh_titulacaotemp PRIMARY KEY (idvinculo);


--
-- Name: pk_rh_vaga; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_vaga
    ADD CONSTRAINT pk_rh_vaga PRIMARY KEY (numerovaga);


--
-- Name: pk_rh_vantagem; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_vantagem
    ADD CONSTRAINT pk_rh_vantagem PRIMARY KEY (idvantagem);


--
-- Name: pk_rh_vinculo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_vinculo
    ADD CONSTRAINT pk_rh_vinculo PRIMARY KEY (idvinculo);


--
-- Name: rh_cirurgia_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_cirurgia
    ADD CONSTRAINT rh_cirurgia_pkey PRIMARY KEY (codigo);


--
-- Name: rh_fichaclinica_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_fichaclinica
    ADD CONSTRAINT rh_fichaclinica_pkey PRIMARY KEY (idfichaclinica);


--
-- Name: rh_histcapacitacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_histcapacitacao
    ADD CONSTRAINT rh_histcapacitacao_pkey PRIMARY KEY (idhistcapacitacao);


--
-- Name: rh_histincentivo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_histincentivo
    ADD CONSTRAINT rh_histincentivo_pkey PRIMARY KEY (idhistincentivo);


--
-- Name: rh_historico_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_historico
    ADD CONSTRAINT rh_historico_pkey PRIMARY KEY (idhistorico);


--
-- Name: rh_percqualificacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_percqualificacao
    ADD CONSTRAINT rh_percqualificacao_pkey PRIMARY KEY (idpercqualificacao);


--
-- Name: rh_progressaocapacitacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_progressaocapacitacao
    ADD CONSTRAINT rh_progressaocapacitacao_pkey PRIMARY KEY (idprogressaocapacitacao);


--
-- Name: rh_relatorioimportacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_relatorioimportacao
    ADD CONSTRAINT rh_relatorioimportacao_pkey PRIMARY KEY (idrelatorio);


--
-- Name: rh_vinculocid_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_vinculocid
    ADD CONSTRAINT rh_vinculocid_pkey PRIMARY KEY (idvinculocid);


--
-- Name: rh_vinculosih_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_vinculosih
    ADD CONSTRAINT rh_vinculosih_pkey PRIMARY KEY (idvinculosih);


--
-- Name: sys_c0010067; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_origemvaga
    ADD CONSTRAINT sys_c0010067 PRIMARY KEY (idorigemvaga);


--
-- Name: sys_c002612; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_contagem
    ADD CONSTRAINT sys_c002612 PRIMARY KEY (idvinc);


--
-- Name: sys_c006028; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_funcaoatual
    ADD CONSTRAINT sys_c006028 PRIMARY KEY (idvinculo);


--
-- Name: sys_c006134; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ad_novomaterial
    ADD CONSTRAINT sys_c006134 PRIMARY KEY (idnovomaterial);


--
-- Name: sys_c006526; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_dtlimiteferias
    ADD CONSTRAINT sys_c006526 PRIMARY KEY (iddtlimiteferias);


--
-- Name: sys_c009267; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_escala
    ADD CONSTRAINT sys_c009267 PRIMARY KEY (idescala);


--
-- Name: sys_c009826; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rh_escolaridadepcctae
    ADD CONSTRAINT sys_c009826 PRIMARY KEY (idescolaridadepcctae);


--
-- Name: fki_ad_orctermo1_ad_il; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_ad_orctermo1_ad_il ON ad_orctermo USING btree (idlicitacao, itemdef);


--
-- Name: idx_ad_acessobolsa1_ad_bo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_acessobolsa1_ad_bo ON ad_acessobolsa USING btree (idbolsa);


--
-- Name: idx_ad_acessobolsa2_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_acessobolsa2_cm_us ON ad_acessobolsa USING btree (idusuario);


--
-- Name: idx_ad_acessouoreq1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_acessouoreq1_ad_uo ON ad_acessouoreq USING btree (iduo);


--
-- Name: idx_ad_acessouoreq2_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_acessouoreq2_cm_us ON ad_acessouoreq USING btree (idusuario);


--
-- Name: idx_ad_bolsista1_ad_bo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_bolsista1_ad_bo ON ad_bolsista USING btree (idbolsa);


--
-- Name: idx_ad_bolsista2_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_bolsista2_cm_pe ON ad_bolsista USING btree (idpessoa);


--
-- Name: idx_ad_dependencia1_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_dependencia1_cm_se ON ad_dependencia USING btree (idsetor);


--
-- Name: idx_ad_empenhado1_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenhado1_ad_em ON ad_empenhado USING btree (idempenho);


--
-- Name: idx_ad_empenhado2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenhado2_ad_it ON ad_empenhado USING btree (idlicitacao, item);


--
-- Name: idx_ad_empenho; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_ad_empenho ON ad_empenho USING btree (numero);


--
-- Name: idx_ad_empenho1_ad_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenho1_ad_fo ON ad_empenho USING btree (idfornecedor);


--
-- Name: idx_ad_empenho3_ad_pr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenho3_ad_pr ON ad_empenho USING btree (numpro);


--
-- Name: idx_ad_empenho4_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenho4_ad_uo ON ad_empenho USING btree (iduo);


--
-- Name: idx_ad_empenho5_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_empenho5_ad_em ON ad_empenho USING btree (idempenhoref);


--
-- Name: idx_ad_estoque1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_estoque1_ad_uo ON ad_estoque USING btree (iduo);


--
-- Name: idx_ad_estoque2_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_estoque2_ad_ma ON ad_estoque USING btree (idmaterial);


--
-- Name: idx_ad_executa1_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executa1_ad_ru ON ad_executa USING btree (idrubrica);


--
-- Name: idx_ad_executa1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executa1_ad_uo ON ad_executa USING btree (iduo);


--
-- Name: idx_ad_executa2_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executa2_ad_ti ON ad_executa USING btree (idtiporeq);


--
-- Name: idx_ad_executor1_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executor1_cm_us ON ad_executor USING btree (idusuario);


--
-- Name: idx_ad_executor2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executor2_ad_uo ON ad_executor USING btree (iduo);


--
-- Name: idx_ad_executoralmox1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executoralmox1_ad_uo ON ad_executoralmox USING btree (iduoexecutante);


--
-- Name: idx_ad_executoralmox2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executoralmox2_ad_uo ON ad_executoralmox USING btree (iduorequisitante);


--
-- Name: idx_ad_executorservint1_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executorservint1_ad_ti ON ad_executorservint USING btree (idtiposervint);


--
-- Name: idx_ad_executorservint2_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_executorservint2_cm_us ON ad_executorservint USING btree (idusuario);


--
-- Name: idx_ad_fornecedor1_cm_in; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_fornecedor1_cm_in ON ad_fornecedor USING btree (idinstituicao);


--
-- Name: idx_ad_fornecedor2_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_fornecedor2_cm_pe ON ad_fornecedor USING btree (idpessoa);


--
-- Name: idx_ad_fornecedor3_cm_ag; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_fornecedor3_cm_ag ON ad_fornecedor USING btree (idagenc);


--
-- Name: idx_ad_fpotencial1_ad_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_fpotencial1_ad_fo ON ad_fpotencial USING btree (idfornecedor);


--
-- Name: idx_ad_fpotencial2_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_fpotencial2_ad_ma ON ad_fpotencial USING btree (idmaterial);


--
-- Name: idx_ad_funcionarioresp1_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_funcionarioresp1_cm_se ON ad_funcionarioresp USING btree (idsetor);


--
-- Name: idx_ad_funcionarioresp2_rh_fu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_funcionarioresp2_rh_fu ON ad_funcionarioresp USING btree (idfunc);


--
-- Name: idx_ad_gestor1_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_gestor1_cm_us ON ad_gestor USING btree (idusuario);


--
-- Name: idx_ad_gestor2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_gestor2_ad_uo ON ad_gestor USING btree (iduo);


--
-- Name: idx_ad_itemlicitacao1_ad_li; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemlicitacao1_ad_li ON ad_itemlicitacao USING btree (idlicitacao);


--
-- Name: idx_ad_itemnota1_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemnota1_ad_em ON ad_itemnota USING btree (idempenhado);


--
-- Name: idx_ad_itemnota2_ad_no; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemnota2_ad_no ON ad_itemnota USING btree (idnotafiscal);


--
-- Name: idx_ad_itempatrimo1_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimo1_ad_ma ON ad_itempatrimo USING btree (idmaterial);


--
-- Name: idx_ad_itempatrimo2_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimo2_cm_se ON ad_itempatrimo USING btree (idsetor);


--
-- Name: idx_ad_itempatrimonio1_ad_de; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio1_ad_de ON ad_itempatrimonio USING btree (iddependencia);


--
-- Name: idx_ad_itempatrimonio2_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio2_ad_ma ON ad_itempatrimonio USING btree (idmaterial);


--
-- Name: idx_ad_itempatrimonio3_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio3_cm_se ON ad_itempatrimonio USING btree (idsetor);


--
-- Name: idx_ad_itempatrimonio4_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio4_ad_em ON ad_itempatrimonio USING btree (idempenhado);


--
-- Name: idx_ad_itempatrimonio5_ad_cl; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio5_ad_cl ON ad_itempatrimonio USING btree (idclassificador);


--
-- Name: idx_ad_itempatrimonio6_proce; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itempatrimonio6_proce ON ad_itempatrimonio USING btree (numpro);


--
-- Name: idx_ad_itemreq1_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreq1_ad_ma ON ad_itemreq USING btree (idmaterial);


--
-- Name: idx_ad_itemreq2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreq2_ad_re ON ad_itemreq USING btree (idrequisicao);


--
-- Name: idx_ad_itemreq3_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreq3_ad_it ON ad_itemreq USING btree (idlicitacao, item);


--
-- Name: idx_ad_itemreqdiaria1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria1_rh_vi ON ad_itemreqdiaria USING btree (idvinculo);


--
-- Name: idx_ad_itemreqdiaria2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria2_ad_re ON ad_itemreqdiaria USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqdiaria2_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria2_rh_vi ON ad_itemreqdiaria USING btree (idvinculoprop);


--
-- Name: idx_ad_itemreqdiaria3_ad_pr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria3_ad_pr ON ad_itemreqdiaria USING btree (numpro);


--
-- Name: idx_ad_itemreqdiaria4_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqdiaria4_rh_vi ON ad_itemreqdiaria USING btree (idvinculochefe);


--
-- Name: idx_ad_itemreqhotel1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel1_cm_pe ON ad_itemreqhotel USING btree (idpessoa);


--
-- Name: idx_ad_itemreqhotel2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel2_ad_re ON ad_itemreqhotel USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqhotel3_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel3_ad_em ON ad_itemreqhotel USING btree (idempenho);


--
-- Name: idx_ad_itemreqhotel4_ad_ho; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqhotel4_ad_ho ON ad_itemreqhotel USING btree (idhotelpref);


--
-- Name: idx_ad_itemreqpassagem1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem1_cm_pe ON ad_itemreqpassagem USING btree (idpessoa);


--
-- Name: idx_ad_itemreqpassagem2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem2_ad_re ON ad_itemreqpassagem USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqpassagem3_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem3_ad_em ON ad_itemreqpassagem USING btree (idempenho);


--
-- Name: idx_ad_itemreqpassagem4_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem4_cm_mu ON ad_itemreqpassagem USING btree (idmunicipioorigem);


--
-- Name: idx_ad_itemreqpassagem5_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem5_cm_mu ON ad_itemreqpassagem USING btree (idmunicipiodestino);


--
-- Name: idx_ad_itemreqpassagem7_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqpassagem7_ad_em ON ad_itemreqpassagem USING btree (idempresapassagem);


--
-- Name: idx_ad_itemreqrest1_cm_p; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest1_cm_p ON ad_itemreqrestaurante USING btree (idpessoa);


--
-- Name: idx_ad_itemreqrest2_ad_r; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest2_ad_r ON ad_itemreqrestaurante USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqrest3_ad_e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest3_ad_e ON ad_itemreqrestaurante USING btree (idempenho);


--
-- Name: idx_ad_itemreqrest4_cm_p; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest4_cm_p ON ad_itemreqrestaurante USING btree (idpessoaacompanhante);


--
-- Name: idx_ad_itemreqrest5_ad_r; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqrest5_ad_r ON ad_itemreqrestaurante USING btree (idrestaurantepref);


--
-- Name: idx_ad_itemreqservext1_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservext1_ad_re ON ad_itemreqservext USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqservext2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservext2_ad_it ON ad_itemreqservext USING btree (idlicitacao, item);


--
-- Name: idx_ad_itemreqservint1_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservint1_ad_ti ON ad_itemreqservint USING btree (idtiposervint);


--
-- Name: idx_ad_itemreqservint2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservint2_ad_re ON ad_itemreqservint USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqservpf1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservpf1_cm_pe ON ad_itemreqservpf USING btree (idpessoa);


--
-- Name: idx_ad_itemreqservpf2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservpf2_ad_re ON ad_itemreqservpf USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqservpf3_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqservpf3_ad_em ON ad_itemreqservpf USING btree (idempenho);


--
-- Name: idx_ad_itemreqveiculo1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo1_cm_pe ON ad_itemreqveiculo USING btree (idpessoa);


--
-- Name: idx_ad_itemreqveiculo2_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo2_ad_re ON ad_itemreqveiculo USING btree (idrequisicao);


--
-- Name: idx_ad_itemreqveiculo3_ad_ve; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo3_ad_ve ON ad_itemreqveiculo USING btree (placa);


--
-- Name: idx_ad_itemreqveiculo4_ad_mo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo4_ad_mo ON ad_itemreqveiculo USING btree (idmotorista);


--
-- Name: idx_ad_itemreqveiculo5_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo5_cm_mu ON ad_itemreqveiculo USING btree (idmunicipiodestino);


--
-- Name: idx_ad_itemreqveiculo6_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo6_cm_mu ON ad_itemreqveiculo USING btree (idmunicipioorigem);


--
-- Name: idx_ad_itemreqveiculo7_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_itemreqveiculo7_ad_ti ON ad_itemreqveiculo USING btree (tipoveiculo);


--
-- Name: idx_ad_lancamentoint1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint1_ad_uo ON ad_lancamentoint USING btree (iduoreq);


--
-- Name: idx_ad_lancamentoint2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint2_ad_uo ON ad_lancamentoint USING btree (iduoexec);


--
-- Name: idx_ad_lancamentoint3_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint3_ad_ru ON ad_lancamentoint USING btree (idrubrica);


--
-- Name: idx_ad_lancamentoint4_ad_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_lancamentoint4_ad_re ON ad_lancamentoint USING btree (idrequisicao);


--
-- Name: idx_ad_licitacao1_ad_mo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_licitacao1_ad_mo ON ad_licitacao USING btree (idmodalidadelicitacao);


--
-- Name: idx_ad_licitacao2_ad_pr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_licitacao2_ad_pr ON ad_licitacao USING btree (numpro);


--
-- Name: idx_ad_localidadediaria1_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_localidadediaria1_cm_mu ON ad_localidadediaria USING btree (idmunicipio);


--
-- Name: idx_ad_localidadediaria2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_localidadediaria2_ad_it ON ad_localidadediaria USING btree (idrequisicao, idvinculo);


--
-- Name: idx_ad_mapalicitacao1_ad_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_mapalicitacao1_ad_fo ON ad_mapalicitacao USING btree (idfornecedor);


--
-- Name: idx_ad_mapalicitacao2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_mapalicitacao2_ad_it ON ad_mapalicitacao USING btree (idlicitacao, item);


--
-- Name: idx_ad_material1_ad_ca; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_material1_ad_ca ON ad_material USING btree (codmaterial);


--
-- Name: idx_ad_material2_ad_su; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_material2_ad_su ON ad_material USING btree (idelemento, idsubelemento);


--
-- Name: idx_ad_motorista1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_motorista1_cm_pe ON ad_motorista USING btree (idpessoa);


--
-- Name: idx_ad_movimento1_ad_mo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimento1_ad_mo ON ad_movimento USING btree (iditemnota);


--
-- Name: idx_ad_movimento1_ad_or; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimento1_ad_or ON ad_movimento USING btree (idordement);


--
-- Name: idx_ad_movimento2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimento2_ad_it ON ad_movimento USING btree (idrequisicao, idmaterial);


--
-- Name: idx_ad_movimentopat1_ad_de; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat1_ad_de ON ad_movimentopat USING btree (iddependenciaorigem);


--
-- Name: idx_ad_movimentopat2_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat2_ad_it ON ad_movimentopat USING btree (iditempatrimonio);


--
-- Name: idx_ad_movimentopat3_ad_de; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat3_ad_de ON ad_movimentopat USING btree (iddependenciadestino);


--
-- Name: idx_ad_movimentopat4_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat4_cm_se ON ad_movimentopat USING btree (idsetororigem);


--
-- Name: idx_ad_movimentopat5_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_movimentopat5_cm_se ON ad_movimentopat USING btree (idsetordestino);


--
-- Name: idx_ad_notafiscal1_ad_li; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_notafiscal1_ad_li ON ad_notafiscal USING btree (idliquidacao);


--
-- Name: idx_ad_notafiscal2_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_notafiscal2_ad_em ON ad_notafiscal USING btree (idempenho);


--
-- Name: idx_ad_novomaterial1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_novomaterial1_ad_uo ON ad_novomaterial USING btree (iduoreq);


--
-- Name: idx_ad_novomaterial2_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_novomaterial2_cm_us ON ad_novomaterial USING btree (idusuario);


--
-- Name: idx_ad_orcamento1_ad_pt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamento1_ad_pt ON ad_orcamento USING btree (idptr);


--
-- Name: idx_ad_orcamento2_ad_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamento2_ad_fo ON ad_orcamento USING btree (idfonte);


--
-- Name: idx_ad_orcamento3_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamento3_ad_ru ON ad_orcamento USING btree (idrubrica);


--
-- Name: idx_ad_orcamentohist1_ad_or; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamentohist1_ad_or ON ad_orcamentohist USING btree (idorcamento);


--
-- Name: idx_ad_orcamentointerno1_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamentointerno1_ad_ru ON ad_orcamentointerno USING btree (idrubrica);


--
-- Name: idx_ad_orcamentointerno2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcamentointerno2_ad_uo ON ad_orcamentointerno USING btree (iduo);


--
-- Name: idx_ad_orcinttemp2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcinttemp2_ad_uo ON ad_orcinttemp USING btree (iduo);


--
-- Name: idx_ad_orcinttemp_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_orcinttemp_ad_ru ON ad_orcinttemp USING btree (idrubrica);


--
-- Name: idx_ad_ordembancaria1_ad_li; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_ordembancaria1_ad_li ON ad_ordembancaria USING btree (idliquidacao);


--
-- Name: idx_ad_ordentrega1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_ordentrega1_ad_uo ON ad_ordentrega USING btree (iduoexec);


--
-- Name: idx_ad_pagbolsa1_ad_bo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_pagbolsa1_ad_bo ON ad_pagbolsa USING btree (idbolsista);


--
-- Name: idx_ad_paiempenho1_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_paiempenho1_ad_em ON ad_paiempenho USING btree (idempenhopai);


--
-- Name: idx_ad_paiempenho2_ad_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_paiempenho2_ad_em ON ad_paiempenho USING btree (idempenho);


--
-- Name: idx_ad_requisicao2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisicao2_ad_uo ON ad_requisicao USING btree (iduoreq);


--
-- Name: idx_ad_requisicao3_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisicao3_ad_uo ON ad_requisicao USING btree (iduoexec);


--
-- Name: idx_ad_requisicao4_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisicao4_cm_us ON ad_requisicao USING btree (idusuarioreq);


--
-- Name: idx_ad_requisita1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisita1_ad_uo ON ad_requisita USING btree (iduo);


--
-- Name: idx_ad_requisita2_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisita2_ad_ti ON ad_requisita USING btree (idtiporeq);


--
-- Name: idx_ad_requisita3_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_requisita3_ad_ru ON ad_requisita USING btree (idrubrica);


--
-- Name: idx_ad_saldolic1_ad_ma; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_saldolic1_ad_ma ON ad_saldolic USING btree (idmaterial);


--
-- Name: idx_ad_saldolic2_ad_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_saldolic2_ad_fo ON ad_saldolic USING btree (idfornecedor);


--
-- Name: idx_ad_servico1_ad_su; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_servico1_ad_su ON ad_servico USING btree (idelemento, idsubelemento);


--
-- Name: idx_ad_subelemento1_ad_el; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_subelemento1_ad_el ON ad_subelemento USING btree (idelemento);


--
-- Name: idx_ad_tiporeq1_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_tiporeq1_ad_ru ON ad_tiporeq USING btree (idrubrica);


--
-- Name: idx_ad_tiposervint1_ad_ru; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_tiposervint1_ad_ru ON ad_tiposervint USING btree (idrubrica);


--
-- Name: idx_ad_trecho1_ad_it; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_trecho1_ad_it ON ad_trecho USING btree (idrequisicao, idpessoa);


--
-- Name: idx_ad_uo1_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_uo1_cm_se ON ad_uo USING btree (idsetor);


--
-- Name: idx_ad_uoalmox1_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_uoalmox1_ad_uo ON ad_uoalmox USING btree (iduoalmox);


--
-- Name: idx_ad_uoalmox2_ad_uo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_uoalmox2_ad_uo ON ad_uoalmox USING btree (iduoreq);


--
-- Name: idx_ad_veiculo1_ad_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_ad_veiculo1_ad_ti ON ad_veiculo USING btree (tipoveiculo);


--
-- Name: idx_bt_camposfixos1_bt_ob; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_camposfixos1_bt_ob ON bt_camposfixos USING btree (idobra);


--
-- Name: idx_bt_camposfixos2_bt_et; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_camposfixos2_bt_et ON bt_camposfixos USING btree (idetiqueta);


--
-- Name: idx_bt_camposfixosperiodico0_bt_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_camposfixosperiodico0_bt_pe ON bt_camposfixosperiodico USING btree (idperiodico);


--
-- Name: idx_bt_camposfixosperiodico1_bt_et; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_camposfixosperiodico1_bt_et ON bt_camposfixosperiodico USING btree (idetiqueta);


--
-- Name: idx_bt_camposubficha1_bt_su; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_camposubficha1_bt_su ON bt_camposubficha USING btree (idetiqueta, subcampo);


--
-- Name: idx_bt_camposubficha2_bt_su; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_camposubficha2_bt_su ON bt_camposubficha USING btree (idficha, idsubficha);


--
-- Name: idx_bt_consultacampo1_bt_su; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_consultacampo1_bt_su ON bt_consultacampo USING btree (idetiqueta, subcampo);


--
-- Name: idx_bt_consultacampo2_bt_co; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_consultacampo2_bt_co ON bt_consultacampo USING btree (idconsulta);


--
-- Name: idx_bt_direito1_bt_gr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_direito1_bt_gr ON bt_direito USING btree (idgrupo);


--
-- Name: idx_bt_direito2_bt_op; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_direito2_bt_op ON bt_direito USING btree (idoperacao);


--
-- Name: idx_bt_direito3_bt_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_direito3_bt_re ON bt_direito USING btree (idregracirculacao);


--
-- Name: idx_bt_emprestimo1_bt_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_emprestimo1_bt_us ON bt_emprestimo USING btree (idusuario);


--
-- Name: idx_bt_emprestimo2_bt_ex; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_emprestimo2_bt_ex ON bt_emprestimo USING btree (idexemplar);


--
-- Name: idx_bt_emprestimo3_dtdevolucao; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_emprestimo3_dtdevolucao ON bt_emprestimo USING btree (datahoradadevolucao);


--
-- Name: idx_bt_emprestimo4_dtemp; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_emprestimo4_dtemp ON bt_emprestimo USING btree (datahoradoemprestimo);


--
-- Name: idx_bt_emprestimo5_dtprev; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_emprestimo5_dtprev ON bt_emprestimo USING btree (datahoraprevisaodevolucao);


--
-- Name: idx_bt_exemplar1_bt_es; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_exemplar1_bt_es ON bt_exemplar USING btree (idestado);


--
-- Name: idx_bt_exemplar2_bt_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_exemplar2_bt_re ON bt_exemplar USING btree (idregracirculacao);


--
-- Name: idx_bt_exemplar3_bt_un; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_exemplar3_bt_un ON bt_exemplar USING btree (idunidade);


--
-- Name: idx_bt_exemplar4_bt_co; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_exemplar4_bt_co ON bt_exemplar USING btree (idcolecao);


--
-- Name: idx_bt_exemplar5_bt_ob; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_exemplar5_bt_ob ON bt_exemplar USING btree (idobra);


--
-- Name: idx_bt_exemplar_numerodotombo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_bt_exemplar_numerodotombo ON bt_exemplar USING btree (numerodotombo);


--
-- Name: idx_bt_genero1_bt_fi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_genero1_bt_fi ON bt_genero USING btree (idficha);


--
-- Name: idx_bt_indicadores0_bt_et; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_indicadores0_bt_et ON bt_indicadores USING btree (idetiqueta);


--
-- Name: idx_bt_indicadores1_bt_ob; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_indicadores1_bt_ob ON bt_indicadores USING btree (idobra);


--
-- Name: idx_bt_indicadoresperiodico0_bt_et; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_indicadoresperiodico0_bt_et ON bt_indicadoresperiodico USING btree (idetiqueta);


--
-- Name: idx_bt_indicadoresperiodico1_bt_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_indicadoresperiodico1_bt_pe ON bt_indicadoresperiodico USING btree (idperiodico);


--
-- Name: idx_bt_logoperacao1_bt_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_logoperacao1_bt_us ON bt_logoperacao USING btree (idusuario);


--
-- Name: idx_bt_logoperacao2_bt_op; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_logoperacao2_bt_op ON bt_logoperacao USING btree (idoperacao);


--
-- Name: idx_bt_logoperacao3_ident; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_logoperacao3_ident ON bt_logoperacao USING btree (identificador);


--
-- Name: idx_bt_logoperacaodet1_bt_l; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_logoperacaodet1_bt_l ON bt_logoperacaodetalhe USING btree (idlogoperacao);


--
-- Name: idx_bt_material1_bt_su; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_material1_bt_su ON bt_material USING btree (idetiqueta, subcampo);


--
-- Name: idx_bt_material2_bt_ob; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_material2_bt_ob ON bt_material USING btree (idobra);


--
-- Name: idx_bt_multa1_bt_em; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_multa1_bt_em ON bt_multa USING btree (idemprestimo);


--
-- Name: idx_bt_notainfracao1_bt_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_notainfracao1_bt_us ON bt_notainfracao USING btree (idusuario);


--
-- Name: idx_bt_notainfracao2_bt_in; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_notainfracao2_bt_in ON bt_notainfracao USING btree (idinfracao);


--
-- Name: idx_bt_obra1_bt_ge; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_obra1_bt_ge ON bt_obra USING btree (idgenero);


--
-- Name: idx_bt_obra2_bt_ed; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_obra2_bt_ed ON bt_obra USING btree (ideditora);


--
-- Name: idx_bt_obra_numerodaobra; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_obra_numerodaobra ON bt_obra USING btree (numerodaobra);


--
-- Name: idx_bt_observacao1_bt_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_observacao1_bt_us ON bt_observacao USING btree (idusuario);


--
-- Name: idx_bt_opcaolista1_bt_op; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_opcaolista1_bt_op ON bt_opcaolista USING btree (idopcao);


--
-- Name: idx_bt_politica2_bt_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_politica2_bt_re ON bt_politica USING btree (idregracirculacao);


--
-- Name: idx_bt_politica3_bt_gr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_politica3_bt_gr ON bt_politica USING btree (idgrupo);


--
-- Name: idx_bt_posicao1_bt_et; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_posicao1_bt_et ON bt_posicao USING btree (idetiqueta);


--
-- Name: idx_bt_posicao2_bt_op; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_posicao2_bt_op ON bt_posicao USING btree (idopcao);


--
-- Name: idx_bt_posicaosubficha1_bt_su; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_posicaosubficha1_bt_su ON bt_posicaosubficha USING btree (idficha, idsubficha);


--
-- Name: idx_bt_posicaosubficha2_bt_po; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_posicaosubficha2_bt_po ON bt_posicaosubficha USING btree (idetiqueta, posicao);


--
-- Name: idx_bt_reserva1_bt_si; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_reserva1_bt_si ON bt_reserva USING btree (idsituacao);


--
-- Name: idx_bt_reserva2_bt_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_reserva2_bt_us ON bt_reserva USING btree (idusuario);


--
-- Name: idx_bt_reserva3_bt_ex; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_reserva3_bt_ex ON bt_reserva USING btree (idexemplar);


--
-- Name: idx_bt_subcampo1_bt_et; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_subcampo1_bt_et ON bt_subcampo USING btree (idetiqueta);


--
-- Name: idx_bt_subcampo2_bt_op; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_subcampo2_bt_op ON bt_subcampo USING btree (idopcao);


--
-- Name: idx_bt_subficha1_bt_fi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_subficha1_bt_fi ON bt_subficha USING btree (idficha);


--
-- Name: idx_bt_transicao0_bt_es; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_transicao0_bt_es ON bt_transicao USING btree (idestadopresente);


--
-- Name: idx_bt_transicao1_bt_es; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_transicao1_bt_es ON bt_transicao USING btree (idestadofuturo);


--
-- Name: idx_bt_transicao2_bt_op; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_transicao2_bt_op ON bt_transicao USING btree (idoperacao);


--
-- Name: idx_bt_usuarioexterno1_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_usuarioexterno1_cm_mu ON bt_usuarioexterno USING btree (idmunicipio);


--
-- Name: idx_bt_validacao1_bt_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_validacao1_bt_us ON bt_validacao USING btree (idusuario);


--
-- Name: idx_bt_vinculo1_bt_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_vinculo1_bt_us ON bt_vinculo USING btree (idusuario);


--
-- Name: idx_bt_vinculo2_bt_gr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_bt_vinculo2_bt_gr ON bt_vinculo USING btree (idgrupo);


--
-- Name: idx_cm_acesso1_cm_tr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_acesso1_cm_tr ON cm_acesso USING btree (idtrans);


--
-- Name: idx_cm_acesso2_cm_gr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_acesso2_cm_gr ON cm_acesso USING btree (idgrupo);


--
-- Name: idx_cm_agencia1_cm_ba; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_agencia1_cm_ba ON cm_agencia USING btree (idbanco);


--
-- Name: idx_cm_grpusuario1_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_grpusuario1_cm_us ON cm_grpusuario USING btree (idusuario);


--
-- Name: idx_cm_grpusuario2_cm_gr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_grpusuario2_cm_gr ON cm_grpusuario USING btree (idgrupo);


--
-- Name: idx_cm_indicemensal1_cm_in; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_indicemensal1_cm_in ON cm_indicemensal USING btree (sigla);


--
-- Name: idx_cm_instituicao1_cm_pa; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_instituicao1_cm_pa ON cm_instituicao USING btree (idpais);


--
-- Name: idx_cm_instituicao2_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_instituicao2_cm_mu ON cm_instituicao USING btree (idmunicipio);


--
-- Name: idx_cm_log1_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_log1_cm_us ON cm_log USING btree (idusuario);


--
-- Name: idx_cm_municipio; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_cm_municipio ON cm_municipio USING btree (municipio, iduf);


--
-- Name: idx_cm_municipio1_cm_uf; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_municipio1_cm_uf ON cm_municipio USING btree (iduf);


--
-- Name: idx_cm_municipio2_cm_pa; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_municipio2_cm_pa ON cm_municipio USING btree (idpais);


--
-- Name: idx_cm_noticia1_cm_si; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_noticia1_cm_si ON cm_noticia USING btree (idsistema);


--
-- Name: idx_cm_organograma1_cm_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_organograma1_cm_ti ON cm_organograma USING btree (idtipoorganograma);


--
-- Name: idx_cm_organograma2_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_organograma2_cm_se ON cm_organograma USING btree (idsetor);


--
-- Name: idx_cm_organograma3_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_organograma3_cm_se ON cm_organograma USING btree (idsetorpai);


--
-- Name: idx_cm_pessoa2_cm_pa; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_pessoa2_cm_pa ON cm_pessoa USING btree (idpais);


--
-- Name: idx_cm_pessoa3_cm_mu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_pessoa3_cm_mu ON cm_pessoa USING btree (idmunicipio);


--
-- Name: idx_cm_pessoa5_cm_es; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_pessoa5_cm_es ON cm_pessoa USING btree (idestadocivil);


--
-- Name: idx_cm_pessoa5_cm_pa; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_pessoa5_cm_pa ON cm_pessoa USING btree (idpaisnascimento);


--
-- Name: idx_cm_pessoa6_cm_pa; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_pessoa6_cm_pa ON cm_pessoa USING btree (idpaisnacionalidade);


--
-- Name: idx_cm_pessoa7_cm_ag; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_pessoa7_cm_ag ON cm_pessoa USING btree (idbanco, idagenc);


--
-- Name: idx_cm_pessoa_cpf; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_pessoa_cpf ON cm_pessoa USING btree (cpf);


--
-- Name: idx_cm_sessao1_cm_us; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_sessao1_cm_us ON cm_sessao USING btree (idusuario);


--
-- Name: idx_cm_setoracesso1esso01; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_setoracesso1esso01 ON cm_setoracesso USING btree (idsetor);


--
-- Name: idx_cm_setoracesso2esso02; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_setoracesso2esso02 ON cm_setoracesso USING btree (idsetoracesso);


--
-- Name: idx_cm_setorequivalente1_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_setorequivalente1_cm_se ON cm_setorequivalente USING btree (idsetor);


--
-- Name: idx_cm_setorequivalente2_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_setorequivalente2_cm_se ON cm_setorequivalente USING btree (idsetorequivalente);


--
-- Name: idx_cm_transacao1_cm_si; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_transacao1_cm_si ON cm_transacao USING btree (idsistema);


--
-- Name: idx_cm_usuario1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_usuario1_cm_pe ON cm_usuario USING btree (idpessoa);


--
-- Name: idx_cm_usuario2_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_cm_usuario2_cm_se ON cm_usuario USING btree (idsetor);


--
-- Name: idx_rh_adicional1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_adicional1_rh_vi ON rh_adicional USING btree (idvinculo);


--
-- Name: idx_rh_atividade1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_atividade1_rh_vi ON rh_atividade USING btree (idvinculo);


--
-- Name: idx_rh_averbacao1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_averbacao1_rh_vi ON rh_averbacao USING btree (idvinculo);


--
-- Name: idx_rh_averbfinalidade1_rh_av; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_averbfinalidade1_rh_av ON rh_averbfinalidade USING btree (idaverbacao);


--
-- Name: idx_rh_capacitacaoinsc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX idx_rh_capacitacaoinsc ON rh_capacitacaoinsc USING btree (idmodulo, idvinculo);


--
-- Name: idx_rh_cargo1_rh_gr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_cargo1_rh_gr ON rh_cargo USING btree (idgrupocargo);


--
-- Name: idx_rh_cargo2_rh_jo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_cargo2_rh_jo ON rh_cargo USING btree (idjornada);


--
-- Name: idx_rh_cessao1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_cessao1_rh_vi ON rh_cessao USING btree (idvinculo);


--
-- Name: idx_rh_cessao2_rh_oc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_cessao2_rh_oc ON rh_cessao USING btree (idgrupoocorrencia, idocorrencia);


--
-- Name: idx_rh_cessao3_cm_in; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_cessao3_cm_in ON rh_cessao USING btree (idinstituicao);


--
-- Name: idx_rh_cessao4_rh_pu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_cessao4_rh_pu ON rh_cessao USING btree (idpublicacao);


--
-- Name: idx_rh_cidsubcategoria1_rh_ci; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_cidsubcategoria1_rh_ci ON rh_cidsubcategoria USING btree (idcidcategoria);


--
-- Name: idx_rh_classegrupocargo1_rh_cl; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_classegrupocargo1_rh_cl ON rh_classegrupocargo USING btree (idclasse);


--
-- Name: idx_rh_classegrupocargo2_rh_gr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_classegrupocargo2_rh_gr ON rh_classegrupocargo USING btree (idgrupocargo);


--
-- Name: idx_rh_dependencia1_rh_de; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_dependencia1_rh_de ON rh_dependencia USING btree (iddependente);


--
-- Name: idx_rh_dependente1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_dependente1_cm_pe ON rh_dependente USING btree (idpessoa);


--
-- Name: idx_rh_dependente2_rh_fu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_dependente2_rh_fu ON rh_dependente USING btree (idfuncionario);


--
-- Name: idx_rh_desaverbacao1_rh_av; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_desaverbacao1_rh_av ON rh_desaverbacao USING btree (idaverbacao);


--
-- Name: idx_rh_ferias1_rh_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_ferias1_rh_pe ON rh_ferias USING btree (idvinculoperaq, datainicioperaq);


--
-- Name: idx_rh_funcao1_rh_pu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_funcao1_rh_pu ON rh_funcao USING btree (idpublicacaoinicio);


--
-- Name: idx_rh_funcao2_rh_pu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_funcao2_rh_pu ON rh_funcao USING btree (idpublicacaofim);


--
-- Name: idx_rh_funcao3_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_funcao3_cm_se ON rh_funcao USING btree (idsetor);


--
-- Name: idx_rh_funcao4_rh_ni; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_funcao4_rh_ni ON rh_funcao USING btree (idnivel);


--
-- Name: idx_rh_funcionario1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_funcionario1_cm_pe ON rh_funcionario USING btree (idpessoa);


--
-- Name: idx_rh_grupolicafast1_rh_oc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_grupolicafast1_rh_oc ON rh_grupolicafast USING btree (idgrupoocorrencia, idocorrencia);


--
-- Name: idx_rh_grupolicafast2_rh_ti; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_grupolicafast2_rh_ti ON rh_grupolicafast USING btree (idtipolicafast);


--
-- Name: idx_rh_histformacao1_rh_fo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_histformacao1_rh_fo ON rh_histformacao USING btree (idformacao);


--
-- Name: idx_rh_histformacao2_rh_fu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_histformacao2_rh_fu ON rh_histformacao USING btree (idfuncionario);


--
-- Name: idx_rh_histtitulacao1_rh_fu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_histtitulacao1_rh_fu ON rh_histtitulacao USING btree (idfuncionario);


--
-- Name: idx_rh_histvantagem1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_histvantagem1_rh_vi ON rh_histvantagem USING btree (idvinculo);


--
-- Name: idx_rh_histvantagem2_rh_va; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_histvantagem2_rh_va ON rh_histvantagem USING btree (idvantagem);


--
-- Name: idx_rh_licafast1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_licafast1_rh_vi ON rh_licafast USING btree (idvinculo);


--
-- Name: idx_rh_licafast2_rh_oc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_licafast2_rh_oc ON rh_licafast USING btree (idgrupoocorrencia, idocorrencia);


--
-- Name: idx_rh_licafast3_rh_ci; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_licafast3_rh_ci ON rh_licafast USING btree (idcidcategoria, idcidsubcategoria);


--
-- Name: idx_rh_licafast4_rh_pu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_licafast4_rh_pu ON rh_licafast USING btree (idpublicacao);


--
-- Name: idx_rh_ocorrencia1_rh_gr; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_ocorrencia1_rh_gr ON rh_ocorrencia USING btree (idgrupoocorrencia);


--
-- Name: idx_rh_ocupacaofuncao1_rh_fu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_ocupacaofuncao1_rh_fu ON rh_ocupacaofuncao USING btree (idfuncao);


--
-- Name: idx_rh_ocupacaofuncao2_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_ocupacaofuncao2_rh_vi ON rh_ocupacaofuncao USING btree (idvinculo);


--
-- Name: idx_rh_ocupacaofuncao3_rh_pu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_ocupacaofuncao3_rh_pu ON rh_ocupacaofuncao USING btree (idpublicacaoinicio);


--
-- Name: idx_rh_ocupacaofuncao4_rh_pu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_ocupacaofuncao4_rh_pu ON rh_ocupacaofuncao USING btree (idpublicacaofim);


--
-- Name: idx_rh_ocupacaovaga1_rh_va; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_ocupacaovaga1_rh_va ON rh_ocupacaovaga USING btree (numerovaga);


--
-- Name: idx_rh_ocupacaovaga2_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_ocupacaovaga2_rh_vi ON rh_ocupacaovaga USING btree (idvinculo);


--
-- Name: idx_rh_pensionista1_cm_pe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_pensionista1_cm_pe ON rh_pensionista USING btree (idpessoa);


--
-- Name: idx_rh_pensionista2_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_pensionista2_rh_vi ON rh_pensionista USING btree (idvinculo);


--
-- Name: idx_rh_periodoaquis1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_periodoaquis1_rh_vi ON rh_periodoaquisitivo USING btree (idvinculo);


--
-- Name: idx_rh_prorrogacao1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_prorrogacao1_rh_vi ON rh_prorrogacao USING btree (idvinculo);


--
-- Name: idx_rh_provimento1_rh_vi; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_provimento1_rh_vi ON rh_provimento USING btree (idvinculo);


--
-- Name: idx_rh_provimento2_rh_si; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_provimento2_rh_si ON rh_provimento USING btree (idsituacao);


--
-- Name: idx_rh_provimento3_rh_ca; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_provimento3_rh_ca ON rh_provimento USING btree (idgrupocargo, idcargo);


--
-- Name: idx_rh_provimento4_cm_se; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_provimento4_cm_se ON rh_provimento USING btree (idsetor);


--
-- Name: idx_rh_provimento5_rh_re; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_provimento5_rh_re ON rh_provimento USING btree (idclasse, idreferencia);


--
-- Name: idx_rh_provimento6_rh_jo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_provimento6_rh_jo ON rh_provimento USING btree (idjornada);


--
-- Name: idx_rh_provimento7_rh_pu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_provimento7_rh_pu ON rh_provimento USING btree (idpublicacao);


--
-- Name: idx_rh_provimento8_rh_oc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_provimento8_rh_oc ON rh_provimento USING btree (idgrupoocorrencia, idocorrencia);


--
-- Name: idx_rh_publicacao1_rh_di; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_publicacao1_rh_di ON rh_publicacao USING btree (iddiplomalegal);


--
-- Name: idx_rh_referencia1_rh_cg; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_referencia1_rh_cg ON rh_referencia USING btree (idclassegrupocargo);


--
-- Name: idx_rh_referencia1_rh_cl; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_referencia1_rh_cl ON rh_referencia USING btree (idclasse);


--
-- Name: idx_rh_situacaoocor1_rh_o; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_situacaoocor1_rh_o ON rh_situacaoocorrencia USING btree (idgrupoocorrencia, idocorrencia);


--
-- Name: idx_rh_situacaoocor2_rh_s; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_situacaoocor2_rh_s ON rh_situacaoocorrencia USING btree (idsituacao);


--
-- Name: idx_rh_tipo3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_tipo3 ON rh_tipo3 USING btree (anomes, siape, rub_codigo);


--
-- Name: idx_rh_vaga1_rh_ca; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_vaga1_rh_ca ON rh_vaga USING btree (idgrupocargo, idcargo);


--
-- Name: idx_rh_vinculo2_rh_pu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_vinculo2_rh_pu ON rh_vinculo USING btree (idpublicacaovacancia);


--
-- Name: idx_rh_vinculo3_rh_fu; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_vinculo3_rh_fu ON rh_vinculo USING btree (idfuncionario);


--
-- Name: idx_rh_vinculo5_rh_oc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_rh_vinculo5_rh_oc ON rh_vinculo USING btree (idgrupoocorrenciavacancia, idocorrenciavacancia);


--
-- Name: uk_cm_usuario_login; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX uk_cm_usuario_login ON cm_usuario USING btree (login);


--
-- Name: tg_trim_ad_fornecedor; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tg_trim_ad_fornecedor
    BEFORE INSERT ON ad_fornecedor
    FOR EACH ROW
    EXECUTE PROCEDURE fn_ad_fornecedor_ins();


--
-- Name: tg_trim_cm_agencia; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tg_trim_cm_agencia
    BEFORE INSERT ON cm_agencia
    FOR EACH ROW
    EXECUTE PROCEDURE fn_cm_agencia_ins();


--
-- Name: tg_trim_cm_instituicao; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tg_trim_cm_instituicao
    BEFORE INSERT ON cm_instituicao
    FOR EACH ROW
    EXECUTE PROCEDURE fn_cm_instituicao_ins();


--
-- Name: tg_trim_cm_uf; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tg_trim_cm_uf
    BEFORE INSERT ON cm_uf
    FOR EACH ROW
    EXECUTE PROCEDURE fn_cm_uf_ins();


--
-- Name: ad_empenhadodist_idempenhado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhadodist
    ADD CONSTRAINT ad_empenhadodist_idempenhado_fkey FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);


--
-- Name: ad_empenhadodist_idrequisicao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhadodist
    ADD CONSTRAINT ad_empenhadodist_idrequisicao_fkey FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: ad_empresamanutencaoveiculo_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empresamanutencaoveiculo
    ADD CONSTRAINT ad_empresamanutencaoveiculo_municipio_fkey FOREIGN KEY (idmunicipio) REFERENCES cm_municipio(idmunicipio);


--
-- Name: ad_fkeyabs; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_abastecimentorequisicao
    ADD CONSTRAINT ad_fkeyabs FOREIGN KEY (idabastecimento) REFERENCES ad_abastecimento(idabastecimento);


--
-- Name: ad_manutencao_veiculo_notafiscalmanutencaoveiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_manutencaoveiculo
    ADD CONSTRAINT ad_manutencao_veiculo_notafiscalmanutencaoveiculo_fkey FOREIGN KEY (idnotafiscal) REFERENCES ad_notafiscalmanutencaoveiculo(idnotafiscal);


--
-- Name: ad_manutencao_veiculo_tipomanutencao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_manutencaoveiculo
    ADD CONSTRAINT ad_manutencao_veiculo_tipomanutencao_fkey FOREIGN KEY (idtipomanutencao) REFERENCES ad_tipomanutencao(idtipomanutencao);


--
-- Name: ad_notafiscalmanutencaoveiculo_empresamanutencaoveiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_notafiscalmanutencaoveiculo
    ADD CONSTRAINT ad_notafiscalmanutencaoveiculo_empresamanutencaoveiculo_fkey FOREIGN KEY (idempresa) REFERENCES ad_empresamanutencaoveiculo(idempresa);


--
-- Name: ad_notafiscalmanutencaoveiculo_prevrevisao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_notafiscalmanutencaoveiculo
    ADD CONSTRAINT ad_notafiscalmanutencaoveiculo_prevrevisao_fkey FOREIGN KEY (idprevrevisao) REFERENCES ad_prevrevisao(idprevrevisao);


--
-- Name: ad_notafiscalmanutencaoveiculo_veiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_notafiscalmanutencaoveiculo
    ADD CONSTRAINT ad_notafiscalmanutencaoveiculo_veiculo_fkey FOREIGN KEY (placa) REFERENCES ad_veiculo(placa);


--
-- Name: ad_prevrevisao_veiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_prevrevisao
    ADD CONSTRAINT ad_prevrevisao_veiculo_fkey FOREIGN KEY (placa) REFERENCES ad_veiculo(placa);


--
-- Name: ad_reqrubrica_idrubrica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_reqrubrica
    ADD CONSTRAINT ad_reqrubrica_idrubrica_fkey FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- Name: ad_reqrubrica_idtiporeq_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_reqrubrica
    ADD CONSTRAINT ad_reqrubrica_idtiporeq_fkey FOREIGN KEY (idtiporeq) REFERENCES ad_tiporeq(idtiporeq) ON DELETE CASCADE;


--
-- Name: bt_artigo_idexemplarperiodico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_artigo
    ADD CONSTRAINT bt_artigo_idexemplarperiodico_fkey FOREIGN KEY (idexemplarperiodico) REFERENCES bt_exemplarperiodico(idexemplarperiodico);


--
-- Name: bt_camposfixosperiodico_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_camposfixosperiodico
    ADD CONSTRAINT bt_camposfixosperiodico_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);


--
-- Name: bt_exemplarperiodico_idcolecao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_idcolecao_fkey FOREIGN KEY (idcolecao) REFERENCES bt_colecao(idcolecao);


--
-- Name: bt_exemplarperiodico_idestado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_idestado_fkey FOREIGN KEY (idestado) REFERENCES bt_estado(idestado);


--
-- Name: bt_exemplarperiodico_idperiodico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_idperiodico_fkey FOREIGN KEY (idperiodico) REFERENCES bt_periodico(idperiodico);


--
-- Name: bt_exemplarperiodico_idregracirculacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_idregracirculacao_fkey FOREIGN KEY (idregracirculacao) REFERENCES bt_regracirculacao(idregracirculacao);


--
-- Name: bt_exemplarperiodico_idunidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_idunidade_fkey FOREIGN KEY (idunidade) REFERENCES bt_unidade(idunidade);


--
-- Name: bt_indicadoresperiodico_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_indicadoresperiodico
    ADD CONSTRAINT bt_indicadoresperiodico_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);


--
-- Name: bt_indicadoresperiodico_idperiodico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_indicadoresperiodico
    ADD CONSTRAINT bt_indicadoresperiodico_idperiodico_fkey FOREIGN KEY (idperiodico) REFERENCES bt_periodico(idperiodico);


--
-- Name: bt_material_assunto_artigo_idartigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_material_assunto_artigo
    ADD CONSTRAINT bt_material_assunto_artigo_idartigo_fkey FOREIGN KEY (idartigo) REFERENCES bt_artigo(idartigo);


--
-- Name: bt_material_assunto_artigo_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_material_assunto_artigo
    ADD CONSTRAINT bt_material_assunto_artigo_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);


--
-- Name: bt_material_autor_artigo_idartigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_material_autor_artigo
    ADD CONSTRAINT bt_material_autor_artigo_idartigo_fkey FOREIGN KEY (idartigo) REFERENCES bt_artigo(idartigo);


--
-- Name: bt_material_autor_artigo_idautor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_material_autor_artigo
    ADD CONSTRAINT bt_material_autor_artigo_idautor_fkey FOREIGN KEY (idautor) REFERENCES bt_autor(idautor);


--
-- Name: bt_material_autor_artigo_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_material_autor_artigo
    ADD CONSTRAINT bt_material_autor_artigo_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);


--
-- Name: bt_materialartigo_idartigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_materialartigo
    ADD CONSTRAINT bt_materialartigo_idartigo_fkey FOREIGN KEY (idartigo) REFERENCES bt_artigo(idartigo);


--
-- Name: bt_materialartigo_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_materialartigo
    ADD CONSTRAINT bt_materialartigo_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);


--
-- Name: bt_materialperiodico_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_materialperiodico
    ADD CONSTRAINT bt_materialperiodico_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);


--
-- Name: bt_materialperiodico_idperiodico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_materialperiodico
    ADD CONSTRAINT bt_materialperiodico_idperiodico_fkey FOREIGN KEY (idperiodico) REFERENCES bt_periodico(idperiodico);


--
-- Name: bt_obra_idautor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_obra
    ADD CONSTRAINT bt_obra_idautor_fkey FOREIGN KEY (idautor) REFERENCES bt_autor(idautor);


--
-- Name: bt_periodico_ideditora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_periodico
    ADD CONSTRAINT bt_periodico_ideditora_fkey FOREIGN KEY (ideditora) REFERENCES bt_editora(ideditora);


--
-- Name: fk_ad_acessobolsa1_ad_bo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_acessobolsa
    ADD CONSTRAINT fk_ad_acessobolsa1_ad_bo FOREIGN KEY (idbolsa) REFERENCES ad_bolsa(idbolsa);


--
-- Name: fk_ad_acessobolsa2_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_acessobolsa
    ADD CONSTRAINT fk_ad_acessobolsa2_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_ad_acessouoreq1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_acessouoreq
    ADD CONSTRAINT fk_ad_acessouoreq1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_acessouoreq2_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_acessouoreq
    ADD CONSTRAINT fk_ad_acessouoreq2_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_ad_andamento1_ad_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_andamento
    ADD CONSTRAINT fk_ad_andamento1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro) ON DELETE CASCADE;


--
-- Name: fk_ad_bolsista1_ad_bo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_bolsista
    ADD CONSTRAINT fk_ad_bolsista1_ad_bo FOREIGN KEY (idbolsa) REFERENCES ad_bolsa(idbolsa);


--
-- Name: fk_ad_bolsista2_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_bolsista
    ADD CONSTRAINT fk_ad_bolsista2_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_ad_bt_emprestimo_cm_usu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_emprestimo
    ADD CONSTRAINT fk_ad_bt_emprestimo_cm_usu FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_ad_bt_logoperacao_cm_usu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_logoperacao
    ADD CONSTRAINT fk_ad_bt_logoperacao_cm_usu FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_ad_bt_multa_bt_emprestimo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_multa
    ADD CONSTRAINT fk_ad_bt_multa_bt_emprestimo FOREIGN KEY (idemprestimo) REFERENCES bt_emprestimo(idemprestimo);


--
-- Name: fk_ad_contrato_ta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_contrato
    ADD CONSTRAINT fk_ad_contrato_ta FOREIGN KEY (idcontratopai) REFERENCES ad_contrato(idcontrato);


--
-- Name: fk_ad_dependencia1_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_dependencia
    ADD CONSTRAINT fk_ad_dependencia1_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- Name: fk_ad_empenhado1_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT fk_ad_empenhado1_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- Name: fk_ad_empenhado2_ad_or; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT fk_ad_empenhado2_ad_or FOREIGN KEY (idorcamento) REFERENCES ad_orcamento(idorcamento);


--
-- Name: fk_ad_empenhado3_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhado
    ADD CONSTRAINT fk_ad_empenhado3_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- Name: fk_ad_empenhadodist_empenhadoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhadodist
    ADD CONSTRAINT fk_ad_empenhadodist_empenhadoid FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);


--
-- Name: fk_ad_empenhadodist_requisicaoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenhadodist
    ADD CONSTRAINT fk_ad_empenhadodist_requisicaoid FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_empenho1_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho1_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);


--
-- Name: fk_ad_empenho1_ad_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);


--
-- Name: fk_ad_empenho1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_empenho2_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_empenho
    ADD CONSTRAINT fk_ad_empenho2_ad_em FOREIGN KEY (idempenhoref) REFERENCES ad_empenho(idempenho);


--
-- Name: fk_ad_estoque2_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_estoque
    ADD CONSTRAINT fk_ad_estoque2_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- Name: fk_ad_executa1_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT fk_ad_executa1_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- Name: fk_ad_executa1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT fk_ad_executa1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_executa2_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executa
    ADD CONSTRAINT fk_ad_executa2_ad_ti FOREIGN KEY (idtiporeq) REFERENCES ad_tiporeq(idtiporeq);


--
-- Name: fk_ad_executoralmox1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executoralmox
    ADD CONSTRAINT fk_ad_executoralmox1_ad_uo FOREIGN KEY (iduorequisitante) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_executoralmox2_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executoralmox
    ADD CONSTRAINT fk_ad_executoralmox2_ad_uo FOREIGN KEY (iduoexecutante) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_executorservint1_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executorservint
    ADD CONSTRAINT fk_ad_executorservint1_ad_ti FOREIGN KEY (idtiposervint) REFERENCES ad_tiposervint(idtiposervint);


--
-- Name: fk_ad_executorservint1_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_executorservint
    ADD CONSTRAINT fk_ad_executorservint1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_ad_fornecedor1_cm_in; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT fk_ad_fornecedor1_cm_in FOREIGN KEY (idinstituicao) REFERENCES cm_instituicao(idinstituicao);


--
-- Name: fk_ad_fornecedor2_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT fk_ad_fornecedor2_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_ad_fornecedor3_cm_ag; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_fornecedor
    ADD CONSTRAINT fk_ad_fornecedor3_cm_ag FOREIGN KEY (idbanco, idagenc) REFERENCES cm_agencia(idbanco, idagenc);


--
-- Name: fk_ad_fpotencial1_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_fpotencial
    ADD CONSTRAINT fk_ad_fpotencial1_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);


--
-- Name: fk_ad_fpotencial2_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_fpotencial
    ADD CONSTRAINT fk_ad_fpotencial2_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- Name: fk_ad_funcionarioresp0_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_funcionarioresp
    ADD CONSTRAINT fk_ad_funcionarioresp0_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- Name: fk_ad_itemlicitacao1_ad_li; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemlicitacao
    ADD CONSTRAINT fk_ad_itemlicitacao1_ad_li FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);


--
-- Name: fk_ad_itemnota1_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemnota
    ADD CONSTRAINT fk_ad_itemnota1_ad_em FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);


--
-- Name: fk_ad_itemnota2_ad_no; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemnota
    ADD CONSTRAINT fk_ad_itemnota2_ad_no FOREIGN KEY (idnotafiscal) REFERENCES ad_notafiscal(idnotafiscal);


--
-- Name: fk_ad_itempatrimo1_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimo
    ADD CONSTRAINT fk_ad_itempatrimo1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- Name: fk_ad_itempatrimo2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_funcionarioresp
    ADD CONSTRAINT fk_ad_itempatrimo2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- Name: fk_ad_itempatrimonio1_ad_de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio1_ad_de FOREIGN KEY (iddependencia) REFERENCES ad_dependencia(iddependencia);


--
-- Name: fk_ad_itempatrimonio1_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- Name: fk_ad_itempatrimonio1_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio1_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- Name: fk_ad_itempatrimonio3_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio3_ad_em FOREIGN KEY (idempenhado) REFERENCES ad_empenhado(idempenhado);


--
-- Name: fk_ad_itempatrimonio4_ad_cl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio4_ad_cl FOREIGN KEY (idclassificador) REFERENCES ad_classificador(idclassificador);


--
-- Name: fk_ad_itempatrimonio5_proce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itempatrimonio
    ADD CONSTRAINT fk_ad_itempatrimonio5_proce FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);


--
-- Name: fk_ad_itemreq1_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT fk_ad_itemreq1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- Name: fk_ad_itemreq2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT fk_ad_itemreq2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_itemreq4_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreq
    ADD CONSTRAINT fk_ad_itemreq4_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- Name: fk_ad_itemreqbib1_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqbib
    ADD CONSTRAINT fk_ad_itemreqbib1_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- Name: fk_ad_itemreqbib2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqbib
    ADD CONSTRAINT fk_ad_itemreqbib2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_itemreqbib4_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqbib
    ADD CONSTRAINT fk_ad_itemreqbib4_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- Name: fk_ad_itemreqdiaria2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT fk_ad_itemreqdiaria2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_itemreqdiaria5_ad_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqdiaria
    ADD CONSTRAINT fk_ad_itemreqdiaria5_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);


--
-- Name: fk_ad_itemreqhotel1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_ad_itemreqhotel2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_itemreqhotel3_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel3_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- Name: fk_ad_itemreqhotel4_ad_ho; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqhotel
    ADD CONSTRAINT fk_ad_itemreqhotel4_ad_ho FOREIGN KEY (idhotelpref) REFERENCES ad_hotel(idhotel);


--
-- Name: fk_ad_itemreqpassagem1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_ad_itemreqpassagem2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_itemreqpassagem3_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem3_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- Name: fk_ad_itemreqpassagem4_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem4_cm_mu FOREIGN KEY (idmunicipioorigem) REFERENCES cm_municipio(idmunicipio);


--
-- Name: fk_ad_itemreqpassagem5_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqpassagem
    ADD CONSTRAINT fk_ad_itemreqpassagem5_cm_mu FOREIGN KEY (idmunicipiodestino) REFERENCES cm_municipio(idmunicipio);


--
-- Name: fk_ad_itemreqrestaurante1_cm_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante1_cm_p FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_ad_itemreqrestaurante2_ad_r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante2_ad_r FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_itemreqrestaurante3_ad_e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante3_ad_e FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- Name: fk_ad_itemreqrestaurante4_cm_p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante4_cm_p FOREIGN KEY (idpessoaacompanhante) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_ad_itemreqrestaurante5_ad_r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqrestaurante
    ADD CONSTRAINT fk_ad_itemreqrestaurante5_ad_r FOREIGN KEY (idrestaurantepref) REFERENCES ad_restaurante(idrestaurante);


--
-- Name: fk_ad_itemreqservext1_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT fk_ad_itemreqservext1_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_itemreqservext1_ad_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT fk_ad_itemreqservext1_ad_se FOREIGN KEY (idservico) REFERENCES ad_servico(idservico);


--
-- Name: fk_ad_itemreqservext3_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservext
    ADD CONSTRAINT fk_ad_itemreqservext3_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- Name: fk_ad_itemreqservint1_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservint
    ADD CONSTRAINT fk_ad_itemreqservint1_ad_ti FOREIGN KEY (idtiposervint) REFERENCES ad_tiposervint(idtiposervint);


--
-- Name: fk_ad_itemreqservint2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservint
    ADD CONSTRAINT fk_ad_itemreqservint2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_itemreqservpf1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT fk_ad_itemreqservpf1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_ad_itemreqservpf2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT fk_ad_itemreqservpf2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_itemreqservpf3_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqservpf
    ADD CONSTRAINT fk_ad_itemreqservpf3_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- Name: fk_ad_itemreqveiculo1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_ad_itemreqveiculo2_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo2_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_itemreqveiculo3_ad_ve; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo3_ad_ve FOREIGN KEY (placa) REFERENCES ad_veiculo(placa);


--
-- Name: fk_ad_itemreqveiculo4_ad_mo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo4_ad_mo FOREIGN KEY (idmotorista) REFERENCES ad_motorista(idmotorista);


--
-- Name: fk_ad_itemreqveiculo5_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo5_cm_mu FOREIGN KEY (idmunicipiodestino) REFERENCES cm_municipio(idmunicipio);


--
-- Name: fk_ad_itemreqveiculo6_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo6_cm_mu FOREIGN KEY (idmunicipioorigem) REFERENCES cm_municipio(idmunicipio);


--
-- Name: fk_ad_itemreqveiculo7_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqveiculo
    ADD CONSTRAINT fk_ad_itemreqveiculo7_ad_ti FOREIGN KEY (tipoveiculo) REFERENCES ad_tipoveiculo(tipoveiculo);


--
-- Name: fk_ad_lancamentoint1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint1_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_lancamentoint1_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_ad_lancamentoint2_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint2_ad_uo FOREIGN KEY (iduoexec) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_lancamentoint3_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint3_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- Name: fk_ad_lancamentoint4_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint4_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- Name: fk_ad_lancamentoint4_ad_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_lancamentoint
    ADD CONSTRAINT fk_ad_lancamentoint4_ad_re FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_ad_licitacao1_ad_mo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_licitacao
    ADD CONSTRAINT fk_ad_licitacao1_ad_mo FOREIGN KEY (idmodalidadelicitacao) REFERENCES ad_modalidadelicitacao(idmodalidadelicitacao);


--
-- Name: fk_ad_licitacao1_ad_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_licitacao
    ADD CONSTRAINT fk_ad_licitacao1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro);


--
-- Name: fk_ad_localidadediaria1_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_localidadediaria
    ADD CONSTRAINT fk_ad_localidadediaria1_cm_mu FOREIGN KEY (idmunicipio) REFERENCES cm_municipio(idmunicipio);


--
-- Name: fk_ad_localidadediaria2_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_localidadediaria
    ADD CONSTRAINT fk_ad_localidadediaria2_ad_it FOREIGN KEY (idrequisicao, idvinculo) REFERENCES ad_itemreqdiaria(idrequisicao, idvinculo);


--
-- Name: fk_ad_mapalicitacao1_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_mapalicitacao
    ADD CONSTRAINT fk_ad_mapalicitacao1_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);


--
-- Name: fk_ad_mapalicitacao2_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_mapalicitacao
    ADD CONSTRAINT fk_ad_mapalicitacao2_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- Name: fk_ad_material2_ad_su; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_material
    ADD CONSTRAINT fk_ad_material2_ad_su FOREIGN KEY (idelemento, idsubelemento) REFERENCES ad_subelemento(idelemento, idsubelemento);


--
-- Name: fk_ad_motorista1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_motorista
    ADD CONSTRAINT fk_ad_motorista1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_ad_movimento1_ad_mo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento1_ad_mo FOREIGN KEY (iditemnota) REFERENCES ad_itemnota(iditemnota);


--
-- Name: fk_ad_movimento1_ad_or; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento1_ad_or FOREIGN KEY (idordement) REFERENCES ad_ordentrega(idordement);


--
-- Name: fk_ad_movimento2_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento2_ad_it FOREIGN KEY (idrequisicao, idmaterial) REFERENCES ad_itemreq(idrequisicao, idmaterial);


--
-- Name: fk_ad_movimento2_ad_mo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimento
    ADD CONSTRAINT fk_ad_movimento2_ad_mo FOREIGN KEY (idmovimentoref) REFERENCES ad_movimento(idmovimento);


--
-- Name: fk_ad_movimentopat1_ad_de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat1_ad_de FOREIGN KEY (iddependenciaorigem) REFERENCES ad_dependencia(iddependencia);


--
-- Name: fk_ad_movimentopat2_ad_de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat2_ad_de FOREIGN KEY (iddependenciadestino) REFERENCES ad_dependencia(iddependencia);


--
-- Name: fk_ad_movimentopat2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat2_cm_se FOREIGN KEY (idsetororigem) REFERENCES cm_setor(idsetor);


--
-- Name: fk_ad_movimentopat3_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentopat
    ADD CONSTRAINT fk_ad_movimentopat3_cm_se FOREIGN KEY (idsetordestino) REFERENCES cm_setor(idsetor);


--
-- Name: fk_ad_movimentoserv_itemnota; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_movimentoserv
    ADD CONSTRAINT fk_ad_movimentoserv_itemnota FOREIGN KEY (iditemnota) REFERENCES ad_itemnota(iditemnota);


--
-- Name: fk_ad_notafiscal1_ad_li; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_notafiscal
    ADD CONSTRAINT fk_ad_notafiscal1_ad_li FOREIGN KEY (idliquidacao) REFERENCES ad_liquidacao(idliquidacao);


--
-- Name: fk_ad_notafiscal2_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_notafiscal
    ADD CONSTRAINT fk_ad_notafiscal2_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- Name: fk_ad_novomaterial2_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_novomaterial
    ADD CONSTRAINT fk_ad_novomaterial2_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_novomaterial3_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_novomaterial
    ADD CONSTRAINT fk_ad_novomaterial3_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_ad_orcamento1_ad_pt; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT fk_ad_orcamento1_ad_pt FOREIGN KEY (idptr) REFERENCES ad_ptr(idptr);


--
-- Name: fk_ad_orcamento2_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT fk_ad_orcamento2_ad_fo FOREIGN KEY (idfonte) REFERENCES ad_fonte(idfonte);


--
-- Name: fk_ad_orcamento3_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamento
    ADD CONSTRAINT fk_ad_orcamento3_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- Name: fk_ad_orcamentohist1_ad_or; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamentohist
    ADD CONSTRAINT fk_ad_orcamentohist1_ad_or FOREIGN KEY (idorcamento) REFERENCES ad_orcamento(idorcamento);


--
-- Name: fk_ad_orcamentointerno0_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamentointerno
    ADD CONSTRAINT fk_ad_orcamentointerno0_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- Name: fk_ad_orcamentointerno1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_orcamentointerno
    ADD CONSTRAINT fk_ad_orcamentointerno1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_ordembancaria1_ad_li; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_ordembancaria
    ADD CONSTRAINT fk_ad_ordembancaria1_ad_li FOREIGN KEY (idliquidacao) REFERENCES ad_liquidacao(idliquidacao);


--
-- Name: fk_ad_pagbolsa1_ad_bo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_pagbolsa
    ADD CONSTRAINT fk_ad_pagbolsa1_ad_bo FOREIGN KEY (idbolsista) REFERENCES ad_bolsista(idbolsista);


--
-- Name: fk_ad_paiempenho0_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_paiempenho
    ADD CONSTRAINT fk_ad_paiempenho0_ad_em FOREIGN KEY (idempenhopai) REFERENCES ad_empenho(idempenho);


--
-- Name: fk_ad_paiempenho1_ad_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_paiempenho
    ADD CONSTRAINT fk_ad_paiempenho1_ad_em FOREIGN KEY (idempenho) REFERENCES ad_empenho(idempenho);


--
-- Name: fk_ad_participante_fornecedorid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_participante
    ADD CONSTRAINT fk_ad_participante_fornecedorid FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);


--
-- Name: fk_ad_participante_licitacaoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_participante
    ADD CONSTRAINT fk_ad_participante_licitacaoid FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);


--
-- Name: fk_ad_requisicao2_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao2_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_requisicao3_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao3_ad_uo FOREIGN KEY (iduoexec) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_requisicao4_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao4_cm_us FOREIGN KEY (idusuarioreq) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_ad_requisicao5_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisicao
    ADD CONSTRAINT fk_ad_requisicao5_cm_us FOREIGN KEY (idusuariogestor) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_ad_requisita1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT fk_ad_requisita1_ad_uo FOREIGN KEY (iduo) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_requisita2_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT fk_ad_requisita2_ad_ti FOREIGN KEY (idtiporeq) REFERENCES ad_tiporeq(idtiporeq);


--
-- Name: fk_ad_requisita3_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_requisita
    ADD CONSTRAINT fk_ad_requisita3_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- Name: fk_ad_retencao1_ad_pr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_retencao
    ADD CONSTRAINT fk_ad_retencao1_ad_pr FOREIGN KEY (numpro) REFERENCES ad_processo(numpro) ON DELETE CASCADE;


--
-- Name: fk_ad_saldolic2_ad_ma; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic2_ad_ma FOREIGN KEY (idmaterial) REFERENCES ad_material(idmaterial);


--
-- Name: fk_ad_saldolic3_ad_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic3_ad_fo FOREIGN KEY (idfornecedor) REFERENCES ad_fornecedor(idfornecedor);


--
-- Name: fk_ad_saldolic3_adse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic3_adse FOREIGN KEY (idservico) REFERENCES ad_servico(idservico);


--
-- Name: fk_ad_saldolic4_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_saldolic
    ADD CONSTRAINT fk_ad_saldolic4_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo);


--
-- Name: fk_ad_servico1_ad_su; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_servico
    ADD CONSTRAINT fk_ad_servico1_ad_su FOREIGN KEY (idelemento, idsubelemento) REFERENCES ad_subelemento(idelemento, idsubelemento);


--
-- Name: fk_ad_solicitacao1_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_solicitacao
    ADD CONSTRAINT fk_ad_solicitacao1_ad_it FOREIGN KEY (idlicitacao, item) REFERENCES ad_itemlicitacao(idlicitacao, item);


--
-- Name: fk_ad_subelemento1_ad_el; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_subelemento
    ADD CONSTRAINT fk_ad_subelemento1_ad_el FOREIGN KEY (idelemento) REFERENCES ad_elemento(idelemento);


--
-- Name: fk_ad_tiporeq1_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_tiporeq
    ADD CONSTRAINT fk_ad_tiporeq1_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- Name: fk_ad_tiposervint1_ad_ru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_tiposervint
    ADD CONSTRAINT fk_ad_tiposervint1_ad_ru FOREIGN KEY (idrubrica) REFERENCES ad_rubrica(idrubrica);


--
-- Name: fk_ad_trecho1_ad_it; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_trecho
    ADD CONSTRAINT fk_ad_trecho1_ad_it FOREIGN KEY (idrequisicao, idpessoa) REFERENCES ad_itemreqpassagem(idrequisicao, idpessoa);


--
-- Name: fk_ad_uo2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_uo
    ADD CONSTRAINT fk_ad_uo2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- Name: fk_ad_uoalmox1_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_uoalmox
    ADD CONSTRAINT fk_ad_uoalmox1_ad_uo FOREIGN KEY (iduoalmox) REFERENCES ad_uo(iduo) ON DELETE CASCADE;


--
-- Name: fk_ad_uoalmox2_ad_uo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_uoalmox
    ADD CONSTRAINT fk_ad_uoalmox2_ad_uo FOREIGN KEY (iduoreq) REFERENCES ad_uo(iduo) ON DELETE CASCADE;


--
-- Name: fk_ad_veiculo1_ad_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_veiculo
    ADD CONSTRAINT fk_ad_veiculo1_ad_ti FOREIGN KEY (tipoveiculo) REFERENCES ad_tipoveiculo(tipoveiculo);


--
-- Name: fk_bt_assunto_etiqueta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_assunto
    ADD CONSTRAINT fk_bt_assunto_etiqueta FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);


--
-- Name: fk_bt_camposfixos1_bt_ob; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_camposfixos
    ADD CONSTRAINT fk_bt_camposfixos1_bt_ob FOREIGN KEY (idobra) REFERENCES bt_obra(idobra) ON DELETE CASCADE;


--
-- Name: fk_bt_camposfixos2_bt_et; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_camposfixos
    ADD CONSTRAINT fk_bt_camposfixos2_bt_et FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta) ON DELETE CASCADE;


--
-- Name: fk_bt_camposubficha1_bt_su; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_camposubficha
    ADD CONSTRAINT fk_bt_camposubficha1_bt_su FOREIGN KEY (idetiqueta, subcampo) REFERENCES bt_subcampo(idetiqueta, subcampo) ON DELETE CASCADE;


--
-- Name: fk_bt_camposubficha2_bt_su; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_camposubficha
    ADD CONSTRAINT fk_bt_camposubficha2_bt_su FOREIGN KEY (idficha, idsubficha) REFERENCES bt_subficha(idficha, idsubficha) ON DELETE CASCADE;


--
-- Name: fk_bt_consultacampo1_bt_su; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_consultacampo
    ADD CONSTRAINT fk_bt_consultacampo1_bt_su FOREIGN KEY (idetiqueta, subcampo) REFERENCES bt_subcampo(idetiqueta, subcampo) ON DELETE CASCADE;


--
-- Name: fk_bt_consultacampo2_bt_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_consultacampo
    ADD CONSTRAINT fk_bt_consultacampo2_bt_co FOREIGN KEY (idconsulta) REFERENCES bt_consulta(idconsulta) ON DELETE CASCADE;


--
-- Name: fk_bt_direito1_bt_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_direito
    ADD CONSTRAINT fk_bt_direito1_bt_gr FOREIGN KEY (idgrupo) REFERENCES bt_grupo(idgrupo) ON DELETE CASCADE;


--
-- Name: fk_bt_direito2_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_direito
    ADD CONSTRAINT fk_bt_direito2_bt_op FOREIGN KEY (idoperacao) REFERENCES bt_operacao(idoperacao) ON DELETE CASCADE;


--
-- Name: fk_bt_direito3_bt_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_direito
    ADD CONSTRAINT fk_bt_direito3_bt_re FOREIGN KEY (idregracirculacao) REFERENCES bt_regracirculacao(idregracirculacao) ON DELETE CASCADE;


--
-- Name: fk_bt_emprestimo2_bt_ex; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_emprestimo
    ADD CONSTRAINT fk_bt_emprestimo2_bt_ex FOREIGN KEY (idexemplar) REFERENCES bt_exemplar(idexemplar);


--
-- Name: fk_bt_exemplar1_bt_es; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT fk_bt_exemplar1_bt_es FOREIGN KEY (idestado) REFERENCES bt_estado(idestado);


--
-- Name: fk_bt_exemplar2_bt_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT fk_bt_exemplar2_bt_re FOREIGN KEY (idregracirculacao) REFERENCES bt_regracirculacao(idregracirculacao);


--
-- Name: fk_bt_exemplar3_bt_un; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT fk_bt_exemplar3_bt_un FOREIGN KEY (idunidade) REFERENCES bt_unidade(idunidade);


--
-- Name: fk_bt_exemplar4_bt_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT fk_bt_exemplar4_bt_co FOREIGN KEY (idcolecao) REFERENCES bt_colecao(idcolecao);


--
-- Name: fk_bt_exemplar5_bt_ob; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT fk_bt_exemplar5_bt_ob FOREIGN KEY (idobra) REFERENCES bt_obra(idobra);


--
-- Name: fk_bt_genero1_bt_fi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_genero
    ADD CONSTRAINT fk_bt_genero1_bt_fi FOREIGN KEY (idficha) REFERENCES bt_ficha(idficha);


--
-- Name: fk_bt_indicadores1_bt_ob; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_indicadores
    ADD CONSTRAINT fk_bt_indicadores1_bt_ob FOREIGN KEY (idobra) REFERENCES bt_obra(idobra) ON DELETE CASCADE;


--
-- Name: fk_bt_indicadores2_bt_et; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_indicadores
    ADD CONSTRAINT fk_bt_indicadores2_bt_et FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta) ON DELETE CASCADE;


--
-- Name: fk_bt_logoperacao2_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_logoperacao
    ADD CONSTRAINT fk_bt_logoperacao2_bt_op FOREIGN KEY (idoperacao) REFERENCES bt_operacao(idoperacao);


--
-- Name: fk_bt_logoperacaodetalhe1_bt_l; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_logoperacaodetalhe
    ADD CONSTRAINT fk_bt_logoperacaodetalhe1_bt_l FOREIGN KEY (idlogoperacao) REFERENCES bt_logoperacao(idlogoperacao) ON DELETE CASCADE;


--
-- Name: fk_bt_material1_bt_su; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_material
    ADD CONSTRAINT fk_bt_material1_bt_su FOREIGN KEY (idetiqueta, subcampo) REFERENCES bt_subcampo(idetiqueta, subcampo) ON DELETE CASCADE;


--
-- Name: fk_bt_material2_bt_ob; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_material
    ADD CONSTRAINT fk_bt_material2_bt_ob FOREIGN KEY (idobra) REFERENCES bt_obra(idobra);


--
-- Name: fk_bt_multa1_bt_em; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_multa
    ADD CONSTRAINT fk_bt_multa1_bt_em FOREIGN KEY (idemprestimo) REFERENCES bt_emprestimo(idemprestimo);


--
-- Name: fk_bt_notainfracao2_bt_in; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_notainfracao
    ADD CONSTRAINT fk_bt_notainfracao2_bt_in FOREIGN KEY (idinfracao) REFERENCES bt_infracao(idinfracao) ON DELETE CASCADE;


--
-- Name: fk_bt_obra1_bt_ge; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_obra
    ADD CONSTRAINT fk_bt_obra1_bt_ge FOREIGN KEY (idgenero) REFERENCES bt_genero(idgenero);


--
-- Name: fk_bt_obra2_bt_ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_obra
    ADD CONSTRAINT fk_bt_obra2_bt_ed FOREIGN KEY (ideditora) REFERENCES bt_editora(ideditora);


--
-- Name: fk_bt_opcaolista1_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_opcaolista
    ADD CONSTRAINT fk_bt_opcaolista1_bt_op FOREIGN KEY (idopcao) REFERENCES bt_opcao(idopcao) ON DELETE CASCADE;


--
-- Name: fk_bt_politica2_bt_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_politica
    ADD CONSTRAINT fk_bt_politica2_bt_re FOREIGN KEY (idregracirculacao) REFERENCES bt_regracirculacao(idregracirculacao) ON DELETE CASCADE;


--
-- Name: fk_bt_politica3_bt_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_politica
    ADD CONSTRAINT fk_bt_politica3_bt_gr FOREIGN KEY (idgrupo) REFERENCES bt_grupo(idgrupo) ON DELETE CASCADE;


--
-- Name: fk_bt_posicao1_bt_et; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_posicao
    ADD CONSTRAINT fk_bt_posicao1_bt_et FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta) ON DELETE CASCADE;


--
-- Name: fk_bt_posicao2_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_posicao
    ADD CONSTRAINT fk_bt_posicao2_bt_op FOREIGN KEY (idopcao) REFERENCES bt_opcao(idopcao);


--
-- Name: fk_bt_posicaosubficha1_bt_su; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_posicaosubficha
    ADD CONSTRAINT fk_bt_posicaosubficha1_bt_su FOREIGN KEY (idficha, idsubficha) REFERENCES bt_subficha(idficha, idsubficha) ON DELETE CASCADE;


--
-- Name: fk_bt_posicaosubficha2_bt_po; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_posicaosubficha
    ADD CONSTRAINT fk_bt_posicaosubficha2_bt_po FOREIGN KEY (idetiqueta, posicao) REFERENCES bt_posicao(idetiqueta, posicao) ON DELETE CASCADE;


--
-- Name: fk_bt_reserva1_bt_si; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_reserva
    ADD CONSTRAINT fk_bt_reserva1_bt_si FOREIGN KEY (idsituacao) REFERENCES bt_situacao(idsituacao);


--
-- Name: fk_bt_reserva3_bt_ex; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_reserva
    ADD CONSTRAINT fk_bt_reserva3_bt_ex FOREIGN KEY (idexemplar) REFERENCES bt_exemplar(idexemplar);


--
-- Name: fk_bt_subcampo1_bt_et; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_subcampo
    ADD CONSTRAINT fk_bt_subcampo1_bt_et FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta) ON DELETE CASCADE;


--
-- Name: fk_bt_subcampo2_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_subcampo
    ADD CONSTRAINT fk_bt_subcampo2_bt_op FOREIGN KEY (idopcao) REFERENCES bt_opcao(idopcao);


--
-- Name: fk_bt_subficha1_bt_fi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_subficha
    ADD CONSTRAINT fk_bt_subficha1_bt_fi FOREIGN KEY (idficha) REFERENCES bt_ficha(idficha) ON DELETE CASCADE;


--
-- Name: fk_bt_transicao1_bt_es; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_transicao
    ADD CONSTRAINT fk_bt_transicao1_bt_es FOREIGN KEY (idestadopresente) REFERENCES bt_estado(idestado);


--
-- Name: fk_bt_transicao2_bt_es; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_transicao
    ADD CONSTRAINT fk_bt_transicao2_bt_es FOREIGN KEY (idestadofuturo) REFERENCES bt_estado(idestado);


--
-- Name: fk_bt_transicao3_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_transicao
    ADD CONSTRAINT fk_bt_transicao3_bt_op FOREIGN KEY (idoperacao) REFERENCES bt_operacao(idoperacao);


--
-- Name: fk_bt_vinculo2_bt_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bt_vinculo
    ADD CONSTRAINT fk_bt_vinculo2_bt_gr FOREIGN KEY (idgrupo) REFERENCES bt_grupo(idgrupo);


--
-- Name: fk_cm_acesso1_cm_tr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_acesso
    ADD CONSTRAINT fk_cm_acesso1_cm_tr FOREIGN KEY (idtrans) REFERENCES cm_transacao(idtrans);


--
-- Name: fk_cm_acesso2_cm_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_acesso
    ADD CONSTRAINT fk_cm_acesso2_cm_gr FOREIGN KEY (idgrupo) REFERENCES cm_grupoacesso(idgrupo);


--
-- Name: fk_cm_agencia1_cm_ba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_agencia
    ADD CONSTRAINT fk_cm_agencia1_cm_ba FOREIGN KEY (idbanco) REFERENCES cm_banco(idbanco) ON DELETE CASCADE;


--
-- Name: fk_cm_grpusuario1_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_grpusuario
    ADD CONSTRAINT fk_cm_grpusuario1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_cm_grpusuario2_cm_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_grpusuario
    ADD CONSTRAINT fk_cm_grpusuario2_cm_gr FOREIGN KEY (idgrupo) REFERENCES cm_grupoacesso(idgrupo);


--
-- Name: fk_cm_indicemensal1_cm_in; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_indicemensal
    ADD CONSTRAINT fk_cm_indicemensal1_cm_in FOREIGN KEY (sigla) REFERENCES cm_indice(sigla);


--
-- Name: fk_cm_instituicao1_cm_pa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_instituicao
    ADD CONSTRAINT fk_cm_instituicao1_cm_pa FOREIGN KEY (idpais) REFERENCES cm_pais(idpais);


--
-- Name: fk_cm_instituicao2_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_instituicao
    ADD CONSTRAINT fk_cm_instituicao2_cm_mu FOREIGN KEY (idmunicipio) REFERENCES cm_municipio(idmunicipio);


--
-- Name: fk_cm_log1_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_log
    ADD CONSTRAINT fk_cm_log1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_cm_logant1_cm_us; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_logant
    ADD CONSTRAINT fk_cm_logant1_cm_us FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_cm_municipio1_cm_uf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_municipio
    ADD CONSTRAINT fk_cm_municipio1_cm_uf FOREIGN KEY (iduf) REFERENCES cm_uf(iduf);


--
-- Name: fk_cm_municipio2_cm_pa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_municipio
    ADD CONSTRAINT fk_cm_municipio2_cm_pa FOREIGN KEY (idpais) REFERENCES cm_pais(idpais);


--
-- Name: fk_cm_noticia1_cm_si; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_noticia
    ADD CONSTRAINT fk_cm_noticia1_cm_si FOREIGN KEY (idsistema) REFERENCES cm_sistema(idsistema) ON DELETE CASCADE;


--
-- Name: fk_cm_organograma1_cm_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_organograma
    ADD CONSTRAINT fk_cm_organograma1_cm_ti FOREIGN KEY (idtipoorganograma) REFERENCES cm_tipoorganograma(idtipoorganograma) ON DELETE CASCADE;


--
-- Name: fk_cm_organograma2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_organograma
    ADD CONSTRAINT fk_cm_organograma2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor) ON DELETE CASCADE;


--
-- Name: fk_cm_organograma3_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_organograma
    ADD CONSTRAINT fk_cm_organograma3_cm_se FOREIGN KEY (idsetorpai) REFERENCES cm_setor(idsetor) ON DELETE CASCADE;


--
-- Name: fk_cm_pessoa2_cm_pa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa2_cm_pa FOREIGN KEY (idpais) REFERENCES cm_pais(idpais);


--
-- Name: fk_cm_pessoa3_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa3_cm_mu FOREIGN KEY (idmunicipio) REFERENCES cm_municipio(idmunicipio);


--
-- Name: fk_cm_pessoa4_cm_mu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa4_cm_mu FOREIGN KEY (idmunicipionascimento) REFERENCES cm_municipio(idmunicipio);


--
-- Name: fk_cm_pessoa5_cm_pa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa5_cm_pa FOREIGN KEY (idpaisnascimento) REFERENCES cm_pais(idpais);


--
-- Name: fk_cm_pessoa6_cm_es; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa6_cm_es FOREIGN KEY (idestadocivil) REFERENCES cm_estadocivil(idestadocivil);


--
-- Name: fk_cm_pessoa6_cm_pa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa6_cm_pa FOREIGN KEY (idpaisnacionalidade) REFERENCES cm_pais(idpais);


--
-- Name: fk_cm_pessoa7_cm_ag; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_pessoa
    ADD CONSTRAINT fk_cm_pessoa7_cm_ag FOREIGN KEY (idbanco, idagenc) REFERENCES cm_agencia(idbanco, idagenc);


--
-- Name: fk_cm_setor_cm_instituicao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_setor
    ADD CONSTRAINT fk_cm_setor_cm_instituicao FOREIGN KEY (idinstituicao) REFERENCES cm_instituicao(idinstituicao);


--
-- Name: fk_cm_setoracesso01; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_setoracesso
    ADD CONSTRAINT fk_cm_setoracesso01 FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- Name: fk_cm_setoracesso02; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_setoracesso
    ADD CONSTRAINT fk_cm_setoracesso02 FOREIGN KEY (idsetoracesso) REFERENCES cm_setor(idsetor);


--
-- Name: fk_cm_setorequivalente1_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_setorequivalente
    ADD CONSTRAINT fk_cm_setorequivalente1_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor) ON DELETE CASCADE;


--
-- Name: fk_cm_setorequivalente2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_setorequivalente
    ADD CONSTRAINT fk_cm_setorequivalente2_cm_se FOREIGN KEY (idsetorequivalente) REFERENCES cm_setor(idsetor) ON DELETE CASCADE;


--
-- Name: fk_cm_transacao1_cm_si; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_transacao
    ADD CONSTRAINT fk_cm_transacao1_cm_si FOREIGN KEY (idsistema) REFERENCES cm_sistema(idsistema);


--
-- Name: fk_cm_usuario1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_usuario
    ADD CONSTRAINT fk_cm_usuario1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_cm_usuario2_cm_se; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cm_usuario
    ADD CONSTRAINT fk_cm_usuario2_cm_se FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- Name: fk_ga_aluno3_ga_si; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ga_aluno
    ADD CONSTRAINT fk_ga_aluno3_ga_si FOREIGN KEY (idsituacao) REFERENCES ga_situacao(idsituacao);


--
-- Name: fk_ga_aluno4_cm_in; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ga_aluno
    ADD CONSTRAINT fk_ga_aluno4_cm_in FOREIGN KEY (idinstituicao) REFERENCES cm_instituicao(idinstituicao);


--
-- Name: fk_ga_aluno5_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ga_aluno
    ADD CONSTRAINT fk_ga_aluno5_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_iddsetor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_iddsetor FOREIGN KEY (idsetor) REFERENCES cm_setor(idsetor);


--
-- Name: fk_itemreqxerox_requisicaoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_itemreqxerox
    ADD CONSTRAINT fk_itemreqxerox_requisicaoid FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: fk_rh_acessoproades_cm_usuario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_acessoproades
    ADD CONSTRAINT fk_rh_acessoproades_cm_usuario FOREIGN KEY (idusuario) REFERENCES cm_usuario(idusuario);


--
-- Name: fk_rh_acessoproades_rh_proades; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_acessoproades
    ADD CONSTRAINT fk_rh_acessoproades_rh_proades FOREIGN KEY (idproades) REFERENCES rh_proades(idproades);


--
-- Name: fk_rh_adicional1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_adicional
    ADD CONSTRAINT fk_rh_adicional1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- Name: fk_rh_assunto_rh_reuniao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_assunto
    ADD CONSTRAINT fk_rh_assunto_rh_reuniao FOREIGN KEY (idreuniao) REFERENCES rh_reuniao(idreuniao);


--
-- Name: fk_rh_atividade1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_atividade
    ADD CONSTRAINT fk_rh_atividade1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_ausente_rh_reuniao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ausente
    ADD CONSTRAINT fk_rh_ausente_rh_reuniao FOREIGN KEY (idreuniao) REFERENCES rh_reuniao(idreuniao);


--
-- Name: fk_rh_ausente_rh_vinculo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ausente
    ADD CONSTRAINT fk_rh_ausente_rh_vinculo FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_averbacao1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_averbacao
    ADD CONSTRAINT fk_rh_averbacao1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_averbfinalidade1_rh_av; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_averbfinalidade
    ADD CONSTRAINT fk_rh_averbfinalidade1_rh_av FOREIGN KEY (idaverbacao) REFERENCES rh_averbacao(idaverbacao) ON DELETE CASCADE;


--
-- Name: fk_rh_baseaposentadoria1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_baseaposentadoria
    ADD CONSTRAINT fk_rh_baseaposentadoria1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- Name: fk_rh_capacitacaocoinc_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_capacitacaocoinc
    ADD CONSTRAINT fk_rh_capacitacaocoinc_1 FOREIGN KEY (idmodulo1) REFERENCES rh_capacitacaomodulo(idmodulo);


--
-- Name: fk_rh_capacitacaocoinc_2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_capacitacaocoinc
    ADD CONSTRAINT fk_rh_capacitacaocoinc_2 FOREIGN KEY (idmodulo2) REFERENCES rh_capacitacaomodulo(idmodulo);


--
-- Name: fk_rh_capacitacaoinsc_modulo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_capacitacaoinsc
    ADD CONSTRAINT fk_rh_capacitacaoinsc_modulo FOREIGN KEY (idmodulo) REFERENCES rh_capacitacaomodulo(idmodulo);


--
-- Name: fk_rh_capacitacaoinsc_vinculo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_capacitacaoinsc
    ADD CONSTRAINT fk_rh_capacitacaoinsc_vinculo FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_cargo1_rh_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cargo
    ADD CONSTRAINT fk_rh_cargo1_rh_gr FOREIGN KEY (idgrupocargo) REFERENCES rh_grupocargo(idgrupocargo) ON DELETE CASCADE;


--
-- Name: fk_rh_cessao1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cessao
    ADD CONSTRAINT fk_rh_cessao1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- Name: fk_rh_cessao2_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cessao
    ADD CONSTRAINT fk_rh_cessao2_rh_oc FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- Name: fk_rh_cessao3_cm_in; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cessao
    ADD CONSTRAINT fk_rh_cessao3_cm_in FOREIGN KEY (idinstituicao) REFERENCES cm_instituicao(idinstituicao);


--
-- Name: fk_rh_cessao4_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cessao
    ADD CONSTRAINT fk_rh_cessao4_rh_pu FOREIGN KEY (idpublicacao) REFERENCES rh_publicacao(idpublicacao);


--
-- Name: fk_rh_cidsubcategoria1_rh_ci; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_cidsubcategoria
    ADD CONSTRAINT fk_rh_cidsubcategoria1_rh_ci FOREIGN KEY (idcidcategoria) REFERENCES rh_cidcategoria(idcidcategoria) ON DELETE CASCADE;


--
-- Name: fk_rh_classegrupocargo1_rh_cl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_classegrupocargo
    ADD CONSTRAINT fk_rh_classegrupocargo1_rh_cl FOREIGN KEY (idclasse) REFERENCES rh_classe(idclasse);


--
-- Name: fk_rh_classegrupocargo2_rh_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_classegrupocargo
    ADD CONSTRAINT fk_rh_classegrupocargo2_rh_gr FOREIGN KEY (idgrupocargo) REFERENCES rh_grupocargo(idgrupocargo);


--
-- Name: fk_rh_conprovter_ad_contrato; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_contratoprovterceirizado
    ADD CONSTRAINT fk_rh_conprovter_ad_contrato FOREIGN KEY (idcontrato) REFERENCES ad_contrato(idcontrato);


--
-- Name: fk_rh_conprovter_rh_proter; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_contratoprovterceirizado
    ADD CONSTRAINT fk_rh_conprovter_rh_proter FOREIGN KEY (idterceirizado, datainicio) REFERENCES rh_provterceirizado(idterceirizado, datainicio);


--
-- Name: fk_rh_contrato0_cm_in; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_contrato
    ADD CONSTRAINT fk_rh_contrato0_cm_in FOREIGN KEY (idinstituicao) REFERENCES cm_instituicao(idinstituicao);


--
-- Name: fk_rh_decisao_rh_reuniao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_decisao
    ADD CONSTRAINT fk_rh_decisao_rh_reuniao FOREIGN KEY (idreuniao) REFERENCES rh_reuniao(idreuniao);


--
-- Name: fk_rh_dependencia1_rh_de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_dependencia
    ADD CONSTRAINT fk_rh_dependencia1_rh_de FOREIGN KEY (iddependente) REFERENCES rh_dependente(iddependente) ON DELETE CASCADE;


--
-- Name: fk_rh_dependente1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_dependente
    ADD CONSTRAINT fk_rh_dependente1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_rh_dependente2_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_dependente
    ADD CONSTRAINT fk_rh_dependente2_rh_fu FOREIGN KEY (idfuncionario) REFERENCES rh_funcionario(idfuncionario);


--
-- Name: fk_rh_desaverbacao1_rh_av; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_desaverbacao
    ADD CONSTRAINT fk_rh_desaverbacao1_rh_av FOREIGN KEY (idaverbacao) REFERENCES rh_averbacao(idaverbacao);


--
-- Name: fk_rh_equipe_rh_proades; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_equipe
    ADD CONSTRAINT fk_rh_equipe_rh_proades FOREIGN KEY (idproades) REFERENCES rh_proades(idproades);


--
-- Name: fk_rh_ferias1_rh_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ferias
    ADD CONSTRAINT fk_rh_ferias1_rh_pe FOREIGN KEY (idvinculoperaq, datainicioperaq) REFERENCES rh_periodoaquisitivo(idvinculo, datainicio);


--
-- Name: fk_rh_fichaclinica1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_fichaclinica
    ADD CONSTRAINT fk_rh_fichaclinica1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_funcao1_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_funcao
    ADD CONSTRAINT fk_rh_funcao1_rh_pu FOREIGN KEY (idpublicacaoinicio) REFERENCES rh_publicacao(idpublicacao);


--
-- Name: fk_rh_funcao2_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_funcao
    ADD CONSTRAINT fk_rh_funcao2_rh_pu FOREIGN KEY (idpublicacaofim) REFERENCES rh_publicacao(idpublicacao);


--
-- Name: fk_rh_funcao4_rh_ni; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_funcao
    ADD CONSTRAINT fk_rh_funcao4_rh_ni FOREIGN KEY (idnivel) REFERENCES rh_nivelfuncao(idnivel);


--
-- Name: fk_rh_funcao5_rh_ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_funcao
    ADD CONSTRAINT fk_rh_funcao5_rh_ca FOREIGN KEY (idcargoconfianca) REFERENCES rh_cargoconfianca(idcargoconfianca);


--
-- Name: fk_rh_funcaoatual1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_funcaoatual
    ADD CONSTRAINT fk_rh_funcaoatual1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_funcionario1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_funcionario
    ADD CONSTRAINT fk_rh_funcionario1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_rh_grupolicafast1_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_grupolicafast
    ADD CONSTRAINT fk_rh_grupolicafast1_rh_oc FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- Name: fk_rh_grupolicafast2_rh_ti; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_grupolicafast
    ADD CONSTRAINT fk_rh_grupolicafast2_rh_ti FOREIGN KEY (idtipolicafast) REFERENCES rh_tipolicafast(idtipolicafast) ON DELETE CASCADE;


--
-- Name: fk_rh_histformacao1_rh_fo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histformacao
    ADD CONSTRAINT fk_rh_histformacao1_rh_fo FOREIGN KEY (idformacao) REFERENCES rh_formacao(idformacao) ON DELETE CASCADE;


--
-- Name: fk_rh_histformacao2_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histformacao
    ADD CONSTRAINT fk_rh_histformacao2_rh_fu FOREIGN KEY (idfuncionario) REFERENCES rh_funcionario(idfuncionario) ON DELETE CASCADE;


--
-- Name: fk_rh_histincentivo_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histincentivo
    ADD CONSTRAINT fk_rh_histincentivo_1 FOREIGN KEY (idhistformacao) REFERENCES rh_histformacao(idhistformacao);


--
-- Name: fk_rh_histincentivo_2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histincentivo
    ADD CONSTRAINT fk_rh_histincentivo_2 FOREIGN KEY (idhisttitulacao) REFERENCES rh_histtitulacao(idhisttitulacao);


--
-- Name: fk_rh_histincentivo_3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histincentivo
    ADD CONSTRAINT fk_rh_histincentivo_3 FOREIGN KEY (idpercqualificacao) REFERENCES rh_percqualificacao(idpercqualificacao);


--
-- Name: fk_rh_histincentivo_4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histincentivo
    ADD CONSTRAINT fk_rh_histincentivo_4 FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_historico_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_historico
    ADD CONSTRAINT fk_rh_historico_1 FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_histtitulacao1_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histtitulacao
    ADD CONSTRAINT fk_rh_histtitulacao1_rh_fu FOREIGN KEY (idfuncionario) REFERENCES rh_funcionario(idfuncionario);


--
-- Name: fk_rh_histvantagem1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histvantagem
    ADD CONSTRAINT fk_rh_histvantagem1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- Name: fk_rh_histvantagem2_rh_va; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histvantagem
    ADD CONSTRAINT fk_rh_histvantagem2_rh_va FOREIGN KEY (idvantagem) REFERENCES rh_vantagem(idvantagem) ON DELETE CASCADE;


--
-- Name: fk_rh_licafast1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_licafast
    ADD CONSTRAINT fk_rh_licafast1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- Name: fk_rh_licafast2_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_licafast
    ADD CONSTRAINT fk_rh_licafast2_rh_oc FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- Name: fk_rh_licafast3_rh_ci; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_licafast
    ADD CONSTRAINT fk_rh_licafast3_rh_ci FOREIGN KEY (idcidcategoria, idcidsubcategoria) REFERENCES rh_cidsubcategoria(idcidcategoria, idcidsubcategoria);


--
-- Name: fk_rh_licafast4_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_licafast
    ADD CONSTRAINT fk_rh_licafast4_rh_pu FOREIGN KEY (idpublicacao) REFERENCES rh_publicacao(idpublicacao);


--
-- Name: fk_rh_membro_rh_equipe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_membro
    ADD CONSTRAINT fk_rh_membro_rh_equipe FOREIGN KEY (idequipe) REFERENCES rh_equipe(idequipe);


--
-- Name: fk_rh_membro_rh_vinculo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_membro
    ADD CONSTRAINT fk_rh_membro_rh_vinculo FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_meta_rh_proades; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_meta
    ADD CONSTRAINT fk_rh_meta_rh_proades FOREIGN KEY (idproades) REFERENCES rh_proades(idproades);


--
-- Name: fk_rh_naohabilitado_rh_proades; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_naohabilitado
    ADD CONSTRAINT fk_rh_naohabilitado_rh_proades FOREIGN KEY (idproades) REFERENCES rh_proades(idproades);


--
-- Name: fk_rh_naohabilitado_rh_vinculo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_naohabilitado
    ADD CONSTRAINT fk_rh_naohabilitado_rh_vinculo FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_ocorrencia1_rh_gr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ocorrencia
    ADD CONSTRAINT fk_rh_ocorrencia1_rh_gr FOREIGN KEY (idgrupoocorrencia) REFERENCES rh_grupoocorrencia(idgrupoocorrencia) ON DELETE CASCADE;


--
-- Name: fk_rh_ocupacaofuncao1_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ocupacaofuncao
    ADD CONSTRAINT fk_rh_ocupacaofuncao1_rh_fu FOREIGN KEY (idfuncao) REFERENCES rh_funcao(idfuncao);


--
-- Name: fk_rh_ocupacaofuncao2_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ocupacaofuncao
    ADD CONSTRAINT fk_rh_ocupacaofuncao2_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_ocupacaofuncao3_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ocupacaofuncao
    ADD CONSTRAINT fk_rh_ocupacaofuncao3_rh_pu FOREIGN KEY (idpublicacaoinicio) REFERENCES rh_publicacao(idpublicacao);


--
-- Name: fk_rh_ocupacaofuncao4_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ocupacaofuncao
    ADD CONSTRAINT fk_rh_ocupacaofuncao4_rh_pu FOREIGN KEY (idpublicacaofim) REFERENCES rh_publicacao(idpublicacao);


--
-- Name: fk_rh_ocupacaovaga1_rh_va; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ocupacaovaga
    ADD CONSTRAINT fk_rh_ocupacaovaga1_rh_va FOREIGN KEY (numerovaga) REFERENCES rh_vaga(numerovaga) ON DELETE CASCADE;


--
-- Name: fk_rh_ocupacaovaga2_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_ocupacaovaga
    ADD CONSTRAINT fk_rh_ocupacaovaga2_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- Name: fk_rh_pensionista1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_pensionista
    ADD CONSTRAINT fk_rh_pensionista1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_rh_pensionista2_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_pensionista
    ADD CONSTRAINT fk_rh_pensionista2_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_percqualificacao_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_percqualificacao
    ADD CONSTRAINT fk_rh_percqualificacao_1 FOREIGN KEY (idescolaridadepcctae) REFERENCES rh_escolaridadepcctae(idescolaridadepcctae);


--
-- Name: fk_rh_periodoaquisitivo1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_periodoaquisitivo
    ADD CONSTRAINT fk_rh_periodoaquisitivo1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- Name: fk_rh_presente_rh_reuniao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_presente
    ADD CONSTRAINT fk_rh_presente_rh_reuniao FOREIGN KEY (idreuniao) REFERENCES rh_reuniao(idreuniao);


--
-- Name: fk_rh_presente_rh_vinculo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_presente
    ADD CONSTRAINT fk_rh_presente_rh_vinculo FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_prorrogacao1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_prorrogacao
    ADD CONSTRAINT fk_rh_prorrogacao1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo) ON DELETE CASCADE;


--
-- Name: fk_rh_provimento1_rh_am; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento1_rh_am FOREIGN KEY (idambiente) REFERENCES rh_ambiente(idambiente);


--
-- Name: fk_rh_provimento1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_provimento2_rh_si; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento2_rh_si FOREIGN KEY (idsituacao) REFERENCES rh_situacaofuncional(idsituacao);


--
-- Name: fk_rh_provimento3_rh_ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento3_rh_ca FOREIGN KEY (idgrupocargo, idcargo) REFERENCES rh_cargo(idgrupocargo, idcargo);


--
-- Name: fk_rh_provimento5_rh_re; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento5_rh_re FOREIGN KEY (idclasse, idreferencia) REFERENCES rh_referencia(idclasse, idreferencia);


--
-- Name: fk_rh_provimento6_rh_jo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento6_rh_jo FOREIGN KEY (idjornada) REFERENCES rh_jornada(idjornada);


--
-- Name: fk_rh_provimento7_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento7_rh_pu FOREIGN KEY (idpublicacao) REFERENCES rh_publicacao(idpublicacao);


--
-- Name: fk_rh_provimento8_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provimento
    ADD CONSTRAINT fk_rh_provimento8_rh_oc FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- Name: fk_rh_provterceirizado1_cm_in; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provterceirizado
    ADD CONSTRAINT fk_rh_provterceirizado1_cm_in FOREIGN KEY (idinstituicao) REFERENCES cm_instituicao(idinstituicao);


--
-- Name: fk_rh_provterceirizado1_rh_lo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provterceirizado
    ADD CONSTRAINT fk_rh_provterceirizado1_rh_lo FOREIGN KEY (idlocalterceirizado) REFERENCES rh_localterceirizado(idlocalterceirizado);


--
-- Name: fk_rh_provterceirizado1_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provterceirizado
    ADD CONSTRAINT fk_rh_provterceirizado1_rh_oc FOREIGN KEY (idocorrenciaterceirizado) REFERENCES rh_ocorrenciaterceirizado(idocorrenciaterceirizado);


--
-- Name: fk_rh_provterceirizado1_rh_te; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provterceirizado
    ADD CONSTRAINT fk_rh_provterceirizado1_rh_te FOREIGN KEY (idterceirizado) REFERENCES rh_terceirizado(idterceirizado);


--
-- Name: fk_rh_provterceirizado2_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provterceirizado
    ADD CONSTRAINT fk_rh_provterceirizado2_rh_fu FOREIGN KEY (idfuncaoterceirizado) REFERENCES rh_funcaoterceirizado(idfuncaoterceirizado);


--
-- Name: fk_rh_provterceirizado4_rh_jo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provterceirizado
    ADD CONSTRAINT fk_rh_provterceirizado4_rh_jo FOREIGN KEY (idjornada) REFERENCES rh_jornada(idjornada);


--
-- Name: fk_rh_publicacao1_rh_di; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_publicacao
    ADD CONSTRAINT fk_rh_publicacao1_rh_di FOREIGN KEY (iddiplomalegal) REFERENCES rh_diplomalegal(iddiplomalegal);


--
-- Name: fk_rh_referencia1_rh_cg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_referencia
    ADD CONSTRAINT fk_rh_referencia1_rh_cg FOREIGN KEY (idclassegrupocargo) REFERENCES rh_classegrupocargo(idclassegrupocargo);


--
-- Name: fk_rh_referencia1_rh_cl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_referencia
    ADD CONSTRAINT fk_rh_referencia1_rh_cl FOREIGN KEY (idclasse) REFERENCES rh_classe(idclasse) ON DELETE CASCADE;


--
-- Name: fk_rh_reppensao1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_representacaopensao
    ADD CONSTRAINT fk_rh_reppensao1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_rh_reppensao2_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_representacaopensao
    ADD CONSTRAINT fk_rh_reppensao2_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_reppensao3_rh_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_representacaopensao
    ADD CONSTRAINT fk_rh_reppensao3_rh_pe FOREIGN KEY (idpensionista) REFERENCES rh_pensionista(idpensionista);


--
-- Name: fk_rh_resultadoreuniao_rh_meta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_resultadoreuniao
    ADD CONSTRAINT fk_rh_resultadoreuniao_rh_meta FOREIGN KEY (idmeta) REFERENCES rh_meta(idmeta);


--
-- Name: fk_rh_resultreuniao_rh_reuniao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_resultadoreuniao
    ADD CONSTRAINT fk_rh_resultreuniao_rh_reuniao FOREIGN KEY (idreuniao) REFERENCES rh_reuniao(idreuniao);


--
-- Name: fk_rh_reuniaoanexo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_reuniaoanexo
    ADD CONSTRAINT fk_rh_reuniaoanexo FOREIGN KEY (idreuniao) REFERENCES rh_reuniao(idreuniao);


--
-- Name: fk_rh_reuniaofator_rh_meta; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_reuniaofator
    ADD CONSTRAINT fk_rh_reuniaofator_rh_meta FOREIGN KEY (idmeta) REFERENCES rh_meta(idmeta);


--
-- Name: fk_rh_reuniaofator_rh_reuniao; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_reuniaofator
    ADD CONSTRAINT fk_rh_reuniaofator_rh_reuniao FOREIGN KEY (idreuniao) REFERENCES rh_reuniao(idreuniao);


--
-- Name: fk_rh_situacaoocorrencia1_rh_o; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_situacaoocorrencia
    ADD CONSTRAINT fk_rh_situacaoocorrencia1_rh_o FOREIGN KEY (idgrupoocorrencia, idocorrencia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia) ON DELETE CASCADE;


--
-- Name: fk_rh_situacaoocorrencia2_rh_s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_situacaoocorrencia
    ADD CONSTRAINT fk_rh_situacaoocorrencia2_rh_s FOREIGN KEY (idsituacao) REFERENCES rh_situacaofuncional(idsituacao);


--
-- Name: fk_rh_terceirizado1_cm_pe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_terceirizado
    ADD CONSTRAINT fk_rh_terceirizado1_cm_pe FOREIGN KEY (idpessoa) REFERENCES cm_pessoa(idpessoa);


--
-- Name: fk_rh_vaga1_rh_ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vaga
    ADD CONSTRAINT fk_rh_vaga1_rh_ca FOREIGN KEY (idgrupocargo, idcargo) REFERENCES rh_cargo(idgrupocargo, idcargo);


--
-- Name: fk_rh_vinculo2_rh_pu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculo
    ADD CONSTRAINT fk_rh_vinculo2_rh_pu FOREIGN KEY (idpublicacaovacancia) REFERENCES rh_publicacao(idpublicacao);


--
-- Name: fk_rh_vinculo3_rh_fu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculo
    ADD CONSTRAINT fk_rh_vinculo3_rh_fu FOREIGN KEY (idfuncionario) REFERENCES rh_funcionario(idfuncionario);


--
-- Name: fk_rh_vinculo4_rh_oc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculo
    ADD CONSTRAINT fk_rh_vinculo4_rh_oc FOREIGN KEY (idgrupoocorrenciavacancia, idocorrenciavacancia) REFERENCES rh_ocorrencia(idgrupoocorrencia, idocorrencia);


--
-- Name: fk_rh_vinculocid1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculocid
    ADD CONSTRAINT fk_rh_vinculocid1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_vinculocid2_rh_ci; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculocid
    ADD CONSTRAINT fk_rh_vinculocid2_rh_ci FOREIGN KEY (cid) REFERENCES rh_cidcategoria(idcidcategoria);


--
-- Name: fk_rh_vinculosih1_rh_vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculosih
    ADD CONSTRAINT fk_rh_vinculosih1_rh_vi FOREIGN KEY (idvinculo) REFERENCES rh_vinculo(idvinculo);


--
-- Name: fk_rh_vinculosih2_rh_ci; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_vinculosih
    ADD CONSTRAINT fk_rh_vinculosih2_rh_ci FOREIGN KEY (idcirurgia) REFERENCES rh_cirurgia(codigo);


--
-- Name: fk_suplementacaoitem_licitacaoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_suplementacaoitem
    ADD CONSTRAINT fk_suplementacaoitem_licitacaoid FOREIGN KEY (idlicitacao) REFERENCES ad_licitacao(idlicitacao);


--
-- Name: fk_suplementacaoitem_requisicaoid; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ad_suplementacaoitem
    ADD CONSTRAINT fk_suplementacaoitem_requisicaoid FOREIGN KEY (idrequisicao) REFERENCES ad_requisicao(idrequisicao);


--
-- Name: sys_c009268; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provterceirizado
    ADD CONSTRAINT sys_c009268 FOREIGN KEY (idescala) REFERENCES rh_escala(idescala);


--
-- Name: sys_c009783; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_provterceirizado
    ADD CONSTRAINT sys_c009783 FOREIGN KEY (idcontrato) REFERENCES rh_contrato(idcontrato);


--
-- Name: sys_c009962; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rh_histformacao
    ADD CONSTRAINT sys_c009962 FOREIGN KEY (idescolaridadepcctae) REFERENCES rh_escolaridadepcctae(idescolaridadepcctae);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

