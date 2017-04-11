--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS stmmdb;
--
-- Name: stmmdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE stmmdb WITH TEMPLATE = template0 ENCODING = 'WIN1250' LC_COLLATE = 'Hungarian_Hungary.1250' LC_CTYPE = 'Hungarian_Hungary.1250';


ALTER DATABASE stmmdb OWNER TO postgres;

\connect stmmdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: appuser_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE appuser_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE appuser_record_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE appuser (
    appuser_record_id numeric DEFAULT nextval('appuser_record_id_seq'::regclass),
    appuser_id character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    wallet_id character varying(100),
    password character varying(100) NOT NULL,
    appuser_creditcard_card_number character varying(16)
);


ALTER TABLE appuser OWNER TO postgres;

--
-- Name: credit_card_record_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE credit_card_record_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE credit_card_record_number_seq OWNER TO postgres;

--
-- Name: creditcard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE creditcard (
    credit_card_record_number integer NOT NULL,
    creditcard_card_number character varying(16) DEFAULT NULL::character varying NOT NULL,
    creditcard_appuser_id character varying(100) NOT NULL,
    creditcard_card_holder_name character varying(100) NOT NULL,
    creditcard_expiry_year character varying(2) NOT NULL,
    creditcard_expiry_month character varying(2) NOT NULL
);


ALTER TABLE creditcard OWNER TO postgres;

--
-- Name: creditcard_credit_card_record_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE creditcard_credit_card_record_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE creditcard_credit_card_record_number_seq OWNER TO postgres;

--
-- Name: creditcard_credit_card_record_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE creditcard_credit_card_record_number_seq OWNED BY creditcard.credit_card_record_number;


--
-- Name: deadline_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE deadline_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE deadline_record_id_seq OWNER TO postgres;

--
-- Name: deadline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE deadline (
    deadline_record_id numeric DEFAULT nextval('deadline_record_id_seq'::regclass),
    money_transfer_part_id character varying(100) NOT NULL,
    deadline_id character varying(100) NOT NULL,
    deadline_state character varying(100)
);


ALTER TABLE deadline OWNER TO postgres;

--
-- Name: deadline_state_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE deadline_state_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE deadline_state_record_id_seq OWNER TO postgres;

--
-- Name: deadline_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE deadline_state (
    deadline_state_record_id integer DEFAULT nextval('deadline_state_record_id_seq'::regclass),
    deadline_state_id character varying(100) NOT NULL,
    deadline_state_name character varying(100) NOT NULL
);


ALTER TABLE deadline_state OWNER TO postgres;

--
-- Name: money_transfer_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE money_transfer_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE money_transfer_record_id_seq OWNER TO postgres;

--
-- Name: money_transfer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE money_transfer (
    money_transfer_record_id numeric DEFAULT nextval('money_transfer_record_id_seq'::regclass),
    moneytransfer_id character varying(100) NOT NULL,
    wallet_from character varying(100) NOT NULL,
    wallet_to character varying(100) NOT NULL,
    transferdate date,
    returndate date,
    number_of_payments integer DEFAULT 1,
    money_transfer_state_id character varying(30)
);


ALTER TABLE money_transfer OWNER TO postgres;

--
-- Name: money_transfer_part_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE money_transfer_part_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE money_transfer_part_id_seq OWNER TO postgres;

--
-- Name: money_transfer_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE money_transfer_part (
    money_transfer_part_record_id numeric DEFAULT nextval('money_transfer_part_id_seq'::regclass),
    money_transfer_part_id character varying(100) NOT NULL,
    money_transfer_id character varying(100) NOT NULL,
    return_date date,
    amount numeric(2,0)
);


ALTER TABLE money_transfer_part OWNER TO postgres;

--
-- Name: money_transfer_part_state_record_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE money_transfer_part_state_record_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE money_transfer_part_state_record_id OWNER TO postgres;

--
-- Name: money_transfer_part_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE money_transfer_part_state (
    money_transfer_part_state_record_id integer DEFAULT nextval('money_transfer_part_state_record_id'::regclass),
    money_transfer_part_id character varying(100) NOT NULL,
    money_transfer_part_name character varying(100) NOT NULL
);


ALTER TABLE money_transfer_part_state OWNER TO postgres;

--
-- Name: moneytransfer_state_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE moneytransfer_state_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moneytransfer_state_record_id_seq OWNER TO postgres;

