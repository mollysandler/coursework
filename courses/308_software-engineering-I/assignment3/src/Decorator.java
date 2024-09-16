import java.awt.*;
import java.util.LinkedList;

public class Decorator extends Component{

    protected Component component;

    public void add(Component c){
        component = c;
    }

    @Override
    public void draw(Graphics g, LinkedList<Double> values, int avg) {
        component.draw(g, values, avg);
    }

    @Override
    public void drawComponent(Graphics g, LinkedList<Double> values, int avg) {
        
    }
}