#include <gtest/gtest.h>
#include "Javonet.h"

using namespace JavonetNS::Cpp::Sdk;

namespace CppToPerlIntegrationTests {

#ifdef _WIN32
	auto currentWorkingDir = _getcwd(nullptr, 0);
#else
	auto currentWorkingDir = getcwd(nullptr, 0);
#endif //_WIN32
	const std::string resourcesDirectory = std::string(currentWorkingDir) + std::string("/testResources/perl-package");

	TEST(Integration, Test_Perl_TestResources_LoadLibrary_LibraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto perlRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto fileName = "TestClass.pm";

		// load custom library
		Javonet::InMemory()->Perl()->LoadLibrary({libraryPath, fileName});
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto perlRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto fileName = "TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		perlRuntime->LoadLibrary({libraryPath, fileName});

		// get type from the runtime
		auto perlType = perlRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = perlType->InvokeStaticMethod({ "multiply_by_two", 25 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Perl_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto perlRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto fileName = "TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		Javonet::InMemory()->Perl()->LoadLibrary({libraryPath, fileName});

		// get type from the runtime
		auto perlType = perlRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = perlType->GetStaticField("static_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_Perl_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto perlRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto fileName = "TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		perlRuntime->LoadLibrary({libraryPath, fileName});

		// get type from the runtime
		auto perlType = perlRuntime->GetType(className)->Execute();

		// set type's static field
		perlType->SetStaticField({ "static_value", 75 })->Execute();

		// get type's static field
		auto response = perlType->GetStaticField("static_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		perlType->SetStaticField({ "static_value", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto perlRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto fileName = "TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		perlRuntime->LoadLibrary({libraryPath, fileName});

		// get type from the runtime
		auto perlType = perlRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = perlType->CreateInstance({ 1,2 })->Execute();

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

	TEST(Integration, Test_Perl_TestResources_GetInstanceField_PublicValue_1) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto perlRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto fileName = "TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		perlRuntime->LoadLibrary({libraryPath, fileName});

		// get type from the runtime
		auto perlType = perlRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = perlType->CreateInstance({ 1,2 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("public_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetInstanceField>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(1, result);
	}
}