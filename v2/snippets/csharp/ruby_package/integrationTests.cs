using Xunit;
using Xunit.Abstractions;

namespace Integration.Tests
{
	using Javonet.Netcore.Utils;
	using Javonet.Netcore.Sdk;
	public class NetcoreToRubyIntegrationTests
	{
		private readonly ITestOutputHelper output;
		// this constructor is called only once, before first test
		public NetcoreToRubyIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/ruby_package";

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_StandardLibrary_LoadLibrary_Base64_NoExeption()
		{
			// <StandardLibrary_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create RUBY runtime context
			var rubyRuntime = Javonet.InMemory().Ruby();

			// load RUBY library
			rubyRuntime.LoadLibrary("base64");
			// </StandardLibrary_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Sqrt_2500_50()
		{
			// <StandardLibrary_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create RUBY runtime context
			var rubyRuntime = Javonet.InMemory().Ruby();

			// get type from the runtime
			var rubyType = rubyRuntime.GetType("Math").Execute();

			// invoke type's static method
			var response = rubyType.InvokeStaticMethod("sqrt", 2500).Execute();

			// get value from response
			var result = (float)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_StandardLibrary_GetStaticField_MathPI_PI()
		{
			// <StandardLibrary_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create RUBY runtime context
			var rubyRuntime = Javonet.InMemory().Ruby();

			// get type from the runtime
			var rubyType = rubyRuntime.GetType("Math").Execute();


			// get type's static field
			var response = rubyType.GetStaticField("PI").Execute();

			// get value from response
			var result = (float)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_GetStaticField>
			Assert.Equal(System.Math.PI, result, 6);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoExeption()
		{
			// <TestResources_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create RUBY runtime context
			var rubyRuntime = Javonet.InMemory().Ruby();

			// set up variables
			string libraryPath = resourcesDirectory + "/ruby_test_class.rb";

			// load custom library
			rubyRuntime.LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50()
		{
			// <TestResources_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create RUBY runtime context
			var rubyRuntime = Javonet.InMemory().Ruby();

			// set up variables
			string libraryPath = resourcesDirectory + "/ruby_test_class.rb";
			string className = "RubyTestClass::RubyTestClass";

			// load custom library
			rubyRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var rubyType = rubyRuntime.GetType(className);

			// invoke type's static method
			var response = rubyType.InvokeStaticMethod("multiply_by_two", 25).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_GetStaticField_StaticValue_3()
		{
			// <TestResources_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create RUBY runtime context
			var rubyRuntime = Javonet.InMemory().Ruby();

			// set up variables
			string libraryPath = resourcesDirectory + "/ruby_test_class.rb";
			string className = "RubyTestClass::RubyTestClass";

			// load custom library
			rubyRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var rubyType = rubyRuntime.GetType(className).Execute();

			// get type's static field
			var response = rubyType.GetStaticField("static_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
			
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_SetStaticField_StaticValue_75()
		{
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create RUBY runtime context
			var rubyRuntime = Javonet.InMemory().Ruby();

			// set up variables
			string libraryPath = resourcesDirectory + "/ruby_test_class.rb";
			string className = "RubyTestClass::RubyTestClass";

			// load custom library
			rubyRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var rubyType = rubyRuntime.GetType(className).Execute();

			// set static field's value
			rubyType.SetStaticField("static_value", 75).Execute();

			// get type's static field
			var response = rubyType.GetStaticField("static_value").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_SetStaticField>
			rubyType.SetStaticField("static_value", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20()
		{
			// <TestResources_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create RUBY runtime context
			var rubyRuntime = Javonet.InMemory().Ruby();

			// set up variables
			string libraryPath = resourcesDirectory + "/ruby_test_class.rb";
			string className = "RubyTestClass::RubyTestClass";

			// load custom library
			rubyRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var rubyType = rubyRuntime.GetType(className).Execute();

			// create type's instance
			var instance = rubyType.CreateInstance(11,12).Execute();

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
		public void Test_Ruby_TestResources_GetInstanceField_PublicValue_18()
		{
			// <TestResources_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create RUBY runtime context
			var rubyRuntime = Javonet.InMemory().Ruby();

			// set up variables
			string libraryPath = resourcesDirectory + "/ruby_test_class.rb";
			string className = "RubyTestClass::RubyTestClass";

			// load custom library
			rubyRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var rubyType = rubyRuntime.GetType(className).Execute();

			// create type's instance
			var instance = rubyType.CreateInstance(18, 19).Execute();

			// get instance's field
			var response = instance.GetInstanceField("public_value").Execute();

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