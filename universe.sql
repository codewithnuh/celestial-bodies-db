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
\ connect universe
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
    name character varying(50) NOT NULL,
    age_in_millions numeric NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    description text
);
ALTER TABLE public.galaxy OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    orbit_distance integer,
    has_water boolean DEFAULT false NOT NULL
);
ALTER TABLE public.moon OWNER TO freecodecamp;
--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    radius integer NOT NULL,
    is_habitable boolean DEFAULT false NOT NULL
);
ALTER TABLE public.planet OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;
--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    moon_id integer,
    launch_year integer NOT NULL,
    is_operational boolean DEFAULT true NOT NULL
);
ALTER TABLE public.satellite OWNER TO freecodecamp;
--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.satellite_satellite_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;
--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;
--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    mass integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL
);
ALTER TABLE public.star OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;
--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ALTER COLUMN galaxy_id
SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);
--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ALTER COLUMN moon_id
SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);
--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ALTER COLUMN planet_id
SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);
--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.satellite
ALTER COLUMN satellite_id
SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);
--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ALTER COLUMN star_id
SET DEFAULT nextval('public.star_star_id_seq'::regclass);
--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.galaxy
VALUES (1, 'Milky Way', 13000, true, 'Our home galaxy');
INSERT INTO public.galaxy
VALUES (
        2,
        'Andromeda',
        10000,
        false,
        'Nearest large galaxy'
    );
INSERT INTO public.galaxy
VALUES (
        3,
        'Whirlpool',
        10000,
        false,
        'Spiral galaxy in Canes Venatici'
    );
INSERT INTO public.galaxy
VALUES (
        4,
        'Triangulum',
        8000,
        false,
        'Third-largest galaxy in Local Group'
    );
INSERT INTO public.galaxy
VALUES (
        5,
        'Sombrero',
        11000,
        false,
        'Noted for its bright central bulge'
    );
INSERT INTO public.galaxy
VALUES (
        6,
        'Black Eye',
        8000,
        false,
        'Famous for dark dust band'
    );
--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.moon
VALUES (1, 'Moon', 1, 384400, false);
INSERT INTO public.moon
VALUES (2, 'Phobos', 2, 9377, false);
INSERT INTO public.moon
VALUES (3, 'Deimos', 2, 23460, false);
INSERT INTO public.moon
VALUES (4, 'Europa', 7, 670900, true);
INSERT INTO public.moon
VALUES (5, 'Ganymede', 7, 1070400, true);
INSERT INTO public.moon
VALUES (6, 'Callisto', 7, 1882700, false);
INSERT INTO public.moon
VALUES (7, 'Titan', 8, 1222000, true);
INSERT INTO public.moon
VALUES (8, 'Enceladus', 8, 238040, true);
INSERT INTO public.moon
VALUES (9, 'Miranda', 10, 129390, false);
INSERT INTO public.moon
VALUES (10, 'Triton', 9, 354760, false);
INSERT INTO public.moon
VALUES (11, 'Oberon', 10, 583520, false);
INSERT INTO public.moon
VALUES (12, 'Hyperion', 8, 1481000, false);
INSERT INTO public.moon
VALUES (13, 'Io', 7, 421700, true);
INSERT INTO public.moon
VALUES (14, 'Mimas', 8, 185520, false);
INSERT INTO public.moon
VALUES (15, 'Ariel', 10, 190900, false);
INSERT INTO public.moon
VALUES (16, 'Dione', 8, 377400, false);
INSERT INTO public.moon
VALUES (17, 'Rhea', 8, 527000, false);
INSERT INTO public.moon
VALUES (18, 'Tethys', 8, 294700, false);
INSERT INTO public.moon
VALUES (19, 'Umbriel', 10, 266000, false);
INSERT INTO public.moon
VALUES (20, 'Charon', 11, 19570, false);
--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.planet
VALUES (1, 'Earth', 1, 6371, true);
INSERT INTO public.planet
VALUES (2, 'Mars', 1, 3389, false);
INSERT INTO public.planet
VALUES (3, 'Venus', 1, 6052, false);
INSERT INTO public.planet
VALUES (4, 'Proxima b', 2, 6371, true);
INSERT INTO public.planet
VALUES (5, 'Kepler-442b', 3, 1400, true);
INSERT INTO public.planet
VALUES (6, 'Kepler-452b', 3, 1500, true);
INSERT INTO public.planet
VALUES (7, 'Jupiter', 1, 69911, false);
INSERT INTO public.planet
VALUES (8, 'Saturn', 1, 58232, false);
INSERT INTO public.planet
VALUES (9, 'Neptune', 1, 24622, false);
INSERT INTO public.planet
VALUES (10, 'Uranus', 1, 25362, false);
INSERT INTO public.planet
VALUES (11, 'Gliese 581g', 4, 13000, true);
INSERT INTO public.planet
VALUES (12, 'TOI 700 d', 5, 7100, true);
--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.satellite
VALUES (
        1,
        'Hubble Space Telescope',
        NULL,
        NULL,
        1990,
        true
    );
INSERT INTO public.satellite
VALUES (2, 'Voyager 1', NULL, NULL, 1977, true);
INSERT INTO public.satellite
VALUES (3, 'Cassini', 8, NULL, 1997, false);
INSERT INTO public.satellite
VALUES (4, 'Apollo 11', 1, 1, 1969, false);
INSERT INTO public.satellite
VALUES (5, 'Galileo', 7, NULL, 1989, false);
--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.star
VALUES (1, 'Sun', 1, 1989000, true);
INSERT INTO public.star
VALUES (2, 'Alpha Centauri', 2, 1232000, true);
INSERT INTO public.star
VALUES (3, 'Betelgeuse', 1, 1260000, false);
INSERT INTO public.star
VALUES (4, 'Sirius', 2, 2026000, true);
INSERT INTO public.star
VALUES (5, 'Vega', 3, 1480000, true);
INSERT INTO public.star
VALUES (6, 'Polaris', 4, 1100000, true);
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
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 5, true);
--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);
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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.satellite
ADD CONSTRAINT satellite_name_key UNIQUE (name);
--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.satellite
ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);
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
-- Name: satellite satellite_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.satellite
ADD CONSTRAINT satellite_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);
--
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.satellite
ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);
--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
--
-- PostgreSQL database dump complete
- -