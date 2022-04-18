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
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (1, 2, 'fair-grounds-race-course-slots.jpg ', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (2, 2, 'new-orleans-jazz-market.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (3, 2, 'the-national-wwii-museum.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (4, 2, 'pitot-house.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (5, 2, 'new-canel-lighthouse.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (6, 2, 'https://whitewallapi.wpenginepowered.com/wp-content/uploads/2019/08/AAM-09.13.18-l-8039-e1566912107888-1366x823.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (7, 2, 'https://bloximages.newyork1.vip.townnews.com/nola.com/content/tncms/assets/v3/editorial/9/43/94339bff-3384-5a7d-bba1-a660fcb46808/5dd75a99a8e4c.image.jpg?crop=1567%2C1175%2C98%2C0&resize=1567%2C1175&order=crop%2Cresize', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (8, 2, 'https://assets.simpleviewinc.com/simpleview/image/fetch/c_fill,g_auto,h_500,q_50,w_1400/https://assets.simpleviewinc.com/simpleview/image/upload/crm/neworleans/MarkJSindlerLSMPhoto_20110302_MG_2936_97776C47-6256-4225-881D19A220A62A4A_359a8e24-ec0b-408a-a7d694627e50a54c.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (9, 2, 'https://ir.4sqi.net/img/general/original/6566947_aHQ3guUIZnAjRa5P16OGfCiLs7eRRsl2V2jZYG5OyBQ.jpg', true);


--
-- Name: photos_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photos_photo_id_seq', 9, true);


--
-- PostgreSQL database dump complete
--

