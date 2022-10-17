using Xunit;
using Xunit.Abstractions;
using Javonet.Utils;

namespace Javonet.Netcore.Sdk.Tests
{
	public class NetcoreToV8IntegrationTests
	{
		private readonly ITestOutputHelper output;
		//this constructor is called only once, before first test
		public NetcoreToV8IntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
			Assert.Equal(0, result);
		}
		private static readonly string _javonetSrcRoot = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName;
		// <TestResources_TestClassValues> 
		private static readonly string libraryPath = _javonetSrcRoot + "/testResources/v8/V8TestClass.js";
		private static readonly string className = "V8TestClass";
		// </TestResources_TestClassValues> 


		[Fact]
		[Trait("Test", "Integration")]
		public void Test_V8_StandardLibrary_InvokeStaticMethod_Math_abs_minus50_50()
		{
			// <StandardLibrary_InvokeStaticMethod>
			var call = Javonet.InMemory().V8().GetType("Math").InvokeStaticMethod("abs", -50).Execute();
			var result = (int)call.GetValue();
			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_V8_StandardLibrary_GetStaticField_MathPI_PI()
		{
			// <StandardLibrary_GetStaticField>
			var call = Javonet.InMemory().V8().GetType("Math").GetStaticField("PI").Execute();
			var result = (double)call.GetValue();
			// </StandardLibrary_GetStaticField>
			Assert.Equal(System.Math.PI, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_V8_TestResources_LoadLibrary_libraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			Javonet.InMemory().V8().LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_V8_TestResources_InvokeStaticMethod_multiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			Javonet.InMemory().V8().LoadLibrary(libraryPath);
			var call = Javonet.InMemory().V8().GetType(className).
				InvokeStaticMethod("multiplyByTwo", 25).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_V8_TestResources_GetStaticField_staticValue_3()
		{
			// <TestResources_GetStaticField>
			Javonet.InMemory().V8().LoadLibrary(libraryPath);
			var call = Javonet.InMemory().V8().GetType(className).
				GetStaticField("staticValue").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_V8_TestResources_SetStaticField_staticValue_75()
		{
			// <TestResources_SetStaticField>
			Javonet.InMemory().V8().LoadLibrary(libraryPath);
			Javonet.InMemory().V8().GetType(className).SetStaticField("staticValue", 75).Execute();
			// </TestResources_SetStaticField>
			var call = Javonet.InMemory().V8().GetType(className).GetStaticField("staticValue").Execute();
			var result = (int)call.GetValue();
			Assert.Equal(75, result);
			Javonet.InMemory().V8().GetType(className).SetStaticField("staticValue", 3).Execute();
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_V8_TestResources_InvokeInstanceMethod_multiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			Javonet.InMemory().V8().LoadLibrary(libraryPath);
			var instance = Javonet.InMemory().V8().GetType(className).CreateInstance().Execute();
			var call = instance.InvokeInstanceMethod("multiplyTwoNumbers", 5, 4).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeInstanceMethod>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(20, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_V8_TestResources_GetInstanceField_publicValue_1()
		{
			// <TestResources_GetInstanceField>
			Javonet.InMemory().V8().LoadLibrary(libraryPath);
			var instance = Javonet.InMemory().V8().GetType(className).CreateInstance(8, 9).Execute();
			var call = instance.GetInstanceField("publicValue").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(8.0, result);
		}
	}
}
