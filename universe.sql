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
    name character varying NOT NULL,
    description text,
    distance numeric,
    has_black_hole boolean NOT NULL,
    number_of_stars integer NOT NULL
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
    name character varying NOT NULL,
    planet_id integer,
    diameter numeric,
    has_ice boolean NOT NULL,
    orbit_period integer
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
    name character varying NOT NULL,
    star_id integer,
    mass numeric,
    radius numeric,
    has_rings boolean NOT NULL
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
    name character varying NOT NULL,
    galaxy_id integer,
    temperature numeric,
    brightness numeric,
    is_binary boolean NOT NULL
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 0, true, 1000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Neighbor galaxy', 2530000, false, 1000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Another neighbor', 3000000, false, 100000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral galaxy', 23000000, true, 200000000);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'Large galaxy', 12000000, false, 150000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Famous spiral galaxy', 28000000, false, 120000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 8, 22.2, false, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 8, 12.4, false, 1);
INSERT INTO public.moon VALUES (4, 'Io', 9, 3643, true, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 9, 3121, true, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 9, 5268, true, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 9, 4821, true, 17);
INSERT INTO public.moon VALUES (8, 'Titan', 10, 5149, true, 16);
INSERT INTO public.moon VALUES (9, 'Rhea', 10, 1527, true, 5);
INSERT INTO public.moon VALUES (10, 'Iapetus', 10, 1469, true, 79);
INSERT INTO public.moon VALUES (11, 'Dione', 10, 1122, true, 3);
INSERT INTO public.moon VALUES (12, 'Tethys', 10, 1062, true, 2);
INSERT INTO public.moon VALUES (13, 'Enceladus', 10, 504, true, 1);
INSERT INTO public.moon VALUES (14, 'Mimas', 10, 396, true, 1);
INSERT INTO public.moon VALUES (15, 'Miranda', 11, 471.6, true, 1);
INSERT INTO public.moon VALUES (16, 'Ariel', 11, 1167.6, true, 3);
INSERT INTO public.moon VALUES (17, 'Umbriel', 11, 1169.4, true, 4);
INSERT INTO public.moon VALUES (18, 'Titania', 11, 1577.6, true, 9);
INSERT INTO public.moon VALUES (19, 'Oberon', 11, 1522.8, true, 14);
INSERT INTO public.moon VALUES (20, 'Triton', 12, 2706, true, 6);
INSERT INTO public.moon VALUES (21, 'Proteus', 12, 418, true, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 5.972, 6371, false);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.641, 3389, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 1898, 69911, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 568, 58232, true);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 86.8, 25362, true);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 102, 24622, true);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 0.330, 2439, false);
INSERT INTO public.planet VALUES (8, 'Venus', 1, 4.867, 6052, false);
INSERT INTO public.planet VALUES (9, 'Io', 2, 4.5, 1821, true);
INSERT INTO public.planet VALUES (10, 'Europa', 2, 4.8, 1560, true);
INSERT INTO public.planet VALUES (11, 'Ganymede', 2, 4.6, 2634, true);
INSERT INTO public.planet VALUES (12, 'Callisto', 2, 4.2, 2410, true);
INSERT INTO public.planet VALUES (13, 'Titan', 3, 1.345, 2575, true);
INSERT INTO public.planet VALUES (14, 'Rhea', 3, 0.593, 763, true);
INSERT INTO public.planet VALUES (15, 'Iapetus', 3, 0.419, 734, true);
INSERT INTO public.planet VALUES (16, 'Dione', 3, 0.434, 561, true);
INSERT INTO public.planet VALUES (17, 'Tethys', 3, 0.663, 533, true);
INSERT INTO public.planet VALUES (18, 'Enceladus', 3, 0.113, 252, true);
INSERT INTO public.planet VALUES (19, 'Mimas', 3, 0.038, 198, true);
INSERT INTO public.planet VALUES (20, 'Miranda', 4, 0.066, 235, true);
INSERT INTO public.planet VALUES (21, 'Ariel', 4, 0.116, 580, true);
INSERT INTO public.planet VALUES (22, 'Umbriel', 4, 0.092, 266, true);
INSERT INTO public.planet VALUES (23, 'Titania', 4, 0.118, 788, true);
INSERT INTO public.planet VALUES (24, 'Oberon', 4, 0.062, 761, true);
INSERT INTO public.planet VALUES (25, 'Triton', 5, 0.021, 1353, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1, false);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 10000, 25.4, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 5790, 1.5, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, 120000, false);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 12000, 120000, false);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 3050, 0.003, true);
INSERT INTO public.star VALUES (7, 'Polaris', 1, 6000, 2.0, false);
INSERT INTO public.star VALUES (8, 'Altair', 1, 7400, 10.6, false);
INSERT INTO public.star VALUES (9, 'Vega', 1, 9600, 40.0, false);
INSERT INTO public.star VALUES (10, 'Deneb', 1, 8500, 60.0, false);
INSERT INTO public.star VALUES (11, 'Arcturus', 1, 4280, 170.0, false);
INSERT INTO public.star VALUES (12, 'Antares', 1, 3300, 10000, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 25, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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

