import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.internal.RuntimeContext;
import com.javonet.sdk.java.Javonet;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.nio.file.Paths;

public class JvmToPerlIntegrationTest {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/perl-package";

    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PERL runtime context
        RuntimeContext perlRuntime = Javonet.inMemory().perl();

        // set up variables.
        String libraryPath = resourcesDirectory ;
        String fileName = "PerlTestClass.pm";

        // load custom PERL library
        perlRuntime.loadLibrary(libraryPath, fileName);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PERL runtime context
        RuntimeContext perlRuntime = Javonet.inMemory().perl();

        // set up variables.
        String libraryPath = resourcesDirectory ;
        String fileName = "PerlTestClass.pm";
        String className = "PerlTestClass::PerlTestClass";

        // load custom PERL library
        perlRuntime.loadLibrary(libraryPath, fileName);

        // get type from runtime
        InvocationContext perlType = perlRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = perlType.invokeStaticMethod("multiply_by_two", 25).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PERL runtime context
        RuntimeContext perlRuntime = Javonet.inMemory().perl();

        // set up variables.
        String libraryPath = resourcesDirectory ;
        String fileName = "PerlTestClass.pm";
        String className = "PerlTestClass::PerlTestClass";

        // load custom PERL library
        perlRuntime.loadLibrary(libraryPath, fileName);

        // get type from runtime
        InvocationContext perlType = perlRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = perlType.getStaticField("static_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PERL runtime context
        RuntimeContext perlRuntime = Javonet.inMemory().perl();

        // set up variables.
        String libraryPath = resourcesDirectory ;
        String fileName = "PerlTestClass.pm";
        String className = "PerlTestClass::PerlTestClass";

        // load custom PERL library
        perlRuntime.loadLibrary(libraryPath, fileName);

        // get type from runtime
        InvocationContext perlType = perlRuntime.getType(className).execute();

        // set static field's value
        perlType.setStaticField("static_value", 75).execute();

        // get type's static field
        InvocationContext response = perlType.getStaticField("static_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetStaticField>
        Assertions.assertEquals(75, result);
        perlType.setStaticField("static_value", 3).execute();
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PERL runtime context
        RuntimeContext perlRuntime = Javonet.inMemory().perl();

        // set up variables.
        String libraryPath = resourcesDirectory ;
        String fileName = "PerlTestClass.pm";
        String className = "PerlTestClass::PerlTestClass";

        // load custom PERL library
        perlRuntime.loadLibrary(libraryPath, fileName);

        // create type's instance
        InvocationContext instance = Javonet.inMemory().perl().getType(className).createInstance().execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeInstanceMethod>
        Assertions.assertEquals(36, ((String) instance.getValue()).length());
        Assertions.assertEquals(20, result);
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_GetInstanceField_PublicValue_1() {
        // <TestResources_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PERL runtime context
        RuntimeContext perlRuntime = Javonet.inMemory().perl();

        // set up variables.
        String libraryPath = resourcesDirectory ;
        String fileName = "PerlTestClass.pm";
        String className = "PerlTestClass::PerlTestClass";

        // load custom PERL library
        perlRuntime.loadLibrary(libraryPath, fileName);

        // create type's instance
        InvocationContext instance = Javonet.inMemory().perl().getType(className).createInstance().execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("public_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(36, ((String) instance.getValue()).length());
        Assertions.assertEquals(1, result);
    }
}
