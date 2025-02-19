#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>
#include <filesystem>
#include <fstream>
#include <vector>

using namespace JavonetNS::Cpp::Sdk;

namespace JavonetNS::Cpp::Sdk::Tests::NodejPackage {

	const auto currentWorkingDir = std::filesystem::current_path();
	const auto resourcesDirectory = currentWorkingDir.string() + "/testResources/nodejs-package";

	TEST(Integration, Test_NodejsPackage_StandardLibrary_CreateRuntimeContext) {
		// <StandardLibrary_CreateRuntimeContext>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// use calledRuntime to interact with code from other technology
		// </StandardLibrary_CreateRuntimeContext>
		EXPECT_NE(nullptr, calledRuntime);
	}

	TEST(Integration, Test_NodejsPackage_StandardLibrary_CreateInvocationContext) {
		// <StandardLibrary_CreateInvocationContext>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// construct an invocation context - this invocationContext in non-materialized 
		auto invocationContext = calledRuntime->GetType("Math")->InvokeStaticMethod("abs", -50);

		// execute invocation context - this will materialize the invocationContext
		auto response = invocationContext->Execute();
		// </StandardLibrary_CreateInvocationContext>
		EXPECT_NE(nullptr, response);
	}

	TEST(Integration, Test_NodejsPackage_StandardLibrary_GetValue) {
		// <StandardLibrary_GetValue>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// construct an invocation context - this invocationContext in non-materialized 
		auto invocationContext = calledRuntime->GetType("Math")->InvokeStaticMethod("abs", -50);

		// execute invocation context - this will materialize the invocationContext
		auto response = invocationContext->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetValue>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_NodejsPackage_StandardLibrary_GetStaticField) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("Math")->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("PI")->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ((double)M_PI, result);
	}

	TEST(Integration, Test_NodejsPackage_StandardLibrary_InvokeStaticMethod) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("Math")->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod("abs", -50)->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_NodejsPackage_StandardLibrary_InvokeInstanceMethod) {
		// <StandardLibrary_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("Date")->Execute();

		// create type's instance with year, month, day
		auto instance = calledRuntimeType->CreateInstance({ 2024, 2, 3 })->Execute();

		// invoke instance's method 'getFullYear'
		auto response = instance->InvokeInstanceMethod("getFullYear")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_EQ(2024, result);
	}

	TEST(Integration, Test_NodejsPackage_StandardLibrary_GetInstanceField) {
		// <StandardLibrary_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("Set")->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// get instance's field 'size'
		auto response = instance->GetInstanceField("size")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetInstanceField>
		EXPECT_EQ(0, result);
	}


	TEST(Integration, Test_NodejsPackage_TestResources_LoadLibrary) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";

		// load custom library
		Javonet::InMemory()->Nodejs()->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_NodejsPackage_TestResources_GetStaticField) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("staticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_SetStaticField) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// set type's static field
		calledRuntimeType->SetStaticField("staticValue", 75)->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("staticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		calledRuntimeType->SetStaticField("staticValue", 3)->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_GetInstanceField) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 18,19 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("publicValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetInstanceField>
		EXPECT_EQ(18, result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_SetInstanceField) {
		// <TestResources_SetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 18,19 })->Execute();

		// set instance's field
		instance->SetInstanceField("publicValue", 44)->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("publicValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetInstanceField>
		EXPECT_EQ(44, result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_InvokeStaticMethod) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod("multiplyByTwo", 25)->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_InvokeInstanceMethod) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("multiplyTwoNumbers", { 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_1DArray_GetIndex) {
		// <TestResources_1DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get1DArray")->Execute();

		// get index from array
		auto response = arrayReference->GetIndex(2)->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetIndex>
		EXPECT_EQ("three", result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_1DArray_GetSize) {
		// <TestResources_1DArray_GetSize>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get1DArray")->Execute();

		// get array's size
		auto response = arrayReference->GetSize()->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetSize>
		EXPECT_EQ(5, result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_1DArray_SetIndex) {
		// <TestResources_1DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get1DArray")->Execute();

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

	//TODO: Test_NodejsPackage_TestResources_1DArray_Iterate

	TEST(Integration, Test_NodejsPackage_TestResources_1DArray_GetElement) {
		// <TestResources_1DArray_GetElement>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get1DArray")->Execute();

		// get index from array
		auto response = (*arrayReference)[2]->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetElement>
		EXPECT_EQ("three", result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_1DArray_PassArrayAsArgument) {
		// <TestResources_1DArray_PassArrayAsArgument>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("addArrayElementsAndMultiply", { std::vector<std::any>{12.22, 98.22, -10.44}, 9.99 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_PassArrayAsArgument>
		EXPECT_EQ(999, result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_1DArray_RetrieveArray) {
		// <TestResources_1DArray_RetrieveArray>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";


		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("get1DArray")->Execute();

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

	TEST(Integration, Test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0) {
		// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method which throws exception 
		try {
			calledRuntimeType->InvokeStaticMethod("divideBy", { 10, 0 })->Execute();
		}
		catch (std::exception& e) {
			// write exception to console
			std::cout << e.what() << std::endl;
		}
		// </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		try {
			calledRuntimeType->InvokeStaticMethod("divideBy", { 10, 0 })->Execute();
		}
		catch (std::exception& e) {
			// write exception to console
			std::cout << e.what() << std::endl;
			return;
		}
		GTEST_FAIL();
	}

	TEST(Integration, Test_NodejsPackage_TestResources_2DArray_GetIndex) {
		// <TestResources_2DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto array = instance->InvokeInstanceMethod("get2DArray")->Execute();

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

	TEST(Integration, Test_NodejsPackage_TestResources_2DArray_GetSizeAndRank) {
		// <TestResources_2DArray_GetSizeAndRank>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto array = instance->InvokeInstanceMethod("get2DArray")->Execute();

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

	TEST(Integration, Test_NodejsPackage_TestResources_2DArray_SetIndex) {
		// <TestResources_2DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className);

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance();

		// invoke instance's method
		auto array = instance->InvokeInstanceMethod("get2DArray")->Execute();

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

	TEST(Integration, Test_NodejsPackage_TestResources_PassingNullAsOnlyArg) {
		// <TestResources_PassingNullAsOnlyArg>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method with null argument
		auto response = calledRuntimeType->InvokeStaticMethod("passNull", nullptr)->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_PassingNullAsOnlyArg>
		EXPECT_EQ("Method called with null", result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_PassingNullAsSecondArg) {
		// <TestResources_PassingNullAsSecondArg>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method with second argument as null
		auto response = calledRuntimeType->InvokeStaticMethod("passNull2", { 5, nullptr })->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_PassingNullAsSecondArg>
		EXPECT_EQ("Method2 called with null", result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_ReturningNull) {
		// <TestResources_ReturningNull>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method
		auto response = calledRuntimeType->InvokeStaticMethod("returnNull")->Execute();

		// get value from response
		auto result = response->GetValue();
		// </TestResources_ReturningNull>
		ASSERT_TRUE(result.has_value());
		ASSERT_EQ(result.type(), typeid(std::nullptr_t));
		auto nullValue = std::any_cast<std::nullptr_t>(result);
		EXPECT_EQ(nullValue, nullptr);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_Multithreading_InvokeInstanceMethod) {
		// <TestResources_Multithreading_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// create threads and dictionaries to store responses
		std::vector<std::thread> threads;
		std::map<int, int> responses;
		std::mutex responses_mutex;

		auto startTime = std::chrono::system_clock::now();
		// create threads
		for (int i = 0; i < 5; i++) {
			int j = i;
			threads.emplace_back([&instance, j, &responses, &responses_mutex]() {
				auto response = instance->InvokeInstanceMethod("addTwoNumbers", { j, 5 })->Execute();
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
		EXPECT_GT(2000, elapsed);
		for (const auto& response : responses) {
			EXPECT_EQ(response.first + 5, response.second);
		}
	}

//	TEST(Integration, Test_NodejsPackage_TestResources_ExecuteAsync_AsyncMethod) {
//		// <TestResources_ExecuteAsync_AsyncMethod>
//		// use Activate only once in your app
//		Javonet::Activate("your-license-key");
//
//		// create called runtime context
//		auto calledRuntime = Javonet::InMemory()->Nodejs();
//
//		// set up variables
//		auto libraryPath = resourcesDirectory + "/TestClass.js";
//		auto className = "TestClass";
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
//		instance->InvokeInstanceMethod("writeToFile", { fileName, " This is " })->ExecuteAsync();
//		instance->InvokeInstanceMethod("writeToFile", { fileName, " file with " })->ExecuteAsync();
//		instance->InvokeInstanceMethod("writeToFile", { fileName, " sample input " })->ExecuteAsync();
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

	TEST(Integration, Test_NodejsPackage_TestResources_UseStaticMethodAsDelegate) {
		// <TestResources_UseStaticMethodAsDelegate>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// get static method as delegate
		auto myFunc = calledRuntimeType->GetStaticMethodAsDelegate("divideBy")->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("useYourFunc", { myFunc, 30, 6 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_UseStaticMethodAsDelegate>
		EXPECT_EQ(5, result);
	}

	TEST(Integration, Test_NodejsPackage_TestResources_UseInstanceMethodAsDelegate) {
		// <TestResources_UseInstanceMethodAsDelegate>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// get instance method as delegate
		auto myFunc = instance->GetInstanceMethodAsDelegate("multiplyTwoNumbers")->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("useYourFunc", { myFunc, 5, 6 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_UseInstanceMethodAsDelegate>
		EXPECT_EQ(30, result);
	}


	TEST(Integration, Test_NodejsPackage_TestResources_InvokeGlobalFunction) {
		// <TestResources_InvokeGlobalFunction>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Nodejs();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.js";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// invoke global function
		auto response = calledRuntime->InvokeGlobalFunction("welcome", "John")->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeGlobalFunction>
		EXPECT_EQ("Hello John!", result);
	}
}
