ALTER TABLE bt_emprestimo ALTER COLUMN datahoraprevisaodevolucao TYPE timestamp with time zone;
ALTER TABLE bt_emprestimo ALTER COLUMN datahoradadevolucao TYPE timestamp with time zone;
ALTER TABLE bt_emprestimo ALTER COLUMN datahoradoemprestimo TYPE timestamp with time zone;

CREATE TABLE bt_assunto ( 
       idassunto                    INTEGER        NOT NULL,
       classificacao                VARCHAR(15),
       descricao                    VARCHAR(40)    NOT NULL
);

ALTER TABLE bt_assunto ADD CONSTRAINT PK_BT_ASSUNTO PRIMARY KEY(idassunto);

CREATE SEQUENCE seq_bt_assunto START WITH 1;

--
-- Name: bt_autor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_autor (
    idautor integer DEFAULT 0 NOT NULL,
    sobrenome character varying(100),
    prenome character varying(100),
    cutter character varying(40)
);


ALTER TABLE public.bt_autor OWNER TO postgres;

--
-- Name: pk_filmes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_autor
    ADD CONSTRAINT pk_filmes PRIMARY KEY (idautor);

CREATE SEQUENCE seq_bt_autor START WITH 1;

--
-- Name: bt_codigobarra; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_codigobarra (
    idcodigobarra integer NOT NULL,
    numcodigobarra character(10),
    descricao character(2)
);


ALTER TABLE public.bt_codigobarra OWNER TO postgres;

--
-- Name: bt_codigobarra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_codigobarra
    ADD CONSTRAINT bt_codigobarra_pkey PRIMARY KEY (idcodigobarra);

--
-- TOC entry 1785 (class 1259 OID 159119)
-- Dependencies: 5
-- Name: bt_editora; Type: TABLE; Schema: public; Owner: sigaept; Tablespace: 
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
-- TOC entry 2109 (class 2606 OID 159122)
-- Dependencies: 1785 1785
-- Name: pk_bt_editora; Type: CONSTRAINT; Schema: public; Owner: sigaept; Tablespace: 
--

ALTER TABLE ONLY bt_editora
   ADD CONSTRAINT pk_bt_editora PRIMARY KEY (ideditora);



-- Modificações na tabela bt_obra
ALTER TABLE bt_obra DROP COLUMN editora;
ALTER TABLE bt_obra ADD COLUMN ideditora integer;;
ALTER TABLE ONLY bt_obra
    ADD CONSTRAINT fk_bt_obra2_bt_ed FOREIGN KEY (ideditora) REFERENCES bt_editora(ideditora);
CREATE INDEX idx_bt_obra2_bt_ed ON bt_obra USING btree (ideditora);

ALTER TABLE bt_obra ADD COLUMN idautor integer;;
ALTER TABLE ONLY bt_obra
    ADD CONSTRAINT bt_obra_idautor_fkey FOREIGN KEY (idautor) REFERENCES bt_autor(idautor);

--
-- Name: bt_etiquetalombada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_etiquetalombada (
    idetiqueta integer NOT NULL,
    tipo character(1) NOT NULL,
    campo character(3) NOT NULL,
    subcampo character(1)
);


ALTER TABLE public.bt_etiquetalombada OWNER TO postgres;

--
-- Name: bt_etiquetalombada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_etiquetalombada
    ADD CONSTRAINT bt_etiquetalombada_pkey PRIMARY KEY (idetiqueta);

CREATE TABLE GA_SITUACAO ( 
       IDSITUACAO                    CHAR(2)        NOT NULL,
       SITUACAO                      VARCHAR(20));

ALTER TABLE GA_SITUACAO ADD CONSTRAINT PK_GA_SITUACAO PRIMARY KEY(IDSITUACAO);

