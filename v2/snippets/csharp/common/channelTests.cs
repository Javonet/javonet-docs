using Javonet.Netcore.Utils;
using Xunit;


namespace Javonet.Netcore.Sdk.Tests.common
{
    public class channelTests
    {
        private static readonly string resourcesDirectory = PathResolver.GetProjectRootDirectory().Parent.Parent.FullName + "/testResources/configuration-file";

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_Channel_InMemory_Success()
        {
            // <InMemoryChannel>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            var communicationChannel = Javonet.InMemory();
            // use communicationChannel to create runtimes to interact with
            // </InMemoryChannel>
            Assert.NotNull(communicationChannel);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_Channel_Tcp_Success()
        {
            // <TcpChannel>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            var connectionData = new TcpConnectionData("127.0.0.1", 8083);
            var communicationChannel = Javonet.Tcp(connectionData);
            // use communicationChannel to create runtimes to interact with
            // </TcpChannel>
            Assert.NotNull(communicationChannel);
        }

        [Fact]
        [Trait("Test", "Integration")]
        public void Test_Channel_WithConfigurationFile_Success()
        {
            // <WithConfigurationFile>
            // use Activate only once in your app
            Javonet.Activate("your-license-key");

            // set up variables
            string configFilePath = resourcesDirectory + "/javonetconf.json";
            var communicationChannel = Javonet.WithConfig(configFilePath);
            // use communicationChannel to create runtimes to interact with
            // </WithConfigurationFile>
            Assert.NotNull(communicationChannel);
        }
    }
}
