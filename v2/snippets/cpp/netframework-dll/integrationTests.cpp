#ifdef _WIN32
#include <gtest/gtest.h>
#include "Javonet.h"
#define _USE_MATH_DEFINES
#include <math.h>
#include <filesystem>

using namespace JavonetNS::Cpp::Sdk;

namespace JavonetNS::Cpp::Sdk::Tests::NetframeworkDll {

	const auto currentWorkingDir = std::filesystem::current_path();
	const auto resourcesDirectory = currentWorkingDir.string() + "/testResources/netframework-dll";

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_GetStaticField) {
		// <StandardLibrary_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("System.Math")->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("PI")->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetStaticField>
		EXPECT_EQ(M_PI, result);
	}

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_GetInstanceField) {

		// <StandardLibrary_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("System.DateTime")->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 2022, 5, 9 })->Execute();

		// invoke instance's method
		auto response = instance->GetInstanceField("Year")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_GetInstanceField>
		EXPECT_EQ(2022, result);
	}

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_InvokeStaticMethod) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("System.Math")->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod("Abs", -50)->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_InvokeInstanceMethod) {

		// <StandardLibrary_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("System.DateTime")->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 2022, 5, 9 })->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("ToShortDateString")->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeInstanceMethod>
		EXPECT_NE(std::string::npos, result.find("2022"));
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_LoadLibrary) {
		// <TestResources_LoadLibrary>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);
		// </TestResources_LoadLibrary>
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_GetStaticField) {
		// <TestResources_GetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("StaticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetStaticField>
		EXPECT_EQ(3, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_SetStaticField) {
		// <TestResources_SetStaticField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// set type's static field
		calledRuntimeType->SetStaticField("StaticValue", 75)->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("StaticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		calledRuntimeType->SetStaticField("StaticValue", 3)->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_GetInstanceField8) {
		// <TestResources_GetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 18,19 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("PublicValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GetInstanceField>
		EXPECT_EQ(18, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_SetInstanceField) {
		// <TestResources_SetInstanceField>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance({ 18,19 })->Execute();

		// set instance's field
		instance->SetInstanceField("PublicValue", 44)->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("PublicValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetInstanceField>
		EXPECT_EQ(44, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_InvokeStaticMethod) {
		// <TestResources_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod("MultiplyByTwo", 25)->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_InvokeInstanceMethod) {
		// <TestResources_InvokeInstanceMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("MultiplyTwoNumbers", { 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_1DArray_GetIndex) {
		// <TestResources_1DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("Get1DArray")->Execute();

		// get index from array
		auto response = arrayReference->GetIndex(2)->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetIndex>
		EXPECT_EQ("three", result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_1DArray_GetSize) {
		// <TestResources_1DArray_GetSize>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("Get1DArray")->Execute();

		// get array's size
		auto response = arrayReference->GetSize()->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetSize>
		EXPECT_EQ(5, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_1DArray_SetIndex) {
		// <TestResources_1DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("Get1DArray")->Execute();

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

	//TODO: Test_NetframeworkDll_TestResources_1DArray_Iterate

	TEST(Integration, Test_NetframeworkDll_TestResources_1DArray_GetElement) {
		// <TestResources_1DArray_GetElement>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("Get1DArray")->Execute();

		// get index from array
		auto response = (*arrayReference)[2]->Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_GetElement>
		EXPECT_EQ("three", result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_1DArray_PassArrayAsArgument) {
		// <TestResources_1DArray_PassArrayAsArgument>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";


		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto response = instance->InvokeInstanceMethod("AddArrayElementsAndMultiply", { std::vector<std::any>{12.22, 98.22, -10.44}, 9.99 })->Execute();

		// get value from response
		auto result = std::any_cast<double>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_1DArray_PassArrayAsArgument>
		EXPECT_EQ((double)999, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_1DArray_RetrieveArray) {
		// <TestResources_1DArray_RetrieveArray>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto arrayReference = instance->InvokeInstanceMethod("Get1DArray")->Execute();

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

	TEST(Integration, Test_NetframeworkDll_TestResources_Cast_ToUInt32) {
		// <TestResources_Cast_ToUInt32>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// get type for casting
		auto targetType = calledRuntime->GetType("System.UInt32");

		// invoke type's static method 
		auto response = calledRuntimeType->
			InvokeStaticMethod("CastSampleMethod",
				calledRuntime->Cast({ targetType, 5.2 }))->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_Cast_ToUInt32>
		EXPECT_EQ("CastSampleMethod with System.UInt32 called", result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_Cast_ToFloat) {
		// <TestResources_Cast_ToFloat>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// get type for casting
		auto targetType = calledRuntime->GetType("System.Single");

		// invoke type's static method 
		auto response = calledRuntimeType->
			InvokeStaticMethod("CastSampleMethod",
				calledRuntime->Cast({ targetType, 5 }))->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_Cast_ToFloat>
		EXPECT_EQ("CastSampleMethod with System.Single called", result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0) {
		// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method which throws exception 
		try {
			calledRuntimeType->InvokeStaticMethod("DivideBy", {10, 0 })->Execute();
		}
		catch (std::exception& e) {
			// write exception to console
			std::cout << e.what() << std::endl;
		}
		// </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_GenericStaticMethod) {
		// <TestResources_GenericStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// get type for generic method
		auto targetType = calledRuntime->GetType("System.Int32");

		// invoke type's generic static method
		auto response = calledRuntimeType->
			InvokeGenericStaticMethod("GenericSampleStaticMethod", std::deque<std::any>{ targetType, 7, 5 })->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GenericStaticMethod>
		EXPECT_EQ("7 and 5", result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_GenericMethod) {
		// <TestResources_GenericMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// get type for generic method
		auto targetType = calledRuntime->GetType("System.Int32");

		// invoke instance generic method
		auto response = instance->
			InvokeGenericMethod("GenericSampleMethod", { targetType, 7, 5 })->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GenericMethod>
		EXPECT_EQ("7 or 5", result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_GenericMethodWithTwoTypes) {
		// <TestResources_GenericMethodWithTwoTypes>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// get types for generic method
		auto targetType1 = calledRuntime->GetType("System.String")->Execute();
		auto targetType2 = calledRuntime->GetType("System.Int32")->Execute();

		// invoke type's generic method
		auto response = instance->
			InvokeGenericMethod("GenericSampleMethodWithTwoTypes",
				{ std::vector<std::any>{ targetType1, targetType2 },
								  "test" })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GenericMethodWithTwoTypes>
		EXPECT_EQ(0, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_EnumAddToList) {
		// <TestResources_EnumAddToList>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		//get enum
		auto enumType = calledRuntime->GetType("TestClass.TestClass+Fruit")->Execute();

		//create enum items
		auto apple = calledRuntime->GetEnumItem({ enumType, "Apple" })->Execute();
		auto mango = calledRuntime->GetEnumItem({ enumType, "Mango" })->Execute();

		// create fruits array
		std::vector<std::any> fruitsList = { apple, mango };

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// invoke type's static method
		auto response = calledRuntimeType->
			InvokeStaticMethod("AddFruitsToList", fruitsList)->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_EnumAddToList>
		EXPECT_EQ("2 fruits on the list", result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_EnumNameAndValue) {
		// <TestResources_EnumNameAndValue>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get enum
		auto enumType = calledRuntime->GetType("TestClass.TestClass+Fruit");

		//get enum's item
		auto fruit1 = calledRuntime->GetEnumItem({ enumType, "Mango" });
		auto fruit2 = calledRuntime->GetEnumItem({ enumType, "Orange" });

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
		EXPECT_EQ(3, result2);
		EXPECT_EQ(2, result4);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_2DArray_GetIndex) {
		// <TestResources_2DArray_GetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className);

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance();

		// invoke instance's method
		auto array = instance->InvokeInstanceMethod("Get2DArray")->Execute();

		// get index from array
		auto response1 = array->GetIndex({ 1, 1 })->Execute();
		std::vector<std::any> indexes = { 0, 0 };
		auto response2 = array->GetIndex(indexes)->Execute();

		// get value from response
		auto result1 = std::any_cast<std::string>(response1->GetValue());
		auto result2 = std::any_cast<std::string>(response2->GetValue());

		// write result to console
		std::cout << result1 << std::endl;
		std::cout << result2 << std::endl;
		// </TestResources_2DArray_GetIndex>
		EXPECT_EQ("S11", result1);
		EXPECT_EQ("S00", result2);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_2DArray_GetSizeAndRank) {
		// <TestResources_2DArray_GetSizeAndRank>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance()->Execute();

		// invoke instance's method
		auto array = instance->InvokeInstanceMethod("Get2DArray")->Execute();

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

	TEST(Integration, Test_NetframeworkDll_TestResources_2DArray_SetIndex) {
		// <TestResources_2DArray_SetIndex>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className);

		// create type's instance
		auto instance = calledRuntimeType->CreateInstance();

		// invoke instance's method
		auto array = instance->InvokeInstanceMethod("Get2DArray")->Execute();

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

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_CreateInstanceOfGenericClass) {
		// <StandardLibrary_CreateInstanceOfGenericClass>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get string type
		auto stringType = calledRuntime->GetType("System.String");

		// get generic class with string type as parameter
		auto typeList = calledRuntime->GetType("System.Collections.Generic.List`1", stringType)->Execute();

		// create type's instance
		auto list = typeList->CreateInstance()->Execute();

		//invoke instance methods
		list->InvokeInstanceMethod("Add", "one")->Execute();
		list->InvokeInstanceMethod("Add", "two")->Execute();
		list->InvokeInstanceMethod("Add", "three")->Execute();
		list->InvokeInstanceMethod("Add", "four")->Execute();
		list->InvokeInstanceMethod("Add", "five")->Execute();
		list->InvokeInstanceMethod("Add", "six")->Execute();

		// check number of elements in list
		auto response = list->GetInstanceField("Count")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_CreateInstanceOfGenericClass>
		EXPECT_EQ(6, result);
	}

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_HandleList) {
		// <StandardLibrary_HandleList>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get string type
		auto stringType = calledRuntime->GetType("System.String");

		// get generic class with string type as parameter
		auto typeList = calledRuntime->GetType("System.Collections.Generic.List`1", stringType)->Execute();

		// create instance of generic class
		auto list = typeList->CreateInstance()->Execute();

		//invoke instance methods
		list->InvokeInstanceMethod("Add", "one")->Execute();
		list->InvokeInstanceMethod("Add", "two")->Execute();
		list->InvokeInstanceMethod("Add", "three")->Execute();
		list->InvokeInstanceMethod("Add", "four")->Execute();
		list->InvokeInstanceMethod("Add", "five")->Execute();
		list->InvokeInstanceMethod("Add", "six")->Execute();

		// get elements from list
		auto element0 = list->GetIndex(0)->Execute();
		auto element1 = (*list)[1]->Execute();

		// get values from responses
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

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_HandleDictionary) {
		// <StandardLibrary_HandleDictionary>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get types for string and double
		auto stringType = calledRuntime->GetType("System.String");
		auto doubleType = calledRuntime->GetType("System.Double");

		// get generic class
		auto typeDictionary = calledRuntime->GetType("System.Collections.Generic.Dictionary`2", { stringType, doubleType })->Execute();

		// create instance of generic class
		auto dictionary = typeDictionary->CreateInstance()->Execute();

		// invoke instance method
		dictionary->InvokeInstanceMethod("Add", { "pi", M_PI })->Execute();
		dictionary->InvokeInstanceMethod("Add", { "e", M_E })->Execute();
		dictionary->InvokeInstanceMethod("Add", { "c", 299792458.0 })->Execute();

		// get value from dictionary
		auto response1 = dictionary->GetIndex("e")->Execute();
		auto response2 = (*dictionary)["pi"]->Execute();

		// get value from response
		auto result1 = std::any_cast<double>(response1->GetValue());
		auto result2 = std::any_cast<double>(response2->GetValue());

		// write result to console
		std::cout << result1 << std::endl;
		std::cout << result2 << std::endl;
		// </StandardLibrary_HandleDictionary>
		EXPECT_EQ(M_E, result1);
		EXPECT_EQ(M_PI, result2);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_Refs_OneArg) {
		// <TestResources_Refs>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();

		// create values for ref

		// first way - pass only value
		auto refValue1 = calledRuntime->AsRef(10)->Execute();

		// second way - pass value and type
		// ref variable should have specific type to be able to invoke methods on it
		// this way enables to cast value to specific type needed by called method
		auto intType = calledRuntime->GetType("System.Int32")->Execute();
		auto refValue2 = calledRuntime->AsRef({ 20.0, intType })->Execute();

		// invoke type's static method with ref values
		calledRuntimeType->InvokeStaticMethod("RefSampleMethod", refValue1)->Execute();
		calledRuntimeType->InvokeStaticMethod("RefSampleMethod", refValue2)->Execute();

		// get ref values
		auto result1 = std::any_cast<int>(refValue1->GetRefValue()->Execute()->GetValue());
		auto result2 = std::any_cast<int>(refValue2->GetRefValue()->Execute()->GetValue());

		// write result to console
		std::cout << result1 << std::endl;
		std::cout << result2 << std::endl;
		// </TestResources_Refs>
		EXPECT_EQ(20, result1);
		EXPECT_EQ(40, result2);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_Refs_MultipleArgs) {
		// <TestResources_Refs_MultipleArgs>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();
		auto doubleType = calledRuntime->GetType("System.Double")->Execute();

		// create values for ref
		// ref variable should have specific type to be able to invoke methods on it
		// This way enables to cast value to specific type needed by called method
		auto refToInt = calledRuntime->AsRef(10)->Execute();
		auto refToDouble = calledRuntime->AsRef({ 5, doubleType })->Execute();
		auto refToString = calledRuntime->AsRef("Before execution")->Execute();

		// invoke type's static method with ref values
		calledRuntimeType->InvokeStaticMethod("RefSampleMethod2", { refToInt, refToDouble, refToString })->Execute();

		// get ref values
		auto result1 = std::any_cast<int>(refToInt->GetRefValue()->Execute()->GetValue());
		auto result2 = std::any_cast<double>(refToDouble->GetRefValue()->Execute()->GetValue());
		auto result3 = std::any_cast<std::string>(refToString->GetRefValue()->Execute()->GetValue());

		// write result to console
		std::cout << result1 << std::endl;
		std::cout << result2 << std::endl;
		std::cout << result3 << std::endl;
		// </TestResources_Refs_MultipleArgs>
		EXPECT_EQ(20, result1);
		EXPECT_EQ(2.5, result2);
		EXPECT_EQ("Done", result3);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_Outs) {
		// <TestResources_Outs>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// set up variables
		auto libraryPath = resourcesDirectory + "/TestClass.dll";
		auto className = "TestClass.TestClass";

		// load custom library
		calledRuntime->LoadLibrary(libraryPath);

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType(className)->Execute();
		auto stringType = calledRuntime->GetType("System.String")->Execute();

		// create values for outs
		// out variable should have specific type to be able to invoke methods on it
		// first way - pass only type
		auto outValue_1 = calledRuntime->AsOut(stringType)->Execute();
		// second way - pass initial value and type to cast on
		auto outValue_2 = calledRuntime->AsOut({ 'c', stringType })->Execute();
		// third way - pass initial value without specific type
		auto outValue_3 = calledRuntime->AsOut("Test string")->Execute();

		// invoke type's static method with out values
		calledRuntimeType->InvokeStaticMethod("OutSampleMethod", outValue_1)->Execute();
		calledRuntimeType->InvokeStaticMethod("OutSampleMethod", outValue_2)->Execute();
		calledRuntimeType->InvokeStaticMethod("OutSampleMethod", outValue_3)->Execute();

		// get outs' values
		auto result1 = std::any_cast<std::string>(outValue_1->GetRefValue()->Execute()->GetValue());
		auto result2 = std::any_cast<std::string>(outValue_2->GetRefValue()->Execute()->GetValue());
		auto result3 = std::any_cast<std::string>(outValue_3->GetRefValue()->Execute()->GetValue());

		// write result to console
		std::cout << result1 << std::endl;
		std::cout << result2 << std::endl;
		std::cout << result3 << std::endl;

		// </TestResources_Outs>
		EXPECT_EQ("String from OutSampleMethod", result1);
		EXPECT_EQ("String from OutSampleMethod", result2);
		EXPECT_EQ("String from OutSampleMethod", result3);
	}
}
#endif