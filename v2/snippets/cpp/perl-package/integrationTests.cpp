#include <gtest/gtest.h>
#include "Javonet.h"
#include <filesystem>
#include <vector>

using namespace JavonetNS::Cpp::Sdk;

namespace JavonetNS::Cpp::Sdk::Tests::PerlPackage {

	const auto currentWorkingDir = std::filesystem::current_path();
	const auto resourcesDirectory = currentWorkingDir.string() + "/testResources/perl-package";

	TEST(Integration, Test_PerlPackage_StandardLibrary_CreateRuntimeContext) {
		// <StandardLibrary_CreateRuntimeContext>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// use calledRuntime to interact with code from other technology
		// </StandardLibrary_CreateRuntimeContext>
		EXPECT_NE(nullptr, calledRuntime);
	}

	TEST(Integration, Test_PerlPackage_StandardLibrary_CreateInvocationContext) {
		// <StandardLibrary_CreateInvocationContext>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// construct an invocation context - this invocationContext in non-materialized 
		auto invocationContext = calledRuntime->GetType("CORE")->InvokeStaticMethod("length", "sample text");

		// execute invocation context - this will materialize the invocationContext
		auto response = invocationContext->Execute();
		// </StandardLibrary_CreateInvocationContext>
		EXPECT_NE(nullptr, response);
	}

	TEST(Integration, Test_PerlPackage_StandardLibrary_GetValue) {
		// <StandardLibrary_GetValue>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// construct an invocation context - this invocationContext in non-materialized 
		auto invocationContext = calledRuntime->GetType("CORE")->InvokeStaticMethod("length", "sample text");

		// execute invocation context - this will materialize the invocationContext
		auto response = invocationContext->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetValue>
		EXPECT_EQ(11, result);
	}

	TEST(Integration, Test_PerlPackage_StandardLibrary_InvokeStaticMethod_Core_Abs_Minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// construct an invocation context - this invocationContext in non-materialized 
		auto invocationContext = calledRuntime->GetType("CORE")->InvokeStaticMethod("abs", -50);

		// execute invocation context - this will materialize the invocationContext
		auto response = invocationContext->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_PerlPackage_TestResources_LoadLibrary) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_PerlPackage_TestResources_GetStaticField) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("static_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	
	 TEST(Integration, Test_PerlPackage_TestResources_SetStaticField) {
	 	// <TestResources_SetStaticField>
	 	// use Activate only once in your app
	 	Javonet::Activate("your-license-key");

	 	// create called runtime context
	 	auto calledRuntime = Javonet::InMemory()->Perl();

	 	// set up variables
	 	auto libraryPath = resourcesDirectory + "/TestClass.pm";
	 	auto className = "TestClass::TestClass";

	 	// load custom library
	 	calledRuntime->LoadLibrary(libraryPath);

	 	// get type from the runtime
	 	auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

	 	// set type's static field
	 	calledRuntimeType->SetStaticField("static_value", 75 )->Execute();

	 	// get type's static field
	 	auto response = calledRuntimeType->GetStaticField("static_value")->Execute();

	 	// get value from response
	 	auto result = std::any_cast<int>(response->GetValue());

	 	// write result to console
	 	std::cout << result << std::endl;
	 	// </TestResources_SetStaticField>
	 	calledRuntimeType->SetStaticField("static_value", 3)->Execute();
	 	EXPECT_EQ(75, result);
	 }
	 

	TEST(Integration, Test_PerlPackage_TestResources_GetInstanceField) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("public_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetInstanceField>
		EXPECT_EQ(1, result);
	}

	TEST(Integration, Test_PerlPackage_TestResources_SetInstanceField) {
		// <TestResources_SetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 18,19 })->Execute();

		// set instance's field
		instance->SetInstanceField("public_value", 44)->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("public_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetInstanceField>
		EXPECT_EQ(44, result);
	}

	TEST(Integration, Test_PerlPackage_TestResources_InvokeStaticMethod) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod("multiply_by_two", 25)->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_PerlPackage_TestResources_InvokeInstanceMethod0) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("multiply_two_numbers", { 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_PerlPackage_TestResources_1DArray_GetIndex) {
		// <TestResources_1DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get_1d_array")->Execute();

		// get index from array
		auto response = arrayReference->GetIndex(2)->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetIndex>
		EXPECT_EQ("three", result);
	}

	TEST(Integration, Test_PerlPackage_TestResources_1DArray_GetSize) {
		// <TestResources_1DArray_GetSize>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get_1d_array")->Execute();

		// get array's size
		auto response = arrayReference->GetSize()->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetSize>
		EXPECT_EQ(5, result);
	}

	TEST(Integration, Test_PerlPackage_TestResources_1DArray_SetIndex) {
		// <TestResources_1DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get_1d_array")->Execute();

		// set array's index
		arrayReference->SetIndex(4, "seven")->Execute();

		// get index from array
		auto response = arrayReference->GetIndex(4)->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_SetIndex>
		EXPECT_EQ("seven", result);
	}

	//TODO: Test_PerlPackage_TestResources_1DArray_Iterate

	TEST(Integration, Test_PerlPackage_TestResources_1DArray_GetElement) {
		// <TestResources_1DArray_GetElement>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get_1d_array")->Execute();

		// get index from array
		auto response = (*arrayReference)[2]->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetElement>
		EXPECT_EQ("three", result);
	}

	TEST(Integration, Test_PerlPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0) {
		// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method which throws exception 
		try {
			calledRuntimeType->InvokeStaticMethod("divide_by", { 10, 0 })->Execute();
		}
		catch (std::exception& e) {
			// write exception to console
			std::cout << e.what() << std::endl;
		}
		// </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		try {
			calledRuntimeType->InvokeStaticMethod("divide_by", { 10, 0 })->Execute();
		}
		catch (std::exception& e) {
			// write exception to console
			std::cout << e.what() << std::endl;
			return;
		}
		GTEST_FAIL();
	}

	TEST(Integration, Test_PerlPackage_TestResources_PassingNullAsOnlyArg) {
		// <TestResources_PassingNullAsOnlyArg>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method with null argument
		auto response = calledRuntimeType->InvokeStaticMethod("pass_null", nullptr)->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_PassingNullAsOnlyArg>
		EXPECT_EQ("Method called with null", result);
	}

	TEST(Integration, Test_PerlPackage_TestResources_PassingNullAsSecondArg) {
		// <TestResources_PassingNullAsSecondArg>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method with second argument as null
		auto response = calledRuntimeType->InvokeStaticMethod("pass_null_2", { 5, nullptr })->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_PassingNullAsSecondArg>
		EXPECT_EQ("Method2 called with null", result);
	}

	TEST(Integration, Test_PerlPackage_TestResources_ReturningNull) {
		// <TestResources_ReturningNull>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";
		auto className = "TestClass::TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method
		auto response = calledRuntimeType->InvokeStaticMethod("return_null")->Execute();

		// get value from response
		auto result = response->GetValue();
		// </TestResources_ReturningNull>
		ASSERT_TRUE(result.has_value());
		ASSERT_EQ(result.type(), typeid(std::nullptr_t));
		auto nullValue = std::any_cast<std::nullptr_t>(result);
		EXPECT_EQ(nullValue, nullptr);
	}

	TEST(Integration, Test_PerlPackage_TestResources_InvokeGlobalFunction) {
		// <TestResources_InvokeGlobalFunction>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Perl();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.pm";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// invoke global function
		auto response = calledRuntime->InvokeGlobalFunction("TestClass::TestClass::welcome", "John")->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeGlobalFunction>
		EXPECT_EQ("Hello John!", result);
	}
}