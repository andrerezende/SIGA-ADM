--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bt_camposfixos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_camposfixos (
    idetiqueta integer NOT NULL,
    idobra integer NOT NULL,
    conteudo character varying(50) NOT NULL,
    obra_temp integer,
    etiqueta_temp character varying(3)
);


ALTER TABLE public.bt_camposfixos OWNER TO postgres;

--
-- Name: bt_camposubficha; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_camposubficha (
    idficha integer NOT NULL,
    idsubficha integer NOT NULL,
    idetiqueta integer NOT NULL,
    subcampo character(1) NOT NULL,
    ordem integer
);


ALTER TABLE public.bt_camposubficha OWNER TO postgres;

--
-- Name: bt_colecao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_colecao (
    idcolecao integer NOT NULL,
    mnemonico character varying(10),
    descricao character varying(40)
);


ALTER TABLE public.bt_colecao OWNER TO postgres;

--
-- Name: bt_consulta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_consulta (
    idconsulta integer NOT NULL,
    mnemonico character varying(10)
);


ALTER TABLE public.bt_consulta OWNER TO postgres;

--
-- Name: bt_consultacampo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_consultacampo (
    idconsulta integer NOT NULL,
    idetiqueta integer NOT NULL,
    subcampo character(1) NOT NULL
);


ALTER TABLE public.bt_consultacampo OWNER TO postgres;

--
-- Name: bt_direito; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_direito (
    idregracirculacao integer NOT NULL,
    idoperacao integer NOT NULL,
    idgrupo integer NOT NULL
);


ALTER TABLE public.bt_direito OWNER TO postgres;

--
-- Name: bt_editora; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_editora OWNER TO postgres;

--
-- Name: bt_emprestimo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_emprestimo (
    idemprestimo integer NOT NULL,
    datahoradoemprestimo date,
    datahoraprevisaodevolucao date,
    datahoradadevolucao date,
    quantidadederenovacoes integer,
    emprhoras character(1),
    idusuario integer,
    idexemplar integer,
    usuario_temp character varying(20),
    exemplar_temp character varying(15)
);


ALTER TABLE public.bt_emprestimo OWNER TO postgres;

--
-- Name: bt_estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_estado (
    idestado integer NOT NULL,
    descricao character varying(40),
    mnemonico character varying(20)
);


ALTER TABLE public.bt_estado OWNER TO postgres;

--
-- Name: bt_etiqueta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_etiqueta OWNER TO postgres;

--
-- Name: bt_exemplar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    idobra integer,
    obra_temp integer,
    colecao_temp character varying(10)
);


ALTER TABLE public.bt_exemplar OWNER TO postgres;

--
-- Name: bt_ficha; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_ficha (
    idficha integer NOT NULL,
    categoria character(2) NOT NULL,
    nivel character(1) NOT NULL
);


ALTER TABLE public.bt_ficha OWNER TO postgres;

--
-- Name: bt_genero; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_genero (
    idgenero integer NOT NULL,
    descricao character varying(40),
    idficha integer
);


ALTER TABLE public.bt_genero OWNER TO postgres;

--
-- Name: bt_grupo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_grupo (
    idgrupo integer NOT NULL,
    descricao character varying(40),
    nivel integer
);


ALTER TABLE public.bt_grupo OWNER TO postgres;

--
-- Name: bt_indicadores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_indicadores OWNER TO postgres;

--
-- Name: bt_infracao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_infracao (
    idinfracao integer NOT NULL,
    descricao character varying(40)
);


ALTER TABLE public.bt_infracao OWNER TO postgres;

--
-- Name: bt_logoperacao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_logoperacao (
    idlogoperacao integer NOT NULL,
    data date,
    identificador character varying(100),
    idusuario integer,
    idoperacao integer NOT NULL,
    usuario_temp character varying(20),
    obra_temp integer,
    exemplar_temp character varying(20)
);


ALTER TABLE public.bt_logoperacao OWNER TO postgres;

--
-- Name: bt_logoperacaodetalhe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_logoperacaodetalhe (
    idlogoperacao integer NOT NULL,
    campo character varying(20) NOT NULL,
    valoranterior character varying(200),
    valornovo character varying(200)
);


ALTER TABLE public.bt_logoperacaodetalhe OWNER TO postgres;

--
-- Name: bt_material; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_material OWNER TO postgres;

--
-- Name: bt_multa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_multa OWNER TO postgres;

--
-- Name: bt_notainfracao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_notainfracao (
    idinfracao integer NOT NULL,
    idusuario integer,
    notainfracao character varying(100),
    idnotainfracao integer NOT NULL,
    usuario_temp character varying(20)
);


