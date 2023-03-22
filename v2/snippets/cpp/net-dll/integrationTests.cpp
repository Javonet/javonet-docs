#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>

using namespace JavonetNS::Cpp::Sdk;

namespace CppToNetcoreIntegrationTests {

#ifdef _WIN32
	auto currentWorkingDir = _getcwd(nullptr, 0);
#else
	auto currentWorkingDir = getcwd(nullptr, 0);
#endif //_WIN32
	const std::string resourcesDirectory = std::string(currentWorkingDir) + std::string("/testResources/net-dll");


	TEST(Integration, Test_Netcore_StandardLibrary_InvokeStaticMethod_SystemMath_Abs_minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto netcoreRuntime = Javonet::InMemory()->Netcore();

		// get type from the runtime
		auto netcoreType = netcoreRuntime->GetType("System.Math")->Execute();

		// invoke type's static method 
		auto response = netcoreType->InvokeStaticMethod({ "Abs", -50 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Netcore_StandardLibrary_GetStaticField_SystemMathPI_PI) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto netcoreRuntime = Javonet::InMemory()->Netcore();

		// get type from the runtime
		auto netcoreType = netcoreRuntime->GetType("System.Math")->Execute();

		// get type's static field
		auto response = netcoreType->GetStaticField("PI")->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ(M_PI, result);
	}

	TEST(Integration, Test_Netcore_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022) {

		// <StandardLibrary_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto netcoreRuntime = Javonet::InMemory()->Netcore();

		// get type from the runtime
		auto netcoreType = netcoreRuntime->GetType("System.DateTime")->Execute();

		// create type's instance
		auto instance = netcoreType->CreateInstance({ 2022, 5, 9 })->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("ToShortDateString")->Execute();

		// get value from response
		auto result = std::any_cast<std::u8string>(response->GetValue());

		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_NE(std::u8string::npos, result.find(u8"2022"));
	}

	TEST(Integration, Test_Netcore_StandardLibrary_GetInstanceFField_SystemDateTime_Year_2022) {

		// <StandardLibrary_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto netcoreRuntime = Javonet::InMemory()->Netcore();

		// get type from the runtime
		auto netcoreType = netcoreRuntime->GetType("System.DateTime")->Execute();

		// create type's instance
		auto instance = netcoreType->CreateInstance({ 2022, 5, 9 })->Execute();

		// invoke instance's method
		auto response = instance->GetInstanceField("Year")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(2022, result);
	}

	TEST(Integration, Test_Netcore_TestResources_LoadLibrary_libraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto netcoreRuntime = Javonet::InMemory()->Netcore();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";

		// load custom library
		netcoreRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Netcore_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto netcoreRuntime = Javonet::InMemory()->Netcore();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		netcoreRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto netcoreType = netcoreRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = netcoreType->InvokeStaticMethod({ "MultiplyByTwo", 25 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Netcore_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto netcoreRuntime = Javonet::InMemory()->Netcore();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		netcoreRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto netcoreType = netcoreRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = netcoreType->GetStaticField("StaticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_Netcore_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto netcoreRuntime = Javonet::InMemory()->Netcore();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		netcoreRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto netcoreType = netcoreRuntime->GetType(className)->Execute();

		// set type's static field
		netcoreType->SetStaticField({ "StaticValue", 75 })->Execute();

		// get type's static field
		auto response = netcoreType->GetStaticField("StaticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		netcoreType->SetStaticField({ "StaticValue", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_Netcore_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto netcoreRuntime = Javonet::InMemory()->Netcore();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		netcoreRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto netcoreType = netcoreRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = netcoreType->CreateInstance({ 1,2 })->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod({ "MultiplyTwoNumbers", 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_Netcore_TestResources_GetInstanceField_PublicValue_18) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create NETCORE runtime context
		auto netcoreRuntime = Javonet::InMemory()->Netcore();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		netcoreRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto netcoreType = netcoreRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = netcoreType->CreateInstance({ 18,19 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("PublicValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetInstanceField>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(18, result);
	}
}
