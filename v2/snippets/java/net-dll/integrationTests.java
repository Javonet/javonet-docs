import com.javonet.core.generator.handler.GeneratorHandler;
import com.javonet.sdk.core.JvmCommand;
import com.javonet.sdk.core.JvmCommandType;
import com.javonet.sdk.core.RuntimeLib;
import com.javonet.sdk.core.Type;
import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.internal.RuntimeContext;
import com.javonet.sdk.java.Javonet;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.condition.EnabledOnOs;
import org.junit.jupiter.api.condition.OS;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Paths;
import java.util.ArrayList;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class JvmToNetcoreIntegrationTest {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/net-dll";

    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
    }

    @Test
    @Tag("integration")
    public void Test_Netcore_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // get type from runtime
        InvocationContext netcoreType = netcoreRuntime.getType("System.Math").execute();

        // invoke type's static method
        InvocationContext response = netcoreType.invokeStaticMethod("Abs", -50).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Netcore_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // get type from runtime
        InvocationContext netcoreType = netcoreRuntime.getType("System.Math").execute();

        // get type's static field
        InvocationContext response = netcoreType.getStaticField("PI").execute();

        // get result from response
        double result = (double) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result);
    }

    @Test
    @Tag("integration")
    public void Test_Netcore_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022() {
        // <StandardLibrary_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // get type from runtime
        InvocationContext netcoreType = netcoreRuntime.getType("System.DateTime").execute();

        // create type's instance
        InvocationContext instance = netcoreType.createInstance(2022, 9, 1).execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("ToShortDateString").execute();

        // get result from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeInstanceMethod>
        Assertions.assertEquals(36, ((String) instance.getValue()).length());
        Assertions.assertTrue(result.contains("2022"));
    }

    @Test
    @Tag("integration")
    public void Test_Netcore_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022() {
        // <StandardLibrary_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // get type from runtime
        InvocationContext netcoreType = netcoreRuntime.getType("System.DateTime").execute();

        // create type's instance
        InvocationContext instance = netcoreType.createInstance(2022, 9, 1).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("Year").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetInstanceField>
        Assertions.assertEquals(36, ((String) instance.getValue()).length());
        Assertions.assertEquals(2022, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Netcore_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";

        // load custom NETCORE library
        netcoreRuntime.loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Netcore_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom NETCORE library
        netcoreRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext netcoreType = netcoreRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = netcoreType.invokeStaticMethod("MultiplyByTwo", 25).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Netcore_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom NETCORE library
        netcoreRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext netcoreType = netcoreRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = netcoreType.getStaticField("StaticValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Netcore_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom NETCORE library
        netcoreRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext netcoreType = netcoreRuntime.getType(className).execute();

        // set static field's value
        netcoreType.setStaticField("StaticValue", 75).execute();

        // get type's static field
        InvocationContext response = netcoreType.getStaticField("StaticValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetStaticField>
        netcoreType.setStaticField("StaticValue", 3).execute();
        Assertions.assertEquals(75, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Netcore_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom NETCORE library
        netcoreRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext netcoreType = netcoreRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = netcoreType.createInstance(12, 13).execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("MultiplyTwoNumbers", 5, 4).execute();

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
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Netcore_TestResources_GetInstanceField_PublicValue_18() {
        // <TestResources_GetInstanceField>
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom NETCORE library
        netcoreRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext netcoreType = netcoreRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = netcoreType.createInstance(18, 19).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("PublicValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(36, ((String) instance.getValue()).length());
        Assertions.assertEquals(18, result);
    }

    @Test
    @Tag("integration")
    void Test_Netcore_StandardLibrary_System_DateTime_PassInstanceAsArgument() {
        InvocationContext ic1 = Javonet.inMemory().netcore().getType("System.DateTime").createInstance(2022, 5, 22, 21, 37, 38).execute();
        InvocationContext ic2 = Javonet.inMemory().netcore().getType("System.Globalization.CultureInfo").createInstance("fr-FR").execute();
        InvocationContext ic3 = Javonet.inMemory().netcore().getType("System.Globalization.CultureInfo").createInstance("en-US").execute();
        InvocationContext ic4 = Javonet.inMemory().netcore().getType("System.Globalization.CultureInfo").createInstance("pl-PL").execute();

        Object result2 = ic1.invokeInstanceMethod("ToString", "F", ic2).execute().getValue();
        Object result3 = ic1.invokeInstanceMethod("ToString", "F", ic3).execute().getValue();
        Object result4 = ic1.invokeInstanceMethod("ToString", "F", ic4).execute().getValue();
        Assertions.assertEquals("dimanche 22 mai 2022 21:37:38", result2);
        Assertions.assertEquals("Sunday, May 22, 2022 9:37:38 PM", result3);
        Assertions.assertEquals("niedziela, 22 maja 2022 21:37:38", result4);

    }

    @Test
    @Tag("integration")
    public void Test_Netcore_TestResources_ExchangeLibrary_ExchangeCalculator_GetExchangeRate() {
        // <TestResources_GetInstanceField>
        Javonet.activate("your-email", "your-license-key");

        // create NETCORE runtime context
        RuntimeContext netcoreRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/ExchangeLibrary.dll";
        String className = "ExchangeLibrary.ExchangeCalculator";

        // load custom NETCORE library
        netcoreRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext netcoreType = netcoreRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = netcoreType.createInstance().execute();

        // invoke instance's methods
        InvocationContext response1 = instance.invokeInstanceMethod("GetExchangeRate", "PLNEUR").execute();
        InvocationContext response2 = instance.invokeInstanceMethod("GetExchangeRate", "PLNUSD").execute();

        Float PLNEUR = (Float) response1.getValue();
        Float PLNUSD = (Float) response2.getValue();

        Assertions.assertEquals(4.6f, PLNEUR);
        Assertions.assertEquals(4.0f, PLNUSD);
    }
}
