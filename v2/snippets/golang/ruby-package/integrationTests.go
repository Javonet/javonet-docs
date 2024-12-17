package rubypackage

import (
	"fmt"
	"math"
	"os"
	"reflect"
	"strings"
	"testing"

	"javonet.com/integrationTests/utils/activationcredentials"
	Javonet "javonet.com/javonet"
)

var resourcesDirectory string

func init() {
	cwd, _ := os.Getwd()
	resourcesDirectory = cwd + "/../../../../testResources/ruby-package"
	Javonet.Activate(activationcredentials.YourLicenseKey)
}

func Test_RubyPackage_StandardLibrary_CreateRuntimeContext(t *testing.T) {
	// <StandardLibrary_CreateRuntimeContext>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// use calledRuntime to interact with code from other technology
	// </StandardLibrary_CreateRuntimeContext>

	if calledRuntime == nil {
		t.Fatal("calledRuntime is nil")
	}
}

func Test_RubyPackage_StandardLibrary_CreateInvocationContext(t *testing.T) {
	// <StandardLibrary_CreateInvocationContext>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// construct an invocation context - this invocationContext in non-materialized
	invocationContext := calledRuntime.GetType("Math").InvokeStaticMethod("sqrt", 2500)

	// execute invocation context - this will materialize the invocationContext
	response, err := invocationContext.Execute()
	if err != nil {
		fmt.Println("Error: " + err.Error())
	}
	// </StandardLibrary_CreateInvocationContext>
	if err != nil {
		t.Fatal("Error: " + err.Error())
	}
	if response == nil {
		t.Fatal("response is nil")
	}
}

func Test_RubyPackage_StandardLibrary_GetValue(t *testing.T) {
	// <StandardLibrary_GetValue>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// construct an invocation context - this invocationContext in non-materialized
	invocationContext := calledRuntime.GetType("Math").InvokeStaticMethod("sqrt", 2500)

	// execute invocation context - this will materialize the invocationContext
	response, err := invocationContext.Execute()
	if err != nil {
		fmt.Println("Error: " + err.Error())
	}

	// get value from response
	result, ok := response.GetValue().(float64)
	if !ok {
		fmt.Println("Error: cannot convert response value to int32")
	}

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_GetValue>
	expectedResult := float64(50)
	if err != nil || result != expectedResult {
		t.Fatalf("Test failed. Response: %v. Expected response: %v", result, expectedResult)
	}
}

func Test_RubyPackage_TestResources_LoadLibrary_libraryPath_NoException(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_RubyPackage_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// get type's static field
	response, _ := calledRuntimeType.GetStaticField("static_value").Execute()

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

func Test_RubyPackage_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// set type's static field
	calledRuntimeType.SetStaticField("static_value", 75).Execute()

	// get type's static field
	response, _ := calledRuntimeType.GetStaticField("static_value").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetStaticField>
	calledRuntimeType.SetStaticField("static_value", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_RubyPackage_TestResources_GetInstanceField_PublicValue_18(t *testing.T) {
	// <TestResources_GetInstanceField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance(18, 19).Execute()

	// get instance's field
	response, _ := instance.GetInstanceField("public_value").Execute()

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

func Test_RubyPackage_TestResources_SetInstanceField_PublicValue_44(t *testing.T) {
	// <TestResources_SetInstanceField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance(18, 19).Execute()

	// set instance's field
	instance.SetInstanceField("public_value", 44).Execute()

	// get instance's field
	response, _ := instance.GetInstanceField("public_value").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetInstanceField>
	expectedResponse := int32(44)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_RubyPackage_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// invoke type's static method
	response, _ := calledRuntimeType.InvokeStaticMethod("multiply_by_two", 25).Execute()

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

func Test_RubyPackage_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	response, _ := instance.InvokeInstanceMethod("multiply_two_numbers", 5, 4).Execute()

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

func Test_RubyPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException(t *testing.T) {
	// <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
	// use Activate only once in your app
	result, err := Javonet.Activate("your-license-key")
	if result != 0 {
		fmt.Println("Wrong activation result: " + err.Error())
	}
	if err != nil {
		fmt.Println("Activation exception: " + err.Error())
	}

	// create called runtime context
	calledRuntime, err := Javonet.InMemory().Ruby()
	if err != nil {
		fmt.Println("Creating runtime exception: " + err.Error())
	}

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	_, err = calledRuntime.LoadLibrary(libraryPath)
	if err != nil {
		fmt.Println("Loading library exception: " + err.Error())
	}

	// get type from the runtime
	calledRuntimeType, err := calledRuntime.GetType(className).Execute()
	if err != nil {
		fmt.Println("Get Type exception: " + err.Error())
	}

	// invoke type's static method which throws exception
	_, err = calledRuntimeType.InvokeStaticMethod("divide_by", 10, 0).Execute()
	fmt.Println(err)
	// </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
	if err == nil {
		t.Fatal("Exception was not thrown")
	}
	if !strings.Contains(err.Error(), "divide_by_third") {
		t.Fatal("Wrong exception message: " + err.Error())
	}
}

func Test_RubyPackage_TestResources_1DArray_GetIndex_2_StringThree(t *testing.T) {
	// <TestResources_1DArray_GetIndex>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("get_1d_array").Execute()

	// get index from array
	response, _ := array.GetIndex(2).Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_1DArray_GetIndex>
	expectedResponse := "three"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_RubyPackage_TestResources_1DArray_GetSize_5(t *testing.T) {
	// <TestResources_1DArray_GetSize>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("get_1d_array").Execute()

	// get array's size
	response, _ := array.GetSize().Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_1DArray_GetSize>
	expectedResponse := int32(5)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_RubyPackage_TestResources_1DArray_SetIndex_StringSeven(t *testing.T) {
	// <TestResources_1DArray_SetIndex>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("get_1d_array").Execute()

	// set array's index
	array.SetIndex(4, "seven").Execute()

	// get index from array
	response, _ := array.GetIndex(4).Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_1DArray_SetIndex>
	array.SetIndex(4, "five").Execute()
	expectedResponse := "seven"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_RubyPackage_TestResources_1DArray_RetrieveArray(t *testing.T) {
	// <TestResources_1DArray_RetrieveArray>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.rb"
	className := "TestClass::TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	arrayReference, _ := instance.InvokeInstanceMethod("get_1d_array").Execute()

	// get array from reference
	response, _ := arrayReference.RetrieveArray()

	// create new array to copy response
	result := make([]string, len(response))
	for i, v := range response {
		result[i] = v.(string)
	}

	// write result to console
	fmt.Println(result)
	// </TestResources_1DArray_RetrieveArray>
	expectedResponse := []string{"one", "two", "three", "four", "five"}
	if !reflect.DeepEqual(result, expectedResponse) {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_RubyPackage_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType("Math").Execute()

	// get type's static field
	response, _ := calledRuntimeType.GetStaticField("PI").Execute()

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

func Test_RubyPackage_StandardLibrary_InvokeStaticMethod_Math_Sqrt_2500_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.Activate("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Ruby()

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType("Math").Execute()

	// invoke type's static method
	response, _ := calledRuntimeType.InvokeStaticMethod("sqrt", 2500).Execute()

	// get value from response
	result := response.GetValue().(float64)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_InvokeStaticMethod>
	expectedResponse := float64(50)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
