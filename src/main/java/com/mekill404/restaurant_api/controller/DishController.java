package com.mekill404.restaurant_api.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.mekill404.restaurant_api.dto.DishCreateRequestDto;
import com.mekill404.restaurant_api.dto.ErrorResponse;
import com.mekill404.restaurant_api.model.Dish;
import com.mekill404.restaurant_api.model.Ingredient;
import com.mekill404.restaurant_api.service.DishService;

import java.sql.SQLException;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/dishes")
@RequiredArgsConstructor
public class DishController {

    private final DishService dishService;

    @GetMapping
    public ResponseEntity<?> getAllDishes() {
        try {
            List<Dish> dishes = dishService.getAllDishes();
            return ResponseEntity.ok(dishes);
        } catch (SQLException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ErrorResponse("Database error: " + e.getMessage()));
        }
    }

    @GetMapping
    public ResponseEntity<?> getAllDishes(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Double priceUnder,
            @RequestParam(required = false) Double priceOver) {
        try {
            List<Dish> dishes;
            // Si au moins un filtre est fourni, utiliser la recherche filtrée
            if (name != null || priceUnder != null || priceOver != null) {
                dishes = dishService.getDishesByFilters(name, priceUnder, priceOver);
            } else {
                dishes = dishService.getAllDishes();
            }
            return ResponseEntity.ok(dishes);
        } catch (SQLException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ErrorResponse("Database error: " + e.getMessage()));
        }
    }

    @PutMapping("/{id}/ingredients")
    public ResponseEntity<?> updateDishIngredients(
            @PathVariable int id,
            @RequestBody(required = false) List<Ingredient> ingredients) {

        if (ingredients == null)
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ErrorResponse("Request body with ingredients list is required."));

        try {
            Dish updatedDish = dishService.updateDishIngredients(id, ingredients);

            return ResponseEntity.ok(updatedDish);

        } catch (RuntimeException e) {
            if (e.getMessage().contains("not found")) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .body(new ErrorResponse("Dish.id=" + id + " is not found"));
            }
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ErrorResponse(e.getMessage()));
        } catch (SQLException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ErrorResponse("Database error: " + e.getMessage()));
        }
    }

    @PostMapping
    public ResponseEntity<?> createDishes(@RequestBody List<DishCreateRequestDto> requests) {
        if (requests == null || requests.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ErrorResponse("Request body must contain a non-empty list of dishes"));
        }

        try {
            List<Dish> created = dishService.createDishes(requests);
            return ResponseEntity.status(HttpStatus.CREATED).body(created);
        } catch (RuntimeException e) {
            if (e.getMessage().startsWith("Dish.name=")) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body(new ErrorResponse(e.getMessage()));
            }
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ErrorResponse(e.getMessage()));
        } catch (SQLException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ErrorResponse("Database error: " + e.getMessage()));
        }
    }
}