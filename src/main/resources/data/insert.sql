INSERT INTO dish (name, dish_type, sale_price) VALUES 
('Salade Fraîche', 'STARTER', 12.50),
('Soupe de Légumes', 'STARTER', 8.00),
('Gâteau au Chocolat', 'DESSERT', 7.50),
('Poulet Grillé', 'MAIN_COURSE', 18.00),
('Entrecôte frites', 'MAIN_COURSE', 25.00),
('Saumon Teriyaki', 'MAIN_COURSE', 22.00),
('Tarte aux Pommes', 'DESSERT', 6.50),
('Mousse au Chocolat', 'DESSERT', 5.50),
('Carpaccio de Bœuf', 'STARTER', 14.00),
('Risotto aux Champignons', 'MAIN_COURSE', 17.00),
('Burger Maison', 'MAIN_COURSE', 16.50),
('Lasagnes', 'MAIN_COURSES', 15.00),
('Crème Brûlée', 'DESSERT', 7.00),
('Salade César', 'STARTER', 13.50),
('Pâtes Carbonara', 'MAIN_COURSE', 14.50),
('Filet de Cabillaud', 'MAIN_COURSE', 19.00),
('Tiramisu', 'DESSERT', 8.00),
('Assiette de Fromages', 'DESSERT', 10.00),
('Bruschetta Tomate', 'STARTER', 9.00),
('Gambas Grillées', 'STARTER', 16.00),
('Magret de Canard', 'OTHER', 24.00),
('Ratatouille', 'MAIN_COURSE', 14.00),
('Salade de Fruits', 'DESSERT', 6.00),
('Profiteroles', 'DESSERT', 8.50),
('Œufs Cocotte', 'STARTER', 10.50),
('Velouté de Potiron', 'STARTER', 7.50),
('Pizza Regina', 'MAIN_COURSE', 13.00),
('Couscous Royal', 'MAIN_COURSE', 21.00),
('Paella', 'OTHER', 20.00),
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
('Bœuf', 25.00, 'MEAT'),
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
('Canard', 22.00, 'MEAT'),
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
(1, 1, 1.00, 'PCS'), -- 1 Laitue
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
(3, 12, 3.00, 'PCS'),-- 3 Œufs
(3, 14, 0.05, 'KG');   -- 0.05 KG de Beurre
