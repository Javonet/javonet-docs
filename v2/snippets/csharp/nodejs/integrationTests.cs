using Xunit;
using Xunit.Abstractions;
using Javonet.Utils;

namespace Javonet.Netcore.Sdk.Tests
{
	public class NetcoreToNodejsIntegrationTests
	{
		private readonly ITestOutputHelper output;
		//this constructor is called only once, before first test
		public NetcoreToNodejsIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
			Assert.Equal(0, result);
		}
		private static readonly string javonetSrcRoot = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName;

		// <TestResources_TestClassValues> 
		private static readonly string libraryPath = javonetSrcRoot + "/testResources/nodejs/NodejsTestClass.js";
		private static readonly string className = "NodejsTestClass.js";
		// </TestResources_TestClassValues> 


		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50()
		{
			// <StandardLibrary_InvokeStaticMethod>
			var call = Javonet.InMemory().Nodejs().GetType("Math").InvokeStaticMethod("abs", -50).Execute();
			var result = (int)call.GetValue();
			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_StandardLibrary_GetStaticField_MathPI_PI()
		{
			// <StandardLibrary_GetStaticField>
			var call = Javonet.InMemory().Nodejs().GetType("Math").GetStaticField("PI").Execute();
			var result = (double)call.GetValue();
			// </StandardLibrary_GetStaticField>
			Assert.Equal(System.Math.PI, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			Javonet.InMemory().Nodejs().LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			Javonet.InMemory().Nodejs().LoadLibrary(libraryPath);
			var call = Javonet.InMemory().Nodejs().GetType(className).
				InvokeStaticMethod("multiplyByTwo", 25).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_GetStaticField_StaticValue_3()
		{
			// <TestResources_GetStaticField>
			Javonet.InMemory().Nodejs().LoadLibrary(libraryPath);
			var call = Javonet.InMemory().Nodejs().GetType(className).
				GetStaticField("staticValue").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_SetStaticField_StaticValue_75()
		{
			// <TestResources_SetStaticField>
			Javonet.InMemory().Nodejs().LoadLibrary(libraryPath);
			Javonet.InMemory().Nodejs().GetType(className).SetStaticField("staticValue", 75).Execute();
			// </TestResources_SetStaticField>
			var call = Javonet.InMemory().Nodejs().GetType(className).GetStaticField("staticValue").Execute();
			var result = (int)call.GetValue();
			Javonet.InMemory().Nodejs().GetType(className).SetStaticField("staticValue", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			Javonet.InMemory().Nodejs().LoadLibrary(libraryPath);
			var instance = Javonet.InMemory().Nodejs().GetType(className).CreateInstance().Execute();
			var call = instance.InvokeInstanceMethod("multiplyTwoNumbers", 5, 4).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeInstanceMethod>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(20, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Nodejs_TestResources_GetInstanceField_PublicValue_1()
		{
			// <TestResources_GetInstanceField>
			Javonet.InMemory().Nodejs().LoadLibrary(libraryPath);
			var instance = Javonet.InMemory().Nodejs().GetType(className).CreateInstance(1, 2).Execute();
			var call = instance.GetInstanceField("publicValue").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(1, result);
		}
	}
}