INSERT INTO category (name) VALUES 
('Électronique'), ('Maison'), ('Cuisine'), ('Sport'), ('Jardin'), 
('Bricolage'), ('Beauté'), ('Jouets'), ('Livres'), ('Informatique'),
('Mobilier'), ('Vêtements'), ('Chaussures'), ('Accessoires'), ('Santé'),
('Animalerie'), ('Automobile'), ('Musique'), ('Jeux Vidéo'), ('Bureau'),
('Épicerie'), ('Boissons'), ('Bébé'), ('Loisirs Créatifs'), ('Photographie'),
('Audio'), ('Bagagerie'), ('Montres'), ('Bijoux'), ('Plein Air');


INSERT INTO product (name, price, creation_datetime, category_id) VALUES 
('PC Portable Asus', 899.99, '2025-10-01 10:00:00', 10),
('Souris Gaming', 45.50, '2025-10-05 14:30:00', 10),
('Clavier Mécanique', 120.00, '2025-10-10 09:15:00', 10),
('Écran 4K Dell', 350.00, '2025-10-12 11:00:00', 10),
('Casque Audio Sony', 299.00, '2025-11-01 16:45:00', 26),
('Enceinte Bluetooth', 59.99, '2025-11-03 08:20:00', 26),
('Smartphone Samsung', 750.00, '2025-11-05 13:00:00', 1),
('Tablette iPad', 600.00, '2025-11-07 10:30:00', 1),
('Appareil Photo Canon', 1200.00, '2025-11-10 15:00:00', 25),
('Objectif 50mm', 150.00, '2025-11-12 09:00:00', 25),
('Chaise de Bureau', 180.00, '2025-11-15 11:00:00', 20),
('Bureau en bois', 250.00, '2025-11-18 14:00:00', 20),
('Lampe LED', 25.00, '2025-11-20 18:00:00', 2),
('Aspirateur Robot', 450.00, '2025-11-22 08:00:00', 2),
('Machine à Café', 120.00, '2025-11-25 07:30:00', 3),
('Grille-pain', 35.00, '2025-11-26 08:15:00', 3),
('Mixeur Plongeant', 45.00, '2025-11-28 12:00:00', 3),
('Set de Poêles', 89.00, '2025-12-01 10:00:00', 3),
('Canapé 3 places', 799.00, '2025-12-02 14:00:00', 11),
('Table Basse', 110.00, '2025-12-03 16:00:00', 11),
('Tapis de Salon', 65.00, '2025-12-04 09:00:00', 2),
('Vase en Céramique', 15.00, '2025-12-05 11:30:00', 2),
('Robe d''été', 40.00, '2025-12-06 13:00:00', 12),
('T-shirt Coton', 19.99, '2025-12-07 15:00:00', 12),
('Jean Slim', 55.00, '2025-12-08 10:00:00', 12),
('Baskets de Run', 110.00, '2025-12-09 08:00:00', 13),
('Bottes de Pluie', 45.00, '2025-12-10 11:00:00', 13),
('Sac à Dos 20L', 35.00, '2025-12-11 14:30:00', 27),
('Valise Rigide', 130.00, '2025-12-12 16:00:00', 27),
('Montre Connectée', 199.00, '2025-12-13 09:00:00', 28);


