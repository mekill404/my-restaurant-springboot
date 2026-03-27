package com.mekill404.restaurant_api.repository;

import com.mekill404.restaurant_api.entity.*;
import com.mekill404.restaurant_api.entity.enums.CategoryEnum;
import com.mekill404.restaurant_api.entity.enums.DishTypeEnum;
import com.mekill404.restaurant_api.entity.enums.UnitEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class DishRepository {

    private final JdbcTemplate jdbcTemplate;
    private final IngredientRepository ingredientRepository;

    @Autowired
    public DishRepository(JdbcTemplate jdbcTemplate, IngredientRepository ingredientRepository) {
        this.jdbcTemplate = jdbcTemplate;
        this.ingredientRepository = ingredientRepository;
    }

    public List<DishEntity> findAll() {
        String sql = "SELECT id, name, dish_type, selling_price FROM dish ORDER BY id";
        List<DishEntity> dishes = jdbcTemplate.query(sql, new DishRowMapper());
        for (DishEntity dish : dishes) {
            dish.setDishIngredients(findDishIngredientsForDish(dish.getId()));
        }
        return dishes;
    }

    public DishEntity findById(int id) {
        String sql = "SELECT id, name, dish_type, selling_price FROM dish WHERE id = ?";
        List<DishEntity> results = jdbcTemplate.query(sql, new DishRowMapper(), id);
        if (results.isEmpty()) return null;
        DishEntity dish = results.get(0);
        dish.setDishIngredients(findDishIngredientsForDish(id));
        return dish;
    }

    private List<DishIngredientEntity> findDishIngredientsForDish(int dishId) {
        String sql = """
            SELECT di.id, di.quantity, di.unit,
                   i.id AS ing_id, i.name, i.price, i.category
            FROM dish_ingredient di
            JOIN ingredient i ON di.id_ingredient = i.id
            WHERE di.id_dish = ?
        """;
        return jdbcTemplate.query(sql, new DishIngredientRowMapper(), dishId);
    }

    @Transactional
    public void updateIngredients(int dishId, List<IngredientEntity> newIngredients) {
        jdbcTemplate.update("DELETE FROM dish_ingredient WHERE id_dish = ?", dishId);

        for (IngredientEntity ing : newIngredients) {
            // On utilise des valeurs par défaut pour quantity et unit (à adapter)
            jdbcTemplate.update(
                "INSERT INTO dish_ingredient (id_dish, id_ingredient, quantity, unit) VALUES (?, ?, ?, ?)",
                dishId, ing.getId(), 1.0, "PCS"
            );
        }
    }

    private static class DishRowMapper implements RowMapper<DishEntity> {
        @Override
        public DishEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new DishEntity(
                rs.getInt("id"),
                rs.getString("name"),
                DishTypeEnum.valueOf(rs.getString("dish_type")),
                rs.getDouble("selling_price"),
                null
            );
        }
    }

    private static class DishIngredientRowMapper implements RowMapper<DishIngredientEntity> {
        @Override
        public DishIngredientEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            IngredientEntity ingredient = new IngredientEntity(
                rs.getInt("ing_id"),
                rs.getString("name"),
                rs.getDouble("price"),
                CategoryEnum.valueOf(rs.getString("category")),
                null
            );
            return new DishIngredientEntity(
                rs.getInt("id"),
                null, 
                ingredient,
                rs.getDouble("quantity"),
                UnitEnum.valueOf(rs.getString("unit"))
            );
        }
    }
}