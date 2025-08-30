--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: exploration_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exploration_mission (
    exploration_mission_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    duration_in_days integer NOT NULL,
    is_manned boolean NOT NULL
);


ALTER TABLE public.exploration_mission OWNER TO freecodecamp;

--
-- Name: exploration_mission_exploration_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exploration_mission_exploration_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exploration_mission_exploration_mission_id_seq OWNER TO freecodecamp;

--
-- Name: exploration_mission_exploration_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exploration_mission_exploration_mission_id_seq OWNED BY public.exploration_mission.exploration_mission_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    has_black_hole boolean NOT NULL,
    age_in_millions_of_years integer,
    size integer
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
    name character varying(100) NOT NULL,
    radius integer,
    is_rocky boolean NOT NULL,
    planet_id integer
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
    name character varying(100) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    diameter_km integer,
    orbital_period numeric(6,2),
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_type text NOT NULL,
    mass numeric(10,2) NOT NULL,
    visible boolean NOT NULL,
    galaxy_id integer
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
-- Name: exploration_mission exploration_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration_mission ALTER COLUMN exploration_mission_id SET DEFAULT nextval('public.exploration_mission_exploration_mission_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: exploration_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exploration_mission VALUES (1, 'Apollo 11', 'Primera misión tripulada a la Luna', 8, true);
INSERT INTO public.exploration_mission VALUES (2, 'Voyager 1', 'Misión no tripulada de exploración interestelar', 10000, false);
INSERT INTO public.exploration_mission VALUES (3, 'Curiosity', 'Exploración de Marte con rover', 3000, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 'Espiral', true, 13600, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 'Espiral', true, 14000, 110000);
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 'Espiral', false, 12000, 60000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular', true, 10000, 50000);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Elíptica', true, 13000, 130000);
INSERT INTO public.galaxy VALUES (6, 'Canis Major', 'Irregular', false, 9000, 40000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1737, true, 1);
INSERT INTO public.moon VALUES (2, 'Fobos', 11, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, true, 2);
INSERT INTO public.moon VALUES (4, 'Ío', 1821, true, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 1561, true, 3);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 2634, true, 3);
INSERT INTO public.moon VALUES (7, 'Calisto', 2410, true, 3);
INSERT INTO public.moon VALUES (8, 'Titán', 2575, true, 4);
INSERT INTO public.moon VALUES (9, 'Encélado', 252, true, 4);
INSERT INTO public.moon VALUES (10, 'Rhea', 764, true, 4);
INSERT INTO public.moon VALUES (11, 'Mimas', 198, true, 4);
INSERT INTO public.moon VALUES (12, 'Dione', 561, true, 4);
INSERT INTO public.moon VALUES (13, 'Tethys', 531, true, 4);
INSERT INTO public.moon VALUES (14, 'Iapetus', 734, true, 4);
INSERT INTO public.moon VALUES (15, 'Miranda', 235, true, 5);
INSERT INTO public.moon VALUES (16, 'Tritón', 1353, true, 5);
INSERT INTO public.moon VALUES (17, 'Charon', 606, true, 5);
INSERT INTO public.moon VALUES (18, 'Ariel', 578, true, 5);
INSERT INTO public.moon VALUES (19, 'Umbriel', 584, true, 5);
INSERT INTO public.moon VALUES (20, 'Oberón', 761, true, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', true, true, 12742, 3.10, 1);
INSERT INTO public.planet VALUES (2, 'Marte', false, true, 6779, 6.00, 1);
INSERT INTO public.planet VALUES (3, 'Júpiter', false, true, 139820, 4.10, 1);
INSERT INTO public.planet VALUES (4, 'Saturno', false, true, 116460, 1.10, 1);
INSERT INTO public.planet VALUES (5, 'Mercurio', false, true, 4879, 1.10, 1);
INSERT INTO public.planet VALUES (6, 'Venus', false, true, 12104, 1.10, 1);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', false, true, 24000, 6.00, 2);
INSERT INTO public.planet VALUES (8, 'Gliese 581g', false, true, 14000, 3.00, 4);
INSERT INTO public.planet VALUES (9, 'HD 209458b', false, true, 143000, 3.50, 2);
INSERT INTO public.planet VALUES (10, 'Tau Ceti f', false, true, 16000, 5.00, 2);
INSERT INTO public.planet VALUES (11, 'LHS 1140b', false, true, 15000, 2.70, 3);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', false, true, 12000, 4.05, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Enana amarilla', 1.00, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Secuencia principal', 2.02, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Supergigante roja', 20.00, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Enana roja', 0.12, false, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'Blanca azulada', 2.10, true, 2);
INSERT INTO public.star VALUES (6, 'Rigel', 'Supergigante azul', 21.00, true, 2);


--
-- Name: exploration_mission_exploration_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exploration_mission_exploration_mission_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: exploration_mission exploration_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration_mission
    ADD CONSTRAINT exploration_mission_name_key UNIQUE (name);


--
-- Name: exploration_mission exploration_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration_mission
    ADD CONSTRAINT exploration_mission_pkey PRIMARY KEY (exploration_mission_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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

