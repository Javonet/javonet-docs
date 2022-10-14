import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.EnabledOnOs;
import org.junit.jupiter.api.condition.OS;
import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.java.Javonet;

import java.nio.file.Paths;

public class JvmToClrIntegrationTest {

    private final String _javonetSrcRoot = Paths.get("").toAbsolutePath().getParent().getParent().toString();

    // <TestResources_TestClassValues>
    private final String libraryPath = _javonetSrcRoot + "/testResources/clr/ClrTestClass.dll";
    private final String className = "ClrTestClass.ClrTestClass";
    // </TestResources_TestClassValues>

    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
    }
    
    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_StandardLibrary_InvokeStaticMethod_SystemMath_Abs_minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        InvocationContext call = Javonet.inMemory().clr().getType("System.Math").invokeStaticMethod("Abs", -50).execute();
        int result = (int)call.getValue();
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_StandardLibrary_GetStaticField_SystemMath_PI_PI() {
        // <StandardLibrary_GetStaticField>
        InvocationContext call = Javonet.inMemory().clr().getType("System.Math").getStaticField("PI").execute();
        double result = (double)call.getValue();
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022() {
        // <StandardLibrary_InvokeInstanceMethod>
        InvocationContext instance = Javonet.inMemory().clr().getType("System.DateTime").
                createInstance(2022,9,1).execute();
        InvocationContext call = instance.invokeInstanceMethod("ToShortDateString").execute();
        String result = (String)call.getValue();
        // </StandardLibrary_InvokeInstanceMethod>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertTrue(result.contains("2022"));
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022() {
        // <StandardLibrary_GetInstanceField>
        InvocationContext instance = Javonet.inMemory().clr().getType("System.DateTime").
                createInstance(2022,9,1).execute();
        InvocationContext call = instance.getInstanceField("Year").execute();
        int result = (int)call.getValue();
        // </StandardLibrary_GetInstanceField>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(2022, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().clr().loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        Javonet.inMemory().clr().loadLibrary(libraryPath);
        InvocationContext call = Javonet.inMemory().clr().getType(className).invokeStaticMethod("MultiplyByTwo", 25).execute();
        int result = (int) call.getValue();
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        Javonet.inMemory().clr().loadLibrary(libraryPath);
        InvocationContext call = Javonet.inMemory().clr().getType(className).getStaticField("StaticValue").execute();
        int result = (int) call.getValue();
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        Javonet.inMemory().clr().loadLibrary(libraryPath);
        Javonet.inMemory().clr().getType(className).setStaticField("StaticValue", 75).execute();
        // </TestResources_SetStaticField>
        InvocationContext call = Javonet.inMemory().clr().getType(className).getStaticField("StaticValue").execute();
        int result = (int) call.getValue();
        Assertions.assertEquals(75, result);
        Javonet.inMemory().clr().getType(className).setStaticField("StaticValue", 3).execute();
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        Javonet.inMemory().clr().loadLibrary(libraryPath);
        InvocationContext instance = Javonet.inMemory().clr().getType(className).createInstance(2,3).execute();
        InvocationContext call = instance.invokeInstanceMethod("MultiplyTwoNumbers", 5, 4).execute();
        int result = (int) call.getValue();
        // </TestResources_InvokeInstanceMethod>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(20, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_TestResources_GetInstanceField_PublicValue_1() {
        // <TestResources_GetInstanceField>
        Javonet.inMemory().clr().loadLibrary(libraryPath);
        InvocationContext instance = Javonet.inMemory().clr().getType(className).createInstance(1,2).execute();
        InvocationContext call = instance.getInstanceField("PublicValue").execute();
        int result = (int) call.getValue();
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(1, result);
    }
}
