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
		private static readonly string resourcesDirectory = System.IO.Directory.GetCurrentDirectory() + @"\..\..\..\..\..\testsResources\jar-library";

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
		public void Test_TestResources_AddReference()
		{
			// <TestResources_AddReference>
			// Todo: activate Javonet

			// add reference to library
			Javonet.AddReference(resourcesDirectory + @"\TestClass.jar");
			// </TestResources_AddReference>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_TestResources_InvokeStaticMethod()
		{
			// <TestResources_InvokeStaticMethod>
			// Todo: activate Javonet

			// add reference to library
			Javonet.AddReference(resourcesDirectory + @"\TestClass.jar");

			// get Java type
			JType sampleType = Javonet.GetType("TestClass");

			// call static method
			string response = sampleType.Invoke<string>("SayHello", "Student");

			// write result to console
			Console.WriteLine(response);
			// </TestResources_InvokeStaticMethod>
			Assert.Equal("Hello Student", response);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_TestResources_InvokeStaticMethod_Fluent()
		{
			// <TestResources_InvokeStaticMethodFluent>
			// Todo: activate Javonet

			// add reference to library
			Javonet.AddReference(resourcesDirectory + @"\TestClass.jar");

			// call static method
			string response = Javonet.GetType("TestClass").Invoke<string>("SayHello", "Student");

			// write result to console
			Console.WriteLine(response);
			// </TestResources_InvokeStaticMethodFluent>
			Assert.Equal("Hello Student", response);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_TestResources_InvokeStaticMethod_WithPrimitive()
		{
			// <TestResources_InvokeStaticMethodWithPrimitive>
			// Todo: activate Javonet

			// add reference to library
			Javonet.AddReference(resourcesDirectory + @"\TestClass.jar");

			// get Java type
			JType sampleType = Javonet.GetType("TestClass");

			int argValue = 5;

			// call static method with primitive representation of value type argument
			int response = sampleType.Invoke<int>("MethodExpectingPrimitiveInt", new JPrimitive(argValue));
			Console.WriteLine(response);

			// call static method with class representation of value type argument
			int response2 = sampleType.Invoke<int>("MethodExpectingClassInteger", argValue);
			Console.WriteLine(response2);
			// </TestResources_InvokeStaticMethodWithPrimitive>
			Assert.Equal(10, response);
			Assert.Equal(10, response2);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_TestResources_CreateInstanceAndInvokeMethod()
		{
			// <TestResources_CreateInstanceAndInvokeMethod>
			// Todo: activate Javonet
			// add reference to library
			Javonet.AddReference(resourcesDirectory + @"\TestClass.jar");

			// create Java object
			JObject testClassObject = Javonet.New("TestClass");
			
			// invoke instance method
			int response = testClassObject.Invoke<int>("MultiplyByTwo", 50);

			// write result to console
			Console.WriteLine(response);
			// </TestResources_CreateInstanceAndInvokeMethod>
			Assert.Equal(100, response);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_StandardLibrary_CreateInstanceAndInvokeMethod()
		{
			// <StandardLibrary_CreateInstanceAndInvokeMethod>
			// Todo: activate Javonet

			// create Java object
			JObject randomClassObject = Javonet.New("java.util.Random");

			// invoke instance method
			int response = randomClassObject.Invoke<int>("nextInt", new JPrimitive(50)) + 1;

			// write result to console
			Console.WriteLine(response);

			// </StandardLibrary_CreateInstanceAndInvokeMethod>
		}
	}
}
