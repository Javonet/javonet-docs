#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>

using namespace JavonetNS::Cpp::Sdk;

namespace CppToNodejsIntegrationTests {

#ifdef _WIN32
	auto currentWorkingDir = _getcwd(nullptr, 0);
#else
	auto currentWorkingDir = getcwd(nullptr, 0);
#endif //_WIN32
	const std::string resourcesDirectory = std::string(currentWorkingDir) + std::string("/testResources/nodejs-package");

	TEST(Integration, Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NODEJS runtime context
		auto nodejsRuntime = Javonet::InMemory()->Nodejs();

		// get type from the runtime
		auto nodejsType = nodejsRuntime->GetType("Math")->Execute();

		// invoke type's static method 
		auto response = nodejsType->InvokeStaticMethod({ "abs", -50 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Nodejs_StandardLibrary_GetStaticField_MathPI_PI) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NODEJS runtime context
		auto nodejsRuntime = Javonet::InMemory()->Nodejs();

		// get type from the runtime
		auto nodejsType = nodejsRuntime->GetType("Math")->Execute();

		// get type's static field
		auto response = nodejsType->GetStaticField("PI")->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ((double)M_PI, result);
	}

	TEST(Integration, Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NODEJS runtime context
		auto nodejsRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";

		// load custom library
		Javonet::InMemory()->Nodejs()->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Nodejs_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NODEJS runtime context
		auto nodejsRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		nodejsRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto nodejsType = nodejsRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = nodejsType->InvokeStaticMethod({ "multiplyByTwo", 25 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Nodejs_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NODEJS runtime context
		auto nodejsRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		nodejsRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto nodejsType = nodejsRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = nodejsType->GetStaticField("staticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_Nodejs_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NODEJS runtime context
		auto nodejsRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		nodejsRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto nodejsType = nodejsRuntime->GetType(className)->Execute();

		// set type's static field
		nodejsType->SetStaticField({ "staticValue", 75 })->Execute();

		// get type's static field
		auto response = nodejsType->GetStaticField("staticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		nodejsType->SetStaticField({ "staticValue", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NODEJS runtime context
		auto nodejsRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		nodejsRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto nodejsType = nodejsRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = nodejsType->CreateInstance({ 1,2 })->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod({ "multiplyTwoNumbers", 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_Nodejs_TestResources_GetInstanceField_PublicValue_18) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NODEJS runtime context
		auto nodejsRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		nodejsRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto nodejsType = nodejsRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = nodejsType->CreateInstance({ 18,19 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("publicValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetInstanceField>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(18, result);
	}
}
