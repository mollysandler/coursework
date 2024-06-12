import java.util.Objects;

public class Node { //reviewed and confirmed done
    private int g;
    private int h;
    private int f;
    private Node previous = null;
    private Point location;

    public Node(Point l, Node p, int g, int h){
        this.previous = p;
        this.location = l;
        this.g = g;
        this.h = h;
        this.f = g + h;
    }

    public int getF() {
        return f;
    }

    public int getG() {
        return g;
    }

    public Node getPrevious() {
        return previous;
    }

    public Point getLocation() {
        return location;
    }

    public void setG(int g) {
        this.g = g;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Node node = (Node) o;
        return Objects.equals(location, node.location);
    }

    @Override
    public int hashCode() {
        return Objects.hash(location);
    }
}//end of class