ALTER TABLE public.bt_notainfracao OWNER TO postgres;

--
-- Name: bt_obra; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    ideditora integer
);

ALTER TABLE public.bt_obra OWNER TO postgres;

--
-- Name: bt_observacao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_observacao (
    idusuario integer,
    idobservacao integer NOT NULL,
    descricao character varying(150),
    usuario_temp character varying(20)
);


ALTER TABLE public.bt_observacao OWNER TO postgres;

--
-- Name: bt_opcao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_opcao (
    idopcao integer NOT NULL,
    descricao character varying(50)
);


ALTER TABLE public.bt_opcao OWNER TO postgres;

--
-- Name: bt_opcaolista; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_opcaolista (
    idopcao integer NOT NULL,
    idopcaolista integer NOT NULL,
    indice character varying(10),
    texto character varying(100),
    ordem character varying(10)
);


ALTER TABLE public.bt_opcaolista OWNER TO postgres;

--
-- Name: bt_operacao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_operacao (
    idoperacao integer NOT NULL,
    descricao character varying(40),
    mnemonico character varying(20)
);


ALTER TABLE public.bt_operacao OWNER TO postgres;

--
-- Name: bt_politica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_politica OWNER TO postgres;

--
-- Name: bt_posicao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_posicao (
    idetiqueta integer NOT NULL,
    posicao character(3) NOT NULL,
    descricao character varying(50),
    idopcao integer
);


ALTER TABLE public.bt_posicao OWNER TO postgres;

--
-- Name: bt_posicaosubficha; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_posicaosubficha (
    idetiqueta integer NOT NULL,
    posicao character(3) NOT NULL,
    idficha integer NOT NULL,
    idsubficha integer NOT NULL
);


ALTER TABLE public.bt_posicaosubficha OWNER TO postgres;

--
-- Name: bt_regracirculacao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_regracirculacao (
    idregracirculacao integer NOT NULL,
    descricao character varying(40)
);


ALTER TABLE public.bt_regracirculacao OWNER TO postgres;

--
-- Name: bt_reserva; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    idusuario integer,
    idexemplar integer,
    usuario_temp character varying(20),
    exemplar_temp character varying(15)
);


ALTER TABLE public.bt_reserva OWNER TO postgres;

--
-- Name: bt_situacao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_situacao (
    idsituacao integer NOT NULL,
    descricao character varying(40),
    mnemonico character varying(20)
);


ALTER TABLE public.bt_situacao OWNER TO postgres;

--
-- Name: bt_subcampo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_subcampo OWNER TO postgres;

--
-- Name: bt_subficha; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_subficha (
    idficha integer NOT NULL,
    idsubficha integer NOT NULL,
    titulo character varying(40) NOT NULL
);


ALTER TABLE public.bt_subficha OWNER TO postgres;

--
-- Name: bt_transicao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_transicao (
    idestadopresente integer NOT NULL,
    idestadofuturo integer NOT NULL,
    idoperacao integer NOT NULL
);


ALTER TABLE public.bt_transicao OWNER TO postgres;

--
-- Name: bt_unidade; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_unidade (
    idunidade integer NOT NULL,
    descricao character varying(50),
    mnemonico character varying(6),
    idsetor integer
);


ALTER TABLE public.bt_unidade OWNER TO postgres;

--
-- Name: bt_usuarioexterno; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_usuarioexterno (
    idusuario integer NOT NULL,
    numrg character varying(15) NOT NULL,
    nome character varying(55) NOT NULL,
    telefone character varying(20) NOT NULL,
    endereco character varying(80),
    bairro character varying(50),
    cep character varying(8),
    idmunicipio character(5) NOT NULL,
    datanasc date NOT NULL
);


ALTER TABLE public.bt_usuarioexterno OWNER TO postgres;

--
-- Name: bt_validacao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_validacao (
    idvalidacao integer NOT NULL,
    dtvalidacao date,
    dtvalidacaoant date,
    codigoacesso character(10),
    idusuario integer,
    usuario_temp character varying(20)
);


ALTER TABLE public.bt_validacao OWNER TO postgres;

--
-- Name: bt_vinculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_vinculo (
    idgrupo integer NOT NULL,
    idusuario integer NOT NULL,
    usuario_temp character varying(20)
);


ALTER TABLE public.bt_vinculo OWNER TO postgres;

--
-- Name: seq_bt_colecao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_colecao
    START WITH 403
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_colecao OWNER TO postgres;

