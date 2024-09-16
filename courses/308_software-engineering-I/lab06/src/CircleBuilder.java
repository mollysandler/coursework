//import javax.swing.*;
//import java.util.Random;
//
///**
// * @author Molly Sandler
// */
//
//public class CircleBuilder extends JPanel implements Runnable {
//    private static final int PANEL_WIDTH = 600;
//    private static final int PANEL_HEIGHT = 400;
//    private static final int CIRCLE_DIAMETER = 50;
//
//    public CircleBuilder() {}
//
//
//    @Override
//    public void run() {
//        while (true) {
//            Random random = new Random();
//            int x = random.nextInt(PANEL_WIDTH - CIRCLE_DIAMETER); // x coordinate
//            int y = random.nextInt(PANEL_HEIGHT - CIRCLE_DIAMETER); // y coordinate
//            System.out.println("(" + x + ", " + y + ")");
//            Repository.getRepository().add(new Circle(x, y));
//            try {
//                Thread.sleep(1000);
//            } catch (InterruptedException e) {
//                e.printStackTrace();
//            }
//        }
//    }
//
//}
