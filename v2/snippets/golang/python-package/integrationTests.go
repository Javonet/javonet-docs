//go:build !darwin
// +build !darwin

package gotopythonintegrationtests

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
	resourcesDirectory = cwd + "/../../../../testResources/python-package"
	Javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key");

	// create PYTHON runtime context
	pythonRuntime := Javonet.InMemory().Python();

	// get type from the runtime
	pythonType := pythonRuntime.GetType("builtins").Execute();

	// invoke type's static method 
	response := pythonType.InvokeStaticMethod("abs", -50).Execute();

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_InvokeStaticMethod>
	expectedResponse := int32(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Python_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key");

	// create PYTHON runtime context
	pythonRuntime := Javonet.InMemory().Python();

	// get type from the runtime
	pythonType := pythonRuntime.GetType("math").Execute();

	// get type's static field 
	response := pythonType.GetStaticField("pi").Execute()

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

func Test_Python_TestResources_LoadLibrary_LibraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PYTHON runtime context
	pythonRuntime := Javonet.InMemory().Python()

	// set up variables
	libraryPath := resourcesDirectory

	// load custom library
	pythonRuntime.LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PYTHON runtime context
	pythonRuntime := Javonet.InMemory().Python()

	// set up variables
	libraryPath := resourcesDirectory
	className := "TestClass.TestClass"

	// load custom library
	pythonRuntime.LoadLibrary(libraryPath)
		
	// get type from the runtime
	pythonType := pythonRuntime.GetType(className).Execute()

	// invoke type's static method
	response := pythonType.InvokeStaticMethod("multiply_by_two", 25).Execute()

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

func Test_Python_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PYTHON runtime context
	pythonRuntime := Javonet.InMemory().Python()

	// set up variables
	libraryPath := resourcesDirectory
	className := "TestClass.TestClass"

	// load custom library
	pythonRuntime.LoadLibrary(libraryPath)
		
	// get type from the runtime
	pythonType := pythonRuntime.GetType(className).Execute()
	
	// get type's static field
	response := pythonType.GetStaticField("static_value").Execute()

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

func Test_Python_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PYTHON runtime context
	pythonRuntime := Javonet.InMemory().Python()

	// set up variables
	libraryPath := resourcesDirectory
	className := "TestClass.TestClass"

	// load custom library
	pythonRuntime.LoadLibrary(libraryPath)
		
	// get type from the runtime
	pythonType := pythonRuntime.GetType(className).Execute()

	// set type's static field
	pythonType.SetStaticField("static_value", 75).Execute()
	
	// get type's static field
	response := pythonType.GetStaticField("static_value").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetStaticField>
	pythonType.SetStaticField("static_value", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PYTHON runtime context
	pythonRuntime := Javonet.InMemory().Python()

	// set up variables
	libraryPath := resourcesDirectory
	className := "TestClass.TestClass"

	// load custom library
	pythonRuntime.LoadLibrary(libraryPath)
		
	// get type from the runtime
	pythonType := pythonRuntime.GetType(className).Execute()

	// create type's instance
	instance := pythonType.CreateInstance(1, 2).Execute()

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

func Test_Python_TestResources_GetInstanceField_PublicValue_18(t *testing.T) {
	// <TestResources_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create PYTHON runtime context
	pythonRuntime := Javonet.InMemory().Python()

	// set up variables
	libraryPath := resourcesDirectory
	className := "TestClass.TestClass"

	// load custom library
	pythonRuntime.LoadLibrary(libraryPath)
		
	// get type from the runtime
	pythonType := pythonRuntime.GetType(className).Execute()

	// create type's instance
	instance := pythonType.CreateInstance(18, 19).Execute()

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
