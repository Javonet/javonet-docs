#ifdef _WIN32
#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>
#include <filesystem>

using namespace JavonetNS::Cpp::Sdk;

namespace CppToClrIntegrationTests {

	const auto currentWorkingDir = std::filesystem::current_path();
	const auto resourcesDirectory = currentWorkingDir.string() + "/testResources/netframework-dll";

	TEST(Integration, Test_Clr_TestResources_LoadLibrary_libraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Clr_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("StaticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_Clr_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// set type's static field
		calledRuntimeType->SetStaticField({ "StaticValue", 75 })->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("StaticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		calledRuntimeType->SetStaticField({ "StaticValue", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_Clr_TestResources_GetInstanceField_PublicValue_18) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 18,19 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("PublicValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetInstanceField>
		EXPECT_EQ(18, result);
	}

	TEST(Integration, Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod({ "MultiplyByTwo", 25 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod({ "MultiplyTwoNumbers", 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_Clr_TestResources_1DArray_GetIndex_2_StringThree) {
		// <TestResources_1DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("Get1DArray")->Execute();

		// get index from array
		auto response = arrayReference->GetIndex(2)->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetIndex>
		EXPECT_EQ("three", result);
	}

	TEST(Integration, Test_Clr_TestResources_1DArray_GetSize_5) {
		// <TestResources_1DArray_GetSize>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("Get1DArray")->Execute();

		// get array's size
		auto response = arrayReference->GetSize()->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetSize>
		EXPECT_EQ(5, result);
	}

	TEST(Integration, Test_Clr_TestResources_1DArray_SetIndex_StringSeven) {
		// <TestResources_1DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("Get1DArray")->Execute();

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

	TEST(Integration, Test_Clr_StandardLibrary_GetStaticField_SystemMathPI_PI) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("System.Math")->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("PI")->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ(M_PI, result);
	}

	TEST(Integration, Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022) {

		// <StandardLibrary_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("System.DateTime")->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 2022, 5, 9 })->Execute();

		// invoke instance's method
		auto response = instance->GetInstanceField("Year")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetInstanceField>
		EXPECT_EQ(2022, result);
	}

	TEST(Integration, Test_Clr_StandardLibrary_InvokeStaticMethod_SystemMath_Abs_minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("System.Math")->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod({ "Abs", -50 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022) {
		// <StandardLibrary_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("System.DateTime")->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 2022, 5, 9 })->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("ToShortDateString")->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_NE(std::string::npos, result.find("2022"));
	}
}

#endif //_WIN32