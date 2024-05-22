using Javonet.Netcore.Sdk.Internal;
using Javonet.Netcore.Sdk.Tests.Utils;
using Javonet.Netcore.Utils;
using Xunit;
using Xunit.Abstractions;

namespace Javonet.Netcore.Sdk.Tests.pythonpackage
{
    public class integrationTests
	{
		private readonly ITestOutputHelper output;
		// this constructor is called only once, before first test
		public integrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourLicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/python-package";

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_PythonPackage_StandardLibrary_CreateRuntimeContext()
        {
            //<StandardLibrary_CreateRuntimeContext>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // use calledRuntime to interact with code from other technology
            //</StandardLibrary_CreateRuntimeContext>
			Assert.NotNull(calledRuntime);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_PythonPackage_StandardLibrary_CreateInvocationContext()
        {
            //<StandardLibrary_CreateInvocationContext>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // construct an invocation context - this invocationContext in non-materialized 
            var invocationContext = calledRuntime.GetType("builtins").
                InvokeStaticMethod("abs", -50);

            // execute invocation context - this will materialize the invocationContext
            var response = invocationContext.Execute();
            //</StandardLibrary_CreateInvocationContext>
            Assert.NotNull(response);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_PythonPackage_StandardLibrary_GetValue()
        {
            // <StandardLibrary_GetValue>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // construct an invocation context - this invocationContext in non-materialized 
            var invocationContext = calledRuntime.GetType("builtins").
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
        public void Test_PythonPackage_StandardLibrary_GetStaticField()
        {
            // <StandardLibrary_GetStaticField>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType("math").Execute();

            // get type's static field
            var response = calledRuntimeType.GetStaticField("pi").Execute();

            // get value from response
            var result = (double)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </StandardLibrary_GetStaticField>
            Assert.Equal(System.Math.PI, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_PythonPackage_StandardLibrary_InvokeStaticMethod()
        {
            // <StandardLibrary_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType("builtins").Execute();

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
		public void Test_PythonPackage_TestResources_LoadLibrary()
		{
			// <TestResources_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_GetStaticField()
		{
			// <TestResources_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// get type's static field
			var response = calledRuntimeType.GetStaticField("static_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_SetStaticField()
		{
			// <TestResources_SetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// set static field's value
			calledRuntimeType.SetStaticField("static_value", 75).Execute();

			// get type's static field
			var response = calledRuntimeType.GetStaticField("static_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_SetStaticField>
			Javonet.InMemory().Python().GetType(className).SetStaticField("static_value", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_GetInstanceField()
		{
			// <TestResources_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(18, 19).Execute();

			// get instance's field
			var response = instance.GetInstanceField("public_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetInstanceField>
			Assert.Equal(18, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_SetInstanceField()
		{
			// <TestResources_SetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(18, 19).Execute();

			// set instance's field
			instance.SetInstanceField("public_value", 44).Execute();

			// get instance's field
			var response = instance.GetInstanceField("public_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_SetInstanceField>
			Assert.Equal(44, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_InvokeStaticMethod()
		{
			// <TestResources_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// invoke type's static method
			var response = calledRuntimeType.InvokeStaticMethod("multiply_by_two", 25).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_InvokeInstanceMethod()
		{
			// <TestResources_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();


			// create type's instance
			var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

			// invoke instance's method
			var response = instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_InvokeInstanceMethod>
			Assert.Equal(20, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_1DArray_GetIndex()
		{
			// <TestResources_1DArray_GetIndex>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("get_1d_array").Execute();

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
		public void Test_PythonPackage_TestResources_1DArray_GetSize()
		{
			// <TestResources_1DArray_GetSize>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("get_1d_array").Execute();

			// get array's size
			var response = array.GetSize().Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_GetSize>
			Assert.Equal(5, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_1DArray_SetIndex()
		{
			// <TestResources_1DArray_SetIndex>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("get_1d_array").Execute();

			// set array's index
			array.SetIndex(4, "seven").Execute();

			// get index from array
			var response = array.GetIndex(4).Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_SetIndex>
			array.SetIndex(4, "five").Execute();
			Assert.Equal("seven", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_1DArray_Iterate()
		{
			// <TestResources_1DArray_Iterate>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("get_1d_array").Execute();

			// get array's size
			int arraySize = (int)array.GetSize().Execute().GetValue();

			// create local array and store elements in it
			string[] arrayValues = new string[arraySize];
			int i = 0;
			foreach (var element in array)
			{
				arrayValues[i] = (string)element.InvokeInstanceMethod("upper").Execute().GetValue();
				i++;
			}

			// write result to console
			System.Console.WriteLine(string.Join("\t", arrayValues));
			// </TestResources_1DArray_Iterate>
			Assert.Equal(new string[] { "ONE", "TWO", "THREE", "FOUR", "FIVE" }, arrayValues);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_1DArray_GetElement()
		{
			// <TestResources_1DArray_GetElement>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("get_1d_array").Execute();

			// invoke method on array's element
			var response = array[2].InvokeInstanceMethod("upper").Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_GetElement>
			Assert.Equal("THREE", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_1DArray_PassArrayAsArgument()
		{
			// <TestResources_1DArray_PassArrayAsArgument>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

			// invoke instance's method
			var response = instance.InvokeInstanceMethod("add_array_elements_and_multiply", new double[] { 12.22, 98.22, -10.44 }, 9.99).Execute();

			// get value from response
			var result = (double)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_PassArrayAsArgument>
			Assert.Equal(999.0, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_PythonPackage_TestResources_1DArray_RetrieveArray()
		{
			// <TestResources_1DArray_RetrieveArray>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Python();

			// set up variables
			string libraryPath = resourcesDirectory;
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

			// invoke instance's method
			var arrayReference = instance.InvokeInstanceMethod("get_1d_array").Execute();

			// get value from array reference
			var result = (string[])arrayReference.RetrieveArray();

			// write result to console
			System.Console.WriteLine(string.Join("\t", result));
			// </TestResources_1DArray_RetrieveArray>
			Assert.Equal(new string[] { "one", "two", "three", "four", "five" }, result);
		}

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_PythonPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException()
        {
            // <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // set up variables
            string libraryPath = resourcesDirectory;
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // invoke type's static method which throws exception
            try
            {
                var response = calledRuntimeType.InvokeStaticMethod("divide_by", 10, 0).Execute();
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
        public void Test_PythonPackage_TestResources_EnumAddToList()
        {
            // <TestResources_EnumAddToList>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // set up variables
            string libraryPath = resourcesDirectory;
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className);

            //create enum items
            var apple = calledRuntime.GetEnumItem(calledRuntimeType, "Fruit", "Apple");
            var mango = calledRuntime.GetEnumItem(calledRuntimeType, "Fruit", "Mango");

            // create fruits array
            InvocationContext[] fruitsList = { apple, mango };

            // invoke type's static method
            var response = calledRuntimeType.
                           InvokeStaticMethod("add_fruits_to_list", (object)fruitsList).
                           Execute();

            // get value from response
            string result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_EnumAddToList>
            Assert.Equal("2 fruits on the list", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_PythonPackage_TestResources_EnumNameAndValue()
        {
            // <TestResources_EnumNameAndValue>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // set up variables
            string libraryPath = resourcesDirectory;
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className);

            //create enum items
            var fruit1 = calledRuntime.GetEnumItem(calledRuntimeType, "Fruit", "Mango");
            var fruit2 = calledRuntime.GetEnumItem(calledRuntimeType, "Fruit", "Orange");

            //get items' names and values
            var fruit1Name = (string)fruit1.GetEnumName().Execute().GetValue();
            var fruit2Name = (string)fruit2.GetEnumName().Execute().GetValue();
            var fruit1Value = (int)fruit1.GetEnumValue().Execute().GetValue();
            var fruit2Value = (int)fruit2.GetEnumValue().Execute().GetValue();


            // write result to console
            System.Console.WriteLine("{0}: {1}, {2}: {3}", fruit1Name, fruit1Value, fruit2Name, fruit2Value);
            // </TestResources_EnumNameAndValue>
            Assert.Equal("Mango", fruit1Name);
            Assert.Equal("Orange", fruit2Name);
            Assert.Equal(4, fruit1Value);
            Assert.Equal(3, fruit2Value);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_PythonPackage_TestResources_2DArray_GetIndex()
        {
            // <TestResources_2DArray_GetIndex>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // set up variables
            string libraryPath = resourcesDirectory;
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get_2d_array").Execute();

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
        public void Test_PythonPackage_TestResources_2DArray_GetSizeAndRank()
        {
            // <TestResources_2DArray_GetSizeAndRank>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // set up variables
            string libraryPath = resourcesDirectory;
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get_2d_array").Execute();

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
        public void Test_PythonPackage_TestResources_2DArray_SetIndex()
        {
            // <TestResources_2DArray_SetIndex>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // set up variables
            string libraryPath = resourcesDirectory;
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance(0, 1).Execute();

            // invoke instance's method
            var array = instance.InvokeInstanceMethod("get_2d_array").Execute();

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
        public void Test_PythonPackage_StandardLibrary_HandleList()
        {
            // <StandardLibrary_HandleList>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // get list from built-in types
            var typeList = calledRuntime.GetType("builtins.list").Execute();

            // create instance of list
            var list = typeList.CreateInstance().Execute();

            // invoke instance method
            list.InvokeInstanceMethod("extend", (object)new string[] { "one", "two", "three", "four", "five", "six" }).Execute();

            // get elements from list
            var element0 = list[0].Execute();
            var element1 = list.GetIndex(1).Execute();

            var result0 = element0.GetValue();
            var result1 = element1.GetValue();

            // get size of list
            var size = list.GetSize().Execute().GetValue();

            // write results to console
            System.Console.WriteLine(result0);
            System.Console.WriteLine(result1);
            System.Console.WriteLine(size);
            // </StandardLibrary_HandleList>
            Assert.Equal("one", result0);
            Assert.Equal("two", result1);
            Assert.Equal(6, size);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_PythonPackage_StandardLibrary_HandleDictionary()
        {
            // <StandardLibrary_HandleDictionary>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Python();

            // get generic class 
            var typeDictionary = calledRuntime.GetType("builtins.dict").Execute();

            // create instance of generic class
            var dictionary = typeDictionary.CreateInstance().Execute();

            // set elements in dictionary
            dictionary.SetIndex("pi", System.Math.PI).Execute();
            dictionary.SetIndex("e", System.Math.E).Execute();
            dictionary.SetIndex("c", 299792458.0).Execute();

            // get elements from dictionary
            var response1 = dictionary["c"].Execute();
            var response2 = dictionary.GetIndex("e").Execute();

            var c_value = response1.GetValue();
            var e_value = response2.GetValue();

            // write results to console
            System.Console.WriteLine(c_value);
            System.Console.WriteLine(e_value);
            // </StandardLibrary_HandleDictionary>
            Assert.Equal(299792458.0, c_value);
            Assert.Equal(System.Math.E, e_value);
        }
    }
}