CREATE TABLE GA_ALUNO ( 
       MATRICULA                     CHAR(20)       NOT NULL,
       ANOCONCL2GR                   VARCHAR(4),
       ANOINGRESSO                   VARCHAR(4)     NOT NULL,
       SEMINGRESSO                   VARCHAR(1)     NOT NULL,
       SITUACAOALUNO                 VARCHAR(15)    NOT NULL,
       IDTIPOINGRESSO                CHAR(2)        NOT NULL,
       IDMOTIVOSAIDA                 CHAR(2),
       IDSITUACAO                    CHAR(2)        NOT NULL,
       IDINSTITUICAO                 CHAR(4)        NOT NULL,
       IDPESSOA                      INTEGER        NOT NULL);

ALTER TABLE GA_ALUNO ADD CONSTRAINT PK_GA_ALUNO PRIMARY KEY(MATRICULA);

ALTER TABLE GA_ALUNO ADD CONSTRAINT FK_GA_ALUNO4_CM_IN FOREIGN KEY(IDINSTITUICAO) REFERENCES CM_INSTITUICAO;

ALTER TABLE GA_ALUNO ADD CONSTRAINT FK_GA_ALUNO5_CM_PE FOREIGN KEY(IDPESSOA) REFERENCES CM_PESSOA;

ALTER TABLE GA_ALUNO ADD CONSTRAINT FK_GA_ALUNO3_GA_SI FOREIGN KEY(IDSITUACAO) REFERENCES GA_SITUACAO;

alter table ga_aluno add escola2g integer; 
alter table ga_aluno add cidade2g integer; 
alter table ga_aluno add pais2g integer; 
alter table ga_aluno add idinstituicaodest integer; 
alter table ga_aluno add obs varchar(300); 
alter table ga_aluno add obsperiodo varchar(300); 

ALTER TABLE rh_provimento add column idsetor integer;
ALTER TABLE rh_provimento ADD constraint fk_iddsetor foreign key (idsetor) references cm_setor;

--
-- Name: bt_permitemulta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--
Create table bt_permitemulta
(
	idpermitemulta integer,
	permitemulta char,
	Constraint pk_permitemulta PRIMARY KEY (idpermitemulta),
	Check (permitemulta in ('M','N','P'))
	-- M: permite multa, N: não permite multa, P: não permite multa e com penalidade
);

ALTER TABLE bt_obra ADD COLUMN editora varchar(50);
ALTER TABLE bt_exemplar ALTER COLUMN idobra SET NOT NULL;
ALTER TABLE bt_validacao add column datapermissaoemprestimo date default current_date;
ALTER TABLE bt_usuarioexterno add column datapermissaoemprestimo date default current_date;

--
-- Name: bt_periodico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_periodico (
    idperiodico integer NOT NULL,
    ideditora integer,
    idgenero integer
);


ALTER TABLE public.bt_periodico OWNER TO postgres;

--
-- Name: bt_periodico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_periodico
    ADD CONSTRAINT bt_periodico_pkey PRIMARY KEY (idperiodico);


--
-- Name: bt_periodico_ideditora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_periodico
    ADD CONSTRAINT bt_periodico_ideditora_fkey FOREIGN KEY (ideditora) REFERENCES bt_editora(ideditora);


--
-- Name: bt_camposfixosperiodico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_camposfixosperiodico (
    idetiqueta integer NOT NULL,
    idperiodico integer NOT NULL,
    conteudo character varying(50) NOT NULL,
    periodico_temp integer,
    etiqueta_temp character varying(3)
);


ALTER TABLE public.bt_camposfixosperiodico OWNER TO postgres;

--
-- Name: pk_bt_camposfixosperiodico; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_camposfixosperiodico
    ADD CONSTRAINT pk_bt_camposfixosperiodico PRIMARY KEY (idetiqueta, idperiodico);


--
-- Name: idx_bt_camposfixosperiodico0_bt_pe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_camposfixosperiodico0_bt_pe ON bt_camposfixosperiodico USING btree (idperiodico);


