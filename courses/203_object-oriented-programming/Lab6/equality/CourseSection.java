import java.time.LocalTime;
import java.util.Objects;

class CourseSection
{
   private final String prefix;
   private final String number;
   private final int enrollment;
   private final LocalTime startTime;
   private final LocalTime endTime;

   public CourseSection(final String prefix, final String number,
      final int enrollment, final LocalTime startTime, final LocalTime endTime)
   {
      this.prefix = prefix;
      this.number = number;
      this.enrollment = enrollment;
      this.startTime = startTime;
      this.endTime = endTime;
   }

   public boolean equals(Object o) {
      if (o == null || getClass() != o.getClass()) return false;
      return ((CourseSection) o).prefix.equals(this.prefix) && ((CourseSection) o).number.equals(this.number)
              && ((CourseSection) o).enrollment == this.enrollment
              && ((CourseSection) o).startTime.equals(this.startTime) && ((CourseSection) o).endTime.equals(this.endTime);
   }

   public int hashCode() {
      if (this == null) return 0;
         int hashval = 3;
         hashval += 31 * this.prefix.hashCode();
         hashval +=31 * 31 * this.number.hashCode();
         hashval +=31 * 31  * 31 * this.enrollment;
         hashval +=31 * 31  * 31 * 31 * this.startTime.hashCode();
         hashval +=31 * 31  * 31 * 31 * 31 * this.endTime.hashCode();
         return hashval;
      }

   // additional likely methods not defined since they are not needed for testing
}
