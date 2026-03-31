CREATE TYPE dish_type AS ENUM ('STARTER', 'MAIN_COURSE', 'DESSERT', 'OTHER');
CREATE TYPE ingredient_category AS ENUM ('VEGETABLE', 'ANIMAL', 'MARINE', 'DAIRY', 'OTHER', 'MEAT');

CREATE TABLE dish (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dish_type dish_type,
    sale_price NUMERIC(10, 2)
);

CREATE TABLE ingredient (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    unit_price NUMERIC(10, 2),
    category ingredient_category
);

CREATE TABLE dish_ingredient (
    id_dish INT REFERENCES dish(id),
    id_ingredient INT REFERENCES ingredient(id),
    required_quantity NUMERIC(10, 2) NOT NULL,
    unit VARCHAR(10),
    PRIMARY KEY (id_dish, id_ingredient)
);
