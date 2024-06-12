import java.util.Comparator;

public class ComposedComp implements Comparator<Song> {
    public int compare(Song o1, Song o2) {
        int result = Integer.compare(o1.getYear(), (o2.getYear()));
        if(result == 0){
            return o1.getArtist().compareTo(o2.getArtist());
        }
        return result;
    }
}