--
-- Name: idx_bt_camposfixosperiodico1_bt_et; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_camposfixosperiodico1_bt_et ON bt_camposfixosperiodico USING btree (idetiqueta);


--
-- Name: bt_camposfixosperiodico_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_camposfixosperiodico
    ADD CONSTRAINT bt_camposfixosperiodico_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);



--
-- Name: bt_indicadoresperiodico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_indicadoresperiodico OWNER TO postgres;

--
-- Name: bt_indicadoresperiodico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_indicadoresperiodico
    ADD CONSTRAINT bt_indicadoresperiodico_pkey PRIMARY KEY (idindicador);


--
-- Name: idx_bt_indicadoresperiodico0_bt_et; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_indicadoresperiodico0_bt_et ON bt_indicadoresperiodico USING btree (idetiqueta);


--
-- Name: idx_bt_indicadoresperiodico1_bt_pe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_bt_indicadoresperiodico1_bt_pe ON bt_indicadoresperiodico USING btree (idperiodico);


--
-- Name: bt_indicadoresperiodico_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_indicadoresperiodico
    ADD CONSTRAINT bt_indicadoresperiodico_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);


--
-- Name: bt_indicadoresperiodico_idperiodico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_indicadoresperiodico
    ADD CONSTRAINT bt_indicadoresperiodico_idperiodico_fkey FOREIGN KEY (idperiodico) REFERENCES bt_periodico(idperiodico);

--
-- Name: bt_exemplarperiodico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_exemplarperiodico OWNER TO postgres;

--
-- Name: bt_exemplarperiodico_notacirculacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bt_exemplarperiodico_notacirculacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.bt_exemplarperiodico_notacirculacao_seq OWNER TO postgres;

--
-- Name: bt_exemplarperiodico_notacirculacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bt_exemplarperiodico_notacirculacao_seq OWNED BY bt_exemplarperiodico.notacirculacao;


--
-- Name: bt_exemplarperiodico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_pkey PRIMARY KEY (idexemplarperiodico);


--
-- Name: bt_exemplarperiodico_idcolecao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_idcolecao_fkey FOREIGN KEY (idcolecao) REFERENCES bt_colecao(idcolecao);


--
-- Name: bt_exemplarperiodico_idestado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_idestado_fkey FOREIGN KEY (idestado) REFERENCES bt_estado(idestado);


--
-- Name: bt_exemplarperiodico_idperiodico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_idperiodico_fkey FOREIGN KEY (idperiodico) REFERENCES bt_periodico(idperiodico);


--
-- Name: bt_exemplarperiodico_idregracirculacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_idregracirculacao_fkey FOREIGN KEY (idregracirculacao) REFERENCES bt_regracirculacao(idregracirculacao);


--
-- Name: bt_exemplarperiodico_idunidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_exemplarperiodico
    ADD CONSTRAINT bt_exemplarperiodico_idunidade_fkey FOREIGN KEY (idunidade) REFERENCES bt_unidade(idunidade);

--
-- Name: bt_artigo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_artigo (
    idartigo integer NOT NULL,
    outrosautores character varying(400),
    resumos character varying(3000),
    idexemplarperiodico integer
);

ALTER TABLE public.bt_artigo OWNER TO postgres;

--
-- Name: bt_artigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_artigo
    ADD CONSTRAINT bt_artigo_pkey PRIMARY KEY (idartigo);


--
-- Name: bt_artigo_idexemplarperiodico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_artigo
    ADD CONSTRAINT bt_artigo_idexemplarperiodico_fkey FOREIGN KEY (idexemplarperiodico) REFERENCES bt_exemplarperiodico(idexemplarperiodico);

--
-- Name: bt_materialartigo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_materialartigo OWNER TO postgres;

--
-- Name: bt_materialartigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_materialartigo
    ADD CONSTRAINT bt_materialartigo_pkey PRIMARY KEY (idmaterial);


