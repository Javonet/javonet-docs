from javonet.sdk import Javonet
from tests.ActivationCredentials import *


def test_activation_correct_credentials_0():
    # <Javonet_activate>
    result = Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey)
    # </Javonet_activate>
    assert (result == 0)
