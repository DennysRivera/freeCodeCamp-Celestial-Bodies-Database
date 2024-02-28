--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1709160085979', 2, 74);
INSERT INTO public.users VALUES (1, 'user_1709160085980', 5, 38);
INSERT INTO public.users VALUES (17, 'user_1709160414588', 2, 226);
INSERT INTO public.users VALUES (27, 'user_1709160573961', 2, 518);
INSERT INTO public.users VALUES (4, 'user_1709160091335', 2, 679);
INSERT INTO public.users VALUES (16, 'user_1709160414589', 5, 190);
INSERT INTO public.users VALUES (15, 'dennys', 3, 1);
INSERT INTO public.users VALUES (3, 'user_1709160091336', 5, 625);
INSERT INTO public.users VALUES (26, 'user_1709160573962', 5, 25);
INSERT INTO public.users VALUES (6, 'user_1709160094042', 2, 201);
INSERT INTO public.users VALUES (5, 'user_1709160094043', 5, 124);
INSERT INTO public.users VALUES (19, 'user_1709160476187', 2, 324);
INSERT INTO public.users VALUES (18, 'user_1709160476188', 5, 31);
INSERT INTO public.users VALUES (8, 'user_1709160132292', 2, 788);
INSERT INTO public.users VALUES (7, 'user_1709160132293', 5, 272);
INSERT INTO public.users VALUES (21, 'user_1709160504343', 2, 105);
INSERT INTO public.users VALUES (20, 'user_1709160504344', 5, 4);
INSERT INTO public.users VALUES (10, 'user_1709160135659', 2, 543);
INSERT INTO public.users VALUES (9, 'user_1709160135660', 5, 87);
INSERT INTO public.users VALUES (23, 'user_1709160518591', 2, 682);
INSERT INTO public.users VALUES (12, 'user_1709160138465', 2, 683);
INSERT INTO public.users VALUES (22, 'user_1709160518592', 5, 610);
INSERT INTO public.users VALUES (11, 'user_1709160138466', 5, 95);
INSERT INTO public.users VALUES (14, 'user_1709160147919', 2, 396);
INSERT INTO public.users VALUES (25, 'user_1709160523182', 2, 377);
INSERT INTO public.users VALUES (13, 'user_1709160147920', 5, 45);
INSERT INTO public.users VALUES (24, 'user_1709160523183', 5, 163);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 27, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

