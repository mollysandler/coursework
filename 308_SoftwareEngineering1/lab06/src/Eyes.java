import java.awt.*;

public class Eyes extends Decorator{
    private final int CIRCLE_DIAMETER = 20;
    private final int CIRCLE_DIAMETER_INNER = 10;

    @Override
    public void drawComponent(Graphics g){
        component.drawComponent(g);
        int x = super.getX();
        int y= super.getY();

        g.setColor(Color.black);
        g.fillOval(x - 5, y - 5, CIRCLE_DIAMETER, CIRCLE_DIAMETER);
        g.fillOval(x + 35, y - 5 , CIRCLE_DIAMETER, CIRCLE_DIAMETER);

        g.setColor(Color.white);
        g.fillOval(x + 3, y + 3, CIRCLE_DIAMETER_INNER, CIRCLE_DIAMETER_INNER);
        g.fillOval(x + 43, y + 3 , CIRCLE_DIAMETER_INNER, CIRCLE_DIAMETER_INNER);

    }

}
