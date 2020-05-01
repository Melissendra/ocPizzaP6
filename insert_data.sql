INSERT INTO public.restaurant(name)
VALUES ( "Chez Sergio Leonne"),
        ( "La Mama"),
        ("Capri");

INSERT INTO public.category(category_name)
VALUES ( "pizzaiolo"),
        ( "livreur"),
        ("client"),
        ( "manager");

INSERT INTO public.user(lastname, firstname, birthdday, user_category, used_password, active)
VALUES ( "Lacroix", "Tristan", "06/30/1998", (SELECT categorie_name from public.category WHERE category_name = "pizzaïolo"), "IdBX6UT", TRUE),
        ( " Lenoir", "Emilie", "12/24/1984", (SELECT categorie_name from public.category WHERE category_name = "livreur"), "06Jv2uV1", TRUE),
        ( "Louis", "Jacques", "03/06/1997", (SELECT categorie_name from public.category WHERE category_name = "client"), "K5wkf45W", FALSE),
        ( "Blot", "Hughes", "08/05/1980", (SELECT categorie_name from public.category WHERE category_name = "manager"), "kzN9McLXIIv5", TRUE),
        ( "Pichon", "Capucine", "01/26/1970", (SELECT categorie_name from public.category WHERE category_name = "client"), "aYkrEZ", TRUE);

INSERT INTO public.address(street_number, street_name,zip_code, city, phone_number, mail, user_fk, restaurant_fk)
VALUES ("5", "rue Noël Barbier", "45895", "Chartier", "06 37 38 03 50", "tristan24@free.fr", 
       (SELECT id FROM public.user WHERE lastname = "Lacroix" AND firstname = "Tristan"), NULL),
        ("10", "rue blot", " 98350",  "Royer", "06 59 59 58 00", "emilielenoir@hamel.com",
        (SELECT id FROM public.user WHERE lastname = "Lenoir" AND firstname = "Emilie"),NULL),
        ("35", "rue de Gonzalez", "99374",  "Delmas", "+33 1 44 20 65 68", "jacques99@tiscali.fr",
        (SELECT id FROM public.user WHERE lastname = "Louis" AND firstname = "Jacques"), NULL),
        ("657",  " rue Roy", "09526" ,"Godard", "0377364340", "blothughes@bouchet.fr",
        (SELECT id FROM public.user WHERE lastname = "Blot" AND firstname = "Hughes"), NULL),
        (" 714", "rue de Albert", "83222", "Sainte Astrid", "+33 4 18 28 58 42", "cpichon@club-internet.fr",
        (SELECT id FROM public.user WHERE lastname = "Pichon" AND firstname = "Capucine"), NULL),
        ("62", "rue Constance Teixeira", "45366", "Peltier", "01 82 75 48 90", "echarles@thibault.fr", NULL,
        (SELECT id FROM public.restaurant WHERE name = "Chez Sergio Leonne")),
        ("10", "boulevard de Vincent", "30823", "Pelletier-sur-Mer", "0800920673", "davidlorraine@maurice.com", NULL,
        (SELECT id FROM public.restaurant WHERE name = "La Mama")),
        ("97", "boulevard Thérèse Faure", "89651", "Guibert", "+33 3 86 38 49 80", "bruneaugilbert@renault.com", NULL,
        (SELECT id FROM public.restaurant WHERE name = 'Capri"'));

INSERT INTO public.paiement_mean_table(paiement_mean)
VALUES("card" ),
        ("change"),
        ("check");

INSERT INTO public.order_state(preparation_state)
VALUES("En attente"),
        ("En préparation"),
        ("Prête"),
        ("En cours de livraison"),
        ("Livrée");

INSERT INTO public.order(order_date, paiement_state, delivery,restaurant_fk, adress_fk, paiement_fk, order_state_fk)
VALUES ("19-05-2019", TRUE, FALSE,
        (SELECT id FROM public.restaurant_fk WHERE id = 1),
        (SELECT id FROM public.address WHERE id = 1),
        (SELECT id FROM public.paiement_mean_table WHERE id = 1),
        (SELECT id FROM public.order_date WHERE id = 3)),
        ("29-12-2018", FALSE, TRUE,
         (SELECT id FROM public.restaurant_fk WHERE id = 2),
         (SELECT id FROM public.address WHERE id = 2),
         (SELECT id FROM public.paiement_mean_table WHERE id = 2),
         (SELECT id FROM public.order_date WHERE id = 4)),
        ("25-03-2019", TRUE, TRUE,
         (SELECT id FROM public.restaurant_fk WHERE id = 3),
         (SELECT id FROM public.address WHERE id = 3),
         (SELECT id FROM public.paiement_mean_table WHERE id = 1),
         (SELECT id FROM public.order_date WHERE id = 5)),
        ("23-10-2019", TRUE, FALSE,
         (SELECT id FROM public.restaurant_fk WHERE id = 1),
         (SELECT id FROM public.address WHERE id = 4),
         (SELECT id FROM public.paiement_mean_table WHERE id = 3),
         (SELECT id FROM public.order_date WHERE id = 2)),
        ("10-04-2020", FALSE, TRUE,
         (SELECT id FROM public.restaurant_fk WHERE id = 2),
         (SELECT id FROM public.address WHERE id = 5),
         (SELECT id FROM public.paiement_mean_table WHERE id = 2),
         (SELECT id FROM public.order_date WHERE id =1 ));

