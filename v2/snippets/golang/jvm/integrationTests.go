package gotojvmintegrationtests

import (
	"fmt"
	"math"
	"os"
	"testing"

	"javonet.com/integrationTests/integrationtests/activationcredentials"
	"javonet.com/javonet"
)

var _javonetSrcRoot string
var libraryPath string
var className string

func init() {
	cwd, _ := os.Getwd()
	_javonetSrcRoot = cwd + "/../../.."
	// <TestResources_TestClassValues>
	libraryPath = _javonetSrcRoot + "/testResources/jvm/JavaTestClass.dll"
	className = "javonet.test.resources.jvm.JavaTestClass"
	// </TestResources_TestClassValues>
	javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Integration_Jvm_StandardLibrary_InvokeStaticMethod_MathAbs(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	call := javonet.InMemory().Jvm().GetType("java.lang.Math").InvokeStaticMethod("abs", -50).Execute()
	result := call.GetValue().(int32)
	// </StandardLibrary_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Jvm_StandardLibrary_GetStaticField_SystemMathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	call := javonet.InMemory().Jvm().GetType("java.lang.Math").GetStaticField("PI").Execute()
	result := call.GetValue().(float64)
	// </StandardLibrary_GetStaticField>
	expectedResponse := math.Pi
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9(t *testing.T) {
	// <StandardLibrary_InvokeInstanceMethod>
	instance := javonet.InMemory().Jvm().GetType("java.util.Random").CreateInstance().Execute()
	call := instance.InvokeInstanceMethod("nextInt", 10).Execute()
	result := call.GetValue().(int32)
	// </StandardLibrary_InvokeInstanceMethod>

	if result < 0 || result > 10 {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result))
	}
}

func Test_Jvm_TestResources_LoadLibrary_libraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	javonet.InMemory().Jvm().LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	javonet.InMemory().Jvm().LoadLibrary(libraryPath)
	call := javonet.InMemory().Jvm().GetType(className).InvokeStaticMethod("multiplyByTwo", 25).Execute()
	result := call.GetValue().(int32)
	// </TestResources_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Jvm_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Jvm().LoadLibrary(libraryPath)
	call := javonet.InMemory().Jvm().GetType(className).GetStaticField("staticValue").Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(3)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Jvm_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	javonet.InMemory().Jvm().LoadLibrary(libraryPath)
	javonet.InMemory().Jvm().GetType(className).SetStaticField("staticValue", 75).Execute()
	// </TestResources_SetStaticField>
	call := javonet.InMemory().Jvm().GetType(className).GetStaticField("staticValue").Execute()
	result := call.GetValue().(int32)
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
	javonet.InMemory().Jvm().GetType(className).SetStaticField("staticValue", 3).Execute()
}

func Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Jvm().LoadLibrary(libraryPath)
	instance := javonet.InMemory().Jvm().GetType(className).CreateInstance(4, 5).Execute()
	call := instance.InvokeInstanceMethod("multiplyTwoNumbers", 5, 4)
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Jvm_TestResources_GetInstanceField_PublicValue_1(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Jvm().LoadLibrary(libraryPath)
	instance := javonet.InMemory().Jvm().GetType(className).CreateInstance(4, 5).Execute()
	call := instance.GetInstanceField("publicValue")
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(1)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
