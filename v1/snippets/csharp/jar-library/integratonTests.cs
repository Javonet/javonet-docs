using Xunit;
using Xunit.Abstractions;
using JavonetBridge;
using JavonetBridge.Api;
using System;
using JavaBridges.Api.PrimitiveTypes;

namespace Integration.Tests
{
	public class integrationTests
	{
		private readonly ITestOutputHelper output;
		//this constructor is called only once, before first test
		public integrationTests(ITestOutputHelper output)
		{
			this.output = output;
			Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey, @"C:\Program Files\Java\jdk1.8.0_271");
		}
		private static readonly string resourcesDirectory = "";

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_Activation()
		{
			// <Activation>
			Javonet.Activate("your-email", "your-license-key", @"C:\Program Files\Java\jdk1.8.0_271");
			// Todo: Your Javonet powered application code 
			// </Activation>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_ActivationWithProxy()
		{
			// <ActivationWithProxy>
			Javonet.SetProxySettings("your-host", "your-username", "your-password", "your-appdomain");
			Javonet.Activate("your-email", "your-license-key", @"C:\Program Files\Java\jdk1.8.0_271");
			// Todo: Your Javonet powered application code 
			// </ActivationWithProxy>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_TestResources_InvokeStaticMethod()
		{
			// <TestResources_InvokeStaticMethod>
			// Todo: activate Javonet

			// add reference to library
			Javonet.AddReference(resourcesDirectory + "TestClass.jar");

			// get Java type
			JType sampleType = Javonet.GetType("TestClass");

			// call static method
			string res = sampleType.Invoke<string>("SayHello", "Student");

			// write result to console
			Console.WriteLine("Java static method 'SayHello' returned: " + res);
			// </TestResources_InvokeStaticMethod>
			Assert.Equal("Hello Student", res);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_TestResources_InvokeStaticMethod_Fluent()
		{
			// <TestResources_InvokeStaticMethodFluent>
			// Todo: activate Javonet

			// add reference to library
			Javonet.AddReference(resourcesDirectory + "TestClass.jar");

			// call static method
			string res = Javonet.GetType("TestClass").Invoke<string>("SayHello", "Student");

			// write result to console
			Console.WriteLine("Java static method 'SayHello' returned: " + res);
			// </TestResources_InvokeStaticMethodFluent>
			Assert.Equal("Hello Student", res);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_TestResources_InvokeStaticMethod_WithPrimitive()
		{
			// <TestResources_InvokeStaticMethodWithPrimitive>
			// Todo: activate Javonet

			// add reference to library
			Javonet.AddReference(resourcesDirectory + "TestClass.jar");

			// get Java type
			JType sampleType = Javonet.GetType("TestClass");

			int argValue = 5;

			// call static method with primitive representation of value type argument
			int res = sampleType.Invoke<int>("MethodExpectingPrimitiveInt", new JPrimitive(argValue));
			Console.WriteLine("Java static method 'MethodExpectingPrimitiveInt' returned: " + res);

			// calli static method with class representation of value type argument
			int res2 = sampleType.Invoke<int>("MethodExpectingClassInteger", argValue);
			Console.WriteLine("Java static method 'MethodExpectingClassInteger' returned: " + res);
			// </TestResources_InvokeStaticMethodWithPrimitive>
			Assert.Equal(10, res);
			Assert.Equal(10, res2);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_StandardLibrary_CreateInstance()
		{
			// <StandardLibrary_CreateInstance>
			// Todo: activate Javonet

			var rand = Javonet.New("java.util.Random");
			int n = rand.Invoke<int>("nextInt", 50) + 1;
			output.WriteLine(n.ToString());

			var rand2 = Javonet.New("java.util.Random", new JPrimitive(1000L));
			int n2 = rand2.Invoke<int>("nextInt", 50) + 1;
			output.WriteLine(n2.ToString());

		}
	}
}
