-- ============================================
-- 1. Création de la base de données et utilisateur
--    (à exécuter en tant que superutilisateur postgres)
-- ============================================
-- Créer l'utilisateur si non existant
DO
$do$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'product_manager_user') THEN
      CREATE USER product_manager_user WITH PASSWORD 'ProducT8_8ManageR8_8User';
   END IF;
END
$do$;

-- Créer la base de données
CREATE DATABASE mini_dish_db OWNER product_manager_user;

-- ============================================
-- Connexion à la base (à exécuter manuellement ou dans un autre script)
-- \c mini_dish_db
-- ============================================

-- ============================================
-- 2. Création des tables
-- ============================================

-- Table ingredient
CREATE TABLE IF NOT EXISTS ingredient (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    price DOUBLE PRECISION NOT NULL,
    category VARCHAR(20) NOT NULL,
    initial_stock DOUBLE PRECISION DEFAULT 0
);

-- Table stock_movement
CREATE TABLE IF NOT EXISTS stock_movement (
    id SERIAL PRIMARY KEY,
    id_ingredient INTEGER NOT NULL REFERENCES ingredient(id) ON DELETE CASCADE,
    quantity DOUBLE PRECISION NOT NULL,
    unit VARCHAR(10) NOT NULL,
    type VARCHAR(3) NOT NULL CHECK (type IN ('IN', 'OUT')),
    creation_datetime TIMESTAMP NOT NULL
);

-- Table dish
CREATE TABLE IF NOT EXISTS dish (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dish_type VARCHAR(10) NOT NULL CHECK (dish_type IN ('START', 'MAIN', 'DESSERT')),
    selling_price DOUBLE PRECISION
);

-- Table dish_ingredient
CREATE TABLE IF NOT EXISTS dish_ingredient (
    id_dish INTEGER NOT NULL REFERENCES dish(id) ON DELETE CASCADE,
    id_ingredient INTEGER NOT NULL REFERENCES ingredient(id) ON DELETE CASCADE,
    required_quantity DOUBLE PRECISION NOT NULL,
    unit VARCHAR(10) NOT NULL,
    PRIMARY KEY (id_dish, id_ingredient)
);

-- ============================================
-- 3. Insertion des ingrédients (30)
-- ============================================
INSERT INTO ingredient (name, price, category) VALUES
('Tomate', 1.5, 'VEGETABLE'),
('Oignon', 0.8, 'VEGETABLE'),
('Ail', 0.5, 'VEGETABLE'),
('Poulet', 8.0, 'ANIMAL'),
('Boeuf', 12.0, 'ANIMAL'),
('Saumon', 15.0, 'MARINE'),
('Lait', 1.2, 'DAIRY'),
('Fromage', 5.0, 'DAIRY'),
('Beurre', 2.5, 'DAIRY'),
('Farine', 1.0, 'OTHER'),
('Sucre', 1.2, 'OTHER'),
('Sel', 0.5, 'OTHER'),
('Poivre', 0.8, 'OTHER'),
('Huile d''olive', 4.0, 'OTHER'),
('Riz', 2.0, 'OTHER'),
('Pâtes', 1.8, 'OTHER'),
('Carotte', 0.9, 'VEGETABLE'),
('Courgette', 1.2, 'VEGETABLE'),
('Aubergine', 1.3, 'VEGETABLE'),
('Poivron', 1.4, 'VEGETABLE'),
('Champignon', 2.0, 'VEGETABLE'),
('Oeuf', 0.3, 'ANIMAL'),
('Crevette', 12.0, 'MARINE'),
('Calmar', 10.0, 'MARINE'),
('Moules', 5.0, 'MARINE'),
('Crème fraîche', 2.2, 'DAIRY'),
('Yaourt', 1.5, 'DAIRY'),
('Citron', 0.7, 'VEGETABLE'),
('Persil', 0.4, 'VEGETABLE'),
('Basilic', 0.6, 'VEGETABLE');

