package common

import (
	"fmt"
	"os"
	"path/filepath"
	"testing"

	"javonet.com/integrationTests/utils/activationcredentials"
	Javonet "javonet.com/javonet"
)

func Test_SetWorkingDirectory(t *testing.T) {
	// <SetWorkingDirectory>
	// define path to be used as Javonet working directory
	userHomeDirectory, err := os.UserHomeDir()
	if err != nil {
		fmt.Println("Error getting user home directory: " + err.Error())
	}
	javonetWorkingDirectory := filepath.Join(userHomeDirectory, "myNewDirectory")

	// set Javonet working directory
	Javonet.SetJavonetWorkingDirectory(javonetWorkingDirectory)

	// use Activate only once in your app
	Javonet.Activate(activationcredentials.YourLicenseKey)

	// create other runtime context
	rtmCtx, err := Javonet.InMemory().Netcore()
	if err != nil {
		fmt.Println("Error creating runtime context: " + err.Error())
	}
	// </SetWorkingDirectory>

	// start interact with other runtime...
	response, err := rtmCtx.GetType("System.Math").InvokeStaticMethod("Abs", -13).Execute()
	if err != nil {
		t.Fatal("Error invoking method: " + err.Error())
	}
	result := response.GetValue().(int32)

	fmt.Println(result)
	if result != 13 {
		t.Fatalf("Expected 13, got %v", result)
	}

	if _, err := os.Stat(filepath.Join(javonetWorkingDirectory, "javonet.lic")); os.IsNotExist(err) {
		t.Fatal("javonet.lic file does not exist")
	}
	if _, err := os.Stat(filepath.Join(javonetWorkingDirectory, "Binaries", "Native")); os.IsNotExist(err) {
		t.Fatal("Binaries/Native directory does not exist")
	}
	if _, err := os.Stat(filepath.Join(javonetWorkingDirectory, "Binaries", "Netcore")); os.IsNotExist(err) {
		t.Fatal("Binaries/Python directory does not exist")
	}
}
