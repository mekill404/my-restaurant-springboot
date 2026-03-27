package com.mekill404.restaurant_api.entity;

import java.time.Instant;

import com.mekill404.restaurant_api.entity.enums.MovementTypeEnum;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class StockMovement {
    private Integer id;
    private MovementTypeEnum type;
    private StockValue value;
    private Instant creationDateTime;
}
