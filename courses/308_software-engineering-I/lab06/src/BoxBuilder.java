import javax.swing.*;
import java.util.Random;
/**
 * @author Molly Sandler
 */

public class BoxBuilder extends JPanel implements Runnable{
    private static final int PANEL_WIDTH = 600;
    private static final int PANEL_HEIGHT = 400;
    private static final int LENGTH = 50;
    private static final int WIDTH = 50;
    private static final int TIMER_DELAY = 1000; // 1 second

    @Override
    public void run() {
        while (true) {
            Random random = new Random();
            int x = random.nextInt(PANEL_WIDTH - WIDTH); // x coordinate
            int y = random.nextInt(PANEL_HEIGHT - LENGTH); // y coordinate
           // System.out.println("(" + x + ", " + y + ")");
            Box b = new Box(x, y);
            Eyes eyes = new Eyes();
            eyes.setComponent(b);
            Repository.getRepository().add(eyes);
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}