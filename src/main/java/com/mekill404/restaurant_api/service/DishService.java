package com.mekill404.restaurant_api.service;

import com.mekill404.restaurant_api.dto.DishIngredientUpdateDto;
import com.mekill404.restaurant_api.entity.DishEntity;
import com.mekill404.restaurant_api.repository.DishRepository;
import com.mekill404.restaurant_api.repository.IngredientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class DishService {

    private final DishRepository dishRepository;
    private final IngredientRepository ingredientRepository;

    @Autowired
    public DishService(DishRepository dishRepository, IngredientRepository ingredientRepository) {
        this.dishRepository = dishRepository;
        this.ingredientRepository = ingredientRepository;
    }

    public List<DishEntity> getAllDishes() {
        return dishRepository.findAll();
    }

    @Transactional
    public void updateIngredients(int dishId, List<DishIngredientUpdateDto> newIngredients) {
        if (dishRepository.findById(dishId) == null) {
            throw new IllegalArgumentException("Dish not found with id " + dishId);
        }
        dishRepository.updateIngredients(dishId, newIngredients);
    }
}