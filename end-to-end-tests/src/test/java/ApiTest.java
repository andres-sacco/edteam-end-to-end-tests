import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;


class ApiTest {

    /*@Karate.Test
    Karate runAllTests() {
        return Karate.run().tags("~@ignore").relativeTo(getClass());
    }*/


    @Test
    void testParallel() {
        Results results = Runner.path("classpath:reservation/")
                .parallel(12); // Number of threads
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}