-- ============================================
-- 4. Insertion des mouvements de stock (90)
--    Chaque ingrédient reçoit 2 IN et 1 OUT aléatoires
-- ============================================
-- Mouvements IN (2 par ingrédient)
INSERT INTO stock_movement (id_ingredient, quantity, unit, type, creation_datetime)
SELECT 
    i.id,
    (random() * 20 + 1)::numeric(10,2) as quantity,
    CASE floor(random() * 3)::int 
        WHEN 0 THEN 'PCS' 
        WHEN 1 THEN 'KG' 
        ELSE 'L' 
    END as unit,
    'IN',
    (timestamp '2026-01-01 00:00:00' + random() * (timestamp '2026-03-31 00:00:00' - timestamp '2026-01-01 00:00:00')) as creation_datetime
FROM ingredient i
CROSS JOIN generate_series(1, 2);

-- Mouvements OUT (1 par ingrédient)
INSERT INTO stock_movement (id_ingredient, quantity, unit, type, creation_datetime)
SELECT 
    i.id,
    (random() * 15 + 1)::numeric(10,2) as quantity,
    CASE floor(random() * 3)::int 
        WHEN 0 THEN 'PCS' 
        WHEN 1 THEN 'KG' 
        ELSE 'L' 
    END as unit,
    'OUT',
    (timestamp '2026-01-01 00:00:00' + random() * (timestamp '2026-03-31 00:00:00' - timestamp '2026-01-01 00:00:00')) as creation_datetime
FROM ingredient i;

-- ============================================
-- 5. Insertion des plats (30)
-- ============================================
INSERT INTO dish (name, dish_type, selling_price) VALUES
('Salade César', 'START', 8.5),
('Soupe à l''oignon', 'START', 6.0),
('Bruschetta', 'START', 5.5),
('Steak Frites', 'MAIN', 15.0),
('Poulet rôti', 'MAIN', 14.0),
('Saumon grillé', 'MAIN', 16.5),
('Pâtes carbonara', 'MAIN', 12.0),
('Pizza Margherita', 'MAIN', 12.5),
('Tiramisu', 'DESSERT', 6.0),
('Crème brûlée', 'DESSERT', 5.5),
('Tarte aux pommes', 'DESSERT', 5.0),
('Risotto aux champignons', 'MAIN', 13.0),
('Carpaccio de boeuf', 'START', 10.0),
('Tartare de saumon', 'START', 11.0),
('Moules frites', 'MAIN', 14.0),
('Curry de poulet', 'MAIN', 13.5),
('Ratatouille', 'MAIN', 11.0),
('Lasagnes', 'MAIN', 12.5),
('Quiche lorraine', 'MAIN', 10.0),
('Sorbet au citron', 'DESSERT', 4.0),
('Mousse au chocolat', 'DESSERT', 5.0),
('Fondant au chocolat', 'DESSERT', 6.5),
('Gaspacho', 'START', 7.0),
('Salade niçoise', 'START', 9.0),
('Blanquette de veau', 'MAIN', 15.5),
('Boeuf bourguignon', 'MAIN', 16.0),
('Cassoulet', 'MAIN', 14.5),
('Crêpe sucrée', 'DESSERT', 4.5),
('Profiteroles', 'DESSERT', 6.0),
('Millefeuille', 'DESSERT', 7.0);

-- ============================================
-- 6. Insertion des associations plat-ingrédients (4 par plat)
--    Chaque plat reçoit 4 ingrédients aléatoires uniques
-- ============================================
WITH dish_ingredient_assoc AS (
    SELECT 
        d.id as dish_id,
        i.id as ingredient_id,
        (random() * 0.5 + 0.1)::numeric(10,2) as quantity,
        CASE floor(random() * 3)::int WHEN 0 THEN 'PCS' WHEN 1 THEN 'KG' ELSE 'L' END as unit,
        row_number() OVER (PARTITION BY d.id ORDER BY random()) as rn
    FROM dish d
    CROSS JOIN ingredient i
)
INSERT INTO dish_ingredient (id_dish, id_ingredient, required_quantity, unit)
SELECT dish_id, ingredient_id, quantity, unit
FROM dish_ingredient_assoc
WHERE rn <= 4;

-- ============================================
-- 7. Vérification (optionnel)
-- ============================================
-- SELECT COUNT(*) FROM ingredient;   -- doit être 30
-- SELECT COUNT(*) FROM stock_movement;  -- 90
-- SELECT COUNT(*) FROM dish;           -- 30
-- SELECT COUNT(*) FROM dish_ingredient; -- 120