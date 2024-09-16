import processing.core.PApplet;
import processing.core.PImage;

public class Instruction extends drag_drop{

    PImage img;
    int width, height;


    public Instruction(PApplet screen, int x_pos, int y_pos, PImage img){
        super(screen, x_pos, y_pos);
        this.img = img;
        width = img.width;
        height = img.height;

    }

    public void display(){
        screen.image(img, x_pos, y_pos);
    }

    @Override
    public boolean isMouseOver() {
        return (((x_pos < screen.mouseX) && (screen.mouseX < x_pos + width)) && ((y_pos < screen.mouseY) && (screen.mouseY < y_pos + height)));
    }


    // for cloning the sidebar blocks
    public Instruction clone() {
        return new Instruction(screen, this.x_pos, this.y_pos, img);
    }


}

