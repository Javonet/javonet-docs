using Xunit;
using Xunit.Abstractions;

namespace Integration.Tests
{
	using Javonet.Netcore.Utils;
	using Javonet.Netcore.Sdk;
	using System;

	public class NetcoreToJvmIntegrationTests
	{
		private readonly ITestOutputHelper output;
		//this constructor is called only once, before first test
		public NetcoreToJvmIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourlicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/jvm";

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50()
		{
			// <StandardLibrary_InvokeStaticMethod>
			// Use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			//create JVM runtime context
			var runtime = Javonet.InMemory().Jvm();

			//get type from the runtime
			var type = runtime.GetType("java.lang.Math").Execute();
			
			//invoke type's static method
			var call = type.InvokeStaticMethod("abs", -50).Execute();

			//get result from the call
			var result = (int)call.GetValue();

			//write result to console
			Console.WriteLine(result);

			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI()
		{
			// <StandardLibrary_GetStaticField>
			// Use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			var call = Javonet.InMemory().Jvm().GetType("java.lang.Math").GetStaticField("PI").Execute();
			var result = (double)call.GetValue();
			// </StandardLibrary_GetStaticField>
			Assert.Equal(System.Math.PI, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9()
		{
			// <StandardLibrary_InvokeInstanceMethod>
			// Use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			var instance = Javonet.InMemory().Jvm().GetType("java.util.Random").CreateInstance().Execute();
			var call = instance.InvokeInstanceMethod("nextInt", 10).Execute();
			var result = (int)call.GetValue();
			// </StandardLibrary_InvokeInstanceMethod>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.InRange(result, 0, 10);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name()
		{
			// <StandardLibrary_GetInstanceField>
			// Use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			var instance = Javonet.InMemory().Jvm().GetType("java.sql.DriverPropertyInfo").CreateInstance("sample value", "sample value 2").Execute();
			var call = instance.GetInstanceField("name").Execute();
			var result = (string)call.GetValue();
			// </StandardLibrary_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal("sample value", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			// Use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			Javonet.InMemory().Jvm().LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			// Use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			string className = "javonet.test.resources.jvm.JavaTestClass";
			Javonet.InMemory().Jvm().LoadLibrary(libraryPath);
			var call = Javonet.InMemory().Jvm().GetType(className).
				InvokeStaticMethod("multiplyByTwo", 25).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_GetStaticField_StaticValue_3()
		{
			// <TestResources_GetStaticField>
			// Use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			string className = "javonet.test.resources.jvm.JavaTestClass";
			Javonet.InMemory().Jvm().LoadLibrary(libraryPath);

			var call = Javonet.InMemory().Jvm().GetType(className).
				GetStaticField("staticValue").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_SetStaticField_StaticValue_75()
		{
			// <TestResources_SetStaticField>
			// Use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			string className = "javonet.test.resources.jvm.JavaTestClass";
			Javonet.InMemory().Jvm().LoadLibrary(libraryPath);

			Javonet.InMemory().Jvm().GetType(className).SetStaticField("staticValue", 75).Execute();

			var call = Javonet.InMemory().Jvm().GetType(className).GetStaticField("staticValue").Execute();
			var result = (int)call.GetValue();
			// </TestResources_SetStaticField>
			Javonet.InMemory().Jvm().GetType(className).SetStaticField("staticValue", 3).Execute();

			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			// Use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			string className = "javonet.test.resources.jvm.JavaTestClass";
			Javonet.InMemory().Jvm().LoadLibrary(libraryPath);

			var instance = Javonet.InMemory().Jvm().GetType(className).CreateInstance().Execute();
			var call = instance.InvokeInstanceMethod("multiplyTwoNumbers", 5, 4).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeInstanceMethod>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(20, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_GetInstanceField_PublicValue_1()
		{
			// <TestResources_GetInstanceField>
			// Use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			string libraryPath = resourcesDirectory + "/JavaTestClass.jar";
			string className = "javonet.test.resources.jvm.JavaTestClass";
			Javonet.InMemory().Jvm().LoadLibrary(libraryPath);
			var instance = Javonet.InMemory().Jvm().GetType(className).CreateInstance().Execute();
			var call = instance.GetInstanceField("publicValue").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(1, result);
		}
	}
}