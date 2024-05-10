package jarlibrary

import (
	"fmt"
	"math"
	"os"
	"reflect"
	"testing"

	"javonet.com/integrationTests/utils/activationcredentials"
	Javonet "javonet.com/javonet"
)

var resourcesDirectory string

func init() {
	cwd, _ := os.Getwd()
	resourcesDirectory = cwd + "/../../../../testResources/jar-library"
	Javonet.ActivateWithCredentials(activationcredentials.YourLicenseKey)
}

func Test_JarLibrary_TestResources_LoadLibrary_LibraryPath_NoException(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_JarLibrary_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// get type's static field
	response, _ := calledRuntimeType.GetStaticField("staticValue").Execute()

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

func Test_JarLibrary_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// set static field's value
	calledRuntimeType.SetStaticField("staticValue", 75).Execute()

	// get type's static field
	response, _ := calledRuntimeType.GetStaticField("staticValue").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetStaticField>
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
	calledRuntimeType.SetStaticField("staticValue", 3).Execute()
}

func Test_JarLibrary_TestResources_GetInstanceField_PublicValue_18(t *testing.T) {
	// <TestResources_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance(18, 18).Execute()

	// get instance's field
	response, _ := instance.GetInstanceField("publicValue").Execute()

	// get value from response
	result := response.GetValue().(int32)
	// </TestResources_GetInstanceField>
	expectedResponse := int32(18)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_JarLibrary_TestResources_SetInstanceField_PublicValue_44(t *testing.T) {
	// <TestResources_SetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance(18, 19).Execute()

	// set instance's field
	instance.SetInstanceField("publicValue", 44).Execute()

	// get instance's field
	response, _ := instance.GetInstanceField("publicValue").Execute()

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

func Test_JarLibrary_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// invoke type's static method
	response, _ := calledRuntimeType.InvokeStaticMethod("multiplyByTwo", 25).Execute()

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

func Test_JarLibrary_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	response, _ := instance.InvokeInstanceMethod("multiplyTwoNumbers", 5, 4).Execute()

	// get value from response
	result := response.GetValue().(int32)
	// </TestResources_InvokeInstanceMethod>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_JarLibrary_TestResources_1DArray_GetIndex_2_StringThree(t *testing.T) {
	// <TestResources_1DArray_GetIndex>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("get1DArray").Execute()

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

func Test_JarLibrary_TestResources_1DArray_GetSize_5(t *testing.T) {
	// <TestResources_1DArray_GetSize>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("get1DArray").Execute()

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

func Test_JarLibrary_TestResources_1DArray_SetIndex_StringSeven(t *testing.T) {
	// <TestResources_1DArray_SetIndex>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	array, _ := instance.InvokeInstanceMethod("get1DArray").Execute()

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

func Test_JarLibrary_TestResources_1DArray_RetrieveArray(t *testing.T) {
	// <TestResources_1DArray_RetrieveArray>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	arrayReference, _ := instance.InvokeInstanceMethod("get1DArray").Execute()

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

func Test_JarLibrary_TestResources_GenericStaticMethod(t *testing.T) {
	// <TestResources_GenericStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// invoke type's generic static method
	response, _ := calledRuntimeType.
		InvokeGenericStaticMethod("genericSampleStaticMethod", 7, 5).
		Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_GenericStaticMethod>
	expectedResponse := "7 and 5"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_JarLibrary_TestResources_GenericMethod(t *testing.T) {
	// <TestResources_GenericMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// invoke type's generic static method
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke type's generic method
	response, _ := instance.
		InvokeGenericMethod("genericSampleMethod", 7, 5).
		Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_GenericMethod>
	expectedResponse := "7 or 5"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_JarLibrary_TestResources_GenericMethodWithTwoTypes(t *testing.T) {
	// <TestResources_GenericMethodWithTwoTypes>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	// invoke type's generic static method
	calledRuntimeType, _ := calledRuntime.GetType(className).Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke type's generic method
	response, _ := instance.
		InvokeGenericMethod("genericSampleMethodWithTwoTypes", 7).
		Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </TestResources_GenericMethodWithTwoTypes>
	expectedResponse := "genericSampleMethodWithTwoTypes invoked"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_JarLibrary_TestResources_EnumNameAndValue(t *testing.T) {
	// <TestResources_EnumNameAndValue>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"

	// load custom library
	calledRuntime.LoadLibrary(libraryPath)

	//get enum
	enumType := calledRuntime.GetType("TestClass$Fruit")

	//create enum items
	fruit1 := calledRuntime.GetEnumItem(enumType, "Mango")
	fruit2 := calledRuntime.GetEnumItem(enumType, "Orange")

	//get items' names and values
	response1, _ := fruit1.GetEnumName().Execute()
	fruit1Name := response1.GetValue().(string)
	response2, _ := fruit2.GetEnumName().Execute()
	fruit2Name := response2.GetValue().(string)
	response3, _ := fruit1.GetEnumValue().Execute()
	fruit1Value := response3.GetValue().(int32)
	response4, _ := fruit2.GetEnumValue().Execute()
	fruit2Value := response4.GetValue().(int32)

	// write result to console
	result := fmt.Sprintf("%v: %d, %v: %d", fruit1Name, fruit1Value, fruit2Name, fruit2Value)
	fmt.Println(result)
	// </TestResources_EnumNameAndValue>
	expectedResponse := "Mango: 3, Orange: 2"
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_JarLibrary_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType("java.lang.Math").Execute()

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

func Test_JarLibrary_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9(t *testing.T) {
	// <StandardLibrary_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType("java.util.Random").Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance().Execute()

	// invoke instance's method
	response, _ := instance.InvokeInstanceMethod("nextInt", 10).Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_InvokeInstanceMethod>
	if result < 0 || result > 9 {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result))
	}
}

func Test_JarLibrary_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType("java.lang.Math").Execute()

	// invoke type's static method
	response, _ := calledRuntimeType.InvokeStaticMethod("abs", -50).Execute()

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

func Test_JarLibrary_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name(t *testing.T) {
	// <StandardLibrary_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-license-key")

	// create called runtime context
	calledRuntime, _ := Javonet.InMemory().Jvm()

	// get type from the runtime
	calledRuntimeType, _ := calledRuntime.GetType("java.sql.DriverPropertyInfo").Execute()

	// create type's instance
	instance, _ := calledRuntimeType.CreateInstance("sample value", "sample value 2").Execute()

	// get instance's field
	response, _ := instance.GetInstanceField("name").Execute()

	// get value from response
	result := response.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_GetInstanceField>
	if result != "sample value" {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result))
	}
}
