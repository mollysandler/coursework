import java.beans.PropertyChangeSupport;
import java.util.LinkedList;
/**
 * @author Jemma Arona
 */

public class Repository extends PropertyChangeSupport {
    private static Repository repository;
    private LinkedList<Component> objects;

    protected Repository() {
        super( new Object() );
        objects = new LinkedList<>();
    }

    public LinkedList<Component> getComps(){
        return this.objects;
    }

    public static Repository getRepository() {
        if ( repository == null ) {
            repository = new Repository();
        }
        return repository;
    }

    public void add(Component s ) {
        objects.add(s);
        firePropertyChange("toDraw", null, objects );
    }
}
