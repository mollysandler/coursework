import processing.core.PApplet;
import processing.core.PImage;

import java.util.ArrayList;

public class drag_drop extends PApplet{

    // to store the blocks from the sidebar
    Instruction[] originalInstructions;
    // blocks from the sidebar
    Instruction stepBlock;
    Instruction turnBlock;
    // to store any new blocks dragged into the game
    ArrayList<Instruction> instructionCopies;

    // initialize window size
    public void settings() {
        size(800, 500);
    }

    // create sidebar blocks and sidebar array and initiate empty copies arraylist
    public void setup() {
        stepBlock = new StepInstruction(590, 100);
        turnBlock = new TurnInstruction(590, 200);
        originalInstructions = new Instruction[]{stepBlock, turnBlock};
        instructionCopies = new ArrayList<>();
    }

    // continuously updates the screen every x frames
    public void draw() {
        // clear the background
        background(255);
        // display sidebar blocks
        for (Instruction currInstruction : originalInstructions) {
            currInstruction.display();
        }
        // display and update positioning of the copies
        for (Instruction currInstruction : instructionCopies) {
            if (currInstruction.attachedMouse) {
                currInstruction.x_pos = mouseX - currInstruction.xOffset;
                currInstruction.y_pos = mouseY - currInstruction.yOffset;
            }
            currInstruction.display();
        }
    }

    public void mousePressed() {
        // enables moving the copies
        for (Instruction copy : instructionCopies) {
            if (copy.mouseOver(mouseX, mouseY)) {
                beginDragging(copy);
                return;
            }
        }
        // to create a copy
        for (Instruction currInstruction : originalInstructions) {
            if(currInstruction.mouseOver(mouseX, mouseY)) {
                Instruction copy = currInstruction.clone(); // Create a copy
                copy.xOffset = mouseX - copy.x_pos;
                copy.yOffset = mouseY - copy.y_pos;
                copy.attachedMouse = true;
                instructionCopies.add(copy); // Add the copy to the list
                break;
            }
        }
    }

    // for moving the copies
    private void beginDragging(Instruction instruction) {
        instruction.xOffset = mouseX - instruction.x_pos;
        instruction.yOffset = mouseY - instruction.y_pos;
        instruction.attachedMouse = true;
    }

    public void mouseReleased() {
        for (Instruction currInstruction : instructionCopies) {
            currInstruction.attachedMouse = false;
        }
    }

    public class Instruction{
        int x_pos, y_pos;
        int xOffset, yOffset;
        PImage img;
        boolean attachedMouse = false;
        private final String imagePath;


        public Instruction(int x_pos, int y_pos, String imagePath){
            this.x_pos = x_pos;
            this.y_pos = y_pos;
            this.imagePath = imagePath;
            img = loadImage(imagePath);
            width = img.width;
            height = img.height;

        }

        public void display(){
            image(img, x_pos, y_pos);
        }

        boolean mouseOver(int xMouse, int yMouse) {
            return (x_pos <= xMouse && xMouse <= x_pos + width) && (y_pos <= yMouse && yMouse <= y_pos + height);
        }

        // for cloning the sidebar blocks
        public Instruction clone() {
            return new Instruction(this.x_pos, this.y_pos, this.getImagePath());
        }

        private String getImagePath() {
            return imagePath;
        }

    }

    public class StepInstruction extends Instruction {
        public StepInstruction(int x_pos, int y_pos) {
            super(x_pos, y_pos, "images/step.png");
        }
    }

    public class TurnInstruction extends Instruction {
        public TurnInstruction(int x_pos, int y_pos) {
            super(x_pos, y_pos, "images/turn.png");
        }
    }

    public static void main(String[] args){
        PApplet.main("drag_drop");
    }
}
