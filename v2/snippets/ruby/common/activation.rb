require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby Activation Tests' do

  it 'Test_Activation_CorrectCredentials_Returns0' do
    // <Javonet_activate>
    result = Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey)
    // </Javonet_activate>
    expect(result).to eq(0)
  end

end

