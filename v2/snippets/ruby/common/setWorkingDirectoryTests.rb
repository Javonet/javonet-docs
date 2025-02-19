require 'javonet-ruby-sdk'
require_relative '../../utils/activation_credentials'

RSpec.describe 'Ruby SetWorkingDirectory Tests' do
  it 'Test_SetWorkingDirectory' do
    # <SetWorkingDirectory>
    # define path to be used as Javonet working directory
    user_home_directory = Pathname.new(Dir.home)
    javonet_working_directory = user_home_directory + "myNewDirectory"

    # set Javonet working directory
    Javonet.set_javonet_working_directory(javonet_working_directory.to_s)

    # use activate only once in your app
    Javonet.activate(ActivationCredentials.your_license_key)

    # create other runtime context
    rtm_ctx = Javonet.in_memory.netcore

    # start interact with other runtime...
    # </SetWorkingDirectory>
    response = rtm_ctx.get_type("System.Math").invoke_static_method("Abs", -13).execute
    result = response.get_value
    expect(result).to eq(13)
    expect((javonet_working_directory + "javonet.lic").exist?).to be true
  end
end

