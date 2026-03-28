package com.mekill404.restaurant_api.dto;

import com.mekill404.restaurant_api.entity.enums.UnitEnum;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DishIngredientUpdateDto {
    private int ingredientId;
    private double quantity;
    private UnitEnum unit;
}
