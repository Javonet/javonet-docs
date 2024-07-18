// <WholeSnippet>
package main

import (
	"fmt"
	// <Import>

	Javonet "javonet.com/javonet"
)

// </Import>

func main() {
	// <Activation>
	Javonet.ActivateWithCredentials("your-license-key")
	// </Activation>

	// <RuntimeContextCreation>
	pythonRuntime, _ := Javonet.InMemory().Python()
	// </RuntimeContextCreation>

	// <GetType>
	pythonType, _ := pythonRuntime.GetType("math").Execute()
	// </GetType>

	// <GetStaticField>
	response, _ := pythonType.GetStaticField("pi").Execute()
	// </GetStaticField>

	// <GetValue>
	result := response.GetValue().(float64)
	fmt.Println(result)
	// </GetValue>
}

// </WholeSnippet>
