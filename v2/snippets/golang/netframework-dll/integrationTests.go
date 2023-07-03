//go:build !linux && !darwin
// +build !linux,!darwin

package gotoclrintegrationtests

import (
	"fmt"
	"math"
	"os"
	"reflect"
	"strings"
	"testing"

	"javonet.com/integrationTests/integrationtests/activationcredentials"
	Javonet "javonet.com/javonet"
)

var resourcesDirectory string

func init() {
	cwd, _ := os.Getwd()
	resourcesDirectory = cwd + "/../../../../testResources/netframework-dll"
	Javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenseKey)
}

func Test_Clr_TestResources_LoadLibrary_LibraryPath_NoException(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Clr_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// get type's static field
	response := calledRuntimeType.GetStaticField("StaticValue").Execute()

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

func Test_Clr_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// set static field's value
	calledRuntimeType.SetStaticField("StaticValue", 75).Execute()

	// get type's static field
	response := calledRuntimeType.GetStaticField("StaticValue").Execute()

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

func Test_Clr_TestResources_GetInstanceField_PublicValue_18(t *testing.T) {
	// <TestResources_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance := calledRuntimeType.CreateInstance(18, 19).Execute()

	// get instance's field
	response := instance.GetInstanceField("PublicValue").Execute()

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

func Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// invoke type's static method
	response := calledRuntimeType.InvokeStaticMethod("MultiplyByTwo", 25).Execute()

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

func Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	response := instance.InvokeInstanceMethod("MultiplyTwoNumbers", 5, 4).Execute()

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

func Test_Clr_TestResources_1DArray_GetIndex_2_StringThree(t *testing.T) {
	// <TestResources_1DArray_GetIndex>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array := instance.InvokeInstanceMethod("Get1DArray").Execute()

	// get index from array
	response := array.GetIndex(2).Execute()

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

func Test_Clr_TestResources_1DArray_GetSize_5(t *testing.T) {
	// <TestResources_1DArray_GetSize>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array := instance.InvokeInstanceMethod("Get1DArray").Execute()

	// get array's size
	response := array.GetSize().Execute()

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

func Test_Clr_TestResources_1DArray_SetIndex_StringSeven(t *testing.T) {
	// <TestResources_1DArray_SetIndex>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array := instance.InvokeInstanceMethod("Get1DArray").Execute()

	// set array's index
	array.SetIndex("seven", 4).Execute()

	// get index from array
	response := array.GetIndex(4).Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_1DArray_SetIndex>
	array.SetIndex("five", 4).Execute()
	expectedResponse := "seven"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Clr_TestResources_1DArray_RetrieveArray(t *testing.T) {
	// <TestResources_1DArray_RetrieveArray>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	arrayReference := instance.InvokeInstanceMethod("Get1DArray").Execute()

	// get array from reference
	response := arrayReference.RetrieveArray()

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

func Test_Clr_TestResources_Cast_ToUInt32(t *testing.T) {
	// <TestResources_Cast_ToUInt32>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// invoke type's static method
	response := calledRuntimeType.InvokeStaticMethod("CastSampleMethod", calledRuntime.Cast("System.UInt32", 5.2)).Execute()

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

func Test_Clr_TestResources_Cast_ToFloat(t *testing.T) {
	// <TestResources_Cast_ToFloat>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType(className).Execute()

	// invoke type's static method
	response := calledRuntimeType.InvokeStaticMethod("CastSampleMethod", calledRuntime.Cast("System.Single", 5)).Execute()

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

func Test_Clr_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType("System.Math").Execute()

	// get type's static field
	response := calledRuntimeType.GetStaticField("PI").Execute()

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

func Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022(t *testing.T) {
	// <StandardLibrary_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType("System.DateTime").Execute()

	// create type's instance
	instance := calledRuntimeType.CreateInstance(2022, 9, 1).Execute()

	// get instance's field
	call := instance.GetInstanceField("Year").Execute()

	// get value from response
	result := call.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_GetInstanceField>
	expectedResponse := int32(2022)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Clr_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType("System.Math").Execute()

	// invoke type's static method
	response := calledRuntimeType.InvokeStaticMethod("Abs", -50).Execute()

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

func Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022(t *testing.T) {
	// <StandardLibrary_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create called runtime context
	calledRuntime := Javonet.InMemory().Clr()

	// get type from the runtime
	calledRuntimeType := calledRuntime.GetType("System.DateTime").Execute()

	// create type's instance
	instance := calledRuntimeType.CreateInstance(2022, 9, 1).Execute()

	// invoke instance's method
	call := instance.InvokeInstanceMethod("ToShortDateString").Execute()

	// get value from response
	result := call.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_InvokeInstanceMethod>
	expectedResponse := "2022"
	if !strings.Contains(result, expectedResponse) {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
