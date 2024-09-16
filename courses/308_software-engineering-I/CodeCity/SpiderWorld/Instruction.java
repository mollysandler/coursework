import processing.core.PApplet;
import processing.core.PImage;

public class Instruction extends dragDrop{
    private final PImage img;
    private final int width;
    private final int height;


    public Instruction(PApplet screen, int xPos, int yPos, PImage img){
        super(screen, xPos, yPos);
        this.img = img;
        width = img.width;
        height = img.height;

    }

    public void display(){
        screen.image(img, xPos, yPos);
    }

    @Override
    public boolean isMouseOver() {
        return (((xPos < screen.mouseX) && (screen.mouseX < xPos + width))
                && ((yPos < screen.mouseY) && (screen.mouseY < yPos + height)));
    }


    // for cloning the sidebar blocks
    //public Instruction clone() throws CloneNotSupportedException {
      //  return new Instruction(screen, this.xPos, this.yPos, img);
  //  }


}

