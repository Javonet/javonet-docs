require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To Netcore Integration Tests' do

  resources_directory = File.expand_path('../../../../../testResources/net-dll', __FILE__)

  before(:all) do
    Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_license_key)
  end

  it 'Test_Netcore_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50' do
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NETCORE runtime context
    netcore_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    netcore_type = netcore_runtime.get_type("System.Math").execute

    # invoke type's static method
    response = netcore_type.invoke_static_method("Abs", -50).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Netcore_StandardLibrary_GetStaticField_MathPI_PI' do
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NETCORE runtime context
    netcore_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    netcore_type = netcore_runtime.get_type("System.Math").execute

    # get type's static field
    response = netcore_type.get_static_field("PI").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetStaticField>
    expect(result.round(5)).to eq(Math::PI.round(5))
  end

  it 'Test_Netcore_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022' do
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NETCORE runtime context
    netcore_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    netcore_type = netcore_runtime.get_type("System.DateTime").execute

    # create type's instance
    instance = netcore_type.create_instance(2022, 9, 1).execute

    # call instance's method
    response = instance.invoke_instance_method("ToShortDateString").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeInstanceMethod>
    expect(result).to include("2022")
  end

  it 'Test_Netcore_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022' do
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NETCORE runtime context
    netcore_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    netcore_type = netcore_runtime.get_type("System.DateTime").execute

    # create type's instance
    instance = netcore_type.create_instance(2022, 9, 1).execute

    # get instance's field
    response = instance.get_instance_field("Year").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetInstanceField>
    expect(result).to be(2022)
  end

  it 'Test_Netcore_TestResources_LoadLibrary_LibraryPath_NoException' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NETCORE runtime context
    netcore_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = resources_directory + "/TestClass.dll"

    # load custom library
    netcore_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>
  end

  it 'Test_Netcore_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NETCORE runtime context
    netcore_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = resources_directory + "/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute

    # invoke type's static method
    response = netcore_type.invoke_static_method("MultiplyByTwo", 25).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Netcore_TestResources_GetStaticField_StaticValue_3' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NETCORE runtime context
    netcore_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = resources_directory + "/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute

    # get type's static field
    response = netcore_type.get_static_field("StaticValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_Netcore_TestResources_SetStaticField_StaticValue_75' do
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NETCORE runtime context
    netcore_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = resources_directory + "/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute

    # set type's static field
    netcore_type.set_static_field("StaticValue", 75).execute

    # get type's static field
    response = netcore_type.get_static_field("StaticValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetStaticField>
    netcore_type.set_static_field("StaticValue", 3).execute
    expect(result).to eq(75)
  end

  it 'Test_Netcore_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NETCORE runtime context
    netcore_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = resources_directory + "/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute

    # create type's instance
    instance = netcore_type.create_instance(12, 13).execute

    # invoke instance's method
    response = instance.invoke_instance_method("MultiplyTwoNumbers", 5, 4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_Netcore_TestResources_GetInstanceField_PublicValue_18' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NETCORE runtime context
    netcore_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = resources_directory + "/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute

    # create type's instance
    instance = netcore_type.create_instance(18, 19).execute

    # get instance's field
    response = instance.get_instance_field("PublicValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetInstanceField>
    expect(result).to eq(18)
  end

end

