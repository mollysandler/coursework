import java.awt.*;
/**
 * @author Molly Sandler
 */
public class Box extends Component {
    private static final int LENGTH = 50;
    private static final int WIDTH = 50;
    private final int x;
    private final int y;

    public Box(int x, int y){
        this.x = x;
        this.y = y;
    }

    @Override
    public int getX() {
        return x;
    }

    @Override
    public int getY() {
        return y;
    }

    public void drawComponent(Graphics g) {
        //super.drawComponent(g);
        g.setColor(Color.RED);
        g.fillRect(x, y, WIDTH, LENGTH);
    }
}
