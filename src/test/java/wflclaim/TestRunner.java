package wflclaim;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import com.test.util.TestUtil;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class TestRunner {
//   @Karate.Test
//    Karate testGetClaim() {
//       return Karate.run("getClaim").relativeTo(getClass());
//   }
//   @Karate.Test
//   Karate testGetCustomer() {
//      return Karate.run("getCustomerNumber").relativeTo(getClass());
//    }
    @Test
    void test1() {
        Results results = Runner.path("classpath:wflclaim").tags("~@ignore").outputCucumberJson(true).parallel(1);
        TestUtil.generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    }

