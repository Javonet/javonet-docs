#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>

using namespace JavonetNS::Cpp::Sdk;

namespace CppToV8IntegrationTests {

#ifdef _WIN32
	auto currentWorkingDir = _getcwd(nullptr, 0);
#else
	auto currentWorkingDir = getcwd(nullptr, 0);
#endif //_WIN32
	// <TestResources_TestClassValues>
	auto libraryPath = std::string(currentWorkingDir) + std::string("/testResources/v8/V8TestClass.js");
	auto className = "V8TestClass";
	// </TestResources_TestClassValues> 

	TEST(Integration, Test_V8_StandardLibrary_InvokeStaticMethod_Math_abs_minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		auto call = Javonet::InMemory()->V8()->GetType("Math")->InvokeStaticMethod({ "abs", -50 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_V8_StandardLibrary_GetStaticField_SystemMathPI_PI) {
		// <StandardLibrary_GetStaticField>
		auto call = Javonet::InMemory()->V8()->GetType("Math")->GetStaticField("PI")->Execute();
		auto result = std::any_cast<float>(call->GetValue());
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ((float)M_PI, result);
	}

	TEST(Integration, Test_V8_TestResources_LoadLibrary_libraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		Javonet::InMemory()->V8()->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_V8_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		Javonet::InMemory()->V8()->LoadLibrary(libraryPath);
		auto call = Javonet::InMemory()->V8()->GetType(className)->InvokeStaticMethod({ "multiplyByTwo", 25 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_V8_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		Javonet::InMemory()->V8()->LoadLibrary(libraryPath);
		auto call = Javonet::InMemory()->V8()->GetType(className)->GetStaticField("staticValue")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_V8_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		Javonet::InMemory()->V8()->LoadLibrary(libraryPath);
		Javonet::InMemory()->V8()->GetType(className)->SetStaticField({ "staticValue", 75 })->Execute();
		auto call = Javonet::InMemory()->V8()->GetType(className)->GetStaticField("staticValue")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_SetStaticField>
		EXPECT_EQ(75, result);
		Javonet::InMemory()->V8()->GetType(className)->SetStaticField({ "staticValue", 3 })->Execute();
	}

	TEST(Integration, Test_V8_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		Javonet::InMemory()->V8()->LoadLibrary(libraryPath);
		auto instance = Javonet::InMemory()->V8()->GetType(className)->CreateInstance({ 4,5 })->Execute();
		auto call = instance->InvokeInstanceMethod({ "multiplyTwoNumbers", 5, 4 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_V8_TestResources_GetInstanceField_PublicValue_1) {
		// <TestResources_GetInstanceField>
		Javonet::InMemory()->V8()->LoadLibrary(libraryPath);
		auto instance = Javonet::InMemory()->V8()->GetType(className)->CreateInstance({ 2,3 })->Execute();
		auto call = instance->GetInstanceField("publicValue")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_GetInstanceField>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(2, result);
	}
}
