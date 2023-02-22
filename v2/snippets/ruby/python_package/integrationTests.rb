require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To Python Integration Tests' do

  resources_directory = File.expand_path('../../../../../testResources/python_package', __FILE__)

  before(:all) do
    Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_license_key)
  end

  it 'Test_Python_StandardLibrary_InvokeStaticMethod_Builtins_Abs_Minus50_50' do
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PYTHON runtime context
    python_runtime = Javonet.in_memory.python

    # get type from the runtime
    python_type = python_runtime.get_type("builtins").execute

    # invoke type's static method
    response = python_type.invoke_static_method("abs", -50).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Python_StandardLibrary_GetStaticField_Math_PI_PI' do
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PYTHON runtime context
    python_runtime = Javonet.in_memory.python

    # get type from the runtime
    python_type = python_runtime.get_type("math").execute

    # get type's static field
    response = python_type.get_static_field("pi").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetStaticField>
    expect(result.round(5)).to eq(Math::PI.round(5))
  end

  it 'Test_Python_TestResources_LoadLibrary_LibraryPath_NoException' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PYTHON runtime context
    python_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory

    # load custom library
    python_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>
  end

  it 'Test_Python_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PYTHON runtime context
    python_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = "PythonTestClass.PythonTestClass"

    # load custom library
    python_runtime.load_library(library_path)

    # get type from the runtime
    python_type = python_runtime.get_type(class_name).execute

    # invoke type's static method
    response = python_type.invoke_static_method("multiply_by_two", 25).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Python_TestResources_GetStaticField_StaticValue_3' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PYTHON runtime context
    python_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = "PythonTestClass.PythonTestClass"

    # load custom library
    python_runtime.load_library(library_path)

    # get type from the runtime
    python_type = python_runtime.get_type(class_name).execute

    # get type's static field
    response = python_type.get_static_field("static_value").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_Python_TestResources_SetStaticField_StaticValue_75' do
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PYTHON runtime context
    python_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = "PythonTestClass.PythonTestClass"

    # load custom library
    python_runtime.load_library(library_path)

    # get type from the runtime
    python_type = python_runtime.get_type(class_name).execute

    # set type's static field
    python_type.set_static_field("static_value", 75).execute

    # get type's static field
    response = python_type.get_static_field("static_value").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetStaticField>
    python_type.set_static_field("static_value", 3).execute
    expect(result).to eq(75)
  end

  it 'Test_Python_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PYTHON runtime context
    python_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = "PythonTestClass.PythonTestClass"

    # load custom library
    python_runtime.load_library(library_path)

    # get type from the runtime
    python_type = python_runtime.get_type(class_name).execute

    # create type's instance
    instance = python_type.create_instance(12, 13).execute

    # invoke instance's method
    response = instance.invoke_instance_method("multiply_two_numbers", 5, 4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_Python_TestResources_GetInstanceField_PublicValue_18' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PYTHON runtime context
    python_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = "PythonTestClass.PythonTestClass"

    # load custom library
    python_runtime.load_library(library_path)

    # get type from the runtime
    python_type = python_runtime.get_type(class_name).execute

    # create type's instance
    instance = python_type.create_instance(18, 19).execute

    # get instance's field
    response = instance.get_instance_field("public_value").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetInstanceField>
    expect(result).to eq(18)
  end

end

