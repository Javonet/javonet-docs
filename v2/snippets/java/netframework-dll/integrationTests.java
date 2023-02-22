import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.internal.RuntimeContext;
import com.javonet.sdk.java.Javonet;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.EnabledOnOs;
import org.junit.jupiter.api.condition.OS;

import java.nio.file.Paths;

public class JvmToClrIntegrationTest {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/netframework-dll";

    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create CLR runtime context
        RuntimeContext clrRuntime = Javonet.inMemory().clr();

        // get type from runtime
        InvocationContext clrType = clrRuntime.getType("System.Math").execute();

        // invoke type's static method
        InvocationContext response = clrType.invokeStaticMethod("Abs", -50).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create CLR runtime context
        RuntimeContext clrRuntime = Javonet.inMemory().clr();

        // get type from runtime
        InvocationContext clrType = clrRuntime.getType("System.Math").execute();

        // get type's static field
        InvocationContext response = clrType.getStaticField("PI").execute();

        // get result from response
        double result = (double) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022() {
        // <StandardLibrary_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create CLR runtime context
        RuntimeContext clrRuntime = Javonet.inMemory().clr();

        // get type from runtime
        InvocationContext clrType = clrRuntime.getType("System.DateTime").execute();

        // create type's instance
        InvocationContext instance = clrType.createInstance(2022, 9, 1).execute();

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
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022() {
        // <StandardLibrary_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create CLR runtime context
        RuntimeContext clrRuntime = Javonet.inMemory().clr();

        // get type from runtime
        InvocationContext clrType = clrRuntime.getType("System.DateTime").execute();

        // create type's instance
        InvocationContext instance = clrType.createInstance(2022, 9, 1).execute();

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
    public void Test_Clr_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create CLR runtime context
        RuntimeContext clrRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/ClrTestClass.dll";

        // load custom CLR library
        clrRuntime.loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create CLR runtime context
        RuntimeContext clrRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/ClrTestClass.dll";
        String className = "ClrTestClass.ClrTestClass";

        // load custom CLR library
        clrRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext clrType = clrRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = clrType.invokeStaticMethod("MultiplyByTwo", 25).execute();

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
    public void Test_Clr_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create CLR runtime context
        RuntimeContext clrRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/ClrTestClass.dll";
        String className = "ClrTestClass.ClrTestClass";

        // load custom CLR library
        clrRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext clrType = clrRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = clrType.getStaticField("StaticValue").execute();

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
    public void Test_Clr_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create CLR runtime context
        RuntimeContext clrRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/ClrTestClass.dll";
        String className = "ClrTestClass.ClrTestClass";

        // load custom CLR library
        clrRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext clrType = clrRuntime.getType(className).execute();

        // set static field's value
        clrType.setStaticField("StaticValue", 75).execute();

        // get type's static field
        InvocationContext response = clrType.getStaticField("StaticValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetStaticField>
        clrType.setStaticField("StaticValue", 3).execute();
        Assertions.assertEquals(75, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create CLR runtime context
        RuntimeContext clrRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/ClrTestClass.dll";
        String className = "ClrTestClass.ClrTestClass";

        // load custom CLR library
        clrRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext clrType = clrRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = clrType.createInstance(12, 13).execute();

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
    public void Test_Clr_TestResources_GetInstanceField_PublicValue_18() {
        // <TestResources_GetInstanceField>
        Javonet.activate("your-email", "your-license-key");

        // create CLR runtime context
        RuntimeContext clrRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/ClrTestClass.dll";
        String className = "ClrTestClass.ClrTestClass";

        // load custom CLR library
        clrRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext clrType = clrRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = clrType.createInstance(18, 19).execute();

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
}
