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
-- PostgreSQL database dump complete
--

