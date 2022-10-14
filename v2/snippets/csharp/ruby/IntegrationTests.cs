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
		private static readonly string _javonetSrcRoot = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName;
		// <TestResources_TestClassValues> 
		private static readonly string libraryPath = _javonetSrcRoot + "/testResources/ruby/ruby_test_class.rb";
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
		public void Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_sqrt_2500_50()
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
		public void Test_Ruby_TestResources_LoadLibrary_libraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			Javonet.InMemory().Ruby().LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_InvokeStaticMethod_multiplyByTwo_25_50()
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
		public void Test_Ruby_TestResources_GetStaticField_staticValue_3()
		{
			// <TestResources_GetStaticField>
			Javonet.InMemory().Ruby().LoadLibrary(libraryPath);
			var call = Javonet.InMemory().Ruby().GetType(className).
				GetStaticField("static_value").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}
	}
}