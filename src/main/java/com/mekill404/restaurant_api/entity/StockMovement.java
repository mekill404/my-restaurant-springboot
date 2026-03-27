package com.mekill404.restaurant_api.entity;

import java.time.Instant;

import com.mekill404.restaurant_api.entity.enums.MovementTypeEnum;
import com.mekill404.restaurant_api.entity.enums.UnitEnum;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class StockMovement {
    private Integer id;
    private IngredientEntity ingredient;
    private MovementTypeEnum type;
    private Double quantity;
    private UnitEnum unit;
    private Instant creationDateTime;
}
