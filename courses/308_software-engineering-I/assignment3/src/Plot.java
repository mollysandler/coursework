import java.awt.*;
import java.util.LinkedList;

public class Plot extends Component {
    public final int MAX_NUMBER_OF_VALUES = 20;
    public final int PANEL_WIDTH;
    public final int PANEL_HEIGHT;

    @Override
    public void draw(Graphics g, LinkedList<Double> values, int avg ) {
        g.setColor( Color.red );
        g.drawLine( 0, PANEL_HEIGHT - avg, PANEL_WIDTH, PANEL_HEIGHT-avg);
        g.setColor( Color.blue);
        for ( int i = values.size() - 20; i < values.size(); i++ ) {
            if ( i < 1 ) { i = 1; continue; }
            g.drawLine(
                    PANEL_WIDTH/MAX_NUMBER_OF_VALUES*( i - 1 ),
                    PANEL_HEIGHT - (int) Math.round( values.get( i - 1 ) ),
                    PANEL_WIDTH/MAX_NUMBER_OF_VALUES*i,
                    PANEL_HEIGHT - (int) Math.round( values.get( i ) ) );
        }
    }

}