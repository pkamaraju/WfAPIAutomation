package wflclaim;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.test.util.TestUtil;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class SmokeTestRunner {
    @Test
    void wflSmokeTest() {
        Results results = Runner.path("classpath:wflclaim").tags("@smoke").outputCucumberJson(true).parallel(1);
        TestUtil.generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
  }

