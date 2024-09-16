package test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import org.junit.jupiter.api.Test;
import java.time.LocalTime;
import main.part1.MovieTicketPriceCalculator;

class Test1 {

    @Test
    void seniorPrice() {
        LocalTime start = LocalTime.of(3, 0, 0, 0);
        LocalTime end = LocalTime.of(5, 0, 0, 0);

        MovieTicketPriceCalculator movie =
                new MovieTicketPriceCalculator(start, end, 10, 65);
        int cost1 = movie.computePrice(start, 65);
        int cost2 = movie.computePrice(start, 9);
        int cost3 = movie.computePrice(start, 30);
        assertEquals(2000, cost1);
        assertEquals(2100, cost2);
        assertEquals(2400, cost3);
    }

    @Test
    void badStartTime() {
        LocalTime start = LocalTime.of(5, 0, 0, 0);
        LocalTime end = LocalTime.of(3, 0, 0, 0);
        assertThrows(IllegalArgumentException.class, () -> {
            MovieTicketPriceCalculator movie =
                    new MovieTicketPriceCalculator(start, end, 10, 65); ;
        });
    }
    @Test
    void nonMatineeTime() {
        LocalTime start = LocalTime.of(3, 0, 0, 0);
        LocalTime end = LocalTime.of(5, 0, 0, 0);

        LocalTime standard = LocalTime.of(8, 0,0, 0);

        MovieTicketPriceCalculator movie =
                new MovieTicketPriceCalculator(start, end, 10, 65);
        int cost1 = movie.computePrice(standard, 65);
        assertEquals(2300, cost1);
    }


}//end of testing class

