// <WholeSnippet>
package main

import "fmt"
// <Import>
import Javonet "javonet.com/javonet"
// </Import>

func main() {
	// <Activation>
	Javonet.ActivateWithCredentials("your-license-key");
	// </Activation>

	// <RuntimeContextCreation>
	pythonRuntime := Javonet.InMemory().Python();
	// </RuntimeContextCreation>

	// <GetType>
	pythonType := pythonRuntime.GetType("math").Execute();
	// </GetType>

	// <GetStaticField>
	response := pythonType.GetStaticField("pi").Execute()
	// </GetStaticField>

	// <GetValue>
	result := response.GetValue().(float64)
	fmt.Println(result)
	// </GetValue>	
}
// </WholeSnippet>