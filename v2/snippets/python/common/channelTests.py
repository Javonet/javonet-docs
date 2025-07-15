from javonet.sdk import Javonet
from utils.activation_credentials import *
from pathlib import Path

resources_directory = str(Path(__file__).parent.parent.parent.parent.parent) + '/testResources/configuration-file'


def test_channel_in_memory_success():
    # <InMemoryChannel>
    # use Activate only once in your app
    Javonet.activate(ActivationCredentials.yourLicenseKey)

    communication_channel = Javonet.in_memory()
    # use communicationChannel to create runtimes to interact with
    # </InMemoryChannel>
    assert communication_channel is not None


def test_channel_tcp_success():
    # <TcpChannel>
    # use Activate only once in your app
    Javonet.activate(ActivationCredentials.yourLicenseKey)

    from javonet.utils.connectionData.TcpConnectionData import TcpConnectionData
    connection_data = TcpConnectionData("127.0.0.1", 8083)
    communication_channel = Javonet.tcp(connection_data)
    # use communicationChannel to create runtimes to interact with
    # </TcpChannel>
    assert communication_channel is not None

def test_channel_websocket_success():
    # <WebSocketChannel>
    # use Activate only once in your app
    Javonet.activate(ActivationCredentials.yourLicenseKey)

    from javonet.utils.connectionData.WsConnectionData import WsConnectionData
    ws_connection_data = WsConnectionData("ws://127.0.0.1:8080/ws")
    communication_channel = Javonet.web_socket(ws_connection_data)
    # use communicationChannel to create runtimes to interact with
    # </WebSocketChannel>
    assert communication_channel is not None


def test_channel_with_configuration_file_success():
    # <WithConfigurationFile>
    # use Activate only once in your app
    Javonet.activate(ActivationCredentials.yourLicenseKey)

    # set up variables
    config_file_path = resources_directory + "/functional-tests-config.json"
    communication_channel = Javonet.with_config(str(config_file_path))
    # use communicationChannel to create runtimes to interact with
    # </WithConfigurationFile>
    assert communication_channel is not None
