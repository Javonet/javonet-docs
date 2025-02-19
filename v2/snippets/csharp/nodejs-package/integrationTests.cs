using Javonet.Netcore.Sdk.Tests.Utils;
using Javonet.Netcore.Utils;
using Xunit;
using Xunit.Abstractions;

namespace Javonet.Netcore.Sdk.Tests.nodejspackage
{
    public class integrationTests
    {
        private readonly ITestOutputHelper output;
        //this constructor is called only once, before first test
        public integrationTests(ITestOutputHelper output)
        {
            this.output = output;
            var result = Javonet.Activate(ActivationCredentials.yourLicenseKey);
            Assert.Equal(0, result);
        }
        private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/nodejs-package";

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_StandardLibrary_CreateRuntimeContext()
        {
            // <StandardLibrary_CreateRuntimeContext>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // use calledRuntime to interact with code from other technology
            // </StandardLibrary_CreateRuntimeContext>
            Assert.NotNull(calledRuntime);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_StandardLibrary_CreateInvocationContext()
        {
            // <StandardLibrary_CreateInvocationContext>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // construct an invocation context - this invocationContext in non-materialized 
            var invocationContext = calledRuntime.GetType("Math").
                InvokeStaticMethod("abs", -50);

            // execute invocation context - this will materialize the invocationContext
            var response = invocationContext.Execute();
            // </StandardLibrary_CreateInvocationContext>
            Assert.NotNull(response);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_StandardLibrary_GetValue()
        {
            // <StandardLibrary_GetValue>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // construct an invocation context - this invocationContext in non-materialized 
            var invocationContext = calledRuntime.GetType("Math").
                InvokeStaticMethod("abs", -50);

            // execute invocation context - this will materialize the invocationContext
            var response = invocationContext.Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </StandardLibrary_GetValue>
            Assert.Equal(50, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50()
        {
            // <StandardLibrary_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType("Math").Execute();

            // invoke type's static method
            var response = calledRuntimeType.InvokeStaticMethod("abs", -50).Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </StandardLibrary_InvokeStaticMethod>
            Assert.Equal(50, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_StandardLibrary_GetStaticField_MathPI_PI()
        {
            // <StandardLibrary_GetStaticField>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType("Math").Execute();

            // get type's static field
            var response = calledRuntimeType.GetStaticField("PI").Execute();

            // get value from response
            var result = (double)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </StandardLibrary_GetStaticField>
            Assert.Equal(System.Math.PI, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_StandardLibrary_InvokeInstanceMethod()
        {
            // <StandardLibrary_InvokeInstanceMethod>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType("Date").Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance(2024, 2, 3).Execute();

            // invoke type's static method
            var response = instance.InvokeInstanceMethod("getFullYear").Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </StandardLibrary_InvokeInstanceMethod>
            Assert.Equal(2024, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_StandardLibrary_GetInstanceField()
        {
            // <StandardLibrary_GetInstanceField>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType("Set").Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // get instance's field 
            var response = instance.GetInstanceField("size").Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </StandardLibrary_GetInstanceField>
            Assert.Equal(0, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_LoadLibrary_LibraryPath_NoExeption()
        {
            // <TestResources_LoadLibrary>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);
            // </TestResources_LoadLibrary>
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
        {
            // <TestResources_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // invoke type's static method
            var response = calledRuntimeType.InvokeStaticMethod("multiplyByTwo", 25).Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_InvokeStaticMethod>
            Assert.Equal(50, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_GetStaticField_StaticValue_3()
        {
            // <TestResources_GetStaticField>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // get type's static field
            var response = calledRuntimeType.GetStaticField("staticValue").Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_GetStaticField>
            Assert.Equal(3, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_SetStaticField_StaticValue_75()
        {
            // <TestResources_SetStaticField>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // set static field's value
            calledRuntimeType.SetStaticField("staticValue", 75).Execute();

            // get type's static field
            var response = calledRuntimeType.GetStaticField("staticValue").Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_SetStaticField>
            calledRuntimeType.SetStaticField("staticValue", 3).Execute();
            Assert.Equal(75, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
        {
            // <TestResources_InvokeInstanceMethod>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var response = instance.InvokeInstanceMethod("multiplyTwoNumbers", 5, 4).Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_InvokeInstanceMethod>
            Assert.Equal(20, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_GetInstanceField_PublicValue_1()
        {
            // <TestResources_GetInstanceField>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance(18, 19).Execute();

            // get instance's field
            var response = instance.GetInstanceField("publicValue").Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_GetInstanceField>
            Assert.Equal(18, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_SetInstanceField_PublicValue_44()
        {
            // <TestResources_SetInstanceField>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the jvmRuntime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance(18, 19).Execute();

            // get instance's field
            instance.SetInstanceField("publicValue", 44).Execute();

            // get instance's field
            var response = instance.GetInstanceField("publicValue").Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_SetInstanceField>
            Assert.Equal(44, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_1DArray_GetIndex_2_StringThree()
        {
            // <TestResources_1DArray_GetIndex>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get1DArray").Execute();

            // get index from array
            var response = array.GetIndex(2).Execute();

            // get value from response
            var result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_1DArray_GetIndex>
            Assert.Equal("three", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_1DArray_GetSize_5()
        {
            // <TestResources_1DArray_GetSize>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get1DArray").Execute();

            // get array's size
            var response = array.GetSize().Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // <TestResources_1DArray_GetSize>
            Assert.Equal(5, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_1DArray_SetIndex_StringSeven()
        {
            // <TestResources_1DArray_SetIndex>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get1DArray").Execute();

            // set array's index
            array.SetIndex(4, "seven").Execute();

            // get index from array
            var response = array.GetIndex(4).Execute();

            // get value from response
            var result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // <TestResources_1DArray_SetIndex>
            array.SetIndex(4, "five").Execute();
            Assert.Equal("seven", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_1DArray_Iterate()
        {
            // <TestResources_1DArray_Iterate>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get1DArray").Execute();

            // get array's size
            int arraySize = (int)array.GetSize().Execute().GetValue();

            // create local array and store elements in it
            string[] arrayValues = new string[arraySize];
            int i = 0;
            foreach (var element in array)
            {
                arrayValues[i] = (string)element.Execute().GetValue();
                i++;
            }

            // write result to console
            System.Console.WriteLine(string.Join("\t", arrayValues));
            // </TestResources_1DArray_Iterate>
            Assert.Equal(new string[] { "one", "two", "three", "four", "five" }, arrayValues);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_1DArray_GetElement()
        {
            // <TestResources_1DArray_GetElement>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get1DArray").Execute();

            // get array's element
            var response = array[2].Execute();

            // get value from response
            var result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_1DArray_GetElement>
            Assert.Equal("three", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_1DArray_PassArrayAsArgument()
        {
            // <TestResources_1DArray_PassArrayAsArgument>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var response = instance.InvokeInstanceMethod("addArrayElementsAndMultiply", new double[] { 12.22, 98.22, -10.44 }, 9.99).Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // <TestResources_1DArray_PassArrayAsArgument>
            Assert.Equal(999, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_1DArray_RetrieveArray()
        {
            // <TestResources_1DArray_RetrieveArray>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var arrayReference = instance.InvokeInstanceMethod("get1DArray").Execute();

            // get value from array reference
            var result = (string[])arrayReference.RetrieveArray();

            // write result to console
            System.Console.WriteLine(string.Join("\t", result));
            // <TestResources_1DArray_RetrieveArray>
            Assert.Equal(new string[] { "one", "two", "three", "four", "five" }, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException()
        {
            // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // invoke type's static method which throws exception
            try
            {
                var response = calledRuntimeType.InvokeStaticMethod("divideBy", 10, 0).Execute();
            }
            catch (System.Exception e)
            {
                // write result to console
                System.Console.WriteLine(e.Message);
                return;
            }
            // </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
            Assert.Fail("No exception occurred - test failed");
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_2DArray_GetIndex()
        {
            // <TestResources_2DArray_GetIndex>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get2DArray").Execute();

            // three ways to get elements from array
            var response1 = array[1, 1].Execute();
            var response2 = array.GetIndex(1, 0).Execute();
            var response3 = array.GetIndex(new int[] { 0, 1 }).Execute();


            // get value from response
            var result1 = response1.GetValue();
            var result2 = response2.GetValue();
            var result3 = response3.GetValue();

            // write result to console
            System.Console.WriteLine(result1);
            System.Console.WriteLine(result2);
            System.Console.WriteLine(result3);
            // </TestResources_2DArray_GetIndex>
            Assert.Equal("S11", result1);
            Assert.Equal("S10", result2);
            Assert.Equal("S01", result3);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_2DArray_GetSizeAndRank()
        {
            // <TestResources_2DArray_GetSizeAndRank>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get2DArray").Execute();

            // three ways to get elements from array
            var response1 = array.GetSize().Execute();
            var response2 = array.GetRank().Execute();

            // get value from response
            var result1 = response1.GetValue();
            var result2 = response2.GetValue();

            // write result to console
            System.Console.WriteLine(result1);
            System.Console.WriteLine(result2);

            // </TestResources_2DArray_GetSizeAndRank>
            Assert.Equal(4, result1);
            Assert.Equal(2, result2);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_2DArray_SetIndex()
        {
            // <TestResources_2DArray_SetIndex>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get2DArray").Execute();

            // set element of array
            array.SetIndex(new int[] { 0, 1 }, "new value").Execute();

            // get element from array
            var response = array[0, 1].Execute();

            // get value from response
            var result = response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_2DArray_SetIndex>
            Assert.Equal("new value", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_PassingNullAsOnlyArg()
        {
            // <TestResources_PassingNullAsOnlyArg>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // invoke type's static method with null
            var response = calledRuntimeType.InvokeStaticMethod("passNull", null).Execute();

            // get value from response
            var result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_PassingNullAsOnlyArg>

            Assert.Equal("Method called with null", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_PassingNullAsSecondArg()
        {
            // <TestResources_PassingNullAsSecondArg>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // invoke type's static method with null as second argument
            var response = calledRuntimeType.InvokeStaticMethod("passNull2", 5, null).Execute();

            // get value from response
            var result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_PassingNullAsSecondArg>
            Assert.Equal("Method2 called with null", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_ReturningNull()
        {
            // <TestResources_ReturningNull>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // invoke type's static method that returns null
            var response = calledRuntimeType.InvokeStaticMethod("returnNull").Execute();

            // get value from response
            var result = response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_ReturningNull>
            Assert.Null(result);
        }

        //[Fact]
        //[Trait("Test", "Integration")]
        //public void Test_NodejsPackage_TestResources_Multithreading_InvokeInstanceMethod()
        //{
        //    // <TestResources_Multithreading_InvokeInstanceMethod>
        //    // use Activate only once in your app
        //    Javonet.Activate("your-license-key");

        //    // create called runtime context
        //    var calledRuntime = Javonet.InMemory().Nodejs();

        //    // set up variables
        //    string libraryPath = resourcesDirectory + "/TestClass.js";
        //    string className = "TestClass";

        //    // load custom library
        //    calledRuntime.LoadLibrary(libraryPath);

        //    // get type from the runtime
        //    var calledRuntimeType = calledRuntime.GetType(className).Execute();

        //    // create type's instance
        //    var instance = calledRuntimeType.CreateInstance().Execute();

        //    // create threads and dictionaries to store responses
        //    var threads = new System.Collections.Generic.List<System.Threading.Thread>();
        //    var responses = new System.Collections.Generic.Dictionary<int, int>();

        //    // create threads
        //    for (int i = 0; i < 5; i++)
        //    {
        //        int j = i;
        //        System.Threading.Thread thread = new System.Threading.Thread(() =>
        //        {
        //            var response = (int)instance.InvokeInstanceMethod("addTwoNumbers", j, 5).Execute().GetValue();
        //            responses[j] = response;
        //        });
        //        threads.Add(thread);
        //    }

        //    // start threads
        //    foreach (var thread in threads)
        //    {
        //        thread.Start();
        //    }

        //    // wait for threads to finish
        //    foreach (var thread in threads)
        //    {
        //        thread.Join();
        //    }

        //    // write results to console
        //    foreach (var response in responses)
        //    {
        //        System.Console.WriteLine(response.Value);
        //    }
        //    // </TestResources_Multithreading_InvokeInstanceMethod>
        //    foreach (var response in responses)
        //    {
        //        Assert.Equal(response.Key + 5, response.Value);
        //    }
        //}

        //[Fact]
        //[Trait("Test", "Integration")]
        //public void Test_NodejsPackage_TestResources_ExecuteAsync_AsyncMethod()
        //{
        //    // <TestResources_ExecuteAsync_AsyncMethod>
        //    // use Activate only once in your app
        //    Javonet.Activate("your-license-key");

        //    // create called runtime context
        //    var calledRuntime = Javonet.InMemory().Nodejs();

        //    // set up variables
        //    string libraryPath = resourcesDirectory + "/TestClass.js";
        //    string className = "TestClass";

        //    // load custom library
        //    calledRuntime.LoadLibrary(libraryPath);

        //    // measure time 
        //    var startTime = System.DateTime.Now;

        //    // get type from the runtime
        //    var calledRuntimeType = calledRuntime.GetType(className).Execute();

        //    // create type's instance
        //    var instance = calledRuntimeType.CreateInstance().Execute();

        //    //create file
        //    string fileName = System.Environment.GetFolderPath(System.Environment.SpecialFolder.UserProfile) + "/output.txt";
        //    System.IO.File.Create(fileName).Close();

        //    // invoke instance's method
        //    instance.InvokeInstanceMethod("writeToFile", fileName, " This is ").ExecuteAsync();
        //    instance.InvokeInstanceMethod("writeToFile", fileName, " file with ").ExecuteAsync();
        //    instance.InvokeInstanceMethod("writeToFile", fileName, " sample input ").ExecuteAsync();

        //    // wait for WriteToFile to finish
        //    System.Threading.Thread.Sleep(3000);

        //    // measure time
        //    var endTime = System.DateTime.Now;

        //    // write result to console
        //    System.Console.WriteLine("Time elapsed: " + (endTime - startTime).TotalMilliseconds);
        //    // </TestResources_ExecuteAsync_AsyncMethod>
        //    Assert.True((endTime - startTime).TotalMilliseconds < 4000);
        //}

        //[Fact]
        //[Trait("Test", "Integration")]
        //public void Test_NodejsPackage_TestResources_ExecuteAsync_SyncMethod()
        //{
        //    // <TestResources_ExecuteAsync_SyncMethod>
        //    // use Activate only once in your app
        //    Javonet.Activate("your-license-key");

        //    // create called runtime context
        //    var calledRuntime = Javonet.InMemory().Nodejs();

        //    // set up variables
        //    string libraryPath = resourcesDirectory + "/TestClass.js";
        //    string className = "TestClass";

        //    // load custom library
        //    calledRuntime.LoadLibrary(libraryPath);

        //    var startTime = System.DateTime.Now;
        //    // get type from the runtime
        //    var calledRuntimeType = calledRuntime.GetType(className).Execute();

        //    // create type's instance
        //    var instance = calledRuntimeType.CreateInstance().Execute();

        //    // invoke instance's method
        //    instance.InvokeInstanceMethod("addThreeNumbers", 11, 12, 13).ExecuteAsync();
        //    instance.InvokeInstanceMethod("addThreeNumbers", 21, 22, 23).ExecuteAsync();
        //    instance.InvokeInstanceMethod("addThreeNumbers", 31, 32, 33).ExecuteAsync();

        //    // sleep to wait for async methods to finish
        //    System.Threading.Thread.Sleep(3000);
        //    var endTime = System.DateTime.Now;

        //    // write result to console
        //    System.Console.WriteLine("Time elapsed: " + (endTime - startTime).TotalMilliseconds);
        //    // </TestResources_ExecuteAsync_SyncMethod>
        //    Assert.True((endTime - startTime).TotalMilliseconds < 4000);
        //}

        //[Fact]
        //[Trait("Test", "Integration")]
        //public async System.Threading.Tasks.Task Test_NodejsPackage_TestResources_ExecuteAsync_SyncMethod_Await()
        //{
        //    // <TestResources_ExecuteAsync_SyncMethod_Await>
        //    // use Activate only once in your app
        //    Javonet.Activate("your-license-key");

        //    // create called runtime context
        //    var calledRuntime = Javonet.InMemory().Nodejs();

        //    // set up variables
        //    string libraryPath = resourcesDirectory + "/TestClass.js";
        //    string className = "TestClass";

        //    // load custom library
        //    calledRuntime.LoadLibrary(libraryPath);

        //    var startTime = System.DateTime.Now;
        //    // get type from the runtime
        //    var calledRuntimeType = calledRuntime.GetType(className).Execute();

        //    // create type's instance
        //    var instance = calledRuntimeType.CreateInstance().Execute();

        //    // invoke instance's method
        //    var task1 = instance.InvokeInstanceMethod("addThreeNumbers", 11, 12, 13).ExecuteAsync();
        //    var task2 = instance.InvokeInstanceMethod("addThreeNumbers", 21, 22, 23).ExecuteAsync();
        //    var task3 = instance.InvokeInstanceMethod("addThreeNumbers", 31, 32, 33).ExecuteAsync();

        //    var responses = await System.Threading.Tasks.Task.WhenAll(task1, task2, task3);

        //    var result1 = (int)responses[0].GetValue();
        //    var result2 = (int)responses[1].GetValue();
        //    var result3 = (int)responses[2].GetValue();

        //    // sleep to wait for async methods to finish
        //    var endTime = System.DateTime.Now;

        //    //write result to console
        //    System.Console.WriteLine(result1);
        //    System.Console.WriteLine(result2);
        //    System.Console.WriteLine(result3);
        //    System.Console.WriteLine("Time elapsed: " + (endTime - startTime).TotalMilliseconds);
        //    // </TestResources_ExecuteAsync_SyncMethod_Await>
        //    Assert.Equal(36, result1);
        //    Assert.Equal(66, result2);
        //    Assert.Equal(96, result3);

        //    Assert.True((endTime - startTime).TotalMilliseconds < 4000);
        //}

        //[Fact]
        //[Trait("Test", "Integration")]
        //public void Test_NodejsPackage_TestResources_UseStaticMethodAsDelegate()
        //{
        //    // <TestResources_UseStaticMethodAsDelegate>
        //    // use Activate only once in your app
        //    Javonet.Activate("your-license-key");

        //    // create called runtime context
        //    var calledRuntime = Javonet.InMemory().Nodejs();

        //    // set up variables
        //    string libraryPath = resourcesDirectory + "/TestClass.js";
        //    string className = "TestClass";

        //    // load custom library
        //    calledRuntime.LoadLibrary(libraryPath);

        //    // get type from the runtime
        //    var calledRuntimeType = calledRuntime.GetType(className).Execute();

        //    // get static method as delegate
        //    var myFunc = calledRuntimeType.GetStaticMethodAsDelegate("divideBy").Execute();

        //    // create type's instance
        //    var instance = calledRuntimeType.CreateInstance().Execute();

        //    // invoke instance's method using the delegate
        //    var response = instance.InvokeInstanceMethod("useYourFunc", myFunc, 30, 6).Execute();

        //    // get value from response
        //    var result = (int)response.GetValue();

        //    // write result to console
        //    System.Console.WriteLine(result);
        //    // </TestResources_UseStaticMethodAsDelegate>
        //    Assert.Equal(5, result);
        //}

        //[Fact]
        //[Trait("Test", "Integration")]
        //public void Test_NodejsPackage_TestResources_UseInstanceMethodAsDelegate()
        //{
        //    // <TestResources_UseInstanceMethodAsDelegate>
        //    // use Activate only once in your app
        //    Javonet.Activate("your-license-key");

        //    // create called runtime context
        //    var calledRuntime = Javonet.InMemory().Nodejs();

        //    // set up variables
        //    string libraryPath = resourcesDirectory + "/TestClass.js";
        //    string className = "TestClass";

        //    // load custom library
        //    calledRuntime.LoadLibrary(libraryPath);

        //    // get type from the runtime
        //    var calledRuntimeType = calledRuntime.GetType(className).Execute();

        //    // create type's instance
        //    var instance = calledRuntimeType.CreateInstance().Execute();

        //    // get instance method as delegate
        //    var myFunc = instance.GetInstanceMethodAsDelegate("multiplyTwoNumbers").Execute();

        //    // invoke instance's method using the delegate
        //    var response = instance.InvokeInstanceMethod("useYourFunc", myFunc, 5, 6).Execute();

        //    // get value from response
        //    var result = (int)response.GetValue();

        //    // write result to console
        //    System.Console.WriteLine(result);
        //    // </TestResources_UseInstanceMethodAsDelegate>
        //    Assert.Equal(30, result);
        //}

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NodejsPackage_TestResources_InvokeGlobalFunction()
        {
            // <TestResources_InvokeGlobalFunction>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Nodejs();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.js";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // invoke global function
            var response = calledRuntime.InvokeGlobalFunction("welcome", "John").Execute();

            // get value from response
            var result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_InvokeGlobalFunction>
            Assert.Equal("Hello John!", result);
        }

    }
}