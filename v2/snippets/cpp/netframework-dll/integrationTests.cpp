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

	TEST(Integration, Test_NetframeworkDll_TestResources_LoadLibrary_libraryPath_NoExeption) {
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

	TEST(Integration, Test_NetframeworkDll_TestResources_GetStaticField_StaticValue_3) {
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

	TEST(Integration, Test_NetframeworkDll_TestResources_SetStaticField_StaticValue_75) {
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
		calledRuntimeType->SetStaticField({ "StaticValue", 75 })->Execute();

		// get type's static field
		auto response = calledRuntimeType->GetStaticField("StaticValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetStaticField>
		calledRuntimeType->SetStaticField({ "StaticValue", 3 })->Execute();
		EXPECT_EQ(75, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_GetInstanceField_PublicValue_18) {
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

	TEST(Integration, Test_NetframeworkDll_TestResources_SetInstanceField_PublicValue_44) {
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
		instance->SetInstanceField({ "PublicValue", 44 })->Execute();

		// get instance's field
		auto response = instance->GetInstanceField("PublicValue")->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_SetInstanceField>
		EXPECT_EQ(44, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50) {
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
		auto response = calledRuntimeType->InvokeStaticMethod({ "MultiplyByTwo", 25 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20) {
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
		auto response = instance->InvokeInstanceMethod({ "MultiplyTwoNumbers", 4, 5 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_InvokeInstanceMethod>
		EXPECT_EQ(20, result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_1DArray_GetIndex_2_StringThree) {
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

	TEST(Integration, Test_NetframeworkDll_TestResources_1DArray_GetSize_5) {
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

	TEST(Integration, Test_NetframeworkDll_TestResources_1DArray_SetIndex_StringSeven) {
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
			InvokeStaticMethod({ "CastSampleMethod",
				calledRuntime->Cast({targetType, 5.2}) })->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_Cast_ToUInt32>
		EXPECT_EQ("CastSampleMethod with System.UInt32 called", result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_Cast_Float) {
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
			InvokeStaticMethod({ "CastSampleMethod",
				calledRuntime->Cast({targetType, 5}) })->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_Cast_ToFloat>
		EXPECT_EQ("CastSampleMethod with System.Single called", result);
	}

	TEST(Integration, Test_NetframeworkDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException) {
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
			calledRuntimeType->InvokeStaticMethod({ "DivideBy", 10, 0 })->Execute();
		}
		catch (std::exception& e) {
			// write exception to console
			std::cout << e.what() << std::endl;
			return 0;
		}
		// </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
		GTEST_FAIL();
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
			InvokeGenericStaticMethod({ "GenericSampleStaticMethod", targetType, 7, 5 })->
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
			InvokeGenericMethod({ "GenericSampleMethod", targetType, 7, 5 })->
			Execute();

		// get value from response
		auto result = std::any_cast<std::string>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </TestResources_GenericMethod>
		EXPECT_EQ("7 or 5", result);
	}

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_GetStaticField_SystemMathPI_PI) {
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

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022) {

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

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_InvokeStaticMethod_SystemMath_Abs_minus50_50) {
		// <StandardLibrary_InvokeStaticMethod>
		// use Activate only once in your app
		Javonet::Activate("your-license-key");

		// create called runtime context
		auto calledRuntime = Javonet::InMemory()->Clr();

		// get type from the runtime
		auto calledRuntimeType = calledRuntime->GetType("System.Math")->Execute();

		// invoke type's static method 
		auto response = calledRuntimeType->InvokeStaticMethod({ "Abs", -50 })->Execute();

		// get value from response
		auto result = std::any_cast<int>(response->GetValue());

		// write result to console
		std::cout << result << std::endl;
		// </StandardLibrary_InvokeStaticMethod>
		EXPECT_EQ(50, result);
	}

	TEST(Integration, Test_NetframeworkDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022) {
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
}

#endif //_WIN32