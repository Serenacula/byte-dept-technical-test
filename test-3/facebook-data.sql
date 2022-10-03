--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.4

-- Started on 2022-09-29 14:45:24 BST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 16387)
-- Name: facebook_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA facebook_data;


ALTER SCHEMA facebook_data OWNER TO postgres;

--
-- TOC entry 824 (class 1247 OID 16402)
-- Name: ad_referral; Type: TYPE; Schema: facebook_data; Owner: postgres
--

CREATE TYPE facebook_data.ad_referral AS (
	source character varying,
	type character varying,
	ad_id character varying
);


ALTER TYPE facebook_data.ad_referral OWNER TO postgres;

--
-- TOC entry 211 (class 1255 OID 16403)
-- Name: update_timestamp(); Type: FUNCTION; Schema: facebook_data; Owner: postgres
--

CREATE FUNCTION facebook_data.update_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            NEW.updated_at = NOW(); 
            RETURN NEW;
        END;
    $$;


ALTER FUNCTION facebook_data.update_timestamp() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16388)
-- Name: facebook_data_table; Type: TABLE; Schema: facebook_data; Owner: postgres
--

CREATE TABLE facebook_data.facebook_data_table (
    "PSID" uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    profile_pic text,
    gender character varying,
    last_ad_referral facebook_data.ad_referral
);


ALTER TABLE facebook_data.facebook_data_table OWNER TO postgres;

--
-- TOC entry 3577 (class 0 OID 16388)
-- Dependencies: 209
-- Data for Name: facebook_data_table; Type: TABLE DATA; Schema: facebook_data; Owner: postgres
--

COPY facebook_data.facebook_data_table ("PSID", created_at, updated_at, first_name, last_name, profile_pic, gender, last_ad_referral) FROM stdin;
\.


--
-- TOC entry 3437 (class 2620 OID 16405)
-- Name: facebook_data_table update_timestamp_trigger; Type: TRIGGER; Schema: facebook_data; Owner: postgres
--

CREATE TRIGGER update_timestamp_trigger BEFORE INSERT OR DELETE OR UPDATE OF first_name, last_name, profile_pic, gender, last_ad_referral ON facebook_data.facebook_data_table FOR EACH ROW EXECUTE FUNCTION facebook_data.update_timestamp();


-- Completed on 2022-09-29 14:45:24 BST

--
-- PostgreSQL database dump complete
--

