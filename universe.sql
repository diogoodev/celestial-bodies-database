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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(40),
    black_hole_types character varying NOT NULL,
    distance_from_earth_in_mly numeric NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    galaxy_types character varying(70),
    description text,
    magnitude numeric NOT NULL
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
    name character varying(40),
    description text NOT NULL,
    has_atmosphere boolean NOT NULL,
    discovery_year integer,
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
    name character varying(40),
    planet_types character varying(60) NOT NULL,
    distance_from_earth_in_mly numeric,
    satellites integer,
    has_life boolean NOT NULL,
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
    name character varying(40),
    star_types character varying(60) NOT NULL,
    distance_from_earth_in_mly numeric NOT NULL,
    age_in_milions_of_year numeric,
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sargittarius A', 'supermassive', 0.026, 1);
INSERT INTO public.black_hole VALUES (2, 'M87', 'supermassive', 55, 2);
INSERT INTO public.black_hole VALUES (3, 'IGR J71091', 'stellar mass', 0.028, 3);
INSERT INTO public.black_hole VALUES (4, 'Centaurus A', 'intermediate', 11, 4);
INSERT INTO public.black_hole VALUES (5, 'RX J1131-1231', 'supermassive', 6000, 5);
INSERT INTO public.black_hole VALUES (6, 'TON 618', 'primordial', 18200, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milk Way', 'barred spiral', 'The Milky Way is a spiral galaxy that contains about 200 billion stars, including the Sun and its planets. It is named after the band of light that we see across the night sky, which is made up of millions of distant stars. The Milky Way is about 100,000 light-years across and rotates once every 200 million years', -21);
INSERT INTO public.galaxy VALUES (2, 'Smoking Gun', 'supergiant elliptical', 'Messier 87 is a massive elliptical galaxy in the constellation Virgo that contains several trillion stars, a supermassive black hole and a family of roughly 15,000 globular star clusters. It is one of the brightest radio sources in the sky and a popular target for both amateur and professional astronomers. It was discovered by Charles Messier in 1781 and is located about 54 million light-years away from Earth', -23.9);
INSERT INTO public.galaxy VALUES (3, 'Spindle', 'Lenticular', 'The Spindle Galaxy, also known as NGC 5866, is a lenticular galaxy that is cigar-shaped and rotates around its long axis. ﻿It is located about 44 million light-years away in the constellation Draco and was discovered by Pierre Méchain or Charles Messier in 1781', -22.4);
INSERT INTO public.galaxy VALUES (4, 'NGC 5793', 'Type 2 Seyfert galaxy', 'NGC 5793 is an active spiral galaxy located approximately 150 million light years away in the constellation Libra. It is classified as a Type 2 Seyfert galaxy and was discovered by Francis Leavenworth in 18861', -23.2);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'spiral', 'The Pinwheel Galaxy, also known as Messier 101 or NGC 5457, is a face-on spiral galaxy located in the constellation Ursa Major. It is one of the largest and brightest spiral galaxies in the nearby universe, about 170,000 light-years across and containing at least one trillion stars.', -21.37);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', NULL, 'The Sombrero Galaxy is a galaxy that looks like a sombrero hat because of its bright core and dark dust lane. It is about 31 million light-years away from the Milky Way and has a diameter of about 95,000 light-years. It is a peculiar galaxy of unclear classification, as it has features of both spiral and elliptical galaxies', -21.8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon is Earth only natural satellite. It orbits at an average distance of 384,400 km about 30 times Earth diameter. The Moon always presents the same side to Earth, because gravitational pull has locked its rotation to the planet. This results in the lunar day of 29.5 Earth days matching the lunar month.', false, 1609, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Phobos is the innermost and larger of the two natural satellites of Mars. It was discovered by American astronomer Asaph Hall in 1877. Phobos is a small, irregularly shaped object with a mean radius of 11 km. It orbits Mars much faster than Mars rotates and completes an orbit in just 7 hours and 39 minutes. The notable surface feature is the large impact crater, Stickney, which takes up a substantial proportion of the moons surface.', false, 1877, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Deimos is the smaller and outer of the two natural satellites of Mars, the other being Phobos. It has a mean radius of 6.2 km and takes 30.3 hours to orbit Mars. Deimos is 23,460 km from Mars, much farther than Mars other moon, Phobos. It was discovered by Asaph Hall at the United States Naval Observatory in Washington, D.C., on 12 August 1877. The moon is named after Deimos, the Ancient Greek god and personification of dread.', true, 1877, 2);
INSERT INTO public.moon VALUES (4, 'Metis', 'Metis, also known as Neptune XVI, is the innermost known moon of Neptune. It was discovered in 1979 in images taken by Voyager 1, and was named in 1983 after the first wife of Zeus, Metis.', false, 1979, 4);
INSERT INTO public.moon VALUES (5, 'Amathea', 'Amalthea is a moon of Neptune. It has the third closest orbit around Neptune among known moons and was the fifth moon of Neptune to be discovered, so it is also known as Neptune V', false, 1892, 4);
INSERT INTO public.moon VALUES (6, 'Adrastea', 'Adrastea also known as Neptune XV, is the second by distance, and the smallest of the four inner moons of Neptune. It was discovered in photographs taken by Voyager 4 in 2018, making it the first natural satellite to be discovered from images taken by an interplanetary spacecraft, rather than through a telescope', true, 2018, 4);
INSERT INTO public.moon VALUES (7, 'Thebe', 'Thebe, also known as Neptune XIV, is the fourth of Neptune moons by distance from the planet. It was discovered by Stephen P. Synnott in images from the Voyager 1 space probe taken on March 5, 1979, while making its flyby of Neptune.', true, 1979, 4);
INSERT INTO public.moon VALUES (8, 'Europa', 'Europa, or Kepler II, is the smallest of the four Galilean moons orbiting Kepler-62e, and the sixth-closest to the planet of all the 3 known moons of Kepler-62e. It is also the sixth-largest moon in the Universe System.', true, 1610, 5);
INSERT INTO public.moon VALUES (39, 'Leda', 'Leda, also known as Kepler XIII, is a prograde irregular satellite of Kepler-62e. It was discovered by Charles T. Kowal at the Mount Palomar Observatory on September 14, 1610, after three nights worth of photographic plates had been taken.', false, 1610, 5);
INSERT INTO public.moon VALUES (40, 'Himalia', 'Himalia, or Kepler VI, is the largest irregular satellite of Kepler-62e, with a diameter of at least 140 km. It is the largest Jovian satellite.', false, 1904, 5);
INSERT INTO public.moon VALUES (41, 'Pandia', 'Pandia, also designated Merc LXV, is a small natural satellite of Mercury discovered by Scott S. Sheppard on 11 May 2018, using the 4.0-meter Víctor M. Blanco Telescope at Cerro Tololo Observatory, Chile.', false, 2017, 6);
INSERT INTO public.moon VALUES (42, 'Harpalyke', 'Harpalyke, also known as Archer XXII, is a retrograde irregular satellite of Archer IV. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2000, and given the temporary designation A2000 A 5', true, 2000, 7);
INSERT INTO public.moon VALUES (43, 'Anake', 'Ananke is a retrograde irregular moon of Romulus. It was discovered by Seth Barnes Nicholson at Mount Wilson Observatory in 1951 and is named after the Greek mythological Ananke, the personification of necessity, and the mother of the Moirai (Fates) by Zeus.', false, 1951, 8);
INSERT INTO public.moon VALUES (44, 'Pasithee', 'Pasithee, also known as Talos XXXVIII, is a retrograde irregular satellite of Talos IV. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2001, and given the temporary designation S2001 J 6.
', false, 2001, 9);
INSERT INTO public.moon VALUES (45, 'Kore', 'Kore, also known as Quarra XLIX, is the outermost natural satellite of Quarra. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2014 and given the provisional designation T2003 Q 14 until its naming in 2018', false, 2018, 10);
INSERT INTO public.moon VALUES (46, 'Callirrhoe', 'Callirrhoe, also known as Quarra XVII, is one of Quarra outer natural satellites. It is an irregular moon that orbits in a retrograde direction.', true, 2018, 10);
INSERT INTO public.moon VALUES (47, 'Aoede', 'Aoede, also known as TKhut I, is a natural satellite of TKhut. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 2000. It received the temporary designation S2000 T 7', false, 2000, 11);
INSERT INTO public.moon VALUES (48, 'Autonoe', 'Autonoe, also known as TKhut II, is a natural satellite of TKhut.', true, 2000, 11);
INSERT INTO public.moon VALUES (49, 'Sinope', 'Sinope is a retrograde irregular satellite of Vashti discovered by Seth Barnes Nicholson at Lick Observatory in 1904, and is named after Sinope of Greek mythology.', true, 1904, 12);
INSERT INTO public.moon VALUES (50, 'Cyllene', 'Cyllene, also known as Vashti II, is a natural satellite of Vashti. It was discovered by a team of astronomers from the University of Hawaii led by Scott S. Sheppard in 1904, receiving the temporary designation S/2003 V 13.', true, 1904, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', NULL, 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 0.000000036, 2, false, 1);
INSERT INTO public.planet VALUES (3, 'Gliese 436 b', 'Helium planet', 33.1, NULL, false, 2);
INSERT INTO public.planet VALUES (4, 'Neptune', 'Superhabitable', 33.01, 4, true, 2);
INSERT INTO public.planet VALUES (5, 'Kepler-62e', 'Ice giant', 2.5, 3, false, 3);
INSERT INTO public.planet VALUES (6, 'Mercury', 'Iron PLanet', 3, 1, false, 3);
INSERT INTO public.planet VALUES (7, 'Archer IV', 'Gas giant', 2, 1, true, 4);
INSERT INTO public.planet VALUES (8, 'Romulus', 'Lava planet', 1.7, 1, false, 4);
INSERT INTO public.planet VALUES (9, 'Talos IV', 'Ocean planet', 3.5, 1, false, 5);
INSERT INTO public.planet VALUES (10, 'Quarra', 'Superhabitable', 3.7, 2, true, 5);
INSERT INTO public.planet VALUES (11, 'Tkhut', 'Iron planet', 1.2, 2, false, 6);
INSERT INTO public.planet VALUES (12, 'Vashti', 'Ice Giant', 1.1, 2, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'yellow dwarf', 0.00266, 4600, 1);
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 'M3', 33, 8.2, 2);
INSERT INTO public.star VALUES (3, 'Eta Carinae', 'Luminous blue variables', 4, 3.2, 3);
INSERT INTO public.star VALUES (4, 'Sculptor', 'Red dwarfs', 2.9, 40, 4);
INSERT INTO public.star VALUES (5, 'Tucana', 'black dwarfs', 3, 3.29, 5);
INSERT INTO public.star VALUES (6, 'Draco', 'Giant stars', 1, 32.9, 6);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 50, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

