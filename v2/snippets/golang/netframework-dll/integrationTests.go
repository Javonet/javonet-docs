//go:build !linux && !darwin
// +build !linux,!darwin

package netframeworkdll

import (
	"fmt"
	"math"
	"os"
	"reflect"
	"strings"
	"testing"

	"javonet.com/integrationTests/utils/activationcredentials"
	Javonet "javonet.com/javonet"
)

var resourcesDirectory string

func init() {
	cwd, _ := os.Getwd()
	resourcesDirectory = cwd + "/../../../../testResources/netframework-dll"
	Javonet.Activate(activationcredentials.YourLicenseKey)
}

func Test_NetframeworkDll_StandardLibrary_CreateRuntimeContext(t *testing.T) {
	// <StandardLibrary_CreateRuntimeContext>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// use calledRuntime to interact with code from other technology
	// </StandardLibrary_CreateRuntimeContext>

	if calledRuntime == nil {
		t.Fatal("calledRuntime is nil")
	}
}

func Test_NetframeworkDll_StandardLibrary_CreateInvocationContext(t *testing.T) {
	// <StandardLibrary_CreateInvocationContext>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// construct an invocation context - this invocationContext in non-materialized
	invocationContext := calledRuntime.GetType("System.Math").InvokeStaticMethod("Abs", -50)

	// execute invocation context - this will materialize the invocationContext
	response, err := invocationContext.Execute()
	if err != nil {
		fmt.Println("Error: " + err.Error())
	}
	// </StandardLibrary_CreateInvocationContext>
	if err != nil {
		t.Fatal("Error: " + err.Error())
	}
	if response == nil {
		t.Fatal("response is nil")
	}
}

func Test_NetframeworkDll_StandardLibrary_GetValue(t *testing.T) {
	// <StandardLibrary_GetValue>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// construct an invocation context - this invocationContext in non-materialized
	invocationContext := calledRuntime.GetType("System.Math").InvokeStaticMethod("Abs", -50)

	// execute invocation context - this will materialize the invocationContext
	response, err := invocationContext.Execute()
	if err != nil {
		fmt.Println("Error: " + err.Error())
	}

	// get value from response
	result, ok := response.GetValue().(int32)
	if !ok {
		fmt.Println("Error: cannot convert response value to int32")
	}

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_GetValue>
	expectedResult := int32(50)
	if err != nil || result != expectedResult {
		t.Fatalf("Test failed. Response: %v. Expected response: %v", result, expectedResult)
	}
}

