import processing.core.PApplet;
import processing.core.PImage;

public class Main extends PApplet {
    StepInstruction testblock;
//    Block testblock;
    PImage stepBlock_photo;

    public void settings() {
        size(1600, 900);
    }

    public void setup() {
        stepBlock_photo = loadImage("OIP.jpg");
        testblock = new StepInstruction(this, 100, 100, stepBlock_photo);
//        testblock = new Block(this, 100, 100, 150, 100);

    }

    public void draw() {
        background(255);
        testblock.display();
        testblock.drag();
    }

    public void mousePressed() {
        testblock.mousePressed();
    }

    public void mouseReleased() {
        testblock.mouseReleased();
    }

    public static void main(String[] args) {
        PApplet.main("Main");
    }
}
