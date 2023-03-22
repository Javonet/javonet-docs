#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>
#include <filesystem>

using namespace JavonetNS::Cpp::Sdk;

namespace CppToPythonIntegrationTests {
#ifdef _WIN32
	auto currentWorkingDir = _getcwd(nullptr, 0);
#else
	auto currentWorkingDir = getcwd(nullptr, 0);
#endif //_WIN32
	const std::string resourcesDirectory = std::string(currentWorkingDir) + std::string("/testResources/python-package");

	TEST(Integration, Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create PYTHON runtime context
		auto pythonRuntime = Javonet::InMemory()->Python();

		// get type from the runtime
		auto pythonType = pythonRuntime->GetType("builtins")->Execute();

		// invoke type's static method
		auto response = pythonType->InvokeStaticMethod({ "abs", -50 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// print result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Python_StandardLibrary_GetStaticField_MathPI_PI) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create PYTHON runtime context
		auto pythonRuntime = Javonet::InMemory()->Python();

		// get type from the runtime
		auto pythonType = pythonRuntime->GetType("math")->Execute();

		// get type's static field
		auto response = pythonType->GetStaticField("pi")->Execute();

		// get value from response
		auto result = std::any_cast<float>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ((float)M_PI, result);
	}

	TEST(Integration, Test_Python_TestResources_LoadLibrary_LibraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create PYTHON runtime context
		auto pythonRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;

		// load custom library
		pythonRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create PYTHON runtime context
		auto pythonRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		pythonRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto pythonType = pythonRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = pythonType->InvokeStaticMethod({ "multiply_by_two", 25 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Python_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create PYTHON runtime context
		auto pythonRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		pythonRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto pythonType = pythonRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = pythonType->GetStaticField("static_value")->Execute();

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

		// create PYTHON runtime context
		auto pythonRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		pythonRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto pythonType = pythonRuntime->GetType(className)->Execute();

		// set type's static field
		pythonType->SetStaticField({ "static_value", 75 })->Execute();

		// get type's static field
		auto response = pythonType->GetStaticField("static_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		pythonType->SetStaticField({ "staticValue", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create PYTHON runtime context
		auto pythonRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		pythonRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto pythonType = pythonRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = pythonType->CreateInstance({ 1,2 })->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod({ "multiply_two_numbers", 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_Python_TestResources_GetInstanceField_PublicValue_18) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create PYTHON runtime context
		auto pythonRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		pythonRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto pythonType = pythonRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = pythonType->CreateInstance({ 18,19 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("public_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetInstanceField>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(18, result);
	}
}
