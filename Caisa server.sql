--
-- PostgreSQL database cluster dump
--

-- Started on 2024-08-15 01:51:31

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md5f7fe817dc7593d12df05a2520e7c09bd';






--
-- Database creation
--

CREATE DATABASE "Caisa" WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect "Caisa"

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.26
-- Dumped by pg_dump version 9.4.26
-- Started on 2024-08-15 01:51:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 24750)
-- Name: datos_piezas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.datos_piezas (
    id_pieza integer NOT NULL,
    numero integer,
    codigo integer,
    cantidad integer,
    "diseño" integer,
    control_fisico character varying(255),
    observaciones character varying(255),
    sobrante integer,
    causa character varying(255),
    puestoid_puesto integer,
    operacionesid_operaciones integer NOT NULL,
    puestoid_puesto2 integer NOT NULL
);


ALTER TABLE public.datos_piezas OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 24756)
-- Name: datos_piezas_id_pieza_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datos_piezas_id_pieza_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.datos_piezas_id_pieza_seq OWNER TO postgres;

--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 174
-- Name: datos_piezas_id_pieza_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.datos_piezas_id_pieza_seq OWNED BY public.datos_piezas.id_pieza;


--
-- TOC entry 175 (class 1259 OID 24758)
-- Name: herramientas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.herramientas (
    id_herramienta integer NOT NULL,
    nombre character varying(255),
    cantidad character varying(255),
    proveedor character varying(255),
    puesto integer,
    puestoid_puesto integer NOT NULL
);


ALTER TABLE public.herramientas OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 24764)
-- Name: herramientas_id_herramienta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.herramientas_id_herramienta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.herramientas_id_herramienta_seq OWNER TO postgres;

--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 176
-- Name: herramientas_id_herramienta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.herramientas_id_herramienta_seq OWNED BY public.herramientas.id_herramienta;


--
-- TOC entry 177 (class 1259 OID 24766)
-- Name: insumos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.insumos (
    id_insumos integer NOT NULL,
    nombre character varying(255),
    "U/M" character varying(255),
    cantidad numeric(19,0),
    causa character varying(255),
    puestoid_puesto integer NOT NULL
);


ALTER TABLE public.insumos OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 24772)
-- Name: insumos_id_insumos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insumos_id_insumos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insumos_id_insumos_seq OWNER TO postgres;

--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 178
-- Name: insumos_id_insumos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insumos_id_insumos_seq OWNED BY public.insumos.id_insumos;


--
-- TOC entry 179 (class 1259 OID 24774)
-- Name: operaciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.operaciones (
    id_operaciones integer NOT NULL,
    nombre_operacion character varying(255),
    descripcion character varying(255)
);


ALTER TABLE public.operaciones OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 24780)
-- Name: operaciones_id_operaciones_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operaciones_id_operaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operaciones_id_operaciones_seq OWNER TO postgres;

--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 180
-- Name: operaciones_id_operaciones_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operaciones_id_operaciones_seq OWNED BY public.operaciones.id_operaciones;


--
-- TOC entry 181 (class 1259 OID 24782)
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.personal (
    id_personal integer NOT NULL,
    nombre character varying(255),
    password character varying(255),
    puestoid_puesto integer NOT NULL
);


ALTER TABLE public.personal OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 24788)
-- Name: personal_id_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_id_personal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_id_personal_seq OWNER TO postgres;

--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 182
-- Name: personal_id_personal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_id_personal_seq OWNED BY public.personal.id_personal;


--
-- TOC entry 183 (class 1259 OID 24790)
-- Name: puesto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.puesto (
    id_puesto integer NOT NULL,
    nombre_puesto character varying(255),
    puesto character varying(255),
    grupo integer,
    tallerid_taller character varying(255) NOT NULL
);


ALTER TABLE public.puesto OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 24796)
-- Name: puesto_id_puesto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puesto_id_puesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puesto_id_puesto_seq OWNER TO postgres;

