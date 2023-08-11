--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: age; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.age (
    age_id integer NOT NULL,
    age_in_billion_years numeric(4,2) NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    name character varying(30)
);


ALTER TABLE public.age OWNER TO freecodecamp;

--
-- Name: age_age_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.age_age_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.age_age_id_seq OWNER TO freecodecamp;

--
-- Name: age_age_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.age_age_id_seq OWNED BY public.age.age_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_shape character varying(30),
    galaxy_description text,
    stars_in_billion integer,
    has_life boolean
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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    diameter_in_km integer
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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    number_of_planets integer,
    radius_in_km integer
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
-- Name: age age_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.age ALTER COLUMN age_id SET DEFAULT nextval('public.age_age_id_seq'::regclass);


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
-- Data for Name: age; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.age VALUES (2, 4.60, 1, 1, NULL, NULL, 'Sol');
INSERT INTO public.age VALUES (3, 4.53, 1, 1, 1, 1, 'Luna');
INSERT INTO public.age VALUES (4, 13.60, 1, NULL, NULL, NULL, 'Milky Way');
INSERT INTO public.age VALUES (1, 4.54, 1, 1, 1, NULL, 'Earth');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 'The Milky Way is a barred spiral galaxy around 13.6 billions years old with large pivoting arms  stretching out across the cosmos.', 200, true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Barred Spiral', 'The Andromeda galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milk Way galaxy, where our solar system resides.', 1000, false);
INSERT INTO public.galaxy VALUES (2, 'IC 1101', 'Supergiant Elliptical', 'The IC 1101 is a supergiant elliptical galaxy around 12.95 billions years old, it is one of the largest galaxies known.', 100000, false);
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf', 'Dwarf Irregular', 'The Canis Major Dwarf is a dwarf irregular galaxy in the local group, and is currently being absorbed by the Milk Way galaxy.', 1, false);
INSERT INTO public.galaxy VALUES (5, 'Sagittarius Elliptical Dwarf', 'Elliptical Loop', 'The Sagittarius Dwarf galaxy is an elliptical loop-shaped satellite galaxy of the Milk Way.', 1, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 'Star Bust', 'The Messier 82 is a starbust galaxy approximately 12 million light-years away in the constellation Ursa Major.', 30, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 1, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 1, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 1, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1, 1, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 1, 1, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1, 1, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 1, 1, 3);
INSERT INTO public.moon VALUES (8, 'Mimas', 1, 1, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1, 1, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 1, 1, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 1, 1, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 1, 1, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 1, 1, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 1, 1, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 1, 1, 6);
INSERT INTO public.moon VALUES (16, 'Arlel', 1, 1, 7);
INSERT INTO public.moon VALUES (17, 'Berlinda', 1, 1, 7);
INSERT INTO public.moon VALUES (18, 'Blanca', 1, 1, 7);
INSERT INTO public.moon VALUES (19, 'Callban', 1, 1, 7);
INSERT INTO public.moon VALUES (20, 'Despina', 1, 1, 8);
INSERT INTO public.moon VALUES (21, 'Galatea', 1, 1, 8);
INSERT INTO public.moon VALUES (22, 'Hallmede', 1, 1, 8);
INSERT INTO public.moon VALUES (23, 'Laomedela', 1, 1, 8);
INSERT INTO public.moon VALUES (24, 'Larissa', 1, 1, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true, 12742);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 1, true, 4879);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 1, false, 139820);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, false, 6779);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 1, false, 12104);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 1, false, 116460);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 1, false, 50724);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 1, false, 49244);
INSERT INTO public.planet VALUES (9, 'Kepler-90i', 1, 2, false, 16838);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 1, 3, false, 11723);
INSERT INTO public.planet VALUES (11, 'HD 219134 b', 1, 6, false, 10206);
INSERT INTO public.planet VALUES (12, 'Kepler-10b', 1, 2, false, 18731);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 8, 696340);
INSERT INTO public.star VALUES (2, 'Kepler 90', 1, 8, 834840);
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 1, 7, 84180);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 2, 107280);
INSERT INTO public.star VALUES (5, 'Lalande 21185', 1, 2, 273530);
INSERT INTO public.star VALUES (6, 'HD 219134', 1, 6, 556560);


--
-- Name: age_age_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.age_age_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: age age_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.age
    ADD CONSTRAINT age_name_key UNIQUE (name);


--
-- Name: age age_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.age
    ADD CONSTRAINT age_pkey PRIMARY KEY (age_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: age age_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.age
    ADD CONSTRAINT age_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: age age_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.age
    ADD CONSTRAINT age_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: age age_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.age
    ADD CONSTRAINT age_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: age age_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.age
    ADD CONSTRAINT age_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

