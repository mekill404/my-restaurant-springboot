package com.mekill404.restaurant_api.model;

import com.mekill404.restaurant_api.model.enums.Category;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Ingredient {
    private int id;
    private String name;
    private Double price;
    private Category category;
}
