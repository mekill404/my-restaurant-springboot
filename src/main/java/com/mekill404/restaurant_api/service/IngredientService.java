package com.mekill404.restaurant_api.service;

import com.mekill404.restaurant_api.entity.IngredientEntity;
import com.mekill404.restaurant_api.repository.IngredientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.sql.Timestamp;
import java.util.List;

@Service
public class IngredientService {

    private final IngredientRepository ingredientRepository;

    @Autowired
    public IngredientService(IngredientRepository ingredientRepository) {
        this.ingredientRepository = ingredientRepository;
    }

    public List<IngredientEntity> getAllIngredients() {
        return ingredientRepository.findAll();
    }

    public IngredientEntity getIngredientById(int id) {
        return ingredientRepository.findById(id);
    }

    public double getStockValue(int id, String unit, Timestamp at) {
        return ingredientRepository.getStockValueAt(id, unit, at);
    }
}