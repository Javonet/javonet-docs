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
	// <TestResources_TestClassValues>
	auto libraryPath = std::string(currentWorkingDir) + std::string("/testResources/ruby/ruby_test_class.rb");
	auto className = "RubyTestClass::RubyTestClass";
	// </TestResources_TestClassValues> 

	TEST(Integration, Test_Ruby_StandardLibrary_LoadLibrary_base64_NoExeption) {
		// <TestResources_LoadLibrary>
		Javonet::InMemory()->Ruby()->LoadLibrary("base64");
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_sqrt_2500_50) {
		// <StandardLibrary_InvokeStaticMethod>
		auto call = Javonet::InMemory()->Ruby()->GetType("Math")->InvokeStaticMethod({ "sqrt", 2500 })->Execute();
		auto result = std::any_cast<float>(call->GetValue());
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Ruby_StandardLibrary_GetStaticField_SystemMathPI_PI) {
		// <StandardLibrary_GetStaticField>
		auto call = Javonet::InMemory()->Ruby()->GetType("Math")->GetStaticField("PI")->Execute();
		auto result = std::any_cast<float>(call->GetValue());
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ((float)M_PI, result);
	}

	TEST(Integration, Test_Ruby_TestResources_LoadLibrary_libraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		Javonet::InMemory()->Ruby()->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		Javonet::InMemory()->Ruby()->LoadLibrary(libraryPath);
		auto call = Javonet::InMemory()->Ruby()->GetType(className)->InvokeStaticMethod({ "multiply_by_two", 25 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Ruby_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		Javonet::InMemory()->Ruby()->LoadLibrary(libraryPath);
		auto call = Javonet::InMemory()->Ruby()->GetType(className)->GetStaticField("static_value")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_Ruby_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		Javonet::InMemory()->Ruby()->LoadLibrary(libraryPath);
		Javonet::InMemory()->Ruby()->GetType(className)->SetStaticField({ "static_value", 75 })->Execute();
		auto call = Javonet::InMemory()->Ruby()->GetType(className)->GetStaticField("static_value")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_SetStaticField>
		EXPECT_EQ(75, result);
		Javonet::InMemory()->Ruby()->GetType(className)->SetStaticField({ "static_value", 3 })->Execute();
	}

	TEST(Integration, Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		Javonet::InMemory()->Ruby()->LoadLibrary(libraryPath);
		auto instance = Javonet::InMemory()->Ruby()->GetType(className)->CreateInstance({ 4,5 })->Execute();
		auto call = instance->InvokeInstanceMethod({ "multiply_two_numbers", 5, 4 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_Ruby_TestResources_GetInstanceField_PublicValue_1) {
		// <TestResources_GetInstanceField>
		Javonet::InMemory()->Ruby()->LoadLibrary(libraryPath);
		auto instance = Javonet::InMemory()->Ruby()->GetType(className)->CreateInstance({ 2,3 })->Execute();
		auto call = instance->GetInstanceField("public_value")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_GetInstanceField>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(2, result);
	}
}