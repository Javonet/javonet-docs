using Xunit;
using Xunit.Abstractions;
using Javonet.Utils;

namespace Javonet.Netcore.Sdk.Tests
{
	public class NetcoreToPythonIntegrationTests
	{
		private readonly ITestOutputHelper output;
		//this constructor is called only once, before first test
		public NetcoreToPythonIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
			Assert.Equal(0, result);
		}
		private static readonly string javonetSrcRoot = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName;

		// <TestResources_TestClassValues> 
		private static readonly string libraryPath = javonetSrcRoot + "/testResources/python";
		private static readonly string className = "PythonTestClass.PythonTestClass";
		// </TestResources_TestClassValues> 

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50()
		{
			// <StandardLibrary_InvokeStaticMethod>
			var call = Javonet.InMemory().Python().GetType("builtins").InvokeStaticMethod("abs", -50).Execute();
			var result = (int)call.GetValue();
			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_StandardLibrary_GetStaticField_MathPI_PI()
		{
			// <StandardLibrary_GetStaticField>
			var call = Javonet.InMemory().Python().GetType("math").GetStaticField("pi").Execute();
			var result = (float)call.GetValue();
			// </StandardLibrary_GetStaticField>
			Assert.Equal(System.Math.PI, result, 7);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_LoadLibrary_LibraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			Javonet.InMemory().Python().LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			Javonet.InMemory().Python().LoadLibrary(libraryPath);
			var call = Javonet.InMemory().Python().GetType(className).
				InvokeStaticMethod("multiply_by_two", 25).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_GetStaticField_StaticValue_3()
		{
			// <TestResources_GetStaticField>
			Javonet.InMemory().Python().LoadLibrary(libraryPath);
			var call = Javonet.InMemory().Python().GetType(className).
				GetStaticField("static_value").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_SetStaticField_StaticValue_75()
		{
			// <TestResources_SetStaticField>
			Javonet.InMemory().Python().LoadLibrary(libraryPath);
			Javonet.InMemory().Python().GetType(className).SetStaticField("static_value", 75).Execute();
			// </TestResources_SetStaticField>
			var call = Javonet.InMemory().Python().GetType(className).GetStaticField("static_value").Execute();
			var result = (int)call.GetValue();
			Javonet.InMemory().Python().GetType(className).SetStaticField("static_value", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			Javonet.InMemory().Python().LoadLibrary(libraryPath);
			var instance = Javonet.InMemory().Python().GetType(className).CreateInstance(2, 3).Execute();
			var call = instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeInstanceMethod>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(20, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Python_TestResources_GetInstanceField_PublicValue_1()
		{
			// <TestResources_GetInstanceField>
			Javonet.InMemory().Python().LoadLibrary(libraryPath);
			var instance = Javonet.InMemory().Python().GetType(className).CreateInstance(1, 2).Execute();
			var result = instance.GetInstanceField("public_value").Execute();
			// </TestResources_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(1, (int)result.GetValue());
		}
	}
}