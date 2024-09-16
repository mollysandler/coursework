import processing.core.PImage;
import java.util.List;

public abstract class ActiveEntity extends Entity { //reviewed and confirmed done
    private final int actionPeriod;

    public ActiveEntity(String id, List <PImage> images, Point position, int actionPeriod) {
        super(id, images, position);
        this.actionPeriod = actionPeriod;
    }

    public Action createActivityAction (WorldModel world, ImageStore imageStore){
        return new ActivityAction(this, world, imageStore);
    }

    public abstract void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler);

    public int getActionPeriod() {return actionPeriod;}

    public abstract void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore);

}//end of class
