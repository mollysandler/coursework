import multiset.ImplementingClass;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;
import java.util.ArrayList;
import java.util.Optional;


class TestMulti {

    @Test
    void testSizeNoDup(){
        ImplementingClass<Object> stuff = new ImplementingClass<>();
        stuff.add("Molly");
        Assertions.assertEquals(1, stuff.size());
        stuff.add("Sandler");
        Assertions.assertEquals(2, stuff.size());
    }

    @Test
    void testSizeDup(){
        ImplementingClass<Object> stuff = new ImplementingClass<>();
        stuff.add("Molly");
        Assertions.assertEquals(1, stuff.size());
        stuff.add("Molly");
        Assertions.assertEquals(2, stuff.size());
    }

    @Test
    void testRemove(){
        ImplementingClass<Object> stuff = new ImplementingClass<>();
        stuff.add("Molly");
        Assertions.assertTrue(stuff.remove("Molly"));
        Assertions.assertFalse(stuff.remove("Sandler"));
    }
    @Test
    void testRemoveEmpty(){
        ImplementingClass<Object> stuff = new ImplementingClass<>();
        Assertions.assertFalse(stuff.remove("Sandler"));
    }

    @Test
    void testCount(){
        ImplementingClass<Object> stuff = new ImplementingClass<>();
        stuff.add("Molly");
        Assertions.assertEquals(1, stuff.count("Molly"));
        stuff.add("Molly");
        Assertions.assertEquals(2, stuff.count("Molly"));
    }

    @Test
    void testCount2(){
        ImplementingClass<Object> stuff = new ImplementingClass<>();
        stuff.add("Molly");
        Assertions.assertEquals(1, stuff.count("Molly"));
        stuff.add("Molly");
        Assertions.assertEquals(2, stuff.count("Molly"));
        stuff.add(9);
        Assertions.assertEquals(2, stuff.count("Molly"));
    }

    @Test
    void testCountAbsent(){
        ImplementingClass<Object> stuff = new ImplementingClass<>();
        stuff.add("Molly");
        Assertions.assertEquals(0, stuff.count(80));
    }

    @Test
    void testAddDiffTypes(){
        ImplementingClass<Object> stuff = new ImplementingClass<>();
        ArrayList<Object> molly = new ArrayList<>();
        stuff.add("Molly");
        Assertions.assertEquals(1, stuff.size());
        stuff.add(6);
        stuff.add(9.0);
        stuff.add(molly);
        Assertions.assertEquals(4, stuff.size());
    }


    @Test
    void testGrab(){
        ImplementingClass<Object> stuff = new ImplementingClass<>();
        ArrayList<Object> molly = new ArrayList<>();
        stuff.add("Molly");
        Assertions.assertEquals(1, stuff.size());
        stuff.add(6);
        stuff.add(9.0);
        stuff.add(molly);
        Assertions.assertEquals("Molly", stuff.grab().get());
    }

    @Test
    void testGrabEmpty(){
        ImplementingClass<Object> stuff = new ImplementingClass<>();
        Assertions.assertEquals((Optional.empty()), stuff.grab());
    }

}
