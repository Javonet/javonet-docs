import com.javonet.Javonet;
import com.javonet.JavonetException;
import com.javonet.JavonetFramework;
import com.javonet.api.NObject;
import com.javonet.api.NType;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.nio.file.Paths;

public class integrationTests {

    private final String resourcesDirectory = Paths.get("").toAbsolutePath().getParent().getParent().toString() + "\\testsResources\\netframework-dll";

    @BeforeAll
    public static void initialization() throws JavonetException {
        Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey, JavonetFramework.v45);
    }

    @Test
    @Tag("integration")
    public void Test_Activation() throws JavonetException {
        // <Activation>
        Javonet.activate("your-email", "your-license-key", JavonetFramework.v45);
        // Todo: Your Javonet powered application code
        // </Activation>
    }

    @Test
    @Tag("integration")
    public void Test_ActivationWithProxy() throws JavonetException {
        // <ActivationWithProxy>
        Javonet.activate("your-email", "your-license-key", "your-host", "your-username", "your-password", JavonetFramework.v45);
        // Todo: Your Javonet powered application code
        // </ActivationWithProxy>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_AddReference() throws JavonetException {
        // <TestResources_AddReference>
        // Todo: activate Javonet
        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");
        // </TestResources_AddReference>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_InvokeStaticMethod() throws JavonetException {
        // <TestResources_InvokeStaticMethod>
        // Todo: activate Javonet
        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // get .NET type
        NType sampleType = Javonet.getType("TestClass.TestClass");

        // call static method
        String res = sampleType.invoke("SayHello", "Student");

        // write response to console
        System.out.println(res);
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals("Hello Student", res);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_InvokeStaticMethod_Fluent() throws JavonetException {
        // <TestResources_InvokeStaticMethodFluent>
        // Todo: activate Javonet
        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // call static method
        String res = Javonet.getType("TestClass.TestClass").invoke("SayHello", "Student");

        // write response to console
        System.out.println(res);
        // </TestResources_InvokeStaticMethodFluent>
        Assertions.assertEquals("Hello Student", res);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_CreateInstanceAndInvokeMethod() throws JavonetException {
        // <TestResources_CreateInstanceAndInvokeMethod>
        // Todo: activate Javonet
        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // create instance
        NObject objRandom = Javonet.New("TestClass.TestClass");

        // call instance method
        Integer response = objRandom.invoke("MultiplyByTwo", 50);

        // write response to console
        System.out.println(response);
        // </TestResources_CreateInstanceAndInvokeMethod>
        Assertions.assertEquals(100, response);
    }

    @Test
    @Tag("integration")
    public void Test_StandardLibrary_CreateInstanceAndInvokeMethod() throws JavonetException {
        // <StandardLibrary_CreateInstanceAndInvokeMethod>
        // Todo: activate Javonet

        // create instance
        NObject objRandom = Javonet.New("System.Random");

        // call instance method
        Integer response = objRandom.invoke("Next", 10, 20);

        // write response to console
        System.out.println(response);
        // </StandardLibrary_CreateInstanceAndInvokeMethod>
        Assertions.assertTrue(response >= 10);
        Assertions.assertTrue(response < 20);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_GenericMethods() throws JavonetException {
        // <TestResources_GenericMethods>
        // Todo: activate Javonet

        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // create instance
        NObject genSample = Javonet.New("TestClass.TestClass");

        // invoke generic method with one type
        String response1 = genSample.generic(Javonet.getType("String")).invoke("MyGenericMethod", "sample");

        // invoke generic method with two types
        Integer response2 = genSample.generic(Javonet.getType("String"), Javonet.getType("Int32")).invoke("MyGenericMethodWithTwoTypes", "sample");

        // write response to console
        System.out.println(response1);
        System.out.println(response2);

        // </TestResources_GenericMethods>
        Assertions.assertEquals("sample", response1);
        Assertions.assertEquals(0, response2);
    }



}
