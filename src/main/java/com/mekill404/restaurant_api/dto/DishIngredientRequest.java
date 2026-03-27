package com.mekill404.restaurant_api.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

import com.mekill404.restaurant_api.model.Ingredient;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class DishIngredientRequest {
    private List<Ingredient> ingredients;
}
