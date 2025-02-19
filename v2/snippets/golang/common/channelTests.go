package common

import (
	"fmt"
	"os"
	"testing"

	"javonet.com/integrationTests/utils/activationcredentials"
	Javonet "javonet.com/javonet"
	"javonet.com/javonet/utils/connectiondata"
)

var resourcesDirectory string

func init() {
	cwd, _ := os.Getwd()
	resourcesDirectory = cwd + "/../../../../testResources/configuration-file"
}

func Test_Channel_InMemory_Success(t *testing.T) {
	// <InMemoryChannel>
	// use Activate only once in your app
	_, err := Javonet.Activate(activationcredentials.YourLicenseKey)
	if err != nil {
		fmt.Println("Error: " + err.Error())
	}

	communicationChannel := Javonet.InMemory()
	// use communicationChannel to create runtimes to interact with
	// </InMemoryChannel>
	if err != nil {
		t.Fatal("Error: " + err.Error())
	}
	if communicationChannel == nil {
		t.Fatal("communicationChannel is nil")
	}
}

func Test_Channel_Tcp_Success(t *testing.T) {
	// <TcpChannel>
	// use Activate only once in your app
	_, err := Javonet.Activate(activationcredentials.YourLicenseKey)
	if err != nil {
		fmt.Println("Error: " + err.Error())
	}

	connectionData := connectiondata.NewTcpConnectionData("127.0.0.1", 8080)
	communicationChannel := Javonet.Tcp(*connectionData)
	// use communicationChannel to create runtimes to interact with
	// </TcpChannel>
	if err != nil {
		t.Fatal("Error: " + err.Error())
	}
	if communicationChannel == nil {
		t.Fatal("communicationChannel is nil")
	}
}

func Test_Channel_WithConfigurationFile_Success(t *testing.T) {
	// <WithConfigurationFile>
	// use Activate only once in your app
	_, err := Javonet.Activate(activationcredentials.YourLicenseKey)
	if err != nil {
		fmt.Println("Error: " + err.Error())
	}

	// set up variables
	configFilePath := resourcesDirectory + "/channel-tests-config.json"
	communicationChannel := Javonet.WithConfig(configFilePath)
	// use communicationChannel to create runtimes to interact with
	// </WithConfigurationFile>
	if err != nil {
		t.Fatal("Error: " + err.Error())
	}
	if communicationChannel == nil {
		t.Fatal("communicationChannel is nil")
	}
}
