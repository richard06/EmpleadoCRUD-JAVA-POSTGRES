--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-07-15 15:21:25

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

--
-- TOC entry 205 (class 1255 OID 24631)
-- Name: unaccent_string(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.unaccent_string(text) RETURNS text
    LANGUAGE plpgsql
    AS $_$
DECLARE
    input_string text := $1;
BEGIN

input_string := translate(input_string, 'âãäåāăąÁÂÃÄÅĀĂĄ', 'aaaaaaaaaaaaaaa');
input_string := translate(input_string, 'èééêëēĕėęěĒĔĖĘĚ', 'eeeeeeeeeeeeeee');
input_string := translate(input_string, 'ìíîïìĩīĭÌÍÎÏÌĨĪĬ', 'iiiiiiiiiiiiiiii');
input_string := translate(input_string, 'óôõöōŏőÒÓÔÕÖŌŎŐ', 'ooooooooooooooo');
input_string := translate(input_string, 'ùúûüũūŭůÙÚÛÜŨŪŬŮ', 'uuuuuuuuuuuuuuuu');

return input_string;
END;
$_$;


ALTER FUNCTION public.unaccent_string(text) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16404)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    idempleado integer NOT NULL,
    nombreempleado character varying(100),
    periodo character varying,
    fecha date,
    paterno character varying(100),
    materno character varying(100),
    correo character varying(100)
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16399)
-- Name: empleado2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado2 (
    "idEmpleado" integer NOT NULL,
    nombre name,
    periodo character varying,
    fecha date
);


ALTER TABLE public.empleado2 OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24611)
-- Name: empleado_idempleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_idempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleado_idempleado_seq OWNER TO postgres;

--
-- TOC entry 2833 (class 0 OID 0)
-- Dependencies: 204
-- Name: empleado_idempleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleado_idempleado_seq OWNED BY public.empleado.idempleado;


--
-- TOC entry 2694 (class 2604 OID 24613)
-- Name: empleado idempleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado ALTER COLUMN idempleado SET DEFAULT nextval('public.empleado_idempleado_seq'::regclass);


