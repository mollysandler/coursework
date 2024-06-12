import java.awt.*;

public class Decorator extends Component{
    Component component;

    public int getX(){
        return component.getX();
    }
    public int getY() {
        return component.getY();
    }

    @Override
    public void drawComponent(Graphics g) {
        if (component != null){
            component.drawComponent(g);
        }
    }

    public void setComponent(Component c){
        this.component = c;
    }
}
