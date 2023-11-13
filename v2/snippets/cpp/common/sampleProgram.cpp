// <WholeSnippet>
// <Import>
#include "Javonet.h"
// </Import>
#include <iostream>

using namespace JavonetNS::Cpp::Sdk;

std::string resourcesDirectory = ".";

int main(int argc, char* argv[]) {
	// <Activation>
	Javonet::Activate("your-license-key");
	// </Activation>

	// <RuntimeContextCreation>
	auto pythonRuntime = Javonet::InMemory()->Python();
	// </RuntimeContextCreation>

	// <GetType>
	auto pythonType = pythonRuntime->GetType("math")->Execute();
	// </GetType>

	// <GetStaticField>
	auto response = pythonType->GetStaticField("pi")->Execute();
	// </GetStaticField>

	// <GetValue>
	auto result = std::any_cast<float>(response->GetValue());
	std::cout << result << std::endl;
	// </GetValue>	
}
// </WholeSnippet>