--
-- TOC entry 2826 (class 0 OID 16404)
-- Dependencies: 203
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (idempleado, nombreempleado, periodo, fecha, paterno, materno, correo) FROM stdin;
1	Melodie	Mensual	2020-03-10	Bryant	Reeves	nunc.sed.libero@vulputaterisus.co.uk
3	Declan	Mensual	2020-06-24	Curry	Garner	id.ante@ut.co.uk
5	Owen	trimestral	2019-07-16	Greer	Cross	urna@Pellentesque.edu
6	Oleg	diario	2019-08-06	Little	Benton	ante.Maecenas.mi@vel.net
7	Ella	Mensual	2019-10-25	Knapp	Richardson	Vestibulum.ut.eros@elitpharetraut.net
8	Jayme	diario	2020-02-14	Witt	Lester	diam.at.pretium@Maurisvestibulumneque.ca
9	Harlan	bimestral	2019-05-30	Conner	Harrington	non.nisi@dapibusquamquis.org
10	Joan	trimestral	2020-05-30	Beach	Wilcox	ridiculus.mus@rutrumnon.com
11	Solomon	trimestral	2021-04-30	Alexander	Livingston	Nulla.facilisis.Suspendisse@maurisa.com
13	Dakota	bimestral	2020-11-26	Ramsey	Kirby	Nulla.dignissim.Maecenas@Nullam.ca
14	Hyacinth	bimestral	2020-05-21	Ortega	Decker	Cras@tincidunt.edu
15	Katelyn	trimestral	2019-11-24	West	Frye	ad@facilisiseget.net
16	Darrel	diario	2021-02-11	Forbes	Arnold	mollis@lorem.edu
17	Freya	bimestral	2019-07-10	Cobb	Peck	neque@tristiqueaceleifend.net
18	Kendall	trimestral	2019-09-05	Harmon	Robinson	vitae@id.edu
19	Gage	trimestral	2020-06-17	Valencia	Mays	ut.nulla@pedeultricesa.com
20	Lester	trimestral	2019-07-23	Chapman	Browning	enim@cursusNunc.edu
21	Quamar	Mensual	2020-09-30	Lamb	Wooten	sit.amet@dui.co.uk
22	Angelica	trimestral	2020-04-11	Ellison	Griffin	sed@aliquameu.com
23	Kato		2019-05-27	Freeman	Mosley	euismod.urna@etnetuset.ca
24	Haviva	bimestral	2021-04-25	Howell	Douglas	ut.quam@purusactellus.co.uk
25	Dieter	diario	2020-04-14	Roth	Riggs	et.nunc@InfaucibusMorbi.net
26	Dalton	trimestral	2020-08-18	Hill	Richards	ridiculus.mus@auctor.net
27	Guinevere	Mensual	2019-05-23	Conway	Miranda	ligula.tortor@Integersemelit.net
28	Byron	Mensual	2019-11-17	Payne	Price	Ut.tincidunt.vehicula@idblanditat.org
29	Charity	bimestral	2020-11-09	Mathews	Nielsen	nibh.sit@cursus.edu
30	Georgia	diario	2021-01-17	Montgomery	Austin	libero.Proin@sem.ca
31	Peter		2019-07-12	Rush	Henson	Nunc.ut@eudolor.ca
32	Declan	diario	2020-09-13	Hawkins	Perry	fames@posuere.edu
33	Mikayla	bimestral	2021-02-03	Garrett	Duke	sit@luctus.co.uk
35	Dorothy		2019-07-23	Warner	Browning	enim.mi@Mauris.edu
36	Dillon	trimestral	2021-03-16	Maxwell	Snow	magnis.dis@ante.edu
37	Edan	bimestral	2019-11-03	Simon	Humphrey	feugiat.nec.diam@euplacerateget.ca
38	Britanney	bimestral	2020-09-28	Mcintosh	Emerson	blandit@necmollisvitae.ca
39	Nasim	diario	2020-03-21	Leblanc	Glenn	neque.In.ornare@duiFusce.net
40	Charity	bimestral	2021-05-18	Sanders	Howell	In@massaInteger.net
41	Orson	Mensual	2021-04-19	Mullins	Banks	arcu.Aliquam@elitdictum.net
42	Prescott		2021-01-20	Webb	Dodson	lorem.eu@tempor.edu
43	Fatima	trimestral	2020-01-23	Bullock	Peters	lorem.ipsum.sodales@Sedeu.ca
44	Maggie	Mensual	2021-01-06	Roberts	Farrell	purus.sapien.gravida@volutpatNullafacilisis.net
45	Florence		2020-09-19	Bartlett	Nicholson	tellus@ridiculus.edu
46	Dacey	bimestral	2019-12-01	Woods	Vega	vel.est.tempor@nisisem.com
47	Aspen	trimestral	2019-12-02	Torres	Powers	risus@ornare.edu
48	Christine	Mensual	2019-06-12	Hammond	Harrell	eu.odio.tristique@sed.ca
49	Kirby	bimestral	2019-10-24	Byrd	Buckner	Aliquam.auctor@ultrices.co.uk
50	Bevis		2019-12-03	Wilkerson	Good	quam@tellus.ca
51	Suki		2020-05-11	Park	Bass	enim.Etiam.gravida@Donec.co.uk
52	Kenyon	diario	2019-07-12	Whitney	Morin	sem@elitpretiumet.com
53	Shaeleigh		2020-09-11	Osborn	Bruce	in.faucibus.orci@pedemalesuada.co.uk
54	Tana	trimestral	2019-11-26	Hooper	Petersen	eu@auctor.co.uk
55	Madeline	Mensual	2019-06-22	Vaughan	Faulkner	Integer.id@sollicitudinamalesuada.com
56	Craig	bimestral	2020-05-30	Webb	Collier	enim@egestas.com
57	Brittany	bimestral	2021-01-17	Wagner	Velasquez	magna@elit.org
58	Lawrence	diario	2020-06-21	Mccoy	Adkins	odio.vel@duisemper.com
59	Indira	bimestral	2021-01-03	Bishop	Doyle	Suspendisse.ac@auctor.ca
60	Kirk		2020-02-14	Mcintosh	Chandler	Proin@sociosquadlitora.edu
61	Gloria		2019-08-20	Adams	Stokes	rutrum@porttitortellus.com
62	Jordan	Mensual	2020-06-04	Howell	Benson	Donec.nibh@nonummy.co.uk
63	Zeus		2020-12-13	Thornton	Blair	fermentum.risus@aliquam.net
64	Echo		2020-09-17	Elliott	Craig	nec.ante.Maecenas@gravidaAliquamtincidunt.edu
65	Zeph		2020-07-12	Browning	Dillon	consequat.enim.diam@imperdiet.net
66	Emmanuel		2020-07-20	Palmer	Hayden	at.augue@nonarcuVivamus.com
67	Dexter	trimestral	2020-12-08	Mosley	Barrera	ultricies.dignissim.lacus@varius.ca
68	Blaine		2021-03-27	Navarro	Lawson	et@egestasAliquam.org
69	Roth	bimestral	2020-05-10	Sharp	Paul	porttitor.vulputate.posuere@fermentum.com
70	Jada	diario	2021-02-18	Delaney	Eaton	adipiscing.elit@sitamet.ca
71	Vladimir	bimestral	2020-06-26	Pacheco	Cummings	ullamcorper@adipiscing.ca
72	Kuame	bimestral	2020-05-27	Good	Delacruz	vulputate.dui.nec@ac.co.uk
73	Shaine	Mensual	2021-04-17	Wilkinson	Stevenson	ligula.Donec@elementumategestas.org
74	Liberty	bimestral	2020-06-24	Mullins	Merrill	mollis.lectus.pede@dui.org
75	Kyle	trimestral	2020-07-10	Miller	Burris	Proin@aultricies.org
76	Lev	diario	2020-10-27	Good	William	orci.lobortis@nequeNullamnisl.com
78	Kermit	diario	2019-11-14	Carrillo	Morgan	rutrum.eu@fringillaestMauris.net
34	Hermione	Mensual	2020-09-10	Monroe	Key	non@Donec.com
12	Otto	Mensual	2020-02-09	Camacho	Mcguire	ornare@maurisipsumporta.com
77	Ainsley	Diario	2020-04-20	Kelley	Rosa	vitae@Namporttitorscelerisque.co.uk
2	Mensual	trimestral	2021-02-09	Armstrong	Rodriquez	Donec@inhendrerit.co.uk
79	Deborah	bimestral	2021-01-29	Hill	Beck	consectetuer@aliquet.edu
80	Amela	bimestral	2021-01-22	Craig	Weaver	Duis.ac@Namligulaelit.org
82	Macy	Mensual	2019-09-15	Hall	Acosta	luctus.sit@a.co.uk
83	Kay	bimestral	2020-02-05	Hurst	Mccall	felis.eget@euultricessit.net
84	Scarlett	Mensual	2021-01-09	Bernard	Mann	dictum.eleifend.nunc@elementum.net
85	Yvette	trimestral	2020-11-29	Crosby	Allen	Pellentesque@aliquetmolestie.org
86	Merritt	trimestral	2020-11-11	Foster	Thompson	condimentum.Donec@risusodioauctor.com
87	Yoshi	diario	2019-10-28	Berg	Francis	eu.metus@pedeac.edu
88	Gareth	diario	2021-04-28	Mann	Duke	Suspendisse.sed@euplacerat.net
89	Whitney	trimestral	2020-11-20	Juarez	Jimenez	aliquam@anteVivamusnon.org
90	Basia		2020-07-16	Swanson	Finley	turpis.In.condimentum@nuncsedpede.edu
91	Vance	bimestral	2021-03-06	Beasley	Berg	vitae.mauris@Maurisvelturpis.org
92	Lillith	bimestral	2020-06-27	Strong	Cline	enim@enimEtiamgravida.co.uk
93	Kevyn	diario	2020-05-14	Dennis	Mayo	luctus.et.ultrices@magnaUt.net
94	Francis	diario	2020-04-10	Petty	Walker	nulla@risusaultricies.org
95	Rajah	bimestral	2020-02-22	Chandler	Rowland	ullamcorper@nunc.edu
96	Hayes	trimestral	2021-02-11	Morales	Clayton	sodales.elit@diameu.org
97	Jenette		2020-05-16	Kerr	Blackburn	id.sapien.Cras@nibhvulputate.org
98	Inga		2020-05-07	Camacho	Hunt	felis.purus.ac@ornare.com
99	Kirby	bimestral	2020-08-30	Rivera	Baldwin	et@semvitaealiquam.edu
108	Ricardo	Semanal	2018-08-14	Garcia	Martinez	rgarcia@cyolomecatl.com
109	Rodrigo	mensual	2020-01-02	García	Martínez	rod_1234@gmail.com
110	fulano	B	2019-01-01	\N	\N	\N
111	Alguien	O	2017-05-11	\N	\N	\N
112	Baxter	B	2019-10-11	\N	\N	\N
4	Baxter	aaaaa	2019-10-11	Cain	Holden	bibendum@diamProindolor.org
81	Sylvester	Trimestral	2019-05-19	Woodward	Day	condimentum@Quisqueliberolacus.co.uk
100	Victoria	Semanal	2020-02-17	Gill	Jimenez	urna.et@nislMaecenasmalesuada.com
115	Adriana	S	2017-05-04	\N	\N	\N
\.


