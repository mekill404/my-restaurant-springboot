package com.mekill404.restaurant_api.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import java.util.List;

import com.mekill404.restaurant_api.model.enums.DishType;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Dish {
    private int id;
    private String name;
    private DishType dishType;
    private Double sellingPrice;
    private List<Ingredient> ingredients;
}
