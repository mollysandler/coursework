import java.util.List;
import java.util.Objects;

class Student
{
   private final String surname;
   private final String givenName;
   private final int age;
   private final List<CourseSection> currentCourses;

   public Student(final String surname, final String givenName, final int age,
      final List<CourseSection> currentCourses)
   {
      this.surname = surname;
      this.givenName = givenName;
      this.age = age;
      this.currentCourses = currentCourses;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;
      Student student = (Student) o;
      return age == student.age && Objects.equals(surname, student.surname) && Objects.equals(givenName, student.givenName)
              && Objects.equals(currentCourses, student.currentCourses);
   }

   @Override
   public int hashCode() {
      return Objects.hash(surname, givenName, age, currentCourses);
   }
}//end of class
