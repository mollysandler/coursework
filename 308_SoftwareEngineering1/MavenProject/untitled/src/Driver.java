import javax.swing.*;
import org.jfree.chart.*;

public class Driver extends JFrame{
    public Driver(String title) {
        super (title);
        this.add (createChart( ));
    }

    private static ChartPanel createChart() {
        DefaultPieDataset dataset = new DefaultPieDataset();
        dataset.setValue("Quiz 01", new Double (20));
        dataset.setValue("Quiz 02", new Double (20));
        dataset.setValue("Exam", new Double ((40)));
        dataset.setValue("Project", new Double (10));

        JFreeChart chart = ChartFactory.createPieChart(
                "Final Grade Distribution", dataset, true, true, false);
        return new ChartPanel(chart);
    }
    public void Driver(String [] args){
        Driver demo = new Driver("Example of JFree Chart");
        demo.setSize(560, 367);
        demo.setVisible(true);
    }

}