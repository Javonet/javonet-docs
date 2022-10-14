import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.java.Javonet;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.EnabledOnOs;
import org.junit.jupiter.api.condition.OS;

import java.nio.file.Paths;

public class JvmToPerlIntegrationTest {

    private final String _javonetSrcRoot = Paths.get("").toAbsolutePath().getParent().getParent().toString();

    // <TestResources_TestClassValues>
    private final String libraryPath = _javonetSrcRoot + "/testResources/perl/PerlTestClass.pm";
    private final String className = "PerlTestClass::PerlTestClass";
    // </TestResources_TestClassValues>

    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
    }

}
