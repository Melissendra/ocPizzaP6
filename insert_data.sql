INSERT INTO public.restaurant(id, name)
VALUES (NULL, "Chez Sergio Leonne"),
        (NULL, "La Mamma"),
        (NULL, "Capri");

INSERT INTO public.utilisateur(id, nom, prénom, date_de_naissance, catégorie_utilisateur, mot_de_passe, actif)
VALUES (NULL, "Lacroix", "Tristan", "06/30/1998", (SELECT categorie_name from public.catégorie WHERE category_name = "pizzaïolo"), "IdBX6UT", TRUE),
        (NULL, " Lenoir", "Emilie", "12/24/1984", (SELECT categorie_name from public.catégorie WHERE category_name = "livreur"), "06Jv2uV1", TRUE),
        (NULL, "Louis", "Jacques", "03/06/1997", (SELECT categorie_name from public.catégorie WHERE category_name = "client"), "K5wkf45W", FALSE),
        (NULL, "Blot", "Hughes", "08/05/1980", (SELECT categorie_name from public.catégorie WHERE category_name = "manager"), "kzN9McLXIIv5", TRUE),
        (NULL, "Pichon", "Capucine", "01/26/1970", (SELECT categorie_name from public.catégorie WHERE category_name = "client"), "aYkrEZ", TRUE);

INSERT INTO public.categorie(id, category_name)
VALUES (NULL, "pizzaiolo"),
        (NULL, "livreur"),
        (NULL, "client"),
        (NULL, "manager");

INSERT INTO public.address(street_number, street_name, city, zip_code, phone_number, mail)
VALUES