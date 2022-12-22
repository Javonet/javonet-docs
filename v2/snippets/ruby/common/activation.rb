require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby Activation Tests' do

  it 'Test_Activation_CorrectCredentials_Returns0' do
    # <Javonet_activate>
    result = Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_license_key)
    # </Javonet_activate>
    expect(result).to eq(0)

    # <Javonet_activate_without_credentials>
    result2 = Javonet.activate("", "")
    expect(result2).to eq(0)
    # </Javonet_activate_without_credentials>
  end
end

