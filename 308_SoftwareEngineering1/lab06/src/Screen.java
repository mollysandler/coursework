import javax.swing.*;
import java.awt.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.LinkedList;
/**
 * @author Jemma Arona
 */
public class Screen extends JPanel implements PropertyChangeListener {
    //private LinkedList<Component> toDraw = new LinkedList<>();
    private static final int PANEL_WIDTH = 600;
    private static final int PANEL_HEIGHT = 400;

    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        LinkedList<Component> toDraw = Repository.getRepository().getComps();
        for (Component c : toDraw){
            c.drawComponent(g);
        }
    }

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        repaint();
        //toDraw = (LinkedList<Component>) evt.getNewValue();
    }

//    @Override
//    protected void paintComponent(Graphics g) {
//        repaint();
//   }

    @Override
    public Dimension getPreferredSize() {
        return new Dimension(PANEL_WIDTH, PANEL_HEIGHT);
    }

}
