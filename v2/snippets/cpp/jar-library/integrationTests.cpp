#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>

using namespace JavonetNS::Cpp::Sdk;

namespace CppToJvmIntegrationTests {

#ifdef _WIN32
	auto currentWorkingDir = _getcwd(nullptr, 0);
#else
	auto currentWorkingDir = getcwd(nullptr, 0);
#endif //_WIN32
	const std::string resourcesDirectory = std::string(currentWorkingDir) + std::string("/testResources/jar-library");

	TEST(Integration, Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create JVM runtime context
		auto jvmRuntime = Javonet::InMemory()->Jvm();

		// get type from the runtime
		auto jvmType = jvmRuntime->GetType("java.lang.Math")->Execute();

		// invoke type's static method 
		auto response = jvmType->InvokeStaticMethod({ "abs", -50 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create JVM runtime context
		auto jvmRuntime = Javonet::InMemory()->Jvm();

		// get type from the runtime
		auto jvmType = jvmRuntime->GetType("java.lang.Math")->Execute();

		// get type's static field
		auto response = jvmType->GetStaticField("PI")->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ(M_PI, result);
	}

	TEST(Integration, Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9) {
		// <StandardLibrary_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create JVM runtime context
		auto jvmRuntime = Javonet::InMemory()->Jvm();

		// get type from the runtime
		auto jvmType = jvmRuntime->GetType("java.util.Random")->Execute();

		// create type's instance
		auto instance = jvmType->CreateInstance()->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod({ "nextInt", 10 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_LE(0, result);
		EXPECT_GT(10, result);
	}

	TEST(Integration, Test_Jvm_StandardLibrary_GetInstanceFField_SystemDateTime_Year_2022) {

		// <StandardLibrary_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create JVM runtime context
		auto jvmRuntime = Javonet::InMemory()->Jvm();

		// get type from the runtime
		auto jvmType = jvmRuntime->GetType("java.sql.DriverPropertyInfo")->Execute();

		// create type's instance
		auto instance = jvmType->CreateInstance({ "sample value", "sample value 2" })->Execute();

		// invoke instance's method
		auto response = instance->GetInstanceField("name")->Execute();

		// get value from response
		auto result = std::any_cast<std::u8string>(response->GetValue());

		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		
	}

	TEST(Integration, Test_Jvm_TestResources_LoadLibrary_libraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create JVM runtime context
		auto jvmRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";

		// load custom library
		jvmRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create JVM runtime context
		auto jvmRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		jvmRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto jvmType = jvmRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = jvmType->InvokeStaticMethod({ "multiplyByTwo", 25 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Jvm_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create JVM runtime context
		auto jvmRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		jvmRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto jvmType = jvmRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = jvmType->GetStaticField("staticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_Jvm_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create JVM runtime context
		auto jvmRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		jvmRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto jvmType = jvmRuntime->GetType(className)->Execute();

		// set type's static field
		jvmType->SetStaticField({ "staticValue", 75 })->Execute();

		// get type's static field
		auto response = jvmType->GetStaticField("staticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		jvmType->SetStaticField({ "staticValue", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create JVM runtime context
		auto jvmRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		jvmRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto jvmType = jvmRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = jvmType->CreateInstance({ 1,2 })->Execute();

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

	TEST(Integration, Test_Jvm_TestResources_GetInstanceField_PublicValue_18) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create JVM runtime context
		auto jvmRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		jvmRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto jvmType = jvmRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = jvmType->CreateInstance({ 18,19 })->Execute();

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