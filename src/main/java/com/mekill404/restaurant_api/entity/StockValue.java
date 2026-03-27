package com.mekill404.restaurant_api.entity;

import com.mekill404.restaurant_api.entity.enums.UnitEnum;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class StockValue {
    private Double quantity;
    private UnitEnum unit;
}
