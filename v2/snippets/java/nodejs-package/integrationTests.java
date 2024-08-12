package nodejspackage;

import com.javonet.sdk.*;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import utils.ActivationCredentials;

import java.nio.file.Paths;

public class integrationTests {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/nodejs-package";

    @BeforeAll
    public static void initialization() {
        int result = Javonet.activate(ActivationCredentials.yourLicenseKey);
        Assertions.assertEquals(0, result);
    }

    @Test
    @Tag("integration")
    public void test_NodejsPackage_StandardLibrary_CreateRuntimeContext() {
        // <StandardLibrary_CreateRuntimeContext>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // use calledRuntime to interact with code from other technology
        // </StandardLibrary_CreateRuntimeContext>
        Assertions.assertNotNull(calledRuntime);
    }

    @Test
    @Tag("integration")
    public void test_NodejsPackage_StandardLibrary_CreateInvocationContext() {
        // <StandardLibrary_CreateInvocationContext>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // construct an invocation context - this invocationContext in non-materialized
        InvocationContext invocationContext = calledRuntime.getType("Math").invokeStaticMethod("abs", -50);

        // execute invocation context - this will materialize the invocationContext
        InvocationContext response = invocationContext.execute();
        // </StandardLibrary_CreateInvocationContext>
        Assertions.assertNotNull(response);
    }

    @Test
    @Tag("integration")
    public void test_NodejsPackage_StandardLibrary_GetValue() {
        // <StandardLibrary_GetValue>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // construct an invocation context - this invocationContext in non-materialized
        InvocationContext invocationContext = calledRuntime.getType("Math").invokeStaticMethod("abs", -50);

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
    public void Test_NodejsPackage_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("Math").execute();

        // invoke type's method
        InvocationContext response = calledRuntimeType.getStaticField("PI").execute();

        // get result from response
        double result = (double) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result, 0.00001);
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("Math").execute();

        // invoke type's static method
        InvocationContext response = calledRuntimeType.invokeStaticMethod("abs", -50).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_GetStaticField_staticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = calledRuntimeType.getStaticField("staticValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_SetStaticField_staticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // set static field's value
        calledRuntimeType.setStaticField("staticValue", 75).execute();

        // get type's static field
        InvocationContext response = calledRuntimeType.getStaticField("staticValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetStaticField>
        calledRuntimeType.setStaticField("staticValue", 3).execute();
        Assertions.assertEquals(75, result);
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_GetInstanceField_PublicValue_18() {
        // <TestResources_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(18, 19).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("publicValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(18, result);
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_SetInstanceField_PublicValue_44() {
        // <TestResources_SetInstanceField>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(18, 19).execute();

        // set instance's field
        instance.setInstanceField("publicValue", 44).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("publicValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetInstanceField>
        Assertions.assertEquals(44, result);
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_InvokeStaticMethod_multiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's method
        InvocationContext response = calledRuntimeType.invokeStaticMethod("multiplyByTwo", 25).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("multiplyTwoNumbers", 5, 4).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeInstanceMethod>
        Assertions.assertEquals(20, result);
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_1DArray_GetIndex_2_StringThree() {
        // <TestResources_1DArray_GetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get1DArray").execute();

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
    public void Test_NodejsPackage_TestResources_1DArray_GetSize_5() {
        // <TestResources_1DArray_GetSize>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get1DArray").execute();

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
    public void Test_NodejsPackage_TestResources_1DArray_SetIndex_StringSeven() {
        // <TestResources_1DArray_SetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get1DArray").execute();

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
    public void Test_NodejsPackage_TestResources_1DArray_Iterate() {
        // <TestResources_1DArray_Iterate>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get1DArray").execute();

        // get array's size
        int arraySize = (int) array.getSize().execute().getValue();

        // create local array and store elements in it
        String[] arrayValues = new String[arraySize];
        int i = 0;
        for (InvocationContext element : array) {
            arrayValues[i] = (String) element.execute().getValue();
            i++;
        }

        // write result to console
        System.out.println(String.join("\t", arrayValues));
        // </TestResources_1DArray_Iterate>
        Assertions.assertArrayEquals(new String[]{"one", "two", "three", "four", "five"}, arrayValues);
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_1DArray_PassArrayAsArgument() {
        // <TestResources_1DArray_PassArrayAsArgument>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("addArrayElementsAndMultiply", new Double[]{12.22, 98.22, -10.44}, 9.99).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_1DArray_PassArrayAsArgument>
        Assertions.assertEquals(999, result);
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_1DArray_RetrieveArray() {
        // <TestResources_1DArray_RetrieveArray>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext arrayReference = instance.invokeInstanceMethod("get1DArray").execute();

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
    public void Test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException() {
        // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method which throws exception
        try {
            calledRuntimeType.invokeStaticMethod("divideBy", 10, 0).execute();
        }
        catch (Exception ex) {
            // write exception message to console
            ex.printStackTrace();
            return;
        }
        // </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        Assertions.fail();
    }

    @Test
    @Tag("integration")
    public void Test_NodejsPackage_TestResources_2DArray_GetIndex() {
        // <TestResources_2DArray_GetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get2DArray").execute();

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
    public void Test_NodejsPackage_TestResources_2DArray_GetSizeAndRank() {
        // <TestResources_2DArray_GetSizeAndRank>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.js";
        String className = "TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get2DArray").execute();


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
    public void Test_NodejsPackage_TestResources_2DArray_SetIndex() {
        // <TestResources_2DArray_SetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String className = "TestClass";
        String libraryPath = resourcesDirectory + "/TestClass.js";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext type = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = type.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get2DArray").execute();

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
}
