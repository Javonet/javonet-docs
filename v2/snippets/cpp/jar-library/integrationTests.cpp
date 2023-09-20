#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>
#include <filesystem>

using namespace JavonetNS::Cpp::Sdk;

namespace JavonetNS::Cpp::Sdk::Tests::JarLibrary {

	const auto currentWorkingDir = std::filesystem::current_path();
	const auto resourcesDirectory = currentWorkingDir.string() + "/testResources/jar-library";

	TEST(Integration, Test_JarLibrary_TestResources_LoadLibrary_libraryPath_NoExeption) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_JarLibrary_TestResources_GetStaticField_StaticValue_3) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
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

	TEST(Integration, Test_JarLibrary_TestResources_SetStaticField_StaticValue_75) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// set type's static field
		calledRuntimeType->SetStaticField({ "staticValue", 75 })->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("staticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		calledRuntimeType->SetStaticField({ "staticValue", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_JarLibrary_TestResources_GetInstanceField_PublicValue_18) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
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

	TEST(Integration, Test_JarLibrary_TestResources_SetInstanceField_PublicValue_44) {
		// <TestResources_SetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 18,19 })->Execute();

		// set instance's field
		instance->SetInstanceField({ "publicValue", 44 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("publicValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetInstanceField>
		EXPECT_EQ(44, result);
	}

	TEST(Integration, Test_JarLibrary_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod({ "multiplyByTwo", 25 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_JarLibrary_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod({ "multiplyTwoNumbers", 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_JarLibrary_TestResources_1DArray_GetIndex_2_StringThree) {
		// <TestResources_1DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
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

	TEST(Integration, Test_JarLibrary_TestResources_1DArray_GetSize_5) {
		// <TestResources_1DArray_GetSize>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
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

	TEST(Integration, Test_JarLibrary_TestResources_1DArray_SetIndex_StringSeven) {
		// <TestResources_1DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
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

	TEST(Integration, Test_JarLibrary_TestResources_1DArray_RetrieveArray) {
		// <TestResources_1DArray_RetrieveArray>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
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

	TEST(Integration, Test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException) {
		// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method which throws exception 
		try {
			calledRuntimeType->InvokeStaticMethod({ "divideBy", 10, 0 })->Execute();
		}
		catch (std::exception& e) {
			// write exception to console
			std::cout << e.what() << std::endl;
			return;
		}
		// </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		GTEST_FAIL();
	}

	TEST(Integration, Test_JarLibrary_TestResources_GenericStaticMethod) {
		// <TestResources_GenericStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's generic static method
		auto response = calledRuntimeType->
			InvokeGenericStaticMethod({ "genericSampleStaticMethod", 7, 5 })->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GenericStaticMethod>
		EXPECT_EQ("7 and 5", result);
	}

	TEST(Integration, Test_JarLibrary_TestResources_GenericMethod) {
		// <TestResources_GenericMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance generic method
		auto response = instance->
			InvokeGenericMethod({ "genericSampleMethod", 7, 5 })->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GenericMethod>
		EXPECT_EQ("7 or 5", result);
	}

	TEST(Integration, Test_JarLibrary_TestResources_GenericMethodWithTwoTypes) {
		// <TestResources_GenericMethodWithTwoTypes>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.jar";
		auto className = "TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance generic method
		auto response = instance->
			InvokeGenericMethod({ "genericSampleMethodWithTwoTypes", 7})->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GenericMethodWithTwoTypes>
		EXPECT_EQ("genericSampleMethodWithTwoTypes invoked", result);
	}

	TEST(Integration, Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("java.lang.Math")->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("PI")->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ(M_PI, result);
	}

	TEST(Integration, Test_JarLibrary_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022) {

		// <StandardLibrary_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("java.sql.DriverPropertyInfo")->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ "sample value", "sample value 2" })->Execute();

		// invoke instance's method
		auto response = instance->GetInstanceField("name")->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetInstanceField>		
		EXPECT_EQ("sample value", result);
	}

	TEST(Integration, Test_JarLibrary_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("java.lang.Math")->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod({ "abs", -50 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9) {
		// <StandardLibrary_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-email", "your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Jvm();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("java.util.Random")->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod({ "nextInt", 10 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_LE(0, result);
		EXPECT_GT(10, result);
	}
}