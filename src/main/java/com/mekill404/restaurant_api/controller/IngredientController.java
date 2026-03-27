package com.mekill404.restaurant_api.controller;

import com.mekill404.restaurant_api.entity.IngredientEntity;
import com.mekill404.restaurant_api.service.IngredientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/ingredients")
public class IngredientController {

    private final IngredientService ingredientService;

    @Autowired
    public IngredientController(IngredientService ingredientService) {
        this.ingredientService = ingredientService;
    }

    @GetMapping
    public List<IngredientEntity> getAllIngredients() {
        return ingredientService.getAllIngredients();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getIngredientById(@PathVariable int id) {
        IngredientEntity ingredient = ingredientService.getIngredientById(id);
        if (ingredient == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("Ingredient.id=" + id + " is not found");
        }
        return ResponseEntity.ok(ingredient);
    }

    @GetMapping("/{id}/stock")
    public ResponseEntity<?> getStock(
            @PathVariable int id,
            @RequestParam String at,
            @RequestParam String unit) {

        if (at == null || unit == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Either mandatory query parameter `at` or `unit` is not provided.");
        }

        try {
            Instant instant = Instant.parse(at);
            Timestamp timestamp = Timestamp.from(instant);
            double stockValue = ingredientService.getStockValue(id, unit, timestamp);
            Map<String, Object> response = new HashMap<>();
            response.put("unit", unit);
            response.put("value", stockValue);
            return ResponseEntity.ok(response);
        } catch (java.time.format.DateTimeParseException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Invalid date format for `at`. Expected ISO-8601 (e.g., 2024-01-06T12:00:00Z)");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Database error: " + e.getMessage());
        }
    }
}