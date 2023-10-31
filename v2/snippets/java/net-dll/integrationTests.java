package netdll;

import com.javonet.core.generator.handler.GeneratorHandler;
import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.internal.RuntimeContext;
import com.javonet.sdk.java.Javonet;
import com.javonet.utils.Command;
import com.javonet.utils.CommandType;
import com.javonet.utils.RuntimeName;
import com.javonet.utils.Type;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.condition.DisabledOnOs;
import org.junit.jupiter.api.condition.OS;
import utils.ActivationCredentials;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Paths;
import java.util.ArrayList;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class integrationTests {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/net-dll";

    @BeforeAll
    public static void initialization() {
        int result = Javonet.activate(ActivationCredentials.yourLicenseKey);
        Assertions.assertEquals(0, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = calledRuntimeType.getStaticField("StaticValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // set static field's value
        calledRuntimeType.setStaticField("StaticValue", 75).execute();

        // get type's static field
        InvocationContext response = calledRuntimeType.getStaticField("StaticValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetStaticField>
        calledRuntimeType.setStaticField("StaticValue", 3).execute();
        Assertions.assertEquals(75, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_GetInstanceField_PublicValue_18() {
        // <TestResources_GetInstanceField>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(18, 19).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("PublicValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(18, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_SetInstanceField_PublicValue_44() {
        // <TestResources_SetInstanceField>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(18, 19).execute();

        // set instance's field
        instance.setInstanceField("PublicValue", 44).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("PublicValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetInstanceField>
        Assertions.assertEquals(44, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's method
        InvocationContext response = calledRuntimeType.invokeStaticMethod("MultiplyByTwo", 25).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("MultiplyTwoNumbers", 5, 4).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeInstanceMethod>
        Assertions.assertEquals(20, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_1DArray_GetIndex_2_StringThree() {
        // <TestResources_1DArray_GetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("Get1DArray").execute();

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
    public void Test_NetDll_TestResources_1DArray_GetSize_5() {
        // <TestResources_1DArray_GetSize>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("Get1DArray").execute();

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
    public void Test_NetDll_TestResources_1DArray_SetIndex_StringSeven() {
        // <TestResources_1DArray_SetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("Get1DArray").execute();

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
    public void Test_NetDll_TestResources_1DArray_Iterate() {
        // <TestResources_1DArray_Iterate>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("Get1DArray").execute();

        // get array's size
        int arraySize = (int) array.getSize().execute().getValue();

        // create local array and store elements in it
        String[] arrayValues = new String[arraySize];
        int i = 0;
        for (InvocationContext element : array) {
            arrayValues[i] = (String) element.invokeInstanceMethod("ToUpper").execute().getValue();
            i++;
        }

        // write result to console
        System.out.println(String.join("\t", arrayValues));
        // </TestResources_1DArray_Iterate>
        Assertions.assertArrayEquals(new String[]{"ONE", "TWO", "THREE", "FOUR", "FIVE"}, arrayValues);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_1DArray_PassArrayAsArgument() {
        // <TestResources_1DArray_PassArrayAsArgument>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("AddArrayElementsAndMultiply", new Double[]{12.22, 98.22, -10.44}, 9.99).execute();

        // get value from response
        double result = (double) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_1DArray_PassArrayAsArgument>
        Assertions.assertEquals(999.0, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_1DArray_RetrieveArray() {
        // <TestResources_1DArray_RetrieveArray>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext arrayReference = instance.invokeInstanceMethod("Get1DArray").execute();

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
    public void Test_NetDll_TestResources_Cast_ToUInt() {
        // <TestResources_Cast_ToUInt>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        //get type for casting
        InvocationContext targetType = calledRuntime.getType("System.UInt32");

        // invoke type's method
        InvocationContext response = calledRuntimeType.
                invokeStaticMethod("CastSampleMethod", calledRuntime.cast(targetType, 5.2)).
                execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_Cast_ToUInt>
        Assertions.assertEquals("CastSampleMethod with System.UInt32 called", result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_Cast_ToFloat() {
        // <TestResources_Cast_ToFloat>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        //get type for casting
        InvocationContext targetType = calledRuntime.getType("System.Single");

        // invoke type's method
        InvocationContext response = calledRuntimeType.
                invokeStaticMethod("CastSampleMethod", calledRuntime.cast(targetType, 5)).
                execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_Cast_ToFloat>
        Assertions.assertEquals("CastSampleMethod with System.Single called", result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException() {
        // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method which throws exception
        try {
            calledRuntimeType.invokeStaticMethod("DivideBy", 10, 0).execute();
        } catch (Exception ex) {
            // write exception message to console
            ex.printStackTrace();
            return;
        }
        // </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        Assertions.fail();
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_GenericStaticMethod() {
        // <TestResources_GenericStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        //get type for generic method
        InvocationContext targetType = calledRuntime.getType("System.Int32");

        // invoke type's method
        InvocationContext response = calledRuntimeType.
                invokeGenericStaticMethod("GenericSampleStaticMethod", targetType, 7, 5).
                execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GenericStaticMethod>
        Assertions.assertEquals("7 and 5", result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_GenericMethod() {
        // <TestResources_GenericMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        //get type for generic method
        InvocationContext targetType = calledRuntime.getType("System.Int32");

        // invoke type's method
        InvocationContext response = instance.
                invokeGenericMethod("GenericSampleMethod", targetType, 7, 5).
                execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GenericMethod>
        Assertions.assertEquals("7 or 5", result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_GenericMethodWithTwoTypes() {
        // <TestResources_GenericMethodWithTwoTypes>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        //get type for generic method
        InvocationContext targetType1 = calledRuntime.getType("System.String");
        InvocationContext targetType2 = calledRuntime.getType("System.Int32");

        // invoke type's method
        InvocationContext response = instance.
                invokeGenericMethod("GenericSampleMethodWithTwoTypes",
                        new InvocationContext[]{targetType1, targetType2}, "test").
                execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GenericMethodWithTwoTypes>
        Assertions.assertEquals(0, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_TestResources_ExchangeLibrary_ExchangeCalculator_GetExchangeRate() {
        // <TestResources_GetInstanceField>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // set up variables
        String libraryPath = resourcesDirectory + "/ExchangeLibrary.dll";
        String className = "ExchangeLibrary.ExchangeCalculator";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's methods
        InvocationContext response1 = instance.invokeInstanceMethod("GetExchangeRate", "PLNEUR").execute();
        InvocationContext response2 = instance.invokeInstanceMethod("GetExchangeRate", "PLNUSD").execute();

        Float PLNEUR = (Float) response1.getValue();
        Float PLNUSD = (Float) response2.getValue();

        Assertions.assertEquals(4.6f, PLNEUR);
        Assertions.assertEquals(4.0f, PLNUSD);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("System.Math").execute();

        // invoke type's method
        InvocationContext response = calledRuntimeType.getStaticField("PI").execute();

        // get result from response
        double result = (double) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022() {
        // <StandardLibrary_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("System.DateTime").execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(2022, 9, 1).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("Year").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetInstanceField>
        Assertions.assertEquals(2022, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("System.Math").execute();

        // invoke type's static method
        InvocationContext response = calledRuntimeType.invokeStaticMethod("Abs", -50).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022() {
        // <StandardLibrary_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().netcore();

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("System.DateTime").execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(2022, 9, 1).execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("ToShortDateString").execute();

        // get result from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeInstanceMethod>
        Assertions.assertTrue(result.contains("2022"));
    }

    @Test
    @Tag("integration")
    void Test_NetDll_StandardLibrary_System_DateTime_PassInstanceAsArgument() {
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
    @DisabledOnOs(OS.MAC)
    public void Test_NetDll_StandardLibrary_OptimizeRoute_SystemMathAbs() {

        InvocationContext ic = Javonet.inMemory().netcore().getType("System.Math").invokeStaticMethod("Abs", -50);
        ic.execute(true);

        int numberOfCalls = (int) 1e0;
        int i;
        long time;
        time = System.nanoTime();
        for (i = 0; i < numberOfCalls; i++) {
            Javonet.inMemory().netcore().getType("System.Math").invokeStaticMethod("Abs", -i).execute(true).getValue();
        }
        time = System.nanoTime() - time;
        System.out.println("Optimized route time with whole command [ns]: " + time);
        long optimizedMethodTime = time;

        time = System.nanoTime();
        for (i = 0; i < numberOfCalls; i++) {
            ic.execute(true).getValue();
        }
        time = System.nanoTime() - time;
        System.out.println("Optimized route time just with execute on InvocationContext [ns]: " + time);
        long optimizedMethodTimeWithIC = time;

        time = System.nanoTime();
        for (i = 0; i < numberOfCalls; i++) {
            Javonet.inMemory().netcore().getType("System.Math").invokeStaticMethod("Abs", -i).execute().getValue();
        }
        time = System.nanoTime() - time;
        System.out.println("Normal route time [ns]: " + time);
        long normalMethodTime = time;

        System.out.println("normalMethodTime / optimizedMethodTime = " + normalMethodTime / optimizedMethodTime);
        System.out.println("normalMethodTime / optimizedMethodTimeWithIC = " + normalMethodTime / optimizedMethodTimeWithIC);
    }

    @Test
    @Tag("integration")
    @DisabledOnOs(OS.MAC)
    void Test_NetDll_StandardLibrary_CodeGenerationForClass_SystemMath() throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        String className = "System.Math";
        int initialValue = -232;
        int expectedValue = Math.abs(initialValue);
        Command structuredCommandForClass = new Command(RuntimeName.Netcore, CommandType.GENERATE_LIB, new Object[]{new Command(RuntimeName.Netcore, CommandType.GET_TYPE, new Object[]{className, "public", new Command(RuntimeName.Netcore, CommandType.INVOKE_STATIC_METHOD, new Object[]{"Abs", Type.INTEGER, "public", className, new Object[]{Type.INTEGER,}, new Object[]{"ref",}})})});
        GeneratorHandler generatorHandler = new GeneratorHandler();
        ArrayList<File> generatedClassFiles = generatorHandler.generate(structuredCommandForClass, System.getProperty("user.dir"));
        generatorHandler.compileClass(generatedClassFiles.get(0));
        Class<?> clazz = GeneratorHandler.getClass(className, new File(System.getProperty("user.dir")));
        Assertions.assertEquals(className, clazz.getName());
        Assertions.assertEquals(expectedValue, clazz.getMethod("abs", int.class).invoke(null, initialValue));
    }
}
