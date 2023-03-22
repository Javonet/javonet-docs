#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>

using namespace JavonetNS::Cpp::Sdk;

namespace CppToRubyIntegrationTests {
#ifdef _WIN32
	auto currentWorkingDir = _getcwd(nullptr, 0);
#else
	auto currentWorkingDir = getcwd(nullptr, 0);
#endif //_WIN32
	const std::string resourcesDirectory = std::string(currentWorkingDir) + std::string("/testResources/ruby-package");

	TEST(Integration, Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Sqrt_2500_50) {
		// <StandardLibrary_InvokeStaticMethod>
				// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create RUBY runtime context
		auto rubyRuntime = Javonet::InMemory()->Ruby();

		// get type from the runtime
		auto rubyType = rubyRuntime->GetType("Math")->Execute();

		// invoke type's static method
		auto response = rubyType->InvokeStaticMethod({ "sqrt", 2500 })->Execute();

		// get value from response
		auto result = std::any_cast<float>(response->GetValue());

		// print result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Ruby_StandardLibrary_GetStaticField_MathPI_PI) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create RUBY runtime context
		auto rubyRuntime = Javonet::InMemory()->Ruby();

		// get type from the runtime
		auto rubyType = rubyRuntime->GetType("Math")->Execute();

		// get type's static field
		auto response = rubyType->GetStaticField("PI")->Execute();

		// get value from response
		auto result = std::any_cast<float>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ((float)M_PI, result);
	}

	TEST(Integration, Test_Ruby_TestResources_LoadLibrary_LibraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create RUBY runtime context
		auto rubyRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";

		// load custom library
		rubyRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create RUBY runtime context
		auto rubyRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

		// load custom library
		rubyRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto rubyType = rubyRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = rubyType->InvokeStaticMethod({ "multiply_by_two", 25 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Ruby_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create RUBY runtime context
		auto rubyRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

		// load custom library
		rubyRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto rubyType = rubyRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = rubyType->GetStaticField("static_value")->Execute();

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

		// create RUBY runtime context
		auto rubyRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

		// load custom library
		rubyRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto rubyType = rubyRuntime->GetType(className)->Execute();

		// set type's static field
		rubyType->SetStaticField({ "static_value", 75 })->Execute();

		// get type's static field
		auto response = rubyType->GetStaticField("static_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		rubyType->SetStaticField({ "staticValue", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create RUBY runtime context
		auto rubyRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

		// load custom library
		rubyRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto rubyType = rubyRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = rubyType->CreateInstance({ 1,2 })->Execute();

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

	TEST(Integration, Test_Ruby_TestResources_GetInstanceField_PublicValue_2) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create RUBY runtime context
		auto rubyRuntime = Javonet::InMemory()->Ruby();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.rb";
		auto className = "TestClass::TestClass";

		// load custom library
		rubyRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto rubyType = rubyRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = rubyType->CreateInstance({ 18,19 })->Execute();

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
