package com.mekill404.restaurant_api.dto;

import com.mekill404.restaurant_api.model.enums.DishType;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DishCreateRequestDto {
    private String name;
    private DishType dishType;
    private Double sellingPrice;
}
