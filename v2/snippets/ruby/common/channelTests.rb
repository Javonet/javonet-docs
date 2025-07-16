require 'javonet-ruby-sdk'
require_relative '../../utils/activation_credentials'

RSpec.describe 'Ruby Channel Tests' do

  resources_directory = File.expand_path('../../../../../testResources/configuration-file', __FILE__)

  it 'Test_Channel_InMemory_Success' do
    # <InMemoryChannel>
    # use activate only once in your app
    Javonet.activate(ActivationCredentials.your_license_key)

    communication_channel = Javonet.in_memory
    # use communicationChannel to create runtimes to interact with
    # </InMemoryChannel>
    expect(communication_channel).not_to be_nil
  end

  it 'Test_Channel_Tcp_Success' do
    # <TcpChannel>
    # use activate only once in your app
    Javonet.activate(ActivationCredentials.your_license_key)

    connection_data = TcpConnectionData.new('127.0.0.1', 8083)
    communication_channel = Javonet.tcp(connection_data)
    # use communicationChannel to create runtimes to interact with
    # </TcpChannel>
    expect(communication_channel).not_to be_nil
  end

  it 'Test_Channel_WebSocket_Success' do
    # <WebSocketChannel>
    # use activate only once in your app
    Javonet.activate(ActivationCredentials.your_license_key)

    connection_data = WsConnectionData.new("ws://127.0.0.1:8080/ws")
    communication_channel = Javonet.web_socket(connectionData)
    # use communicationChannel to create runtimes to interact with
    # </WebSocketChannel>
    expect(communication_channel).not_to be_nil
  end

  it 'Test_Channel_WithConfigurationFile_Success' do
    # <WithConfigurationFile>
    # use activate only once in your app
    Javonet.activate(ActivationCredentials.your_license_key)

    # set up variables
    config_file_path = resources_directory + "/functional-tests-config.json"
    communication_channel = Javonet.with_config(config_file_path.to_s)
    # use communicationChannel to create runtimes to interact with
    # </WithConfigurationFile>
    expect(communication_channel).not_to be_nil
  end
end

