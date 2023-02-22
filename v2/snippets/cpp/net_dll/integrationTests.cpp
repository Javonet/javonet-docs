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
	// <TestResources_TestClassValues>
	auto libraryPath = std::string(currentWorkingDir) + std::string("/testResources/net_dll/NetcoreTestClass.dll");
	auto className = "NetcoreTestClass.NetcoreTestClass";
	// </TestResources_TestClassValues> 

	TEST(Integration, Test_Netcore_StandardLibrary_InvokeStaticMethod_SystemMath_Abs_minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		auto call = Javonet::InMemory()->Netcore()->GetType("System.Math")->InvokeStaticMethod({ "Abs", -50 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Netcore_StandardLibrary_GetStaticField_SystemMathPI_PI) {
		// <StandardLibrary_GetStaticField>
		auto call = Javonet::InMemory()->Netcore()->GetType("System.Math")->GetStaticField("PI")->Execute();
		auto result = std::any_cast<double>(call->GetValue());
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ(M_PI, result);
	}

	TEST(Integration, Test_Netcore_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022) {
		// <StandardLibrary_InvokeInstanceMethod>
		auto instance = Javonet::InMemory()->Netcore()->GetType("System.DateTime")->CreateInstance({ 2022, 5, 9 })->Execute();
		auto call = instance->InvokeInstanceMethod("ToShortDateString")->Execute();
		auto result = std::any_cast<std::u8string>(call->GetValue());
		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_NE(std::u8string::npos, result.find(u8"2022"));
	}

	TEST(Integration, Test_Netcore_TestResources_LoadLibrary_libraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		Javonet::InMemory()->Netcore()->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Netcore_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		Javonet::InMemory()->Netcore()->LoadLibrary(libraryPath);
		auto call = Javonet::InMemory()->Netcore()->GetType(className)->InvokeStaticMethod({ "MultiplyByTwo", 25 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Netcore_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		Javonet::InMemory()->Netcore()->LoadLibrary(libraryPath);
		auto call = Javonet::InMemory()->Netcore()->GetType(className)->GetStaticField("StaticValue")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_Netcore_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		Javonet::InMemory()->Netcore()->LoadLibrary(libraryPath);
		Javonet::InMemory()->Netcore()->GetType(className)->SetStaticField({ "StaticValue", 75 })->Execute();
		auto call = Javonet::InMemory()->Netcore()->GetType(className)->GetStaticField("StaticValue")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_SetStaticField>
		EXPECT_EQ(75, result);
		Javonet::InMemory()->Netcore()->GetType(className)->SetStaticField({ "StaticValue", 3 })->Execute();
	}

	TEST(Integration, Test_Netcore_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		Javonet::InMemory()->Netcore()->LoadLibrary(libraryPath);
		auto instance = Javonet::InMemory()->Netcore()->GetType(className)->CreateInstance()->Execute();
		auto call = instance->InvokeInstanceMethod({ "MultiplyTwoNumbers", 5, 4 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_Netcore_TestResources_GetInstanceField_PublicValue_1) {
		// <TestResources_GetInstanceField>
		Javonet::InMemory()->Netcore()->LoadLibrary(libraryPath);
		auto instance = Javonet::InMemory()->Netcore()->GetType(className)->CreateInstance({ 2,3 })->Execute();
		auto call = instance->GetInstanceField("PublicValue")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_GetInstanceField>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(2, result);
	}
}
