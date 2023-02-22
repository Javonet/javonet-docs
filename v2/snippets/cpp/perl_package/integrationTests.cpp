#include <gtest/gtest.h>
#include "Javonet.h"

using namespace JavonetNS::Cpp::Sdk;

namespace CppToPerlIntegrationTests {

#ifdef _WIN32
	auto currentWorkingDir = _getcwd(nullptr, 0);
#else
	auto currentWorkingDir = getcwd(nullptr, 0);
#endif //_WIN32
	// <TestResources_TestClassValues>
	auto libraryPath = std::string(currentWorkingDir) + std::string("/testResources/perl_package");
	auto fileName = std::string("PerlTestClass.pm");
	auto className = std::string("PerlTestClass::PerlTestClass");

	TEST(Integration, Test_Perl_TestResources_LoadLibrary_LibraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		Javonet::InMemory()->Perl()->LoadLibrary({ libraryPath, fileName });
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		Javonet::InMemory()->Perl()->LoadLibrary({ libraryPath, fileName });
		auto call = Javonet::InMemory()->Perl()->GetType(className)->InvokeStaticMethod({ "multiply_by_two", 25 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_Perl_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		Javonet::InMemory()->Perl()->LoadLibrary({ libraryPath, fileName });
		auto call = Javonet::InMemory()->Perl()->GetType(className)->GetStaticField("static_value")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_Perl_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		Javonet::InMemory()->Perl()->LoadLibrary({ libraryPath, fileName });
		Javonet::InMemory()->Perl()->GetType(className)->SetStaticField({ "static_value", 75 })->Execute();
		// </TestResources_SetStaticField>
		auto call = Javonet::InMemory()->Perl()->GetType(className)->GetStaticField("static_value")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		Javonet::InMemory()->Perl()->GetType(className)->SetStaticField({ "static_value", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		Javonet::InMemory()->Perl()->LoadLibrary({ libraryPath, fileName });
		auto instance = Javonet::InMemory()->Perl()->GetType(className)->CreateInstance()->Execute();
		auto call = instance->InvokeInstanceMethod({ "multiply_two_numbers", 5, 4 })->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_Perl_TestResources_GetInstanceField_PublicValue_1) {
		// <TestResources_GetInstanceField>
		Javonet::InMemory()->Perl()->LoadLibrary({ libraryPath, fileName });
		auto instance = Javonet::InMemory()->Perl()->GetType(className)->CreateInstance()->Execute();
		auto call = instance->GetInstanceField("public_value")->Execute();
		auto result = std::any_cast<int>(call->GetValue());
		// </TestResources_GetInstanceField>
		EXPECT_EQ(36, std::any_cast<std::u8string>(instance->GetValue()).length());
		EXPECT_EQ(1, result);
	}
}