import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class App extends JFrame implements ActionListener {
    private PlotPanel top, middle, bottom;

    public App() {
        super("design patterns");
        Plot plot1 = new Plot();
        GrayBar grayBar1 = new GrayBar();
        BlueDot blueDot1 = new BlueDot();

        grayBar1.add(blueDot1);
        blueDot1.add(plot1);
        top = new PlotPanel(grayBar1);
        top.setBackground(Color.white);

        Plot plot2 = new Plot();
        BlueDot blueDot2 = new BlueDot();
        blueDot2.add(plot2);
        top = new PlotPanel(blueDot2);
        middle.setBackground(Color.gray);

        Plot plot3 = new Plot();
        top = new PlotPanel(plot3);
        bottom.setBackground(Color.DARK_GRAY);

        JButton button = new JButton("Click Me");
        button.addActionListener(this);

        setLayout(new GridLayout(4, 1));
        add(top);
        add(middle);
        add(bottom);

        Repository.getRepository().addPropertyChangeListener(top);
        Repository.getRepository().addPropertyChangeListener(middle);
        Repository.getRepository().addPropertyChangeListener(bottom);
    }

    public static void main (String[] args){
        App main = new App();
        main.setSize(1000, 1000);
        main.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        main.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        Repository.getRepository().add();
    }
}
