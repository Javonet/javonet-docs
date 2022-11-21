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

    private final String javonetSrcRoot = Paths.get("").toAbsolutePath().getParent().getParent().toString();

    // <TestResources_TestClassValues>
    private final String libraryPath = javonetSrcRoot + "/testResources/perl";
    private final String fileName = "PerlTestClass.pm";
    private final String className = "PerlTestClass::PerlTestClass";
    // </TestResources_TestClassValues>

    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName);
        InvocationContext call = Javonet.inMemory().perl().getType(className).invokeStaticMethod("multiply_by_two", 25).execute();
        int result = (int) call.getValue();
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        Javonet.inMemory().perl().loadLibrary(libraryPath);
        InvocationContext call = Javonet.inMemory().perl().getType(className).getStaticField("static_value").execute();
        int result = (int) call.getValue();
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName);
        Javonet.inMemory().perl().getType(className).setStaticField("static_value", 75).execute();
        // </TestResources_SetStaticField>
        InvocationContext call = Javonet.inMemory().perl().getType(className).getStaticField("static_value").execute();
        int result = (int) call.getValue();
        Assertions.assertEquals(75, result);
        Javonet.inMemory().perl().getType(className).setStaticField("static_value", 3).execute();
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName);
        InvocationContext instance = Javonet.inMemory().perl().getType(className).createInstance().execute();
        InvocationContext call = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute();
        int result = (int) call.getValue();
        // </TestResources_InvokeInstanceMethod>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(20, result);
    }

    @Test
    @Tag("integration")
    public void Test_Perl_TestResources_GetInstanceField_PublicValue_1() {
        // <TestResources_GetInstanceField>
        Javonet.inMemory().perl().loadLibrary(libraryPath, fileName);
        InvocationContext instance = Javonet.inMemory().perl().getType(className).createInstance().execute();
        InvocationContext call = instance.getInstanceField("public_value").execute();
        int result = (int) call.getValue();
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(1, result);
    }

}
