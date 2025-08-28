--
-- PostgreSQL database dump
--

\restrict CDrEB8bODmCedLnlerIlY3snaumvIZVg7N2TjmvsKLK2o1WbAysrWeNgKpdTkRx

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-08-28 23:18:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 223 (class 1259 OID 16860)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16867)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16892)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16891)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 228
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 227 (class 1259 OID 16884)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16875)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16874)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 225
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 218 (class 1259 OID 16827)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16826)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 221 (class 1259 OID 16844)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16939)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name text NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16938)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 236
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 231 (class 1259 OID 16904)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    price numeric(12,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16903)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 233 (class 1259 OID 16912)
-- Name: sales_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_transactions (
    id bigint NOT NULL,
    cashier_name character varying(50),
    total_amount numeric(12,2) DEFAULT '0'::numeric NOT NULL,
    payment character varying(255) DEFAULT 'cash'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT sales_transactions_payment_check CHECK (((payment)::text = ANY ((ARRAY['cash'::character varying, 'card'::character varying, 'wallet'::character varying])::text[])))
);


ALTER TABLE public.sales_transactions OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16911)
-- Name: sales_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_transactions_id_seq OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 232
-- Name: sales_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_transactions_id_seq OWNED BY public.sales_transactions.id;


--
-- TOC entry 222 (class 1259 OID 16851)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16922)
-- Name: transaction_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_items (
    id bigint NOT NULL,
    id_products bigint NOT NULL,
    id_sales bigint NOT NULL,
    quantity integer NOT NULL,
    price numeric(12,2) NOT NULL,
    subtotal numeric(12,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.transaction_items OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16921)
-- Name: transaction_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_items_id_seq OWNER TO postgres;

--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 234
-- Name: transaction_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_items_id_seq OWNED BY public.transaction_items.id;


--
-- TOC entry 220 (class 1259 OID 16834)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16833)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4800 (class 2604 OID 16895)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4799 (class 2604 OID 16878)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 16830)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4808 (class 2604 OID 16942)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 4802 (class 2604 OID 16907)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4804 (class 2604 OID 16915)
-- Name: sales_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transactions ALTER COLUMN id SET DEFAULT nextval('public.sales_transactions_id_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 16925)
-- Name: transaction_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_items ALTER COLUMN id SET DEFAULT nextval('public.transaction_items_id_seq'::regclass);


--
-- TOC entry 4798 (class 2604 OID 16837)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5000 (class 0 OID 16860)
-- Dependencies: 223
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- TOC entry 5001 (class 0 OID 16867)
-- Dependencies: 224
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 5006 (class 0 OID 16892)
-- Dependencies: 229
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 5004 (class 0 OID 16884)
-- Dependencies: 227
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 5003 (class 0 OID 16875)
-- Dependencies: 226
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 4995 (class 0 OID 16827)
-- Dependencies: 218
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_08_27_141212_create_products_table	1
5	2025_08_27_141842_create_sales_transactions_table	1
6	2025_08_27_143240_create_transaction_items_table	1
7	2025_08_27_160333_create_personal_access_tokens_table	1
\.


--
-- TOC entry 4998 (class 0 OID 16844)
-- Dependencies: 221
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 5014 (class 0 OID 16939)
-- Dependencies: 237
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5008 (class 0 OID 16904)
-- Dependencies: 231
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, stock, price, created_at, updated_at) FROM stdin;
1	Tango	10	3000.00	2025-08-28 15:54:15	2025-08-28 15:54:15
2	Oreo	20	5000.00	2025-08-28 15:54:22	2025-08-28 15:54:22
3	Chitato	15	12000.00	2025-08-28 15:54:28	2025-08-28 15:54:28
4	Indomie Goreng	50	3500.00	2025-08-28 15:54:40	2025-08-28 15:54:40
5	SilverQueen	12	15000.00	2025-08-28 15:54:47	2025-08-28 15:54:47
6	Kacang Garuda	18	8000.00	2025-08-28 15:54:53	2025-08-28 15:54:53
7	Roti Sari Roti	25	7000.00	2025-08-28 15:54:59	2025-08-28 15:54:59
8	Good Day Cappuccino	30	6000.00	2025-08-28 15:55:05	2025-08-28 15:55:05
9	Teh Botol Sosro	40	4000.00	2025-08-28 15:55:11	2025-08-28 15:55:11
10	Aqua 600ml	60	3000.00	2025-08-28 15:55:20	2025-08-28 15:55:20
\.


