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


--
-- PostgreSQL database dump complete
--

