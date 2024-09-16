import processing.core.PImage;

import java.util.List;

public abstract class Octo extends AnimationEntity implements Moveable{
    private final int resourceLimit;

    public Octo(String id, List<PImage> images, int resourceLimit, Point position, int actionPeriod, int animationPeriod) {
        super(id, images, position, actionPeriod, animationPeriod);
        this.resourceLimit = resourceLimit;
    }

    public int getResourceLimit(){
        return this.resourceLimit;
    }

    public Point nextPosition(WorldModel world, Point destPos){
        int horiz = Integer.signum(destPos.x - this.getPosition().x);
        Point newPos = new Point(this.getPosition().x + horiz,
                this.getPosition().y);

        if (horiz == 0 || world.isOccupied(newPos))
        {
            int vert = Integer.signum(destPos.y - this.getPosition().y);
            newPos = new Point(this.getPosition().x,
                    this.getPosition().y + vert);

            if (vert == 0 || world.isOccupied(newPos))
            {
                newPos = this.getPosition();
            }
        }

        return newPos;
    }

    public abstract boolean transform(WorldModel world, EventScheduler scheduler, ImageStore imageStore);

    public abstract boolean move(WorldModel world, Entity target, EventScheduler scheduler);

    }//end of class
