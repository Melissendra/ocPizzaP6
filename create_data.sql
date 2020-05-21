-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3-alpha
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- object: livreur | type: ROLE --
-- DROP ROLE IF EXISTS livreur;
CREATE ROLE livreur WITH ;
-- ddl-end --


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: "OCPizza" | type: DATABASE --
-- -- DROP DATABASE IF EXISTS "OCPizza";
-- CREATE DATABASE "OCPizza";
-- -- ddl-end --
-- 

-- object: public.restaurant | type: TABLE --
-- DROP TABLE IF EXISTS public.restaurant CASCADE;
CREATE TABLE public.restaurant (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(100),
	CONSTRAINT "Restaurant_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.restaurant OWNER TO postgres;
-- ddl-end --

-- object: public."user" | type: TABLE --
-- DROP TABLE IF EXISTS public."user" CASCADE;
CREATE TABLE public."user" (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 MINVALUE 0 MAXVALUE 2147483647 START WITH 1 CACHE 1 ),
	lastname varchar(255) NOT NULL,
	firstname varchar(255) NOT NULL,
	birthday varchar(255) NOT NULL,
	used_password varchar(255) NOT NULL,
	activity boolean NOT NULL,
	id_restaurant integer,
	id_category integer,
	CONSTRAINT utilisateur_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."user" OWNER TO postgres;
-- ddl-end --

-- object: restaurant_fk | type: CONSTRAINT --
-- ALTER TABLE public."user" DROP CONSTRAINT IF EXISTS restaurant_fk CASCADE;
ALTER TABLE public."user" ADD CONSTRAINT restaurant_fk FOREIGN KEY (id_restaurant)
REFERENCES public.restaurant (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.category | type: TABLE --
-- DROP TABLE IF EXISTS public.category CASCADE;
CREATE TABLE public.category (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 MINVALUE 0 MAXVALUE 2147483647 START WITH 1 CACHE 1 ),
	category_name varchar(255),
	CONSTRAINT function_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.category OWNER TO postgres;
-- ddl-end --

-- object: category_fk | type: CONSTRAINT --
-- ALTER TABLE public."user" DROP CONSTRAINT IF EXISTS category_fk CASCADE;
ALTER TABLE public."user" ADD CONSTRAINT category_fk FOREIGN KEY (id_category)
REFERENCES public.category (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.address | type: TABLE --
-- DROP TABLE IF EXISTS public.address CASCADE;
CREATE TABLE public.address (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	street_number integer,
	street_name varchar(255),
	zip_code varchar(255),
	city varchar(255),
	phone_number varchar(255),
	mail varchar(255),
	id_user integer,
	id_restaurant integer,
	CONSTRAINT address_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.address OWNER TO postgres;
-- ddl-end --

-- object: user_fk | type: CONSTRAINT --
-- ALTER TABLE public.address DROP CONSTRAINT IF EXISTS user_fk CASCADE;
ALTER TABLE public.address ADD CONSTRAINT user_fk FOREIGN KEY (id_user)
REFERENCES public."user" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: restaurant_fk | type: CONSTRAINT --
-- ALTER TABLE public.address DROP CONSTRAINT IF EXISTS restaurant_fk CASCADE;
ALTER TABLE public.address ADD CONSTRAINT restaurant_fk FOREIGN KEY (id_restaurant)
REFERENCES public.restaurant (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: address_uq | type: CONSTRAINT --
-- ALTER TABLE public.address DROP CONSTRAINT IF EXISTS address_uq CASCADE;
ALTER TABLE public.address ADD CONSTRAINT address_uq UNIQUE (id_restaurant);
-- ddl-end --

-- object: public."order" | type: TABLE --
-- DROP TABLE IF EXISTS public."order" CASCADE;
CREATE TABLE public."order" (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	order_date varchar(255),
	paiement_state boolean NOT NULL,
	delivery boolean NOT NULL,
	id_restaurant integer NOT NULL,
	id_address integer NOT NULL,
	id_payment_mean_table integer,
	id_order_state integer NOT NULL,
	CONSTRAINT order_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."order" OWNER TO postgres;
-- ddl-end --

-- object: restaurant_fk | type: CONSTRAINT --
-- ALTER TABLE public."order" DROP CONSTRAINT IF EXISTS restaurant_fk CASCADE;
ALTER TABLE public."order" ADD CONSTRAINT restaurant_fk FOREIGN KEY (id_restaurant)
REFERENCES public.restaurant (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: address_fk | type: CONSTRAINT --
-- ALTER TABLE public."order" DROP CONSTRAINT IF EXISTS address_fk CASCADE;
ALTER TABLE public."order" ADD CONSTRAINT address_fk FOREIGN KEY (id_address)
REFERENCES public.address (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.payment_mean_table | type: TABLE --
-- DROP TABLE IF EXISTS public.payment_mean_table CASCADE;
CREATE TABLE public.payment_mean_table (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 MINVALUE 0 MAXVALUE 2147483647 START WITH 1 CACHE 1 ),
	payment_mean varchar(255),
	CONSTRAINT payment_mean_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.payment_mean_table OWNER TO postgres;
-- ddl-end --

-- object: public.order_state | type: TABLE --
-- DROP TABLE IF EXISTS public.order_state CASCADE;
CREATE TABLE public.order_state (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 MINVALUE 0 MAXVALUE 2147483647 START WITH 1 CACHE 1 ),
	preparation_state varchar(255) NOT NULL,
	CONSTRAINT order_state_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.order_state OWNER TO postgres;
-- ddl-end --

-- object: payment_mean_table_fk | type: CONSTRAINT --
-- ALTER TABLE public."order" DROP CONSTRAINT IF EXISTS payment_mean_table_fk CASCADE;
ALTER TABLE public."order" ADD CONSTRAINT payment_mean_table_fk FOREIGN KEY (id_payment_mean_table)
REFERENCES public.payment_mean_table (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.basket_line | type: TABLE --
-- DROP TABLE IF EXISTS public.basket_line CASCADE;
CREATE TABLE public.basket_line (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 MINVALUE 0 MAXVALUE 2147483647 START WITH 1 CACHE 1 ),
	basket_date varchar(255),
	product_amount integer,
	price decimal,
	id_product integer NOT NULL,
	id_order integer,
	CONSTRAINT basket_line_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.basket_line OWNER TO postgres;
-- ddl-end --

-- object: public.product | type: TABLE --
-- DROP TABLE IF EXISTS public.product CASCADE;
CREATE TABLE public.product (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 MINVALUE 0 MAXVALUE 2147483647 START WITH 1 CACHE 1 ),
	product_name varchar(255),
	id_recipe integer,
	CONSTRAINT product_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.product OWNER TO postgres;
-- ddl-end --

-- object: order_fk | type: CONSTRAINT --
-- ALTER TABLE public.basket_line DROP CONSTRAINT IF EXISTS order_fk CASCADE;
ALTER TABLE public.basket_line ADD CONSTRAINT order_fk FOREIGN KEY (id_order)
REFERENCES public."order" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: product_fk | type: CONSTRAINT --
-- ALTER TABLE public.basket_line DROP CONSTRAINT IF EXISTS product_fk CASCADE;
ALTER TABLE public.basket_line ADD CONSTRAINT product_fk FOREIGN KEY (id_product)
REFERENCES public.product (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.product_ingredient | type: TABLE --
-- DROP TABLE IF EXISTS public.product_ingredient CASCADE;
CREATE TABLE public.product_ingredient (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 MINVALUE 0 MAXVALUE 2147483647 START WITH 1 CACHE 1 ),
	ingredient_quantity integer,
	measure_unity varchar(50) NOT NULL,
	id_product integer,
	id_ingredient integer,
	CONSTRAINT product_ingredient_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.product_ingredient OWNER TO postgres;
-- ddl-end --

-- object: public.recipe | type: TABLE --
-- DROP TABLE IF EXISTS public.recipe CASCADE;
CREATE TABLE public.recipe (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT BY 1 MINVALUE 0 MAXVALUE 2147483647 START WITH 1 CACHE 1 ),
	recipe_name varchar(50),
	description text NOT NULL,
	CONSTRAINT recipes_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.recipe OWNER TO postgres;
-- ddl-end --

-- object: public.stock | type: TABLE --
-- DROP TABLE IF EXISTS public.stock CASCADE;
CREATE TABLE public.stock (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	quantity integer,
	unity varchar(50) NOT NULL,
	price_per_unit decimal,
	id_restaurant integer NOT NULL,
	id_product integer,
	CONSTRAINT stock_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.stock OWNER TO postgres;
-- ddl-end --

-- object: restaurant_fk | type: CONSTRAINT --
-- ALTER TABLE public.stock DROP CONSTRAINT IF EXISTS restaurant_fk CASCADE;
ALTER TABLE public.stock ADD CONSTRAINT restaurant_fk FOREIGN KEY (id_restaurant)
REFERENCES public.restaurant (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: order_state_fk | type: CONSTRAINT --
-- ALTER TABLE public."order" DROP CONSTRAINT IF EXISTS order_state_fk CASCADE;
ALTER TABLE public."order" ADD CONSTRAINT order_state_fk FOREIGN KEY (id_order_state)
REFERENCES public.order_state (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: recipe_fk | type: CONSTRAINT --
-- ALTER TABLE public.product DROP CONSTRAINT IF EXISTS recipe_fk CASCADE;
ALTER TABLE public.product ADD CONSTRAINT recipe_fk FOREIGN KEY (id_recipe)
REFERENCES public.recipe (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: product_uq | type: CONSTRAINT --
-- ALTER TABLE public.product DROP CONSTRAINT IF EXISTS product_uq CASCADE;
ALTER TABLE public.product ADD CONSTRAINT product_uq UNIQUE (id_recipe);
-- ddl-end --

-- object: product_fk | type: CONSTRAINT --
-- ALTER TABLE public.product_ingredient DROP CONSTRAINT IF EXISTS product_fk CASCADE;
ALTER TABLE public.product_ingredient ADD CONSTRAINT product_fk FOREIGN KEY (id_product)
REFERENCES public.product (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: product_fk1 | type: CONSTRAINT --
-- ALTER TABLE public.product_ingredient DROP CONSTRAINT IF EXISTS product_fk1 CASCADE;
ALTER TABLE public.product_ingredient ADD CONSTRAINT product_fk1 FOREIGN KEY (id_ingredient)
REFERENCES public.product (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: product_fk | type: CONSTRAINT --
-- ALTER TABLE public.stock DROP CONSTRAINT IF EXISTS product_fk CASCADE;
ALTER TABLE public.stock ADD CONSTRAINT product_fk FOREIGN KEY (id_product)
REFERENCES public.product (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


