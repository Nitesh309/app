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

    public static void main(String[] args) {
        LaundryService service = new LaundryService();
        System.out.println("Laundry Service Started!");
        System.out.println("Shirt cost for 2 items: $" + service.calculateCost("shirt", 2));
        
        // Keep the application running
        try {
            Thread.sleep(Long.MAX_VALUE);
        } catch (InterruptedException e) {
            System.out.println("Application interrupted");
        }
    }
}
