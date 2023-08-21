using Javonet.Netcore.Sdk.Tests.Utils;
using Javonet.Netcore.Utils;
using Xunit;
using Xunit.Abstractions;

namespace Javonet.Netcore.Sdk.Tests.netframeworkdll
{
    public class integrationTests
	{
		private readonly ITestOutputHelper output;
		// this constructor is called only once, before first test
		public integrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/netframework-dll";
#if _WINDOWS
		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_LoadLibrary()
		{
			// <TestResources_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);
			// </TestResources_LoadLibrary>
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_GetStaticField()
		{
			// <TestResources_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// get type's static field
			var response = calledRuntimeType.GetStaticField("StaticValue").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetStaticField>
			Assert.Equal(3, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_SetStaticField()
		{
			// <TestResources_SetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// set static field's value
			calledRuntimeType.SetStaticField("StaticValue", 75).Execute();

			// get type's static field
			var response = calledRuntimeType.GetStaticField("StaticValue").Execute();
			var result = (int)response.GetValue();
			// </TestResources_SetStaticField>
			calledRuntimeType.SetStaticField("StaticValue", 3).Execute();
			Assert.Equal(75, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_GetInstanceField()
		{
			// <TestResources_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(18, 19).Execute();

			// get instance's field
			var response = instance.GetInstanceField("PublicValue").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_GetInstanceField>
			Assert.Equal(18, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_SetInstanceField()
		{
			// <TestResources_SetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(18, 19).Execute();

			// set instance's field
			instance.SetInstanceField("PublicValue", 44).Execute();

			// get instance's field
			var response = instance.GetInstanceField("PublicValue").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_SetInstanceField>
			Assert.Equal(44, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_InvokeStaticMethod()
		{
			// <TestResources_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// invoke type's static method
			var response = calledRuntimeType.InvokeStaticMethod("MultiplyByTwo", 25).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_InvokeInstanceMethod()
		{
			// <TestResources_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var response = instance.InvokeInstanceMethod("MultiplyTwoNumbers", 5, 4).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);

			// </TestResources_InvokeInstanceMethod>
			Assert.Equal(20, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_1DArray_GetIndex()
		{
			// <TestResources_1DArray_GetIndex>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("Get1DArray").Execute();

			// get index from array
			var response = array.GetIndex(2).Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_GetIndex>
			Assert.Equal("three", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_1DArray_GetSize()
		{
			// <TestResources_1DArray_GetSize>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("Get1DArray").Execute();

			// get array's size
			var response = array.GetSize().Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_GetSize>
			Assert.Equal(5, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_1DArray_SetIndex()
		{
			// <TestResources_1DArray_SetIndex>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("Get1DArray").Execute();

			// set array's index
			array.SetIndex("seven", 4).Execute();

			// get index from array
			var response = array.GetIndex(4).Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_SetIndex>
			array.SetIndex("five", 4).Execute();
			Assert.Equal("seven", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_1DArray_Iterate()
		{
			// <TestResources_1DArray_Iterate>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("Get1DArray").Execute();

			// get array's size
			int arraySize = (int)array.GetSize().Execute().GetValue();

			// create local array and store elements in it
			string[] arrayValues = new string[arraySize];
			int i = 0;
			foreach (var element in array)
			{
				arrayValues[i] = (string)element.InvokeInstanceMethod("ToUpper").Execute().GetValue();
				i++;
			}

			// write result to console
			System.Console.WriteLine(string.Join("\t", arrayValues));
			// </TestResources_1DArray_Iterate>
			Assert.Equal(new string[] { "ONE", "TWO", "THREE", "FOUR", "FIVE" }, arrayValues);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_1DArray_GetElement()
		{
			// <TestResources_1DArray_GetElement>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var array = instance.InvokeInstanceMethod("Get1DArray").Execute();

			// invoke method on array's element
			var response = array[2].InvokeInstanceMethod("ToUpper").Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_GetElement>
			Assert.Equal("THREE", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_1DArray_PassArrayAsArgument()
		{
			// <TestResources_1DArray_PassArrayAsArgument>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var response = instance.InvokeInstanceMethod("AddArrayElementsAndMultiply", new double[] { 12.22, 98.22, -10.44 }, 9.99).Execute();

			// get value from response
			var result = (double)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// <TestResources_1DArray_PassArrayAsArgument>
			Assert.Equal(999.0, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_1DArray_RetrieveArray()
		{
			// <TestResources_1DArray_RetrieveArray>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance().Execute();

			// invoke instance's method
			var arrayReference = instance.InvokeInstanceMethod("Get1DArray").Execute();

			// get value from array reference
			var result = (string[])arrayReference.RetrieveArray();

			// write result to console
			System.Console.WriteLine(string.Join("\t", result));
			// </TestResources_1DArray_RetrieveArray>
			Assert.Equal(new string[] { "one", "two", "three", "four", "five" }, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_Cast_ToUInt32()
		{
			// <TestResources_Cast_ToUInt>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// invoke type's static method
			var response = calledRuntimeType.InvokeStaticMethod("CastSampleMethod", calledRuntime.Cast("System.UInt32", 5.2)).Execute();

			// get value from response
			string result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_Cast_ToUInt>
			Assert.Equal("CastSampleMethod with System.UInt32 called", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_Cast_ToFloat()
		{
			// <TestResources_Cast_ToFloat>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// invoke type's static method
			var response = calledRuntimeType.InvokeStaticMethod("CastSampleMethod", calledRuntime.Cast("System.Single", 5)).Execute();

			// get value from response
			string result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_Cast_ToFloat>
			Assert.Equal("CastSampleMethod with System.Single called", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException()
		{
			// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// invoke type's static method which throws exception
			try
			{
				var response = calledRuntimeType.InvokeStaticMethod("DivideBy", 10, 0).Execute();
			}
			catch (System.ArithmeticException e)
			{
				// write result to console
				System.Console.WriteLine(e.Message);
				return;
			}
			// </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
			Assert.Fail("No exception occurred - test failed");
		}

        [Fact]
        [Trait("Test", "Functional")]
        public void Test_NetframeworkDll_TestResources_GenericStaticMethod()
        {
            // <TestResources_GenericStaticMethod>
            // use Activate only once in your app
            Javonet.Activate("your-email", "your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.dll";
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // invoke type's generic static method
            var response = calledRuntimeType.
                InvokeGenericStaticMethod("GenericSampleStaticMethod", "System.Int32", 7, 5).
                Execute();

            // get value from response
            string result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_GenericStaticMethod>
            Assert.Equal("7 and 5", result);
        }

        [Fact]
        [Trait("Test", "Functional")]
        public void Test_NetframeworkDll_TestResources_GenericMethod()
        {
            // <TestResources_GenericMethod>
            // use Activate only once in your app
            Javonet.Activate("your-email", "your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.dll";
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke type's generic method
            var response = instance.
                InvokeGenericMethod("GenericSampleMethod", "System.Int32", 7, 5).
                Execute();

            // get value from response
            string result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_GenericMethod>
            Assert.Equal("7 or 5", result);
        }

        [Fact]
        [Trait("Test", "Functional")]
        public void Test_NetframeworkDll_TestResources_GenericMethodWithTwoTypes()
        {
            // <TestResources_GenericMethodWithTwoTypes>
            // use Activate only once in your app
            Javonet.Activate("your-email", "your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.dll";
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // create type's instance
            var instance = calledRuntimeType.CreateInstance().Execute();

            // invoke type's generic method
            var response = instance.
                InvokeGenericMethod("GenericSampleMethodWithTwoTypes", new string[] { "System.String", "System.Int32" }, "test").
            Execute();

            // get value from response
            int result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_GenericMethodWithTwoTypes>
            Assert.Equal(0, result);
        }

        [Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_StandardLibrary_GetStaticField()
		{
			// <StandardLibrary_GetStaticField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType("System.Math").Execute();

			// get type's static field 
			var response = calledRuntimeType.GetStaticField("PI").Execute();

			// get value from response
			var result = (double)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_GetStaticField>
			Assert.Equal(System.Math.PI, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_StandardLibrary_GetInstanceField()
		{
			// <StandardLibrary_GetInstanceField>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType("System.DateTime").Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(2022, 9, 1).Execute();

			// get instance's field 
			var response = instance.GetInstanceField("Year").Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_GetInstanceField>
			Assert.Equal(2022, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_StandardLibrary_InvokeStaticMethod()
		{
			// <StandardLibrary_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType("System.Math").Execute();

			// invoke type's static method 
			var response = calledRuntimeType.InvokeStaticMethod("Abs", -50).Execute();

			// get value from response
			var result = (int)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_InvokeStaticMethod>
			Assert.Equal(50, result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_StandardLibrary_InvokeInstanceMethod()
		{
			// <StandardLibrary_InvokeInstanceMethod>
			// use Activate only once in your app
			Javonet.Activate("your-email", "your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType("System.DateTime").Execute();

			// create type's instance
			var instance = calledRuntimeType.CreateInstance(2022, 9, 1).Execute();

			// invoke instance's method
			var response = instance.InvokeInstanceMethod("ToShortDateString").Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </StandardLibrary_InvokeInstanceMethod>
			Assert.Contains("2022", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_StandardLibrary_PassInstanceAsArgument()
		{
			var cultureInfoEs = Javonet.InMemory().Clr().GetType("System.Globalization.CultureInfo").CreateInstance("es-ES", false).Execute();
			var cultureInfoPl = Javonet.InMemory().Clr().GetType("System.Globalization.CultureInfo").CreateInstance("pl-PL", false).Execute();
			var cultureInfoDe = Javonet.InMemory().Clr().GetType("System.Globalization.CultureInfo").CreateInstance("de-De", false).Execute();
			var cultureInfoJa = Javonet.InMemory().Clr().GetType("System.Globalization.CultureInfo").CreateInstance("ja-JP", false).Execute();
			var cultureInfoUk = Javonet.InMemory().Clr().GetType("System.Globalization.CultureInfo").InvokeStaticMethod("GetCultureInfo", "uk-Ua").Execute();

			var instance = Javonet.InMemory().Clr().GetType("System.DateTime").CreateInstance(2022, 09, 13, 8, 24, 22).Execute();

			Assert.Equal("martes, 13 de septiembre de 2022 8:24:22", instance.InvokeInstanceMethod("ToString", "F", cultureInfoEs).Execute().GetValue().ToString());
			Assert.Equal("wtorek, 13 września 2022 08:24:22", instance.InvokeInstanceMethod("ToString", "F", cultureInfoPl).Execute().GetValue().ToString());
			Assert.Equal("Dienstag, 13. September 2022 08:24:22", instance.InvokeInstanceMethod("ToString", "F", cultureInfoDe).Execute().GetValue().ToString());
			Assert.Equal("2022年9月13日 8:24:22", instance.InvokeInstanceMethod("ToString", "F", cultureInfoJa).Execute().GetValue().ToString());
			Assert.Equal("13 вересня 2022 р. 8:24:22", instance.InvokeInstanceMethod("ToString", "F", cultureInfoUk).Execute().GetValue().ToString());
		}
#endif
	}
}