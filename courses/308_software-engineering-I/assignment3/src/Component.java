import java.awt.*;
import java.util.LinkedList;

public abstract class Component {
    public abstract void drawComponent(Graphics g, LinkedList<Double> values, int avg);
}


