import com.javonet.Javonet;
import com.javonet.JavonetException;
import com.javonet.JavonetFramework;
import com.javonet.api.NObject;
import com.javonet.api.NType;
import com.javonet.api.keywords.NOut;
import com.javonet.api.keywords.NRef;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.nio.file.Paths;
import java.util.concurrent.atomic.AtomicReference;

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
        String response = sampleType.invoke("SayHello", "Student");

        // write response to console
        System.out.println(response);
        // </TestResources_InvokeStaticMethod>
        Assertions.assertEquals("Hello Student", response);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_InvokeStaticMethod_Fluent() throws JavonetException {
        // <TestResources_InvokeStaticMethodFluent>
        // Todo: activate Javonet
        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // call static method
        String response = Javonet.getType("TestClass.TestClass").invoke("SayHello", "Student");

        // write response to console
        System.out.println(response);
        // </TestResources_InvokeStaticMethodFluent>
        Assertions.assertEquals("Hello Student", response);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_CreateInstanceAndInvokeMethod() throws JavonetException {
        // <TestResources_CreateInstanceAndInvokeMethod>
        // Todo: activate Javonet
        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // create instance
        NObject sampleObject = Javonet.New("TestClass.TestClass");

        // call instance method
        Integer response = sampleObject.invoke("MultiplyByTwo", 50);

        // write response to console
        System.out.println(response);
        // </TestResources_CreateInstanceAndInvokeMethod>
        Assertions.assertEquals(100, response);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_GetSetStaticField() throws JavonetException {
        // <TestResources_GetSetStaticField>
        // Todo: activate Javonet
        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // get .NET type
        NType sampleType = Javonet.getType("TestClass.TestClass");

        // set static field
        sampleType.set("MyStaticField", 10);

        // get static field
        Integer response = sampleType.get("MyStaticField");

        // write response to console
        System.out.println(response);
        // </TestResources_GetSetStaticField>
        Assertions.assertEquals(10, response);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_GetSetInstanceField() throws JavonetException {
        // <TestResources_GetSetInstanceField>
        // Todo: activate Javonet
        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // create instance
        NObject sampleObject = Javonet.New("TestClass.TestClass");

        // set instance field
        sampleObject.set("MyInstanceField", 11);

        // get static field
        Integer response = sampleObject.get("MyInstanceField");

        // write response to console
        System.out.println(response);
        // </TestResources_GetSetInstanceField>
        Assertions.assertEquals(11, response);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_GenericMethods() throws JavonetException {
        // <TestResources_GenericMethods>
        // Todo: activate Javonet

        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // create instance
        NObject sampleObject = Javonet.New("TestClass.TestClass");

        // invoke generic method with one type
        String response1 = sampleObject.generic(Javonet.getType("String")).invoke("MyGenericMethod", "sample");

        // invoke generic method with two types
        Integer response2 = sampleObject.generic(Javonet.getType("String"), Javonet.getType("Int32")).invoke("MyGenericMethodWithTwoTypes", "sample");

        // write response to console
        System.out.println(response1);
        System.out.println(response2);

        // </TestResources_GenericMethods>
        Assertions.assertEquals("sample", response1);
        Assertions.assertEquals(0, response2);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_ExtendClassAndWrapMethod() throws JavonetException {
        // <TestResources_ExtendClassAndWrapMethod>
        // Todo: activate Javonet

        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // create extended class instance
        ExtendedTestClass myExtendedTestClass = new ExtendedTestClass();

        // use method from this class
        Integer response = myExtendedTestClass.MultiplyByTwo(77);

        // write response to console
        System.out.println(response);
        // </TestResources_ExtendClassAndWrapMethod>
        Assertions.assertEquals(154, response);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_PassArgumentWithRefKeyword() throws JavonetException {
        // <TestResources_PassArgumentWithRefKeyword>
        // Todo: activate Javonet

        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");

        // create instance
        NObject sampleObject = Javonet.New("TestClass.TestClass");

        // wrap Java integer in AtomicReference to allow passing by reference
        AtomicReference<Integer> myInt = new AtomicReference<Integer>(10);

        // use method which expects reference type argument
        sampleObject.invoke("MethodWithRefArg", new NRef(myInt));

        // write response to console
        System.out.println(myInt.get());
        // </TestResources_PassArgumentWithRefKeyword>
        Assertions.assertEquals(54, myInt.get());
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
    public void Test_StandardLibrary_GetStaticField() throws JavonetException {
        // <StandardLibrary_GetStaticField>
        // Todo: activate Javonet

        // get .NET DateTime class
        NType dateTimeClass = Javonet.getType("System.DateTime");

        // get datetime field
        NObject nowDateObj = dateTimeClass.get("Now");

        // invoke .NET method to get string
        String response = nowDateObj.invoke("ToString");

        // write response to console
        System.out.println(response);
        // </StandardLibrary_GetStaticField>
    }

    @Test
    @Tag("integration")
    public void Test_StandardLibrary_CreateInstanceOfGenericObject() throws JavonetException {
        // <StandardLibrary_CreateInstanceOfGenericObject>

        // how to create instance of .NET generic class Dictionary<String,List<String>>
        // Todo: activate Javonet

        // initialize List <String> type
        NType typeList = Javonet.getType("List`1", "String");

        // get String type
        NType typeString = Javonet.getType("String");

        // initialize Dictionary<String,List<String>> type
        NType type = Javonet.getType("Dictionary`2", typeString, typeList);

        // create instance of generic Dictionary
        NObject newDict = type.create();

        // create instance of generic List
        NObject newList = typeList.create();

        // add items to generic list
        newList.invoke("Add", "a");
        newList.invoke("Add", "b");

        // add items to generic Dictionary passing string as key and generic List as value
        newDict.invoke("Add", "List1", newList);
        newDict.invoke("Add", "List2", newList);

        // Retrieve dictionary item by string key
        NObject result = newDict.getIndex("List1");

        // Display second item from generic List retrieved from dictionary
        System.out.println((String) result.getIndex(1)); //displays "b"
        // </StandardLibrary_CreateInstanceOfGenericObject>
    }

    @Test
    @Tag("integration")
    public void Test_StandardLibrary_PassReferenceTypeArgument() throws JavonetException {
        // <StandardLibrary_PassReferenceTypeArgument>
        // Todo: activate Javonet

        //  “Now” field gets a value from DateTime
        NObject nowDateObj = Javonet.getType("DateTime").get("Now");

        // create a new DateTime value, passing a date of 1980-01-01 as constructor arguments
        NObject date = Javonet.New("DateTime", 1980, 1, 1);

        // subtract two dates
        // The datesDiff variable will store an instance of the TimeSpan object,
        // that holds the difference between now and 1980-01-01
        NObject datesDiff = nowDateObj.invoke("Subtract", date);

        // write response to console
        String result = datesDiff.invoke("ToString");
        System.out.println(result);
        // </StandardLibrary_PassReferenceTypeArgument>
    }

    @Test
    @Tag("integration")
    public void Test_StandardLibrary_PassArgumentWithOutKeyword() throws JavonetException {
        // <StandardLibrary_PassArgumentWithOutKeyword>
        // Todo: activate Javonet

        String strNumber = "4";
        AtomicReference<Integer> myInt = new AtomicReference<Integer>();

        //NOut constructor with argument type is used because myInt has NULL value. Without specifying explicitly
        //argument type .NET would not be able to locate proper method to execute.
        if (Javonet.getType("Int32").invoke("TryParse", strNumber, new NOut(myInt, "System.Int32"))) {
            System.out.println(myInt.get());
        }
        // </StandardLibrary_PassArgumentWithOutKeyword>
        Assertions.assertEquals(4, myInt.get());
    }
}
