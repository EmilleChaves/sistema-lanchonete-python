--
-- PostgreSQL database cluster dump
--

-- Started on 2026-04-14 23:37:39

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "atividade01" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12
-- Dumped by pg_dump version 15.12

-- Started on 2026-04-14 23:37:39

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
-- TOC entry 3357 (class 1262 OID 22516)
-- Name: atividade01; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE atividade01 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE atividade01 OWNER TO postgres;

\connect atividade01

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
-- TOC entry 215 (class 1259 OID 22518)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(50),
    email character varying(50)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 22538)
-- Name: clientes02; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes02 (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    email character varying(50)
);


ALTER TABLE public.clientes02 OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 22537)
-- Name: clientes02_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes02_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes02_id_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 218
-- Name: clientes02_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes02_id_seq OWNED BY public.clientes02.id;


--
-- TOC entry 214 (class 1259 OID 22517)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 214
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 217 (class 1259 OID 22526)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id integer NOT NULL,
    cliente_id integer,
    data date,
    valor numeric(10,2)
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 22545)
-- Name: pedidos02; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos02 (
    id integer NOT NULL,
    cliente_id integer,
    data date,
    valor numeric(10,2)
);


ALTER TABLE public.pedidos02 OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 22544)
-- Name: pedidos02_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos02_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos02_id_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 220
-- Name: pedidos02_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos02_id_seq OWNED BY public.pedidos02.id;


--
-- TOC entry 216 (class 1259 OID 22525)
-- Name: pedidos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_id_seq OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 216
-- Name: pedidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_id_seq OWNED BY public.pedidos.id;


--
-- TOC entry 3188 (class 2604 OID 22521)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 22541)
-- Name: clientes02 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes02 ALTER COLUMN id SET DEFAULT nextval('public.clientes02_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 22529)
-- Name: pedidos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN id SET DEFAULT nextval('public.pedidos_id_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 22548)
-- Name: pedidos02 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos02 ALTER COLUMN id SET DEFAULT nextval('public.pedidos02_id_seq'::regclass);


--
-- TOC entry 3345 (class 0 OID 22518)
-- Dependencies: 215
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nome, email) FROM stdin;
2	Paulo	paulo@email.com
3	Marcia	marcia@email.com
1	Ana	anamaria@email.com
\.


--
-- TOC entry 3349 (class 0 OID 22538)
-- Dependencies: 219
-- Data for Name: clientes02; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes02 (id, nome, email) FROM stdin;
2	Paulo César	pauloc@email.com
3	Marcia Hellen	marciah@email.com
1	Ana Paula	anapaula@email.com
\.


--
-- TOC entry 3347 (class 0 OID 22526)
-- Dependencies: 217
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (id, cliente_id, data, valor) FROM stdin;
1	1	2025-07-11	120.00
2	3	2024-11-28	24.90
3	3	2023-08-11	13.00
\.


--
-- TOC entry 3351 (class 0 OID 22545)
-- Dependencies: 221
-- Data for Name: pedidos02; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos02 (id, cliente_id, data, valor) FROM stdin;
1	2	2025-01-23	129.90
2	3	2024-02-14	130.50
3	3	2020-11-15	29.90
7	2	2025-01-23	129.90
8	3	2024-02-14	130.50
9	3	2020-11-15	29.90
\.


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 218
-- Name: clientes02_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes02_id_seq', 6, true);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 214
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 3, true);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 220
-- Name: pedidos02_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos02_id_seq', 9, true);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 216
-- Name: pedidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_seq', 3, true);


--
-- TOC entry 3197 (class 2606 OID 22543)
-- Name: clientes02 clientes02_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes02
    ADD CONSTRAINT clientes02_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 22523)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 22550)
-- Name: pedidos02 pedidos02_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos02
    ADD CONSTRAINT pedidos02_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 22531)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 22532)
-- Name: pedidos fk_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT fk_clientes FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


--
-- TOC entry 3201 (class 2606 OID 22551)
-- Name: pedidos02 fk_clientes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos02
    ADD CONSTRAINT fk_clientes FOREIGN KEY (cliente_id) REFERENCES public.clientes(id);


-- Completed on 2026-04-14 23:37:40

--
-- PostgreSQL database dump complete
--

--
-- Database "carros" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12
-- Dumped by pg_dump version 15.12

-- Started on 2026-04-14 23:37:40

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
-- TOC entry 3325 (class 1262 OID 22421)
-- Name: carros; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE carros WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE carros OWNER TO postgres;