--
-- Name: seq_bt_editora; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_editora
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_editora OWNER TO postgres;

--
-- Name: seq_bt_emprestimo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_emprestimo
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_emprestimo OWNER TO postgres;

--
-- Name: seq_bt_estado; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_estado
    START WITH 21
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_estado OWNER TO postgres;

--
-- Name: seq_bt_etiqueta; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_etiqueta
    START WITH 211
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_etiqueta OWNER TO postgres;

--
-- Name: seq_bt_exemplar; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_exemplar
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_exemplar OWNER TO postgres;

--
-- Name: seq_bt_ficha; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_ficha
    START WITH 21
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_ficha OWNER TO postgres;

--
-- Name: seq_bt_genero; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_genero
    START WITH 22
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_genero OWNER TO postgres;

--
-- Name: seq_bt_grupo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_grupo
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_grupo OWNER TO postgres;

--
-- Name: seq_bt_indicadores; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_indicadores
    START WITH 1248084
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_indicadores OWNER TO postgres;

--
-- Name: seq_bt_infracao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_infracao
    START WITH 22
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_infracao OWNER TO postgres;

--
-- Name: seq_bt_logoperacao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_logoperacao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_logoperacao OWNER TO postgres;

--
-- Name: seq_bt_material; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_material
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_material OWNER TO postgres;

--
-- Name: seq_bt_multa; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_multa
    START WITH 105474
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_multa OWNER TO postgres;

--
-- Name: seq_bt_notainfracao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_notainfracao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_notainfracao OWNER TO postgres;

--
-- Name: seq_bt_obra; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_obra
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_obra OWNER TO postgres;

--
-- Name: seq_bt_obra_numerodaobra; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_obra_numerodaobra
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_obra_numerodaobra OWNER TO postgres;

--
-- Name: seq_bt_observacao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_observacao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_observacao OWNER TO postgres;

--
-- Name: seq_bt_opcao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_opcao
    START WITH 81
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_opcao OWNER TO postgres;

--
-- Name: seq_bt_opcaolista; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_opcaolista
    START WITH 1818
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_opcaolista OWNER TO postgres;

--
-- Name: seq_bt_operacao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_operacao
    START WITH 121
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_operacao OWNER TO postgres;

--
-- Name: seq_bt_politica; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_politica
    START WITH 81
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_politica OWNER TO postgres;

--
-- Name: seq_bt_regracirculacao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_regracirculacao
    START WITH 70
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_regracirculacao OWNER TO postgres;

--
-- Name: seq_bt_reserva; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_reserva
    START WITH 53271
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_reserva OWNER TO postgres;

--
-- Name: seq_bt_situacao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_situacao
    START WITH 21
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_situacao OWNER TO postgres;

--
-- Name: seq_bt_unidade; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_unidade
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_unidade OWNER TO postgres;

--
-- Name: seq_bt_validacao; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_bt_validacao
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_bt_validacao OWNER TO postgres;

--
-- Name: pk_bt_camposfixos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_camposfixos
    ADD CONSTRAINT pk_bt_camposfixos PRIMARY KEY (idetiqueta, idobra);


--
-- Name: pk_bt_camposubficha; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_camposubficha
    ADD CONSTRAINT pk_bt_camposubficha PRIMARY KEY (idficha, idsubficha, idetiqueta, subcampo);


--
-- Name: pk_bt_colecao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_colecao
    ADD CONSTRAINT pk_bt_colecao PRIMARY KEY (idcolecao);


--
-- Name: pk_bt_consulta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_consulta
    ADD CONSTRAINT pk_bt_consulta PRIMARY KEY (idconsulta);


--
-- Name: pk_bt_consultacampo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_consultacampo
    ADD CONSTRAINT pk_bt_consultacampo PRIMARY KEY (idconsulta, idetiqueta, subcampo);


--
-- Name: pk_bt_direito; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_direito
    ADD CONSTRAINT pk_bt_direito PRIMARY KEY (idregracirculacao, idoperacao, idgrupo);


-- 
-- Name: pk_bt_editora; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_editora
    ADD CONSTRAINT pk_bt_editora PRIMARY KEY (ideditora);

--
-- Name: pk_bt_emprestimo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_emprestimo
    ADD CONSTRAINT pk_bt_emprestimo PRIMARY KEY (idemprestimo);


--
-- Name: pk_bt_estado; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_estado
    ADD CONSTRAINT pk_bt_estado PRIMARY KEY (idestado);


--
-- Name: pk_bt_etiqueta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_etiqueta
    ADD CONSTRAINT pk_bt_etiqueta PRIMARY KEY (idetiqueta);


