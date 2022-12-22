using Xunit;
using Xunit.Abstractions;

namespace Javonet.Netcore.Sdk.Tests
{
	public class NetcoreActivationTests
	{
		private readonly ITestOutputHelper output;
		public NetcoreActivationTests(ITestOutputHelper output)
		{
			this.output = output;
		}

		[Trait("Test", "Integration")]
		public void Test_Activation_CorrectCredentials_Returns0()
		{
			// <Javonet_activate>
			var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
			// </Javonet_activate>
			Assert.Equal(0, result);
		}
	}
}