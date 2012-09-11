--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- PostgreSQL database dump complete
--
--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- PostgreSQL database dump complete
--
--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- PostgreSQL database dump complete
--
--

INSERT INTO bt_etiqueta (idetiqueta,tag,indicador1,indicador2,mnemonico,descricao,observacao,temrepeticoes,temsubcampos,estaativo,emlistas, emdemonstracao,obsoleto) VALUES (211,099,0,0,0,'SECS',0,0,1,0,0,0,0);

INSERT INTO bt_etiqueta (idetiqueta,tag,indicador1,indicador2,mnemonico,descricao,observacao,temrepeticoes,temsubcampos,estaativo,emlistas, emdemonstracao,obsoleto) VALUES (212,097,0,0,0,'Avaliação Capes',0,0,1,0,0,0,0);

INSERT INTO bt_etiqueta (idetiqueta,tag,indicador1,indicador2,mnemonico,descricao,observacao,temrepeticoes,temsubcampos,estaativo,emlistas, emdemonstracao,obsoleto) VALUES (213,098,0,0,0,'CCN',0,0,1,0,0,0,0);

--Povoamento bt_subficha

INSERT INTO bt_posicaosubficha VALUES (1, '006', 6, 10);
INSERT INTO bt_posicaosubficha VALUES (1, '007', 6, 10);
INSERT INTO bt_posicaosubficha VALUES (1, '008', 6, 10);
INSERT INTO bt_posicaosubficha VALUES (1, '017', 6, 10);
INSERT INTO bt_posicaosubficha VALUES (1, '018', 6, 10);
INSERT INTO bt_posicaosubficha VALUES (1, '019', 6, 10);
INSERT INTO bt_posicaosubficha VALUES (7, '006', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (1, '005', 6, 10);
INSERT INTO bt_posicaosubficha VALUES (7, '015', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '018', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '019', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '020', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '021', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '022', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '023', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '024', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '025', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '026', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '027', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '028', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '029', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '030', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '031', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '032', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '033', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '034', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '035', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '038', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '039', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '000', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '007', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (7, '011', 6, 12);
INSERT INTO bt_posicaosubficha VALUES (5, '000', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '001', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '002', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '003', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '004', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '005', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '006', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '007', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '008', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '009', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '010', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '011', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '012', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '013', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '014', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '015', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '016', 6,11);
INSERT INTO bt_posicaosubficha VALUES (5, '017', 6,11);
