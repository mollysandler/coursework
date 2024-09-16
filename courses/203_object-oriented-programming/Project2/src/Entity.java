import processing.core.PImage;
import java.util.List;
import java.util.Map;

public interface Entity {
    public Point getPosition();
    public void setPosition(Point position);
    public int getActionPeriod();
    public PImage getCurrentImage();
    public void nextImage();
    public List <PImage> getImages(Map<String, List<PImage>> images, String key);

}
