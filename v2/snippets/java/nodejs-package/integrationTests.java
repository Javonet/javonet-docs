import com.javonet.sdk.internal.InvocationContext;
import com.javonet.sdk.internal.RuntimeContext;
import com.javonet.sdk.java.Javonet;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.nio.file.Paths;

public class JvmToNodejsIntegrationTest {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/nodejs-package";

    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NODEJS runtime context
        RuntimeContext nodejsRuntime = Javonet.inMemory().nodejs();

        // get type from runtime
        InvocationContext nodejsType = nodejsRuntime.getType("Math").execute();

        // invoke type's static method
        InvocationContext response = nodejsType.invokeStaticMethod("abs", -50).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NODEJS runtime context
        RuntimeContext nodejsRuntime = Javonet.inMemory().nodejs();

        // get type from runtime
        InvocationContext nodejsType = nodejsRuntime.getType("Math").execute();

        // get type's static field
        InvocationContext response = nodejsType.getStaticField("PI").execute();

        // get result from response
        double result = (double) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result, 0.00001);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NODEJS runtime context
        RuntimeContext nodejsRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/NodejsTestClass.js";

        // load custom CLR library
        nodejsRuntime.loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_InvokeStaticMethod_multiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NODEJS runtime context
        RuntimeContext nodejsRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/NodejsTestClass.js";
        String className = "NodejsTestClass";

        // load custom CLR library
        nodejsRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext nodejsType = nodejsRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = nodejsType.invokeStaticMethod("multiplyByTwo", 25).execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_GetStaticField_staticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NODEJS runtime context
        RuntimeContext nodejsRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/NodejsTestClass.js";
        String className = "NodejsTestClass";

        // load custom CLR library
        nodejsRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext nodejsType = nodejsRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = nodejsType.getStaticField("staticValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetStaticField>
        Assertions.assertEquals(3, result);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_SetStaticField_staticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NODEJS runtime context
        RuntimeContext nodejsRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/NodejsTestClass.js";
        String className = "NodejsTestClass";

        // load custom CLR library
        nodejsRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext nodejsType = nodejsRuntime.getType(className).execute();

        // set static field's value
        nodejsType.setStaticField("staticValue", 75).execute();

        // get type's static field
        InvocationContext response = nodejsType.getStaticField("staticValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetStaticField>
        nodejsType.setStaticField("staticValue", 3).execute();
        Assertions.assertEquals(75, result);
    }

    @Test
    @Tag("integration")
    public void Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NODEJS runtime context
        RuntimeContext nodejsRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/NodejsTestClass.js";
        String className = "NodejsTestClass";

        // load custom CLR library
        nodejsRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext nodejsType = nodejsRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = nodejsType.createInstance(12, 13).execute();

        // invoke instance's method
        InvocationContext response = instance.invokeInstanceMethod("multiplyTwoNumbers", 5, 4).execute();

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
    public void Test_Nodejs_TestResources_GetInstanceField_PublicValue_18() {
        // <TestResources_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create NODEJS runtime context
        RuntimeContext nodejsRuntime = Javonet.inMemory().nodejs();

        // set up variables
        String libraryPath = resourcesDirectory + "/NodejsTestClass.js";
        String className = "NodejsTestClass";

        // load custom CLR library
        nodejsRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext nodejsType = nodejsRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = nodejsType.createInstance(18, 19).execute();

        // get instance's field
        InvocationContext response = instance.getInstanceField("publicValue").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_GetInstanceField>
        Assertions.assertEquals(36, ((String) instance.getValue()).length());
        Assertions.assertEquals(18, result);
    }
}
