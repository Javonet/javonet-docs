package gotoperlintegrationtests

import (
	"fmt"
	"os"
	"testing"

	"javonet.com/integrationTests/integrationtests/activationcredentials"
	"javonet.com/javonet"
)

var javonetSrcRoot string
var libraryPath string
var fileName string
var className string

func init() {
	cwd, _ := os.Getwd()
	javonetSrcRoot = cwd + "/../../../.."
	// <TestResources_TestClassValues>
	libraryPath = javonetSrcRoot + "/testResources/perl_package"
	fileName = "PerlTestClass.pm"
	className = "PerlTestClass::PerlTestClass"

	// </TestResources_TestClassValues>
	javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Perl_TestResources_LoadLibrary_LibraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName)
	// </TestResources_LoadLibrary>
}

func Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName)
	call := javonet.InMemory().Perl().GetType(className).InvokeStaticMethod("multiply_by_two", 25).Execute()
	result := call.GetValue().(int32)
	// </TestResources_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Perl_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName)
	call := javonet.InMemory().Perl().GetType(className).GetStaticField("static_value").Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(3)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Perl_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName)
	javonet.InMemory().Perl().GetType(className).SetStaticField("static_value", 75).Execute()
	// </TestResources_SetStaticField>
	call := javonet.InMemory().Perl().GetType(className).GetStaticField("static_value").Execute()
	result := call.GetValue().(int32)
	javonet.InMemory().Perl().GetType(className).SetStaticField("static_value", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName)
	instance := javonet.InMemory().Perl().GetType(className).CreateInstance(4, 5).Execute()
	call := instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Perl_TestResources_GetInstanceField_PublicValue_1(t *testing.T) {
	// <TestResources_GetStaticField>
	javonet.InMemory().Perl().LoadLibrary(libraryPath, fileName)
	instance := javonet.InMemory().Perl().GetType(className).CreateInstance(1, 2).Execute()
	call := instance.GetInstanceField("public_value").Execute()
	result := call.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(1)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
