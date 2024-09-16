package test;
import main.part3.Database;
import main.part3.Service;
import java.util.List;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;


public class MockPrac {
    @Test
    void Mock() {
        Database mockedData = mock(Database.class);
        when(mockedData.getUniqueId()).thenReturn(1);
        assertEquals(mockedData.getUniqueId(), 1);
    }


}
