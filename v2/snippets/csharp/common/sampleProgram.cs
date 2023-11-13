// <WholeSnippet>
namespace SampleProgram;
// <Import>
using Javonet.Netcore.Sdk; //or using Javonet.Clr.Sdk for .NET Framework apps
// </Import>
class SampleProgram
{
	static void Main(string[] args)
	{
		// <Activation>
		Javonet.Activate("your-license-key");
		// </Activation>

		// <RuntimeContextCreation>
		var pythonRuntime = Javonet.InMemory().Python();
		// </RuntimeContextCreation>

		// <GetType>
		var pythonType = pythonRuntime.GetType("math").Execute();
		// </GetType>

		// <GetStaticField>
		var response = pythonType.GetStaticField("pi").Execute();
		// </GetStaticField>

		// <GetValue>
		var result = (float)response.GetValue();
		System.Console.WriteLine(result);
		// </GetValue>	
	}
}
// </WholeSnippet>