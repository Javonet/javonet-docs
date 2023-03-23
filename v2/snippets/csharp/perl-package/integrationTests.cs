using Xunit;
using Xunit.Abstractions;

namespace Integration.Tests
{
	using Javonet.Netcore.Utils;
	using Javonet.Netcore.Sdk;
	public class NetcoreToPerlIntegrationTests
	{
		private readonly ITestOutputHelper output;
		// this constructor is called only once, before first test
		public NetcoreToPerlIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/perl-package";

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_LoadLibrary_LibraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PERL runtime context
			var perlRuntime = Javonet.InMemory().Perl();

			// set up variables
			// libraryPath - directory with .pm files
			string libraryPath = resourcesDirectory;
			string fileName = "TestClass.pm";

			// load custom library
			perlRuntime.LoadLibrary(libraryPath, fileName);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PERL runtime context
			var perlRuntime = Javonet.InMemory().Perl();

			// set up variables
			// libraryPath - directory with .pm files
			string libraryPath = resourcesDirectory;
			string fileName = "TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			perlRuntime.LoadLibrary(libraryPath, fileName);

			// get type from the runtime
			var perlType = perlRuntime.GetType(className).Execute();

			// invoke type's static method
			var response = perlType.InvokeStaticMethod("multiply_by_two", 25).Execute();

			var result = (int)response.GetValue();
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_GetStaticField_StaticValue_3()
		{
			// <TestResources_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PERL runtime context
			var perlRuntime = Javonet.InMemory().Perl();

			// set up variables
			// libraryPath - directory with .pm files
			string libraryPath = resourcesDirectory;
			string fileName = "TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			perlRuntime.LoadLibrary(libraryPath, fileName);

			// get type from the runtime
			var perlType = perlRuntime.GetType(className).Execute();

			// get type's static field
			var response = perlType.GetStaticField("static_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_SetStaticField_StaticValue_75()
		{
			// <TestResources_SetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PERL runtime context
			var perlRuntime = Javonet.InMemory().Perl();

			// set up variables
			// libraryPath - directory with .pm files
			string libraryPath = resourcesDirectory;
			string fileName = "TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			perlRuntime.LoadLibrary(libraryPath, fileName);

			// get type from the runtime
			var perlType = perlRuntime.GetType(className).Execute();

			// set static field's value
			perlType.SetStaticField("static_value", 75).Execute();

			// get type's static field
			var response = perlType.GetStaticField("static_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_SetStaticField>
			perlType.SetStaticField("static_value", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PERL runtime context
			var perlRuntime = Javonet.InMemory().Perl();

			// set up variables
			// libraryPath - directory with .pm files
			string libraryPath = resourcesDirectory;
			string fileName = "TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			perlRuntime.LoadLibrary(libraryPath, fileName);

			// get type from the runtime
			var perlType = perlRuntime.GetType(className).Execute();

			// create type's instance
			var instance = perlType.CreateInstance().Execute();

			// invoke instance's method
			var response = instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute();

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
		public void Test_Perl_TestResources_GetInstanceField_PublicValue_1()
		{
			// <TestResources_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create PERL runtime context
			var perlRuntime = Javonet.InMemory().Perl();

			// set up variables
			// libraryPath - directory with .pm files
			string libraryPath = resourcesDirectory;
			string fileName = "TestClass.pm";
			string className = "TestClass::TestClass";

			// load custom library
			perlRuntime.LoadLibrary(libraryPath, fileName);

			// get type from the runtime
			var perlType = perlRuntime.GetType(className).Execute();

			// create type's instance
			var instance = perlType.CreateInstance().Execute();

			// get instance's field
			var response = instance.GetInstanceField("public_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetInstanceField>
			Assert.Equal(36, ((string)instance.GetValue()).Length);
			Assert.Equal(1, result);
		}

	}
}