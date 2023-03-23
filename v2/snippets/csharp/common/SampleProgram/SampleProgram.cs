namespace SampleProgram;
// <Import>
using Javonet.Netcore.Sdk;
// </Import>
class SampleProgram
{
	static void Main(string[] args)
	{
		// <Activation>
		Javonet.Activate("your-email", "your-license-key");
		// </Activation>



		var pythonRuntime = Javonet.InMemory().Python();
	}
}