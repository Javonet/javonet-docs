from pathlib import Path

from javonet.sdk import Javonet
from utils.activation_credentials import *


def test_set_working_directory():
    # <SetWorkingDirectory>
    # define path to be used as Javonet working directory
    user_home_directory = Path.home()
    javonet_working_directory = user_home_directory / "myNewDirectory"

    # set Javonet working directory
    Javonet.set_javonet_working_directory(str(javonet_working_directory))

    # use Activate only once in your app
    Javonet.activate(ActivationCredentials.yourLicenseKey)

    # create other runtime context
    rtm_ctx = Javonet.in_memory().netcore()

    # start interact with other runtime...
    # </SetWorkingDirectory>
    response = rtm_ctx.get_type("System.Math").invoke_static_method("Abs", -13).execute()
    result = response.get_value()
    assert result == 13
    assert (javonet_working_directory / "javonet.lic").exists()
