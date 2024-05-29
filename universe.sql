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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(4,1),
    named_by character varying(50)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(4,1),
    planet_id integer NOT NULL,
    named_by character varying(50)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(300),
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(4,1),
    star_id integer NOT NULL,
    named_by character varying(50)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: scientist; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scientist (
    scientist_id integer NOT NULL,
    name character varying(30),
    specialization character varying(30),
    nobel_prize character varying(30),
    age integer NOT NULL
);


ALTER TABLE public.scientist OWNER TO freecodecamp;

--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scientist_scientist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scientist_scientist_id_seq OWNER TO freecodecamp;

--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scientist_scientist_id_seq OWNED BY public.scientist.scientist_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(4,1),
    galaxy_id integer NOT NULL,
    named_by character varying(50)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: scientist scientist_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist ALTER COLUMN scientist_id SET DEFAULT nextval('public.scientist_scientist_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy No.1', 'Lorem', false, true, 1, 1.3, NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy No.2', 'Lorem', false, true, 2, 2.4, NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy No.3', 'Lorem', false, true, 3, 3.2, NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy No.4', 'Lorem', false, true, 4, 4.5, NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy No.5', 'Lorem', false, true, 5, 5.2, NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy No.6', 'Lorem', false, true, 6, 6.5, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon 1', NULL, false, true, NULL, NULL, 1, NULL);
INSERT INTO public.moon VALUES (2, 'moon 2', NULL, false, true, NULL, NULL, 2, NULL);
INSERT INTO public.moon VALUES (3, 'moon 3', NULL, false, true, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (4, 'moon 4', NULL, false, true, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (5, 'moon 5', NULL, false, true, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (6, 'moon 6', NULL, false, true, NULL, NULL, 6, NULL);
INSERT INTO public.moon VALUES (7, 'moon 7', NULL, false, true, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES (8, 'moon 8', NULL, false, true, NULL, NULL, 8, NULL);
INSERT INTO public.moon VALUES (9, 'moon 9', NULL, false, true, NULL, NULL, 9, NULL);
INSERT INTO public.moon VALUES (10, 'moon 10', NULL, false, true, NULL, NULL, 10, NULL);
INSERT INTO public.moon VALUES (11, 'moon 11', NULL, false, true, NULL, NULL, 1, NULL);
INSERT INTO public.moon VALUES (12, 'moon 12', NULL, false, true, NULL, NULL, 2, NULL);
INSERT INTO public.moon VALUES (13, 'moon 13', NULL, false, true, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (14, 'moon 14', NULL, false, true, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (15, 'moon 15', NULL, false, true, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (16, 'moon 16', NULL, false, true, NULL, NULL, 6, NULL);
INSERT INTO public.moon VALUES (17, 'moon 17', NULL, false, true, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES (18, 'moon 18', NULL, false, true, NULL, NULL, 8, NULL);
INSERT INTO public.moon VALUES (19, 'moon 19', NULL, false, true, NULL, NULL, 9, NULL);
INSERT INTO public.moon VALUES (20, 'moon 20', NULL, false, true, NULL, NULL, 10, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', NULL, false, true, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (2, 'planet 2', NULL, false, true, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (3, 'planet 3', NULL, false, true, NULL, NULL, 3, NULL);
INSERT INTO public.planet VALUES (4, 'planet 4', NULL, false, true, NULL, NULL, 4, NULL);
INSERT INTO public.planet VALUES (5, 'planet 5', NULL, false, true, NULL, NULL, 5, NULL);
INSERT INTO public.planet VALUES (6, 'planet 6', NULL, false, true, NULL, NULL, 6, NULL);
INSERT INTO public.planet VALUES (7, 'planet 7', NULL, false, true, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (8, 'planet 8', NULL, false, true, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (9, 'planet 9', NULL, false, true, NULL, NULL, 3, NULL);
INSERT INTO public.planet VALUES (10, 'planet 10', NULL, false, true, NULL, NULL, 4, NULL);
INSERT INTO public.planet VALUES (11, 'planet 11', NULL, false, true, NULL, NULL, 5, NULL);
INSERT INTO public.planet VALUES (12, 'planet 12', NULL, false, true, NULL, NULL, 6, NULL);


--
-- Data for Name: scientist; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scientist VALUES (1, 'name 1', NULL, NULL, 45);
INSERT INTO public.scientist VALUES (2, 'name 2', NULL, NULL, 54);
INSERT INTO public.scientist VALUES (3, 'name 3', NULL, NULL, 72);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star 1', NULL, false, true, NULL, NULL, 1, NULL);
INSERT INTO public.star VALUES (2, 'star 2', NULL, false, true, NULL, NULL, 2, NULL);
INSERT INTO public.star VALUES (3, 'star 3', NULL, false, true, NULL, NULL, 3, NULL);
INSERT INTO public.star VALUES (4, 'star 4', NULL, false, true, NULL, NULL, 4, NULL);
INSERT INTO public.star VALUES (5, 'star 5', NULL, false, true, NULL, NULL, 5, NULL);
INSERT INTO public.star VALUES (6, 'star 6', NULL, false, true, NULL, NULL, 6, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scientist_scientist_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_named_by_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_named_by_key UNIQUE (named_by);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_named_by_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_named_by_key UNIQUE (named_by);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_named_by_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_named_by_key UNIQUE (named_by);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: scientist scientist_nobel_prize_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT scientist_nobel_prize_key UNIQUE (nobel_prize);


--
-- Name: scientist scientist_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT scientist_pkey PRIMARY KEY (scientist_id);


--
-- Name: star star_named_by_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_named_by_key UNIQUE (named_by);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

