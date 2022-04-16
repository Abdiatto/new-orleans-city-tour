--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8
-- Dumped by pg_dump version 12.8

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
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.districts (district_id, district_name) VALUES (1, 'French Quarter');
INSERT INTO public.districts (district_id, district_name) VALUES (2, 'Uptown');
INSERT INTO public.districts (district_id, district_name) VALUES (3, 'Treme');
INSERT INTO public.districts (district_id, district_name) VALUES (4, 'Arts/Warehouse');
INSERT INTO public.districts (district_id, district_name) VALUES (5, 'Marigny/Bywater');
INSERT INTO public.districts (district_id, district_name) VALUES (6, 'Downtown');
INSERT INTO public.districts (district_id, district_name) VALUES (7, 'Mid-City');
INSERT INTO public.districts (district_id, district_name) VALUES (8, 'Algiers');
INSERT INTO public.districts (district_id, district_name) VALUES (9, 'Esplanade Ridge');
INSERT INTO public.districts (district_id, district_name) VALUES (10, 'Lakeview');
INSERT INTO public.districts (district_id, district_name) VALUES (11, 'Gentilly');
INSERT INTO public.districts (district_id, district_name) VALUES (12, 'Metairie/Kenner');
INSERT INTO public.districts (district_id, district_name) VALUES (13, 'Westbank');


--
-- Name: districts_district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.districts_district_id_seq', 13, true);


--
-- PostgreSQL database dump complete
--

