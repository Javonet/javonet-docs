#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>
#include <filesystem>
#include <fstream>
#include <vector>

using namespace JavonetNS::Cpp::Sdk;

namespace JavonetNS::Cpp::Sdk::Tests::PythonPackage {

	const auto currentWorkingDir = std::filesystem::current_path();
	const auto resourcesDirectory = currentWorkingDir.string() + "/testResources/python-package";

	TEST(Integration, Test_PythonPackage_StandardLibrary_CreateRuntimeContext) {
		// <StandardLibrary_CreateRuntimeContext>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// use calledRuntime to interact with code from other technology
		// </StandardLibrary_CreateRuntimeContext>
		EXPECT_NE(nullptr, calledRuntime);
	}

	TEST(Integration, Test_PythonPackage_StandardLibrary_CreateInvocationContext) {
		// <StandardLibrary_CreateInvocationContext>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// construct an invocation context - this invocationContext in non-materialized 
		auto invocationContext = calledRuntime->GetType("builtins")->InvokeStaticMethod("abs", -50);

		// execute invocation context - this will materialize the invocationContext
		auto response = invocationContext->Execute();
		// </StandardLibrary_CreateInvocationContext>
		EXPECT_NE(nullptr, response);
	}

	TEST(Integration, Test_PythonPackage_StandardLibrary_GetValue) {
		// <StandardLibrary_GetValue>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// construct an invocation context - this invocationContext in non-materialized 
		auto invocationContext = calledRuntime->GetType("builtins")->InvokeStaticMethod("abs", -50);

		// execute invocation context - this will materialize the invocationContext
		auto response = invocationContext->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetValue>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_PythonPackage_StandardLibrary_GetStaticField) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("math")->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("pi")->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ(M_PI, result);
	}

	TEST(Integration, Test_PythonPackage_StandardLibrary_InvokeStaticMethod) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("builtins")->Execute();

		// invoke type's static method
		auto response = calledRuntimeType->InvokeStaticMethod("abs", -50)->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// print result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_PythonPackage_StandardLibrary_InvokeInstanceMethod_BuiltIn_String_Upcase) {
		// <StandardLibrary_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("builtins.str")->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance("hello world")->Execute();

		// invoke instance's method 'upper'
		auto response = instance->InvokeInstanceMethod("upper")->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write results to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_EQ("HELLO WORLD", result);
	}

	TEST(Integration, Test_PythonPackage_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022) {
		// <StandardLibrary_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("datetime.datetime")->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({2023, 2, 3, 12, 0, 0})->Execute();

		// get instance's field 
		auto response = instance->GetInstanceField("year")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write results to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetInstanceField>
		EXPECT_EQ(2023, result);
	}

	TEST(Integration, Test_PythonPackage_TestResources_LoadLibrary) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_PythonPackage_TestResources_GetStaticField) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

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

	TEST(Integration, Test_PythonPackage_TestResources_SetStaticField) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// set type's static field
		calledRuntimeType->SetStaticField("static_value", 75)->Execute();

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

	TEST(Integration, Test_PythonPackage_TestResources_GetInstanceField) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 18,19 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("public_value")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetInstanceField>
		EXPECT_EQ(18, result);
	}

	TEST(Integration, Test_PythonPackage_TestResources_SetInstanceField) {
		// <TestResources_SetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

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

	TEST(Integration, Test_PythonPackage_TestResources_InvokeStaticMethod) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

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

	TEST(Integration, Test_PythonPackage_TestResources_InvokeInstanceMethod) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("multiply_two_numbers", { 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_PythonPackage_TestResources_1DArray_GetIndex) {
		// <TestResources_1DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

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

	TEST(Integration, Test_PythonPackage_TestResources_1DArray_GetSize) {
		// <TestResources_1DArray_GetSize>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

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

	TEST(Integration, Test_PythonPackage_TestResources_1DArray_SetIndex) {
		// <TestResources_1DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

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

	//TODO: Test_PythonPackage_TestResources_1DArray_GetElement
	TEST(Integration, Test_PythonPackage_TestResources_1DArray_GetElement) {
		// <TestResources_1DArray_GetElement>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

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

	TEST(Integration, Test_PythonPackage_TestResources_1DArray_PassArrayAsArgument) {
		// <TestResources_1DArray_PassArrayAsArgument>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 1,0 })->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("add_array_elements_and_multiply", { std::vector<std::any>{12.22, 98.22, -10.44}, 9.99 })->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_PassArrayAsArgument>
		EXPECT_EQ((double)999, result);
	}

	TEST(Integration, Test_PythonPackage_TestResources_1DArray_RetrieveArray) {
		// <TestResources_1DArray_RetrieveArray>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get_1d_array")->Execute();

		// get array from reference
		auto response = arrayReference->RetrieveArray();

		auto result = std::any_cast<std::deque<std::any>>(response);

		auto resultArray = std::vector<std::string>(result.size());

		for (int i = 0; i < result.size(); i++) {
			resultArray[i] = std::any_cast<std::string>(result[i]);
			// write result to console
			std::cout << resultArray[i] << "\t";
		}
		// </TestResources_1DArray_RetrieveArray>
		std::cout << std::endl;
		auto expectedResponse = std::vector<std::string>{ "one", "two" , "three", "four", "five" };
		EXPECT_EQ(expectedResponse.size(), resultArray.size());
		for (int i = 0; i < resultArray.size(); ++i) {
			EXPECT_EQ(expectedResponse[i], resultArray[i]);
		}
	}

	TEST(Integration, Test_PythonPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0) {
		// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

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

	TEST(Integration, Test_PythonPackage_TestResources_EnumAddToList) {
		// <TestResources_EnumAddToList>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		//create enum items
		auto apple = calledRuntime->GetEnumItem({ calledRuntimeType, "Fruit", "Apple" })->Execute();
		auto mango = calledRuntime->GetEnumItem({ calledRuntimeType, "Fruit", "Mango" })->Execute();

		// create fruits array
		std::vector<std::any> fruitsList = { apple, mango };



		// invoke type's static method
		auto response = calledRuntimeType->
			InvokeStaticMethod("add_fruits_to_list", fruitsList)->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_EnumAddToList>
		EXPECT_EQ("2 fruits on the list", result);
	}

	TEST(Integration, Test_PythonPackage_TestResources_EnumNameAndValue) {
		// <TestResources_EnumNameAndValue>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className);

		//get enum's item
		auto fruit1 = calledRuntime->GetEnumItem({ calledRuntimeType, "Fruit", "Mango" });
		auto fruit2 = calledRuntime->GetEnumItem({ calledRuntimeType, "Fruit","Orange" });

		// get item's names and values
		auto fruit1Name = fruit1->GetEnumName()->Execute();
		auto fruit1Value = fruit1->GetEnumValue()->Execute();
		auto fruit2Name = fruit2->GetEnumName()->Execute();
		auto fruit2Value = fruit2->GetEnumValue()->Execute();

		// get values
		auto result1 = std::any_cast<std::string>(fruit1Name->GetValue());
		auto result2 = std::any_cast<int>(fruit1Value->GetValue());
		auto result3 = std::any_cast<std::string>(fruit2Name->GetValue());
		auto result4 = std::any_cast<int>(fruit2Value->GetValue());

		// write result to console
		std::cout << result1 << ": " << result2 << ", " << result3 << ": " << result4 << std::endl;
		// </TestResources_EnumNameAndValue>
		EXPECT_EQ("Mango", result1);
		EXPECT_EQ("Orange", result3);
		EXPECT_EQ(4, result2);
		EXPECT_EQ(3, result4);
	}

	TEST(Integration, Test_PythonPackage_TestResources_2DArray_GetIndex) {
		// <TestResources_2DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

		// invoke instance's method
		auto array = instance->InvokeInstanceMethod("get_2d_array")->Execute();

		// two ways to get elements from array
		auto response1 = array->GetIndex({ 1, 1 })->Execute();
		std::vector<std::any> indexes = { 1, 0 };
		auto response2 = array->GetIndex(indexes)->Execute();

		// get value from response
		auto result1 = std::any_cast<std::string>(response1->GetValue());
		auto result2 = std::any_cast<std::string>(response2->GetValue());

		// write result to console
		std::cout << result1 << std::endl;
		std::cout << result2 << std::endl;
		// </TestResources_2DArray_GetIndex>
		EXPECT_EQ("S11", result1);
		EXPECT_EQ("S10", result2);
	}

	TEST(Integration, Test_PythonPackage_TestResources_2DArray_GetSizeAndRank) {
		// <TestResources_2DArray_GetSizeAndRank>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0,1 })->Execute();

		// invoke instance's method
		auto array = instance->InvokeInstanceMethod("get_2d_array")->Execute();

		// three ways to get elements from array
		auto response1 = array->GetSize()->Execute();
		auto response2 = array->GetRank()->Execute();

		// get value from response
		auto result1 = std::any_cast<int>(response1->GetValue());
		auto result2 = std::any_cast<int>(response2->GetValue());

		// write result to console
		std::cout << result1 << std::endl;
		std::cout << result2 << std::endl;
		// </TestResources_2DArray_GetSizeAndRank>
		EXPECT_EQ(4, result1);
		EXPECT_EQ(2, result2);
	}

	TEST(Integration, Test_PythonPackage_TestResources_2DArray_SetIndex) {
		// <TestResources_2DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className);

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 1,0 });

		// invoke instance's method
		auto array = instance->InvokeInstanceMethod("get_2d_array")->Execute();

		// set element in array
		array->SetIndex(std::vector<std::any>{1, 1}, "new value")->Execute();

		// get index from array
		auto response = array->GetIndex({ 1, 1 })->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_2DArray_SetIndex>
		EXPECT_EQ("new value", result);
	}

	TEST(Integration, Test_PythonPackage_StandardLibrary_HandleList) {
		// <StandardLibrary_HandleList>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// get list from built-in types
		auto typeList = calledRuntime->GetType("builtins.list")->Execute();

		// create instance of list
		auto list = typeList->CreateInstance()->Execute();

		// invoke instance method
		list->InvokeInstanceMethod("extend", std::vector<std::any>{ "one", "two", "three", "four", "five", "six" })->Execute();

		// get elements from list
		auto element0 = list->GetIndex(0)->Execute();
		auto element1 = (*list)[1]->Execute();

		auto result0 = std::any_cast<std::string>(element0->GetValue());
		auto result1 = std::any_cast<std::string>(element1->GetValue());

		// get size of list
		auto size = std::any_cast<int>(list->GetSize()->Execute()->GetValue());

		// write results to console
		std::cout << result0 << std::endl;
		std::cout << result1 << std::endl;
		std::cout << size << std::endl;
		// </StandardLibrary_HandleList>
		EXPECT_EQ("one", result0);
		EXPECT_EQ("two", result1);
		EXPECT_EQ(6, size);
	}

	TEST(Integration, Test_PythonPackage_StandardLibrary_HandleDictionary) {
		// <StandardLibrary_HandleDictionary>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// get type 
		auto typeDictionary = calledRuntime->GetType("builtins.dict")->Execute();

		// create instance of type
		auto dictionary = typeDictionary->CreateInstance()->Execute();

		// set elements in dictionary
		dictionary->SetIndex("pi", M_PI)->Execute();
		dictionary->SetIndex("e", M_E)->Execute();
		dictionary->SetIndex("c", 299792458.0)->Execute();

		// get elements from dictionary
		auto response1 = dictionary->GetIndex("c")->Execute();
		auto response2 = (*dictionary)["e"]->Execute();

		auto c_value = std::any_cast<double>(response1->GetValue());
		auto e_value = std::any_cast<double>(response2->GetValue());

		// write results to console
		std::cout << c_value << std::endl;
		std::cout << e_value << std::endl;
		// </StandardLibrary_HandleDictionary>
		EXPECT_EQ(299792458.0, c_value);
		EXPECT_EQ(M_E, e_value);
	}

	TEST(Integration, Test_PythonPackage_StandardLibrary_HandleSet) {
		// <StandardLibrary_HandleSet>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// get type
		auto hashSetType = calledRuntime->GetType("builtins.set")->Execute();

		// create instance of type
		auto hashSet = hashSetType->CreateInstance()->Execute();

		// invoke instance method
		hashSet->InvokeStaticMethod("add", 3.14)->Execute();
		hashSet->InvokeStaticMethod("add", 9.81)->Execute();
		hashSet->InvokeStaticMethod("add", 1.44)->Execute();

		// get size of set
		auto response = calledRuntime->GetType("builtins")->InvokeStaticMethod("len", hashSet)->Execute();
		auto result = std::any_cast<int>(response->GetValue());

		// write results to console
		std::cout << result << std::endl;
		// </StandardLibrary_HandleSet>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_PythonPackage_TestResources_PassingNullAsOnlyArg) {
		// <TestResources_PassingNullAsOnlyArg>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

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

	TEST(Integration, Test_PythonPackage_TestResources_PassingNullAsSecondArg) {
		// <TestResources_PassingNullAsSecondArg>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method with second argument as null
		auto response = calledRuntimeType->InvokeStaticMethod("pass_null_2", {5, nullptr})->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_PassingNullAsSecondArg>
		EXPECT_EQ("Method2 called with null", result);
	}

	TEST(Integration, Test_PythonPackage_TestResources_ReturningNull) {
		// <TestResources_ReturningNull>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

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

	TEST(Integration, Test_PythonPackage_TestResources_Multithreading_InvokeInstanceMethod) {
		// <TestResources_Multithreading_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({0, 1})->Execute();

		// create threads and dictionaries to store responses
		std::vector<std::thread> threads;
		std::map<int, int> responses;
		std::mutex responses_mutex;

		auto startTime = std::chrono::system_clock::now();
		// create threads
		for (int i = 0; i < 5; i++) {
			int j = i;
			threads.emplace_back([&instance, j, &responses, &responses_mutex]() {
				auto response = instance->InvokeInstanceMethod("add_two_numbers", {j, 5})->Execute();
				int result = std::any_cast<int>(response->GetValue());

				std::lock_guard<std::mutex> lock(responses_mutex);
				responses[j] = result;
				});
		}

		// start and join threads
		for (auto& thread : threads) {
			thread.join();
		}

		auto endTime = std::chrono::system_clock::now();
		auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(endTime - startTime).count();

		// write results to console
		std::cout << "Elapsed time: " << elapsed << "ms" << std::endl;
		for (const auto& response : responses) {
			std::cout << response.second << std::endl;
		}
		// </TestResources_Multithreading_InvokeInstanceMethod>

		// Assert results
		EXPECT_GT(2000, elapsed);
		for (const auto& response : responses) {
			EXPECT_EQ(response.first + 5, response.second);
		}
	}

//	TEST(Integration, Test_PythonPackage_TestResources_ExecuteAsync_AsyncMethod) {
//		// <TestResources_ExecuteAsync_AsyncMethod>
//		// use Activate only once in your app
//		Javonet::Activate("your-license-key");
//
//		// create called runtime context
//		auto calledRuntime = Javonet::InMemory()->Python();
//
//		// set up variables
//		auto libraryPath = resourcesDirectory;
//		auto className = "TestClass.TestClass";
//
//		// load custom library
//		calledRuntime->LoadLibrary(libraryPath);
//
//		// measure time 
//		auto startTime = std::chrono::system_clock::now();
//
//		// get type from the runtime
//		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();
//
//		// create type's instance
//		auto instance = calledRuntimeType->CreateInstance()->Execute();
//
//		// create file
//		std::string homeDir;
//#ifdef _WIN32
//		char* userProfile = std::getenv("USERPROFILE");
//		homeDir = userProfile ? std::string(userProfile) : ".";
//#else
//		char* home = std::getenv("HOME");
//		homeDir = home ? std::string(home) : ".";
//#endif
//		std::string fileName = std::filesystem::path(homeDir).string() + "/output.txt";
//		std::ofstream outfile(fileName, std::ofstream::out);
//		outfile.close();
//
//		// invoke instance's method asynchronously
//		instance->InvokeInstanceMethod("write_to_file", {fileName, " This is "})->ExecuteAsync();
//		instance->InvokeInstanceMethod("write_to_file", {fileName, " file with "})->ExecuteAsync();
//		instance->InvokeInstanceMethod("write_to_file", {fileName, " sample input "})->ExecuteAsync();
//
//		// wait for WriteToFile to finish
//		std::this_thread::sleep_for(std::chrono::milliseconds(3000));
//
//		// measure time
//		auto endTime = std::chrono::system_clock::now();
//		auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(endTime - startTime).count();
//
//		// write result to console
//		std::cout << "Time elapsed: " << elapsed << "ms" << std::endl;
//		// </TestResources_ExecuteAsync_AsyncMethod>
//
//		// Assert that the elapsed time is less than 4000 milliseconds
//		EXPECT_GT(4000, elapsed);
//	}

	TEST(Integration, Test_PythonPackage_TestResources_UseStaticMethodAsDelegate) {
		// <TestResources_UseStaticMethodAsDelegate>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 0, 1 })->Execute();

		// get static method as delegate
		auto myFunc = calledRuntimeType->GetStaticMethodAsDelegate("divide_by")->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("use_your_func", {myFunc, 30, 6})->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_UseStaticMethodAsDelegate>
		EXPECT_EQ(5, result);
	}

	TEST(Integration, Test_PythonPackage_TestResources_UseInstanceMethodAsDelegate) {
		// <TestResources_UseInstanceMethodAsDelegate>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		auto libraryPath = resourcesDirectory;
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({0, 1})->Execute();

		// get instance method as delegate
		auto myFunc = instance->GetInstanceMethodAsDelegate("multiply_two_numbers")->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("use_your_func", {myFunc, 5, 6})->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_UseInstanceMethodAsDelegate>
		EXPECT_EQ(30, result);
	}

	TEST(Integration, Test_PythonPackage_TestResources_InvokeGlobalFunction) {
		// <TestResources_InvokeGlobalFunction>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Python();

		// set up variables
		std::string libraryPath = resourcesDirectory;

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// invoke global function
		auto response = calledRuntime->InvokeGlobalFunction("TestClass.welcome", "John")->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeGlobalFunction>
		EXPECT_EQ("Hello John!", result);
	}
}
