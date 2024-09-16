import processing.core.PApplet;
import java.lang.Math;

public abstract class drag_drop{
    PApplet screen;
    int x_pos, y_pos;
    int xOffset, yOffset;
    boolean isDragging;

    public drag_drop(PApplet screen, int x, int y) {
        this.screen = screen;
        this.x_pos = x;
        this.y_pos = y;
        this.isDragging = false;
    }
    //continuously updates the screen every x frames

    public void drag() {

        if (isDragging) {

            x_pos = screen.mouseX - xOffset;
            y_pos = screen.mouseY - yOffset;
        }
    }

    public abstract void display();
    public abstract boolean isMouseOver();
    public void mousePressed() {
        if(isMouseOver()){ //calculate offset for the dragging
            xOffset = Math.abs(x_pos - screen.mouseX);
            yOffset = Math.abs(y_pos - screen.mouseY);

            isDragging = true;
        }
    }

    public void mouseReleased() { // once mouse is released it will release the block with it
        isDragging = false;
    }
}
