package gotoperlintegrationtests

import (
	"os"

	"javonet.com/integrationTests/integrationtests/activationcredentials"
	"javonet.com/javonet"
)

var _javonetSrcRoot string

func init() {
	cwd, _ := os.Getwd()
	_javonetSrcRoot = cwd + "/../../.."
	// <TestResources_TestClassValues>
	// </TestResources_TestClassValues>
	javonet.ActivateWithCredentials(activationcredentials.YourEmail, activationcredentials.YourLicenceKey)
}