--
-- TOC entry 2825 (class 0 OID 16399)
-- Dependencies: 202
-- Data for Name: empleado2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado2 ("idEmpleado", nombre, periodo, fecha) FROM stdin;
1	Keiko	B	2019-08-19
3	Inga	M	2021-02-08
4	Thane	T	2020-11-04
5	Helen	B	2021-04-11
6	Quinlan	T	2020-12-09
7	Rogan	D	2021-04-26
8	Pascale	D	2019-07-27
9	Ora	M	2021-01-05
10	Kathleen	T	2019-06-23
11	Lawrence	M	2019-06-30
12	Kalia	B	2020-04-02
13	Alika	B	2020-04-25
14	Brock	T	2020-04-15
15	Mark	M	2020-10-08
16	Orlando	T	2020-05-05
17	Zane	T	2021-04-05
18	Azalia	T	2020-09-26
19	Signe	M	2020-10-17
20	Liberty		2020-03-14
21	Naomi	B	2020-12-14
22	Jasper	B	2021-01-03
23	Orson		2020-10-14
24	Meghan	B	2020-11-05
25	Kenyon	D	2021-05-06
26	Patrick	T	2021-05-12
27	Carter	T	2020-11-03
28	Sade		2021-01-23
29	Isadora	T	2020-01-01
30	Dawn	D	2019-12-27
31	Iola	D	2019-07-04
32	Shoshana	D	2019-06-02
33	Brennan	T	2020-02-09
34	Dana	D	2019-09-09
35	Reuben	T	2019-11-07
36	Jesse	D	2021-04-30
37	Wallace	D	2019-05-30
38	Emily		2019-12-22
39	Victor	M	2021-04-15
40	Garth	B	2021-04-09
41	Ross	M	2021-02-13
42	Aladdin	D	2021-04-11
43	Rashad	B	2019-12-27
44	Sage	T	2019-11-10
45	Willow	M	2019-09-21
46	Herrod	M	2020-03-18
47	Vanna	D	2019-11-28
48	Mollie	T	2019-12-24
49	Zena	T	2020-09-02
50	Azalia	T	2020-12-07
51	Deirdre	T	2020-07-10
52	Lesley	B	2020-01-23
53	Uriah		2021-02-15
54	Ira		2019-07-05
55	Jameson	D	2019-11-28
56	Alea	T	2020-02-19
57	Kristen	B	2020-11-10
58	Zane	T	2020-06-09
59	Eric	T	2020-03-12
60	Quail		2020-02-29
61	Remedios	B	2020-09-26
62	Ingrid	M	2020-03-18
63	Mollie	B	2021-03-16
64	Haviva	B	2020-10-16
65	Claudia	M	2019-08-14
66	Rashad	M	2019-12-06
67	Hayley	T	2019-12-16
68	Madaline	T	2020-03-21
69	Regan	B	2019-10-08
70	Mariam		2020-08-30
71	Nichole	D	2020-07-17
72	Graiden	D	2019-09-21
73	Vaughan	T	2020-12-07
74	Karleigh	B	2020-04-14
75	Malachi		2021-05-09
76	Vanna	B	2019-07-11
77	Harrison	B	2020-05-19
78	Teagan	M	2019-06-14
79	Raymond	M	2020-11-03
80	Ina	B	2020-03-16
81	Dane	B	2019-10-20
82	Xander	B	2019-12-14
83	Zelenia	B	2020-05-22
84	Ori	M	2019-07-15
85	Kirby	M	2020-01-17
86	Bree	D	2021-01-03
87	Faith	M	2020-03-27
88	Ursa	M	2020-07-27
89	Francis	M	2020-05-14
90	Alden	T	2020-03-24
91	Quemby	D	2020-10-30
92	Evangeline	M	2020-10-27
93	Maris	B	2020-02-20
94	Quentin		2019-05-18
95	Kathleen	T	2019-08-17
96	Aurelia		2020-04-17
97	Jasper	M	2019-10-05
98	Shafira	D	2021-04-29
99	Nolan	B	2019-11-07
100	Graham	M	2020-06-01
2	Ricardo	B	2020-02-02
\.


--
-- TOC entry 2834 (class 0 OID 0)
-- Dependencies: 204
-- Name: empleado_idempleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_idempleado_seq', 115, true);


--
-- TOC entry 2698 (class 2606 OID 24619)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (idempleado);


--
-- TOC entry 2696 (class 2606 OID 16403)
-- Name: empleado2 tabla01_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado2
    ADD CONSTRAINT tabla01_pkey PRIMARY KEY ("idEmpleado");


-- Completed on 2020-07-15 15:21:25

--
-- PostgreSQL database dump complete
--

