import javax.swing.*;
import java.awt.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.LinkedList;

public class PlotPanel extends JPanel implements PropertyChangeListener {

    Component component;

    public PlotPanel(Component component) {
        this.component = component;
    }

    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        component.drawComponent(g, Repository.getRepository().getComponents(), 0);
    }

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        repaint();
    }
}