--
-- Name: money_transfer_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE money_transfer_state (
    money_transfer_state_record_id integer DEFAULT nextval('moneytransfer_state_record_id_seq'::regclass),
    money_transfer_state_id character varying(100) NOT NULL,
    money_transfer_state_name character varying(100)
);


ALTER TABLE money_transfer_state OWNER TO postgres;

--
-- Name: registration_per_day; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE registration_per_day (
    day character varying(8),
    count bigint
);


ALTER TABLE registration_per_day OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE role (
    role_id integer NOT NULL,
    role_name character varying(100) NOT NULL
);


ALTER TABLE role OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_role_id_seq OWNER TO postgres;

--
-- Name: role_role_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_role_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_role_id_seq1 OWNER TO postgres;

--
-- Name: role_role_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_role_id_seq1 OWNED BY role.role_id;


--
-- Name: userrole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE userrole (
    userrole_id integer NOT NULL,
    userrole_appuser_id character varying(100) NOT NULL,
    userrole_usertype_id character varying(100) NOT NULL
);


ALTER TABLE userrole OWNER TO postgres;

--
-- Name: userrole_userrole_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE userrole_userrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userrole_userrole_id_seq OWNER TO postgres;

--
-- Name: userrole_userrole_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE userrole_userrole_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userrole_userrole_id_seq1 OWNER TO postgres;

--
-- Name: userrole_userrole_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE userrole_userrole_id_seq1 OWNED BY userrole.userrole_id;


--
-- Name: usertype_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usertype_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usertype_record_id_seq OWNER TO postgres;

--
-- Name: usertype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usertype (
    usertype_record_id integer DEFAULT nextval('usertype_record_id_seq'::regclass),
    usertype_id character varying(100) NOT NULL,
    usertype character varying(100) NOT NULL,
    state integer NOT NULL
);


ALTER TABLE usertype OWNER TO postgres;

--
-- Name: wallet_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wallet_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wallet_record_id_seq OWNER TO postgres;

--
-- Name: wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE wallet (
    wallet_record_id numeric DEFAULT nextval('wallet_record_id_seq'::regclass),
    wallet_id character varying(100) NOT NULL,
    amount numeric
);


ALTER TABLE wallet OWNER TO postgres;

--
-- Name: creditcard credit_card_record_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY creditcard ALTER COLUMN credit_card_record_number SET DEFAULT nextval('creditcard_credit_card_record_number_seq'::regclass);


--
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN role_id SET DEFAULT nextval('role_role_id_seq1'::regclass);


--
-- Name: userrole userrole_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userrole ALTER COLUMN userrole_id SET DEFAULT nextval('userrole_userrole_id_seq1'::regclass);


--
-- Data for Name: appuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY appuser (appuser_record_id, appuser_id, username, first_name, last_name, wallet_id, password, appuser_creditcard_card_number) FROM stdin;
20	20170405-4	smiklos	Miklós	Sebestyén	\N	$2a$10$pJUihxmWEAyfWGiApqqqAOvzO0LSrzUF48yK3L7fcCY/TkApld5.C	1234123412341234
21	20170405-5	nPisti	Pisti	Nagy	\N	$2a$10$WUpF4Rso99PJo7VsNWdS3O3tlbKvsbTDYRjuy0EszEZf.2nB6tOxW	5678567856785678
17	20170402-2	pNagy	Péter	Nagy	\N	$2a$10$dQ4shd7MSrdBK7qZaCPrWO8gqKBEs2UwhAr1e9aS925lvcPSgq42K	2345234523452345
23	20170409-2	jKis	János	Kis	\N	$2a$10$yfdgIRhxpd9TtKu3qZxRh.4fTfT0CbhIWIjTe4z1so9Z/smZFgiZm	\N
24	20170409-3	kMeter	Kilo	Meter	\N	$2a$10$pJUihxmWEAyfWGiApqqqAOvzO0LSrzUF48yK3L7fcCY/TkApld5.C	\N
25	20170411-1	jTeszt	Józsi	Teszt	\N	$2a$10$kqZoeo0Vcd.q7ACxQYzP8eLjnZoRMLLXtbK3IDnRSwhBBDg7/a6ta	\N
\.


--
-- Name: appuser_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('appuser_record_id_seq', 25, true);


--
-- Name: credit_card_record_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('credit_card_record_number_seq', 1, false);


