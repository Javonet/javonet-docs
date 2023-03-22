package gotonodejsintegrationtests

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
	resourcesDirectory = cwd + "/../../../../testResources/nodejs-package"
	Javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key");

	// create NODEJS runtime context
	nodejsRuntime := Javonet.InMemory().Nodejs();

	// get type from the runtime
	nodejsType := nodejsRuntime.GetType("Math").Execute();

	// invoke type's static method 
	response := nodejsType.InvokeStaticMethod("abs", -50).Execute();

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

func Test_Nodejs_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key");

	// create NODEJS runtime context
	nodejsRuntime := Javonet.InMemory().Nodejs();

	// get type from the runtime
	nodejsType := nodejsRuntime.GetType("Math").Execute();

	// get type's static field 
	response := nodejsType.GetStaticField("PI").Execute()

	// get value from response
	result := response.GetValue().(float64)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_GetStaticField>
	expectedResponse := math.Pi
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create NODEJS runtime context
	nodejsRuntime := Javonet.InMemory().Nodejs()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.js"

	// load custom library
	nodejsRuntime.LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Nodejs_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create NODEJS runtime context
	nodejsRuntime := Javonet.InMemory().Nodejs()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.js"
	className := "TestClass"
	
	// load custom library
	nodejsRuntime.LoadLibrary(libraryPath)
		
	// get type from the runtime
	nodejsType := nodejsRuntime.GetType(className).Execute()

	// invoke type's static method
	response := nodejsType.InvokeStaticMethod("multiplyByTwo", 25).Execute()

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

func Test_Nodejs_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create NODEJS runtime context
	nodejsRuntime := Javonet.InMemory().Nodejs()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.js"
	className := "TestClass"
	
	// load custom library
	nodejsRuntime.LoadLibrary(libraryPath)
		
	// get type from the runtime
	nodejsType := nodejsRuntime.GetType(className).Execute()

	// get type's static field
	response := nodejsType.GetStaticField("staticValue").Execute()

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

func Test_Nodejs_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	nodejsRuntime := Javonet.InMemory().Nodejs()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.js"
	className := "TestClass"

	// load custom library
	nodejsRuntime.LoadLibrary(libraryPath)
		
	// get type from the runtime
	nodejsType := nodejsRuntime.GetType(className).Execute()

	// set type's static field
	nodejsType.SetStaticField("staticValue", 75).Execute()

	// get type's static field
	response := nodejsType.GetStaticField("staticValue").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetStaticField>
	nodejsType.SetStaticField("staticValue", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}

}

func Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	nodejsRuntime := Javonet.InMemory().Nodejs()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.js"
	className := "TestClass"

	// load custom library
	nodejsRuntime.LoadLibrary(libraryPath)
		
	// get type from the runtime
	nodejsType := nodejsRuntime.GetType(className).Execute()

	// create type's instance
	instance := nodejsType.CreateInstance(1, 2).Execute()

	// invoke instance's method
	response := instance.InvokeInstanceMethod("multiplyTwoNumbers", 5, 4).Execute()

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

func Test_Nodejs_TestResources_GetInstanceField_PublicValue_18(t *testing.T) {
	// <TestResources_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	nodejsRuntime := Javonet.InMemory().Nodejs()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.js"
	className := "TestClass"

	// load custom library
	nodejsRuntime.LoadLibrary(libraryPath)
		
	// get type from the runtime
	nodejsType := nodejsRuntime.GetType(className).Execute()

	// create type's instance
	instance := nodejsType.CreateInstance(18, 19).Execute()

	// get instance's field
	response := instance.GetInstanceField("publicValue").Execute()

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
