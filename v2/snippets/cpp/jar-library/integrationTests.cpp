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
	// <TestResources_TestClassValues>
	auto libraryPath = std::string(currentWorkingDir) + std::string("/testResources/jar-library/JavaTestClass.jar");
	auto className = "javonet.test.resources.jvm.JavaTestClass";
	// </TestResources_TestClassValues> 

	TEST(Integration, Test_Jvm_StandardLibrary_InvokeStaticMethod_SystemMath_Abs_minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		auto call = Javonet::InMemory()->Jvm()->GetType("java.lang.Math")->InvokeStaticMethod({ "abs", -50 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Jvm_StandardLibrary_GetStaticField_SystemMathPI_PI) {
		// <StandardLibrary_GetStaticField>
		auto call = Javonet::InMemory()->Jvm()->GetType("java.lang.Math")->GetStaticField("PI")->Execute();
		auto result = std::any_cast<double>(call->GetValue());
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ(M_PI, result);
	}

	TEST(Integration, Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9) {
		// <StandardLibrary_InvokeInstanceMethod>
		auto instance = Javonet::InMemory()->Jvm()->GetType("java.util.Random")->CreateInstance()->Execute();
		auto call = instance->InvokeInstanceMethod({ "nextInt",10 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_LE(0, result);
		EXPECT_GT(9, result);
	}

	TEST(Integration, Test_Jvm_TestResources_LoadLibrary_libraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		Javonet::InMemory()->Jvm()->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		Javonet::InMemory()->Jvm()->LoadLibrary(libraryPath);
		auto call = Javonet::InMemory()->Jvm()->GetType(className)->InvokeStaticMethod({ "multiplyByTwo", 25 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Jvm_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		Javonet::InMemory()->Jvm()->LoadLibrary(libraryPath);
		auto call = Javonet::InMemory()->Jvm()->GetType(className)->GetStaticField("staticValue")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_Jvm_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		Javonet::InMemory()->Jvm()->LoadLibrary(libraryPath);
		Javonet::InMemory()->Jvm()->GetType(className)->SetStaticField({ "staticValue", 75 })->Execute();
		auto call = Javonet::InMemory()->Jvm()->GetType(className)->GetStaticField("staticValue")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_SetStaticField>
		EXPECT_EQ(75, result);
		Javonet::InMemory()->Jvm()->GetType(className)->SetStaticField({ "staticValue", 3 })->Execute();
	}

	TEST(Integration, Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		Javonet::InMemory()->Jvm()->LoadLibrary(libraryPath);
		auto instance = Javonet::InMemory()->Jvm()->GetType(className)->CreateInstance()->Execute();
		auto call = instance->InvokeInstanceMethod({ "multiplyTwoNumbers", 5, 4 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_Jvm_TestResources_GetInstanceField_PublicValue_1) {
		// <TestResources_GetInstanceField>
		Javonet::InMemory()->Jvm()->LoadLibrary(libraryPath);
		auto instance = Javonet::InMemory()->Jvm()->GetType(className)->CreateInstance({ 2,3 })->Execute();
		auto call = instance->GetInstanceField("publicValue")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_GetInstanceField>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(2, result);
	}
}