package common

import (
	"fmt"
	"testing"

	"javonet.com/integrationTests/utils/activationcredentials"
	Javonet "javonet.com/javonet"
)

func Test_Activation_CorrectCredentials_Returns0(t *testing.T) {
	// <Javonet_activate>
	result, err := Javonet.ActivateWithCredentials(activationcredentials.YourLicenseKey)
	if err != nil {
		fmt.Println("Error: " + err.Error())
	}

	// </Javonet_activate>
	expectedResponse := 0
	if err != nil {
		t.Fatal("Error: " + err.Error())
	}
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Activation_LicenseFile_Returns0(t *testing.T) {
	// <Javonet_activate_without_credentials>
	result, err := Javonet.ActivateWithCredentials("")
	if err != nil {
		fmt.Println("Error: " + err.Error())
	}
	// </Javonet_activate_without_credentials>
	expectedResponse := 0
	if err != nil {
		t.Fatal("Error: " + err.Error())
	}
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
