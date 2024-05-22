package common;

import com.javonet.sdk.*;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import utils.ActivationCredentials;

public class activationTests {

    @Test
    @Tag("integration")
    public void Test_Activation_CorrectCredentials_Returns0() {
        // <Javonet_activate>
        int result = Javonet.activate(ActivationCredentials.yourLicenseKey);
        // </Javonet_activate>
        Assertions.assertEquals(0, result);

        // <Javonet_activate_without_credentials>
        int result2 = Javonet.activate("");
        // </Javonet_activate_without_credentials>
        Assertions.assertEquals(0, result2);
    }
}
