package common;

import com.javonet.sdk.*;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import utils.ActivationCredentials;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


public class setWorkingDirectoryTests {
    @Test
    @Tag("integration")
    public void Test_SetWorkingDirectory() throws IOException {
        // <SetWorkingDirectory>
        // define path to be used as Javonet working directory
        String userHomeDirectory = System.getProperty("user.home");
        Path javonetWorkingDirectory = Paths.get(userHomeDirectory, "myNewDirectory");

        // set Javonet working directory
        Javonet.setJavonetWorkingDirectory(javonetWorkingDirectory.toString());

        // use Activate only once in your app
        Javonet.activate(ActivationCredentials.yourLicenseKey);

        // create other runtime context
        RuntimeContext rtmCtx = Javonet.inMemory().netcore();

        // start interact with other runtime...
        // </SetWorkingDirectory>
        InvocationContext response = rtmCtx.getType("System.Math").invokeStaticMethod("Abs", -13).execute();
        Integer result = (Integer)response.getValue();
        Assertions.assertEquals(13, result);
        Assertions.assertTrue(Files.exists(javonetWorkingDirectory.resolve("javonet.lic")));
        Assertions.assertTrue(Files.isDirectory(javonetWorkingDirectory.resolve("Binaries/Native")));
        Assertions.assertTrue(Files.isDirectory(javonetWorkingDirectory.resolve("Binaries/Netcore")));
    }


}