\connect carros

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
-- TOC entry 214 (class 1259 OID 22422)
-- Name: carro_a; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carro_a (
    nome character varying(50)
);


ALTER TABLE public.carro_a OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 22425)
-- Name: carro_b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carro_b (
    nome character varying(50)
);


ALTER TABLE public.carro_b OWNER TO postgres;

--
-- TOC entry 3318 (class 0 OID 22422)
-- Dependencies: 214
-- Data for Name: carro_a; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carro_a (nome) FROM stdin;
Corsa
Opala
Fusca
Ferrari
\.


--
-- TOC entry 3319 (class 0 OID 22425)
-- Dependencies: 215
-- Data for Name: carro_b; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carro_b (nome) FROM stdin;
Corsa
Monza
Fusca
Bugatti
\.


-- Completed on 2026-04-14 23:37:41

--
-- PostgreSQL database dump complete
--

--
-- Database "ecormerce" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12
-- Dumped by pg_dump version 15.12

-- Started on 2026-04-14 23:37:41

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
-- TOC entry 3320 (class 1262 OID 22428)
-- Name: ecormerce; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ecormerce WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE ecormerce OWNER TO postgres;

\connect ecormerce

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
-- TOC entry 214 (class 1259 OID 22429)
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    value numeric(10,2)
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- TOC entry 3314 (class 0 OID 22429)
-- Dependencies: 214
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (value) FROM stdin;
1200.00
3000.00
5000.00
7800.00
10000.00
\.


-- Completed on 2026-04-14 23:37:42

--
-- PostgreSQL database dump complete
--

--
-- Database "exercicio01" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12
-- Dumped by pg_dump version 15.12

-- Started on 2026-04-14 23:37:42

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
-- TOC entry 3347 (class 1262 OID 22556)
-- Name: exercicio01; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE exercicio01 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE exercicio01 OWNER TO postgres;

\connect exercicio01

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
-- TOC entry 220 (class 1255 OID 22669)
-- Name: gerenciar_cliente(text, integer, text, text, text); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.gerenciar_cliente(IN p_operacao text, IN p_id integer DEFAULT NULL::integer, IN p_nome text DEFAULT NULL::text, IN p_telefone text DEFAULT NULL::text, IN p_pedido text DEFAULT NULL::text)
    LANGUAGE plpgsql
    AS $$
BEGIN

    IF p_operacao = 'INSERT' THEN
        INSERT INTO clientes (nome, telefone, pedido)
        VALUES (p_nome, p_telefone, p_pedido);

    ELSIF p_operacao = 'UPDATE' THEN
        UPDATE clientes
        SET nome = p_nome,
            telefone = p_telefone,
            pedido = p_pedido
        WHERE id = p_id;

    ELSIF p_operacao = 'DELETE' THEN
        DELETE FROM clientes
        WHERE id = p_id;

    ELSE
        RAISE EXCEPTION 'Operação inválida!';
    END IF;

END;
$$;


ALTER PROCEDURE public.gerenciar_cliente(IN p_operacao text, IN p_id integer, IN p_nome text, IN p_telefone text, IN p_pedido text) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 22620)
-- Name: cidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cidades (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.cidades OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 22619)
-- Name: cidades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cidades_id_seq OWNER TO postgres;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 214
-- Name: cidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cidades_id_seq OWNED BY public.cidades.id;


--
-- TOC entry 219 (class 1259 OID 22660)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(100),
    telefone character varying(20),
    pedido character varying(5000),
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 22659)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 218
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 217 (class 1259 OID 22647)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id integer NOT NULL,
    pessoa_id integer NOT NULL,
    produto character varying(100),
    valor numeric(10,2)
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 22646)
-- Name: pedidos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_id_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 216
-- Name: pedidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_id_seq OWNED BY public.pedidos.id;


--
-- TOC entry 3184 (class 2604 OID 22623)
-- Name: cidades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidades ALTER COLUMN id SET DEFAULT nextval('public.cidades_id_seq'::regclass);


--
-- TOC entry 3186 (class 2604 OID 22663)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 22650)
-- Name: pedidos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN id SET DEFAULT nextval('public.pedidos_id_seq'::regclass);


--
-- TOC entry 3337 (class 0 OID 22620)
-- Dependencies: 215
-- Data for Name: cidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cidades (id, nome) FROM stdin;
1	São Paulo
2	Rio de Janeiro
3	Curitiba
\.


