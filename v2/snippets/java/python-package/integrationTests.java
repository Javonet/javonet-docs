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
        int result = Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
        Assertions.assertEquals(0, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;

        // load custom library
        calledRuntime.loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = calledRuntimeType.getStaticField("static_value").execute();

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

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // set static field's value
        calledRuntimeType.setStaticField("static_value", 75).execute();

        // get type's static field
        InvocationContext response = calledRuntimeType.getStaticField("static_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetStaticField>
        Assertions.assertEquals(75, result);
        calledRuntimeType.setStaticField("static_value", 3).execute();
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_GetInstanceField_PublicValue_18() {
        // <TestResources_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // create type's instance
        InvocationContext instance = Javonet.inMemory().python().getType(className).createInstance(18, 19).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("public_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(18, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = calledRuntimeType.invokeStaticMethod("multiply_by_two", 25).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // create type's instance
        InvocationContext instance = Javonet.inMemory().python().getType(className).createInstance(0, 1).execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("multiply_two_numbers", 5, 4).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeInstanceMethod>
        Assertions.assertEquals(20, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_1DArray_GetIndex_2_StringThree() {
        // <TestResources_1DArray_GetIndex>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get_1d_array").execute();

        // get index from array
        InvocationContext response = array.getIndex(2).execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_1DArray_GetIndex>
        Assertions.assertEquals("three", result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_1DArray_GetSize_5() {
        // <TestResources_1DArray_GetSize>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get_1d_array").execute();

        // get array's size
        InvocationContext response = array.getSize().execute();

        // get value from response
        Integer result = (Integer) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_1DArray_GetSize>
        Assertions.assertEquals(5, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_1DArray_SetIndex_StringSeven() {
        // <TestResources_1DArray_SetIndex>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get_1d_array").execute();

        // set array's index
        array.setIndex("seven", 4).execute();

        // get index from array
        InvocationContext response = array.getIndex(4).execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_1DArray_SetIndex>
        array.setIndex("five", 4).execute();
        Assertions.assertEquals("seven", result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_1DArray_Iterate() {
        // <TestResources_1DArray_Iterate>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get_1d_array").execute();

        // get array's size
        int arraySize = (int) array.getSize().execute().getValue();

        // create local array and store elements in it
        String[] arrayValues = new String[arraySize];
        int i = 0;
        for (InvocationContext element : array) {
            arrayValues[i] = (String) element.invokeInstanceMethod("upper").execute().getValue();
            i++;
        }

        // write result to console
        System.out.println(String.join("\t", arrayValues));
        // </TestResources_1DArray_Iterate>
        Assertions.assertArrayEquals(new String[]{"ONE", "TWO", "THREE", "FOUR", "FIVE"}, arrayValues);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_1DArray_PassArrayAsArgument() {
        // <TestResources_1DArray_PassArrayAsArgument>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("add_array_elements_and_multiply", new Double[]{12.22, 98.22, -10.44}, 9.99).execute();

        // get value from response
        float result = (float) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_1DArray_PassArrayAsArgument>
        Assertions.assertEquals(999.0, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_TestResources_1DArray_RetrieveArray() {
        // <TestResources_1DArray_RetrieveArray>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();

        // invoke instance's method
        InvocationContext arrayReference = instance.invokeInstanceMethod("get_1d_array").execute();

        // get value from array reference
        Object[] response = arrayReference.retrieveArray();

        // write to string array
        String[] result = java.util.Arrays.copyOf(response, response.length, String[].class);

        // write result to console
        System.out.println(String.join("\t", result));
        // </TestResources_1DArray_RetrieveArray>
        Assertions.assertArrayEquals(new String[]{"one", "two", "three", "four", "five"}, result);
    }

    @Test
    @Tag("integration")
    public void Test_Python_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("math").execute();

        // get type's static field
        InvocationContext response = calledRuntimeType.getStaticField("pi").execute();

        // get result from response
        float result = (float) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result, 0.00001);
    }

    @Test
    @Tag("integration")
    public void Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("builtins").execute();

        // invoke type's static method
        InvocationContext response = calledRuntimeType.invokeStaticMethod("abs", -50).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }
}
