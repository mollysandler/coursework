public interface Moveable extends AnimationEntity{
    public boolean move(WorldModel world, Entity target, EventScheduler scheduler);
    public Point nextPosition(WorldModel world, Point destPos);

}
