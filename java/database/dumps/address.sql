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
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (1, '1751 Gentilly Blvd', '', 'New Orleans', 'LA', 70119);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (2, '1436 Oretha Castle Haley Blvd', '', 'New Orleans', 'LA', 70113);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (3, '945 Magazine St', '', 'New Orleans', 'LA', 70130);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (4, '1440 Moss St', '', 'New Orleans', 'LA', 70119);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (5, '8001 Lakeshore Dr.', '', 'New Orleans', 'LA', 70124);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (6, '1418 Governor Nicholls St', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (7, '500 Chartres St', '', 'New Orleans', 'LA', 70130);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (8, '400 Esplanade Ave', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (9, '701 Chartres St.', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (10, '6500 Magazine St', '', 'New Orleans', 'LA', 70118);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (11, 'Lafitte Greenway', '', 'New Orleans', 'LA', 70119);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (12, '701 N Rampart St', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (13, 'River St', '', 'New Orleans', 'LA', 70114);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (14, '930 Poydras St #1106', '', 'New Orleans', 'LA', 70112);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (15, '1 Canal St', '', 'New Orleans', 'LA', 70130);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (16, '600 Bourbon St, New Orleans', '', 'New Orleans', 'LA', 70130);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (17, '726 St Peter', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (18, '733 Bourbon St', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (19, '1403 Washington Ave', '', 'New Orleans', 'LA', 70130);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (20, '1039 Decatur St', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (21, '1 Palm Dr', '', 'New Orleans', 'LA', 70124);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (22, '700 Bourbon', '', 'New Orleans', 'LA', 70116);


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_address_id_seq', 22, true);


--
-- PostgreSQL database dump complete
--

