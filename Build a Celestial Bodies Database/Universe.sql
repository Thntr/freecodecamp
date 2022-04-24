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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(30) NOT NULL,
    date_of_discovery date,
    composition text,
    curious_fact text,
    nasas_web_info text,
    asteroid_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    constellation text,
    number_of_stars_in_millions integer,
    galaxy_id integer NOT NULL,
    distance_in_light_years numeric,
    galaxy_type text,
    name character varying(30)
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    planet_name character varying(30),
    moon_id integer NOT NULL,
    strong_evidence_of_life boolean,
    curious_feature text,
    rounded_diameter_in_km integer
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
    planet_name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    strong_evidence_of_life boolean,
    number_of_moons integer,
    global_magnetic_field boolean,
    star_name character varying(30),
    planet_id integer NOT NULL,
    name character varying(30)
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
    star_name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    estimated_solar_mases numeric(6,4),
    galaxy_name character varying(30),
    star_id integer NOT NULL,
    name character varying(30)
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Oumuamua', '2017-10-19', 'Rock and possibly metals', 'For decades we have theorized that such interstellar objects are out there, and now -for the first time- we have direct evidence they exist, said Thomas Zurbuchen.', 'https://solarsystem.nasa.gov/asteroids-comets-and-meteors/comets/oumuamua/in-depth/', 1);
INSERT INTO public.asteroid VALUES ('Psyche', '1852-03-17', 'Metal-rich', 'Psyche might be the partial core of a shattered planetesil. Psyche can offer a close look at the interior of terrestrial planets like Earth that is normally hidden beneath layers of mantle and crust.', 'https://solarsystem.nasa.gov/asteroids-comets-and-meteors/asteroids/16-psyche/in-depth/', 2);
INSERT INTO public.asteroid VALUES ('2019 OK', '2019-07-24', 'Unknown', 'Other asteroids have passed closer to Earth - and a few asteroids have impacted our atmosphere soon after they were discovered - but none has been as large as asteroid 2019 OK. This makes it the largest asteroid known to pass so close to Earth.', 'https://solarsystem.nasa.gov/asteroids-comets-and-meteors/asteroids/2019-ok/in-depth', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Hoags Object', 12750, 'Serpens', 8000, 3, 612000000, 'Ring -pretty weird-', NULL);
INSERT INTO public.galaxy VALUES ('Antennae Galaxies', 1200, 'Corvus', NULL, 4, 65000000, 'nteracting galaxies', NULL);
INSERT INTO public.galaxy VALUES ('The Black Eye Galaxy', 13280, 'Coma Berenices', 100000, 5, 17300000, 'Spiral Galaxy', NULL);
INSERT INTO public.galaxy VALUES ('NGC 1052-DF2 age', 10000, 'Cetus', 1250, 6, 61970000, 'Ultra Diffuse Galaxy', NULL);
INSERT INTO public.galaxy VALUES ('Milky Way', 13610, 'Sagittarious', 250000, 1, 27100, 'Barred Spiral Galaxy', NULL);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 13250, 'Virgo', 100000, 2, 31100000, 'Unbarred Spiral Galaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Callisto', 4000, 'Jupiter', 5, true, 'Data gathered by the Galileo spacecraft and from models created by scientists indicates Callisto may have a salty ocean thats interacting with a layer of rocks about 250 kilometers beneath the surface, key conditions for creating life. Oxygen, another potential sign of life, has been detected in the exosphere.', 4821);
INSERT INTO public.moon VALUES ('Triton', 4503, 'Neptune', 7, true, 'Shows tantalizing evidence of water beneath its jumbled crust, making it a high-priority target in the search for life.', 2707);
INSERT INTO public.moon VALUES ('Io', 4500, 'Jupiter', 9, false, 'Constant volcanism and intense radiation make IO an unlikely destination for life.', 3643);
INSERT INTO public.moon VALUES ('Oberon', NULL, 'Uranus', 15, false, 'Is composed of roughly half ice and half rock. Has at least one large mountain that rises about 6 km off the surface.', 1522);
INSERT INTO public.moon VALUES ('Moon', 4530, 'Earth', 10, false, 'Moon is vital for our planet to mantain life. It moderates our planets axis wobble, causing a more stable climate and creates the Earths natural rhythm, the tides of our oceans.', 3475);
INSERT INTO public.moon VALUES ('Umbriel', NULL, 'Uranus', 16, false, 'The process by which Umbriels ancient cratered surface was darkened remains a mystery.', 1169);
INSERT INTO public.moon VALUES ('Ganymede', 4500, 'Jupiter', 6, true, 'Ganymede is the largest moon in our solar system, even bigger than the planet Mercury. Theres strong evidence that has an underground saltwater ocean that may hold more water than all the water on Earths surface. Also, is the only moon known to have its own magnetic field.', 5268);
INSERT INTO public.moon VALUES ('Rosalind', NULL, 'Uranus', 11, false, 'Little is known about Rosalind, one of several satellites discovered by Voyager 2 as it flew by Uranus in 1986. Is one of Uranus inner moons and has a radius of about 36 kilometers.', 72);
INSERT INTO public.moon VALUES ('Phobos', 2500, 'Mars', 13, false, 'Phobos gets closer to Mars by about 2 centimeters per year, and it is predicted that within 30 to 50 million years it will either collide with the planet or break up into a planetary ring.', 22);
INSERT INTO public.moon VALUES ('Deimos', 2700, 'Mars', 12, false, 'Is the smallest moon in our solar system with only seven miles in diameter.', 12);
INSERT INTO public.moon VALUES ('Ariel', 100, 'Uranus', 14, false, 'Measurements have shown that Ariels surface temperature rises and falls quickly with the coming and going of sunlight, without a -thermal inertia- lag. Models indicate that tidal interactions with Uranus may provide an important source of heat.', 1157);
INSERT INTO public.moon VALUES ('Larissa', NULL, 'Neptune', 18, false, 'Larissas orbit is mostly circular, but it is slowly spiraling inward and may eventually impact Neptunes atmosphere.', 194);
INSERT INTO public.moon VALUES ('Titan', 4003, 'Saturn', 8, false, 'Smaller than Ganymedes by just 2 percent, makes the second largest moon in our solar system. Also, besides Earth, is the only place known that have liquids in the form of rivers, lakes and seas on its surface, mainly made by methane and ethane.', NULL);
INSERT INTO public.moon VALUES ('Halimede', NULL, 'Saturn', 17, false, 'Is considered an irregular satellite because of its distant, eccentric orbit around Neptune.', 62);
INSERT INTO public.moon VALUES ('Europa', 4500, 'Jupiter', 1, true, 'While Europa is only one-fourth the diameter of Earth, its ocean may contain twice as much water as all of Earths oceans combined.', 3122);
INSERT INTO public.moon VALUES ('Nereid', 4500, 'Neptune', 3, false, 'Nereid is unique because it has one of the most eccentric orbits of any moon in our solar system. Nereid is so far from Neptune that it requires 360 Earth days to make one orbit.', 340);
INSERT INTO public.moon VALUES ('Hyperion', NULL, 'Saturn', 4, false, 'Hyperion is the largest of Saturns irregular, nonspherical moons (radius of 135 kilometers). Considering its odd shape, Hyperion is probably a remnant of a larger moon that was destroyed by a major impact.', 270);
INSERT INTO public.moon VALUES ('Enceladus', 1000, 'Saturn', 2, true, 'From samples, scientists have determined that Enceladus has most of the chemical ingredients needed for life, and likely has hydrothermal vents spewing out hot, mineral rich water into its ocean.', 504);
INSERT INTO public.moon VALUES ('MOA-2011-BLG-262Lb', NULL, 'MOA-2011-BLG-262L', 20, false, 'If it is an exomoon, then it would be around the size of Mars', NULL);
INSERT INTO public.moon VALUES ('Kepler-1625b-I', NULL, 'Kepler-1625b', 19, false, 'A possible moon of exoplanet Kepler-1625b. The moon is thought to be approximately the mass of Neptune', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 4543, true, 1, true, 'Sun', 1, NULL);
INSERT INTO public.planet VALUES ('Mars', 4603, false, 2, false, 'Sun', 2, NULL);
INSERT INTO public.planet VALUES ('Jupiter', 4603, false, 79, true, 'Sun', 3, NULL);
INSERT INTO public.planet VALUES ('Saturn', 4503, false, 82, true, 'Sun', 4, NULL);
INSERT INTO public.planet VALUES ('Uranus', 4503, false, 27, true, 'Sun', 5, NULL);
INSERT INTO public.planet VALUES ('Neptune', 4503, false, 14, true, 'Sun', 6, NULL);
INSERT INTO public.planet VALUES ('MOA-2011-BLG-262L', NULL, false, 1, false, NULL, 9, NULL);
INSERT INTO public.planet VALUES ('Kepler-1625b', NULL, false, 1, false, 'Kepler-1625', 10, NULL);
INSERT INTO public.planet VALUES ('Gliese 581 c', 9000, true, 0, true, 'Gliese 581', 11, NULL);
INSERT INTO public.planet VALUES ('Mercury', 4503, false, 0, true, 'Sun', 7, NULL);
INSERT INTO public.planet VALUES ('Venus', 4503, false, 0, false, 'Sun', 8, NULL);
INSERT INTO public.planet VALUES ('Gliese 581 b', 2000, false, 0, false, 'Gliese 581', 12, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 4603, 1.0000, 'Milky Way', 1, NULL);
INSERT INTO public.star VALUES ('HD 140283 or Mathuselah star', 12000, 0.8100, 'Milky Way', 4, NULL);
INSERT INTO public.star VALUES ('KIC 8462852 or WTF star', NULL, 1.4300, 'Milky Way', 3, NULL);
INSERT INTO public.star VALUES ('Teergarden', 8000, 0.0890, 'Milky Way', 2, NULL);
INSERT INTO public.star VALUES ('Kepler-1625', 8700, 0.9600, 'Milky Way', 5, NULL);
INSERT INTO public.star VALUES ('Gliese 581', 2001, 0.3100, 'Milky Way', 6, NULL);


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 2, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: asteroid asteroid_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_id PRIMARY KEY (asteroid_id);


--
-- Name: asteroid asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (planet_name);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (star_name);


--
-- Name: star fk_galaxy_name; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_name FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- Name: moon fk_planet_name; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_name FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- Name: planet fk_star_name; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_name FOREIGN KEY (star_name) REFERENCES public.star(star_name);


--
-- PostgreSQL database dump complete
--

