using Xunit;
using Xunit.Abstractions;
using Javonet.Utils;

namespace Javonet.Netcore.Sdk.Tests
{
	public class NetcoreToJvmIntegrationTests
	{
		private readonly ITestOutputHelper output;
		//this constructor is called only once, before first test
		public NetcoreToJvmIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
			Assert.Equal(0, result);
		}
		private static readonly string _javonetSrcRoot = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName;
		
		// <TestResources_TestClassValues>
		private static readonly string libraryPath = _javonetSrcRoot + "/testResources/jvm/JavaTestClass.jar";
		private static readonly string className = "javonet.test.resources.jvm.JavaTestClass";
		// </TestResources_TestClassValues> 

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_StandardLibrary_InvokeStaticMethod_javalangMath_abs_minus50_50()
		{
			// <StandardLibrary_InvokeStaticMethod>
			var call = Javonet.InMemory().Jvm().GetType("java.lang.Math").InvokeStaticMethod("abs", -50).Execute();
			var result = (int)call.GetValue();
			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_StandardLibrary_GetStaticField_javalangMathPI_PI()
		{
			// <StandardLibrary_GetStaticField>
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
			var instance = Javonet.InMemory().Jvm().GetType("java.util.Random").CreateInstance().Execute();
			var call = instance.InvokeInstanceMethod("nextInt", 10).Execute();
			var result = (int)call.GetValue();
			// </StandardLibrary_InvokeInstanceMethod>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.InRange(result, 0, 10);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_LoadLibrary_libraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			Javonet.InMemory().Jvm().LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
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
			Javonet.InMemory().Jvm().LoadLibrary(libraryPath);
			Javonet.InMemory().Jvm().GetType(className).SetStaticField("staticValue", 75).Execute();
			// </TestResources_SetStaticField>
			var call = Javonet.InMemory().Jvm().GetType(className).GetStaticField("staticValue").Execute();
			var result = (int)call.GetValue();
			Assert.Equal(75, result);
			Javonet.InMemory().Jvm().GetType(className).SetStaticField("staticValue", 3).Execute();
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
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
			Javonet.InMemory().Jvm().LoadLibrary(libraryPath);
			var instance = Javonet.InMemory().Jvm().GetType(className).CreateInstance().Execute();
			var result = instance.GetInstanceField("publicValue").Execute();
			// </TestResources_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(1, (int)result.GetValue());
		}
	}
}
