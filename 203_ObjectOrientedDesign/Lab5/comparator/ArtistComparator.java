import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;

public class ArtistComparator implements Comparator<Song> {
    public int compare(Song o1, Song o2) {
        return o1.getArtist().compareTo(o2.getArtist());
    }


    public void read() throws FileNotFoundException {
        String inputFile = " ";
        Scanner in = new Scanner(inputFile);
        ArrayList<String> hello = new ArrayList<>();

        while(in.hasNext()){
            String line = in.nextLine();
            hello.add(line);
       }

        String output = " ";
        PrintWriter out = new PrintWriter(output);
        for(String part : hello){
            out.println(part);

        }

        in.close();
        out.close();
    }
}




