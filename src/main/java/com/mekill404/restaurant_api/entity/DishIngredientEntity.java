package com.mekill404.restaurant_api.entity;

import com.mekill404.restaurant_api.entity.enums.UnitEnum;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DishIngredientEntity {
    private Integer id;
    private DishEntity dish;
    private IngredientEntity ingredient;
    private Double quantity;
    private UnitEnum unit;
}
