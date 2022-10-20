require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To V8 Integration Tests' do

  #javonet_src_root = File.expand_path('../../../../..', __FILE__)
  # // <TestResources_TestClassValues>
  # // </TestResources_TestClassValues>

  before(:all) do
    Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_licence_key)
  end

end

