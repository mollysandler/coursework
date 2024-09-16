import processing.core.PApplet;

public class Block extends drag_drop{
    int width, height;

    public Block(PApplet screen, int x_pos, int y_pos, int width, int height){
        super(screen, x_pos, y_pos);
        this.width = width;
        this.height = height;
    }

    public void display(){
        screen.fill(120);
        screen.rect(x_pos, y_pos, width, height);
    }

    @Override
    public boolean isMouseOver() {
        return (((x_pos < screen.mouseX) && (screen.mouseX < x_pos + width)) && ((y_pos < screen.mouseY) && (screen.mouseY < y_pos + height)));
    }

}