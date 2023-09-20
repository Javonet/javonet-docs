using Javonet.Netcore.Sdk.Tests.Utils;
using Javonet.Netcore.Utils;
using Xunit;
using Xunit.Abstractions;


namespace Javonet.Netcore.Sdk.Tests.jarlibrary
{
    public class integrationTests
	{
		private readonly ITestOutputHelper output;
		// this constructor is called only once, before first test
		public integrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/jar-library";

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_TestResources_LoadLibrary()
		{
			// <TestResources_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_TestResources_GetStaticField()
		{
			// <TestResources_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
			string className = "TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the jvmRuntime
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
		public void Test_JarLibrary_TestResources_SetStaticField()
		{
			// <TestResources_SetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
			string className = "TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the jvmRuntime
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
		public void Test_JarLibrary_TestResources_GetInstanceField()
		{
			// <TestResources_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
			string className = "TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the jvmRuntime
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
		public void Test_JarLibrary_TestResources_SetInstanceField()
		{
			// <TestResources_SetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
			string className = "TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(18, 19).Execute();

			// set instance's field
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
		public void Test_JarLibrary_TestResources_InvokeStaticMethod()
		{
			// <TestResources_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
			string className = "TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the jvmRuntime
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
		public void Test_JarLibrary_TestResources_InvokeInstanceMethod()
		{
			// <TestResources_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
			string className = "TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the jvmRuntime
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
		public void Test_JarLibrary_TestResources_1DArray_GetIndex()
		{
			// <TestResources_1DArray_GetIndex>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
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
		public void Test_JarLibrary_TestResources_1DArray_GetSize()
		{
			// <TestResources_1DArray_GetSize>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
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
			// </TestResources_1DArray_GetSize>
			Assert.Equal(5, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_TestResources_1DArray_SetIndex()
		{
			// <TestResources_1DArray_SetIndex>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
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
			array.SetIndex("seven", 4).Execute();

			// get index from array
			var response = array.GetIndex(4).Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_SetIndex>
			array.SetIndex("five", 4).Execute();
			Assert.Equal("seven", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_TestResources_1DArray_Iterate()
		{
			// <TestResources_1DArray_Iterate>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
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
				arrayValues[i] = (string)element.InvokeInstanceMethod("toUpperCase").Execute().GetValue();
				i++;
			}

			// write result to console
			System.Console.WriteLine(string.Join("\t", arrayValues));
			// </TestResources_1DArray_Iterate>
			Assert.Equal(new string[] { "ONE", "TWO", "THREE", "FOUR", "FIVE" }, arrayValues);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_TestResources_1DArray_GetElement()
		{
			// <TestResources_1DArray_GetElement>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
			string className = "TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("get1DArray").Execute();

			// invoke method on array's element
			var response = array[2].InvokeInstanceMethod("toUpperCase").Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_GetElement>
			Assert.Equal("THREE", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_TestResources_1DArray_PassArrayAsArgument()
		{
			// <TestResources_1DArray_PassArrayAsArgument>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
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
			var result = (double)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_PassArrayAsArgument>
			Assert.Equal(999.0, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_TestResources_1DArray_RetrieveArray()
		{
			// <TestResources_1DArray_RetrieveArray>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
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
			// </TestResources_1DArray_RetrieveArray>
			Assert.Equal(new string[] { "one", "two", "three", "four", "five" }, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException()
		{
			// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.jar";
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
			catch (System.ArithmeticException e)
			{
				// write result to console
				System.Console.WriteLine(e.Message);
				return;
			}
			// </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
			Assert.Fail("No exception occurred - test failed");
		}

        [Fact]
        [Trait("Test", "Functional")]
        public void Test_JarLibrary_TestResources_GenericStaticMethod()
        {
            // <TestResources_GenericStaticMethod>
            // use Activate only once in your app
            Javonet.Activate("your-email", "your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Jvm();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.jar";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // invoke type's generic static method
            var response = calledRuntimeType.
                           InvokeGenericStaticMethod("genericSampleStaticMethod", 7, 5).
                            Execute();

            // get value from response
            string result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_GenericStaticMethod>
            Assert.Equal("7 and 5", result);
        }

        [Fact]
        [Trait("Test", "Functional")]
        public void Test_JarLibrary_TestResources_GenericMethod()
        {
            // <TestResources_GenericMethod>
            // use Activate only once in your app
            Javonet.Activate("your-email", "your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Jvm();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.jar";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke type's generic method
            var response = instance.
                            InvokeGenericMethod("genericSampleMethod", 7, 5).
                            Execute();

            // get value from response
            string result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_GenericMethod>
            Assert.Equal("7 or 5", result);
        }

        [Fact]
        [Trait("Test", "Functional")]
        public void Test_JarLibrary_TestResources_GenericMethodWithTwoTypes()
        {
            // <TestResources_GenericMethodWithTwoTypes>
            // use Activate only once in your app
            Javonet.Activate("your-email", "your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Jvm();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.jar";
            string className = "TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke type's generic method
            var response = instance.
                           InvokeGenericMethod("genericSampleMethodWithTwoTypes", 7).
                           Execute();

            // get value from response
            string result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_GenericMethodWithTwoTypes>
            Assert.Equal("genericSampleMethodWithTwoTypes invoked", result);
        }

        [Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_StandardLibrary_GetStaticField()
		{
			// <StandardLibrary_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// get type from the jvmRuntime
			var calledRuntimeType = calledRuntime.GetType("java.lang.Math").Execute();

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
		public void Test_JarLibrary_StandardLibrary_GetInstanceField()
		{
			// <StandardLibrary_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// get type from the jvmRuntime
			var calledRuntimeType = calledRuntime.GetType("java.sql.DriverPropertyInfo").Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance("sample value", "sample value 2").Execute();

			// get instance's field 
			var response = instance.GetInstanceField("name").Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_GetInstanceField>
			Assert.Equal("sample value", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_StandardLibrary_InvokeStaticMethod()
		{
			// <StandardLibrary_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// get type from the jvmRuntime
			var type = calledRuntime.GetType("java.lang.Math").Execute();

			// invoke type's static method
			var response = type.InvokeStaticMethod("abs", -50).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_JarLibrary_StandardLibrary_InvokeInstanceMethod()
		{
			// <StandardLibrary_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Jvm();

			// get type from the jvmRuntime
			var calledRuntimeType = calledRuntime.GetType("java.util.Random").Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var response = instance.InvokeInstanceMethod("nextInt", 10).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_InvokeInstanceMethod>
			Assert.InRange(result, 0, 10);
		}
	}
}