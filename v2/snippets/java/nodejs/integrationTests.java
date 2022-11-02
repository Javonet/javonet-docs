import com.javonet.sdk.internal.InvocationContext;
import org.junit.jupiter.api.Assertions;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import com.javonet.sdk.java.Javonet;

import java.nio.file.Paths;

public class JvmToNodejsIntegrationTest {

    private final String javonetSrcRoot = Paths.get("").toAbsolutePath().getParent().getParent().toString();

    // <TestResources_TestClassValues>
    private final String libraryPath = javonetSrcRoot + "/testResources/nodejs/NodejsTestClass.js";
    private final String className = "NodejsTestClass.js";
    // </TestResources_TestClassValues>
    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        InvocationContext call = Javonet.inMemory().nodejs().getType("Math").invokeStaticMethod("abs", -50).execute();
        int result = (int) call.getValue();
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        InvocationContext call = Javonet.inMemory().nodejs().getType("Math").getStaticField("PI").execute();
        double result = (double) call.getValue();
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result, 0.00001);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().nodejs().loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_InvokeStaticMethod_multiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        Javonet.inMemory().nodejs().loadLibrary(libraryPath);
        InvocationContext call = Javonet.inMemory().nodejs().getType(className).invokeStaticMethod("multiplyByTwo", 25).execute();
        int result = (int) call.getValue();
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_GetStaticField_staticValue_3() {
        // <TestResources_GetStaticField>
        Javonet.inMemory().nodejs().loadLibrary(libraryPath);
        InvocationContext call = Javonet.inMemory().nodejs().getType(className).getStaticField("staticValue").execute();
        int result = (int) call.getValue();
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_SetStaticField_staticValue_75() {
        // <TestResources_SetStaticField>
        Javonet.inMemory().nodejs().loadLibrary(libraryPath);
        Javonet.inMemory().nodejs().getType(className).setStaticField("staticValue", 75).execute();
        // </TestResources_SetStaticField>
        InvocationContext call = Javonet.inMemory().nodejs().getType(className).getStaticField("staticValue").execute();
        int result = (int) call.getValue();
        Assertions.assertEquals(75, result);
        Javonet.inMemory().nodejs().getType(className).setStaticField("staticValue", 3).execute();
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        Javonet.inMemory().nodejs().loadLibrary(libraryPath);
        InvocationContext instance = Javonet.inMemory().nodejs().getType(className).createInstance(2,3).execute();
        InvocationContext call = instance.invokeInstanceMethod("multiplyTwoNumbers", 5, 4).execute();
        int result = (int) call.getValue();
        // </TestResources_InvokeInstanceMethod>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(20, result);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_GetInstanceField_PublicValue_1() {
        // <TestResources_GetInstanceField>
        Javonet.inMemory().nodejs().loadLibrary(libraryPath);
        InvocationContext instance = Javonet.inMemory().nodejs().getType(className).createInstance(1,2).execute();
        InvocationContext call = instance.getInstanceField("publicValue").execute();
        int result = (int) call.getValue();
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(1, result);
    }
}
