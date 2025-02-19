package perlpackage;

import com.javonet.sdk.*;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import utils.ActivationCredentials;

public class integrationTests {

    private final String resourcesDirectory = java.nio.file.Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/perl-package";

    @BeforeAll
    public static void initialization() {
        int result = Javonet.activate(ActivationCredentials.yourLicenseKey);
        Assertions.assertEquals(0, result);
    }

    @Test
    @Tag("integration")
    public void Test_PerlPackage_StandardLibrary_CreateRuntimeContext() {
        // <StandardLibrary_CreateRuntimeContext>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // use calledRuntime to interact with code from other technology
        // </StandardLibrary_CreateRuntimeContext>
        Assertions.assertNotNull(calledRuntime);
    }

    @Test
    @Tag("integration")
    public void Test_PerlPackage_StandardLibrary_CreateInvocationContext() {
        // <StandardLibrary_CreateInvocationContext>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // construct an invocation context - this invocationContext in non-materialized
        InvocationContext invocationContext = calledRuntime.getType("CORE").invokeStaticMethod("length", "sample text");

        // execute invocation context - this will materialize the invocationContext
        InvocationContext response = invocationContext.execute();
        // </StandardLibrary_CreateInvocationContext>
        Assertions.assertNotNull(response);
    }

    @Test
    @Tag("integration")
    public void Test_PerlPackage_StandardLibrary_GetValue() {
        // <StandardLibrary_GetValue>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // construct an invocation context - this invocationContext in non-materialized
        InvocationContext invocationContext = calledRuntime.getType("CORE").invokeStaticMethod("length", "sample text");

        // execute invocation context - this will materialize the invocationContext
        InvocationContext response = invocationContext.execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetValue>
        Assertions.assertEquals(11, result);
    }

    @Test
    @Tag("integration")
    public void Test_PerlPackage_StandardLibrary_InvokeStaticMethod() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // construct an invocation context - this invocationContext in non-materialized
        InvocationContext invocationContext = calledRuntime.getType("CORE").invokeStaticMethod("abs", -50);

        // execute invocation context - this will materialize the invocationContext
        InvocationContext response = invocationContext.execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_PerlPackage_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_PerlPackage_TestResources_GetStaticField_StaticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

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
    public void Test_PerlPackage_TestResources_SetStaticField_StaticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

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
    public void Test_PerlPackage_TestResources_GetInstanceField_PublicValue_1() {
        // <TestResources_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // create type's instance
        InvocationContext instance = Javonet.inMemory().perl().getType(className).createInstance().execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("public_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(1, result);
    }

    @Test
    @Tag("integration")
    public void Test_PerlPackage_TestResources_SetInstanceField_PublicValue_44() {
        // <TestResources_SetInstanceField>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

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
    public void Test_PerlPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

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
    public void Test_PerlPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // create type's instance
        InvocationContext instance = Javonet.inMemory().perl().getType(className).createInstance().execute();

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
    public void Test_PerlPackage_TestResources_1DArray_GetIndex_2_StringThree() {
        // <TestResources_1DArray_GetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

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
    public void Test_PerlPackage_TestResources_1DArray_GetSize_5() {
        // <TestResources_1DArray_GetSize>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

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
    public void Test_PerlPackage_TestResources_1DArray_SetIndex_StringSeven() {
        // <TestResources_1DArray_SetIndex>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

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
    public void Test_PerlPackage_TestResources_1DArray_Iterate() {
        // <TestResources_1DArray_Iterate>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = calledRuntimeType.createInstance().execute();

        // invoke instance's method
        InvocationContext array = instance.invokeInstanceMethod("get_1d_array").execute();

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
    public void Test_PerlPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException() {
        // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

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
    public void Test_PerlPackage_TestResources_PassingNullAsOnlyArg() {
        // <TestResources_PassingNullAsOnlyArg>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method with null as the only argument
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
    public void Test_PerlPackage_TestResources_PassingNullAsSecondArg() {
        // <TestResources_PassingNullAsSecondArg>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method with a non-null first arg and null as second argument
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
    public void Test_PerlPackage_TestResources_ReturningNull() {
        // <TestResources_ReturningNull>
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";
        String className = "TestClass::TestClass";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // get type from the runtime
        InvocationContext calledRuntimeType = calledRuntime.getType(className).execute();

        // invoke type's static method that returns null
        InvocationContext response = calledRuntimeType.invokeStaticMethod("return_null").execute();

        // get value from response
        Object result = response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_ReturningNull>
        Assertions.assertNull(result);
    }

    @Test
    @Tag("integration")
    public void Test_PerlPackage_TestResources_InvokeGlobalFunction() throws Exception {
        // <TestResources_InvokeGlobalFunction>
        // use activate only once in your app
        Javonet.activate("your-license-key");

        // create called runtime context
        RuntimeContext calledRuntime = Javonet.inMemory().perl();

        // set up variables
        String libraryPath = resourcesDirectory + "/TestClass.pm";

        // load custom library
        calledRuntime.loadLibrary(libraryPath);

        // invoke global function
        InvocationContext response = calledRuntime.invokeGlobalFunction("TestClass::TestClass::welcome", "John").execute();

        // get value from response
        String result = (String) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeGlobalFunction>
        Assertions.assertEquals("Hello John!", result);
    }
}
