package gotonetcoreintegrationtests

import (
	"fmt"
	"math"
	"os"
	"strings"
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
	libraryPath = _javonetSrcRoot + "/../../../testResources/netcore/NetcoreTestClass.dll"
	className = "NetcoreTestClass.NetcoreTestClass"
	// <TestResources_TestClassValues>
	javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Integration_Netcore_StandardLibrary_InvokeStaticMethod_MathAbs(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	call := javonet.InMemory().Netcore().GetType("System.Math").InvokeStaticMethod("Abs", -50).Execute()
	result := call.GetValue().(int32)
	// </StandardLibrary_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Netcore_StandardLibrary_GetStaticField_SystemMathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	call := javonet.InMemory().Netcore().GetType("System.Math").GetStaticField("PI").Execute()
	result := call.GetValue().(float64)
	// </StandardLibrary_GetStaticField>
	expectedResponse := math.Pi
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Netcore_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022(t *testing.T) {
	// <StandardLibrary_InvokeInstanceMethod>
	instance := javonet.InMemory().Netcore().GetType("System.DateTime").CreateInstance(2022, 9, 1).Execute()
	call := instance.InvokeInstanceMethod("ToShortDateString").Execute()
	result := call.GetValue().(string)
	// </StandardLibrary_InvokeInstanceMethod>
	expectedResponse := "2022"
	if !strings.Contains(result, expectedResponse) {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Netcore_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022(t *testing.T) {
	// <StandardLibrary_InvokeInstanceMethod>
	instance := javonet.InMemory().Netcore().GetType("System.DateTime").CreateInstance(2022, 9, 1).Execute()
	call := instance.GetInstanceField("Year").Execute()
	result := call.GetValue().(int32)
	// </StandardLibrary_InvokeInstanceMethod>
	expectedResponse := int32(2022)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Netcore_TestResources_LoadLibrary_libraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	javonet.InMemory().Netcore().LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Netcore_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	javonet.InMemory().Netcore().LoadLibrary(libraryPath)
	call := javonet.InMemory().Netcore().GetType(className).InvokeStaticMethod("MultiplyByTwo", 25).Execute()
	result := call.GetValue().(int32)
	// </StandardLibrary_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Netcore_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Netcore().LoadLibrary(libraryPath)
	call := javonet.InMemory().Netcore().GetType(className).GetStaticField("StaticValue").Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(3)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Netcore_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	javonet.InMemory().Netcore().LoadLibrary(libraryPath)
	javonet.InMemory().Netcore().GetType(className).SetStaticField("StaticValue", 75).Execute()
	// </TestResources_SetStaticField>
	call := javonet.InMemory().Netcore().GetType(className).GetStaticField("StaticValue").Execute()
	result := call.GetValue().(int32)
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
	javonet.InMemory().Netcore().GetType(className).SetStaticField("StaticValue", 3).Execute()
}

func Test_Netcore_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Netcore().LoadLibrary(libraryPath)
	instance := javonet.InMemory().Netcore().GetType(className).CreateInstance(4, 5).Execute()
	call := instance.InvokeInstanceMethod("MultiplyTwoNumbers", 5, 4)
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Netcore_TestResources_GetInstanceField_PublicValue_1(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Netcore().LoadLibrary(libraryPath)
	instance := javonet.InMemory().Netcore().GetType(className).CreateInstance(4, 5).Execute()
	call := instance.GetInstanceField("PublicValue")
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(1)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
