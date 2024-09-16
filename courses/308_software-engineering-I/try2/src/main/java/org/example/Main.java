package org.example;
import org.jfree.chart.*;
import org.jfree.data.general.DefaultPieDataset;

import javax.swing.*;

public class Main extends JFrame{
    public Main(String title) {
        super (title);
        this.add (createChart( ));
    }

    private static ChartPanel createChart() {
        DefaultPieDataset dataset = new DefaultPieDataset();
        dataset.setValue("Quiz 01",  (20));
        dataset.setValue("Quiz 02",  (20));
        dataset.setValue("Exam",  ((40)));
        dataset.setValue("Project",  (10));

        JFreeChart chart = ChartFactory.createPieChart(
                "Final Grade Distribution", dataset, true, true, false);
        return new ChartPanel(chart);
    }
    public static void main(String [] args){
        Main demo = new Main("Example of JFree Chart");
        demo.setSize(560, 367);
        demo.setVisible(true);
    }

}