import java.util.Comparator;

final class EventComparator //reviewed and confirmed done
   implements Comparator<Event>
{
   public int compare(Event lft, Event rht)
   {
      return (int)(lft.getTime() - rht.getTime());
   }

}//end of class
