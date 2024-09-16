import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.ArrayList;

import org.junit.Test;

public class TestCases
{
   private static final Song[] songs = new Song[] {
         new Song("Decemberists", "The Mariner's Revenge Song", 2005),
         new Song("Rogue Wave", "Love's Lost Guarantee", 2005),
         new Song("Avett Brothers", "Talk on Indolence", 2006),
         new Song("Gerry Rafferty", "Baker Street", 1998),
         new Song("City and Colour", "Sleeping Sickness", 2007),
         new Song("Foo Fighters", "Baker Street", 1997),
         new Song("Queen", "Bohemian Rhapsody", 1975),
         new Song("Gerry Rafferty", "Baker Street", 1978)
      };

   @Test
   public void testArtistComparator() //passes all
   {
      ArtistComparator acomp = new ArtistComparator();
      int result = acomp.compare(songs[0], songs[1]);
      assertTrue(result < 0);
      int result2 = acomp.compare(songs[0], songs[2]);
      assertTrue(result2 > 0);
      int result3 = acomp.compare(songs[0], songs[0]);
      assertEquals(0, result3);

   }

   @Test
   public void testLambdaTitleComparator() {//all pass
     Comparator<Song> titleComp = (s1, s2) -> s1.getTitle().compareTo(s2.getTitle());
     int result = titleComp.compare(songs[0], songs[1]);
     assertTrue(result > 0);
     int result2 = titleComp.compare(songs[1], songs[0]);
     assertTrue(result2 < 0);
     int result3 = titleComp.compare(songs[0], songs[0]);
      assertEquals(0, result3);

   }

   @Test
   public void testYearExtractorComparator() //all pass
   {
      Comparator<Song> yearComp = Comparator.comparing(Song::getYear);
      int result = yearComp.compare(songs[0], songs[2]);
      assertTrue(result < 0);
      int result2 = yearComp.compare(songs[2], songs[0]);
      assertTrue(result2 > 0);
      int result3 = yearComp.compare(songs[0], songs[0]);
      assertEquals(0, result3);
   }

   @Test
   public void testComposedComparator() //passes
   {
      ComposedComp comp = new ComposedComp();
      int result = comp.compare(songs[0], songs[1]);
      assertTrue(result < 0);
      int result2 = comp.compare(songs[1], songs[0]);
      assertTrue(result2 > 0);
      int result3 = comp.compare(songs[0], songs[0]);
      assertEquals(0, result3);
   }

   @Test
   public void testThenComparing() //all pass
   {
      Comparator<Song> comps = Comparator.comparing(Song::getTitle);
      Comparator<Song> comps2 = Comparator.comparing(Song::getArtist);

      int result = comps.thenComparing(comps2).compare(songs[0], songs[1]);
      assertTrue(result > 0);
      int result2 = comps.thenComparing(comps2).compare(songs[1], songs[0]);
      assertTrue(result2 < 0);
      int result3 = comps.thenComparing(comps2).compare(songs[0], songs[0]);
      assertEquals(0, result3);
   }

   @Test
   public void runSort() //passes!
   {
      List<Song> songList = new ArrayList<>(Arrays.asList(songs));
      List<Song> expectedList = Arrays.asList(
         new Song("Avett Brothers", "Talk on Indolence", 2006),
         new Song("City and Colour", "Sleeping Sickness", 2007),
         new Song("Decemberists", "The Mariner's Revenge Song", 2005),
         new Song("Foo Fighters", "Baker Street", 1997),
         new Song("Gerry Rafferty", "Baker Street", 1978),
         new Song("Gerry Rafferty", "Baker Street", 1998),
         new Song("Queen", "Bohemian Rhapsody", 1975),
         new Song("Rogue Wave", "Love's Lost Guarantee", 2005)
         );

      Comparator<Song> comps = Comparator.comparing(Song::getArtist);
      Comparator<Song> comps2 = Comparator.comparing(Song::getTitle);
      Comparator<Song> comps3 = Comparator.comparing(Song::getYear);

      Comparator<Song> result = comps.thenComparing(comps2).thenComparing(comps3);
      songList.sort(result);
      assertEquals(songList, expectedList);
   }
}