--
-- Data for Name: creditcard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY creditcard (credit_card_record_number, creditcard_card_number, creditcard_appuser_id, creditcard_card_holder_name, creditcard_expiry_year, creditcard_expiry_month) FROM stdin;
1	1234123412341234	20170405-4	Miklos Sebestyen	17	11
2	5678567856785678	20170405-5	Pist Nagy	23	06
3	2345234523452345	20170402-2	Peter Nagy	20	06
\.


--
-- Name: creditcard_credit_card_record_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('creditcard_credit_card_record_number_seq', 3, true);


--
-- Data for Name: deadline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY deadline (deadline_record_id, money_transfer_part_id, deadline_id, deadline_state) FROM stdin;
\.


--
-- Name: deadline_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('deadline_record_id_seq', 1, false);


--
-- Data for Name: deadline_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY deadline_state (deadline_state_record_id, deadline_state_id, deadline_state_name) FROM stdin;
\.


--
-- Name: deadline_state_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('deadline_state_record_id_seq', 1, false);


--
-- Data for Name: money_transfer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY money_transfer (money_transfer_record_id, moneytransfer_id, wallet_from, wallet_to, transferdate, returndate, number_of_payments, money_transfer_state_id) FROM stdin;
\.


--
-- Data for Name: money_transfer_part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY money_transfer_part (money_transfer_part_record_id, money_transfer_part_id, money_transfer_id, return_date, amount) FROM stdin;
\.


--
-- Name: money_transfer_part_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('money_transfer_part_id_seq', 1, false);


--
-- Data for Name: money_transfer_part_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY money_transfer_part_state (money_transfer_part_state_record_id, money_transfer_part_id, money_transfer_part_name) FROM stdin;
\.


--
-- Name: money_transfer_part_state_record_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('money_transfer_part_state_record_id', 1, false);


--
-- Name: money_transfer_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('money_transfer_record_id_seq', 1, false);


--
-- Data for Name: money_transfer_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY money_transfer_state (money_transfer_state_record_id, money_transfer_state_id, money_transfer_state_name) FROM stdin;
\.


--
-- Name: moneytransfer_state_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('moneytransfer_state_record_id_seq', 1, false);


--
-- Data for Name: registration_per_day; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY registration_per_day (day, count) FROM stdin;
20170502	1
20171002	1
20171202	1
20171702	1
20173402	1
20173802	1
20170602	1
20172002	1
20174202	1
20172202	1
20174302	1
20170402	2
20170405	5
20170409	3
20170411	1
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role (role_id, role_name) FROM stdin;
1	GUEST
2	REGISTERED
\.


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_role_id_seq', 1, false);


--
-- Name: role_role_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_role_id_seq1', 2, true);


--
-- Data for Name: userrole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY userrole (userrole_id, userrole_appuser_id, userrole_usertype_id) FROM stdin;
4	20170402-2	REGISTERED
5	20170405-4	REGISTERED
6	20170405-5	REGISTERED
7	20170411-1	REGISTERED
\.


--
-- Name: userrole_userrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('userrole_userrole_id_seq', 1, false);


--
-- Name: userrole_userrole_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('userrole_userrole_id_seq1', 7, true);


--
-- Data for Name: usertype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usertype (usertype_record_id, usertype_id, usertype, state) FROM stdin;
9	REGISTERED	REGISTERED	1
10	RELIABLE	RELIABLE	3
11	SUSPICIOUS	SUSPICIOUS	-1
12	OWING	OWING	-2
13	PROVED	PROVED	2
14	ADMINISTRATOR	ADMINISTRATOR	100
15	GUEST	GUEST	-100
\.


--
-- Name: usertype_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usertype_record_id_seq', 15, true);


--
-- Data for Name: wallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY wallet (wallet_record_id, wallet_id, amount) FROM stdin;
9	HU-11111111	12000.22
10	HU-11111112	99000.11
11	UK-11111111	99011.44
12	US-11111111	11111.55
\.


--
-- Name: wallet_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('wallet_record_id_seq', 12, true);


--
-- Name: creditcard creditcard_creditcard_card_number_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY creditcard
    ADD CONSTRAINT creditcard_creditcard_card_number_pk PRIMARY KEY (creditcard_card_number);


--
-- Name: money_transfer_state money_transfer_state_money_transfer_state_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY money_transfer_state
    ADD CONSTRAINT money_transfer_state_money_transfer_state_name_key UNIQUE (money_transfer_state_name);