--
-- Name: pk_bt_exemplar; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT pk_bt_exemplar PRIMARY KEY (idexemplar);


--
-- Name: pk_bt_ficha; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_ficha
    ADD CONSTRAINT pk_bt_ficha PRIMARY KEY (idficha);


--
-- Name: pk_bt_genero; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_genero
    ADD CONSTRAINT pk_bt_genero PRIMARY KEY (idgenero);


--
-- Name: pk_bt_grupo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_grupo
    ADD CONSTRAINT pk_bt_grupo PRIMARY KEY (idgrupo);


--
-- Name: pk_bt_indicadores; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_indicadores
    ADD CONSTRAINT pk_bt_indicadores PRIMARY KEY (idindicador);


--
-- Name: pk_bt_infracao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_infracao
    ADD CONSTRAINT pk_bt_infracao PRIMARY KEY (idinfracao);


--
-- Name: pk_bt_logoperacao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_logoperacao
    ADD CONSTRAINT pk_bt_logoperacao PRIMARY KEY (idlogoperacao);


--
-- Name: pk_bt_logoperacaodetalhe; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_logoperacaodetalhe
    ADD CONSTRAINT pk_bt_logoperacaodetalhe PRIMARY KEY (idlogoperacao, campo);


--
-- Name: pk_bt_material; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_material
    ADD CONSTRAINT pk_bt_material PRIMARY KEY (idmaterial);


--
-- Name: pk_bt_multa; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_multa
    ADD CONSTRAINT pk_bt_multa PRIMARY KEY (idmulta);


--
-- Name: pk_bt_notainfracao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_notainfracao
    ADD CONSTRAINT pk_bt_notainfracao PRIMARY KEY (idnotainfracao);


--
-- Name: pk_bt_obra; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_obra
    ADD CONSTRAINT pk_bt_obra PRIMARY KEY (idobra);


--
-- Name: pk_bt_observacao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_observacao
    ADD CONSTRAINT pk_bt_observacao PRIMARY KEY (idobservacao);


--
-- Name: pk_bt_opcao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_opcao
    ADD CONSTRAINT pk_bt_opcao PRIMARY KEY (idopcao);


--
-- Name: pk_bt_opcaolista; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_opcaolista
    ADD CONSTRAINT pk_bt_opcaolista PRIMARY KEY (idopcao, idopcaolista);


--
-- Name: pk_bt_operacao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_operacao
    ADD CONSTRAINT pk_bt_operacao PRIMARY KEY (idoperacao);


--
-- Name: pk_bt_politica; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_politica
    ADD CONSTRAINT pk_bt_politica PRIMARY KEY (idpolitica);


--
-- Name: pk_bt_posicao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_posicao
    ADD CONSTRAINT pk_bt_posicao PRIMARY KEY (idetiqueta, posicao);


--
-- Name: pk_bt_posicaosubficha; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_posicaosubficha
    ADD CONSTRAINT pk_bt_posicaosubficha PRIMARY KEY (idetiqueta, posicao, idficha, idsubficha);


--
-- Name: pk_bt_regracirculacao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_regracirculacao
    ADD CONSTRAINT pk_bt_regracirculacao PRIMARY KEY (idregracirculacao);


--
-- Name: pk_bt_reserva; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_reserva
    ADD CONSTRAINT pk_bt_reserva PRIMARY KEY (idreserva);


--
-- Name: pk_bt_situacao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_situacao
    ADD CONSTRAINT pk_bt_situacao PRIMARY KEY (idsituacao);


--
-- Name: pk_bt_subcampo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_subcampo
    ADD CONSTRAINT pk_bt_subcampo PRIMARY KEY (idetiqueta, subcampo);


--
-- Name: pk_bt_subficha; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_subficha
    ADD CONSTRAINT pk_bt_subficha PRIMARY KEY (idficha, idsubficha);


--
-- Name: pk_bt_unidade; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_unidade
    ADD CONSTRAINT pk_bt_unidade PRIMARY KEY (idunidade);


--
-- Name: pk_bt_usuarioexterno; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_usuarioexterno
    ADD CONSTRAINT pk_bt_usuarioexterno PRIMARY KEY (idusuario);


--
-- Name: pk_bt_validacao; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_validacao
    ADD CONSTRAINT pk_bt_validacao PRIMARY KEY (idvalidacao);


--
-- Name: pk_bt_vinculo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_vinculo
    ADD CONSTRAINT pk_bt_vinculo PRIMARY KEY (idgrupo, idusuario);


