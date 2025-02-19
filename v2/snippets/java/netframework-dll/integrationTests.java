package netframeworkdll;

import com.javonet.sdk.*;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import utils.ActivationCredentials;

public class integrationTests {

    private final String resourcesDirectory = java.nio.file.Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/netframework-dll";

    @BeforeAll
    public static void initialization() {
        int result = Javonet.activate(ActivationCredentials.yourLicenseKey);
        Assertions.assertEquals(0, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_StandardLibrary_CreateRuntimeContext() {
        // <StandardLibrary_CreateRuntimeContext>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // use calledRuntime to interact with code from other technology
        // </StandardLibrary_CreateRuntimeContext>
        Assertions.assertNotNull(calledRuntime);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_StandardLibrary_CreateInvocationContext() {
        // <StandardLibrary_CreateInvocationContext>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // construct an invocation context - this invocationContext in non-materialized
        InvocationContext invocationContext = calledRuntime.getType("System.Math").invokeStaticMethod("Abs", -50);

        // execute invocation context - this will materialize the invocationContext
        InvocationContext response = invocationContext.execute();
        // </StandardLibrary_CreateInvocationContext>
        Assertions.assertNotNull(response);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_StandardLibrary_GetValue() {
        // <StandardLibrary_GetValue>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // construct an invocation context - this invocationContext in non-materialized
        InvocationContext invocationContext = calledRuntime.getType("System.Math").invokeStaticMethod("Abs", -50);

        // execute invocation context - this will materialize the invocationContext
        InvocationContext response = invocationContext.execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetValue>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("System.Math").execute();

        // get type's static field
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
    public void Test_NetframeworkDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022() {
        // <StandardLibrary_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022() {
        // <StandardLibrary_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_GetInstanceField_PublicValue_18() {
        // <TestResources_GetInstanceField>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_SetInstanceField_PublicValue_44() {
        // <TestResources_SetInstanceField>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(12, 13).execute();

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
    public void Test_NetframeworkDll_TestResources_1DArray_GetIndex_2_StringThree() {
        // <TestResources_1DArray_GetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_1DArray_GetSize_5() {
        // <TestResources_1DArray_GetSize>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_1DArray_SetIndex_StringSeven() {
        // <TestResources_1DArray_SetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
        array.setIndex(4, "seven").execute();

        // get index from array
        InvocationContext response = array.getIndex(4).execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_1DArray_SetIndex>
        array.setIndex(4, "five").execute();
        Assertions.assertEquals("seven", result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_1DArray_Iterate() {
        // <TestResources_1DArray_Iterate>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_1DArray_PassArrayAsArgument() {
        // <TestResources_1DArray_PassArrayAsArgument>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_1DArray_RetrieveArray() {
        // <TestResources_1DArray_RetrieveArray>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_Cast_ToUInt() {
        // <TestResources_Cast_ToUInt>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_Cast_ToFloat() {
        // <TestResources_Cast_ToFloat>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException() {
        // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_GenericStaticMethod() {
        // <TestResources_GenericStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_GenericMethod() {
        // <TestResources_GenericMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_GenericMethodWithTwoTypes() {
        // <TestResources_GenericMethodWithTwoTypes>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
    public void Test_NetframeworkDll_TestResources_EnumAddToList() {
        // <TestResources_EnumAddToList>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get enum
        InvocationContext enumType = calledRuntime.getType("TestClass.TestClass+Fruit");

        // create enum's items
        InvocationContext apple = calledRuntime.getEnumItem(enumType, "Apple");
        InvocationContext mango = calledRuntime.getEnumItem(enumType, "Mango");

        // create fruits arrays
        InvocationContext[] fruits1ToAdd = new InvocationContext[]{apple, mango};

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's method
        InvocationContext response = calledRuntimeType.invokeStaticMethod("AddFruitsToList", (Object) fruits1ToAdd).execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_EnumAddToList>
        Assertions.assertEquals("2 fruits on the list", result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_EnumNameAndValue() {
        // <TestResources_EnumNameAndValue>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get enum
        InvocationContext enumType = calledRuntime.getType("TestClass.TestClass+Fruit");

        // create enum's items
        InvocationContext fruit1 = calledRuntime.getEnumItem(enumType, "Mango");
        InvocationContext fruit2 = calledRuntime.getEnumItem(enumType, "Orange");

        //get items' names and values
        String fruit1Name = (String) fruit1.getEnumName().execute().getValue();
        String fruit2Name = (String) fruit2.getEnumName().execute().getValue();
        Integer fruit1Value = (Integer) fruit1.getEnumValue().execute().getValue();
        Integer fruit2Value = (Integer) fruit2.getEnumValue().execute().getValue();

        // write result to console
        System.out.println(fruit1Name + ": " + fruit1Value + ", " + fruit2Name + ": " + fruit2Value);
        // </TestResources_EnumNameAndValue>
        Assertions.assertEquals("Mango", fruit1Name);
        Assertions.assertEquals("Orange", fruit2Name);
        Assertions.assertEquals(3, fruit1Value);
        Assertions.assertEquals(2, fruit2Value);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_2DArray_GetIndex() {
        // <TestResources_2DArray_GetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
        InvocationContext array = instance.invokeInstanceMethod("Get2DArray").execute();

        // two ways to get index from array
        InvocationContext response1 = array.getIndex(1, 1).execute();
        InvocationContext response2 = array.getIndex((Object) new Integer[]{0, 1}).execute();

        // get value from response
        String result1 = (String) response1.getValue();
        String result2 = (String) response2.getValue();

        // write result to console
        System.out.println(result1);
        System.out.println(result2);
        // </TestResources_2DArray_GetIndex>
        Assertions.assertEquals("S11", result1);
        Assertions.assertEquals("S01", result2);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_2DArray_GetSizeAndRank() {
        // <TestResources_2DArray_GetSizeAndRank>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
        InvocationContext array = instance.invokeInstanceMethod("Get2DArray").execute();

        // get array's size
        Integer size = (Integer) array.getSize().execute().getValue();

        // get array's rank
        Integer rank = (Integer) array.getRank().execute().getValue();

        // write result to console
        System.out.println("Size: " + size);
        System.out.println("Rank: " + rank);
        // </TestResources_2DArray_GetSizeAndRank>
        Assertions.assertEquals(4, size);
        Assertions.assertEquals(2, rank);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_2DArray_SetIndex() {
        // <TestResources_2DArray_SetIndex>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

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
        InvocationContext array = instance.invokeInstanceMethod("Get2DArray").execute();

        // set index in array
        array.setIndex(new Integer[]{0, 1}, "new value").execute();

        // get index from array
        InvocationContext response = array.getIndex(0, 1).execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_2DArray_SetIndex>
        array.setIndex(new Integer[]{0, 1}, "S01").execute();
        Assertions.assertEquals("new value", result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_StandardLibrary_CreateInstanceOfGenericClass() {
        // <StandardLibrary_CreateInstanceOfGenericClass>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // get string type
        InvocationContext stringType = calledRuntime.getType("System.String");

        // get generic calls with string type as parameter
        InvocationContext listType = calledRuntime.getType("System.Collections.Generic.List`1", stringType);

        // create generic type's instance
        InvocationContext list = listType.createInstance().execute();

        // invoke instance's methods
        list.invokeInstanceMethod("Add", "one").execute();
        list.invokeInstanceMethod("Add", "two").execute();
        list.invokeInstanceMethod("Add", "three").execute();
        list.invokeInstanceMethod("AddRange", (Object) new String[]{"four", "five", "six"}).execute();

        // check number of elements
        int count = (int) list.getInstanceField("Count").execute().getValue();

        // write result to console
        System.out.println(count);
        // </StandardLibrary_CreateInstanceOfGenericClass>
        Assertions.assertEquals(6, count);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_StandardLibrary_HandleList() {
        // <StandardLibrary_HandleList>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // get string type
        InvocationContext doubleType = calledRuntime.getType("System.Double");

        // get generic calls with string type as parameter
        InvocationContext listType = calledRuntime.getType("System.Collections.Generic.List`1", doubleType);

        // create generic type's instance
        InvocationContext list = listType.createInstance().execute();

        // invoke instance's method
        list.invokeInstanceMethod("AddRange", (Object) new Double[]{1.1, 2.2, 3.3, 4.4, 5.5, 6.6}).execute();

        // get element from list
        InvocationContext response1 = list.getIndex(3).execute();

        // get size of list
        InvocationContext response2 = list.getSize().execute();

        // get value from response
        double result = (double) response1.getValue();
        int result2 = (int) response2.getValue();

        // write result to console
        System.out.println(result);
        System.out.println(result2);
        // </StandardLibrary_HandleList>
        Assertions.assertEquals(4.4, result);
        Assertions.assertEquals(6, result2);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_StandardLibrary_HandleDictionary() {
        // <StandardLibrary_HandleDictionary>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // get string and double types
        InvocationContext stringType = calledRuntime.getType("System.String");
        InvocationContext doubleType = calledRuntime.getType("System.Double");

        //get generic calls with string and double types as parameters
        InvocationContext dictionaryType = calledRuntime.getType("System.Collections.Generic.Dictionary`2", stringType, doubleType);

        // create generic type's instance
        InvocationContext dictionary = dictionaryType.createInstance().execute();

        // invoke instance's method
        dictionary.invokeInstanceMethod("Add", "pi", Math.PI).execute();
        dictionary.invokeInstanceMethod("Add", "e", Math.E).execute();
        dictionary.invokeInstanceMethod("Add", "c", 299792458.0).execute();

        // get element from dictionary
        InvocationContext response = dictionary.getIndex("pi").execute();

        // get value from response
        double result = (double) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_HandleDictionary>
        Assertions.assertEquals(Math.PI, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_StandardLibrary_HandleSet() {
        // <StandardLibrary_HandleSet>
        // use Activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // get types
        InvocationContext doubleType = calledRuntime.getType("System.Double");

        // get generic class
        InvocationContext hashSetType = calledRuntime.getType("System.Collections.Generic.HashSet`1", doubleType).execute();

        // get generic class with double type as parameter
        InvocationContext hashSet = hashSetType.createInstance().execute();

        // invoke instance method
        hashSet.invokeInstanceMethod("Add", 3.14).execute();
        hashSet.invokeInstanceMethod("Add", 9.81).execute();
        hashSet.invokeInstanceMethod("Add", 1.44).execute();

        // get size of set
        InvocationContext response = hashSet.getInstanceField("Count").execute();
        int result = (int) response.getValue();

        // write results to console
        System.out.println(result);
        // </StandardLibrary_HandleSet>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_Refs_OneArg() {
        // <TestResources_Refs>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create values for refs

        // first way - pass only value
        InvocationContext refValue1 = calledRuntime.asRef(10).execute();

        // second way - pass value and type
        // ref variable should have specific type to be able to invoke methods on it
        // this way enables to cast value to specific type needed by called method
        InvocationContext intType = calledRuntime.getType("System.Int32").execute();
        InvocationContext refValue2 = calledRuntime.asRef(20.0, intType).execute();

        // invoke type's static method with ref values
        calledRuntimeType.invokeStaticMethod("RefSampleMethod", refValue1).execute();
        calledRuntimeType.invokeStaticMethod("RefSampleMethod", refValue2).execute();

        // get refs' values
        int result1 = (int) refValue1.getRefValue().execute().getValue();
        int result2 = (int) refValue2.getRefValue().execute().getValue();

        // write result to console
        System.out.println(result1);
        System.out.println(result2);

        // </TestResources_Refs>
        Assertions.assertEquals(20, result1);
        Assertions.assertEquals(40, result2);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_Refs_MultipleArgs() {
        // <TestResources_Refs_MultipleArgs>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get types from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create values for refs
        // ref variable should have specific type to be able to invoke methods on it
        // This way enables to cast value to specific type needed by called method
        InvocationContext refToInt = calledRuntime.asRef(10).execute();
        InvocationContext doubleType = calledRuntime.getType("System.Double").execute();
        InvocationContext refToDouble = calledRuntime.asRef(5, doubleType).execute();
        InvocationContext refToString = calledRuntime.asRef("Before execution").execute();

        // invoke type's static method with ref values
        calledRuntimeType.invokeStaticMethod("RefSampleMethod2", refToInt, refToDouble, refToString).execute();

        // get refs' values
        int result1 = (int) refToInt.getRefValue().execute().getValue();
        double result2 = (double) refToDouble.getRefValue().execute().getValue();
        String result3 = (String) refToString.getRefValue().execute().getValue();

        // write result to console
        System.out.println(result1);
        System.out.println(result2);
        System.out.println(result3);
        // </TestResources_Refs_MultipleArgs>
        Assertions.assertEquals(20, result1);
        Assertions.assertEquals(2.5, result2);
        Assertions.assertEquals("Done", result3);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_Outs() {
        // <TestResources_Outs>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();
        InvocationContext stringType = calledRuntime.getType("System.String").execute();

        // create values for outs
        // out variable should have specific type to be able to invoke methods on it
        // first way - pass only type
        InvocationContext outValue1 = calledRuntime.asOut(stringType).execute();
        // second way - pass initial value and type to cast on
        InvocationContext outValue2 = calledRuntime.asOut('c', stringType).execute();
        // third way - pass initial value without specific type
        InvocationContext outValue3 = calledRuntime.asOut("Test string").execute();

        // invoke type's static method with out values
        calledRuntimeType.invokeStaticMethod("OutSampleMethod", outValue1).execute();
        calledRuntimeType.invokeStaticMethod("OutSampleMethod", outValue2).execute();
        calledRuntimeType.invokeStaticMethod("OutSampleMethod", outValue3).execute();

        // get outs' values
        String result1 = (String) outValue1.getRefValue().execute().getValue();
        String result2 = (String) outValue2.getRefValue().execute().getValue();
        String result3 = (String) outValue3.getRefValue().execute().getValue();

        // write result to console
        System.out.println(result1);
        System.out.println(result2);
        System.out.println(result3);
        // </TestResources_Outs>
        Assertions.assertEquals("String from OutSampleMethod", result1);
        Assertions.assertEquals("String from OutSampleMethod", result2);
        Assertions.assertEquals("String from OutSampleMethod", result3);
    }


    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_PassingNullAsOnlyArg() {
        // <TestResources_PassingNullAsOnlyArg>
        // use Activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method
        InvocationContext response = calledRuntimeType.invokeStaticMethod("PassNull", (Object)null).execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_PassingNullAsOnlyArg>

        Assertions.assertEquals("Method called with null", result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_PassingNullAsSecondArg() {
        // <TestResources_PassingNullAsSecondArg>
        // use Activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method
        InvocationContext response = calledRuntimeType.invokeStaticMethod("PassNull2", 5, null).execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_PassingNullAsSecondArg>
        Assertions.assertEquals("Method2 called with null", result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_ReturningNull() {
        // <TestResources_ReturningNull>
        // use Activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method
        InvocationContext response = calledRuntimeType.invokeStaticMethod("ReturnNull").execute();

        // get value from response
        Object result = response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_ReturningNull>
        Assertions.assertNull(result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_InvokeMethodWithNullables() {
        // <TestResources_InvokeMethodWithNullables>
        // use Activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method
        InvocationContext response1 = calledRuntimeType.invokeStaticMethod("MethodWithNullables", null, null).execute();
        InvocationContext response2 = calledRuntimeType.invokeStaticMethod("MethodWithNullables", 5, null).execute();
        InvocationContext response3 = calledRuntimeType.invokeStaticMethod("MethodWithNullables", null, 10.0).execute();
        InvocationContext response4 = calledRuntimeType.invokeStaticMethod("MethodWithNullables", 5, 10.0).execute();

        // get value from response
        String result1 = (String) response1.getValue();
        String result2 = (String) response2.getValue();
        String result3 = (String) response3.getValue();
        String result4 = (String) response4.getValue();

        // write result to console
        System.out.println(result1);
        System.out.println(result2);
        System.out.println(result3);
        System.out.println(result4);
        // </TestResources_InvokeMethodWithNullables>

        Assertions.assertEquals("MethodWithNullables called", result1);
        Assertions.assertEquals("MethodWithNullables called", result2);
        Assertions.assertEquals("MethodWithNullables called", result3);
        Assertions.assertEquals("MethodWithNullables called", result4);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_MethodWithNullArgument() {
        // <TestResources_MethodWithNullArgument>
        // use Activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get types from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();
        InvocationContext stringType = calledRuntime.getType("System.String");

        // invoke type's static method
        InvocationContext response1 = calledRuntimeType.invokeStaticMethod("MethodWithNullArgument", stringType.createNull()).execute();
        InvocationContext response2 = calledRuntimeType.invokeStaticMethod("MethodWithNullArgument", calledRuntimeType.createNull()).execute();
        String result1 = (String) response1.getValue();
        String result2 = (String) response2.getValue();

        // write result to console
        System.out.println(result1);
        System.out.println(result2);

        // </TestResources_MethodWithNullArgument>
        Assertions.assertEquals("MethodWithNullArgument called with string", result1);
        Assertions.assertEquals("MethodWithNullArgument called with TestClass", result2);
    }

//    @Test
//    @Tag("integration")
//    public void Test_NetframeworkDll_TestResources_Multithreading_InvokeInstanceMethod() throws Exception {
//        // <TestResources_Multithreading_InvokeInstanceMethod>
//        // use Activate only once in your app
//        Javonet.activate("your-license-key");
//
//        // create called runtime context
//        RuntimeContext calledRuntime = Javonet.inMemory().clr();
//
//        // set up variables
//        String libraryPath = resourcesDirectory + "/TestClass.dll";
//        String className = "TestClass.TestClass";
//
//        // load custom library
//        calledRuntime.loadLibrary(libraryPath);
//
//        // get types from the runtime
//        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();
//
//        // Create type's instance
//        InvocationContext instance = calledRuntimeType.createInstance().execute();
//
//        // create threads and a concurrent map to store responses using full package names
//        java.util.List<Thread> threads = new java.util.ArrayList<>();
//        java.util.concurrent.ConcurrentMap<Integer, Integer> responses = new java.util.concurrent.ConcurrentHashMap<>();
//
//        // create threads to invoke the instance method concurrently
//        for (int i = 0; i < 5; i++) {
//            int j = i;
//            Thread thread = new Thread(() -> {
//                try {
//                    int response = (int) instance.invokeInstanceMethod("AddTwoNumbers", j, 5)
//                            .execute()
//                            .getValue();
//                    responses.put(j, response);
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            });
//            threads.add(thread);
//        }
//
//        // start threads
//        for (Thread thread : threads) {
//            thread.start();
//        }
//
//        // wait for threads to finish
//        for (Thread thread : threads) {
//            thread.join();
//        }
//
//        // write results to console
//        for (java.util.Map.Entry<Integer, Integer> entry : responses.entrySet()) {
//            System.out.println(entry.getValue());
//        }
//        // </TestResources_Multithreading_InvokeInstanceMethod>
//        for (java.util.Map.Entry<Integer, Integer> response : responses.entrySet()) {
//            Assertions.assertEquals(response.getKey() + 5, response.getValue());
//        }
//    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_ExecuteAsync_AsyncMethod() {
        // <TestResources_ExecuteAsync_AsyncMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // Measure start time
        long startTime = System.currentTimeMillis();

        // Get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();
        // Create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // Create file to write to
        String fileName = System.getProperty("user.home") + "/output.txt";

        try {
            java.nio.file.Path path = java.nio.file.Paths.get(fileName);
            java.nio.file.Files.deleteIfExists(path);
            java.nio.file.Files.createFile(path);
        } catch (java.io.IOException e) {
            throw new RuntimeException(e);
        }

        // Invoke instance's method asynchronously
        instance.invokeInstanceMethod("WriteToFile", fileName, " This is ").executeAsync();
        instance.invokeInstanceMethod("WriteToFile", fileName, " file with ").executeAsync();
        instance.invokeInstanceMethod("WriteToFile", fileName, " sample input ").executeAsync();

        // Wait for WriteToFile to finish
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }

        // Measure end time
        long endTime = System.currentTimeMillis();

        // Write result to console
        System.out.println("Time elapsed: " + (endTime - startTime) + " ms");
        // </TestResources_ExecuteAsync_AsyncMethod>
        Assertions.assertTrue((endTime - startTime) < 4000);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_ExecuteAsync_SyncMethod() {
        // <TestResources_ExecuteAsync_SyncMethod>
        // use Activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // Measure start time
        long startTime = System.currentTimeMillis();

        // Get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // Create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // Invoke instance's method asynchronously
        instance.invokeInstanceMethod("AddThreeNumbers", 11, 12, 13).executeAsync();
        instance.invokeInstanceMethod("AddThreeNumbers", 21, 22, 23).executeAsync();
        instance.invokeInstanceMethod("AddThreeNumbers", 31, 32, 33).executeAsync();

        // Wait for async methods to finish
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        // Measure end time
        long endTime = System.currentTimeMillis();

        // Write result to console
        System.out.println("Time elapsed: " + (endTime - startTime) + " ms");
        // </TestResources_ExecuteAsync_SyncMethod>
        Assertions.assertTrue((endTime - startTime) < 4000);
    }

//    @Test
//    @Tag("integration")
//    public void Test_NetframeworkDll_TestResources_ExecuteAsync_SyncMethod_Await() throws Exception {
//        // <TestResources_ExecuteAsync_SyncMethod_Await>
//        // use Activate only once in your app
//        Javonet.activate("your-license-key");
//
//        // create called runtime context
//        RuntimeContext calledRuntime = Javonet.inMemory().clr();
//
//        // set up variables
//        String libraryPath = resourcesDirectory + "/TestClass.dll";
//        String className = "TestClass.TestClass";
//
//        // load custom library
//        calledRuntime.loadLibrary(libraryPath);
//
//        // Measure start time
//        long startTime = System.currentTimeMillis();
//
//        // Get type from the runtime
//        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();
//        // Create type's instance
//        InvocationContext instance = calledRuntimeType.createInstance().execute();
//
//        // Invoke instance's method asynchronously and await completion
//        CompletableFuture<InvocationContext> task1 = instance.invokeInstanceMethod("AddThreeNumbers", 11, 12, 13).executeAsync();
//        CompletableFuture<InvocationContext> task2 = instance.invokeInstanceMethod("AddThreeNumbers", 21, 22, 23).executeAsync();
//        CompletableFuture<InvocationContext> task3 = instance.invokeInstanceMethod("AddThreeNumbers", 31, 32, 33).executeAsync();
//
//        CompletableFuture<Void> allTasks = CompletableFuture.allOf(task1, task2, task3);
//        allTasks.join();
//
//        // Get results from tasks
//        Integer result1 = (Integer) task1.get().getValue();
//        Integer result2 = (Integer) task2.get().getValue();
//        Integer result3 = (Integer) task3.get().getValue();
//
//        // Measure end time
//        long endTime = System.currentTimeMillis();
//
//        // Write results to console
//        System.out.println(result1);
//        System.out.println(result2);
//        System.out.println(result3);
//        System.out.println("Time elapsed: " + (endTime - startTime) + " ms");
//        // </TestResources_ExecuteAsync_SyncMethod_Await>
//        // Assert results and total time elapsed
//        Assertions.assertEquals(36, result1);
//        Assertions.assertEquals(66, result2);
//        Assertions.assertEquals(96, result3);
//        Assertions.assertTrue((endTime - startTime) < 4000);
//    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_UseStaticMethodAsDelegate() throws Exception {
        // <TestResources_UseStaticMethodAsDelegate>
        // use Activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get types from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // Create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // Get static method as delegate
        InvocationContext myFunc = calledRuntimeType.getStaticMethodAsDelegate("DivideBy").execute();

        // Invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("UseYourFunc", myFunc, 30, 6).execute();

        // Get value from response
        int result = (int) response.getValue();

        // Write result to console
        System.out.println(result);
        // </TestResources_UseStaticMethodAsDelegate>
        Assertions.assertEquals(5, result);
    }

    @Test
    @Tag("integration")
    public void Test_NetframeworkDll_TestResources_UseInstanceMethodAsDelegate() throws Exception {
        // <TestResources_UseInstanceMethodAsDelegate>
        // use Activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().clr();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.dll";
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get types from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // Create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // Get instance method as delegate
        InvocationContext myFunc = instance.getInstanceMethodAsDelegate("MultiplyTwoNumbers").execute();

        // Invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("UseYourFunc", myFunc, 5, 6).execute();

        // Get value from response
        int result = (int) response.getValue();

        // Write result to console
        System.out.println(result);
        // </TestResources_UseInstanceMethodAsDelegate>
        Assertions.assertEquals(30, result);
    }
}