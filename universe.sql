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
-- Name: clasificacion_estrellas; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.clasificacion_estrellas (
    clasificacion_estrellas_id integer NOT NULL,
    name character varying(10),
    color character varying(20),
    temperatura integer,
    star_id integer NOT NULL
);


ALTER TABLE public.clasificacion_estrellas OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_types character varying(20),
    dist_from_earth_a_luz numeric(2,2),
    description text
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
    name character varying(20) NOT NULL,
    orbita_a character varying(20) NOT NULL,
    diametro_km integer,
    planet_id integer,
    gaseoso boolean DEFAULT false
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    diametro_km integer,
    orbita_a character varying(30) NOT NULL,
    galaxy_id integer,
    gaseoso boolean DEFAULT false
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diametro integer,
    description character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Data for Name: clasificacion_estrellas; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.clasificacion_estrellas VALUES (1, 'Sol', 'Amarillo', 6000, 1);
INSERT INTO public.clasificacion_estrellas VALUES (2, 'Arturo', 'Anaranjado', 4700, 2);
INSERT INTO public.clasificacion_estrellas VALUES (3, 'Sirio', 'Blanco', 11500, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'SBsb', 0.00, 'Es la galaxia a la cual pertenece el planeta tierra');
INSERT INTO public.galaxy VALUES (2, 'Enana del Can Mayor', 'Irr', 0.03, 'Satelite de la Via Lactea');
INSERT INTO public.galaxy VALUES (3, 'Enana Eliptica de Sagitario', 'dSph/E7', 0.08, 'Satelite de la Via Lactea');
INSERT INTO public.galaxy VALUES (4, 'Gran Nube de Magallanes', 'Irr', 0.16, 'Satelite de la Via Lactea');
INSERT INTO public.galaxy VALUES (5, 'Pequena Nube de Magallanes', 'SB', 0.21, 'Satelite de la Via Lactea');
INSERT INTO public.galaxy VALUES (6, 'Enana de la Osa Menor', 'dE0', 0.21, 'Satelite de la Via Lactea');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'La Tierra', 3476, 3, false);
INSERT INTO public.moon VALUES (2, 'Delmos', 'Marte', 8, 4, false);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Marte', 560, 4, false);
INSERT INTO public.moon VALUES (4, 'Callisto', 'Jupiter', 4800, 5, true);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter', 3126, 5, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Jupiter', 5276, 5, true);
INSERT INTO public.moon VALUES (7, 'Io', 'Jupiter', 3628, 5, false);
INSERT INTO public.moon VALUES (8, 'Thebe', 'Jupiter', 100, 5, false);
INSERT INTO public.moon VALUES (9, 'Atlas', 'Saturno', 1000, 6, false);
INSERT INTO public.moon VALUES (10, 'Calypso', 'Saturno', 890, 6, false);
INSERT INTO public.moon VALUES (11, 'Dione', 'Saturno', 1120, 6, true);
INSERT INTO public.moon VALUES (12, 'Enceladus', 'Saturno', 498, 6, false);
INSERT INTO public.moon VALUES (13, 'Helene', 'Saturno', 1200, 6, true);
INSERT INTO public.moon VALUES (14, 'Hyperlon', 'Saturno', 81360, 6, false);
INSERT INTO public.moon VALUES (15, 'Mimas', 'Saturno', 398, 6, false);
INSERT INTO public.moon VALUES (16, 'Prometheus', 'Saturno', 10064, 6, false);
INSERT INTO public.moon VALUES (17, 'Rhea', 'Saturno', 1528, 6, false);
INSERT INTO public.moon VALUES (18, 'Tethys', 'Saturno', 1060, 6, false);
INSERT INTO public.moon VALUES (19, 'Titan', 'Saturno', 5150, 6, false);
INSERT INTO public.moon VALUES (20, 'Ariel', 'Saturno', 1160, 7, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 4879, 'El Sol', 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 'El Sol', 1, false);
INSERT INTO public.planet VALUES (3, 'Tierra', 12742, 'El Sol', 1, false);
INSERT INTO public.planet VALUES (4, 'Marte', 6779, 'El Sol', 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, 'El Sol', 1, true);
INSERT INTO public.planet VALUES (6, 'Saturno', 116460, 'El Sol', 1, true);
INSERT INTO public.planet VALUES (7, 'Urano', 50724, 'El Sol', 1, true);
INSERT INTO public.planet VALUES (8, 'Neptuno', 49244, 'El Sol', 1, true);
INSERT INTO public.planet VALUES (9, 'Namecusein', 150000, 'Dragon Ball', 3, false);
INSERT INTO public.planet VALUES (10, 'Sayan', 23456, 'Dragon Ball', 3, false);
INSERT INTO public.planet VALUES (11, 'Kepler', 34553, 'Sirius', 2, false);
INSERT INTO public.planet VALUES (12, 'Nano', 234, 'Betelgeus', 4, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1392700, 'Estrella Tipo G', 1);
INSERT INTO public.star VALUES (2, 'Arturo', 35342000, 'Es la tercera en brilloe', 5);
INSERT INTO public.star VALUES (3, 'Sirio', 2400000, 'La mas brillante del cielo', 5);
INSERT INTO public.star VALUES (4, 'Antares', 946000000, 'La mas brillanteo', 4);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1234000000, 'Estrella Supergigante', 2);
INSERT INTO public.star VALUES (6, 'Titawin', 1163000000, 'Estrella Supergigante', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: clasificacion_estrellas clasificacion_estrellas_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clasificacion_estrellas
    ADD CONSTRAINT clasificacion_estrellas_name_key UNIQUE (name);


--
-- Name: clasificacion_estrellas clasificacion_estrellas_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clasificacion_estrellas
    ADD CONSTRAINT clasificacion_estrellas_pkey PRIMARY KEY (clasificacion_estrellas_id);


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
-- Name: clasificacion_estrellas clasificacion_estrellas_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clasificacion_estrellas
    ADD CONSTRAINT clasificacion_estrellas_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--