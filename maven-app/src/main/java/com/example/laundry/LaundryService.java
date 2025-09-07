package com.example.laundry;

import java.util.HashMap;
import java.util.Map;

public class LaundryService {
    private final Map<String, Double> laundryPrices;

    public LaundryService() {
        laundryPrices = new HashMap<>();
        laundryPrices.put("shirt", 5.0);
        laundryPrices.put("pants", 7.0);
        laundryPrices.put("dress", 10.0);
    }

    public double calculateCost(String item, int quantity) {
        if (!laundryPrices.containsKey(item)) {
            throw new IllegalArgumentException("Item not found: " + item);
        }
        return laundryPrices.get(item) * quantity;
    }
}
