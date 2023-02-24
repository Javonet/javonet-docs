package gotorubyintegrationtests

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
	libraryPath = javonetSrcRoot + "/testResources/ruby-package/TestClass.rb"
	className = "TestClass::TestClass"
	// </TestResources_TestClassValues>
	javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Ruby_StandardLibrary_LoadLibrary_Base64_NoExeption(t *testing.T) {
	// <StandardLibrary_LoadLibrary>
	javonet.InMemory().Ruby().LoadLibrary("base64")
	// </StandardLibrary_LoadLibrary>
}

func Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Sqrt_2500_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	call := javonet.InMemory().Ruby().GetType("Math").InvokeStaticMethod("sqrt", 2500).Execute()
	result := call.GetValue().(float32)
	// </StandardLibrary_InvokeStaticMethod>
	expectedResponse := float32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Ruby_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	call := javonet.InMemory().Ruby().GetType("Math").GetStaticField("PI").Execute()
	result := call.GetValue().(float32)
	// </StandardLibrary_GetStaticField>
	expectedResponse := float32(math.Pi)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Ruby_TestResources_LoadLibrary_libraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	javonet.InMemory().Ruby().LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	javonet.InMemory().Ruby().LoadLibrary(libraryPath)
	call := javonet.InMemory().Ruby().GetType(className).InvokeStaticMethod("multiply_by_two", 25).Execute()
	result := call.GetValue().(int32)
	// </TestResources_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Ruby_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Ruby().LoadLibrary(libraryPath)
	call := javonet.InMemory().Ruby().GetType(className).GetStaticField("static_value").Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(3)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Ruby_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	javonet.InMemory().Ruby().LoadLibrary(libraryPath)
	javonet.InMemory().Ruby().GetType(className).SetStaticField("static_value", 75).Execute()
	// </TestResources_SetStaticField>
	call := javonet.InMemory().Ruby().GetType(className).GetStaticField("static_value").Execute()
	result := call.GetValue().(int32)
	javonet.InMemory().Ruby().GetType(className).SetStaticField("static_value", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Ruby().LoadLibrary(libraryPath)
	instance := javonet.InMemory().Ruby().GetType(className).CreateInstance(4, 5).Execute()
	call := instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Ruby_TestResources_GetInstanceField_PublicValue_1(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Ruby().LoadLibrary(libraryPath)
	instance := javonet.InMemory().Ruby().GetType(className).CreateInstance(1, 2).Execute()
	call := instance.GetInstanceField("public_value").Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(1)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