--
-- Name: appuser pk_appuser_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appuser
    ADD CONSTRAINT pk_appuser_id PRIMARY KEY (appuser_id);


--
-- Name: deadline pk_deadline; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deadline
    ADD CONSTRAINT pk_deadline PRIMARY KEY (deadline_id);


--
-- Name: deadline_state pk_deadline_state; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deadline_state
    ADD CONSTRAINT pk_deadline_state PRIMARY KEY (deadline_state_id);


--
-- Name: money_transfer_part pk_moneay_transfer_part; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY money_transfer_part
    ADD CONSTRAINT pk_moneay_transfer_part PRIMARY KEY (money_transfer_part_id);


--
-- Name: money_transfer pk_money_transfer; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY money_transfer
    ADD CONSTRAINT pk_money_transfer PRIMARY KEY (moneytransfer_id);


--
-- Name: money_transfer_state pk_moneytransfer_state; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY money_transfer_state
    ADD CONSTRAINT pk_moneytransfer_state PRIMARY KEY (money_transfer_state_id);


--
-- Name: role pk_role_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT pk_role_id PRIMARY KEY (role_id);


--
-- Name: userrole pk_userrole_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT pk_userrole_id PRIMARY KEY (userrole_id);


--
-- Name: usertype pk_usertype_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usertype
    ADD CONSTRAINT pk_usertype_id PRIMARY KEY (usertype_id);


--
-- Name: wallet pk_wallet_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wallet
    ADD CONSTRAINT pk_wallet_id PRIMARY KEY (wallet_id);


--
-- Name: registration_per_day registration_per_day_day_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registration_per_day
    ADD CONSTRAINT registration_per_day_day_key UNIQUE (day);


--
-- Name: role role_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_role_name_key UNIQUE (role_name);


--
-- Name: appuser_creditcard_number_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX appuser_creditcard_number_uindex ON appuser USING btree (appuser_creditcard_card_number);


--
-- Name: appuser_username_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX appuser_username_uindex ON appuser USING btree (username);


--
-- Name: creditcard_creditcard_card_number_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX creditcard_creditcard_card_number_uindex ON creditcard USING btree (creditcard_card_number);


--
-- Name: ui_appuser_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ui_appuser_name ON appuser USING btree (username);


--
-- Name: usertype_state_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usertype_state_uindex ON usertype USING btree (state);


--
-- Name: appuser appuser_creditcard_creditcard_card_number_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appuser
    ADD CONSTRAINT appuser_creditcard_creditcard_card_number_fk FOREIGN KEY (appuser_creditcard_card_number) REFERENCES creditcard(creditcard_card_number) ON UPDATE CASCADE;


--
-- Name: creditcard creditcard_appuser_appuser_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY creditcard
    ADD CONSTRAINT creditcard_appuser_appuser_id_fk FOREIGN KEY (creditcard_appuser_id) REFERENCES appuser(appuser_id);


--
-- Name: money_transfer_part fk_money_transfer_in_money_transfer_part; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY money_transfer_part
    ADD CONSTRAINT fk_money_transfer_in_money_transfer_part FOREIGN KEY (money_transfer_id) REFERENCES money_transfer(moneytransfer_id);


--
-- Name: deadline fk_money_transfer_part_in_deadline; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deadline
    ADD CONSTRAINT fk_money_transfer_part_in_deadline FOREIGN KEY (money_transfer_part_id) REFERENCES money_transfer(moneytransfer_id);


--
-- Name: appuser fk_wallet_in_appuser; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appuser
    ADD CONSTRAINT fk_wallet_in_appuser FOREIGN KEY (wallet_id) REFERENCES wallet(wallet_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: userrole userrole_appuser_appuser_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT userrole_appuser_appuser_id_fk FOREIGN KEY (userrole_appuser_id) REFERENCES appuser(appuser_id);


--
-- Name: userrole userrole_usertype_usertype_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY userrole
    ADD CONSTRAINT userrole_usertype_usertype_id_fk FOREIGN KEY (userrole_usertype_id) REFERENCES usertype(usertype_id) ON UPDATE CASCADE;


--
-- Name: appuser; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE appuser TO bookstore_role;


--
-- Name: usertype; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE usertype TO bookstore_role;


--
-- PostgreSQL database dump complete
--

