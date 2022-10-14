import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.java.Javonet;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.nio.file.Paths;

public class JvmToPythonIntegrationTest {

    private final String _javonetSrcRoot = Paths.get("").toAbsolutePath().getParent().getParent().toString();

    // <TestResources_TestClassValues>
    private final String libraryPath = _javonetSrcRoot + "/testResources/python";
    private final String className = "PythonTestClass.PythonTestClass";
    // </TestResources_TestClassValues>

    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
    }

    @Test
    @Tag("integration")
    public void Test_Python_StandardLibrary_InvokeStaticMethod_Math_Abs_minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        InvocationContext call = Javonet.inMemory().python().getType("builtins").invokeStaticMethod("abs", -50).execute();
        int result = (int) call.getValue();
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_StandardLibrary_GetStaticField_Math_PI_PI() {
        // <StandardLibrary_GetStaticField>
        InvocationContext call = Javonet.inMemory().python().getType("math").getStaticField("pi").execute();
        float result = (float) call.getValue();
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result, 0.00001);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().python().loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        Javonet.inMemory().python().loadLibrary(libraryPath);
        InvocationContext call = Javonet.inMemory().python().getType(className).invokeStaticMethod("multiply_by_two", 25).execute();
        int result = (int) call.getValue();
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        Javonet.inMemory().python().loadLibrary(libraryPath);
        InvocationContext call = Javonet.inMemory().python().getType(className).getStaticField("static_value").execute();
        int result = (int) call.getValue();
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        Javonet.inMemory().python().loadLibrary(libraryPath);
        Javonet.inMemory().python().getType(className).setStaticField("static_value", 75).execute();
        // </TestResources_SetStaticField>
        InvocationContext call = Javonet.inMemory().python().getType(className).getStaticField("static_value").execute();
        int result = (int) call.getValue();
        Assertions.assertEquals(75, result);
        Javonet.inMemory().python().getType(className).setStaticField("static_value", 3).execute();
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        Javonet.inMemory().python().loadLibrary(libraryPath);
        InvocationContext instance = Javonet.inMemory().python().getType(className).createInstance(2,3).execute();
        InvocationContext call = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute();
        int result = (int) call.getValue();
        // </TestResources_InvokeInstanceMethod>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(20, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_GetInstanceField_PublicValue_1() {
        // <TestResources_GetInstanceField>
        Javonet.inMemory().python().loadLibrary(libraryPath);
        InvocationContext instance = Javonet.inMemory().python().getType(className).createInstance(1,2).execute();
        InvocationContext call = instance.getInstanceField("public_value").execute();
        int result = (int) call.getValue();
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(1, result);
    }
}