--
-- Name: bt_materialartigo_idartigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_materialartigo
    ADD CONSTRAINT bt_materialartigo_idartigo_fkey FOREIGN KEY (idartigo) REFERENCES bt_artigo(idartigo);


--
-- Name: bt_materialartigo_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_materialartigo
    ADD CONSTRAINT bt_materialartigo_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);
--
-- Name: bt_material_assunto_artigo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_material_assunto_artigo (
    idmaterialassuntoartigo integer NOT NULL,
    idartigo integer,
    idassunto integer,
    idetiqueta integer,
    ocorrencia integer
);


ALTER TABLE public.bt_material_assunto_artigo OWNER TO postgres;

--
-- Name: bt_material_assunto_artigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_material_assunto_artigo
    ADD CONSTRAINT bt_material_assunto_artigo_pkey PRIMARY KEY (idmaterialassuntoartigo);


--
-- Name: bt_material_assunto_artigo_idartigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_material_assunto_artigo
    ADD CONSTRAINT bt_material_assunto_artigo_idartigo_fkey FOREIGN KEY (idartigo) REFERENCES bt_artigo(idartigo);


--
-- Name: bt_material_assunto_artigo_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_material_assunto_artigo
    ADD CONSTRAINT bt_material_assunto_artigo_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);


--
-- Name: bt_material_autor_artigo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bt_material_autor_artigo (
    idartigo integer,
    idautor integer,
    idetiqueta integer,
    ocorrencia integer,
    idmaterialautorartigo integer NOT NULL
);


ALTER TABLE public.bt_material_autor_artigo OWNER TO postgres;

--
-- Name: bt_material_autor_artigo_idmaterialautorartigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bt_material_autor_artigo_idmaterialautorartigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.bt_material_autor_artigo_idmaterialautorartigo_seq OWNER TO postgres;

--
-- Name: bt_material_autor_artigo_idmaterialautorartigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bt_material_autor_artigo_idmaterialautorartigo_seq OWNED BY bt_material_autor_artigo.idmaterialautorartigo;


--
-- Name: idmaterialautorartigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE bt_material_autor_artigo ALTER COLUMN idmaterialautorartigo SET DEFAULT nextval('bt_material_autor_artigo_idmaterialautorartigo_seq'::regclass);


--
-- Name: bt_material_autor_artigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_material_autor_artigo
    ADD CONSTRAINT bt_material_autor_artigo_pkey PRIMARY KEY (idmaterialautorartigo);


--
-- Name: bt_material_autor_artigo_idartigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_material_autor_artigo
    ADD CONSTRAINT bt_material_autor_artigo_idartigo_fkey FOREIGN KEY (idartigo) REFERENCES bt_artigo(idartigo);


--
-- Name: bt_material_autor_artigo_idautor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_material_autor_artigo
    ADD CONSTRAINT bt_material_autor_artigo_idautor_fkey FOREIGN KEY (idautor) REFERENCES bt_autor(idautor);


--
-- Name: bt_material_autor_artigo_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_material_autor_artigo
    ADD CONSTRAINT bt_material_autor_artigo_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);

--
-- Name: bt_materialperiodico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.bt_materialperiodico OWNER TO postgres;

--
-- Name: bt_materialperiodico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bt_materialperiodico
    ADD CONSTRAINT bt_materialperiodico_pkey PRIMARY KEY (idmaterial);


--
-- Name: bt_materialperiodico_idetiqueta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_materialperiodico
    ADD CONSTRAINT bt_materialperiodico_idetiqueta_fkey FOREIGN KEY (idetiqueta) REFERENCES bt_etiqueta(idetiqueta);


--
-- Name: bt_materialperiodico_idperiodico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bt_materialperiodico
    ADD CONSTRAINT bt_materialperiodico_idperiodico_fkey FOREIGN KEY (idperiodico) REFERENCES bt_periodico(idperiodico);


CREATE TABLE bt_exportacao_temp
(
  idobra integer NOT NULL,
  titulo text
)