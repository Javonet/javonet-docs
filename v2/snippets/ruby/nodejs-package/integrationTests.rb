# frozen_string_literal: true

require 'javonet-ruby-sdk'
require_relative '../../utils/activation_credentials'

RSpec.describe 'Ruby To Nodejs Package Integration Tests' do
  resources_directory = File.expand_path('../../../../testResources/nodejs-package', __dir__)

  before(:all) do
    result = Javonet.activate(ActivationCredentials.your_license_key)
    expect(result).to eq(0)
  end

  it 'Test_NodejsPackage_StandardLibrary_CreateRuntimeContext' do
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    expect(called_runtime).not_to be_nil
  end

  it 'Test_NodejsPackage_StandardLibrary_CreateInvocationContext' do
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type('Math').invoke_static_method('abs', -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute
    # </StandardLibrary_CreateInvocationContext>
    expect(response).not_to be_nil
  end

  it 'Test_NodejsPackage_StandardLibrary_GetValue' do
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type('Math').invoke_static_method('abs', -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetValue>
    expect(result).to eq(50)
  end

  it 'Test_NodejsPackage_StandardLibrary_GetStaticField' do
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('Math').execute

    # get type's static field
    response = called_runtime_type.get_static_field('PI').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetStaticField>
    expect(result.round(5)).to eq(Math::PI.round(5))
  end

  it 'Test_NodejsPackage_StandardLibrary_InvokeStaticMethod' do
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('Math').execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('abs', -50).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_NodejsPackage_StandardLibrary_InvokeInstanceMethod' do
    # <StandardLibrary_InvokeInstanceMethod>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('Date').execute

    # create type's instance with year, month, and day
    instance = called_runtime_type.create_instance(2024, 2, 3).execute

    # invoke instance method "getFullYear"
    response = instance.invoke_instance_method('getFullYear').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeInstanceMethod>
    expect(result).to eq(2024)
  end

  it 'Test_NodejsPackage_StandardLibrary_GetInstanceField' do
    # <StandardLibrary_GetInstanceField>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('Set').execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # get instance's field "size"
    response = instance.get_instance_field('size').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetInstanceField>
    expect(result).to eq(0)
  end

  it 'Test_NodejsPackage_TestResources_LoadLibrary' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>
  end

  it 'Test_NodejsPackage_TestResources_GetStaticField' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # get type's static field
    response = called_runtime_type.get_static_field('staticValue').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_NodejsPackage_TestResources_SetStaticField' do
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # set type's static field
    called_runtime_type.set_static_field('staticValue', 75).execute

    # get type's static field
    response = called_runtime_type.get_static_field('staticValue').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetStaticField>
    called_runtime_type.set_static_field('staticValue', 3).execute
    expect(result).to eq(75)
  end

  it 'Test_NodejsPackage_TestResources_GetInstanceField' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute

    # get instance's field
    response = instance.get_instance_field('publicValue').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetInstanceField>
    expect(result).to eq(18)
  end

  it 'Test_NodejsPackage_TestResources_SetInstanceField' do
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute

    # set instance field
    instance.set_instance_field('publicValue', 44).execute

    # get instance's field
    response = instance.get_instance_field('publicValue').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetInstanceField>
    expect(result).to eq(44)
  end

  it 'Test_NodejsPackage_TestResources_InvokeStaticMethod' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('multiplyByTwo', 25).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_NodejsPackage_TestResources_InvokeInstanceMethod' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    response = instance.invoke_instance_method('multiplyTwoNumbers', 5, 4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_NodejsPackage_TestResources_1DArray_GetIndex' do
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get1DArray').execute

    # get index from array
    response = array.get_index(2).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetIndex>
    expect(result).to eq('three')
  end

  it 'Test_NodejsPackage_TestResources_1DArray_GetSize' do
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get1DArray').execute

    # get array's size
    response = array.get_size.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetSize>
    expect(result).to eq(5)
  end

  it 'Test_NodejsPackage_TestResources_1DArray_SetIndex' do
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get1DArray').execute

    # set array's index
    array.set_index(4, 'seven').execute

    # get index from array
    response = array.get_index(4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_SetIndex>
    array.set_index(4, 'five').execute
    expect(result).to eq('seven')
  end

  it 'Test_NodejsPackage_TestResources_1DArray_Iterate' do
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get1DArray').execute

    # create local array and store elements in it
    array_values = []

    array.iterator.each do |element|
      array_values.append(element.execute.get_value)
    end

    # write result to console
    puts array_values
    # </TestResources_1DArray_Iterate>
    expect(array_values).to eq(%w[one two three four five])
  end

  it 'Test_NodejsPackage_TestResources_1DArray_GetElement' do
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get1DArray').execute

    # get array's element
    response = array[2].execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetElement>
    expect(result).to eq('three')
  end

  it 'Test_NodejsPackage_TestResources_1DArray_SetElement' do
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get1DArray').execute

    # set array's element
    array[2] = 'seven'

    # get array's element
    response = array[2].execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_SetElement>
    expect(result).to eq('seven')
  end

  it 'Test_NodejsPackage_TestResources_1DArray_PassArrayAsArgument' do
    # <TestResources_1DArray_PassArrayAsArgument>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    response = instance.invoke_instance_method('addArrayElementsAndMultiply', [12.22, 98.22, -10.44], 9.99).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_PassArrayAsArgument>
    expect(result.round(1)).to eq(999.0)
  end

  it 'Test_NodejsPackage_TestResources_1DArray_RetrieveArray' do
    # <TestResources_1DArray_RetrieveArray>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array_reference = instance.invoke_instance_method('get1DArray').execute

    # get array from reference
    result = array_reference.retrieve_array

    # write result to console
    puts result
    # </TestResources_1DArray_RetrieveArray>
    expect(result).to eq(%w[one two three four five])
  end

  it 'Test_NodejsPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException' do
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    begin
      # use activate only once in your app
      Javonet.activate('your-license-key')

      # create called runtime context
      called_runtime = Javonet.in_memory.nodejs

      # set up variables
      library_path = "#{resources_directory}/TestClass.js"
      class_name = 'TestClass'

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # invoke type's static method
      called_runtime_type.invoke_static_method('divideBy', 10, 0).execute
    rescue Exception => e
      # write exception to console
      puts e.full_message
    end
    # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
  end

  it 'Test_NodejsPackage_TestResources_2DArray_GetIndex' do
    # <TestResources_2DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get2DArray').execute

    # three ways to get elements from array
    response1 = array[1][1].execute
    response2 = array.get_index(1, 0).execute
    response3 = array.get_index([0, 1]).execute

    # get value from response
    result1 = response1.get_value
    result2 = response2.get_value
    result3 = response3.get_value

    # write result to console
    puts result1
    puts result2
    puts result3
    # </TestResources_2DArray_GetIndex>
    expect(result1).to eq('S11')
    expect(result2).to eq('S10')
    expect(result3).to eq('S01')
  end

  it 'Test_NodejsPackage_TestResources_2DArray_GetSizeAndRank' do
    # <TestResources_2DArray_GetSizeAndRank>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get2DArray').execute

    # get size and rank from array
    response1 = array.get_size.execute
    response2 = array.get_rank.execute

    # get value from response
    result1 = response1.get_value
    result2 = response2.get_value

    # write result to console
    puts result1
    puts result2
    # </TestResources_2DArray_GetSizeAndRank>
    expect(result1).to eq(4)
    expect(result2).to eq(2)
  end

  it 'Test_NodejsPackage_TestResources_2DArray_SetIndex' do
    # <TestResources_2DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get2DArray').execute

    # set element of array
    array.set_index([0, 1], 'new value').execute

    # get element from array
    response = array[0][1].execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_2DArray_SetIndex>
    expect(result).to eq('new value')
  end

  it 'Test_NodejsPackage_TestResources_PassingNullAsOnlyArg' do
    # <TestResources_PassingNullAsOnlyArg>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method with nil as argument
    response = called_runtime_type.invoke_static_method('passNull', nil).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_PassingNullAsOnlyArg>
    expect(result).to eq('Method called with null')
  end

  it 'Test_NodejsPackage_TestResources_PassingNullAsSecondArg' do
    # <TestResources_PassingNullAsSecondArg>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method with second argument as nil
    response = called_runtime_type.invoke_static_method('passNull2', 5, nil).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_PassingNullAsSecondArg>
    expect(result).to eq('Method2 called with null')
  end

  it 'Test_NodejsPackage_TestResources_ReturningNull' do
    # <TestResources_ReturningNull>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method that returns null
    response = called_runtime_type.invoke_static_method('returnNull').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_ReturningNull>
    expect(result).to be_nil
  end

  it 'Test_NodejsPackage_TestResources_Multithreading_InvokeInstanceMethod' do
    # <Multithreading_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute
    instance = called_runtime_type.create_instance.execute

    # create threads and dictionary to store responses
    threads = {}
    responses = {}

    thread_function = Proc.new do |index|
      response = instance.invoke_instance_method('multiplyTwoNumbers', index, 5).execute.get_value
      responses[index] = response
    end

    # start threads
    (0...5).each do |i|
      threads[i] = Thread.new { thread_function.call(i) }
    end

    # wait for threads to finish
    threads.each_value(&:join)

    # write results to console
    responses.each { |key, value| puts "#{key} * 5 = #{value}" }
    # </Multithreading_InvokeInstanceMethod>

    (0...5).each do |i|
      expect(responses[i]).to eq(i * 5)
    end
  end

  it 'Test_NodejsPackage_TestResources_UseStaticMethodAsDelegate' do
    # <TestResources_UseStaticMethodAsDelegate>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute
    instance = called_runtime_type.create_instance.execute

    # get static method as delegate
    my_func = called_runtime_type.get_static_method_as_delegate('divideBy').execute

    # invoke instance's method using delegate
    response = instance.invoke_instance_method('useYourFunc', my_func, 30, 6).execute

    result = response.get_value
    puts result
    # </TestResources_UseStaticMethodAsDelegate>
    expect(result).to eq(5)
  end

  it 'Test_Nodejs_TestResources_UseInstanceMethodAsDelegate' do
    # <TestResources_UseInstanceMethodAsDelegate>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute
    instance = called_runtime_type.create_instance.execute

    # get instance method as delegate
    my_func = instance.get_instance_method_as_delegate('multiplyTwoNumbers').execute

    # invoke instance's method using delegate
    response = instance.invoke_instance_method('useYourFunc', my_func, 5, 6).execute

    result = response.get_value
    puts result
    # </TestResources_UseInstanceMethodAsDelegate>
    expect(result).to eq(30)
  end

  it 'Test_NodejsPackage_TestResources_InvokeGlobalFunction' do
    # <TestResources_InvokeGlobalFunction>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.nodejs

    # set up variables
    library_path = "#{resources_directory}/TestClass.js"

    # load custom library
    called_runtime.load_library(library_path)

    # invoke global function
    response = called_runtime.invoke_global_function('welcome', 'John').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeGlobalFunction>
    expect(result).to eq('Hello John!')
  end

end
