from javonet.sdk import Javonet
from utils.activation_credentials import *


def test_activation_correct_credentials_0():
    # <Javonet_activate>
    result = Javonet.activate(ActivationCredentials.yourLicenseKey)
    # </Javonet_activate>
    assert (result == 0)

    # <Javonet_activate_without_credentials>
    result2 = Javonet.activate("")
    # </Javonet_activate_without_credentials>
    assert (result2 == 0)
