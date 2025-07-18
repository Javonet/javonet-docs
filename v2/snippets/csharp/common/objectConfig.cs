using Javonet.Netcore.Sdk;
using Javonet.Netcore.Sdk.Tests.Utils;
using Xunit;
using Xunit.Abstractions;

namespace Javonet.Netcore.Sdk.Tests.common
{
    public class JavaScriptBrowserConfigTests
    {
        private readonly ITestOutputHelper output;
        public BrowserConfigTests(ITestOutputHelper output)
        {
            this.output = output;
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_Channel_WithConfigurationObject_Success()
        {
        // <WithConfigurationObject>
        // Configuration channel object is not yet supported in C#.
        // </WithConfigurationObject>
        }
    }
}
