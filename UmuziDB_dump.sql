--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3 (Ubuntu 12.3-1.pgdg19.10+1)

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
-- Name: customers; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.customers (
    customerid integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    gender character varying,
    address character varying(200),
    phone character varying(15),
    email character varying(100),
    city character varying(20),
    country character varying(50)
);


ALTER TABLE public.customers OWNER TO "user";

--
-- Name: customers_customerid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.customers_customerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customerid_seq OWNER TO "user";

--
-- Name: customers_customerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.customers_customerid_seq OWNED BY public.customers.customerid;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.employees (
    employeeid integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    email character varying(100),
    jobtitle character varying(20)
);


ALTER TABLE public.employees OWNER TO "user";

--
-- Name: employees_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.employees_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_employeeid_seq OWNER TO "user";

--
-- Name: employees_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.employees_employeeid_seq OWNED BY public.employees.employeeid;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.orders (
    orderid integer NOT NULL,
    productid integer,
    paymentid integer,
    fulfilledbyemployeeid integer,
    daterequired date,
    dateshipped date,
    status character varying(20)
);


ALTER TABLE public.orders OWNER TO "user";

--
-- Name: orders_orderid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.orders_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderid_seq OWNER TO "user";

--
-- Name: orders_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.payments (
    paymentid integer NOT NULL,
    customerid integer,
    paymentdate date,
    amount numeric
);


ALTER TABLE public.payments OWNER TO "user";

--
-- Name: payments_paymentid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.payments_paymentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_paymentid_seq OWNER TO "user";

--
-- Name: payments_paymentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.payments_paymentid_seq OWNED BY public.payments.paymentid;


--
-- Name: products; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    productname character varying(100),
    description character varying(300),
    buyprice numeric(6,2)
);


ALTER TABLE public.products OWNER TO "user";

--
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productid_seq OWNER TO "user";

--
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- Name: customers customerid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.customers ALTER COLUMN customerid SET DEFAULT nextval('public.customers_customerid_seq'::regclass);


--
-- Name: employees employeeid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employees ALTER COLUMN employeeid SET DEFAULT nextval('public.employees_employeeid_seq'::regclass);


--
-- Name: orders orderid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);


--
-- Name: payments paymentid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.payments ALTER COLUMN paymentid SET DEFAULT nextval('public.payments_paymentid_seq'::regclass);


--
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.customers (customerid, firstname, lastname, gender, address, phone, email, city, country) FROM stdin;
3	Leon	Glen	Male	81 Everton Rd,Gillits	0820832830	Leon@gmail.com	Durban	South Africa
4	Charl	Muller	M￼ale	290A Dorset Ecke	+44856872553	Charl.muller@yahoo.com	Berlin	Germany
5	Julia	Stein	Female	22 Wernerring	+448672445058	Js234@yahoo.com	Frankfurt	Germany
1	Lerato	Mabitso	Male	284 chaucer st	084789657	john@gmail.com	Johannesburg	South Africa
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.employees (employeeid, firstname, lastname, email, jobtitle) FROM stdin;
1	\nKani	Matthew	mat@gmail.com	Manager
2	Lesly	Cronje	LesC@gmail.com	Clerk
3	Gideon	Maduku	m@gmail.com	Accountant
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.orders (orderid, productid, paymentid, fulfilledbyemployeeid, daterequired, dateshipped, status) FROM stdin;
1	1	1	2	2018-05-09	\N	Not shipped
2	1	2	2	2018-04-09	2018-03-09	Shipped
3	3	3	3	2018-06-09	\N	Not shipped
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.payments (paymentid, customerid, paymentdate, amount) FROM stdin;
1	1	2018-01-09	150.75
2	5	2018-03-09	150.75
3	4	2018-03-09	700.60
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.products (productid, productname, description, buyprice) FROM stdin;
1	Harley Davidson Chopper	This replica features working kickstand, front suspension, gear-shift lever	150.75
2	Classic Car	Turnable front wheels, steering function	550.75
3	Sports car	Turnable front wheels, steering function	700.60
\.


--
-- Name: customers_customerid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.customers_customerid_seq', 5, true);


--
-- Name: employees_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.employees_employeeid_seq', 3, true);


--
-- Name: orders_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.orders_orderid_seq', 3, true);


--
-- Name: payments_paymentid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.payments_paymentid_seq', 3, true);


--
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.products_productid_seq', 3, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeeid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (paymentid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- Name: orders orders_fulfilledbyemployeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_fulfilledbyemployeeid_fkey FOREIGN KEY (fulfilledbyemployeeid) REFERENCES public.employees(employeeid);


--
-- Name: orders orders_paymentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_paymentid_fkey FOREIGN KEY (paymentid) REFERENCES public.payments(paymentid);


--
-- Name: orders orders_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: payments payments_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(customerid);


--
-- PostgreSQL database dump complete
--

