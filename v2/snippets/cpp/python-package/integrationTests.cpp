#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>
#include <filesystem>

using namespace JavonetNS::Cpp::Sdk;

namespace CppToPythonIntegrationTests {

	const auto currentWorkingDir = std::filesystem::current_path();
	const auto resourcesDirectory = currentWorkingDir.string() + "/testResources/python-package";

	TEST(Integration, Test_Python_TestResources_LoadLibrary_LibraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Python_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("static_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_Python_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// set type's static field
		calledRuntimeType->SetStaticField({ "static_value", 75 })->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("static_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		calledRuntimeType->SetStaticField({ "staticValue", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_Python_TestResources_GetInstanceField_PublicValue_18) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 18,19 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("public_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetInstanceField>
		EXPECT_EQ(18, result);
	}

	TEST(Integration, Test_Python_TestResources_SetInstanceField_PublicValue_44) {
		// <TestResources_SetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 18,19 })->Execute();

		// set instance's field
		instance->SetInstanceField({ "public_value", 44 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("public_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetInstanceField>
		EXPECT_EQ(44, result);
	}

	TEST(Integration, Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod({ "multiply_by_two", 25 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod({ "multiply_two_numbers", 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_Python_TestResources_1DArray_GetIndex_2_StringThree) {
		// <TestResources_1DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get_1d_array")->Execute();

		// get index from array
		auto response = arrayReference->GetIndex(2)->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetIndex>
		EXPECT_EQ("three", result);
	}

	TEST(Integration, Test_Python_TestResources_1DArray_GetSize_5) {
		// <TestResources_1DArray_GetSize>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get_1d_array")->Execute();

		// get array's size
		auto response = arrayReference->GetSize()->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetSize>
		EXPECT_EQ(5, result);
	}

	TEST(Integration, Test_Python_TestResources_1DArray_SetIndex_StringSeven) {
		// <TestResources_1DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get_1d_array")->Execute();

		// set array's index
		arrayReference->SetIndex({ "seven", 4 })->Execute();

		// get index from array
		auto response = arrayReference->GetIndex(4)->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_SetIndex>
		EXPECT_EQ("seven", result);
	}

	TEST(Integration, Test_Python_TestResources_1DArray_RetrieveArray) {
		// <TestResources_1DArray_RetrieveArray>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get_1d_array")->Execute();

		// get array from reference
		auto response = arrayReference->RetrieveArray();

		auto result = std::any_cast<std::deque<std::any>>(response);

		auto resultArray = std::vector<std::string>(result.size());

		for (int i = 0; i < result.size(); i++) {
			resultArray[i] = std::any_cast<std::string>(result[i]);
			// write result to console
			std::cout << resultArray[i] << "\t";
		}
		// </TestResources_1DArray_RetrieveArray>
		std::cout << std::endl;
		auto expectedResponse = std::vector<std::string>{ "one", "two" , "three", "four", "five" };
		EXPECT_EQ(expectedResponse.size(), resultArray.size());
		for (int i = 0; i < resultArray.size(); ++i) {
			EXPECT_EQ(expectedResponse[i], resultArray[i]);
		}
	}

	TEST(Integration, Test_Python_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException) {
		// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method which throws exception 
		try {
			calledRuntimeType->InvokeStaticMethod({ "divide_by", 10, 0 })->Execute();
		}
		catch (std::exception& e) {
			// write exception to console
			std::cout << e.what() << std::endl;
			return;
		}
		// </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		GTEST_FAIL();
	}

	TEST(Integration, Test_Python_StandardLibrary_GetStaticField_MathPI_PI) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("math")->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("pi")->Execute();

		// get value from response
		auto result = std::any_cast<float>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ((float)M_PI, result);
	}

	TEST(Integration, Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("builtins")->Execute();

		// invoke type's static method
		auto response = calledRuntimeType->InvokeStaticMethod({ "abs", -50 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// print result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}
}
