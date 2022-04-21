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

INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (1, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411238/uw2-public-demo-app/fair-grounds-race-course-slots_jkj3ve.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (2, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411235/uw2-public-demo-app/new-orleans-jazz-market_okzugs.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (3, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411236/uw2-public-demo-app/the-national-wwii-museum_mcacff.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (4, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411236/uw2-public-demo-app/pitot-house_xgtclz.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (5, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411233/uw2-public-demo-app/new-canel-lighthouse_ihyzjz.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (10, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411236/uw2-public-demo-app/audubon-zoo-new-orleans_bgxvqf.webp', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (11, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411239/uw2-public-demo-app/lafitte-greenway-new-orleans_m8oxvt.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (12, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411239/uw2-public-demo-app/congo-square_tumqpn.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (13, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411234/uw2-public-demo-app/new-orleans-holocaust-museum_wljj7q.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (14, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411235/uw2-public-demo-app/New-Orleans-Swamp-Boat-Tour_menwbf.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (15, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411234/uw2-public-demo-app/new-orleans-audubon-aquarium-of-america_z9fvqb.webp', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (16, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411238/uw2-public-demo-app/French_Quarter_New_Orleans_hr3h2b.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (17, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411236/uw2-public-demo-app/preservation-hall_czti2b.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (18, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411237/uw2-public-demo-app/Fritzels-_Jazz-_Club_d8qju8.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (19, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411236/uw2-public-demo-app/Commanders-Palace_rtoopo.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (20, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411236/uw2-public-demo-app/cafe-du-monde_nzpsw8.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (21, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411235/uw2-public-demo-app/new-orleans-city-park_ginztp.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (22, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650411236/uw2-public-demo-app/bourbon-street_we1fra.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (6, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650463151/uw2-public-demo-app/AAM-09.13.18-l-8039-e1566912107888-1366x823_wdkxdw.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (7, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650463170/uw2-public-demo-app/5dd75a99a8e4c_uuyxnw.webp', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (8, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650463190/uw2-public-demo-app/MarkJSindlerLSMPhoto_20110302_MG_2936_97776C47-6256-4225-881D19A220A62A4A_359a8e24-ec0b-408a-a7d694627e50a54c_nie6b6.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (9, 2, 'https://res.cloudinary.com/dd7jkh7y6/image/upload/v1650463203/uw2-public-demo-app/6566947_aHQ3guUIZnAjRa5P16OGfCiLs7eRRsl2V2jZYG5OyBQ_zyawi3.jpg', true);


--
-- Name: photos_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photos_photo_id_seq', 22, true);


--
-- PostgreSQL database dump complete
--

