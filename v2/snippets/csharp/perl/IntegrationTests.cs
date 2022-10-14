using Xunit;
using Xunit.Abstractions;

namespace Javonet.Netcore.Sdk.Tests
{
	public class NetcoreToPerlIntegrationTests
	{
		private readonly ITestOutputHelper output;
		//this constructor is called only once, before first test
		public NetcoreToPerlIntegrationTests(ITestOutputHelper output)
		{
			this.output = output;
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey);
			Assert.Equal(0, result);
		}
	}
}