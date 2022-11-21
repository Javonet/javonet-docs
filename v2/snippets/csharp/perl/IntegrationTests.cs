using Xunit;
using Xunit.Abstractions;
using Javonet.Utils;

namespace Javonet.Netcore.Sdk.Tests
{
	public class NetcoreToPerlIntegrationTests
	{
		private readonly ITestOutputHelper output;
		//this constructor is called only once, before first test
		public NetcoreToPerlIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
			Assert.Equal(0, result);
		}
		private static readonly string javonetSrcRoot = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName;

		// <TestResources_TestClassValues> 
		private static readonly string libraryPath = javonetSrcRoot + "/testResources/perl";
		private static readonly string fileName = "PerlTestClass.pm";
		private static readonly string className = "PerlTestClass::PerlTestClass";
		// </TestResources_TestClassValues> 

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_LoadLibrary_LibraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			Javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			Javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName);
			var call = Javonet.InMemory().Perl().GetType(className).
				InvokeStaticMethod("multiply_by_two", 25).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_GetStaticField_StaticValue_3()
		{
			// <TestResources_GetStaticField>
			Javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName);
			var call = Javonet.InMemory().Perl().GetType(className).
				GetStaticField("static_value").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_SetStaticField_StaticValue_75()
		{
			// <TestResources_SetStaticField>
			Javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName);
			Javonet.InMemory().Perl().GetType(className).SetStaticField("static_value", 75).Execute();
			// </TestResources_SetStaticField>
			var call = Javonet.InMemory().Perl().GetType(className).GetStaticField("static_value").Execute();
			var result = (int)call.GetValue();
			Javonet.InMemory().Perl().GetType(className).SetStaticField("static_value", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			Javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName);
			var instance = Javonet.InMemory().Perl().GetType(className).CreateInstance().Execute();
			var call = instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute();
			var result = (int)call.GetValue();
			// </TestResources_InvokeInstanceMethod>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(20, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_GetInstanceField_PublicValue_1()
		{
			// <TestResources_GetInstanceField>
			Javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName);
			var instance = Javonet.InMemory().Perl().GetType(className).CreateInstance().Execute();
			var call = instance.GetInstanceField("public_value").Execute();
			var result = (int)call.GetValue();
			// </TestResources_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(1, result);
		}

	}
}