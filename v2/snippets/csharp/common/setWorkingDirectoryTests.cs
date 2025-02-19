using Javonet.Netcore.Sdk.Tests.Utils;
using System;
using Xunit;


namespace Javonet.Netcore.Sdk.Tests.common
{
    public class setWorkingDirectoryTests
    {
        [Fact]
        [Trait("Test", "Integration")]
        public void Test_SetWorkingDirectory()
        {
            // <SetWorkingDirectory>
            // define path to be used as Javonet working directory
            string userHomeDirectory = Environment.GetFolderPath(Environment.SpecialFolder.UserProfile);
            string javonetWorkingDirectory = System.IO.Path.Combine(userHomeDirectory, "myNewDirectory");

            // set Javonet working directory
            Javonet.SetJavonetWorkingDirectory(javonetWorkingDirectory);

            // use Activate only once in your app
            Javonet.Activate(ActivationCredentials.yourLicenseKey);

            // create other runtime context
            var rtmCtx = Javonet.InMemory().Jvm();

            // start interact with other runtime...
            // </SetWorkingDirectory>
            var response = rtmCtx.GetType("java.lang.Math").InvokeStaticMethod("abs", -13).Execute();
            var result = response.GetValue();
            Console.WriteLine(result);
            Assert.Equal(13, result);
            Assert.True(System.IO.File.Exists(javonetWorkingDirectory + "/javonet.lic"));
            Assert.True(System.IO.Directory.Exists(javonetWorkingDirectory + "/Binaries/Native"));
            Assert.True(System.IO.Directory.Exists(javonetWorkingDirectory + "/Binaries/Jvm"));

        }
    }
}
