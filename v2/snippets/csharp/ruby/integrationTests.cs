using Xunit;
using Xunit.Abstractions;
using Javonet.Utils;

namespace Javonet.Netcore.Sdk.Tests
{
	public class NetcoreToRubyIntegrationTests
	{
		private readonly ITestOutputHelper output;
		//this constructor is called only once, before first test
		public NetcoreToRubyIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
			Assert.Equal(0, result);
		}
		private static readonly string javonetSrcRoot = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName;

		// <TestResources_TestClassValues> 
		private static readonly string libraryPath = javonetSrcRoot + "/testResources/ruby/ruby_test_class.rb";
		private static readonly string className = "RubyTestClass::RubyTestClass";
		// </TestResources_TestClassValues> 

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_StandardLibrary_LoadLibrary_Base64_NoExeption()
		{
			// <StandardLibrary_LoadLibrary>
			Javonet.InMemory().Ruby().LoadLibrary("base64");
			// </StandardLibrary_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Sqrt_2500_50()
		{
			// <StandardLibrary_InvokeStaticMethod>
			var call = Javonet.InMemory().Ruby().GetType("Math").InvokeStaticMethod("sqrt", 2500).Execute();
			var result = (float)call.GetValue();
			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_StandardLibrary_GetStaticField_MathPI_PI()
		{
			// <StandardLibrary_GetStaticField>
			var call = Javonet.InMemory().Ruby().GetType("Math").GetStaticField("PI").Execute();
			var result = (float)call.GetValue();
			// </StandardLibrary_GetStaticField>
			Assert.Equal(System.Math.PI, result, 6);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			Javonet.InMemory().Ruby().LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			Javonet.InMemory().Ruby().LoadLibrary(libraryPath);
			var call = Javonet.InMemory().Ruby().GetType(className).
				InvokeStaticMethod("multiply_by_two", 25).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_GetStaticField_StaticValue_3()
		{
			// <TestResources_GetStaticField>
			Javonet.InMemory().Ruby().LoadLibrary(libraryPath);
			var call = Javonet.InMemory().Ruby().GetType(className).
				GetStaticField("static_value").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_SetStaticField_StaticValue_75()
		{
			// <TestResources_SetStaticField>
			Javonet.InMemory().Ruby().LoadLibrary(libraryPath);
			Javonet.InMemory().Ruby().GetType(className).SetStaticField("static_value", 75).Execute();
			// </TestResources_SetStaticField>
			var call = Javonet.InMemory().Ruby().GetType(className).GetStaticField("static_value").Execute();
			var result = (int)call.GetValue();
			//Javonet.InMemory().Ruby().GetType(className).SetStaticField("static_value", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			Javonet.InMemory().Ruby().LoadLibrary(libraryPath);
			var instance = Javonet.InMemory().Ruby().GetType(className).CreateInstance(3, 4).Execute();
			var call = instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeInstanceMethod>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(20, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_GetInstanceField_PublicValue_1()
		{
			// <TestResources_GetInstanceField>
			Javonet.InMemory().Ruby().LoadLibrary(libraryPath);
			var instance = Javonet.InMemory().Ruby().GetType(className).CreateInstance(1,2).Execute();
			var result = instance.GetInstanceField("public_value").Execute();
			// </TestResources_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(1, (int)result.GetValue());
		}
	}
}