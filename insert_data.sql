INSERT INTO public.restaurant(name)
VALUES ("Chez Sergio Leonne"),
        ("La Mamma"),
        ("Capri");

INSERT INTO public.utilisateur(nom, prénom, birthday, fonction, mot_de_passe, active)
VALUES ("Trinkwon", "Kit", "06/30/1998", "pizzaiolo", "IdBX6UT", TRUE),
        ("Poletto", "Prinz", "12/24/1984", "livreur", "06Jv2uV1", TRUE),
        ("Yorke", "Kathe", "03/06/1997", "client", "K5wkf45W", FALSE),
        ("Tregea", "Gaspar", "08/05/1980", "manager", "kzN9McLXIIv5", TRUE),
        ("Renee", "Della", "01/26/1970", "client", "aYkrEZ", TRUE);

INSERT INTO public.fonction(function_name)
VALUES ("pizzaiolo"),
        ("livreur"),
        ("client"),
        ("manager");

INSERT INTO public.address(street_number, street_name, city, zip_code, phone_number, )