func Test_NetframeworkDll_TestResources_LoadLibrary_LibraryPath_NoException(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_NetframeworkDll_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// get type's static field
	response, _ := calledRuntimeType.GetStaticField("StaticValue").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_GetStaticField>
	expectedResponse := int32(3)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// set static field's value
	calledRuntimeType.SetStaticField("StaticValue", 75).Execute()

	// get type's static field
	response, _ := calledRuntimeType.GetStaticField("StaticValue").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetStaticField>
	calledRuntimeType.SetStaticField("StaticValue", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_GetInstanceField_PublicValue_18(t *testing.T) {
	// <TestResources_GetInstanceField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance(18, 19).Execute()

	// get instance's field
	response, _ := instance.GetInstanceField("PublicValue").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_GetInstanceField>
	expectedResponse := int32(18)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_SetInstanceField_PublicValue_44(t *testing.T) {
	// <TestResources_SetInstanceField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance(18, 19).Execute()

	// set instance's field
	instance.SetInstanceField("PublicValue", 44).Execute()

	// get instance's field
	response, _ := instance.GetInstanceField("PublicValue").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetInstanceField>
	expectedResponse := int32(44)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// invoke type's static method
	response, _ := calledRuntimeType.InvokeStaticMethod("MultiplyByTwo", 25).Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	response, _ := instance.InvokeInstanceMethod("MultiplyTwoNumbers", 5, 4).Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_InvokeInstanceMethod>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

// created new ticket to fix this test
// func Test_NetframeworkDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException(t *testing.T) {
// 	// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
// 	// use Activate only once in your app
// 	result, err := Javonet.Activate("your-license-key")
// 	if result != 0 {
// 		fmt.Println("Wrong activation result: " + err.Error())
// 	}
// 	if err != nil {
// 		fmt.Println("Activation exception: " + err.Error())
// 	}

// 	// create called runtime context
// 	calledRuntime, err := Javonet.InMemory().Clr()
// 	if err != nil {
// 		fmt.Println("Creating runtime exception: " + err.Error())
// 	}

// 	// set up variables
// 	libraryPath := resourcesDirectory + "/TestClass.dll"
// 	className := "TestClass.TestClass"

// 	// load custom library
// 	_, err = calledRuntime.LoadLibrary(libraryPath)
// 	if err != nil {
// 		fmt.Println("Loading library exception: " + err.Error())
// 	}

// 	// get type from the runtime
// 	calledRuntimeType, err := calledRuntime.GetType(className).Execute()
// 	if err != nil {
// 		fmt.Println("Get Type exception: " + err.Error())
// 	}

// 	// invoke type's static method which throws exception
// 	_, err = calledRuntimeType.InvokeStaticMethod("DivideBy", 10, 0).Execute()
// 	fmt.Println(err)
// 	// </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
// 	if err == nil {
// 		t.Fatal("Exception was not thrown")
// 	}
// 	if !strings.Contains(err.Error(), "DivideByThird") {
// 		t.Fatal("Wrong exception message: " + err.Error())
// 	}
// }

func Test_NetframeworkDll_TestResources_1DArray_GetIndex_2_StringThree(t *testing.T) {
	// <TestResources_1DArray_GetIndex>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("Get1DArray").Execute()

	// get index from array
	response, _ := array.GetIndex(2).Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_1DArray_GetIndex>
	expectedResponse := "three"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_1DArray_GetSize_5(t *testing.T) {
	// <TestResources_1DArray_GetSize>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("Get1DArray").Execute()

	// get array's size
	response, _ := array.GetSize().Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_1DArray_GetSize>
	expectedResponse := int32(5)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_1DArray_SetIndex_StringSeven(t *testing.T) {
	// <TestResources_1DArray_SetIndex>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("Get1DArray").Execute()

	// set array's index
	array.SetIndex(4, "seven").Execute()

	// get index from array
	response, _ := array.GetIndex(4).Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_1DArray_SetIndex>
	array.SetIndex(4, "five").Execute()
	expectedResponse := "seven"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_1DArray_RetrieveArray(t *testing.T) {
	// <TestResources_1DArray_RetrieveArray>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	arrayReference, _ := instance.InvokeInstanceMethod("Get1DArray").Execute()

	// get array from reference
	response, _ := arrayReference.RetrieveArray()

	// create new array to copy response
	result := make([]string, len(response))
	for i, v := range response {
		result[i] = v.(string)
	}

	// write result to console
	fmt.Println(result)
	// </TestResources_1DArray_RetrieveArray>
	expectedResponse := []string{"one", "two", "three", "four", "five"}
	if !reflect.DeepEqual(result, expectedResponse) {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_Cast_ToUInt32(t *testing.T) {
	// <TestResources_Cast_ToUInt32>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// get type for casting
	targetType := calledRuntime.GetType("System.UInt32")

	// invoke type's static method
	response, _ := calledRuntimeType.InvokeStaticMethod("CastSampleMethod", calledRuntime.Cast(targetType, 5.2)).Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_Cast_ToUInt32>
	expectedResponse := "CastSampleMethod with System.UInt32 called"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_Cast_ToFloat(t *testing.T) {
	// <TestResources_Cast_ToFloat>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// get type for casting
	targetType := calledRuntime.GetType("System.Single")

	// invoke type's static method
	response, _ := calledRuntimeType.InvokeStaticMethod("CastSampleMethod", calledRuntime.Cast(targetType, 5.2)).Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_Cast_ToFloat>
	expectedResponse := "CastSampleMethod with System.Single called"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_GenericStaticMethod(t *testing.T) {
	// <TestResources_GenericStaticMethod>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// get type for generic method
	targetType := calledRuntime.GetType("System.Int32")

	// invoke type's generic static method
	response, _ := calledRuntimeType.
		InvokeGenericStaticMethod("GenericSampleStaticMethod", targetType, 7, 5).
		Execute()
	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_GenericStaticMethod>
	expectedResponse := "7 and 5"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_GenericMethod(t *testing.T) {
	// <TestResources_GenericMethod>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// invoke type's generic static method
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// get type for generic method
	targetType := calledRuntime.GetType("System.Int32")

	// invoke type's generic method
	response, _ := instance.
		InvokeGenericMethod("GenericSampleMethod", targetType, 7, 5).
		Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_GenericMethod>
	expectedResponse := "7 or 5"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_TestResources_EnumNameAndValue(t *testing.T) {
	// <TestResources_EnumNameAndValue>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	//get enum
	enumType := calledRuntime.GetType("TestClass.TestClass+Fruit")

	//create enum items
	fruit1 := calledRuntime.GetEnumItem(enumType, "Mango")
	fruit2 := calledRuntime.GetEnumItem(enumType, "Orange")

	//get items' names and values
	response1, _ := fruit1.GetEnumName().Execute()
	fruit1Name := response1.GetValue().(string)
	response2, _ := fruit2.GetEnumName().Execute()
	fruit2Name := response2.GetValue().(string)
	response3, _ := fruit1.GetEnumValue().Execute()
	fruit1Value := response3.GetValue().(int32)
	response4, _ := fruit2.GetEnumValue().Execute()
	fruit2Value := response4.GetValue().(int32)

	// write result to console
	result := fmt.Sprintf("%v: %d, %v: %d", fruit1Name, fruit1Value, fruit2Name, fruit2Value)
	fmt.Println(result)
	// </TestResources_EnumNameAndValue>
	expectedResponse := "Mango: 3, Orange: 2"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType("System.Math").Execute()

	// get type's static field
	response, _ := calledRuntimeType.GetStaticField("PI").Execute()

	// get value from response
	result := response.GetValue().(float64)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_GetStaticField>
	expectedResponse := math.Pi
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022(t *testing.T) {
	// <StandardLibrary_GetInstanceField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType("System.DateTime").Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance(2022, 9, 1).Execute()

	// get instance's field
	response, _ := instance.GetInstanceField("Year").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_GetInstanceField>
	expectedResponse := int32(2022)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType("System.Math").Execute()

	// invoke type's static method
	response, _ := calledRuntimeType.InvokeStaticMethod("Abs", -50).Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_NetframeworkDll_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022(t *testing.T) {
	// <StandardLibrary_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Clr()

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType("System.DateTime").Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance(2022, 9, 1).Execute()

	// invoke instance's method
	response, _ := instance.InvokeInstanceMethod("ToShortDateString").Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_InvokeInstanceMethod>
	expectedResponse := "2022"
	if !strings.Contains(result, expectedResponse) {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
