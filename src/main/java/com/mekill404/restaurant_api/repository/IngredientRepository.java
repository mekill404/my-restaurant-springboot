package com.mekill404.restaurant_api.repository;

import com.mekill404.restaurant_api.entity.IngredientEntity;
import com.mekill404.restaurant_api.entity.enums.CategoryEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

@Repository
public class IngredientRepository {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public IngredientRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<IngredientEntity> findAll() {
        String sql = "SELECT id, name, price, category FROM ingredient ORDER BY id";
        return jdbcTemplate.query(sql, new IngredientRowMapper());
    }

    public IngredientEntity findById(int id) {
        String sql = "SELECT id, name, price, category FROM ingredient WHERE id = ?";
        List<IngredientEntity> results = jdbcTemplate.query(sql, new IngredientRowMapper(), id);
        return results.isEmpty() ? null : results.get(0);
    }


    public double getStockValueAt(int ingredientId, String unit, Timestamp at) {
        if (findById(ingredientId) == null) {
            throw new IllegalArgumentException("Ingredient not found with id " + ingredientId);
        }
        String sql = """
            SELECT COALESCE(SUM(
                CASE WHEN type = 'IN' THEN quantity ELSE -quantity END
            ), 0) AS net
            FROM stock_movement
            WHERE id_ingredient = ?
              AND unit = CAST(? AS unit_enum)
              AND creation_datetime <= ?
        """;
        Double result = jdbcTemplate.queryForObject(sql, Double.class, ingredientId, unit, at);
        return result != null ? result : 0.0;
    }

    private static class IngredientRowMapper implements RowMapper<IngredientEntity> {
        @Override
        public IngredientEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new IngredientEntity(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getDouble("price"),
                CategoryEnum.valueOf(rs.getString("category"))
            );
        }
    }
}