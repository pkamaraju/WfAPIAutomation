package demo;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate testSample() {
        return Karate.run("user1").relativeTo(getClass());
    }
}