--
-- Name: idx_bt_camposfixos1_bt_ob; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_camposfixos1_bt_ob ON bt_camposfixos USING btree (idobra);


--
-- Name: idx_bt_camposfixos2_bt_et; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_camposfixos2_bt_et ON bt_camposfixos USING btree (idetiqueta);


--
-- Name: idx_bt_camposubficha1_bt_su; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_camposubficha1_bt_su ON bt_camposubficha USING btree (idetiqueta, subcampo);


--
-- Name: idx_bt_camposubficha2_bt_su; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_camposubficha2_bt_su ON bt_camposubficha USING btree (idficha, idsubficha);


--
-- Name: idx_bt_consultacampo1_bt_su; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_consultacampo1_bt_su ON bt_consultacampo USING btree (idetiqueta, subcampo);


--
-- Name: idx_bt_consultacampo2_bt_co; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_consultacampo2_bt_co ON bt_consultacampo USING btree (idconsulta);


--
-- Name: idx_bt_direito1_bt_gr; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_direito1_bt_gr ON bt_direito USING btree (idgrupo);


--
-- Name: idx_bt_direito2_bt_op; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_direito2_bt_op ON bt_direito USING btree (idoperacao);


--
-- Name: idx_bt_direito3_bt_re; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_direito3_bt_re ON bt_direito USING btree (idregracirculacao);


--
-- Name: idx_bt_emprestimo1_bt_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_emprestimo1_bt_us ON bt_emprestimo USING btree (idusuario);


--
-- Name: idx_bt_emprestimo2_bt_ex; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_emprestimo2_bt_ex ON bt_emprestimo USING btree (idexemplar);


--
-- Name: idx_bt_emprestimo3_dtdevolucao; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_emprestimo3_dtdevolucao ON bt_emprestimo USING btree (datahoradadevolucao);


--
-- Name: idx_bt_emprestimo4_dtemp; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_emprestimo4_dtemp ON bt_emprestimo USING btree (datahoradoemprestimo);


--
-- Name: idx_bt_emprestimo5_dtprev; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_emprestimo5_dtprev ON bt_emprestimo USING btree (datahoraprevisaodevolucao);


--
-- Name: idx_bt_exemplar1_bt_es; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_exemplar1_bt_es ON bt_exemplar USING btree (idestado);


--
-- Name: idx_bt_exemplar2_bt_re; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_exemplar2_bt_re ON bt_exemplar USING btree (idregracirculacao);


--
-- Name: idx_bt_exemplar3_bt_un; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_exemplar3_bt_un ON bt_exemplar USING btree (idunidade);


--
-- Name: idx_bt_exemplar4_bt_co; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_exemplar4_bt_co ON bt_exemplar USING btree (idcolecao);


--
-- Name: idx_bt_exemplar5_bt_ob; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_exemplar5_bt_ob ON bt_exemplar USING btree (idobra);


--
-- Name: idx_bt_exemplar_numerodotombo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX idx_bt_exemplar_numerodotombo ON bt_exemplar USING btree (numerodotombo);


--
-- Name: idx_bt_genero1_bt_fi; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_genero1_bt_fi ON bt_genero USING btree (idficha);


--
-- Name: idx_bt_indicadores0_bt_et; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_indicadores0_bt_et ON bt_indicadores USING btree (idetiqueta);


--
-- Name: idx_bt_indicadores1_bt_ob; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_indicadores1_bt_ob ON bt_indicadores USING btree (idobra);


--
-- Name: idx_bt_logoperacao1_bt_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_logoperacao1_bt_us ON bt_logoperacao USING btree (idusuario);


--
-- Name: idx_bt_logoperacao2_bt_op; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_logoperacao2_bt_op ON bt_logoperacao USING btree (idoperacao);


--
-- Name: idx_bt_logoperacao3_ident; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_logoperacao3_ident ON bt_logoperacao USING btree (identificador);


--
-- Name: idx_bt_logoperacaodet1_bt_l; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_logoperacaodet1_bt_l ON bt_logoperacaodetalhe USING btree (idlogoperacao);


--
-- Name: idx_bt_material1_bt_su; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_material1_bt_su ON bt_material USING btree (idetiqueta, subcampo);


--
-- Name: idx_bt_material2_bt_ob; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_material2_bt_ob ON bt_material USING btree (idobra);


--
-- Name: idx_bt_multa1_bt_em; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_multa1_bt_em ON bt_multa USING btree (idemprestimo);


--
-- Name: idx_bt_notainfracao1_bt_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_notainfracao1_bt_us ON bt_notainfracao USING btree (idusuario);


