INSERT INTO public.restaurant(name)
VALUES ( 'Chez Sergio Leonne'),
        ( 'La Mama'),
        ('Capri');

INSERT INTO public.category(category_name)
VALUES ('pizzaiolo'),
        ('livreur'),
        ('client'),
        ('manager');

INSERT INTO public.user(lastname, firstname, birthday, used_password, active, id_category, id_restaurant)
VALUES ( 'Lacroix', 'Tristan', '1998-30-03', 'IdBX6UT', TRUE, 1, 1),
        ( 'Dufour', 'Emilie', '1984-25-12', '06Jv2uV1', TRUE, 2, 2),
        ( 'Louis', 'Jacques', '1997-30-06', 'K5wkf45W', FALSE, 3, 3),
        ( 'Blot', 'Hughes', '1980-29-05', 'kzN9McLXIIv5', TRUE, 4, 1),
        ( 'Pichon', 'Capucine', '1970-26-01', 'aYkrEZ', TRUE, 3, 2);

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
       ('10-04-2020', TRUE, FALSE, 2, 3, 1, 1),
        ('29-12-2018', FALSE, TRUE, 2, 2, 2, 4 ),
       ('25-02-2020', FALSE, FALSE, 1, 5, 3, 3),
        ('25-03-2019', TRUE, TRUE, 3, 3, 1, 5),
       ('12-01-2020', TRUE, TRUE, 2, 3, 3, 4),
       ('05-05-2020', TRUE, TRUE, 1, 4, 2, 5),
        ('23-10-2019', TRUE, FALSE, 1, 4, 3, 2),
        ('10-04-2020', FALSE, TRUE, 2, 5, 2, 1);

INSERT INTO public.stock(quantity, unity, price_per_unit, id_restaurant, id_product)
VALUES (2000, 'gramme', 0.1, 1, (SELECT id FROM public.product WHERE product_name = 'mozzarella')),
       (4, 'boite', 0.30, 2, (SELECT id FROM public.product WHERE product_name = 'sauce tomates')),
       (1, 'boite', 0.30, 1, (SELECT id FROM public.product WHERE product_name = 'sauce tomates')),
       (5, 'cannette',1.5,  2, (SELECT id FROM public.product WHERE product_name = 'coca cola')),
       (100, 'gramme', 0.10, 3, (SELECT id FROM public.product WHERE product_name = 'origan')),
       (100, 'gramme', 0.10, 1, (SELECT id FROM public.product WHERE product_name = 'origan')),
       (1000, 'gramme', 0.20, 1, (SELECT id FROM public.product WHERE product_name = 'peperonni')),
       (1000, 'gramme', 0.20, 3, (SELECT id FROM public.product WHERE product_name = 'peperonni')),
       (50000, 'gramme', 0.03, 3, (SELECT id FROM public.product WHERE product_name = 'pate à pizza')),
       (600, 'gramme', 0.02, 2, (SELECT id FROM public.product WHERE product_name = 'mozzarella')),
       (20, 'pot', 2.25, 1, (SELECT id FROM public.product WHERE product_name = 'glace macadamia')),
       (30, 'pot', 2.25, 2, (SELECT id FROM public.product WHERE product_name = 'glace macadamia')),
       (50, 'egg_unit', 0.10, 2, (SELECT id FROM public.product WHERE product_name = 'oeuf')),
       (20, 'egg_unit', 0.10, 3, (SELECT id FROM public.product WHERE product_name = 'oeuf'));


INSERT INTO public.recipe(recipe_name, description)
VALUES('La tempete', 'pate à pizza, sauce tomate, peperonni, chorizo, origan, mozzarella'),
       ('Le soleil brille', 'pate à pizza, sauce tomate, jambon, champignons, oeuf, roquefort '),
       ('Au pays des bretons', 'pate à pizza, crème fraiche, saumon, aneth, mozzarella');

INSERT INTO public.product(product_name, id_recipe)
VALUES('La tempete',(SELECT id FROM public.recipe WHERE recipe_name = 'La tempete')),
       ('coca cola', NULL),
       ('Le soleil brille',(SELECT id FROM public.recipe WHERE recipe_name = 'Le soleil brille')),
       ('oeuf', NULL),
       ('mozzarella', NULL),
       ('Au pays des bretons',(SELECT id FROM public.recipe WHERE recipe_name = 'Au pays des Bretons')),
       ('pate à  pizza', NULL),
       ('glace macadamia', NULL),
       ('sauce tomate', NULL),
       ('peperroni', NULL),
       ('origan', NULL),
       ('jambon', NULL ),
       ('roquefort', NULL),
       ('chorizo', NULL ),
       ('champignons', NULL),
       ('crème fraiche', NULL ),
       ('saumon', NULL ),
       ('aneth', NULL );


INSERT INTO public.product_ingredient(ingredient_quantity, measure_unity, id_ingredient, id_product)
VALUES (150, 'gramme', (SELECT id FROM public.product WHERE product_name = 'mozzarella'),(SELECT id FROM public.product WHERE product_name = 'la tempete')),
       (1, 'boite',(SELECT id FROM public.product WHERE product_name = 'sauce tomate'), (SELECT id FROM public.product WHERE product_name = 'le soleil brille')),
       (100, 'gramme', (SELECT id FROM public.product WHERE product_name = 'peperonni'), (SELECT id FROM public.product WHERE product_name = 'la tempete')),
       (1,'unit', (SELECT id FROM public.product WHERE product_name = 'glace macadamia'), (SELECT id FROM public.product WHERE product_name = 'glace macadamia')),
       (1, 'pincée', (SELECT id FROM public.product WHERE product_name = 'aneth'), (SELECT id FROM public.product WHERE product_name = 'Au pays des bretons'));

INSERT INTO public.basket_line(basket_date, product_amount, price, id_order, id_product)
VALUES ('19-05-2019', 4, 25.00, 1, (SELECT id FROM public.product WHERE product_name = 'La tempete')),
       ('19-05-2019', 4, 12.00, 1, (SELECT id FROM public.product WHERE product_name = 'coca cola')),
       ('10-04-2020', 1, 12.5, 2, (SELECT id FROM public.product WHERE product_name = 'Le soleil brille')),
       ('10-04-2020', 1, 5.5, 2, (SELECT id FROM public.product WHERE product_name = 'glace macadamia')),
       ('29-12-2018', 3, 18.50, 3,(SELECT id FROM public.product WHERE product_name = 'Au pays des bretons')),
       ('29-12-2018', 3, 18.50, 3,(SELECT id FROM public.product WHERE product_name = 'glace macadamia')),
       ('25-02-2020', 1, 8.50, 4, (SELECT id FROM public.product WHERE product_name = 'La tempete')),
       ('25-02-2020', 1, 2.0, 4, (SELECT id FROM public.product WHERE product_name = 'La tempete')),
       ('12-01-2020', 6, 30.25, 6, (SELECT id FROM public.product WHERE product_name = 'Le soleil brille')),
       ('25-03-2019', 6, 30.25, 5, (SELECT id FROM public.product WHERE product_name = 'Au pays des bretons')),
       ('05-05-2020', 7, 42.25, 7, (SELECT id FROM public.product WHERE product_name = 'Au pays des bretons')),
       ('23-10-2019', 6, 30.25, 8, (SELECT id FROM public.product WHERE product_name = 'La tempete')),
       ('10-04-2020', 2, 25.00, 9, (SELECT id FROM public.product WHERE product_name = 'Au pays des bretons'));

