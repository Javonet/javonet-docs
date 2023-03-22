//go:build !linux && !darwin
// +build !linux,!darwin

package gotoclrintegrationtests

import (
	"fmt"
	"math"
	"os"
	"strings"
	"testing"

	"javonet.com/integrationTests/integrationtests/activationcredentials"
	Javonet "javonet.com/javonet"
)

var resourcesDirectory string

func init() {
	cwd, _ := os.Getwd()
	resourcesDirectory = cwd + "/../../../../testResources/netframework-dll"
	Javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}

func Test_Clr_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50(t *testing.T) {
	// <StandardLibrary_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	clrRuntime := Javonet.InMemory().Clr()

	// get type from the runtime
	clrType := clrRuntime.GetType("System.Math").Execute()

	// invoke type's static method 
	response := clrType.InvokeStaticMethod("Abs", -50).Execute()

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

func Test_Clr_StandardLibrary_GetStaticField_MathPI_PI(t *testing.T) {
	// <StandardLibrary_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	clrRuntime := Javonet.InMemory().Clr()

	// get type from the runtime
	clrType := clrRuntime.GetType("System.Math").Execute()

	// get type's static field 
	response := clrType.GetStaticField("PI").Execute()

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

func Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022(t *testing.T) {
	// <StandardLibrary_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	clrRuntime := Javonet.InMemory().Clr()

	// get type from the runtime
	clrType := clrRuntime.GetType("System.DateTime").Execute()

	// create type's instance
	instance := clrType.CreateInstance(2022, 9, 1).Execute()

	// invoke instance's method	
	call := instance.InvokeInstanceMethod("ToShortDateString").Execute()

	// get value from response
	result := call.GetValue().(string)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_InvokeInstanceMethod>
	expectedResponse := "2022"
	if !strings.Contains(result, expectedResponse) {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022(t *testing.T) {
	// <StandardLibrary_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	clrRuntime := Javonet.InMemory().Clr()

	// get type from the runtime
	clrType := clrRuntime.GetType("System.DateTime").Execute()

	// create type's instance
	instance := clrType.CreateInstance(2022, 9, 1).Execute()

	// get instance's field
	call := instance.GetInstanceField("Year").Execute()

	// get value from response
	result := call.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </StandardLibrary_GetInstanceField>
	expectedResponse := int32(2022)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Clr_TestResources_LoadLibrary_LibraryPath_NoExeption(t *testing.T) {
	// <TestResources_LoadLibrary>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	clrRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"

	// load custom library
	clrRuntime.LoadLibrary(libraryPath)
	// </TestResources_LoadLibrary>
}

func Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50(t *testing.T) {
	// <TestResources_InvokeStaticMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	clrRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	clrRuntime.LoadLibrary(libraryPath)
	
	// get type from the runtime
	clrType := clrRuntime.GetType(className).Execute()

	// invoke type's static method
	response := clrType.InvokeStaticMethod("MultiplyByTwo", 25).Execute()

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

func Test_Clr_TestResources_GetStaticField_StaticValue_3(t *testing.T) {
	// <TestResources_GetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	clrRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	clrRuntime.LoadLibrary(libraryPath)
	
	// get type from the runtime
	clrType := clrRuntime.GetType(className).Execute()

	// get type's static field
	response := clrType.GetStaticField("StaticValue").Execute()

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

func Test_Clr_TestResources_SetStaticField_StaticValue75(t *testing.T) {
	// <TestResources_SetStaticField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	clrRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	clrRuntime.LoadLibrary(libraryPath)
	
	// get type from the runtime
	clrType := clrRuntime.GetType(className).Execute()

	// set static field's value
	clrType.SetStaticField("StaticValue", 75).Execute()	

	// get type's static field
	response := clrType.GetStaticField("StaticValue").Execute()

	// get value from response
	result := response.GetValue().(int32)

	// write result to console
	fmt.Println(result)
	// </TestResources_SetStaticField>
	clrType.SetStaticField("StaticValue", 3).Execute()
	expectedResponse := int32(75)
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20(t *testing.T) {
	// <TestResources_InvokeInstanceMethod>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	clrRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	clrRuntime.LoadLibrary(libraryPath)
	
	// get type from the runtime
	clrType := clrRuntime.GetType(className).Execute()

	// create type's instance
	instance := clrType.CreateInstance(4, 5).Execute()

	// invoke instance's method
	response := instance.InvokeInstanceMethod("MultiplyTwoNumbers", 5, 4).Execute()

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

func Test_Clr_TestResources_GetInstanceField_PublicValue_18(t *testing.T) {
	// <TestResources_GetInstanceField>
	// use Activate only once in your app
	Javonet.ActivateWithCredentials("your-email", "your-license-key")

	// create CLR runtime context
	clrRuntime := Javonet.InMemory().Clr()

	// set up variables
	libraryPath := resourcesDirectory + "/TestClass.dll"
	className := "TestClass.TestClass"

	// load custom library
	clrRuntime.LoadLibrary(libraryPath)
	
	// get type from the runtime
	clrType := clrRuntime.GetType(className).Execute()

	// create type's instance
	instance := clrType.CreateInstance(18, 19).Execute()

	// get instance's field
	response := instance.GetInstanceField("PublicValue").Execute()

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
