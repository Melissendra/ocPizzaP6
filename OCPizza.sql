--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-4)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

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
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer NOT NULL,
    street_number integer,
    street_name character varying(255),
    zip_code character varying(255),
    city character varying(255),
    phone_number character varying(255),
    mail character varying(255),
    id_user integer,
    id_restaurant integer
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.address ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: basket_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_line (
    id integer NOT NULL,
    basket_date character varying(255),
    product_amount integer,
    price numeric,
    id_product integer NOT NULL,
    id_order integer
);


ALTER TABLE public.basket_line OWNER TO postgres;

--
-- Name: basket_line_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.basket_line ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.basket_line_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category_name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    order_date character varying(255),
    paiement_state boolean NOT NULL,
    delivery boolean NOT NULL,
    id_restaurant integer NOT NULL,
    id_address integer NOT NULL,
    id_payment_mean_table integer,
    id_order_state integer NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."order" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: order_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_state (
    id integer NOT NULL,
    preparation_state character varying(255) NOT NULL
);


ALTER TABLE public.order_state OWNER TO postgres;

--
-- Name: order_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_state ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_state_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: payment_mean_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_mean_table (
    id integer NOT NULL,
    payment_mean character varying(255)
);


ALTER TABLE public.payment_mean_table OWNER TO postgres;

--
-- Name: payment_mean_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payment_mean_table ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payment_mean_table_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    product_name character varying(255),
    id_recipe integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_ingredient (
    id integer NOT NULL,
    ingredient_quantity integer,
    measure_unity character varying(50) NOT NULL,
    id_product integer,
    id_ingredient integer
);


ALTER TABLE public.product_ingredient OWNER TO postgres;

--
-- Name: product_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_ingredient ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe (
    id integer NOT NULL,
    recipe_name character varying(50),
    description text NOT NULL
);


ALTER TABLE public.recipe OWNER TO postgres;

--
-- Name: recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.recipe ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.restaurant OWNER TO postgres;

--
-- Name: restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.restaurant ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id integer NOT NULL,
    quantity integer,
    unity character varying(50) NOT NULL,
    price_per_unit numeric,
    id_restaurant integer NOT NULL,
    id_product integer
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- Name: stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.stock ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    lastname character varying(255) NOT NULL,
    firstname character varying(255) NOT NULL,
    birthday character varying(255) NOT NULL,
    used_password character varying(255),
    active boolean NOT NULL,
    id_restaurant integer,
    id_category integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (id, street_number, street_name, zip_code, city, phone_number, mail, id_user, id_restaurant) FROM stdin;
1	5	rue Noël Barbier	45895	Chartier	06 37 38 03 50	tristan24@free.fr	1	\N
2	10	rue blot	 98350	Royer	06 59 59 58 00	emilielenoir@hamel.com	\N	\N
3	35	rue de Gonzalez	99374	Delmas	+33 1 44 20 65 68	jacques99@tiscali.fr	3	\N
4	657	 rue Roy	09526	Godard	0377364340	blothughes@bouchet.fr	4	\N
5	714	rue de Albert	83222	Sainte Astrid	+33 4 18 28 58 42	cpichon@club-internet.fr	5	\N
6	62	rue Constance Teixeira	45366	Peltier	01 82 75 48 90	echarles@thibault.fr	\N	1
7	10	boulevard de Vincent	30823	Pelletier-sur-Mer	0800920673	davidlorraine@maurice.com	\N	2
8	97	boulevard Thérèse Faure	89651	Guibert	+33 3 86 38 49 80	bruneaugilbert@renault.com	\N	3
\.


--
-- Data for Name: basket_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_line (id, basket_date, product_amount, price, id_product, id_order) FROM stdin;
1	19-05-2019	4	25.00	1	1
2	19-05-2019	4	12.00	2	1
3	10-04-2020	1	12.5	3	2
4	10-04-2020	1	5.5	8	2
5	29-12-2018	3	18.50	6	3
6	29-12-2018	3	18.50	8	3
7	25-02-2020	1	8.50	1	4
8	25-02-2020	1	2.0	1	4
9	12-01-2020	6	30.25	3	6
10	25-03-2019	6	30.25	6	5
11	05-05-2020	7	42.25	6	7
12	23-10-2019	6	30.25	1	8
13	10-04-2020	2	25.00	6	9
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, category_name) FROM stdin;
1	pizzaiolo
2	livreur
3	client
4	manager
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, order_date, paiement_state, delivery, id_restaurant, id_address, id_payment_mean_table, id_order_state) FROM stdin;
1	19-05-2019	t	f	1	1	1	3
2	10-04-2020	t	f	2	3	1	1
3	29-12-2018	f	t	2	2	2	4
4	25-02-2020	f	f	1	5	3	3
5	25-03-2019	t	t	3	3	1	5
6	12-01-2020	t	t	2	3	3	4
7	05-05-2020	t	t	1	4	2	5
8	23-10-2019	t	f	1	4	3	2
9	10-04-2020	f	t	2	5	2	1
\.


--
-- Data for Name: order_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_state (id, preparation_state) FROM stdin;
1	En attente
2	En préparation
3	Prête
4	En cours de livraison
5	Livrée
\.


--
-- Data for Name: payment_mean_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_mean_table (id, payment_mean) FROM stdin;
1	card
2	change
3	check
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, product_name, id_recipe) FROM stdin;
1	La tempete	1
2	coca cola	\N
3	Le soleil brille	2
4	oeuf	\N
5	mozzarella	\N
6	Au pays des bretons	\N
7	pate à  pizza	\N
8	glace macadamia	\N
9	sauce tomate	\N
10	peperroni	\N
11	origan	\N
12	jambon	\N
13	roquefort	\N
14	chorizo	\N
15	champignons	\N
16	crème fraiche	\N
17	saumon	\N
18	aneth	\N
\.


