using Xunit;
using Xunit.Abstractions;

namespace Integration.Tests
{
	using Javonet.Netcore.Utils;
	using Javonet.Netcore.Sdk;

	public class NetcoreToJvmIntegrationTests
	{
		private readonly ITestOutputHelper output;
		// this constructor is called only once, before first test
		public NetcoreToJvmIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/jar_library";

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50()
		{
			// <StandardLibrary_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create JVM runtime context
			var jvmRuntime = Javonet.InMemory().Jvm();

			// get type from the jvmRuntime
			var type = jvmRuntime.GetType("java.lang.Math").Execute();
			
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
		public void Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI()
		{
			// <StandardLibrary_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create JVM runtime context
			var jvmRuntime = Javonet.InMemory().Jvm();

			// get type from the jvmRuntime
			var jvmType = jvmRuntime.GetType("java.lang.Math").Execute();

			// get type's static field
			var response = jvmType.GetStaticField("PI").Execute();

			// get value from response
			var result = (double)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_GetStaticField>
			Assert.Equal(System.Math.PI, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9()
		{
			// <StandardLibrary_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create JVM runtime context
			var jvmRuntime = Javonet.InMemory().Jvm();

			// get type from the jvmRuntime
			var jvmType = jvmRuntime.GetType("java.util.Random").Execute();

			// create type's instance
			var instance = jvmType.CreateInstance().Execute();

			// invoke instance's method
			var response = instance.InvokeInstanceMethod("nextInt", 10).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_InvokeInstanceMethod>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.InRange(result, 0, 10);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name()
		{
			// <StandardLibrary_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create JVM runtime context
			var jvmRuntime = Javonet.InMemory().Jvm();

			// get type from the jvmRuntime
			var jvmType = jvmRuntime.GetType("java.sql.DriverPropertyInfo").Execute();

			// create type's instance
			var instance = jvmType.CreateInstance("sample value", "sample value 2").Execute();

			// get instance's field 
			var response = instance.GetInstanceField("name").Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal("sample value", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create JVM runtime context
			var jvmRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";

			// load custom library
			jvmRuntime.LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create JVM runtime context
			var jvmRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			string className = "javonet.test.resources.jvm.JavaTestClass";

			// load custom library
			jvmRuntime.LoadLibrary(libraryPath);

			// get type from the jvmRuntime
			var jvmType = jvmRuntime.GetType(className).Execute();

			// invoke type's static method
			var response = jvmType.InvokeStaticMethod("multiplyByTwo", 25).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_GetStaticField_StaticValue_3()
		{
			// <TestResources_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create JVM runtime context
			var jvmRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			string className = "javonet.test.resources.jvm.JavaTestClass";

			// load custom library
			jvmRuntime.LoadLibrary(libraryPath);

			// get type from the jvmRuntime
			var jvmType = jvmRuntime.GetType(className).Execute();

			// get type's static field
			var response = jvmType.GetStaticField("staticValue").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_SetStaticField_StaticValue_75()
		{
			// <TestResources_SetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create JVM runtime context
			var jvmRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			string className = "javonet.test.resources.jvm.JavaTestClass";

			// load custom library
			jvmRuntime.LoadLibrary(libraryPath);

			// get type from the jvmRuntime
			var jvmType = jvmRuntime.GetType(className).Execute();

			// set static field's value
			jvmType.SetStaticField("staticValue", 75).Execute();

			// get type's static field
			var response = jvmType.GetStaticField("staticValue").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_SetStaticField>
			jvmType.SetStaticField("staticValue", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create JVM runtime context
			var jvmRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			string className = "javonet.test.resources.jvm.JavaTestClass";

			// load custom library
			jvmRuntime.LoadLibrary(libraryPath);

			// get type from the jvmRuntime
			var jvmType = jvmRuntime.GetType(className).Execute();

			// create type's instance
			var instance = jvmType.CreateInstance().Execute();

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
		public void Test_Jvm_TestResources_GetInstanceField_PublicValue_18()
		{
			// <TestResources_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create JVM runtime context
			var jvmRuntime = Javonet.InMemory().Jvm();

			// set up variables
			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			string className = "javonet.test.resources.jvm.JavaTestClass";

			// load custom library
			jvmRuntime.LoadLibrary(libraryPath);

			// get type from the jvmRuntime
			var jvmType = jvmRuntime.GetType(className).Execute();

			// create type's instance
			var instance = jvmType.CreateInstance(18, 19).Execute();

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