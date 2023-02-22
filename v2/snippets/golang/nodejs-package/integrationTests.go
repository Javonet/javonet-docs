package gotonodejsintegrationtests

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
	libraryPath = javonetSrcRoot + "/testResources/nodejs-package/NodejsTestClass.js"
	className = "NodejsTestClass.js"
	// </TestResources_TestClassValues>
	javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	call := javonet.InMemory().Nodejs().GetType("Math").InvokeStaticMethod("abs", -50).Execute()
	result := call.GetValue().(int32)
	// </StandardLibrary_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Nodejs_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	call := javonet.InMemory().Nodejs().GetType("Math").GetStaticField("PI").Execute()
	result := call.GetValue().(float64)
	// </StandardLibrary_GetStaticField>
	expectedResponse := math.Pi
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	javonet.InMemory().Nodejs().LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Nodejs_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	javonet.InMemory().Nodejs().LoadLibrary(libraryPath)
	call := javonet.InMemory().Nodejs().GetType(className).InvokeStaticMethod("multiplyByTwo", 25).Execute()
	result := call.GetValue().(int32)
	// </TestResources_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Nodejs_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Nodejs().LoadLibrary(libraryPath)
	call := javonet.InMemory().Nodejs().GetType(className).GetStaticField("staticValue").Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(3)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Nodejs_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	javonet.InMemory().Nodejs().LoadLibrary(libraryPath)
	javonet.InMemory().Nodejs().GetType(className).SetStaticField("staticValue", 75).Execute()
	// </TestResources_SetStaticField>
	call := javonet.InMemory().Nodejs().GetType(className).GetStaticField("staticValue").Execute()
	result := call.GetValue().(int32)
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}

}

func Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Nodejs().LoadLibrary(libraryPath)
	instance := javonet.InMemory().Nodejs().GetType(className).CreateInstance(4, 5).Execute()
	call := instance.InvokeInstanceMethod("multiplyTwoNumbers", 5, 4).Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Nodejs_TestResources_GetInstanceField_PublicValue_1(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Nodejs().LoadLibrary(libraryPath)
	instance := javonet.InMemory().Nodejs().GetType(className).CreateInstance(1, 2).Execute()
	call := instance.GetInstanceField("publicValue").Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(1)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
