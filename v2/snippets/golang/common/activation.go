package activationtests

import (
	"fmt"
	"testing"

	"javonet.com/integrationTests/integrationtests/activationcredentials"
	Javonet "javonet.com/javonet"
)

func Test_Activation_CorrectCredentials_Returns0(t *testing.T) {
	// <Javonet_activate>
	result := Javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
	// </Javonet_activate>
	expectedResponse := 0
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}

func Test_Activation_LicenceFile_Returns0(t *testing.T) {
	// <Javonet_activate_without_credentials>
	result := Javonet.ActivateWithCredentials("","")
	// </Javonet_activate_without_credentials>
	expectedResponse := 0
	if result != expectedResponse {
		t.Fatal(t.Name() + " failed.\tResponse: " + fmt.Sprintf("%v", result) + ".\tExpected response: " + fmt.Sprintf("%v", expectedResponse))
	}
}
