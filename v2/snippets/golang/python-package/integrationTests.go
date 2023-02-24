package gotopythonintegrationtests

import (
	"fmt"
	"math"
	"os"
	"testing"

	"javonet.com/integrationTests/integrationtests/activationcredentials"
	"javonet.com/javonet"
)

var javonetSrcRoot string
var libraryPath string
var className string

func init() {
	cwd, _ := os.Getwd()
	javonetSrcRoot = cwd + "/../../../.."
	// <TestResources_TestClassValues>
	libraryPath = javonetSrcRoot + "/testResources/python-package"
	className = "TestClass.TestClass"
	// </TestResources_TestClassValues>
	javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	call := javonet.InMemory().Python().GetType("builtins").InvokeStaticMethod("abs", -50).Execute()
	result := call.GetValue().(int32)
	// </StandardLibrary_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Python_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	call := javonet.InMemory().Python().GetType("math").GetStaticField("pi").Execute()
	result := call.GetValue().(float32)
	// </StandardLibrary_GetStaticField>
	expectedResponse := float32(math.Pi)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Python_TestResources_LoadLibrary_LibraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	javonet.InMemory().Python().LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	javonet.InMemory().Python().LoadLibrary(libraryPath)
	call := javonet.InMemory().Python().GetType(className).InvokeStaticMethod("multiply_by_two", 25).Execute()
	result := call.GetValue().(int32)
	// </TestResources_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Python_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Python().LoadLibrary(libraryPath)
	call := javonet.InMemory().Python().GetType(className).GetStaticField("static_value").Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(3)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Python_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	javonet.InMemory().Python().LoadLibrary(libraryPath)
	javonet.InMemory().Python().GetType(className).SetStaticField("static_value", 75).Execute()
	// </TestResources_SetStaticField>
	call := javonet.InMemory().Python().GetType(className).GetStaticField("static_value").Execute()
	result := call.GetValue().(int32)
	javonet.InMemory().Python().GetType(className).SetStaticField("static_value", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Python().LoadLibrary(libraryPath)
	instance := javonet.InMemory().Python().GetType(className).CreateInstance(4, 5).Execute()
	call := instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Python_TestResources_GetInstanceField_PublicValue_1(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Python().LoadLibrary(libraryPath)
	instance := javonet.InMemory().Python().GetType(className).CreateInstance(1, 2).Execute()
	call := instance.GetInstanceField("public_value").Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(1)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
