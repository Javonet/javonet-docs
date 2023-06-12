#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>
#include <filesystem>

using namespace JavonetNS::Cpp::Sdk;

namespace CppToRubyIntegrationTests {

	const auto currentWorkingDir = std::filesystem::current_path();
	const auto resourcesDirectory = currentWorkingDir.string() + "/testResources/ruby-package";

	TEST(Integration, Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Ruby_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

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

	TEST(Integration, Test_Ruby_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

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

	TEST(Integration, Test_Ruby_TestResources_GetInstanceField_PublicValue_2) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

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

	TEST(Integration, Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

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

	TEST(Integration, Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod({ "multiply_two_numbers", 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_Ruby_TestResources_1DArray_GetIndex_2_StringThree) {
		// <TestResources_1DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

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

	TEST(Integration, Test_Ruby_TestResources_1DArray_GetSize_5) {
		// <TestResources_1DArray_GetSize>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

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

	TEST(Integration, Test_Ruby_TestResources_1DArray_SetIndex_StringSeven) {
		// <TestResources_1DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

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

	TEST(Integration, Test_Ruby_StandardLibrary_GetStaticField_MathPI_PI) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("Math")->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("PI")->Execute();

		// get value from response
		auto result = std::any_cast<float>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ((float)M_PI, result);
	}

	TEST(Integration, Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Sqrt_2500_50) {
		// <StandardLibrary_InvokeStaticMethod>
				// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Ruby();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("Math")->Execute();

		// invoke type's static method
		auto response = calledRuntimeType->InvokeStaticMethod({ "sqrt", 2500 })->Execute();

		// get value from response
		auto result = std::any_cast<float>(response->GetValue());

		// print result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}
}