--
-- TOC entry 3341 (class 0 OID 22660)
-- Dependencies: 219
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nome, telefone, pedido, criado_em) FROM stdin;
3	Lucas Henrique	77 9999-9999	X-Bacon / sem salada	2026-04-01 12:25:43.879794
9	Gisele	7798878-7795	X-tudo	2026-04-07 19:56:32.306845
12	Pedro			2026-04-07 22:33:55.66273
14	Orlando	77 98852-4463	Hyper-boy	2026-04-07 22:55:27.317583
15	Marcos	77 998154-6674	Misto	2026-04-07 23:03:44.579578
16				2026-04-07 23:40:19.882071
17	Theo	7798856-4526	misto	2026-04-08 20:19:20.106792
18	leo		misto / coca 1L	2026-04-08 22:40:15.920235
19	Santos		Frando / sem salada	2026-04-08 22:46:48.779411
20	maria		1 coma litro	2026-04-08 22:51:06.137361
8	Carla Chaves	77 988899999	Misto/ coca 1L	2026-04-02 16:38:40.77277
21	julia		misto / coca lata	2026-04-08 23:05:18.215473
7	Sandra Betecorte	7798848-8475	X-Frango	2026-04-01 22:17:22.034974
25	lívia		3 mistos	2026-04-09 14:49:22.795105
\.


--
-- TOC entry 3339 (class 0 OID 22647)
-- Dependencies: 217
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (id, pessoa_id, produto, valor) FROM stdin;
1	1	Notebook	3500.00
2	1	Mouse	150.00
3	3	Celular	2500.00
4	4	Teclado	300.00
\.


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 214
-- Name: cidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cidades_id_seq', 3, true);


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 218
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 25, true);


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 216
-- Name: pedidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_seq', 4, true);


--
-- TOC entry 3189 (class 2606 OID 22625)
-- Name: cidades cidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 22668)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 22652)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id);


-- Completed on 2026-04-14 23:37:43

--
-- PostgreSQL database dump complete
--

--
-- Database "movieflix" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12
-- Dumped by pg_dump version 15.12

-- Started on 2026-04-14 23:37:43

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
-- TOC entry 3347 (class 1262 OID 22313)
-- Name: movieflix; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE movieflix WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE movieflix OWNER TO postgres;

\connect movieflix

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
-- TOC entry 217 (class 1259 OID 22398)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 22397)
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO postgres;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 216
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- TOC entry 219 (class 1259 OID 22405)
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 22404)
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 218
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- TOC entry 215 (class 1259 OID 22391)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying(100),
    release_date date,
    genre_id integer,
    language_id integer,
    oscar_count integer
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 22390)
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 214
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- TOC entry 3184 (class 2604 OID 22401)
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 22408)
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 22394)
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- TOC entry 3339 (class 0 OID 22398)
-- Dependencies: 217
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (id, name) FROM stdin;
1	Ação
2	Suspense
3	Aventura
4	Terror
5	Comédia
6	Romance
10	Drama
\.


--
-- TOC entry 3341 (class 0 OID 22405)
-- Dependencies: 219
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, name) FROM stdin;
1	Português
2	Inglês
3	Espahol
4	Japonês
5	Francês
\.


--
-- TOC entry 3337 (class 0 OID 22391)
-- Dependencies: 215
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (id, title, release_date, genre_id, language_id, oscar_count) FROM stdin;
53	A grande aposta	2016-01-14	3	2	10
55	A grande aposta	2016-01-14	1	2	\N
56	Parasita	2019-05-30	10	2	\N
57	Uma mente brilhante	2002-02-15	3	2	\N
58	O jogo da imitação	2014-09-28	3	2	\N
59	Gênio indomável	1998-02-20	1	2	\N
60	Cisne negro	2011-02-04	10	2	1
61	Duna	2021-10-21	1	2	\N
62	Turma da mônica: lições	2021-12-30	3	1	\N
63	Minha mãe é uma peça 3	2019-12-26	5	1	\N
64	High Life	2018-11-07	1	5	\N
65	Mademoiselle vingança	2018-09-12	6	2	1
\.


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 216
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_id_seq', 13, true);


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 218
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 5, true);


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 214
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_id_seq', 65, true);


--
-- TOC entry 3189 (class 2606 OID 22403)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 22410)
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 22396)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 22411)
-- Name: movies fk_genre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- TOC entry 3193 (class 2606 OID 22416)
-- Name: movies fk_languege; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT fk_languege FOREIGN KEY (language_id) REFERENCES public.languages(id);


-- Completed on 2026-04-14 23:37:44

--
-- PostgreSQL database dump complete
--

-- Completed on 2026-04-14 23:37:44

--
-- PostgreSQL database cluster dump complete
--