INSERT INTO dish (name, dish_type, sale_price) VALUES 
('Salade Fraîche', 'STARTER', 12.50),
('Soupe de Légumes', 'STARTER', 8.00),
('Gâteau au Chocolat', 'DESSERT', 7.50),
('Poulet Grillé', 'MAIN', 18.00),
('Entrecôte frites', 'MAIN', 25.00),
('Saumon Teriyaki', 'MAIN', 22.00),
('Tarte aux Pommes', 'DESSERT', 6.50),
('Mousse au Chocolat', 'DESSERT', 5.50),
('Carpaccio de Bœuf', 'STARTER', 14.00),
('Risotto aux Champignons', 'MAIN', 17.00),
('Burger Maison', 'MAIN', 16.50),
('Lasagnes', 'MAIN', 15.00),
('Crème Brûlée', 'DESSERT', 7.00),
('Salade César', 'STARTER', 13.50),
('Pâtes Carbonara', 'MAIN', 14.50),
('Filet de Cabillaud', 'MAIN', 19.00),
('Tiramisu', 'DESSERT', 8.00),
('Assiette de Fromages', 'DESSERT', 10.00),
('Bruschetta Tomate', 'STARTER', 9.00),
('Gambas Grillées', 'STARTER', 16.00),
('Magret de Canard', 'MAIN', 24.00),
('Ratatouille', 'MAIN', 14.00),
('Salade de Fruits', 'DESSERT', 6.00),
('Profiteroles', 'DESSERT', 8.50),
('Œufs Cocotte', 'STARTER', 10.50),
('Velouté de Potiron', 'STARTER', 7.50),
('Pizza Regina', 'MAIN', 13.00),
('Couscous Royal', 'MAIN', 21.00),
('Paella', 'MAIN', 20.00),
('Profiteroles au Chocolat', 'DESSERT', 9.00);


INSERT INTO ingredient (name, unit_price, category) VALUES 
('Laitue', 1.20, 'VEGETABLE'),
('Tomate', 2.50, 'VEGETABLE'),
('Poulet', 12.00, 'ANIMAL'),
('Chocolat', 15.00, 'OTHER'),
('Oignon', 0.80, 'VEGETABLE'),
('Fromage', 18.00, 'DAIRY'),
('Huile', 5.00, 'OTHER'),
('Pomme de terre', 1.10, 'VEGETABLE'),
('Bœuf', 25.00, 'ANIMAL'),
('Saumon', 28.00, 'MARINE'),
('Farine', 1.00, 'OTHER'),
('Œuf', 0.30, 'ANIMAL'),
('Sucre', 1.50, 'OTHER'),
('Beurre', 8.00, 'DAIRY'),
('Champignon', 6.00, 'VEGETABLE'),
('Riz', 2.00, 'OTHER'),
('Pain Burger', 0.60, 'OTHER'),
('Lait', 1.10, 'DAIRY'),
('Crème Fraîche', 4.50, 'DAIRY'),
('Crevette', 35.00, 'MARINE'),
('Canard', 22.00, 'ANIMAL'),
('Aubergine', 2.00, 'VEGETABLE'),
('Courgette', 1.80, 'VEGETABLE'),
('Pomme', 2.30, 'VEGETABLE'),
('Pâtes', 1.50, 'OTHER'),
('Lardons', 14.00, 'ANIMAL'),
('Ail', 4.00, 'VEGETABLE'),
('Citron', 3.00, 'VEGETABLE'),
('Basilic', 15.00, 'VEGETABLE'),
('Sel/Poivre', 2.00, 'OTHER');


-- Composition de la Salade Fraîche (ID 1)
INSERT INTO dish_ingredient (id_dish, id_ingredient, required_quantity, unit) VALUES 
(1, 1, 1.00, 'PIECE'), -- 1 Laitue
(1, 2, 0.25, 'KG'),    -- 0.25 KG de Tomates
(1, 6, 0.05, 'KG');    -- 0.05 KG de Fromage

-- Composition du Poulet Grillé (ID 4)
INSERT INTO dish_ingredient (id_dish, id_ingredient, required_quantity, unit) VALUES 
(4, 3, 0.50, 'KG'),    -- 0.5 KG de Poulet
(4, 7, 0.15, 'L');     -- 0.15 L d'Huile

-- Composition du Gâteau au Chocolat (ID 3)
INSERT INTO dish_ingredient (id_dish, id_ingredient, required_quantity, unit) VALUES 
(3, 4, 0.20, 'KG'),    -- 0.2 KG de Chocolat
(3, 11, 0.10, 'KG'),   -- 0.1 KG de Farine
(3, 12, 3.00, 'PIECE'),-- 3 Œufs
(3, 14, 0.05, 'KG');   -- 0.05 KG de Beurre