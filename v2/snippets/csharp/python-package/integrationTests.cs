using Xunit;
using Xunit.Abstractions;

namespace Integration.Tests
{
	using Javonet.Netcore.Utils;
	using Javonet.Netcore.Sdk;
	public class NetcoreToPythonIntegrationTests
	{
		private readonly ITestOutputHelper output;
		// this constructor is called only once, before first test
		public NetcoreToPythonIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/python-package";

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50()
		{
			// <StandardLibrary_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PYTHON runtime context
			var pythonRuntime = Javonet.InMemory().Python();

			// get type from the runtime
			var pythonType = pythonRuntime.GetType("builtins").Execute();

			// invoke type's static method
			var response = pythonType.InvokeStaticMethod("abs", -50).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_StandardLibrary_GetStaticField_MathPI_PI()
		{
			// <StandardLibrary_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PYTHON runtime context
			var pythonRuntime = Javonet.InMemory().Python();

			// get type from the runtime
			var pythonType = pythonRuntime.GetType("math").Execute();

			// get type's static field
			var response = pythonType.GetStaticField("pi").Execute();

			// get value from response
			var result = (float)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_GetStaticField>
			Assert.Equal(System.Math.PI, result, 7);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_LoadLibrary_LibraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PYTHON runtime context
			var pythonRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;

			// load custom library
			pythonRuntime.LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PYTHON runtime context
			var pythonRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "PythonTestClass.PythonTestClass";

			// load custom library
			pythonRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var pythonType = pythonRuntime.GetType(className).Execute();

			// invoke type's static method
			var response = pythonType.InvokeStaticMethod("multiply_by_two", 25).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_GetStaticField_StaticValue_3()
		{
			// <TestResources_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PYTHON runtime context
			var pythonRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "PythonTestClass.PythonTestClass";

			// load custom library
			pythonRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var pythonType = pythonRuntime.GetType(className).Execute();

			// get type's static field
			var response = pythonType.GetStaticField("static_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_SetStaticField_StaticValue_75()
		{
			// <TestResources_SetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PYTHON runtime context
			var pythonRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "PythonTestClass.PythonTestClass";

			// load custom library
			pythonRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var pythonType = pythonRuntime.GetType(className).Execute();

			// set static field's value
			pythonType.SetStaticField("static_value", 75).Execute();

			// get type's static field
			var response = pythonType.GetStaticField("static_value").Execute();

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
		public void Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PYTHON runtime context
			var pythonRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "PythonTestClass.PythonTestClass";

			// load custom library
			pythonRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var pythonType = pythonRuntime.GetType(className).Execute();


			// create type's instance
			var instance = pythonType.CreateInstance(15, 14).Execute();

			// invoke instance's method
			var response = instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_InvokeInstanceMethod>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(20, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_GetInstanceField_PublicValue_18()
		{
			// <TestResources_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PYTHON runtime context
			var pythonRuntime = Javonet.InMemory().Python();

			// set up variables
			// libraryPath - directory with .py files
			string libraryPath = resourcesDirectory;
			string className = "PythonTestClass.PythonTestClass";

			// load custom library
			pythonRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var pythonType = pythonRuntime.GetType(className).Execute();

			// create type's instance
			var instance = pythonType.CreateInstance(18, 19).Execute();

			// get instance's field
			var response = instance.GetInstanceField("public_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(18, result);
		}
	}
}