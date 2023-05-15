using Xunit;
using Xunit.Abstractions;

namespace Integration.Tests
{
	using Javonet.Netcore.Utils;
	using Javonet.Netcore.Sdk;
	public class NetcoreToPerlIntegrationTests
	{
		private readonly ITestOutputHelper output;
		// this constructor is called only once, before first test
		public NetcoreToPerlIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/perl-package";

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_LoadLibrary()
		{
			// <TestResources_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_GetStaticField()
		{
			// <TestResources_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";
			string className = "TestClass::TestClass";

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
		public void Test_Perl_TestResources_SetStaticField()
		{
			// <TestResources_SetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";
			string className = "TestClass::TestClass";

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
			calledRuntimeType.SetStaticField("static_value", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_GetInstanceField()
		{
			// <TestResources_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// get instance's field
			var response = instance.GetInstanceField("public_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetInstanceField>
			Assert.Equal(1, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_InvokeStaticMethod()
		{
			// <TestResources_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// invoke type's static method
			var response = calledRuntimeType.InvokeStaticMethod("multiply_by_two", 25).Execute();

			var result = (int)response.GetValue();
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_InvokeInstanceMethod()
		{
			// <TestResources_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

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
		public void Test_Perl_TestResources_1DArray_GetIndex()
		{
			// <TestResources_1DArray_GetIndex>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

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
		public void Test_Perl_TestResources_1DArray_GetSize()
		{
			// <TestResources_1DArray_GetSize>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

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
		public void Test_Perl_TestResources_1DArray_SetIndex()
		{
			// <TestResources_1DArray_SetIndex>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);
			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("get_1d_array").Execute();

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
		public void Test_Perl_TestResources_1DArray_Iterate()
		{
			// <TestResources_1DArray_Iterate>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("get_1d_array").Execute();

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
			System.Console.WriteLine(arrayValues);
			// </TestResources_1DArray_Iterate>
			Assert.Equal(new string[] { "one", "two", "three", "four", "five" }, arrayValues);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_1DArray_GetElement()
		{
			// <TestResources_1DArray_GetElement>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Perl();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("get_1d_array").Execute();

			// invoke method on array's element
			var response = array[2].Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_GetElement>
			Assert.Equal("three", result);
		}
	}
}