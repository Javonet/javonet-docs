import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.internal.RuntimeContext;
import com.javonet.sdk.java.Javonet;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.nio.file.Paths;

public class JvmToPythonIntegrationTest {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/python-package";

    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
    }

    @Test
    @Tag("integration")
    public void Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PYTHON runtime context
        RuntimeContext pythonRuntime = Javonet.inMemory().python();

        // get type from runtime
        InvocationContext pythonType = pythonRuntime.getType("builtins").execute();

        // invoke type's static method
        InvocationContext response = pythonType.invokeStaticMethod("abs", -50).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PYTHON runtime context
        RuntimeContext pythonRuntime = Javonet.inMemory().python();

        // get type from runtime
        InvocationContext pythonType = pythonRuntime.getType("math").execute();

        // get type's static field
        InvocationContext response = pythonType.getStaticField("pi").execute();

        // get result from response
        float result = (float) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result, 0.00001);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PYTHON runtime context
        RuntimeContext pythonRuntime = Javonet.inMemory().python();

        // set up variables.
        // path to directory with .py files
        String libraryPath = resourcesDirectory;

        // load custom PYTHON library
        pythonRuntime.loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PYTHON runtime context
        RuntimeContext pythonRuntime = Javonet.inMemory().python();

        // set up variables.
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "PythonTestClass.PythonTestClass";

        // load custom PYTHON library
        pythonRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext pythonType = pythonRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = pythonType.invokeStaticMethod("multiply_by_two", 25).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PYTHON runtime context
        RuntimeContext pythonRuntime = Javonet.inMemory().python();

        // set up variables.
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "PythonTestClass.PythonTestClass";

        // load custom PYTHON library
        pythonRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext pythonType = pythonRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = pythonType.getStaticField("static_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PYTHON runtime context
        RuntimeContext pythonRuntime = Javonet.inMemory().python();

        // set up variables.
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "PythonTestClass.PythonTestClass";

        // load custom PYTHON library
        pythonRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext pythonType = pythonRuntime.getType(className).execute();

        // set static field's value
        pythonType.setStaticField("static_value", 75).execute();

        // get type's static field
        InvocationContext response = pythonType.getStaticField("static_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetStaticField>
        Assertions.assertEquals(75, result);
        pythonType.setStaticField("static_value", 3).execute();
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PYTHON runtime context
        RuntimeContext pythonRuntime = Javonet.inMemory().python();

        // set up variables.
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "PythonTestClass.PythonTestClass";

        // load custom PYTHON library
        pythonRuntime.loadLibrary(libraryPath);

        // create type's instance
        InvocationContext instance = Javonet.inMemory().python().getType(className).createInstance(12, 13).execute();

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
    public void Test_Python_TestResources_GetInstanceField_PublicValue_1() {
        // <TestResources_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create PYTHON runtime context
        RuntimeContext pythonRuntime = Javonet.inMemory().python();

        // set up variables.
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "PythonTestClass.PythonTestClass";

        // load custom PYTHON library
        pythonRuntime.loadLibrary(libraryPath);

        // create type's instance
        InvocationContext instance = Javonet.inMemory().python().getType(className).createInstance(18, 19).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("public_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(36, ((String) instance.getValue()).length());
        Assertions.assertEquals(18, result);
    }
}
