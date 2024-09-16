import processing.core.PApplet;

public class Block extends dragDrop{
    int width;
    int height;

    public Block(PApplet screen, int xPos, int yPos, int width, int height){
        super(screen, xPos, yPos);
        this.width = width;
        this.height = height;
    }

    public void display(){
        screen.fill(120);
        screen.rect(xPos, yPos, width, height);
    }

    @Override
    public boolean isMouseOver() {
        return (((xPos < screen.mouseX) && (screen.mouseX < xPos + width))
                && ((yPos < screen.mouseY) && (screen.mouseY < yPos + height)));
    }

}