--
-- Data for Name: product_ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_ingredient (id, ingredient_quantity, measure_unity, id_product, id_ingredient) FROM stdin;
1	150	gramme	\N	5
2	1	boite	\N	9
3	100	gramme	\N	\N
4	1	unit	8	8
5	1	pincée	6	18
\.


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe (id, recipe_name, description) FROM stdin;
1	La tempete	pate à pizza, sauce tomate, peperonni, chorizo, origan, mozzarella
2	Le soleil brille	pate à pizza, sauce tomate, jambon, champignons, oeuf, roquefort 
3	Au pays des bretons	pate à pizza, crème fraiche, saumon, aneth, mozzarella
\.


--
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant (id, name) FROM stdin;
1	Chez Sergio Leonne
2	La Mama
3	Capri
\.


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (id, quantity, unity, price_per_unit, id_restaurant, id_product) FROM stdin;
1	2000	gramme	0.1	1	\N
2	4	boite	0.30	2	\N
3	1	boite	0.30	1	\N
4	5	cannette	1.5	2	\N
5	100	gramme	0.10	3	\N
6	100	gramme	0.10	1	\N
7	1000	gramme	0.20	1	\N
8	1000	gramme	0.20	3	\N
9	50000	gramme	0.03	3	\N
10	600	gramme	0.02	2	\N
11	20	pot	2.25	1	\N
12	30	pot	2.25	2	\N
13	50	egg_unit	0.10	2	\N
14	20	egg_unit	0.10	3	\N
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, lastname, firstname, birthday, used_password, active, id_restaurant, id_category) FROM stdin;
1	Lacroix	Tristan	1998-30-03	IdBX6UT	t	1	1
2	Dufour	Emilie	1984-25-12	06Jv2uV1	t	2	2
3	Louis	Jacques	1997-30-06	K5wkf45W	f	3	3
4	Blot	Hughes	1980-29-05	kzN9McLXIIv5	t	1	4
5	Pichon	Capucine	1970-26-01	aYkrEZ	t	2	3
\.


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 8, true);


--
-- Name: basket_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_line_id_seq', 13, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 4, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 9, true);


--
-- Name: order_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_state_id_seq', 5, true);


--
-- Name: payment_mean_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_mean_table_id_seq', 3, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 18, true);


--
-- Name: product_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_ingredient_id_seq', 5, true);


--
-- Name: recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipe_id_seq', 3, true);


--
-- Name: restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_id_seq', 3, true);


--
-- Name: stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_id_seq', 14, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


--
-- Name: restaurant Restaurant_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT "Restaurant_pk" PRIMARY KEY (id);


--
-- Name: address address_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pk PRIMARY KEY (id);


--
-- Name: address address_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_uq UNIQUE (id_restaurant);


--
-- Name: basket_line basket_line_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_line
    ADD CONSTRAINT basket_line_pk PRIMARY KEY (id);


--
-- Name: category function_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT function_pk PRIMARY KEY (id);


--
-- Name: order order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- Name: order_state order_state_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_state
    ADD CONSTRAINT order_state_pk PRIMARY KEY (id);


--
-- Name: payment_mean_table payment_mean_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_mean_table
    ADD CONSTRAINT payment_mean_pk PRIMARY KEY (id);


--
-- Name: product_ingredient product_ingredient_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT product_ingredient_pk PRIMARY KEY (id);


--
-- Name: product product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pk PRIMARY KEY (id);


--
-- Name: product product_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_uq UNIQUE (id_recipe);


--
-- Name: recipe recipes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipes_pk PRIMARY KEY (id);


--
-- Name: stock stock_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (id);


--
-- Name: user utilisateur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (id);


--
-- Name: order address_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT address_fk FOREIGN KEY (id_address) REFERENCES public.address(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: user category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT category_fk FOREIGN KEY (id_category) REFERENCES public.category(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_line order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_line
    ADD CONSTRAINT order_fk FOREIGN KEY (id_order) REFERENCES public."order"(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order order_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_state_fk FOREIGN KEY (id_order_state) REFERENCES public.order_state(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: order payment_mean_table_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT payment_mean_table_fk FOREIGN KEY (id_payment_mean_table) REFERENCES public.payment_mean_table(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_line product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_line
    ADD CONSTRAINT product_fk FOREIGN KEY (id_product) REFERENCES public.product(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: product_ingredient product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT product_fk FOREIGN KEY (id_product) REFERENCES public.product(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: stock product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT product_fk FOREIGN KEY (id_product) REFERENCES public.product(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product_ingredient product_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT product_fk1 FOREIGN KEY (id_ingredient) REFERENCES public.product(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product recipe_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT recipe_fk FOREIGN KEY (id_recipe) REFERENCES public.recipe(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: user restaurant_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT restaurant_fk FOREIGN KEY (id_restaurant) REFERENCES public.restaurant(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: address restaurant_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT restaurant_fk FOREIGN KEY (id_restaurant) REFERENCES public.restaurant(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order restaurant_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT restaurant_fk FOREIGN KEY (id_restaurant) REFERENCES public.restaurant(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: stock restaurant_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT restaurant_fk FOREIGN KEY (id_restaurant) REFERENCES public.restaurant(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: address user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT user_fk FOREIGN KEY (id_user) REFERENCES public."user"(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

