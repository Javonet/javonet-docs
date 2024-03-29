package test;

import com.javonet.*;
import com.javonet.api.*;
import com.javonet.api.keywords.NOut;
import com.javonet.api.keywords.NRef;
import org.junit.jupiter.api.*;
import utils.ExtendedTestClass;
import utils.MyEventListener;

import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.atomic.AtomicReference;

import static utils.ActivationCredentials.yourEmail;
import static utils.ActivationCredentials.yourLicenseKey;
import static utils.Constants.resourcesDirectory;

public class integrationTests {

    // <AddEmbeddedDllReference>
    static void AddEmbeddedDllReference(String fileName) throws IOException, JavonetException {
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        InputStream input = classLoader.getResourceAsStream(fileName);
        byte[] dllBytes = new byte[input.available()];
        input.read(dllBytes);

        Javonet.addReference(fileName, dllBytes);
    }
    // </AddEmbeddedDllReference>

    @BeforeAll
    public static void initialization() throws JavonetException {
        // activate Javonet
        Javonet.activate(yourEmail, yourLicenseKey, JavonetFramework.v45);
        // add reference to library
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");
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
    public void Test_HandlingActivationIssues() throws JavonetException, IOException {
        // <HandlingActivationIssues>
        Javonet.addActivationStateListener(new JavonetActivationStateListener() {
            @Override
            public void activationStateUpdated(JavonetActivationState arg0, String arg1) {
                System.out.println("Notification Received: " + arg0.name() + " : " + arg1);
            }
        });
        // </HandlingActivationIssues>
    }

    @Test
    @Tag("integration")
    public void Test_AccessNetAppConfigFile() throws JavonetException, IOException {
        // <AccessNetAppConfigFile>
        Javonet.activate("your@mail.com", "your-license-key", JavonetFramework.v40);

        String configFilePath = new File(".").getCanonicalPath() + "\\app.config";
        Javonet.getType("AppDomain").getRef("CurrentDomain").invoke("SetData", "APP_CONFIG_FILE", configFilePath);
        // Todo: Your Javonet powered application code
        // </AccessNetAppConfigFile>
    }

    @Test
    @Tag("integration")
    public void Test_UseJavonetHardwareDongle() throws JavonetException, IOException {
        // <UseJavonetHardwareDongle>
        // javonet.lic file should not exist
        File f = new File("javonet.lic");
        Assertions.assertFalse(f.exists());

        // use hardware dongle
        Javonet.setUseHardwareKey(true);
        Javonet.activate("your@mail.com", "your-javonet-license-key", JavonetFramework.v45);

        // javonet.lic file should exist
        f = new File("javonet.lic");
        Assertions.assertTrue(f.exists());

        // Todo: Your Javonet powered application code
        // </UseJavonetHardwareDongle>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_HandlingExceptions() throws JavonetException, IOException {
        // <TestResources_HandlingExceptions>
        try {
            // Todo: activate Javonet and add reference to .NET library

            // get .NET type
            NType sampleType = Javonet.getType("TestNamespace.TestClass");

            // call static method
            String response = sampleType.invoke("SayHello", 12.34);
        } catch (JavonetException jex) {
            // Todo: your exception handling code
            System.out.println(jex.toString());

            // expected output:
            // com.javonet.api.NException: Static method 'SayHello(Double)' on class 'TestClass'
            // from assembly 'TestClass, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null' was not found.
            //
            // Available methods are:
            // System.String SayHello(System.String)
            // Int32 get_MyStaticField()
            // Void set_MyStaticField(Int32)
            // Boolean Equals(System.Object, System.Object)
            // Boolean ReferenceEquals(System.Object, System.Object)
        }
        // </TestResources_HandlingExceptions>
    }

    @Test
    @Tag("integration")
    @Disabled("add reference can be called on once. This test spoil another tests")
    public void Test_TestResources_AddReference() throws JavonetException {
        // <TestResources_AddReference>
        // Todo: activate Javonet
        // add reference to library
        Javonet.addReference("System.Windows.Forms", "System.Drawing");
        Javonet.addReference(resourcesDirectory + "\\TestClass.dll");
        // </TestResources_AddReference>
    }

    @Test
    @Tag("integration")
    @Disabled("add reference can be called on once. This test spoil another tests")
    public void Test_TestResources_AddReferenceMemoryStream() throws JavonetException, IOException {
        // <TestResources_AddReferenceMemoryStream>
        // Todo: activate Javonet

        // create Byte array from DLL
        Path path = Paths.get(resourcesDirectory + "\\TestClass.dll");
        byte[] data = Files.readAllBytes(path);

        // add reference to library
        Javonet.addReference("CustomName.dll", data);
        // </TestResources_AddReferenceMemoryStream>
    }

    @Test
    @Tag("integration")
    @Disabled("add reference can be called on once. This test spoil another tests")
    public void Test_TestResources_AddReferenceMemoryStream2() throws JavonetException, IOException {
        // <TestResources_AddReferenceMemoryStream2>
        // Todo: activate Javonet

        AddEmbeddedDllReference(resourcesDirectory + "\\TestClass.dll");
        // </TestResources_AddReferenceMemoryStream2>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_InvokeStaticMethod() throws JavonetException {
        // <TestResources_InvokeStaticMethod>
        // Todo: activate Javonet and add reference to .NET library

        // get .NET type
        NType sampleType = Javonet.getType("TestNamespace.TestClass");

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
        // Todo: activate Javonet and add reference to .NET library

        // call static method
        String response = Javonet.getType("TestNamespace.TestClass").invoke("SayHello", "Student");

        // write response to console
        System.out.println(response);
        // </TestResources_InvokeStaticMethodFluent>
        Assertions.assertEquals("Hello Student", response);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_CreateInstanceAndInvokeMethod() throws JavonetException {
        // <TestResources_CreateInstanceAndInvokeMethod>
        // Todo: activate Javonet and add reference to .NET library

        // create instance
        NObject sampleObject = Javonet.New("TestNamespace.TestClass");

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
        // Todo: activate Javonet and add reference to .NET library

        // get .NET type
        NType sampleType = Javonet.getType("TestNamespace.TestClass");

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
        // Todo: activate Javonet and add reference to .NET library

        // create instance
        NObject sampleObject = Javonet.New("TestNamespace.TestClass");

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
        // Todo: activate Javonet and add reference to .NET library

        // create instance
        NObject sampleObject = Javonet.New("TestNamespace.TestClass");

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
        // Todo: activate Javonet and add reference to .NET library

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
        // Todo: activate Javonet and add reference to .NET library

        // create instance
        NObject sampleObject = Javonet.New("TestNamespace.TestClass");

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
    public void Test_TestResources_PassArgumentWithOutKeyword() throws JavonetException {
        // <TestResources_PassArgumentWithOutKeyword>
        // Todo: activate Javonet and add reference to .NET library

        NObject populator = Javonet.New("TestNamespace.PopulateItems");

        //Wrap null Java array in atomic reference to pass the reference as out argument
        AtomicReference<NObject[]> items = new AtomicReference<NObject[]>(null);

        populator.invoke("Populate", new NOut(items, "TestNamespace.Item[]"));

        // write response to console
        for (NObject element : items.get()) {
            System.out.println((String) element.get("ItemName"));
        }
        //expected output:
        //Item 0
        //Item 1
        //Item 2
        //Item 3
        //Item 4
        // </TestResources_PassArgumentWithOutKeyword>
        Assertions.assertEquals("Item 4", items.get()[4].get("ItemName"));
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_PassTypeAsMethodArgument() throws JavonetException {
        // <TestResources_PassTypeAsMethodArgument>
        // Todo: activate Javonet and add reference to .NET library

        // create instance
        NObject sampleObject = Javonet.New("TestNamespace.TestClass");

        // create NType
        NType typeOfString = Javonet.getType("String");

        // invoke method with argument of type Type
        String response = sampleObject.invoke("PassTypeArg", typeOfString);

        // write response to console
        System.out.println(response);
        // expected output:
        // System.String
        // </TestResources_PassTypeAsMethodArgument>
        Assertions.assertEquals("System.String", response);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_CallOverloadedMethodPassingNullArg() throws JavonetException {
        // <TestResources_CallOverloadedMethodPassingNullArg>
        // Todo: activate Javonet and add reference to .NET library

        // create instance
        NObject sampleObject = Javonet.New("TestNamespace.TestClass2");

        // call MethodA with String argument passing null
        String response = sampleObject.invoke("MethodA", new NNull("String"));

        // call MethodA with generic int? argument
        String response2 = sampleObject.invoke("MethodA", new NNull("System.Nullable`[System.Int32]"));

        // write response to console
        System.out.println(response);
        System.out.println(response2);
        // expected output:
        // System.String
        // </TestResources_CallOverloadedMethodPassingNullArg>
        Assertions.assertEquals("Method with String argument called", response);
        Assertions.assertEquals("Method with nullable int argument called", response2);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_UseNestedTypes() throws JavonetException {
        // <TestResources_UseNestedTypes>
        // Todo: activate Javonet and add reference to .NET library

        // create instance
        NObject sampleObject = Javonet.New("TestNamespace.TestClass");

        //Getting nested type
        NType nestedTypeObj = Javonet.getType("TestNamespace.Container+Nested");

        //Creating instance of nested type
        NObject nestedTypeInstanceObj = Javonet.New("TestNamespace.Container+Nested");

        //Passing nested type as method argument
        sampleObject.invoke("PassTypeArg", nestedTypeObj);

        //Creating generic object with nested type as generic argument
        NObject genList = Javonet.getType("List`1", nestedTypeObj).create();

        //Calling generic method with nested type as generic argument
        sampleObject.generic(nestedTypeObj).invoke("MyGenericMethod", nestedTypeInstanceObj);
        // </TestResources_UseNestedTypes>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_UseEnumType() throws JavonetException {
        // <TestResources_UseEnumType>
        // Todo: activate Javonet and add reference to .NET library

        // create instance of enum value
        NEnum sampleEnumValueOne = new NEnum("SampleEnum", "ValueOne");

        // get value name
        String response = sampleEnumValueOne.getValueName();

        // get enum value
        Integer response2 = sampleEnumValueOne.getValue();

        // write response to console
        System.out.println(response);
        System.out.println(response2);
        // </TestResources_UseEnumType>
        Assertions.assertEquals("ValueOne", response);
        Assertions.assertEquals(0, response2);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_UseEnumTypeAsArgument() throws JavonetException {
        // <TestResources_UseEnumTypeAsArgument>
        // Todo: activate Javonet and add reference to .NET library

        // create instance
        NObject sampleObject = Javonet.New("TestNamespace.TestClass");

        // create instance of enum value
        NEnum sampleEnumValueOne = new NEnum("SampleEnum", "ValueTwo");

        // invoke method with enum argument
        String response = sampleObject.invoke("MethodWithEnumArg", sampleEnumValueOne);

        // write response to console
        System.out.println(response);
        // </TestResources_UseEnumTypeAsArgument>
        Assertions.assertEquals("ValueTwo", response);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Arrays_ValueTypeAndReferenceType() throws JavonetException {
        // <TestResources_Arrays_ValueTypeAndReferenceType>
        // Todo: activate Javonet and add reference to .NET library

        // retrieve array of strings
        NObject sampleObj = Javonet.New("TestNamespace.ArrayTestClass");
        String[] items = sampleObj.invoke("GetItems");
        System.out.println("Java: Displaying array values");
        for (int i=0; i<items.length;i++)
        {
            System.out.println(items[i]);
        }

        // pass array of strings
        String[] stringArray = new String[] {"Item1","Item2","Item3"};
        sampleObj.invoke("DisplayArray",new Object[] {stringArray});

        // retrieve array of .NET objects
        NObject[] refArray = sampleObj.invoke("GetRefItems");

        System.out.println("Java: Displaying array of .NET objects' item names");
        for (NObject element : refArray)
        {
            System.out.println((String)element.get("ItemName"));
        }

        // pass array of .NET objects
        sampleObj.invoke("DisplayArray",new Object[] {refArray});

        // expected output:
        //Java: Displaying array values
        //item1
        //item2
        //item3
        //.NET: Displaying value-typed array
        //Item1
        //Item2
        //Item3
        //Java: Displaying array of .NET objects' item names
        //Item1
        //Item2
        //Item3
        //.NET: Displaying ref-typed array
        //Item1
        //Item2
        //Item3
        // </TestResources_Arrays_ValueTypeAndReferenceType>
        Assertions.assertArrayEquals(new String[] {"item1", "item2", "item3"}, items);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Arrays_GetIntArray() throws JavonetException {
        // <TestResources_Arrays_GetIntArray>
        // Todo: activate Javonet and add reference to .NET library

        NObject arrayService = Javonet.New("TestNamespace.ArrayService");

        Integer[] intArray = arrayService.invoke("GetIntArray");

        System.out.format("[Java] Contents of primitive-type array: %n");

        for (int intVal : intArray) {
            System.out.print(intVal + "\t");
        }
        // expected output
        // [Java] Contents of primitive-type array:
        // 1    2   3   4
        // </TestResources_Arrays_GetIntArray>
        Assertions.assertArrayEquals(new Integer[]{1, 2, 3, 4}, intArray);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Arrays_GetCustomObjectArray() throws JavonetException {
        // <TestResources_Arrays_GetCustomObjectArray>
        // Todo: activate Javonet and add reference to .NET library

        NObject arrayService = Javonet.New("TestNamespace.ArrayService");
        NObject[] coArray = arrayService.invoke("GetCustomObjectArray");

        System.out.format("[Java] Contents of reference-type array: %n");
        for (NObject co : coArray) {
            System.out.format("%s[%d]  ", co.get("Name"), co.get("Value"));
        }
        // expected output:
        // [Java] Contents of reference-type array:
        // A[1]  B[2]  C[3]
        // </TestResources_Arrays_GetCustomObjectArray>
        Assertions.assertEquals(3, coArray.length);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Arrays_GetArrayOfIntArrays() throws JavonetException {
        // <TestResources_Arrays_GetArrayOfIntArrays>
        // Todo: activate Javonet and add reference to .NET library

        NObject arrayService = Javonet.New("TestNamespace.ArrayService");
        NObject[] arrayOfIntArrays = arrayService.invoke("GetArrayOfIntArrays");

        System.out.format("[Java] Contents of primitive-type array of arrays: %n");

        for (NObject intArray : arrayOfIntArrays) {
            for (int i = 0; i < intArray.<Integer>get("Length"); i++) {
                System.out.format("%s ", intArray.<Integer>getIndex(i));
            }
            System.out.println();
        }
        // expected output:
        // [Java] Contents of primitive-type array of arrays:
        // 1 2 3 4
        // 11 22 33 44
        // </TestResources_Arrays_GetArrayOfIntArrays>
        Assertions.assertEquals(2, arrayOfIntArrays.length);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Arrays_GetArrayOfCustomObjectArrays() throws JavonetException {
        // <TestResources_Arrays_GetArrayOfCustomObjectArrays>
        // Todo: activate Javonet and add reference to .NET library

        NObject arrayService = Javonet.New("TestNamespace.ArrayService");
        NObject[] arrayOfCOArrays = arrayService.invoke("GetArrayOfCustomObjectArrays");

        System.out.format("[Java] Contents of reference-type array of arrays: %n");

        for (NObject coArray : arrayOfCOArrays) {
            for (int i = 0; i < coArray.<Integer>get("Length"); i++) {
                NObject co = coArray.getIndex(i);
                System.out.format("%s[%d] ", co.get("Name"), co.get("Value"));
            }
            System.out.println();
        }
        // expected output:
        // [Java] Contents of reference-type array of arrays:
        // A1[1] A2[2] A3[3]
        // B1[1] B2[2] B3[3]
        // </TestResources_Arrays_GetArrayOfCustomObjectArrays>
        Assertions.assertEquals(2, arrayOfCOArrays.length);
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Arrays_UseIntArray() throws JavonetException {
        // <TestResources_Arrays_UseIntArray>
        // Todo: activate Javonet and add reference to .NET library

        NObject arrayService = Javonet.New("TestNamespace.ArrayService");
        Integer[] intArray = {1, 2, 3, 4};
        arrayService.invoke("UseIntArray", new Object[]{intArray});
        // expected output:
        // [.NET] Contents of primitive-type array:
        // 1 2 3 4
        // </TestResources_Arrays_UseIntArray>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Arrays_UseCustomObjectArray() throws JavonetException {
        // <TestResources_Arrays_UseCustomObjectArray>
        // Todo: activate Javonet and add reference to .NET library

        NObject arrayService = Javonet.New("TestNamespace.ArrayService");
        NObject[] cuArray = {Javonet.New("CustomObject", "D", 1), Javonet.New("CustomObject", "E", 2)};
        arrayService.invoke("UseCustomObjectArray", new Object[]{cuArray});
        // expected output:
        // [.NET] Contents of the reference-type array:
        // D[1] E[2]
        // </TestResources_Arrays_UseCustomObjectArray>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Collections_GetSet() throws JavonetException {
        // <TestResources_Collections_GetSet>
        // Todo: activate Javonet and add reference to .NET library

        NObject collectionService = Javonet.New("TestNamespace.CollectionService");
        NObject list = collectionService.invoke("GetSet");

        // check size
        System.out.format("[Java] Set size: %d%n", list.<Integer>get("Count"));

        // iterate over contents
        System.out.format("[Java] Set contents:%n");

        NObject enumerator = list.invoke("GetEnumerator");

        while (enumerator.<Boolean>invoke("MoveNext")) {
            String current = enumerator.get("Current");
            System.out.format("%s  ", current);
        }
        // expected output:
        // [Java] Set size: 5
        // [Java] Set contents:
        // strings  in  set  from  .NET
        // </TestResources_Collections_GetSet>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Collections_GetList() throws JavonetException {
        // <TestResources_Collections_GetList>
        // Todo: activate Javonet and add reference to .NET library

        NObject collectionService = Javonet.New("TestNamespace.CollectionService");

        NObject list = collectionService.invoke("GetList");

        // check size
        System.out.format("[Java] List size: %d%n", list.<Integer>get("Count"));

        // get arbitrary value assigned to given key
        System.out.format("[Java] Second element: %s%n", list.<String>getIndex(1));

        // iterate over contents
        System.out.format("[Java] List contents:%n");

        NObject enumerator = list.invoke("GetEnumerator");

        while (enumerator.<Boolean>invoke("MoveNext")) {
            String current = enumerator.get("Current");
            System.out.format("%s  ", current);
        }
        // expected output:
        // [Java] List size: 5
        // [Java] Second element: in
        // [Java] List contents:
        // strings  in  list  from  .NET
        // </TestResources_Collections_GetList>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Collections_GetDictionary() throws JavonetException {
        // <TestResources_Collections_GetDictionary>
        // Todo: activate Javonet and add reference to .NET library

        NObject collectionService = Javonet.New("TestNamespace.CollectionService");

        NObject dictionary = collectionService.invoke("GetDictionary");

        // check size
        System.out.format("[Java] Dictionary size: %d%n", dictionary.<Integer>get("Count"));

        // get arbitrary value assigned to given key
        System.out.format("[Java] Value for '%s' key: %s%n", "key1", dictionary.getIndex("key1"));

        // iterate over contents
        System.out.format("[Java] Dictionary contents:%n");

        NObject enumerator = dictionary.invoke("GetEnumerator");

        while (enumerator.<Boolean>invoke("MoveNext")) {
            NObject current = enumerator.get("Current");
            System.out.format("'%s' = '%s'%n", current.get("Key"), current.get("Value"));
        }
        // expected output:
        // [Java] Dictionary size: 3
        // [Java] Value for 'key1' key: value1
        // [Java] Dictionary contents:
        // 'key1' = 'value1'
        // 'key2' = 'value2'
        // 'key3' = 'value3'
        // </TestResources_Collections_GetDictionary>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Collections_UseList() throws JavonetException {
        // <TestResources_Collections_UseList>
        // Todo: activate Javonet and add reference to .NET library

        // get generic type with a single type-parameter
        NType listType = Javonet.getType("List`1", "String");

        // instantiate new object of that type
        NObject list = listType.create();

        // use object, to add dictionary entries
        list.invoke("Add", "Strings");
        list.invoke("Add", "in");
        list.invoke("Add", "the");
        list.invoke("Add", "list");
        list.invoke("Add", "from");
        list.invoke("Add", "Java");

        NObject collectionService = Javonet.New("TestNamespace.CollectionService");

        collectionService.invoke("UseList", list);
        // expected output:
        // [.NET] List contents:
        // Strings in the list from Java
        // </TestResources_Collections_UseList>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_Collections_UseDictionary() throws JavonetException {
        // <TestResources_Collections_UseDictionary>
        // Todo: activate Javonet and add reference to .NET library

        // get generic type with two type-parameters
        NType dictionaryType = Javonet.getType("Dictionary`2", "String", "String");

        // instantiate new object of that type
        NObject dictionary = dictionaryType.create();

        // use object, to add dictionary entries
        dictionary.invoke("Add", "key1", "value1");
        dictionary.invoke("Add", "key2", "value2");
        dictionary.invoke("Add", "key3", "value3");

        NObject collectionService = Javonet.New("TestNamespace.CollectionService");

        collectionService.invoke("UseDictionary", dictionary);
        // expected output:
        // [.NET] Dictionary contents:
        // 'key1' = 'value1';  'key2' = 'value2';  'key3' = 'value3';
        // </TestResources_Collections_UseDictionary>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_SubscribeToEvent() throws JavonetException {
        // <TestResources_SubscribeToEvent>
        // Todo: activate Javonet and add reference to .NET library

        NObject sampleObj = Javonet.New("TestNamespace.EventExample");
        sampleObj.addEventListener("SampleEvent", new INEventListener() {
            public void eventOccurred(Object[] arguments) {
                System.out.println(arguments[1]);
            }
        });
        sampleObj.invoke("EventInvoke");
        // </TestResources_SubscribeToEvent>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_DisposeObject() throws JavonetException {
        // <TestResources_DisposeObject>
        // Todo: activate Javonet and add reference to .NET library

        // create instance
        NObject sampleObject = Javonet.New("TestNamespace.TestClass");

        // some operations with object
        sampleObject.set("MyInstanceField", 22);

        //Clearing the object reference so it will be removed by garbage collector
        sampleObject = null;
        // </TestResources_DisposeObject>
    }

    @Test
    @Tag("integration")
    public void Test_TestResources_BatchingGC() throws JavonetException {
        // <TestResources_BatchingGC>
        // Todo: activate Javonet and add reference to .NET library

        DelayGcContext.Begin();
        for (int i = 0; i < 5000000; i++) {
            NObject objA = Javonet.New("SampleType", i);
            NObject objB = objA.get("B");

            //processItem(objB);
            //(... some other operations ...)
            NObject objC = objB.getRef("subProp").getRef("subProp").invoke("GetC");

            //in this block objA, objB, and objC instance if not referenced in other parts of code
            //will be subjected for garbage collection after each iteration of the loop
        }
        DelayGcContext.End();
        // </TestResources_BatchingGC>
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

    @Test
    @Tag("integration")
    public void Test_StandardLibrary_SubscribeToEvent() throws JavonetException {
        // <StandardLibrary_SubscribeToEvent>
        // Todo: activate Javonet

        Javonet.addReference("System.Windows.Forms.dll");

        NObject button = Javonet.New("System.Windows.Forms.Button");
        button.set("Text", "Click me!");

        button.addEventListener("Click", new INEventListener() {
            public void eventOccurred(Object[] arguments) {
                System.out.println(".NET event occurred");
            }
        });
        // </StandardLibrary_SubscribeToEvent>
    }

    @Test
    @Tag("integration")
    public void Test_StandardLibrary_SubscribeToEvent2() throws JavonetException {
        // <StandardLibrary_SubscribeToEvent2>
        // Todo: activate Javonet

        Javonet.addReference("System.Windows.Forms.dll");

        NObject button = Javonet.New("System.Windows.Forms.Button");
        button.set("Text", "Click me!");

        MyEventListener listener = new MyEventListener();
        button.addEventListener("Click", listener);
        // </StandardLibrary_SubscribeToEvent2>
    }

    @Test
    @Tag("integration")
    public void Test_StandardLibrary_EmbedNetUserControl() throws JavonetException {
        // <StandardLibrary_EmbedNetUserControl1>
        // Todo: activate Javonet

        //  create new instance of your WPF control
        NObject userControl = Javonet.New("Javonet.WpfUserControlSample.UserControl1");
        // wrap the control with NControlContainer
        NControlContainer dotNetUserControl = new NControlContainer(userControl);

        // create your layout
        JPanel panel = new JPanel();

        // add wrapper to your layout
        panel.add(dotNetUserControl, BorderLayout.EAST);
        //this.add(panel, BorderLayout.CENTER);
        // </StandardLibrary_EmbedNetUserControl1>
        // <StandardLibrary_EmbedNetUserControl2>
        userControl.addEventListener("ButtonClicked", new NEventListener() {
            public void eventOccurred(Object[] arguments) {
                //do the event handler work
            }
        });
        // </StandardLibrary_EmbedNetUserControl2>
        // <StandardLibrary_EmbedNetUserControl3>
        dotNetUserControl.setPreferredSize(new Dimension(200, 300));
        dotNetUserControl.revalidate();
        // </StandardLibrary_EmbedNetUserControl3>
    }
}
