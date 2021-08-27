package wf.testRunner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import wf.util.TestUtil;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ExperienceAPISmokeTestRunner {
    @Test
    void expAPISmokeTest() {
        Results results = Runner.path("classpath:wf/experienceAPI").tags("@smoke").outputCucumberJson(true).parallel(1);
        TestUtil.generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
  }