--
-- Name: idx_bt_notainfracao2_bt_in; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_notainfracao2_bt_in ON bt_notainfracao USING btree (idinfracao);


--
-- Name: idx_bt_obra1_bt_ge; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_obra1_bt_ge ON bt_obra USING btree (idgenero);


--
-- Name: idx_bt_obra_numerodaobra; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_obra_numerodaobra ON bt_obra USING btree (numerodaobra);


--
-- Name: idx_bt_observacao1_bt_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_observacao1_bt_us ON bt_observacao USING btree (idusuario);


--
-- Name: idx_bt_opcaolista1_bt_op; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_opcaolista1_bt_op ON bt_opcaolista USING btree (idopcao);


--
-- Name: idx_bt_politica2_bt_re; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_politica2_bt_re ON bt_politica USING btree (idregracirculacao);


--
-- Name: idx_bt_politica3_bt_gr; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_politica3_bt_gr ON bt_politica USING btree (idgrupo);


--
-- Name: idx_bt_posicao1_bt_et; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_posicao1_bt_et ON bt_posicao USING btree (idetiqueta);


--
-- Name: idx_bt_posicao2_bt_op; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_posicao2_bt_op ON bt_posicao USING btree (idopcao);


--
-- Name: idx_bt_posicaosubficha1_bt_su; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_posicaosubficha1_bt_su ON bt_posicaosubficha USING btree (idficha, idsubficha);


--
-- Name: idx_bt_posicaosubficha2_bt_po; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_posicaosubficha2_bt_po ON bt_posicaosubficha USING btree (idetiqueta, posicao);


--
-- Name: idx_bt_reserva1_bt_si; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_reserva1_bt_si ON bt_reserva USING btree (idsituacao);


--
-- Name: idx_bt_reserva2_bt_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_reserva2_bt_us ON bt_reserva USING btree (idusuario);


--
-- Name: idx_bt_reserva3_bt_ex; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_reserva3_bt_ex ON bt_reserva USING btree (idexemplar);


--
-- Name: idx_bt_subcampo1_bt_et; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_subcampo1_bt_et ON bt_subcampo USING btree (idetiqueta);


--
-- Name: idx_bt_subcampo2_bt_op; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_subcampo2_bt_op ON bt_subcampo USING btree (idopcao);


--
-- Name: idx_bt_subficha1_bt_fi; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_subficha1_bt_fi ON bt_subficha USING btree (idficha);


--
-- Name: idx_bt_transicao0_bt_es; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_transicao0_bt_es ON bt_transicao USING btree (idestadopresente);


--
-- Name: idx_bt_transicao1_bt_es; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_transicao1_bt_es ON bt_transicao USING btree (idestadofuturo);


--
-- Name: idx_bt_transicao2_bt_op; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_transicao2_bt_op ON bt_transicao USING btree (idoperacao);


--
-- Name: idx_bt_usuarioexterno1_cm_mu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_usuarioexterno1_cm_mu ON bt_usuarioexterno USING btree (idmunicipio);


--
-- Name: idx_bt_validacao1_bt_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_validacao1_bt_us ON bt_validacao USING btree (idusuario);


--
-- Name: idx_bt_vinculo1_bt_us; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_vinculo1_bt_us ON bt_vinculo USING btree (idusuario);


--
-- Name: idx_bt_vinculo2_bt_gr; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_vinculo2_bt_gr ON bt_vinculo USING btree (idgrupo);


--
-- Name: fk_bt_camposfixos1_bt_ob; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_camposfixos
    ADD CONSTRAINT fk_bt_camposfixos1_bt_ob FOREIGN KEY (idobra) REFERENCES bt_obra(idobra) ON DELETE CASCADE;


--
-- Name: fk_bt_camposfixos2_bt_et; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_camposfixos
    ADD CONSTRAINT fk_bt_camposfixos2_bt_et FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta) ON DELETE CASCADE;


--
-- Name: fk_bt_camposubficha1_bt_su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_camposubficha
    ADD CONSTRAINT fk_bt_camposubficha1_bt_su FOREIGN KEY (idetiqueta, subcampo) REFERENCES bt_subcampo(idetiqueta, subcampo) ON DELETE CASCADE;


--
-- Name: fk_bt_camposubficha2_bt_su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_camposubficha
    ADD CONSTRAINT fk_bt_camposubficha2_bt_su FOREIGN KEY (idficha, idsubficha) REFERENCES bt_subficha(idficha, idsubficha) ON DELETE CASCADE;


