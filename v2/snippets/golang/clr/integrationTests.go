package gotoclrintegrationtests

import (
	"fmt"
	"math"
	"os"
	"runtime"
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
	libraryPath = _javonetSrcRoot + "/testResources/clr/ClrTestClass.dll"
	className = "ClrTestClass.ClrTestClass"
	// </TestResources_TestClassValues>
	javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Integration_Clr_StandardLibrary_InvokeStaticMethod_MathAbs(t *testing.T) {
	if runtime.GOOS == "windows" {
		// <StandardLibrary_InvokeStaticMethod>
		call := javonet.InMemory().Clr().GetType("System.Math").InvokeStaticMethod("Abs", -50).Execute()
		result := call.GetValue().(int32)
		// </StandardLibrary_InvokeStaticMethod>
		expectedResponse := int32(50)
		if result != expectedResponse {
			t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
		}
	} else {
		t.Skip("CLR not implemented on linux")
	}
}

func Test_Clr_StandardLibrary_GetStaticField_SystemMathPI_PI(t *testing.T) {
	if runtime.GOOS == "windows" {
		// <StandardLibrary_GetStaticField>
		call := javonet.InMemory().Clr().GetType("System.Math").GetStaticField("PI").Execute()
		result := call.GetValue().(float64)
		// </StandardLibrary_GetStaticField>
		expectedResponse := math.Pi
		if result != expectedResponse {
			t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
		}
	} else {
		t.Skip("CLR not implemented on linux")
	}
}

func Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022(t *testing.T) {
	if runtime.GOOS == "windows" {
		// <StandardLibrary_InvokeInstanceMethod>
		instance := javonet.InMemory().Clr().GetType("System.DateTime").CreateInstance(2022, 9, 1).Execute()
		call := instance.InvokeInstanceMethod("ToShortDateString").Execute()
		result := call.GetValue().(string)
		// </StandardLibrary_InvokeInstanceMethod>
		expectedResponse := "2022"
		if !strings.Contains(result, expectedResponse) {
			t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
		}
	} else {
		t.Skip("CLR not implemented on linux")
	}
}

func Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022(t *testing.T) {
	if runtime.GOOS == "windows" {
		// <StandardLibrary_InvokeInstanceMethod>
		instance := javonet.InMemory().Clr().GetType("System.DateTime").CreateInstance(2022, 9, 1).Execute()
		call := instance.GetInstanceField("Year").Execute()
		result := call.GetValue().(int32)
		// </StandardLibrary_InvokeInstanceMethod>
		expectedResponse := int32(2022)
		if result != expectedResponse {
			t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
		}
	} else {
		t.Skip("CLR not implemented on linux")
	}
}

func Test_Clr_TestResources_LoadLibrary_clrLibraryPath_NoExeption(t *testing.T) {
	if runtime.GOOS == "windows" {
		// <TestResources_LoadLibrary>
		javonet.InMemory().Clr().LoadLibrary(libraryPath)
		// </TestResources_LoadLibrary>
	} else {
		t.Skip("CLR not implemented on linux")
	}
}

func Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	if runtime.GOOS == "windows" {
		// <TestResources_InvokeStaticMethod>
		javonet.InMemory().Clr().LoadLibrary(libraryPath)
		call := javonet.InMemory().Clr().GetType(className).InvokeStaticMethod("MultiplyByTwo", 25).Execute()
		result := call.GetValue().(int32)
		// </TestResources_InvokeStaticMethod>
		expectedResponse := int32(50)
		if result != expectedResponse {
			t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
		}
	} else {
		t.Skip("CLR not implemented on linux")
	}
}

func Test_Clr_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	if runtime.GOOS == "windows" {
		// <TestResources_GetStaticField>
		javonet.InMemory().Clr().LoadLibrary(libraryPath)
		call := javonet.InMemory().Clr().GetType(className).GetStaticField("StaticValue").Execute()
		result := call.GetValue().(int32)
		// </TestResources_GetStaticField>
		expectedResponse := int32(3)
		if result != expectedResponse {
			t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
		}
	} else {
		t.Skip("CLR not implemented on linux")
	}
}

func Test_Clr_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	if runtime.GOOS == "windows" {
		// <TestResources_SetStaticField>
		javonet.InMemory().Clr().LoadLibrary(libraryPath)
		javonet.InMemory().Clr().GetType(className).SetStaticField("StaticValue", 75).Execute()
		// </TestResources_SetStaticField>
		call := javonet.InMemory().Clr().GetType(className).GetStaticField("StaticValue").Execute()
		result := call.GetValue().(int32)
		expectedResponse := int32(75)
		if result != expectedResponse {
			t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
		}
		javonet.InMemory().Clr().GetType(className).SetStaticField("StaticValue", 3).Execute()
	} else {
		t.Skip("CLR not implemented on linux")
	}
}

func Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	if runtime.GOOS == "windows" {
		// <TestResources_GetStaticField>
		javonet.InMemory().Clr().LoadLibrary(libraryPath)
		instance := javonet.InMemory().Clr().GetType(className).CreateInstance(4, 5).Execute()
		call := instance.InvokeInstanceMethod("MultiplyTwoNumbers", 5, 4)
		result := call.GetValue().(int64)
		// </TestResources_GetStaticField>
		expectedResponse := int64(20)
		if result != expectedResponse {
			t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
		}
	} else {
		t.Skip("CLR not implemented on linux")
	}
}

func Test_Clr_TestResources_GetInstanceField_PublicValue_1(t *testing.T) {
	if runtime.GOOS == "windows" {
		// <TestResources_GetStaticField>
		javonet.InMemory().Clr().LoadLibrary(libraryPath)
		instance := javonet.InMemory().Clr().GetType(className).CreateInstance(4, 5).Execute()
		call := instance.GetInstanceField("PublicValue")
		result := call.GetValue().(int32)
		// </TestResources_GetStaticField>
		expectedResponse := int32(1)
		if result != expectedResponse {
			t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
		}
	} else {
		t.Skip("CLR not implemented on linux")
	}
}