--
-- TOC entry 5010 (class 0 OID 16912)
-- Dependencies: 233
-- Data for Name: sales_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_transactions (id, cashier_name, total_amount, payment, created_at, updated_at) FROM stdin;
1	Zen	18000.00	cash	2025-08-28 15:57:12	2025-08-28 15:57:12
\.


--
-- TOC entry 4999 (class 0 OID 16851)
-- Dependencies: 222
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
gYkz7jUgMPDSProM2hgtrylcqdBFA8YJZ0Vn7nFj	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoieW0wNHRieDdqcTZnMFFRMmNIWFdzQkdOSDVKMW9XYWxBZ0ZFUEp2dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1756395705
\.


--
-- TOC entry 5012 (class 0 OID 16922)
-- Dependencies: 235
-- Data for Name: transaction_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_items (id, id_products, id_sales, quantity, price, subtotal, created_at, updated_at) FROM stdin;
1	1	1	2	3000.00	6000.00	2025-08-28 15:57:12	2025-08-28 15:57:12
2	3	1	1	12000.00	12000.00	2025-08-28 15:57:12	2025-08-28 15:57:12
\.


--
-- TOC entry 4997 (class 0 OID 16834)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 228
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 225
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 217
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 236
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 10, true);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 232
-- Name: sales_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_transactions_id_seq', 1, true);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 234
-- Name: transaction_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_items_id_seq', 2, true);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4825 (class 2606 OID 16873)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4823 (class 2606 OID 16866)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4832 (class 2606 OID 16900)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4834 (class 2606 OID 16902)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4830 (class 2606 OID 16890)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4827 (class 2606 OID 16882)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4811 (class 2606 OID 16832)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4817 (class 2606 OID 16850)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 4843 (class 2606 OID 16946)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4845 (class 2606 OID 16949)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 4836 (class 2606 OID 16910)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4838 (class 2606 OID 16920)
-- Name: sales_transactions sales_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_transactions
    ADD CONSTRAINT sales_transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 4820 (class 2606 OID 16857)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4840 (class 2606 OID 16927)
-- Name: transaction_items transaction_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_items
    ADD CONSTRAINT transaction_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4813 (class 2606 OID 16843)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4815 (class 2606 OID 16841)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4828 (class 1259 OID 16883)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4841 (class 1259 OID 16950)
-- Name: personal_access_tokens_expires_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_expires_at_index ON public.personal_access_tokens USING btree (expires_at);


--
-- TOC entry 4846 (class 1259 OID 16947)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 4818 (class 1259 OID 16859)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4821 (class 1259 OID 16858)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 4847 (class 2606 OID 16928)
-- Name: transaction_items transaction_items_id_products_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_items
    ADD CONSTRAINT transaction_items_id_products_foreign FOREIGN KEY (id_products) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4848 (class 2606 OID 16933)
-- Name: transaction_items transaction_items_id_sales_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_items
    ADD CONSTRAINT transaction_items_id_sales_foreign FOREIGN KEY (id_sales) REFERENCES public.sales_transactions(id) ON DELETE CASCADE;


-- Completed on 2025-08-28 23:18:57

--
-- PostgreSQL database dump complete
--

\unrestrict CDrEB8bODmCedLnlerIlY3snaumvIZVg7N2TjmvsKLK2o1WbAysrWeNgKpdTkRx

