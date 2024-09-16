/**
 * @author jemma arona
 */

public class BuildingNode {
    private final String name;
    private Point pos;
    private final int length;
    private final int height;
    public Point displayPos;
    private int displayLength;
    private int displayHeight;
    private final int[] color;

    public int getLength() {return length;}
    public int getHeight() {return height;}
    public Point getDisplayPos() {return displayPos;}

    public int getDisplayLength() {
        return displayLength;
    }

    public int getDisplayHeight() {
        return displayHeight;
    }

    public int[] getColor() {
        return color;
    }

    public BuildingNode(String name, int len, int height, int[] color ) {
        this.name = name;
        this.length = len;
        displayLength = len;
        this.height = height;
        displayHeight = height;
        this.color = color.clone();
    }

    public void setPos( Point pos ) {
        this.pos = pos;
        displayPos = pos;
    }

    public void setScale( double l_scale, double h_scale ) {
        displayLength = (int) ( length/l_scale );
        displayHeight = (int) ( height/h_scale );
        displayPos = new Point( (int) ( pos.getX()/l_scale ), (int) ( pos.getY()/l_scale ) );
    }
}