--
-- Name: fk_bt_consultacampo1_bt_su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_consultacampo
    ADD CONSTRAINT fk_bt_consultacampo1_bt_su FOREIGN KEY (idetiqueta, subcampo) REFERENCES bt_subcampo(idetiqueta, subcampo) ON DELETE CASCADE;


--
-- Name: fk_bt_consultacampo2_bt_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_consultacampo
    ADD CONSTRAINT fk_bt_consultacampo2_bt_co FOREIGN KEY (idconsulta) REFERENCES bt_consulta(idconsulta) ON DELETE CASCADE;


--
-- Name: fk_bt_direito1_bt_gr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_direito
    ADD CONSTRAINT fk_bt_direito1_bt_gr FOREIGN KEY (idgrupo) REFERENCES bt_grupo(idgrupo) ON DELETE CASCADE;


--
-- Name: fk_bt_direito2_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_direito
    ADD CONSTRAINT fk_bt_direito2_bt_op FOREIGN KEY (idoperacao) REFERENCES bt_operacao(idoperacao) ON DELETE CASCADE;


--
-- Name: fk_bt_direito3_bt_re; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_direito
    ADD CONSTRAINT fk_bt_direito3_bt_re FOREIGN KEY (idregracirculacao) REFERENCES bt_regracirculacao(idregracirculacao) ON DELETE CASCADE;


--
-- Name: fk_bt_emprestimo2_bt_ex; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_emprestimo
    ADD CONSTRAINT fk_bt_emprestimo2_bt_ex FOREIGN KEY (idexemplar) REFERENCES bt_exemplar(idexemplar);


--
-- Name: fk_bt_exemplar1_bt_es; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT fk_bt_exemplar1_bt_es FOREIGN KEY (idestado) REFERENCES bt_estado(idestado);


--
-- Name: fk_bt_exemplar2_bt_re; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT fk_bt_exemplar2_bt_re FOREIGN KEY (idregracirculacao) REFERENCES bt_regracirculacao(idregracirculacao);


--
-- Name: fk_bt_exemplar3_bt_un; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT fk_bt_exemplar3_bt_un FOREIGN KEY (idunidade) REFERENCES bt_unidade(idunidade);


--
-- Name: fk_bt_exemplar4_bt_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT fk_bt_exemplar4_bt_co FOREIGN KEY (idcolecao) REFERENCES bt_colecao(idcolecao);


--
-- Name: fk_bt_exemplar5_bt_ob; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_exemplar
    ADD CONSTRAINT fk_bt_exemplar5_bt_ob FOREIGN KEY (idobra) REFERENCES bt_obra(idobra);


--
-- Name: fk_bt_genero1_bt_fi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_genero
    ADD CONSTRAINT fk_bt_genero1_bt_fi FOREIGN KEY (idficha) REFERENCES bt_ficha(idficha);


--
-- Name: fk_bt_indicadores1_bt_ob; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_indicadores
    ADD CONSTRAINT fk_bt_indicadores1_bt_ob FOREIGN KEY (idobra) REFERENCES bt_obra(idobra) ON DELETE CASCADE;


--
-- Name: fk_bt_indicadores2_bt_et; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_indicadores
    ADD CONSTRAINT fk_bt_indicadores2_bt_et FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta) ON DELETE CASCADE;


--
-- Name: fk_bt_logoperacao2_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_logoperacao
    ADD CONSTRAINT fk_bt_logoperacao2_bt_op FOREIGN KEY (idoperacao) REFERENCES bt_operacao(idoperacao);


--
-- Name: fk_bt_logoperacaodetalhe1_bt_l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_logoperacaodetalhe
    ADD CONSTRAINT fk_bt_logoperacaodetalhe1_bt_l FOREIGN KEY (idlogoperacao) REFERENCES bt_logoperacao(idlogoperacao) ON DELETE CASCADE;


--
-- Name: fk_bt_material1_bt_su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_material
    ADD CONSTRAINT fk_bt_material1_bt_su FOREIGN KEY (idetiqueta, subcampo) REFERENCES bt_subcampo(idetiqueta, subcampo) ON DELETE CASCADE;


--
-- Name: fk_bt_material2_bt_ob; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_material
    ADD CONSTRAINT fk_bt_material2_bt_ob FOREIGN KEY (idobra) REFERENCES bt_obra(idobra);


--
-- Name: fk_bt_multa1_bt_em; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_multa
    ADD CONSTRAINT fk_bt_multa1_bt_em FOREIGN KEY (idemprestimo) REFERENCES bt_emprestimo(idemprestimo);


