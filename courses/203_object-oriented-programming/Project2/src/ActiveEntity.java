public interface ActiveEntity extends Entity{
    public void executeActivity(WorldModel world, ImageStore imageStore, EventScheduler scheduler);
    public void scheduleActions(EventScheduler scheduler, WorldModel world, ImageStore imageStore);
    public Action createActivityAction(WorldModel world, ImageStore imageStore);

}
