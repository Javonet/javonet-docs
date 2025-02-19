package pythonpackage;

import com.javonet.sdk.*;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import utils.ActivationCredentials;

public class integrationTests {

    private final String resourcesDirectory = java.nio.file.Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/python-package";

    @BeforeAll
    public static void initialization() {
        int result = Javonet.activate(ActivationCredentials.yourLicenseKey);
        Assertions.assertEquals(0, result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_StandardLibrary_CreateRuntimeContext() {
        // <StandardLibrary_CreateRuntimeContext>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // use calledRuntime to interact with code from other technology
        // </StandardLibrary_CreateRuntimeContext>
        Assertions.assertNotNull(calledRuntime);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_StandardLibrary_CreateInvocationContext() {
        // <StandardLibrary_CreateInvocationContext>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // construct an invocation context - this invocationContext in non-materialized
        InvocationContext invocationContext = calledRuntime.getType("builtins").invokeStaticMethod("abs", -50);

        // execute invocation context - this will materialize the invocationContext
        InvocationContext response = invocationContext.execute();
        // </StandardLibrary_CreateInvocationContext>
        Assertions.assertNotNull(response);
    }

    @Test
    @Tag("integration")
    public void test_PythonPackage_StandardLibrary_GetValue() {
        // <StandardLibrary_GetValue>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // construct an invocation context - this invocationContext in non-materialized
        InvocationContext invocationContext = calledRuntime.getType("builtins").invokeStaticMethod("abs", -50);

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
    public void Test_PythonPackage_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("math").execute();

        // get type's static field
        InvocationContext response = calledRuntimeType.getStaticField("pi").execute();

        // get result from response
        Double result = (Double) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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

    @Test
    @Tag("integration")
    public void Test_PythonPackage_StandardLibrary_InvokeInstanceMethod_BuiltIn_String_Upcase() {
        // <StandardLibrary_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("builtins.str").execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance("hello world").execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("upper").execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeInstanceMethod>
        Assertions.assertEquals("HELLO WORLD", result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022() {
        // <StandardLibrary_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType("datetime.datetime").execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(2023, 2, 3, 12, 0, 0).execute();

        // get instance's field 
        InvocationContext response = instance.getInstanceField("year").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetInstanceField>
        Assertions.assertEquals(2023, result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
    public void Test_PythonPackage_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
    public void Test_PythonPackage_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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

        // invoke type's method
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
    public void Test_PythonPackage_TestResources_GetInstanceField_PublicValue_18() {
        // <TestResources_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // create type's instance
        InvocationContext instance = calledRuntime.getType(className).createInstance(18, 19).execute();

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
    public void Test_PythonPackage_TestResources_SetInstanceField_PublicValue_44() {
        // <TestResources_SetInstanceField>
        Javonet.activate("your-license-key");

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
        InvocationContext instance = calledRuntimeType.createInstance(18, 19).execute();

        // set instance's field
        instance.setInstanceField("public_value", 44).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("public_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetInstanceField>
        Assertions.assertEquals(44, result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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

        // invoke type's method
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
    public void Test_PythonPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        // path to directory with .py files
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // create type's instance
        InvocationContext instance = calledRuntime.getType(className).createInstance(0, 1).execute();

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
    public void Test_PythonPackage_TestResources_1DArray_GetIndex_2_StringThree() {
        // <TestResources_1DArray_GetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
    public void Test_PythonPackage_TestResources_1DArray_GetSize_5() {
        // <TestResources_1DArray_GetSize>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
    public void Test_PythonPackage_TestResources_1DArray_SetIndex_StringSeven() {
        // <TestResources_1DArray_SetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
    public void Test_PythonPackage_TestResources_1DArray_Iterate() {
        // <TestResources_1DArray_Iterate>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
    public void Test_PythonPackage_TestResources_1DArray_PassArrayAsArgument() {
        // <TestResources_1DArray_PassArrayAsArgument>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
        Double result = (Double) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_1DArray_PassArrayAsArgument>
        Assertions.assertEquals(999.0, result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_1DArray_RetrieveArray() {
        // <TestResources_1DArray_RetrieveArray>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
    public void Test_PythonPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException() {
        // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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

        // invoke type's static method which throws exception
        try {
            calledRuntimeType.invokeStaticMethod("divide_by", 10, 0).execute();
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
    public void Test_PythonPackage_TestResources_EnumAddToList() {
        // <TestResources_EnumAddToList>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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

        // create enum's items
        InvocationContext apple = calledRuntime.getEnumItem(calledRuntimeType, "Fruit", "Apple");
        InvocationContext mango = calledRuntime.getEnumItem(calledRuntimeType, "Fruit", "Mango");

        // create fruits arrays
        InvocationContext[] fruits1ToAdd = new InvocationContext[]{apple, mango};

        // invoke type's method
        InvocationContext response = calledRuntimeType.invokeStaticMethod("add_fruits_to_list", (Object) fruits1ToAdd).execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_EnumAddToList>
        Assertions.assertEquals("2 fruits on the list", result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_EnumNameAndValue() {
        // <TestResources_EnumNameAndValue>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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

        // create enum's items
        InvocationContext fruit1 = calledRuntime.getEnumItem(calledRuntimeType, "Fruit", "Mango");
        InvocationContext fruit2 = calledRuntime.getEnumItem(calledRuntimeType, "Fruit", "Orange");

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
        Assertions.assertEquals(4, fruit1Value);
        Assertions.assertEquals(3, fruit2Value);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_2DArray_GetIndex() {
        // <TestResources_2DArray_GetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
        InvocationContext array = instance.invokeInstanceMethod("get_2d_array").execute();

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
    public void Test_PythonPackage_TestResources_2DArray_GetSizeAndRank() {
        // <TestResources_2DArray_GetSizeAndRank>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
        InvocationContext array = instance.invokeInstanceMethod("get_2d_array").execute();


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
    public void Test_PythonPackage_TestResources_2DArray_SetIndex() {
        // <TestResources_2DArray_SetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

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
        InvocationContext array = instance.invokeInstanceMethod("get_2d_array").execute();

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
    public void Test_PythonPackage_StandardLibrary_HandleList() {
        // <StandardLibrary_HandleList>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // get list from built-in types
        InvocationContext listType = calledRuntime.getType("builtins.list").execute();

        // create list's instance
        InvocationContext list = listType.createInstance().execute();

        // add items to list
        list.invokeInstanceMethod("extend", (Object) new String[]{"one", "two", "three"}).execute();

        // get list's size
        InvocationContext response1 = list.getSize().execute();

        // get element from list
        InvocationContext response2 = list.getIndex(1).execute();

        // get value from response
        Integer result1 = (Integer) response1.getValue();
        String result2 = (String) response2.getValue();

        // write result to console
        System.out.println(result1);
        System.out.println(result2);
        // </StandardLibrary_HandleList>
        Assertions.assertEquals(3, result1);
        Assertions.assertEquals("two", result2);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_HandleDictionary() {
        // <TestResources_HandleDictionary>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // get list from built-in types
        InvocationContext dictType = calledRuntime.getType("builtins.dict").execute();

        // create list's instance
        InvocationContext dict = dictType.createInstance().execute();

        // add items to list
        dict.setIndex("pi", Math.PI).execute();
        dict.setIndex("e", Math.E).execute();
        dict.setIndex("c", 299792458.0).execute();

        // get element from list
        InvocationContext response = dict.getIndex("pi").execute();

        // get value from response
        Double result = (Double) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_HandleDictionary>
        Assertions.assertEquals(Math.PI, result);
    }

    // ...existing code...

    @Test
    @Tag("integration")
    public void Test_PythonPackage_StandardLibrary_HandleSet() {
        // <StandardLibrary_HandleSet>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // get type
        InvocationContext hashSetType = calledRuntime.getType("builtins.set").execute();

        // create set instance
        InvocationContext hashSet = hashSetType.createInstance().execute();

        // add elements to set
        hashSet.invokeInstanceMethod("add", 3.14).execute();
        hashSet.invokeInstanceMethod("add", 9.81).execute();
        hashSet.invokeInstanceMethod("add", 1.44).execute();

        // get number of elements in set
        InvocationContext response = calledRuntime.getType("builtins")
                .invokeStaticMethod("len", hashSet)
                .execute();
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_HandleSet>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_PassingNullAsOnlyArg() {
        // <TestResources_PassingNullAsOnlyArg>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method with null as only argument
        InvocationContext response = calledRuntimeType.invokeStaticMethod("pass_null", null).execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_PassingNullAsOnlyArg>
        Assertions.assertEquals("Method called with null", result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_PassingNullAsSecondArg() {
        // <TestResources_PassingNullAsSecondArg>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method with a non-null first arg and null as second arg
        InvocationContext response = calledRuntimeType.invokeStaticMethod("pass_null_2", 5, null).execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_PassingNullAsSecondArg>
        Assertions.assertEquals("Method2 called with null", result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_ReturningNull() {
        // <TestResources_ReturningNull>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method which returns null
        InvocationContext response = calledRuntimeType.invokeStaticMethod("return_null").execute();

        // get value from response
        Object result = response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_ReturningNull>
        Assertions.assertNull(result);
    }

//    @Test
//    @Tag("integration")
//    public void Test_PythonPackage_TestResources_Multithreading_InvokeInstanceMethod() throws Exception {
//        // <TestResources_Multithreading_InvokeInstanceMethod>
//        Javonet.activate("your-license-key");
//
//        // create called runtime context using Python runtime
//        RuntimeContext calledRuntime = Javonet.inMemory().python();
//
//        // set up variables: using the directory with the Python files
//        String libraryPath = resourcesDirectory;
//        String className = "TestClass.TestClass";
//
//        // load custom library (Python module)
//        calledRuntime.loadLibrary(libraryPath);
//
//        // get type from the runtime
//        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();
//
//        // create type's instance
//        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();
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
//                    int response = (int) instance.invokeInstanceMethod("add_two_numbers", j, 5)
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

//    @Test
//    @Tag("integration")
//    public void Test_PythonPackage_TestResources_ExecuteAsync_AsyncMethod() {
//        // <TestResources_ExecuteAsync_AsyncMethod>
//        Javonet.activate("your-license-key");
//
//        // create called runtime context using Python runtime
//        RuntimeContext calledRuntime = Javonet.inMemory().python();
//
//        // set up variables (assumes the directory contains your Python modules)
//        String libraryPath = resourcesDirectory;
//        String className = "TestClass.TestClass";
//
//        // load custom library (Python module)
//        calledRuntime.loadLibrary(libraryPath);
//
//        // Measure start time
//        long startTime = System.currentTimeMillis();
//
//        // Get type from the runtime and create instance
//        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();
//        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();
//
//        // Create file to write to
//        String fileName = System.getProperty("user.home") + "/output.txt";
//        try {
//            java.nio.file.Path path = java.nio.file.Paths.get(fileName);
//            java.nio.file.Files.deleteIfExists(path);
//            java.nio.file.Files.createFile(path);
//        } catch (java.io.IOException e) {
//            throw new RuntimeException(e);
//        }
//
//        // Invoke instance's method asynchronously
//        instance.invokeInstanceMethod("write_to_file", fileName, " This is ").executeAsync();
//        instance.invokeInstanceMethod("write_to_file", fileName, " file with ").executeAsync();
//        instance.invokeInstanceMethod("write_to_file", fileName, " sample input ").executeAsync();
//
//        // Wait for write_to_file to finish
//        try {
//            Thread.sleep(3000);
//        } catch (InterruptedException e) {
//            System.out.println(e.getMessage());
//        }
//
//        // Measure end time
//        long endTime = System.currentTimeMillis();
//
//        // Write result to console
//        System.out.println("Time elapsed: " + (endTime - startTime) + " ms");
//        // </TestResources_ExecuteAsync_AsyncMethod>
//        Assertions.assertTrue((endTime - startTime) < 4000);
//    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_ExecuteAsync_SyncMethod() {
        // <TestResources_ExecuteAsync_SyncMethod>
        Javonet.activate("your-license-key");

        // create called runtime context using Python runtime
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables (assumes the directory contains your Python modules)
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library (Python module)
        calledRuntime.loadLibrary(libraryPath);

        // Measure start time
        long startTime = System.currentTimeMillis();

        // Get type from the runtime and create instance
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();
        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();

        // Invoke instance's method asynchronously
        instance.invokeInstanceMethod("add_three_numbers", 11, 12, 13).executeAsync();
        instance.invokeInstanceMethod("add_three_numbers", 21, 22, 23).executeAsync();
        instance.invokeInstanceMethod("add_three_numbers", 31, 32, 33).executeAsync();

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

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_UseStaticMethodAsDelegate() throws Exception {
        // <TestResources_UseStaticMethodAsDelegate>
        Javonet.activate("your-license-key");

        // create called runtime context using Python runtime
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables (assumes the directory contains your Python modules)
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library (Python module)
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();

        // get static method as delegate (e.g., Python function 'divide_by')
        InvocationContext myFunc = calledRuntimeType.getStaticMethodAsDelegate("divide_by").execute();

        // invoke instance's method using the delegate
        InvocationContext response = instance.invokeInstanceMethod("use_your_func", myFunc, 30, 6).execute();

        // get value from response
        double result = (double) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_UseStaticMethodAsDelegate>
        Assertions.assertEquals(5, result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_UseInstanceMethodAsDelegate() throws Exception {
        // <TestResources_UseInstanceMethodAsDelegate>
        Javonet.activate("your-license-key");

        // create called runtime context using Python runtime
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables (assumes the directory contains your Python modules)
        String libraryPath = resourcesDirectory;
        String className = "TestClass.TestClass";

        // load custom library (Python module)
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance(0, 1).execute();

        // get instance method as delegate (e.g., Python method 'multiply_two_numbers')
        InvocationContext myFunc = instance.getInstanceMethodAsDelegate("multiply_two_numbers").execute();

        // invoke instance's method using the delegate
        InvocationContext response = instance.invokeInstanceMethod("use_your_func", myFunc, 5, 6).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_UseInstanceMethodAsDelegate>
        Assertions.assertEquals(30, result);
    }

    @Test
    @Tag("integration")
    public void Test_PythonPackage_TestResources_InvokeGlobalFunction() throws Exception {
        // <TestResources_InvokeGlobalFunction>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().python();

        // set up variables
        String libraryPath = resourcesDirectory;

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // invoke global function
        InvocationContext response = calledRuntime.invokeGlobalFunction("TestClass.welcome", "John").execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeGlobalFunction>
        Assertions.assertEquals("Hello John!", result);
    }
}
