require 'javonet-ruby-sdk'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To Nodejs Integration Tests' do

  resources_directory = File.expand_path('../../../../../testResources/nodejs-package', __FILE__)

  before(:all) do
    result = Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_license_key)
    expect(result).to eq(0)
  end

  it 'Test_Nodejs_TestResources_LoadLibrary_LibraryPath_NoException' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>
  end

  it 'Test_Nodejs_TestResources_GetStaticField_StaticValue_3' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # get type's static field
    response = called_runtime_type.get_static_field("staticValue").execute

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

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # set type's static field
    called_runtime_type.set_static_field("staticValue", 75).execute

    # get type's static field
    response = called_runtime_type.get_static_field("staticValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetStaticField>
    called_runtime_type.set_static_field("staticValue", 3).execute
    expect(result).to eq(75)
  end

  it 'Test_Nodejs_TestResources_GetInstanceField_PublicValue_1' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute

    # get instance's field
    response = instance.get_instance_field("publicValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetInstanceField>
    expect(result).to eq(18)
  end

  it 'Test_Nodejs_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("multiplyByTwo", 25).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Nodejs_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    response = instance.invoke_instance_method("multiplyTwoNumbers", 5, 4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_Nodejs_TestResources_1DArray_GetIndex_2_StringThree' do
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute

    # get index from array
    response = array.get_index(2).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetIndex>
    expect(result).to eq("three")
  end

  it 'Test_Nodejs_TestResources_1DArray_GetSize_5' do
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute

    # get array's size
    response = array.get_size.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetSize>
    expect(result).to eq(5)

  end

  it 'Test_Nodejs_TestResources_1DArray_SetIndex_StringSeven' do
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute

    # set array's index
    array.set_index("seven", 4).execute

    # get index from array
    response = array.get_index(4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_SetIndex>
    array.set_index("five", 4).execute
    expect(result).to eq("seven")
  end

  it 'Test_Nodejs_TestResources_1DArray_Iterate' do
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute

    # create local array and store elements in it
    array_values = []

    array.iterator.each { |element|
      array_values.append(element.execute.get_value)
    }

    # write result to console
    puts array_values
    # </TestResources_1DArray_Iterate>
    expect(array_values).to eq(["one", "two", "three", "four", "five"])
  end

  it 'Test_Nodejs_TestResources_1DArray_GetElement' do
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute

    # get array's element
    response = array[2].execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetElement>
    expect(result).to eq("three")
  end

  it 'Test_Nodejs_TestResources_1DArray_SetElement' do
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute

    # set array's element
    array[2] = "seven"

    # get array's element
    response = array[2].execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_SetElement>
    expect(result).to eq("seven")
  end

  it 'Test_Nodejs_TestResources_1DArray_PassArrayAsArgument' do
    # <TestResources_1DArray_PassArrayAsArgument>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = resources_directory + "/TestClass.js"
    class_name = "TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    response = instance.invoke_instance_method("addArrayElementsAndMultiply", ["", 12.22, 98.22, -10.44], 9.99).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_PassArrayAsArgument>
    expect(result.round(1)).to eq(999.0)
  end

  it 'Test_Nodejs_StandardLibrary_GetStaticField_Math_PI_PI' do
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("Math").execute

    # get type's static field
    response = called_runtime_type.get_static_field("PI").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetStaticField>
    expect(result.round(5)).to eq(Math::PI.round(5))
  end

  it 'Test_Nodejs_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50' do
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("Math").execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("abs", -50).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end
end

