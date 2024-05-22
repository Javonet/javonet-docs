require 'javonet-ruby-sdk'

RSpec.describe 'Ruby Channel Tests' do

  resources_directory = File.expand_path('../../../../../testResources/configuration-file', __FILE__)

  it 'Test_Channel_InMemory_Success' do
    # <InMemoryChannel>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    communication_channel = Javonet.in_memory
    # use communicationChannel to create runtimes to interact with
    # </InMemoryChannel>
    expect(communication_channel).not_to be_nil
  end

  it 'Test_Channel_Tcp_Success' do
    # <TcpChannel>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    connection_data = ['127.0.0.1', 8083]
    communication_channel = Javonet.tcp(connection_data)
    # use communicationChannel to create runtimes to interact with
    # </TcpChannel>
    expect(communication_channel).not_to be_nil
  end

  it 'Test_Channel_WithConfigurationFile_Success' do
    # <WithConfigurationFile>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # set up variables
    config_file_path = resources_directory + "/javonetconf.json"
    communication_channel = Javonet.with_config(config_file_path.to_s)
    # use communicationChannel to create runtimes to interact with
    # </WithConfigurationFile>
    expect(communication_channel).not_to be_nil
  end
end

