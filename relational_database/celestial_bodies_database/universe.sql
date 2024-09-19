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
-- Name: civilization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilization (
    civilization_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    kardashev_scale integer,
    age_in_years numeric(19,0) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.civilization OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.civilization_civilization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civilization_civilization_id_seq OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.civilization_civilization_id_seq OWNED BY public.civilization.civilization_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years integer,
    galaxy_types character varying(30) NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years integer,
    distance_from_planet_in_km numeric(19,2) NOT NULL,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    has_life boolean,
    is_spherical boolean,
    planet_types character varying(30),
    description text,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years integer,
    galaxy_id integer NOT NULL
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
-- Name: civilization civilization_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization ALTER COLUMN civilization_id SET DEFAULT nextval('public.civilization_civilization_id_seq'::regclass);


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
-- Data for Name: civilization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilization VALUES (4, 'Atlantean', 'An advanced civilization known for its remarkable engineering and maritime skills.', 2, 10000, 28);
INSERT INTO public.civilization VALUES (5, 'Martian', 'A civilization that evolved on Mars, specializing in sustainable technologies.', 1, 5000, 30);
INSERT INTO public.civilization VALUES (6, 'Venusian', 'A unique civilization adapted to the extreme conditions of Venus.', 2, 8000, 29);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'AndromedaAlt', NULL, 30, 'Alt M31');
INSERT INTO public.galaxy VALUES (2, 'BodeA', NULL, 40, 'Alt M21');
INSERT INTO public.galaxy VALUES (3, 'CigarA', NULL, 21, 'Alt D11');
INSERT INTO public.galaxy VALUES (4, 'HoagA', NULL, 10, 'Alt X21');
INSERT INTO public.galaxy VALUES (5, 'SombreroA', NULL, 12, 'Alt S91');
INSERT INTO public.galaxy VALUES (6, 'TadpoleA', NULL, 4, 'Alt T10');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth''s only natural satellite.', 1, 384400.00, true, 25);
INSERT INTO public.moon VALUES (2, 'Io', 'A volcanic moon of Jupiter with over 400 active volcanoes.', 1, 421700.00, true, 26);
INSERT INTO public.moon VALUES (3, 'Europa', 'An icy moon of Jupiter, potential subsurface ocean.', 1, 671100.00, true, 27);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon in the solar system, larger than Mercury.', 1, 1070000.00, true, 28);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Old and heavily cratered, it has a thin atmosphere.', 1, 1883000.00, true, 29);
INSERT INTO public.moon VALUES (6, 'Titan', 'Largest moon of Saturn, has a dense atmosphere and lakes of methane.', 1, 1222000.00, true, 30);
INSERT INTO public.moon VALUES (7, 'Rhea', 'Second largest moon of Saturn, with a wispy atmosphere.', 1, 527600.00, true, 31);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Known for its geysers, believed to have subsurface ocean.', 1, 2379500.00, true, 32);
INSERT INTO public.moon VALUES (9, 'Triton', 'Largest moon of Neptune, geologically active with geysers.', 1, 354800.00, true, 33);
INSERT INTO public.moon VALUES (10, 'Charon', 'Largest moon of Pluto, shares a gravitational center with Pluto.', 1, 19570.00, true, 34);
INSERT INTO public.moon VALUES (11, 'Miranda', 'A moon of Uranus with a diverse landscape.', 1, 129000.00, true, 35);
INSERT INTO public.moon VALUES (12, 'Titania', 'Largest moon of Uranus, features large canyons and cliffs.', 1, 436300.00, true, 36);
INSERT INTO public.moon VALUES (13, 'Oberon', 'Second largest moon of Uranus, heavily cratered surface.', 1, 583500.00, true, 25);
INSERT INTO public.moon VALUES (14, 'Phobos', 'Mars'' larger moon, has a highly irregular shape.', 1, 6000.00, true, 26);
INSERT INTO public.moon VALUES (15, 'Deimos', 'Smaller moon of Mars, also irregular in shape.', 1, 23460.00, true, 27);
INSERT INTO public.moon VALUES (16, 'Dione', 'A moon of Saturn, characterized by bright icy terrain.', 1, 561500.00, true, 28);
INSERT INTO public.moon VALUES (17, 'Iapetus', 'Known for its two-tone coloration.', 1, 3560000.00, true, 29);
INSERT INTO public.moon VALUES (18, 'Mimas', 'Resembles the Death Star from Star Wars due to its large crater.', 1, 1856000.00, true, 30);
INSERT INTO public.moon VALUES (19, 'Ceres', 'Dwarf planet with a spherical shape, located in the asteroid belt.', 1, 413000000.00, true, 31);
INSERT INTO public.moon VALUES (20, 'Eris', 'Dwarf planet, one of the largest known in the solar system.', 1, 960000000.00, true, 32);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'XJ20', 1, true, true, NULL, NULL, 8);
INSERT INTO public.planet VALUES (26, 'XX20', 1, false, true, NULL, NULL, 5);
INSERT INTO public.planet VALUES (27, 'XJ22', 1, false, false, NULL, NULL, 3);
INSERT INTO public.planet VALUES (28, 'XJ21', 1, false, false, NULL, NULL, 4);
INSERT INTO public.planet VALUES (29, 'XM20', 1, true, true, NULL, NULL, 5);
INSERT INTO public.planet VALUES (30, 'XJ30', 1, false, true, NULL, NULL, 6);
INSERT INTO public.planet VALUES (31, 'XJ31', 1, false, false, NULL, NULL, 6);
INSERT INTO public.planet VALUES (32, 'ME01', 1, false, true, NULL, NULL, 4);
INSERT INTO public.planet VALUES (33, 'ME02', 1, false, false, NULL, NULL, 3);
INSERT INTO public.planet VALUES (34, 'KL11', 1, false, false, NULL, NULL, 4);
INSERT INTO public.planet VALUES (35, 'SS10', 1, false, true, NULL, NULL, 3);
INSERT INTO public.planet VALUES (36, 'SS15', 1, false, false, NULL, NULL, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'RegulusA', NULL, 1, 1);
INSERT INTO public.star VALUES (4, 'Petra', NULL, 2, 2);
INSERT INTO public.star VALUES (5, 'SohailA', NULL, 3, 3);
INSERT INTO public.star VALUES (6, 'MoriahA', NULL, 4, 4);
INSERT INTO public.star VALUES (7, 'IrenaA', NULL, 2, 5);
INSERT INTO public.star VALUES (8, 'VegaA', NULL, 2, 6);


--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.civilization_civilization_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: civilization civilization_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_name_key UNIQUE (name);


--
-- Name: civilization civilization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_pkey PRIMARY KEY (civilization_id);


--
-- Name: civilization civilization_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_planet_id_key UNIQUE (planet_id);


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
-- Name: civilization civilization_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

