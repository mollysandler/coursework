import java.beans.PropertyChangeSupport;
import java.util.LinkedList;

public class Repository extends PropertyChangeSupport {
    private static Repository repository;
    private LinkedList<Double> components;

    protected Repository() {
        super(new Object());
        components = new LinkedList<Double>();
    }

    public static Repository getRepository() {
        if (repository == null) {
            repository = new Repository();
        }
        return repository;
    }

    public LinkedList<Double> getComponents() {
        return components;
    }

    public void add() {
        components.add(Math.random());
        firePropertyChange("toDraw", null, components);
    }
}










