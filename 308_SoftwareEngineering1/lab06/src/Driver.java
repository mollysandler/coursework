import javax.swing.*;
/**
 * @author Aayush Joshi
 */
public class App extends JFrame {
    public App() {
        Screen screen =  new Screen();
        add(screen);
        //CircleBuilder cbuild = new CircleBuilder();
        BoxBuilder bbuild = new BoxBuilder();
        //Thread t1  = new Thread(cbuild);
        Thread t2  = new Thread(bbuild);
        //t1.start();
        t2.start();

        Repository repo = Repository.getRepository();
        repo.addPropertyChangeListener(screen);
    }

    public static void main (String[] args){
        Driver main = new Driver();
        main.setSize(1000, 1000);
        main.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        main.setVisible(true);

    }
}