package com.example.laundry;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class LaundryServiceTest {

    @Test
    void testCalculateCost_validItem() {
        LaundryService laundryService = new LaundryService();
        double cost = laundryService.calculateCost("shirt", 3);
        assertEquals(15.0, cost);
    }

    @Test
    void testCalculateCost_invalidItem() {
        LaundryService laundryService = new LaundryService();
        Exception exception = assertThrows(IllegalArgumentException.class, 
                () -> laundryService.calculateCost("socks", 2));
        assertEquals("Item not found: socks", exception.getMessage());
    }
}