INSERT INTO public.stock(quantity, unity, price_per_unit, restaurant_fk)
VALUES (2000, "gramme", 0.1, (SELECT id FROM public.restaurant_fk WHERE id = 1)),
       (3, "boites", 0.30, (SELECT id FROM public.restaurant_fk WHERE (id = 2) AND (id = 3))),
       (100, "gramme", 0.10, (SELECT id FROM public.restaurant_fk WHERE (id = 1) AND (id = 2))),
       (1000, "gramme", 0.20, (SELECT id FROM public.restaurant_fk WHERE (id = 3) AND (id = 1) AND (id = 1))),
       (5000, "gramme", 0.03, (SELECT id FROM public.restaurant_fk WHERE (id = 2) AND (id = 1))),
       (600, "gramme", 0.02, (SELECT id FROM public.restaurant_fk WHERE (id = 1)) AND (id = 2)),
       (10, "unit", 0.25, (SELECT id FROM public.restaurant_fk WHERE (id = 2)) AND (id = 3));

INSERT INTO public.recipe(recipe_name, description)
VALUES("La tempete", " "),
       ("Le soleil brille", " "),
       ("Au pays des bretons", " ");

INSERT INTO public.product(product_name, ingredient_name, recipe_fk, stock_fk)
VALUES("La tempete", "pate à pizza",
       (SELECT id FROM public.recipe WHERE id = 1),
       (SELECT id FROM public.stock WHERE id = 1)),
       ("La tempete", "mozzarella",
       (SELECT id FROM public.recipe WHERE id = 1),
       (SELECT id FROM public.stock WHERE id = 1)),
       ("La tempete", "saumon",
       (SELECT id FROM public.recipe WHERE id = 1),
       (SELECT id FROM public.stock WHERE id = 1)),
       ("La tempete", "aneth",
       (SELECT id FROM public.recipe WHERE id = 1),
       (SELECT id FROM public.stock WHERE id = 1)),
       ("Le soleil brille", "pate à pizza",
        (SELECT id FROM public.recipe WHERE id = 2),
        (SELECT id FROM public.stock WHERE id = 3)),
       ("Le soleil brille", "sauce tomate",
        (SELECT id FROM public.recipe WHERE id = 2),
        (SELECT id FROM public.stock WHERE id = 3)),
       ("Le soleil brille", "oeuf",
        (SELECT id FROM public.recipe WHERE id = 2),
        (SELECT id FROM public.stock WHERE id = 3)),
       ("Le soleil brille", "jambon",
        (SELECT id FROM public.recipe WHERE id = 2),
        (SELECT id FROM public.stock WHERE id = 3)),
       ("Le soleil brille", "mozarella",
        (SELECT id FROM public.recipe WHERE id = 2),
        (SELECT id FROM public.stock WHERE id = 3)),
       ("Au pays des bretons", "pate à pizza",
        (SELECT id FROM public.recipe WHERE id = 2),
        (SELECT id FROM public.stock WHERE id = 4)),
        ("Au pays des bretons", "sauce tomate",
        (SELECT id FROM public.recipe WHERE id = 2),
        (SELECT id FROM public.stock WHERE id = 4)),
       ("Au pays des bretons", "andouille",
        (SELECT id FROM public.recipe WHERE id = 2),
        (SELECT id FROM public.stock WHERE id = 4)),
       ("Au pays des bretons", "mozzarella",
        (SELECT id FROM public.recipe WHERE id = 2),
        (SELECT id FROM public.stock WHERE id = 4)),
       ("Au pays des bretons", "origan",
        (SELECT id FROM public.recipe WHERE id = 2),
        (SELECT id FROM public.stock WHERE id = 4));

INSERT INTO public.product_ingredient(ingredient_quantity, measure_unity, ingredient_fk, product_fk)
VALUES (150, "gramme",
        (SELECT id FROM public.product WHERE ingredient_name = "pate à pizza"),
        (SELECT id FROM public.product WHERE product_name = "La tempete")),
       (1, "boite",
        (SELECT id FROM public.product WHERE ingredient_name = "sauce tomate"),
        (SELECT id FROM public.product WHERE product_name = "Le soleil brille")),
       (100, "gramme",
        (SELECT id FROM public.product WHERE ingredient_name = "mozzarella"),
        (SELECT id FROM public.product WHERE product_name = "Au pays des bretons")),
       (1,"unit",
        (SELECT id FROM public.product WHERE ingredient_name = "oeuf"),
        (SELECT id FROM public.product WHERE product_name = "Le soleil brille"));

INSERT INTO public.basket_line(basket_date, product_amount, price, order_fk, product_fk)
VALUES ("12-05-2019", 4, 25.00,
       (SELECT id FROM public.order WHERE id = 1),
       (SELECT id FROM public.product WHERE (product_name = "La tempete")
                                        AND (product_name = "Le soleil brille")
                                        AND (product_name = "Au pays des bretons"))),
       ("23-02-2020", 2, 12.5,
        (SELECT id FROM public.order WHERE id = 2),
        (SELECT id FROM public.product WHERE (product_name = "La tempete")
                                         AND (product_name = "Le soleil brille"))),
       ("05-03-2020", 3, 18.50,
        (SELECT id FROM public.order WHERE id = 3),
        (SELECT id FROM public.product WHERE (product_name = "La tempete")
                                         AND (product_name = "Le soleil brille")
                                         AND (product_name = "Au pays des bretons"))),
       ("29-04-2020", 1, 8.50,
        (SELECT id FROM public.order WHERE id = 4),
       (SELECT id FROM public.product WHERE product_name = "La tempete")),
       ("15-12-2019", 6, 30.25,
        (SELECT id FROM public.order WHERE id = 5),
        (SELECT id FROM public.product WHERE (product_name = "La tempete")
                                         AND (product_name = "Le soleil brille")
                                         AND (product_name = "Au pays des bretons")));