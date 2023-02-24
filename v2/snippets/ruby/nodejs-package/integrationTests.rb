require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To Nodejs Integration Tests' do

  resources_directory = File.expand_path('../../../../../testResources/nodejs-package', __FILE__)

  before(:all) do
    Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_license_key)
  end

  it 'Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50' do
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NODEJS runtime context
    nodejs_runtime = Javonet.in_memory.nodejs

    # get type from the runtime
    nodejs_type = nodejs_runtime.get_type("Math").execute

    # invoke type's static method
    response = nodejs_type.invoke_static_method("abs", -50).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Nodejs_StandardLibrary_GetStaticField_Math_PI_PI' do
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NODEJS runtime context
    nodejs_runtime = Javonet.in_memory.nodejs

    # get type from the runtime
    nodejs_type = nodejs_runtime.get_type("Math").execute

    # get type's static field
    response = nodejs_type.get_static_field("PI").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetStaticField>
    expect(result.round(5)).to eq(Math::PI.round(5))
  end

  it 'Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoException' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NODEJS runtime context
    nodejs_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"

    # load custom library
    nodejs_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>
  end

  it 'Test_Nodejs_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NODEJS runtime context
    nodejs_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    nodejs_runtime.load_library(library_path)

    # get type from the runtime
    nodejs_type = nodejs_runtime.get_type(class_name).execute

    # invoke type's static method
    response = nodejs_type.invoke_static_method("multiplyByTwo", 25).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Nodejs_TestResources_GetStaticField_StaticValue_3' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NODEJS runtime context
    nodejs_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    nodejs_runtime.load_library(library_path)

    # get type from the runtime
    nodejs_type = nodejs_runtime.get_type(class_name).execute

    # get type's static field
    response = nodejs_type.get_static_field("staticValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_Nodejs_TestResources_SetStaticField_StaticValue_75' do
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NODEJS runtime context
    nodejs_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    nodejs_runtime.load_library(library_path)

    # get type from the runtime
    nodejs_type = nodejs_runtime.get_type(class_name).execute

    # set type's static field
    nodejs_type.set_static_field("staticValue", 75).execute

    # get type's static field
    response = nodejs_type.get_static_field("staticValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetStaticField>
    nodejs_type.set_static_field("staticValue", 3).execute
    expect(result).to eq(75)
  end

  it 'Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NODEJS runtime context
    nodejs_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    nodejs_runtime.load_library(library_path)

    # get type from the runtime
    nodejs_type = nodejs_runtime.get_type(class_name).execute

    # create type's instance
    instance = nodejs_type.create_instance(12, 13).execute

    # invoke instance's method
    response = instance.invoke_instance_method("multiplyTwoNumbers", 5, 4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_Nodejs_TestResources_GetInstanceField_PublicValue_1' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create NODEJS runtime context
    nodejs_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    nodejs_runtime.load_library(library_path)

    # get type from the runtime
    nodejs_type = nodejs_runtime.get_type(class_name).execute

    # create type's instance
    instance = nodejs_type.create_instance(18, 19).execute

    # get instance's field
    response = instance.get_instance_field("publicValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetInstanceField>
    expect(result).to eq(18)
  end

end

