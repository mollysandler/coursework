import javax.swing.*;
import java.awt.*;
import java.util.*;

public class Driver {

    /**
     * @author Molly Sandler dummy testing data task
     */
    public static void main(String[] args){

        ArrayList<HashMap<String, Object[]>> array = new ArrayList<>();

        HashMap<String, Object[]> map = new HashMap<>();
        map.put("Poland", new Object[] {5, 6, 5, 2, "poland"});
        map.put("United States", new Object[] {0, 2, 5, 6, "us"});
        map.put(null, new Object[] {0, 0, 0, 0});
        map.put("Iceland", new Object[] {0, 0, 0, 0});

        array.add(map);

        ArrayList<FileClass> data = DataManager.convertData(array);
        System.out.println(data);

        DummyFrame frame = new DummyFrame();
        JPanel dataPanel = PanelManager.showTable( data );
        frame.add( dataPanel );
        frame.setContentPane( dataPanel );
        System.out.println( frame.getPreferredSize());
        frame.setSize( new Dimension( dataPanel.getPreferredSize().width, dataPanel.getPreferredSize().height + 30) );

        frame.setVisible( true );

    }
}
