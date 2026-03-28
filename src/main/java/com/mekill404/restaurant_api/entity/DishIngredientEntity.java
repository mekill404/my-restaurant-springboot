package com.mekill404.restaurant_api.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mekill404.restaurant_api.entity.enums.UnitEnum;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DishIngredientEntity {
    private Integer id;
    @JsonIgnore
    private DishEntity dish;
    private IngredientEntity ingredient;
    private Double quantity;
    private UnitEnum unit;
}
