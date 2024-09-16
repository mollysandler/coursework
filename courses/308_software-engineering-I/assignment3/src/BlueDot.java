import java.awt.*;
import java.util.LinkedList;

public class BlueDot extends Decorator{
    private static final int POINT_HEIGHT = 10;
    private final int MAX_NUMBER_OF_VALUES = 20;

    @Override
    public void draw(Graphics g, LinkedList<Double> values, int avg) {

        g.setColor(Color.black);
        for (int i = 0; i < values.size(); i++) {
            g.fillRect(
                    (500/MAX_NUMBER_OF_VALUES*i) - (POINT_HEIGHT/2),
                    (int) Math.round(values.get(i)) - (POINT_HEIGHT/2),
                    POINT_HEIGHT,
                    POINT_HEIGHT
            );
        }
        super.draw(g, values, avg);
    }
}