--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 184
-- Name: puesto_id_puesto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puesto_id_puesto_seq OWNED BY public.puesto.id_puesto;


--
-- TOC entry 185 (class 1259 OID 24798)
-- Name: taller; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.taller (
    id_taller character varying(255) NOT NULL,
    nombre_taller character varying(255)
);


ALTER TABLE public.taller OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 24804)
-- Name: tipo_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.tipo_usuario (
    id_tipo integer NOT NULL,
    admin character varying(255),
    "user" integer,
    user_especial integer,
    personalid_personal integer NOT NULL
);


ALTER TABLE public.tipo_usuario OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 24807)
-- Name: tipo_usuario_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_usuario_id_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_usuario_id_tipo_seq OWNER TO postgres;

--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 187
-- Name: tipo_usuario_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_usuario_id_tipo_seq OWNED BY public.tipo_usuario.id_tipo;


--
-- TOC entry 188 (class 1259 OID 24880)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.usuarios (
    "idUser" character varying,
    username character varying,
    password character varying,
    rol character varying
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 1933 (class 2604 OID 24809)
-- Name: id_pieza; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datos_piezas ALTER COLUMN id_pieza SET DEFAULT nextval('public.datos_piezas_id_pieza_seq'::regclass);


--
-- TOC entry 1934 (class 2604 OID 24810)
-- Name: id_herramienta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.herramientas ALTER COLUMN id_herramienta SET DEFAULT nextval('public.herramientas_id_herramienta_seq'::regclass);


--
-- TOC entry 1935 (class 2604 OID 24811)
-- Name: id_insumos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos ALTER COLUMN id_insumos SET DEFAULT nextval('public.insumos_id_insumos_seq'::regclass);


--
-- TOC entry 1936 (class 2604 OID 24812)
-- Name: id_operaciones; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operaciones ALTER COLUMN id_operaciones SET DEFAULT nextval('public.operaciones_id_operaciones_seq'::regclass);


--
-- TOC entry 1937 (class 2604 OID 24813)
-- Name: id_personal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal ALTER COLUMN id_personal SET DEFAULT nextval('public.personal_id_personal_seq'::regclass);


--
-- TOC entry 1938 (class 2604 OID 24814)
-- Name: id_puesto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puesto ALTER COLUMN id_puesto SET DEFAULT nextval('public.puesto_id_puesto_seq'::regclass);


--
-- TOC entry 1939 (class 2604 OID 24815)
-- Name: id_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_usuario ALTER COLUMN id_tipo SET DEFAULT nextval('public.tipo_usuario_id_tipo_seq'::regclass);


--
-- TOC entry 2078 (class 0 OID 24750)
-- Dependencies: 173
-- Data for Name: datos_piezas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.datos_piezas (id_pieza, numero, codigo, cantidad, "diseño", control_fisico, observaciones, sobrante, causa, puestoid_puesto, operacionesid_operaciones, puestoid_puesto2) FROM stdin;
1	1	1	100	1	Control 1	Ninguna	5	Causa 1	1	1	2
2	2	2	200	2	Control 2	Ninguna	10	Causa 2	2	2	3
3	3	3	150	3	Control 3	Ninguna	7	Causa 3	3	3	4
4	4	4	250	4	Control 4	Ninguna	12	Causa 4	4	4	5
5	5	5	300	5	Control 5	Ninguna	15	Causa 5	5	5	6
\.


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 174
-- Name: datos_piezas_id_pieza_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datos_piezas_id_pieza_seq', 1, false);


--
-- TOC entry 2080 (class 0 OID 24758)
-- Dependencies: 175
-- Data for Name: herramientas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.herramientas (id_herramienta, nombre, cantidad, proveedor, puesto, puestoid_puesto) FROM stdin;
1	Martillo	50	Proveedor A	1	1
2	Destornillador	100	Proveedor B	2	2
3	Llave Inglesa	75	Proveedor C	3	3
4	Taladro	30	Proveedor D	4	4
5	Sierra	20	Proveedor E	5	5
6	Alicate	40	Proveedor F	6	6
\.


--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 176
-- Name: herramientas_id_herramienta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.herramientas_id_herramienta_seq', 1, false);


--
-- TOC entry 2082 (class 0 OID 24766)
-- Dependencies: 177
-- Data for Name: insumos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insumos (id_insumos, nombre, "U/M", cantidad, causa, puestoid_puesto) FROM stdin;
1	Tornillos	Piezas	500	Reparación	1
2	Clavos	Piezas	1000	Construcción	2
3	Madera	Metros	200	Carpintería	3
4	Pintura	Litros	50	Decoración	4
5	Cemento	Sacos	30	Construcción	5
6	Cables	Metros	100	Electricidad	6
\.


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 178
-- Name: insumos_id_insumos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insumos_id_insumos_seq', 1, false);


--
-- TOC entry 2084 (class 0 OID 24774)
-- Dependencies: 179
-- Data for Name: operaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operaciones (id_operaciones, nombre_operacion, descripcion) FROM stdin;
1	\N	Operación 1
2	\N	Operación 2
3	\N	Operación 3
4	\N	Operación 4
5	\N	Operación 5
7	Corte	Operación de corte de materiales
8	Soldadura	Operación de soldadura de piezas
9	Pintura	Operación de pintura de superficies
10	Montaje	Operación de montaje de componentes
11	Inspección	Operación de inspección de calidad
12	Embalaje	Operación de embalaje de productos
\.


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 180
-- Name: operaciones_id_operaciones_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.operaciones_id_operaciones_seq', 1, false);


--
-- TOC entry 2086 (class 0 OID 24782)
-- Dependencies: 181
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal (id_personal, nombre, password, puestoid_puesto) FROM stdin;
1	Juan Pérez	password123	1
2	María López	password456	2
3	Carlos García	password789	3
4	Ana Martínez	password101	4
5	Luis Rodríguez	password202	5
6	Sofía Fernández	password303	6
\.


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 182
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_id_personal_seq', 1, false);


--
-- TOC entry 2088 (class 0 OID 24790)
-- Dependencies: 183
-- Data for Name: puesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.puesto (id_puesto, nombre_puesto, puesto, grupo, tallerid_taller) FROM stdin;
1	Gerente	Administración	1	1
2	Supervisor	Producción	2	2
3	Operario	Producción	2	3
4	Contador	Finanzas	3	4
5	Ingeniero	Desarrollo	4	5
6	Técnico	Mantenimiento	5	6
\.


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 184
-- Name: puesto_id_puesto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puesto_id_puesto_seq', 1, false);


--
-- TOC entry 2090 (class 0 OID 24798)
-- Dependencies: 185
-- Data for Name: taller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taller (id_taller, nombre_taller) FROM stdin;
3758-00005	Estructura
3758-00006	Subconjuntos
3774-00204	Terminacion
1013000	Enchapado
1160215	Haces de Cables
1	Taller 1
2	Taller 2
3	Taller 3
4	Taller 4
5	Taller 5
6	Taller 6
\.


--
-- TOC entry 2091 (class 0 OID 24804)
-- Dependencies: 186
-- Data for Name: tipo_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_usuario (id_tipo, admin, "user", user_especial, personalid_personal) FROM stdin;
1	1	0	0	1
2	0	1	0	2
3	0	0	1	3
4	1	0	0	4
5	0	1	0	5
6	0	0	1	6
\.


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 187
-- Name: tipo_usuario_id_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_usuario_id_tipo_seq', 1, false);


--
-- TOC entry 2093 (class 0 OID 24880)
-- Dependencies: 188
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios ("idUser", username, password, rol) FROM stdin;
1	pepe	pepe2323	ADMIN
\.


--
-- TOC entry 1941 (class 2606 OID 24817)
-- Name: datos_piezas_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.datos_piezas
    ADD CONSTRAINT datos_piezas_codigo_key UNIQUE (codigo);


--
-- TOC entry 1943 (class 2606 OID 24819)
-- Name: datos_piezas_numero_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.datos_piezas
    ADD CONSTRAINT datos_piezas_numero_key UNIQUE (numero);


--
-- TOC entry 1945 (class 2606 OID 24821)
-- Name: datos_piezas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.datos_piezas
    ADD CONSTRAINT datos_piezas_pkey PRIMARY KEY (id_pieza);


--
-- TOC entry 1947 (class 2606 OID 24823)
-- Name: herramientas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.herramientas
    ADD CONSTRAINT herramientas_pkey PRIMARY KEY (id_herramienta);


--
-- TOC entry 1949 (class 2606 OID 24825)
-- Name: insumos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT insumos_pkey PRIMARY KEY (id_insumos);


--
-- TOC entry 1951 (class 2606 OID 24827)
-- Name: operaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.operaciones
    ADD CONSTRAINT operaciones_pkey PRIMARY KEY (id_operaciones);


--
-- TOC entry 1953 (class 2606 OID 24829)
-- Name: personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (id_personal);


--
-- TOC entry 1955 (class 2606 OID 24831)
-- Name: puesto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.puesto
    ADD CONSTRAINT puesto_pkey PRIMARY KEY (id_puesto);


--
-- TOC entry 1957 (class 2606 OID 24833)
-- Name: taller_nombre_taller_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.taller
    ADD CONSTRAINT taller_nombre_taller_key UNIQUE (nombre_taller);


--
-- TOC entry 1959 (class 2606 OID 24835)
-- Name: taller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.taller
    ADD CONSTRAINT taller_pkey PRIMARY KEY (id_taller);


--
-- TOC entry 1961 (class 2606 OID 24837)
-- Name: tipo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (id_tipo);


--
-- TOC entry 1962 (class 2606 OID 24838)
-- Name: fkdatos_piez343013; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datos_piezas
    ADD CONSTRAINT fkdatos_piez343013 FOREIGN KEY (puestoid_puesto2) REFERENCES public.puesto(id_puesto);


--
-- TOC entry 1963 (class 2606 OID 24843)
-- Name: fkdatos_piez596061; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datos_piezas
    ADD CONSTRAINT fkdatos_piez596061 FOREIGN KEY (operacionesid_operaciones) REFERENCES public.operaciones(id_operaciones);


--
-- TOC entry 1964 (class 2606 OID 24848)
-- Name: fkherramient661392; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.herramientas
    ADD CONSTRAINT fkherramient661392 FOREIGN KEY (puestoid_puesto) REFERENCES public.puesto(id_puesto);


--
-- TOC entry 1965 (class 2606 OID 24853)
-- Name: fkinsumos855644; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT fkinsumos855644 FOREIGN KEY (puestoid_puesto) REFERENCES public.puesto(id_puesto);


--
-- TOC entry 1966 (class 2606 OID 24858)
-- Name: fkpersonal593015; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT fkpersonal593015 FOREIGN KEY (puestoid_puesto) REFERENCES public.puesto(id_puesto);


--
-- TOC entry 1967 (class 2606 OID 24863)
-- Name: fkpuesto338335; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puesto
    ADD CONSTRAINT fkpuesto338335 FOREIGN KEY (tallerid_taller) REFERENCES public.taller(id_taller);


--
-- TOC entry 1968 (class 2606 OID 24868)
-- Name: fktipo_usuar652597; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT fktipo_usuar652597 FOREIGN KEY (personalid_personal) REFERENCES public.personal(id_personal);


--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-08-15 01:51:32

--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.26
-- Dumped by pg_dump version 9.4.26
-- Started on 2024-08-15 01:51:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 1990
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 2 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1994 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 1995 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-08-15 01:51:32

--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.26
-- Dumped by pg_dump version 9.4.26
-- Started on 2024-08-15 01:51:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

--
-- TOC entry 1990 (class 0 OID 0)
-- Dependencies: 1989
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-08-15 01:51:32

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-08-15 01:51:32

--
-- PostgreSQL database cluster dump complete
--

