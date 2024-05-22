using Javonet.Netcore.Sdk.Internal;
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
			var result = Javonet.Activate(ActivationCredentials.yourLicenseKey);
			Assert.Equal(0, result);
		}
		private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/netframework-dll";
#if _WINDOWS

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_StandardLibrary_CreateRuntimeContext()
        {
            //<StandardLibrary_CreateRuntimeContext>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // use calledRuntime to interact with code from other technology
            //</StandardLibrary_CreateRuntimeContext>
            Assert.NotNull(calledRuntime);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_StandardLibrary_CreateInvocationContext()
        {
            //<StandardLibrary_CreateInvocationContext>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // construct an invocation context - this invocationContext in non-materialized 
            var invocationContext = calledRuntime.GetType("System.Math").
                InvokeStaticMethod("Abs", -50);

            // execute invocation context - this will materialize the invocationContext
            var response = invocationContext.Execute();
            //</StandardLibrary_CreateInvocationContext>
            Assert.NotNull(response);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_StandardLibrary_GetValue()
        {
            // <StandardLibrary_GetValue>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // construct an invocation context - this invocationContext in non-materialized 
            var invocationContext = calledRuntime.GetType("System.Math").
                InvokeStaticMethod("Abs", -50);

            // execute invocation context - this will materialize the invocationContext
            var response = invocationContext.Execute();

            // get value from response
            var result = (int)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </StandardLibrary_GetValue>
            Assert.Equal(50, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_StandardLibrary_GetStaticField()
        {
            // <StandardLibrary_GetStaticField>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

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
            Javonet.Activate("your-license-key");

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
            Javonet.Activate("your-license-key");

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
            Javonet.Activate("your-license-key");

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
		public void Test_NetframeworkDll_TestResources_LoadLibrary()
		{
			// <TestResources_LoadLibrary>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			array.SetIndex(4, "seven").Execute();

			// get index from array
			var response = array.GetIndex(4).Execute();

			// get value from response
			var result = (string)response.GetValue();

			// write result to console
			System.Console.WriteLine(result);
			// </TestResources_1DArray_SetIndex>
			array.SetIndex(4, "five").Execute();
			Assert.Equal("seven", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_1DArray_Iterate()
		{
			// <TestResources_1DArray_Iterate>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

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
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // get type for casting
            var targetType = calledRuntime.GetType("System.UInt32");

            // invoke type's static method
            var response = calledRuntimeType.
                InvokeStaticMethod("CastSampleMethod",
                                    calledRuntime.Cast(targetType, 5.2)).
                Execute();

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
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // get type for casting
            var targetType = calledRuntime.GetType("System.Single");

            // invoke type's static method
            var response = calledRuntimeType.InvokeStaticMethod("CastSampleMethod", calledRuntime.Cast(targetType, 5)).Execute();

            // get value from response
            string result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
			// </TestResources_Cast_ToFloat>
			Assert.Equal("CastSampleMethod with System.Single called", result);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0()
		{
			// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

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
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_TestResources_GenericStaticMethod()
        {
            // <TestResources_GenericStaticMethod>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.dll";
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // get type for generic method
            var targetType = calledRuntime.GetType("System.Int32");

            // invoke type's generic static method
            var response = calledRuntimeType.
                           InvokeGenericStaticMethod("GenericSampleStaticMethod", targetType, 7, 5).
                            Execute();

            // get value from response
            string result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_GenericStaticMethod>
            Assert.Equal("7 and 5", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_TestResources_GenericMethod()
        {
            // <TestResources_GenericMethod>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

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

            // get type for generic method
            var targetType = calledRuntime.GetType("System.Int32");

            // invoke type's generic method
            var response = instance.
                            InvokeGenericMethod("GenericSampleMethod",
                                                targetType, 7, 5).
                            Execute();

            // get value from response
            string result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_GenericMethod>
            Assert.Equal("7 or 5", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_TestResources_GenericMethodWithTwoTypes()
        {
            // <TestResources_GenericMethodWithTwoTypes>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

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

            // get types for generic method
            var targetType1 = calledRuntime.GetType("System.String");
            var targetType2 = calledRuntime.GetType("System.Int32");

            // invoke type's generic method
            var response = instance.
                           InvokeGenericMethod("GenericSampleMethodWithTwoTypes",
                                                new InvocationContext[] { targetType1, targetType2 },
                                                "test").
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
        public void Test_NetframeworkDll_TestResources_EnumAddToList()
        {
            // <TestResources_EnumAddToList>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.dll";
            string className = "TestClass.TestClass";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            //get enum
            var enumType = calledRuntime.GetType("TestClass.TestClass+Fruit");

            //create enum items
            var apple = calledRuntime.GetEnumItem(enumType, "Apple");
            var mango = calledRuntime.GetEnumItem(enumType, "Mango");

            // create fruits array
            InvocationContext[] fruitsList = { apple, mango };

            // get type from the runtime
            var calledRuntimeType = calledRuntime.GetType(className).Execute();

            // invoke type's static method
            var response = calledRuntimeType.
                           InvokeStaticMethod("AddFruitsToList", (object)fruitsList).
                           Execute();

            // get value from response
            string result = (string)response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_EnumAddToList>
            Assert.Equal("2 fruits on the list", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_TestResources_EnumNameAndValue()
        {
            // <TestResources_EnumNameAndValue>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // set up variables
            string libraryPath = resourcesDirectory + "/TestClass.dll";

            // load custom library
            calledRuntime.LoadLibrary(libraryPath);

            //get enum
            var enumType = calledRuntime.GetType("TestClass.TestClass+Fruit");

            //create enum items
            var fruit1 = calledRuntime.GetEnumItem(enumType, "Mango");
            var fruit2 = calledRuntime.GetEnumItem(enumType, "Orange");

            //get items' names and values
            var fruit1Name = (string)fruit1.GetEnumName().Execute().GetValue();
            var fruit2Name = (string)fruit2.GetEnumName().Execute().GetValue();
            var fruit1Value = (int)fruit1.GetEnumValue().Execute().GetValue();
            var fruit2Value = (int)fruit2.GetEnumValue().Execute().GetValue();


            // write result to console
            System.Console.WriteLine("{0}: {1}, {2}: {3}", fruit1Name, fruit1Value, fruit2Name, fruit2Value);
            // </TestResources_EnumNameAndValue>
            Assert.Equal("Mango", fruit1Name);
            Assert.Equal("Orange", fruit2Name);
            Assert.Equal(3, fruit1Value);
            Assert.Equal(2, fruit2Value);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_TestResources_2DArray_GetIndex()
        {
            // <TestResources_2DArray_GetIndex>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

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
            var array = instance.InvokeInstanceMethod("Get2DArray").Execute();

            // three ways to get elements from array
            var response1 = array[1, 1].Execute();
            var response2 = array.GetIndex(1, 0).Execute();
            var response3 = array.GetIndex(new int[] { 0, 1 }).Execute();


            // get value from response
            var result1 = response1.GetValue();
            var result2 = response2.GetValue();
            var result3 = response3.GetValue();

            // write result to console
            System.Console.WriteLine(result1);
            System.Console.WriteLine(result2);
            System.Console.WriteLine(result3);
            // </TestResources_2DArray_GetIndex>
            Assert.Equal("S11", result1);
            Assert.Equal("S10", result2);
            Assert.Equal("S01", result3);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_TestResources_2DArray_GetSizeAndRank()
        {
            // <TestResources_2DArray_GetSizeAndRank>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

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
            var array = instance.InvokeInstanceMethod("Get2DArray").Execute();

            // three ways to get elements from array
            var response1 = array.GetSize().Execute();
            var response2 = array.GetRank().Execute();

            // get value from response
            var result1 = response1.GetValue();
            var result2 = response2.GetValue();

            // write result to console
            System.Console.WriteLine(result1);
            System.Console.WriteLine(result2);

            // </TestResources_2DArray_GetSizeAndRank>
            Assert.Equal(4, result1);
            Assert.Equal(2, result2);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_TestResources_2DArray_SetIndex()
        {
            // <TestResources_2DArray_SetIndex>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

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
            var array = instance.InvokeInstanceMethod("Get2DArray").Execute();

            // set element of array
            array.SetIndex(new int[] { 0, 1 }, "new value").Execute();

            // get element from array
            var response = array[0, 1].Execute();

            // get value from response
            var result = response.GetValue();

            // write result to console
            System.Console.WriteLine(result);
            // </TestResources_2DArray_SetIndex>
            Assert.Equal("new value", result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_StandardLibrary_CreateInstanceOfGenericClass()
        {
            //<StandardLibrary_CreateInstanceOfGenericClass>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // get string type
            var stringType = calledRuntime.GetType("System.String");

            // get generic class with string type as parameter
            var typeList = calledRuntime.GetType("System.Collections.Generic.List`1", stringType).Execute();

            // create instance of generic class
            var list = typeList.CreateInstance().Execute();

            // invoke some instance methods
            list.InvokeInstanceMethod("Add", "one").Execute();
            list.InvokeInstanceMethod("Add", "two").Execute();
            list.InvokeInstanceMethod("Add", "three").Execute();
            list.InvokeInstanceMethod("AddRange", (object)new string[] { "four", "five", "six" }).Execute();

            // check number of elements in list
            var response = list.GetInstanceField("Count").Execute();
            var result = response.GetValue();

            // write result to console
            System.Console.WriteLine(result);

            //</StandardLibrary_CreateInstanceOfGenericClass>
            Assert.Equal(6, result);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_StandardLibrary_HandleList()
        {
            // <StandardLibrary_HandleList>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // get string type
            var stringType = calledRuntime.GetType("System.String");

            // get generic class with string type as parameter
            var typeList = calledRuntime.GetType("System.Collections.Generic.List`1", stringType).Execute();

            // create instance of generic class
            var list = typeList.CreateInstance().Execute();

            // invoke instance method
            list.InvokeInstanceMethod("AddRange", (object)new string[] { "one", "two", "three", "four", "five", "six" }).Execute();

            // get elements from list
            var element0 = list[0].Execute();
            var element1 = list.GetIndex(1).Execute();

            var result0 = element0.GetValue();
            var result1 = element1.GetValue();

            // get size of list
            var size = list.GetSize().Execute().GetValue();

            // write results to console
            System.Console.WriteLine(result0);
            System.Console.WriteLine(result1);
            System.Console.WriteLine(size);
            // </StandardLibrary_HandleList>
            Assert.Equal("one", result0);
            Assert.Equal("two", result1);
            Assert.Equal(6, size);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_NetframeworkDll_StandardLibrary_HandleDictionary()
        {
            // <StandardLibrary_HandleDictionary>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // create called runtime context
            var calledRuntime = Javonet.InMemory().Clr();

            // get string type
            var stringType = calledRuntime.GetType("System.String");
            var doubleType = calledRuntime.GetType("System.Double");

            // get generic class with string type as parameter
            var typeDictionary = calledRuntime.GetType("System.Collections.Generic.Dictionary`2", stringType, doubleType).Execute();

            // create instance of generic class
            var dictionary = typeDictionary.CreateInstance().Execute();

            // invoke instance method
            dictionary.InvokeInstanceMethod("Add", "pi", System.Math.PI).Execute();
            dictionary.InvokeInstanceMethod("Add", "e", System.Math.E).Execute();
            dictionary.InvokeInstanceMethod("Add", "c", 299792458.0).Execute();

            // get elements from dictionary
            var response1 = dictionary["c"].Execute();
            var response2 = dictionary.GetIndex("e").Execute();

            var c_value = response1.GetValue();
            var e_value = response2.GetValue();

            // write results to console
            System.Console.WriteLine(c_value);
            System.Console.WriteLine(e_value);
            // </StandardLibrary_HandleDictionary>
            Assert.Equal(299792458.0, c_value);
            Assert.Equal(System.Math.E, e_value);
        }

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_Refs_OneArg()
		{
			// <TestResources_Refs>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();

			// create values for ref

			// first way - pass only value
			var refValue1 = calledRuntime.AsRef(10).Execute();

			// second way - pass value and type
			// ref variable should have specific type to be able to invoke methods on it
			// this way enables to cast value to specific type needed by called method
			var intType = calledRuntime.GetType("System.Int32").Execute();
			var refValue2 = calledRuntime.AsRef(20.0, intType).Execute();

			// invoke type's static method with ref values
			calledRuntimeType.InvokeStaticMethod("RefSampleMethod", refValue1).Execute();
			calledRuntimeType.InvokeStaticMethod("RefSampleMethod", refValue2).Execute();

			// get ref values
			var result1 = refValue1.GetRefValue().Execute().GetValue();
			var result2 = refValue2.GetRefValue().Execute().GetValue();

			// write result to console
			System.Console.WriteLine(result1);
			System.Console.WriteLine(result2);
			// </TestResources_Refs>
			Assert.Equal(20, result1);
			Assert.Equal(40, result2);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_Refs_MultipleArgs()
		{
			// <TestResources_Refs_MultipleArgs>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();
			var doubleType = calledRuntime.GetType("System.Double").Execute();

			// create values for ref
			// ref variable should have specific type to be able to invoke methods on it
			// This way enables to cast value to specific type needed by called method
			var refToInt = calledRuntime.AsRef(10).Execute();
			var refToDouble = calledRuntime.AsRef(5, doubleType).Execute();
			var refToString = calledRuntime.AsRef("Before execution").Execute();

			// invoke type's static method with ref values
			calledRuntimeType.InvokeStaticMethod("RefSampleMethod2", refToInt, refToDouble, refToString).Execute();

			// get ref values
			var result1 = refToInt.GetRefValue().Execute().GetValue();
			var result2 = refToDouble.GetRefValue().Execute().GetValue();
			var result3 = refToString.GetRefValue().Execute().GetValue();

			// write result to console
			System.Console.WriteLine(result1);
			System.Console.WriteLine(result2);
			System.Console.WriteLine(result3);
			// </TestResources_Refs_MultipleArgs>
			Assert.Equal(20, result1);
			Assert.Equal(2.5, result2);
			Assert.Equal("Done", result3);
		}

		[Fact]
		[Trait("Test", "Integration")]
		public void Test_NetframeworkDll_TestResources_Outs()
		{
			// <TestResources_Outs>
			// use Activate only once in your app
			Javonet.Activate("your-license-key");

			// create called runtime context
			var calledRuntime = Javonet.InMemory().Clr();

			// set up variables
			string libraryPath = resourcesDirectory + "/TestClass.dll";
			string className = "TestClass.TestClass";

			// load custom library
			calledRuntime.LoadLibrary(libraryPath);

			// get type from the runtime
			var calledRuntimeType = calledRuntime.GetType(className).Execute();
			var stringType = calledRuntime.GetType("System.String").Execute();

			// create values for outs
			// out variable should have specific type to be able to invoke methods on it
			// first way - pass only type
			var outValue_1 = calledRuntime.AsOut(stringType).Execute();
			// second way - pass initial value and type to cast on
			var outValue_2 = calledRuntime.AsOut('c', stringType).Execute();
			// third way - pass initial value without specific type
			var outValue_3 = calledRuntime.AsOut("Test string").Execute();

			// invoke type's static method with out values
			calledRuntimeType.InvokeStaticMethod("OutSampleMethod", outValue_1).Execute();
			calledRuntimeType.InvokeStaticMethod("OutSampleMethod", outValue_2).Execute();
			calledRuntimeType.InvokeStaticMethod("OutSampleMethod", outValue_3).Execute();

			// get outs' values
			var result1 = outValue_1.GetRefValue().Execute().GetValue();
			var result2 = outValue_2.GetRefValue().Execute().GetValue();
			var result3 = outValue_3.GetRefValue().Execute().GetValue();

			// write result to console
			System.Console.WriteLine(result1);
			System.Console.WriteLine(result2);
			System.Console.WriteLine(result3);

			// </TestResources_Outs>
			Assert.Equal("String from OutSampleMethod", result1);
			Assert.Equal("String from OutSampleMethod", result2);
			Assert.Equal("String from OutSampleMethod", result3);
		}
#endif
	}
}