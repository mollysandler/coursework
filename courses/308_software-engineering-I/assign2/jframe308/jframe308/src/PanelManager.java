import javax.swing.*;
import javax.swing.table.*;
import java.awt.*;
import java.lang.*;
import java.util.ArrayList;

public class PanelManager {

    public static void resizeColumnWidth(JTable table) {
        final TableColumnModel columnModel = table.getColumnModel();
        for (int column = 0; column < table.getColumnCount(); column++) {
            // Account for header size
            double width = table.getTableHeader().getHeaderRect(column).getWidth();
            for (int row = 0; row < table.getRowCount(); row++) {
                TableCellRenderer renderer = table.getCellRenderer(row, column);
                Component comp = table.prepareRenderer(renderer, row, column);
                width = Math.max(comp.getPreferredSize().width + 1, width);
            }
            if (width > 300)
                width = 300;
            columnModel.getColumn(column).setPreferredWidth((int) width);
        }
    }

    public static DataPanel showTable(ArrayList<FileClass> data){
        Object[][] dataArray = new Object[data.size()][6];
        for (int i=0; i<data.size(); i++) {
            dataArray[i][0] = data.get(i).getName();
            dataArray[i][1] = data.get(i).getLinesOfCode();
            dataArray[i][2] = data.get(i).getLocal();
            dataArray[i][3] = data.get(i).getGlobal();
            dataArray[i][4] = data.get(i).getInterfaces();
            dataArray[i][5] = data.get(i).getParent();
            for (int j=0; j<6; j++) {
                if (dataArray[i][j] == null ) dataArray[i][j] = "/none/";
            }
        }
        String[] columnNames = {"name", "linesOfCode", "local", "global", "interfaces", "parent"};
        DataTable dTable = new DataTable(dataArray, columnNames);
        dTable.setAutoResizeMode( JTable.AUTO_RESIZE_ALL_COLUMNS );
        JScrollPane jPane = new JScrollPane();
        jPane.setViewportView(dTable);
        jPane.setPreferredSize( new Dimension( dTable.getPreferredSize().width + 4, dTable.getPreferredSize().height + 25) );
        DataPanel dPanel = new DataPanel();
        dPanel.add(jPane);

        System.out.println( dTable.getPreferredSize() );
        System.out.println( jPane.getPreferredSize() );
        System.out.println( dPanel.getPreferredSize() );
        return dPanel;
    }

}
