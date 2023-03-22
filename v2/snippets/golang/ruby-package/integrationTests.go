package gotorubyintegrationtests

import (
	"fmt"
	"math"
	"os"
	"testing"

	"javonet.com/integrationTests/integrationtests/activationcredentials"
	Javonet "javonet.com/javonet"
)

var resourcesDirectory string

func init() {
	cwd, _ := os.Getwd()
	resourcesDirectory = cwd + "/../../../../testResources/ruby-package"
	Javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Ruby_StandardLibrary_InvokeStaticMethod_Math_Sqrt_2500_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key");

	// create RUBY runtime context
	rubyRuntime := Javonet.InMemory().Ruby();

	// get type from the runtime
	rubyType := rubyRuntime.GetType("Math").Execute();

	// invoke type's static method 
	response := rubyType.InvokeStaticMethod("sqrt", 2500).Execute();

	// get value from response
	result := response.GetValue().(float32)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_InvokeStaticMethod>
	expectedResponse := float32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Ruby_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key");

	// create RUBY runtime context
	rubyRuntime := Javonet.InMemory().Ruby();

	// get type from the runtime
	rubyType := rubyRuntime.GetType("Math").Execute();

	// get type's static field 
	response := rubyType.GetStaticField("PI").Execute()

	// get value from response
	result := response.GetValue().(float32)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_GetStaticField>
	expectedResponse := float32(math.Pi)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Ruby_TestResources_LoadLibrary_libraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create RUBY runtime context
	rubyRuntime := Javonet.InMemory().Ruby();

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"

	// load custom library
	rubyRuntime.LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Ruby_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create RUBY runtime context
	rubyRuntime := Javonet.InMemory().Ruby();

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	rubyRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	rubyType := rubyRuntime.GetType(className).Execute()

	// invoke type's static method
	response := rubyType.InvokeStaticMethod("multiply_by_two", 25).Execute()

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

func Test_Ruby_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create RUBY runtime context
	rubyRuntime := Javonet.InMemory().Ruby();

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	rubyRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	rubyType := rubyRuntime.GetType(className).Execute()

	// get type's static field
	response := rubyType.GetStaticField("static_value").Execute()

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

func Test_Ruby_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create RUBY runtime context
	rubyRuntime := Javonet.InMemory().Ruby();

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	rubyRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	rubyType := rubyRuntime.GetType(className).Execute()

	// set type's static field
	rubyType.SetStaticField("static_value", 75).Execute()

	// get type's static field
	response := rubyType.GetStaticField("static_value").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetStaticField>
	rubyType.SetStaticField("static_value", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Ruby_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create RUBY runtime context
	rubyRuntime := Javonet.InMemory().Ruby();

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	rubyRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	rubyType := rubyRuntime.GetType(className).Execute()

	// create type's instance
	instance := rubyType.CreateInstance(1, 2).Execute()

	// invoke instance's method
	response := instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute()

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

func Test_Ruby_TestResources_GetInstanceField_PublicValue_18(t *testing.T) {
	// <TestResources_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create RUBY runtime context
	rubyRuntime := Javonet.InMemory().Ruby();

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	rubyRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	rubyType := rubyRuntime.GetType(className).Execute()
	
	// create type's instance
	instance := rubyType.CreateInstance(18, 19).Execute()

	// get instance's field
	response := instance.GetInstanceField("public_value").Execute()

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
