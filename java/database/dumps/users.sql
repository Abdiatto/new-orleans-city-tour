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
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (user_id, username, password_hash, role, email_add) VALUES (1, 'user', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER', 'email1@domain.com');
INSERT INTO public.users (user_id, username, password_hash, role, email_add) VALUES (2, 'admin', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_ADMIN', 'email2@domain.com');
INSERT INTO public.users (user_id, username, password_hash, role, email_add) VALUES (3, 'ryan', '$2a$10$R.Z6/MEK.oQnZQCSTfw0fODFLFNS8FFt66KTGqHuhOT9vnCdbAI..', 'ROLE_USER', 'ryan.dean.barker@gmail.com');


--
-- PostgreSQL database dump complete
--

