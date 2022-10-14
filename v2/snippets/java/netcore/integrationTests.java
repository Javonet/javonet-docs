import com.javonet.core.generator.handler.GeneratorHandler;
import com.javonet.sdk.core.JvmCommand;
import com.javonet.sdk.core.JvmCommandType;
import com.javonet.sdk.core.RuntimeLib;
import com.javonet.sdk.core.Type;
import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.java.Javonet;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.condition.DisabledOnOs;
import org.junit.jupiter.api.condition.OS;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Paths;
import java.util.ArrayList;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class JvmToNetcoreIntegrationTest {

    private final String _javonetSrcRoot = Paths.get("").toAbsolutePath().getParent().getParent().toString();

    // <TestResources_TestClassValues>
    private final String libraryPath = _javonetSrcRoot + "/testResources/netcore/NetcoreTestClass.dll";
    private final String className = "NetcoreTestClass.NetcoreTestClass";
    // </TestResources_TestClassValues>

    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
    }

    @Test
    @Tag("integration")
    @DisabledOnOs({ OS.LINUX, OS.OTHER, OS.MAC })
    public void Test_Netcore_StandardLibrary_InvokeStaticMethod_SystemMath_Abs_minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        InvocationContext call = Javonet.inMemory().netcore().getType("System.Math").invokeStaticMethod("Abs", -50).execute();
        int result = (int)call.getValue();
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    @DisabledOnOs({ OS.LINUX, OS.OTHER, OS.MAC })
    public void Test_Netcore_StandardLibrary_GetStaticField_SystemMath_PI_PI() {
        // <StandardLibrary_GetStaticField>
        InvocationContext call = Javonet.inMemory().netcore().getType("System.Math").getStaticField("PI").execute();
        double result = (double)call.getValue();
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result);
    }

    @Test
    @Tag("integration")
    @DisabledOnOs({ OS.LINUX, OS.OTHER, OS.MAC })
    public void Test_Netcore_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022() {
        // <StandardLibrary_InvokeInstanceMethod>
        InvocationContext instance = Javonet.inMemory().netcore().getType("System.DateTime").
                createInstance(2022,9,1).execute();
        InvocationContext call = instance.invokeInstanceMethod("ToShortDateString").execute();
        String result = (String)call.getValue();
        // </StandardLibrary_InvokeInstanceMethod>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertTrue(result.contains("2022"));
    }

    @Test
    @Tag("integration")
    @DisabledOnOs({ OS.LINUX, OS.OTHER, OS.MAC })
    public void Test_Netcore_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022() {
        // <StandardLibrary_GetInstanceField>
        InvocationContext instance = Javonet.inMemory().netcore().getType("System.DateTime").
                createInstance(2022,9,1).execute();
        InvocationContext call = instance.getInstanceField("Year").execute();
        int result = (int)call.getValue();
        // </StandardLibrary_GetInstanceField>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());

        Assertions.assertEquals(2022, result);
    }

    @Test
    @Tag("integration")
    public void Test_Netcore_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        Javonet.inMemory().netcore().loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_Netcore_TestResources_InvokeStaticMethod_multiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        Javonet.inMemory().netcore().loadLibrary(libraryPath);
        InvocationContext call = Javonet.inMemory().netcore().getType(className).invokeStaticMethod("MultiplyByTwo", 25).execute();
        int result = (int) call.getValue();
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Netcore_TestResources_GetStaticField_staticValue_3() {
        // <TestResources_GetStaticField>
        Javonet.inMemory().netcore().loadLibrary(libraryPath);
        InvocationContext call = Javonet.inMemory().netcore().getType(className).getStaticField("StaticValue").execute();
        int result = (int) call.getValue();
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_Netcore_TestResources_SetStaticField_staticValue_75() {
        // <TestResources_SetStaticField>
        Javonet.inMemory().netcore().loadLibrary(libraryPath);
        Javonet.inMemory().netcore().getType(className).setStaticField("StaticValue", 75).execute();
        // </TestResources_SetStaticField>
        InvocationContext call = Javonet.inMemory().netcore().getType(className).getStaticField("StaticValue").execute();
        int result = (int) call.getValue();
        Assertions.assertEquals(75, result);
        Javonet.inMemory().netcore().getType(className).setStaticField("StaticValue", 3).execute();
    }

    @Test
    @Tag("integration")
    public void Test_Netcore_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        Javonet.inMemory().netcore().loadLibrary(libraryPath);
        InvocationContext instance = Javonet.inMemory().netcore().getType(className).createInstance(2,3).execute();
        InvocationContext call = instance.invokeInstanceMethod("MultiplyTwoNumbers", 5, 4).execute();
        int result = (int) call.getValue();
        // </TestResources_InvokeInstanceMethod>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(20, result);
    }

    @Test
    @Tag("integration")
    public void Test_Netcore_TestResources_GetInstanceField_PublicValue_1() {
        // <TestResources_GetInstanceField>
        Javonet.inMemory().netcore().loadLibrary(libraryPath);
        InvocationContext instance = Javonet.inMemory().netcore().getType(className).createInstance(1,2).execute();
        InvocationContext call = instance.getInstanceField("PublicValue").execute();
        int result = (int) call.getValue();
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(36, ((String)instance.getValue()).length());
        Assertions.assertEquals(1, result);
    }
}
