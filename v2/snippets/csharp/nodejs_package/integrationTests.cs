using Xunit;
using Xunit.Abstractions;

namespace Integration.Tests
{
	using Javonet.Netcore.Utils;
	using Javonet.Netcore.Sdk;
	public class NetcoreToNodejsIntegrationTests
	{
		private readonly ITestOutputHelper output;
		// this constructor is called only once, before first test
		public NetcoreToNodejsIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/nodejs_package";

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50()
		{
			// <StandardLibrary_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create NODEJS runtime context
			var nodejsRuntime = Javonet.InMemory().Nodejs();

			// get type from the runtime
			var nodejsType = nodejsRuntime.GetType("Math").Execute();

			// invoke type's static method
			var response = nodejsType.InvokeStaticMethod("abs", -50).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_StandardLibrary_GetStaticField_MathPI_PI()
		{
			// <StandardLibrary_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create NODEJS runtime context
			var nodejsRuntime = Javonet.InMemory().Nodejs();

			// get type from the runtime
			var nodejsType = nodejsRuntime.GetType("Math").Execute();

			// get type's static field
			var response = nodejsType.GetStaticField("PI").Execute();

			// get value from response
			var result = (double)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_GetStaticField>
			Assert.Equal(System.Math.PI, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create NODEJS runtime context
			var nodejsRuntime = Javonet.InMemory().Nodejs();

			// set up variables
			string libraryPath = resourcesDirectory + "/NodejsTestClass.js";

			// load custom library
			nodejsRuntime.LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create NODEJS runtime context
			var nodejsRuntime = Javonet.InMemory().Nodejs();

			// set up variables
			string libraryPath = resourcesDirectory + "/NodejsTestClass.js";
			string className = "NodejsTestClass";

			// load custom library
			nodejsRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var nodejsType = nodejsRuntime.GetType(className).Execute();

			// invoke type's static method
			var response = nodejsType.InvokeStaticMethod("multiplyByTwo", 25).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_GetStaticField_StaticValue_3()
		{
			// <TestResources_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create NODEJS runtime context
			var nodejsRuntime = Javonet.InMemory().Nodejs();

			// set up variables
			string libraryPath = resourcesDirectory + "/NodejsTestClass.js";
			string className = "NodejsTestClass";

			// load custom library
			nodejsRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var nodejsType = nodejsRuntime.GetType(className).Execute();

			// get type's static field
			var response = nodejsType.GetStaticField("staticValue").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_SetStaticField_StaticValue_75()
		{
			// <TestResources_SetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create NODEJS runtime context
			var nodejsRuntime = Javonet.InMemory().Nodejs();

			// set up variables
			string libraryPath = resourcesDirectory + "/NodejsTestClass.js";
			string className = "NodejsTestClass";

			// load custom library
			nodejsRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var nodejsType = nodejsRuntime.GetType(className).Execute();

			// set static field's value
			nodejsType.SetStaticField("staticValue", 75).Execute();

			// get type's static field
			var response = nodejsType.GetStaticField("staticValue").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_SetStaticField>
			nodejsType.SetStaticField("staticValue", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create NODEJS runtime context
			var nodejsRuntime = Javonet.InMemory().Nodejs();

			// set up variables
			string libraryPath = resourcesDirectory + "/NodejsTestClass.js";
			string className = "NodejsTestClass";

			// load custom library
			nodejsRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var nodejsType = nodejsRuntime.GetType(className).Execute();

			// create type's instance
			var instance = nodejsType.CreateInstance().Execute();

			// invoke instance's method
			var response = instance.InvokeInstanceMethod("multiplyTwoNumbers", 5, 4).Execute();

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
		public void Test_Nodejs_TestResources_GetInstanceField_PublicValue_1()
		{
			// <TestResources_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create NODEJS runtime context
			var nodejsRuntime = Javonet.InMemory().Nodejs();

			// set up variables
			string libraryPath = resourcesDirectory + "/NodejsTestClass.js";
			string className = "NodejsTestClass";

			// load custom library
			nodejsRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var nodejsType = nodejsRuntime.GetType(className).Execute();

			// create type's instance
			var instance = nodejsType.CreateInstance(18, 19).Execute();

			// get instance's field
			var response = instance.GetInstanceField("publicValue").Execute();

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