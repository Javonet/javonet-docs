from javonet.sdk import Javonet
from pathlib import Path

resources_directory = str(Path(__file__).parent.parent.parent.parent.parent) + '/testResources/configuration-file'

def test_channel_in_memory_success():
    # <InMemoryChannel>
    # use Activate only once in your app
    Javonet.activate("your-license-key")

    communication_channel = Javonet.in_memory()
    # use communicationChannel to create runtimes to interact with
    # </InMemoryChannel>
    assert communication_channel is not None

def test_channel_tcp_success():
    # <TcpChannel>
    # use Activate only once in your app
    Javonet.activate("your-license-key")

    from javonet.utils.connectionData.TcpConnectionData import TcpConnectionData
    connection_data = TcpConnectionData("127.0.0.1", 8083)
    communication_channel = Javonet.tcp(connection_data)
    # use communicationChannel to create runtimes to interact with
    # </TcpChannel>
    assert communication_channel is not None

def test_channel_with_configuration_file_success():
    # <WithConfigurationFile>
    # use Activate only once in your app
    Javonet.activate("your-license-key")

    # set up variables
    config_file_path = resources_directory + "/javonetconf.json"
    communication_channel = Javonet.with_config(str(config_file_path))
    # use communicationChannel to create runtimes to interact with
    # </WithConfigurationFile>
    assert communication_channel is not None