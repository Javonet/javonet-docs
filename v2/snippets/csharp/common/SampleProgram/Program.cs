namespace SampleProgram;
using Javonet.Netcore.Sdk;
class Program
{
	static void Main(string[] args)
	{
		Javonet.Activate("your-email", "your-license-key");
		var pythonRuntime = Javonet.InMemory().Python();
	}
}