import processing.core.PApplet;
import processing.core.PImage;

import java.util.ArrayList;
import java.util.HashMap;

public class Driver extends PApplet{

    private World world;
    private LoadLevels level;
    Instruction[] originalInstructions;
    // blocks from the sidebar
    private StepInstruction stepBlock;
    private TurnInstruction turnBlock;
    // to store any new blocks dragged into the game
    ArrayList<Instruction> instructionCopies;

    @Override
    public void settings(){
        size(1200, 900);
    }

    @Override
    public void setup(){
        world = new World(this);
        level = new LoadLevels(0);

        PImage stepBlockImage = loadImage("images/step.png");
        stepBlock = new StepInstruction(this, 500, 500, stepBlockImage);

        PImage turnBlockImage = loadImage("images/turn.png");
        turnBlock = new TurnInstruction(this, 600, 600, turnBlockImage);

        originalInstructions = new Instruction[]{stepBlock, turnBlock};
        instructionCopies = new ArrayList<>();
    }
    @Override
    public void draw() {
        background(100, 100, 100);
        for (Instruction currInstruction : originalInstructions) {
            currInstruction.display();
        }
        HashMap<String, ArrayList<Point>> map = level.loadHashMap();
        world.setLevel(map);
        world.drawWorld();
        stepBlock.drag();
        turnBlock.drag();
        level.saveHashMap(map);

        //displays all copies
        for (Instruction currInstruction : instructionCopies) {
            currInstruction.drag();
            currInstruction.display();
        }
    }

    @Override
    public void mousePressed() {
        //when on original blocks, will create copies and will automatically be dragging copies
        for(Instruction currInstruction: originalInstructions) {
            if (currInstruction.isMouseOver()) {
                Instruction copy = currInstruction.clone(); // Create a copy
                copy.mousePressed();
                instructionCopies.add(copy); // Add the copy to the list
                break;
            }
        }
        //lets you drag around copies that you've dropped
        for (Instruction copy : instructionCopies) {
            if (copy.isMouseOver()) {
                copy.mousePressed();
            }
        }

    }

    @Override
    public void mouseReleased() {
        //release mouse, set drag false
        for (Instruction currInstruction : instructionCopies){
            currInstruction.isDragging = false;
        }

    }

    public static void main(String[] args) {
        String[] processingArgs = {"Driver"};
        Driver running = new Driver();
        PApplet.runSketch(processingArgs, running);
    }
}