--
-- Name: fk_bt_notainfracao2_bt_in; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_notainfracao
    ADD CONSTRAINT fk_bt_notainfracao2_bt_in FOREIGN KEY (idinfracao) REFERENCES bt_infracao(idinfracao) ON DELETE CASCADE;


--
-- Name: fk_bt_obra1_bt_ge; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_obra
    ADD CONSTRAINT fk_bt_obra1_bt_ge FOREIGN KEY (idgenero) REFERENCES bt_genero(idgenero);


-- 
-- Name: fk_bt_obra1_bt_ed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_obra
    ADD CONSTRAINT fk_bt_obra1_bt_ed FOREIGN KEY (ideditora) REFERENCES bt_editora(ideditora);


--
-- Name: fk_bt_opcaolista1_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_opcaolista
    ADD CONSTRAINT fk_bt_opcaolista1_bt_op FOREIGN KEY (idopcao) REFERENCES bt_opcao(idopcao) ON DELETE CASCADE;


--
-- Name: fk_bt_politica2_bt_re; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_politica
    ADD CONSTRAINT fk_bt_politica2_bt_re FOREIGN KEY (idregracirculacao) REFERENCES bt_regracirculacao(idregracirculacao) ON DELETE CASCADE;


--
-- Name: fk_bt_politica3_bt_gr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_politica
    ADD CONSTRAINT fk_bt_politica3_bt_gr FOREIGN KEY (idgrupo) REFERENCES bt_grupo(idgrupo) ON DELETE CASCADE;


--
-- Name: fk_bt_posicao1_bt_et; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_posicao
    ADD CONSTRAINT fk_bt_posicao1_bt_et FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta) ON DELETE CASCADE;


--
-- Name: fk_bt_posicao2_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_posicao
    ADD CONSTRAINT fk_bt_posicao2_bt_op FOREIGN KEY (idopcao) REFERENCES bt_opcao(idopcao);


--
-- Name: fk_bt_posicaosubficha1_bt_su; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_posicaosubficha
    ADD CONSTRAINT fk_bt_posicaosubficha1_bt_su FOREIGN KEY (idficha, idsubficha) REFERENCES bt_subficha(idficha, idsubficha) ON DELETE CASCADE;


--
-- Name: fk_bt_posicaosubficha2_bt_po; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_posicaosubficha
    ADD CONSTRAINT fk_bt_posicaosubficha2_bt_po FOREIGN KEY (idetiqueta, posicao) REFERENCES bt_posicao(idetiqueta, posicao) ON DELETE CASCADE;


--
-- Name: fk_bt_reserva1_bt_si; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_reserva
    ADD CONSTRAINT fk_bt_reserva1_bt_si FOREIGN KEY (idsituacao) REFERENCES bt_situacao(idsituacao);


--
-- Name: fk_bt_reserva3_bt_ex; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_reserva
    ADD CONSTRAINT fk_bt_reserva3_bt_ex FOREIGN KEY (idexemplar) REFERENCES bt_exemplar(idexemplar);


--
-- Name: fk_bt_subcampo1_bt_et; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_subcampo
    ADD CONSTRAINT fk_bt_subcampo1_bt_et FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta) ON DELETE CASCADE;


--
-- Name: fk_bt_subcampo2_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_subcampo
    ADD CONSTRAINT fk_bt_subcampo2_bt_op FOREIGN KEY (idopcao) REFERENCES bt_opcao(idopcao);


--
-- Name: fk_bt_subficha1_bt_fi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_subficha
    ADD CONSTRAINT fk_bt_subficha1_bt_fi FOREIGN KEY (idficha) REFERENCES bt_ficha(idficha) ON DELETE CASCADE;


--
-- Name: fk_bt_transicao1_bt_es; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_transicao
    ADD CONSTRAINT fk_bt_transicao1_bt_es FOREIGN KEY (idestadopresente) REFERENCES bt_estado(idestado);


--
-- Name: fk_bt_transicao2_bt_es; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_transicao
    ADD CONSTRAINT fk_bt_transicao2_bt_es FOREIGN KEY (idestadofuturo) REFERENCES bt_estado(idestado);


--
-- Name: fk_bt_transicao3_bt_op; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_transicao
    ADD CONSTRAINT fk_bt_transicao3_bt_op FOREIGN KEY (idoperacao) REFERENCES bt_operacao(idoperacao);


--
-- Name: fk_bt_vinculo2_bt_gr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_vinculo
    ADD CONSTRAINT fk_bt_vinculo2_bt_gr FOREIGN KEY (idgrupo) REFERENCES bt_grupo(idgrupo);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

