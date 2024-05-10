//go:build !darwin
// +build !darwin

package perlpackage

import (
	"fmt"
	"os"
	"testing"

	"javonet.com/integrationTests/utils/activationcredentials"
	Javonet "javonet.com/javonet"
)

var resourcesDirectory string

func init() {
	cwd, _ := os.Getwd()
	resourcesDirectory = cwd + "/../../../../testResources/perl-package"
	Javonet.ActivateWithCredentials(activationcredentials.YourLicenseKey)
}

func Test_PerlPackage_TestResources_LoadLibrary_LibraryPath_NoException(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.pm"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_PerlPackage_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// get type's static field
	response, _ := calledRuntimeType.GetStaticField("static_value").Execute()

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

func Test_PerlPackage_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// set static field's value
	calledRuntimeType.SetStaticField("static_value", 75).Execute()

	// get type's static field
	response, _ := calledRuntimeType.GetStaticField("static_value").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetStaticField>
	calledRuntimeType.SetStaticField("static_value", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_PerlPackage_TestResources_GetInstanceField_PublicValue_1(t *testing.T) {
	// <TestResources_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// get instance's field
	response, _ := instance.GetInstanceField("public_value").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_GetInstanceField>
	expectedResponse := int32(1)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_PerlPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// invoke type's static method
	response, _ := calledRuntimeType.InvokeStaticMethod("multiply_by_two", 25).Execute()

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

func Test_PerlPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	response, _ := instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute()

	// get value from response
	result := response.GetValue().(int32)
	// </TestResources_InvokeInstanceMethod>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_PerlPackage_TestResources_1DArray_GetIndex_2_StringThree(t *testing.T) {
	// <TestResources_1DArray_GetIndex>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("get_1d_array").Execute()

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

func Test_PerlPackage_TestResources_1DArray_GetSize_5(t *testing.T) {
	// <TestResources_1DArray_GetSize>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("get_1d_array").Execute()

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

func Test_PerlPackage_TestResources_1DArray_SetIndex_StringSeven(t *testing.T) {
	// <TestResources_1DArray_SetIndex>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("get_1d_array").Execute()

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
