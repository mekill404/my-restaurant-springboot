package com.mekill404.restaurant_api.entity;

import com.mekill404.restaurant_api.entity.enums.CategoryEnum;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class IngredientEntity {
    private int id;
    private String name;
    private Double price;
    private CategoryEnum category;
    private DishEntity dish;
}
