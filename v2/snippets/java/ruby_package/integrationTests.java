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

public class JvmToRubyIntegrationTest {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString() + "/testResources/ruby_package";
    @BeforeAll
    public static void initialization() {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Ruby_StandardLibrary_LoadLibrary_Base64_NoException() {
        // <StandardLibrary_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create RUBY runtime context
        RuntimeContext rubyRuntime = Javonet.inMemory().ruby();

        // load RUBY library
        rubyRuntime.loadLibrary("base64");
        // </StandardLibrary_LoadLibrary>
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50() {
        // <StandardLibrary_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create RUBY runtime context
        RuntimeContext rubyRuntime = Javonet.inMemory().ruby();

        // get type from runtime
        InvocationContext rubyType = rubyRuntime.getType("Math").execute();

        // invoke type's static method
        InvocationContext response = rubyType.invokeStaticMethod("sqrt", 2500).execute();

        // get result from response
        float result = (float) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_InvokeStaticMethod>
        Assertions.assertEquals(50, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Ruby_StandardLibrary_GetStaticField_MathPI_PI() {
        // <StandardLibrary_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create RUBY runtime context
        RuntimeContext rubyRuntime = Javonet.inMemory().ruby();

        // get type from runtime
        InvocationContext rubyType = rubyRuntime.getType("Math").execute();

        // get type's static field
        InvocationContext response = rubyType.getStaticField("PI").execute();

        // get result from response
        float result = (float) response.getValue();

        // write result to console
        System.out.println(result);
        // </StandardLibrary_GetStaticField>
        Assertions.assertEquals(Math.PI, result, 0.00001);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoException() {
        // <TestResources_LoadLibrary>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create RUBY runtime context
        RuntimeContext rubyRuntime = Javonet.inMemory().ruby();

        // set up variables.
        String libraryPath = resourcesDirectory + "/ruby_test_class.rb";

        // load RUBY custom library
        rubyRuntime.loadLibrary(libraryPath);
        // </TestResources_LoadLibrary>
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Ruby_TestResources_InvokeStaticMethod_multiplyByTwo_25_50() {
        // <TestResources_InvokeStaticMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create RUBY runtime context
        RuntimeContext rubyRuntime = Javonet.inMemory().ruby();

        // set up variables.
        String libraryPath = resourcesDirectory + "/ruby_test_class.rb";
        String className = "RubyTestClass::RubyTestClass";

        // load RUBY custom library
        rubyRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext rubyType = rubyRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = rubyType.invokeStaticMethod("multiply_by_two", 25).execute();

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
    public void Test_Ruby_TestResources_GetStaticField_staticValue_3() {
        // <TestResources_GetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create RUBY runtime context
        RuntimeContext rubyRuntime = Javonet.inMemory().ruby();

        // set up variables.
        String libraryPath = resourcesDirectory + "/ruby_test_class.rb";
        String className = "RubyTestClass::RubyTestClass";

        // load RUBY custom library
        rubyRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext rubyType = rubyRuntime.getType(className).execute();

        // get type's static field
        InvocationContext response = rubyType.getStaticField("static_value").execute();

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
    public void Test_Ruby_TestResources_SetStaticField_staticValue_75() {
        // <TestResources_SetStaticField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create RUBY runtime context
        RuntimeContext rubyRuntime = Javonet.inMemory().ruby();

        // set up variables.
        String libraryPath = resourcesDirectory + "/ruby_test_class.rb";
        String className = "RubyTestClass::RubyTestClass";

        // load RUBY custom library
        rubyRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext rubyType = rubyRuntime.getType(className).execute();

        // set type's static field
        rubyType.setStaticField("static_value", 75).execute();

        // get type's static field
        InvocationContext response = rubyType.getStaticField("static_value").execute();

        // get value from response
        int result = (int) response.getValue();

        // write result to console
        System.out.println(result);
        // </TestResources_SetStaticField>
        rubyType.setStaticField("static_value", 3).execute();
        Assertions.assertEquals(75, result);
    }

    @Test
    @Tag("integration")
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20() {
        // <TestResources_InvokeInstanceMethod>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create RUBY runtime context
        RuntimeContext rubyRuntime = Javonet.inMemory().ruby();

        // set up variables.
        String libraryPath = resourcesDirectory + "/ruby_test_class.rb";
        String className = "RubyTestClass::RubyTestClass";

        // load RUBY custom library
        rubyRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext rubyType = rubyRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = rubyType.createInstance(12, 13).execute();

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
    @EnabledOnOs(OS.WINDOWS)
    public void Test_Ruby_TestResources_GetInstanceField_PublicValue_18() {
        // <TestResources_GetInstanceField>
        // use activate only once in your app
        Javonet.activate("your-email", "your-license-key");

        // create RUBY runtime context
        RuntimeContext rubyRuntime = Javonet.inMemory().ruby();

        // set up variables.
        String libraryPath = resourcesDirectory + "/ruby_test_class.rb";
        String className = "RubyTestClass::RubyTestClass";

        // load RUBY custom library
        rubyRuntime.loadLibrary(libraryPath);

        // get type from runtime
        InvocationContext rubyType = rubyRuntime.getType(className).execute();

        // create type's instance
        InvocationContext instance = rubyType.createInstance(18, 19).execute();

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
