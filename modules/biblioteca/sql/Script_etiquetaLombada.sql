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


--
-- PostgreSQL database dump complete
--

