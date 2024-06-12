public class AnimationAction implements Action{
    private final AnimationEntity entity;
    private final int repeatCount;

    public AnimationAction(AnimationEntity entity, int repeatCount) {
        this.entity = entity;
        this.repeatCount = repeatCount;
    }

    @Override
    public void executeAction(EventScheduler scheduler) {
            this.entity.nextImage();

            if (this.repeatCount != 1)
            {
                scheduler.scheduleEvent(this.entity, this.entity.createAnimationAction(Math.max(this.repeatCount - 1, 0)),
                        this.entity.getAnimationPeriod());
            }
        }
}
