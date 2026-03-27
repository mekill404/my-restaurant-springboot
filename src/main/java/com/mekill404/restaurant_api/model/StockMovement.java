package com.mekill404.restaurant_api.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import java.time.Instant;

import com.mekill404.restaurant_api.model.enums.StockMovementType;
import com.mekill404.restaurant_api.model.enums.Unit;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class StockMovement {
    private int id;
    private int ingredientId;
    private StockMovementType type;
    private double quantity;
    private Unit unit;
    private Instant movementDatetime;
}
