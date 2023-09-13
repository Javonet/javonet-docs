using Javonet.Netcore.Sdk.Tests.Utils;
using Xunit;
using Xunit.Abstractions;

namespace Javonet.Netcore.Sdk.Tests.common
{
    public class activation
    {
        private readonly ITestOutputHelper output;
        public activation(ITestOutputHelper output)
        {
            this.output = output;
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_Activation_CorrectCredentials_Returns0()
        {
            // <Javonet_activate>
            var result = Javonet.Activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenseKey);
            // </Javonet_activate>
            Assert.Equal(0, result);

            // <Javonet_activate_without_credentials>
            var result2 = Javonet.Activate("", "");
            // </Javonet_activate_without_credentials>
            Assert.Equal(0, result2);
        }
    }
}