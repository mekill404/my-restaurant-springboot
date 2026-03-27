package com.mekill404.restaurant_api.entity;

import java.util.List;

import com.mekill404.restaurant_api.entity.enums.DishTypeEnum;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DishEntity {
    private int id;
    private String name;
    private DishTypeEnum dishType;
    private Double price;
    private  List<DishIngredientEntity> dishIngredients;
}
