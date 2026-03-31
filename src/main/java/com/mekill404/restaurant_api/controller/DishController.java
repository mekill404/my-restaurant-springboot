package com.mekill404.restaurant_api.controller;

import com.mekill404.restaurant_api.dto.DishIngredientUpdateDto;
import com.mekill404.restaurant_api.entity.DishEntity;
import com.mekill404.restaurant_api.service.DishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/dishes")
public class DishController {

    private final DishService dishService;

    @Autowired
    public DishController(DishService dishService) {
        this.dishService = dishService;
    }

    @GetMapping
    public List<DishEntity> getAllDishes() {
        return dishService.getAllDishes();
    }

    @PutMapping("/{id}/ingredients")
    public ResponseEntity<?> updateDishIngredients(
            @PathVariable int id,
            @RequestBody List<DishIngredientUpdateDto> newIngredients) {

        if (newIngredients == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Request body must contain a list of ingredients (can be empty)");
        }

        try {
            dishService.updateIngredients(id, newIngredients);
            return ResponseEntity.ok("Ingredients updated successfully");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Database error: " + e.getMessage());
        }
    }
}