--
-- PostgreSQL database dump
--

-- Started on 2009-02-06 15:54:58 BRST

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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


