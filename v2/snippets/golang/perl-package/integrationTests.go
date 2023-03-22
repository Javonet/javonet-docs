//go:build !darwin
// +build !darwin

package gotoperlintegrationtests

import (
	"fmt"
	"os"
	"testing"

	"javonet.com/integrationTests/integrationtests/activationcredentials"
	Javonet "javonet.com/javonet"
)

var resourcesDirectory string

func init() {
	cwd, _ := os.Getwd()
	resourcesDirectory = cwd + "/../../../../testResources/perl-package"
	Javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Perl_TestResources_LoadLibrary_LibraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PERL runtime context
	perlRuntime := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory
	fileName := "TestClass.pm"

	// load custom library
	perlRuntime.LoadLibrary(libraryPath, fileName)
	// </TestResources_LoadLibrary>
}

func Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PERL runtime context
	perlRuntime := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory
	fileName := "TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	perlRuntime.LoadLibrary(libraryPath, fileName)

	// get type from the runtime
	perlType := perlRuntime.GetType(className).Execute()

	// invoke type's static method
	response := perlType.InvokeStaticMethod("multiply_by_two", 25).Execute()

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

func Test_Perl_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PERL runtime context
	perlRuntime := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory
	fileName := "TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	perlRuntime.LoadLibrary(libraryPath, fileName)

	// get type from the runtime
	perlType := perlRuntime.GetType(className).Execute()

	// get type's static field
	response := perlType.GetStaticField("static_value").Execute()

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

func Test_Perl_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PERL runtime context
	perlRuntime := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory
	fileName := "TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	perlRuntime.LoadLibrary(libraryPath, fileName)

	// get type from the runtime
	perlType := perlRuntime.GetType(className).Execute()

	// set static field's value
	perlType.SetStaticField("static_value", 75).Execute()	

	// get type's static field
	response := perlType.GetStaticField("static_value").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetStaticField>
	perlType.SetStaticField("static_value", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PERL runtime context
	perlRuntime := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory
	fileName := "TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	perlRuntime.LoadLibrary(libraryPath, fileName)

	// get type from the runtime
	perlType := perlRuntime.GetType(className).Execute()

	// create type's instance
	instance := perlType.CreateInstance(1, 2).Execute()

	// invoke instance's method
	response := instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute()

	// get value from response
	result := response.GetValue().(int32)
	// </TestResources_InvokeInstanceMethod>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Perl_TestResources_GetInstanceField_PublicValue_1(t *testing.T) {
	// <TestResources_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PERL runtime context
	perlRuntime := Javonet.InMemory().Perl()

	// set up variables
	libraryPath := resourcesDirectory
	fileName := "TestClass.pm"
	className := "TestClass::TestClass"

	// load custom library
	perlRuntime.LoadLibrary(libraryPath, fileName)

	// get type from the runtime
	perlType := perlRuntime.GetType(className).Execute()

	// create type's instance
	instance := perlType.CreateInstance(18, 19).Execute()

	// get instance's field
	response := instance.GetInstanceField("public_value").Execute()

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
