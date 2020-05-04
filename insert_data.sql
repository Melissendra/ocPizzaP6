INSERT INTO public.restaurant(name)
VALUES ( 'Chez Sergio Leonne'),
        ( 'La Mama'),
        ('Capri');

INSERT INTO public.category(category_name)
VALUES ('pizzaiolo'),
        ('livreur'),
        ('client'),
        ('manager');

INSERT INTO public.user(lastname, firstname, birthday, user_category, used_password, active)
VALUES ( 'Lacroix', 'Tristan', '1998-30-03', 1, 'IdBX6UT', TRUE),
        ( 'Dufour', 'Emilie', '1984-25-12', 2, '06Jv2uV1', TRUE),
        ( 'Louis', 'Jacques', '1997-30-06', 3, 'K5wkf45W', FALSE),
        ( 'Blot', 'Hughes', '1980-29-05', 4, 'kzN9McLXIIv5', TRUE),
        ( 'Pichon', 'Capucine', '1970-26-01', 3, 'aYkrEZ', TRUE);

INSERT INTO public.address(street_number, street_name,zip_code, city, phone_number, mail, id_user, id_restaurant)
VALUES ('5', 'rue Noël Barbier', '45895', 'Chartier', '06 37 38 03 50', 'tristan24@free.fr',
       (SELECT id FROM public.user WHERE lastname = 'Lacroix' AND firstname = 'Tristan'), NULL),
        ('10', 'rue blot', ' 98350',  'Royer', '06 59 59 58 00', 'emilielenoir@hamel.com',
        (SELECT id FROM public.user WHERE lastname = 'Lenoir' AND firstname = 'Emilie'),NULL),
        ('35', 'rue de Gonzalez', '99374',  'Delmas', '+33 1 44 20 65 68', 'jacques99@tiscali.fr',
        (SELECT id FROM public.user WHERE lastname = 'Louis' AND firstname = 'Jacques'), NULL),
        ('657',  ' rue Roy', '09526' ,'Godard', '0377364340', 'blothughes@bouchet.fr',
        (SELECT id FROM public.user WHERE lastname = 'Blot' AND firstname = 'Hughes'), NULL),
        (' 714', 'rue de Albert', '83222', 'Sainte Astrid', '+33 4 18 28 58 42', 'cpichon@club-internet.fr',
        (SELECT id FROM public.user WHERE lastname = 'Pichon' AND firstname = 'Capucine'), NULL),
        ('62', 'rue Constance Teixeira', '45366', 'Peltier', '01 82 75 48 90', 'echarles@thibault.fr', NULL,
        (SELECT id FROM public.restaurant WHERE name = 'Chez Sergio Leonne')),
        ('10', 'boulevard de Vincent', '30823', 'Pelletier-sur-Mer', '0800920673', 'davidlorraine@maurice.com', NULL,
        (SELECT id FROM public.restaurant WHERE name = 'La Mama')),
        ('97', 'boulevard Thérèse Faure', '89651', 'Guibert', '+33 3 86 38 49 80', 'bruneaugilbert@renault.com', NULL,
        (SELECT id FROM public.restaurant WHERE name = 'Capri'));

INSERT INTO public.payment_mean_table(payment_mean)
VALUES('card'),
        ('change'),
        ('check');

INSERT INTO public.order_state(preparation_state)
VALUES('En attente'),
        ('En préparation'),
        ('Prête'),
        ('En cours de livraison'),
        ('Livrée');

INSERT INTO public.order(order_date, paiement_state, delivery, id_restaurant, id_address, id_payment_mean_table, id_order_state)
VALUES ('19-05-2019', TRUE, FALSE, 1, 1, 1, 3),
        ('29-12-2018', FALSE, TRUE, 2, 2, 2, 4 ),
        ('25-03-2019', TRUE, TRUE, 3, 3, 1, 5),
        ('23-10-2019', TRUE, FALSE, 1, 4, 3, 2),
        ('10-04-2020', FALSE, TRUE, 2, 5, 2, 1);

INSERT INTO public.stock(quantity, unity, price_per_unit, id_restaurant)
VALUES (2000, 'gramme', 0.1, 1),
       (4, 'boite', 0.30, 2),
       (100, 'gramme', 0.10, 3),
       (1000, 'gramme', 0.20, 1),
       (5000, 'gramme', 0.03, 3),
       (600, 'gramme', 0.02, 2),
       (10, 'unit', 0.25, 1);


INSERT INTO public.recipe(recipe_name, description)
VALUES('La tempete', ' '),
       ('Le soleil brille', ' '),
       ('Au pays des bretons', ' ');

INSERT INTO public.product(product_name, ingredient_name, id_stock)
VALUES('La tempete', 'pate à pizza', 3),
       ('La tempete', 'mozzarella', 1),
       ('La tempete', 'saumon', 2),
       ('La tempete', 'aneth', 1),
       ('Le soleil brille', 'pate à pizza',3),
       ('Le soleil brille', 'sauce tomate', 3),
       ('Le soleil brille', 'oeuf', 3),
       ('Le soleil brille', 'jambon', 3),
       ('Le soleil brille', 'mozarella', 3),
       ('Au pays des bretons', 'pate à pizza', 4),
        ('Au pays des bretons', 'sauce tomate', 4),
       ('Au pays des bretons', 'andouille', 4),
       ('Au pays des bretons', 'mozzarella', 4),
       ('Au pays des bretons', 'origan', 4);



INSERT INTO public.product_ingredient(ingredient_quantity, measure_unity, id_ingredient, id_product)
VALUES (150, 'gramme', 1, 1),
       (1, 'boite', 6, 2),
       (100, 'gramme', 2, 3),
       (1,'unit', 7, 2);

INSERT INTO public.basket_line(basket_date, product_amount, price, order_number_order, id_product)
VALUES ('12-05-2019', 4, 25.00, 1, 3),
       ('23-02-2020', 2, 12.5, 2, 6),
       ('05-03-2020', 3, 18.50, 3, 8),
       ('29-04-2020', 1, 8.50, 4, 2),
       ('15-12-2019', 6, 30.25, 5, 12);