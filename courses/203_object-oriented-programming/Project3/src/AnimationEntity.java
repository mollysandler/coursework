import processing.core.PImage;
import java.util.List;

public abstract class AnimationEntity extends ActiveEntity{
    private final int animationPeriod;

    public AnimationEntity(String id, List<PImage> images, Point position, int actionPeriod, int animationPeriod){
        super("id", images, position, actionPeriod);
        this.animationPeriod = animationPeriod;
    }

    public Action createAnimationAction(int repeatCount) {
        return new AnimationAction(this, repeatCount);
    }

    public int getAnimationPeriod() {
        return this.animationPeriod;
    }
}
