package gotojvmintegrationtests

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
	resourcesDirectory = cwd + "/../../../../testResources/jar-library"
	Javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create JVM runtime context
	jvmRuntime := Javonet.InMemory().Jvm()

	// get type from the runtime
	jvmType := jvmRuntime.GetType("java.lang.Math").Execute()

	// invoke type's static method 
	response := jvmType.InvokeStaticMethod("abs", -50).Execute()

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

func Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create JVM runtime context
	jvmRuntime := Javonet.InMemory().Jvm()

	// get type from the runtime
	jvmType := jvmRuntime.GetType("java.lang.Math").Execute()

	// get type's static field 
	response := jvmType.GetStaticField("PI").Execute()

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

func Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9(t *testing.T) {
	// <StandardLibrary_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create JVM runtime context
	jvmRuntime := Javonet.InMemory().Jvm()

	// get type from the runtime
	jvmType := jvmRuntime.GetType("java.util.Random").Execute()

	// create type's instance
	instance := jvmType.CreateInstance().Execute()
	// invoke instance's method	
	call := instance.InvokeInstanceMethod("nextInt", 10).Execute()

	// get value from response
	result := call.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_InvokeInstanceMethod>
	if result < 0 || result > 9 {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result))
	}
}


func Test_Jvm_StandardLibrary_GetInstanceField_javaSqlDriverPropertyDriver_Name(t *testing.T) {
	// <StandardLibrary_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create JVM runtime context
	jvmRuntime := Javonet.InMemory().Jvm()

	// get type from the runtime
	jvmType := jvmRuntime.GetType("java.sql.DriverPropertyInfo").Execute()

	// create type's instance
	instance := jvmType.CreateInstance("sample value", "sample value 2").Execute()

	// get instance's field 
	call := instance.GetInstanceField("name").Execute()

	// get value from response
	result := call.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_InvokeInstanceMethod>
	if result != "sample value" {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result))
	}
}


func Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create JVM runtime context
	jvmRuntime := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"

	// load custom library
	jvmRuntime.LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create JVM runtime context
	jvmRuntime := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	jvmRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	jvmType := jvmRuntime.GetType(className).Execute()

	// invoke type's static method
	response := jvmType.InvokeStaticMethod("multiplyByTwo", 25).Execute()

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

func Test_Jvm_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create JVM runtime context
	jvmRuntime := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	jvmRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	jvmType := jvmRuntime.GetType(className).Execute()

	// get type's static field
	response := jvmType.GetStaticField("staticValue").Execute()

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

func Test_Jvm_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create JVM runtime context
	jvmRuntime := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	jvmRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	jvmType := jvmRuntime.GetType(className).Execute()

	// set static field's value
	jvmType.SetStaticField("staticValue", 75).Execute()	

	// get type's static field
	response := jvmType.GetStaticField("staticValue").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetStaticField>
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
	jvmType.SetStaticField("staticValue", 3).Execute()
}

func Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create JVM runtime context
	jvmRuntime := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	jvmRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	jvmType := jvmRuntime.GetType(className).Execute()

	// create type's instance
	instance := jvmType.CreateInstance(4, 5).Execute()

	// invoke instance's method
	response := instance.InvokeInstanceMethod("multiplyTwoNumbers", 5, 4).Execute()

	// get value from response
	result := response.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(20)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Jvm_TestResources_GetInstanceField_PublicValue_18(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create JVM runtime context
	jvmRuntime := Javonet.InMemory().Jvm()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.jar"
	className := "TestClass"

	// load custom library
	jvmRuntime.LoadLibrary(libraryPath)

	// get type from the runtime
	jvmType := jvmRuntime.GetType(className).Execute()

	// create type's instance
	instance := jvmType.CreateInstance(18, 18).Execute()

	// get instance's field
	response := instance.GetInstanceField("publicValue").Execute()

	// get value from response
	result := response.GetValue().(int32)
	// </TestResources_GetStaticField>
	expectedResponse := int32(18)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
