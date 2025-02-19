# frozen_string_literal: true

require 'javonet-ruby-sdk'
require_relative '../../utils/activation_credentials'

RSpec.describe 'Ruby To Python Package Integration Tests' do
  resources_directory = File.expand_path('../../../../testResources/python-package', __dir__)

  before(:all) do
    result = Javonet.activate(ActivationCredentials.your_license_key)
    expect(result).to eq(0)
  end

  it 'Test_PythonPackage_StandardLibrary_CreateRuntimeContext' do
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    expect(called_runtime).not_to be_nil
  end

  it 'Test_PythonPackage_StandardLibrary_CreateInvocationContext' do
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type('builtins').invoke_static_method('abs', -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute
    # </StandardLibrary_CreateInvocationContext>
    expect(response).not_to be_nil
  end

  it 'Test_PythonPackage_StandardLibrary_GetValue' do
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type('builtins').invoke_static_method('abs', -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetValue>
    expect(result).to eq(50)
  end

  it 'Test_PythonPackage_StandardLibrary_GetStaticField' do
    # <StandardLibrary_GetStaticField>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('math').execute

    # get type's static field
    response = called_runtime_type.get_static_field('pi').execute

    # get value from response
    result = response.get_value

    # </StandardLibrary_GetStaticField>
    expect(result.round(6)).to eq(Math::PI.round(6))
  end

  it 'Test_PythonPackage_StandardLibrary_InvokeStaticMethod' do
    # <StandardLibrary_InvokeStaticMethod>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('builtins').execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('abs', -50).execute

    # get value from response
    result = response.get_value

    puts result
    # </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_PythonPackage_StandardLibrary_InvokeInstanceMethod_BuiltIn_String_Upcase' do
    # <StandardLibrary_InvokeInstanceMethod>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('builtins.str').execute

    # create type's instance
    instance = called_runtime_type.create_instance('hello world').execute

    # invoke instance's method
    response = instance.invoke_instance_method('upper').execute

    # get value from response
    result = response.get_value

    puts result
    # </StandardLibrary_InvokeInstanceMethod>
    expect(result).to eq('HELLO WORLD')
  end

  it 'Test_PythonPackage_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022' do
    # <StandardLibrary_GetInstanceField>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('datetime.datetime').execute

    # create type's instance with year 2023, month 2, day 3, hour 12, minute 0, second 0
    instance = called_runtime_type.create_instance(2023, 2, 3, 12, 0, 0).execute

    # get instance's field "year"
    response = instance.get_instance_field('year').execute

    # get value from response
    result = response.get_value

    puts result
    # </StandardLibrary_GetInstanceField>
    expect(result).to eq(2023)
  end

  it 'Test_PythonPackage_TestResources_LoadLibrary' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>
  end

  it 'Test_PythonPackage_TestResources_GetStaticField' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # get type's static field
    response = called_runtime_type.get_static_field('static_value').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_PythonPackage_TestResources_SetStaticField' do
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # set type's static field
    called_runtime_type.set_static_field('static_value', 75).execute

    # get type's static field
    response = called_runtime_type.get_static_field('static_value').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetStaticField>
    called_runtime_type.set_static_field('static_value', 3).execute
    expect(result).to eq(75)
  end

  it 'Test_PythonPackage_TestResources_GetInstanceField' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute

    # get instance's field
    response = instance.get_instance_field('public_value').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetInstanceField>
    expect(result).to eq(18)
  end

  it 'Test_PythonPackage_TestResources_SetInstanceField' do
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute

    # set instance field
    instance.set_instance_field('public_value', 44).execute

    # get instance's field
    response = instance.get_instance_field('public_value').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetInstanceField>
    expect(result).to eq(44)
  end

  it 'Test_PythonPackage_TestResources_InvokeStaticMethod' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('multiply_by_two', 25).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_PythonPackage_TestResources_InvokeInstanceMethod' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    response = instance.invoke_instance_method('multiply_two_numbers', 5, 4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_PythonPackage_TestResources_1DArray_GetIndex' do
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    array = instance.invoke_instance_method('get_1d_array').execute

    # get index from array
    response = array.get_index(2).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetIndex>
    expect(result).to eq('three')
  end

  it 'Test_PythonPackage_TestResources_1DArray_GetSize' do
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    array = instance.invoke_instance_method('get_1d_array').execute

    # get array's size
    response = array.get_size.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetSize>
    expect(result).to eq(5)
  end

  it 'Test_PythonPackage_TestResources_1DArray_SetIndex' do
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    array = instance.invoke_instance_method('get_1d_array').execute

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

  it 'Test_PythonPackage_TestResources_1DArray_Iterate' do
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    array = instance.invoke_instance_method('get_1d_array').execute

    # create local array and store elements in it
    array_values = []

    array.iterator.each do |element|
      array_values.append(element.invoke_instance_method('upper').execute.get_value)
    end

    # write result to console
    puts array_values
    # </TestResources_1DArray_Iterate>
    expect(array_values).to eq(%w[ONE TWO THREE FOUR FIVE])
  end

  it 'Test_PythonPackage_TestResources_1DArray_GetElement' do
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    array = instance.invoke_instance_method('get_1d_array').execute

    # invoke method on array's element
    response = array[2].invoke_instance_method('upper').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetElement>
    expect(result).to eq('THREE')
  end

  it 'Test_PythonPackage_TestResources_1DArray_SetElement' do
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    array = instance.invoke_instance_method('get_1d_array').execute

    # set array's element
    array[2] = 'seven'

    # invoke method on array's element
    response = array[2].invoke_instance_method('upper').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_SetElement>
    expect(result).to eq('SEVEN')
  end

  it 'Test_PythonPackage_TestResources_1DArray_PassArrayAsArgument' do
    # <TestResources_1DArray_PassArrayAsArgument>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    response = instance.invoke_instance_method('add_array_elements_and_multiply', [12.22, 98.22, -10.44],
                                               9.99).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_PassArrayAsArgument>
    expect(result.round(1)).to eq(999.0)
  end

  it 'Test_PythonPackage_TestResources_1DArray_RetrieveArray' do
    # <TestResources_1DArray_RetrieveArray>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    array_reference = instance.invoke_instance_method('get_1d_array').execute

    # get array from reference
    result = array_reference.retrieve_array

    # write result to console
    puts result
    # </TestResources_1DArray_RetrieveArray>
    expect(result).to eq(%w[one two three four five])
  end

  it 'Test_PythonPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException' do
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    begin
      # use activate only once in your app
      Javonet.activate('your-license-key')

      # create called runtime context
      called_runtime = Javonet.in_memory.python

      # set up variables
      library_path = resources_directory
      class_name = 'TestClass.TestClass'

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # invoke type's static method
      called_runtime_type.invoke_static_method('divide_by', 10, 0).execute
    rescue Exception => e
      # write exception to console
      puts e.full_message
    end
    # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
  end

  it 'Test_PythonPackage_TestResources_EnumAddToList' do
    # <TestResources_EnumAddToList>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create enum items
    apple = called_runtime.get_enum_item(called_runtime_type, 'Fruit', 'Apple')
    mango = called_runtime.get_enum_item(called_runtime_type, 'Fruit', 'Mango')

    # create fruits array
    fruits = [apple, mango]

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name)

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('add_fruits_to_list', fruits).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_EnumAddToList>
    expect(result).to eq('2 fruits on the list')
  end

  it 'Test_PythonPackage_TestResources_EnumNameAndValue' do
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create enum items
    fruit1 = called_runtime.get_enum_item(called_runtime_type, 'Fruit', 'Mango')
    fruit2 = called_runtime.get_enum_item(called_runtime_type, 'Fruit', 'Orange')

    # get items' names and values
    fruit1_name = fruit1.get_enum_name.execute.get_value
    fruit2_name = fruit2.get_enum_name.execute.get_value
    fruit1_value = fruit1.get_enum_value.execute.get_value
    fruit2_value = fruit2.get_enum_value.execute.get_value

    # get value from response
    result = "#{fruit1_name}: #{fruit1_value}, #{fruit2_name}: #{fruit2_value}"

    # write result to console
    puts result
    # </TestResources_EnumNameAndValue>
    expect(fruit1_name).to eq('Mango')
    expect(fruit2_name).to eq('Orange')
    expect(fruit1_value).to eq(4)
    expect(fruit2_value).to eq(3)
  end

  it 'Test_PythonPackage_TestResources_2DArray_GetIndex' do
    # <TestResources_2DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    array = instance.invoke_instance_method('get_2d_array').execute

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

  it 'Test_PythonPackage_TestResources_2DArray_GetSizeAndRank' do
    # <TestResources_2DArray_GetSizeAndRank>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    array = instance.invoke_instance_method('get_2d_array').execute

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

  it 'Test_PythonPackage_TestResources_2DArray_SetIndex' do
    # <TestResources_2DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute

    # invoke instance's method
    array = instance.invoke_instance_method('get_2d_array').execute

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

  it 'Test_PythonPackage_StandardLibrary_HandleList' do
    # <StandardLibrary_HandleList>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # get list from built-in types
    type_list = called_runtime.get_type('builtins.list').execute

    # create instance of list
    list = type_list.create_instance.execute

    # invoke instance method
    list.invoke_instance_method('extend', %w[one two three four five six]).execute

    # get elements from list
    element0 = list[0].execute
    element1 = list.get_index(1).execute

    result0 = element0.get_value
    result1 = element1.get_value

    # get size of list
    size = list.get_size.execute.get_value

    # write results to console
    puts result0
    puts result1
    puts size
    # </StandardLibrary_HandleList>
    expect(result0).to eq('one')
    expect(result1).to eq('two')
    expect(size).to eq(6)
  end

  it 'Test_PythonPackage_StandardLibrary_HandleDictionary' do
    # <StandardLibrary_HandleDictionary>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # get type
    type_dictionary = called_runtime.get_type("builtins.dict").execute

    # create instance of type
    dictionary = type_dictionary.create_instance.execute

    # set elements in dictionary
    dictionary.set_index("pi", Math::PI).execute
    dictionary.set_index("e", Math::E).execute
    dictionary.set_index("c", 299792458.0).execute

    # get elements from dictionary
    response1 = dictionary["c"].execute
    response2 = dictionary.get_index("e").execute

    c_value = response1.get_value
    e_value = response2.get_value

    # write results to console
    puts c_value
    puts e_value
    # </StandardLibrary_HandleDictionary>
    expect(c_value).to eq(299792458.0)
    expect(e_value).to eq(Math::E)
  end

  it 'Test_PythonPackage_StandardLibrary_HandleSet' do
    # <StandardLibrary_HandleSet>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # get type
    set_type = called_runtime.get_type('builtins.set').execute

    # create set instance
    hash_set = set_type.create_instance.execute

    # add elements to set
    hash_set.invoke_instance_method('add', 3.14).execute
    hash_set.invoke_instance_method('add', 9.81).execute
    hash_set.invoke_instance_method('add', 1.44).execute

    # get number of elements in set by invoking len
    response = called_runtime.get_type('builtins').invoke_static_method('len', hash_set).execute
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_HandleSet>
    expect(result).to eq(3)
  end

  it 'Test_PythonPackage_TestResources_PassingNullAsOnlyArg' do
    # <TestResources_PassingNullAsOnlyArg>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'
    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method with nil as argument
    response = called_runtime_type.invoke_static_method('pass_null', nil).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_PassingNullAsOnlyArg>
    expect(result).to eq('Method called with null')
  end

  it 'Test_PythonPackage_TestResources_PassingNullAsSecondArg' do
    # <TestResources_PassingNullAsSecondArg>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method with second argument as nil
    response = called_runtime_type.invoke_static_method('pass_null_2', 5, nil).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_PassingNullAsSecondArg>
    expect(result).to eq('Method2 called with null')
  end

  it 'Test_PythonPackage_TestResources_ReturningNull' do
    # <TestResources_ReturningNull>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method that returns null
    response = called_runtime_type.invoke_static_method('return_null').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_ReturningNull>
    expect(result).to be_nil
  end

  it 'Test_PythonPackage_TestResources_Multithreading_InvokeInstanceMethod' do
    # <Multithreading_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute
    instance = called_runtime_type.create_instance(0, 1).execute

    # create threads and dictionary to store responses
    threads = {}
    responses = {}

    thread_function = Proc.new do |index|
      response = instance.invoke_instance_method('multiply_two_numbers', index, 5).execute.get_value
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

  it 'Test_PythonPackage_TestResources_UseStaticMethodAsDelegate' do
    # <TestResources_UseStaticMethodAsDelegate>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get types from the runtime and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute
    instance = called_runtime_type.create_instance(0, 1).execute

    # get static method as delegate
    my_func = called_runtime_type.get_static_method_as_delegate('divide_by').execute

    # invoke instance's method using delegate
    response = instance.invoke_instance_method('use_your_func', my_func, 30, 6).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_UseStaticMethodAsDelegate>
    expect(result).to eq(5)
  end

  it 'Test_PythonPackage_TestResources_UseInstanceMethodAsDelegate' do
    # <TestResources_UseInstanceMethodAsDelegate>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute
    instance = called_runtime_type.create_instance(0, 1).execute

    # get instance method as delegate
    my_func = instance.get_instance_method_as_delegate('multiply_two_numbers').execute

    # invoke instance's method using delegate
    response = instance.invoke_instance_method('use_your_func', my_func, 5, 6).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_UseInstanceMethodAsDelegate>
    expect(result).to eq(30)
  end

  it 'Test_PythonPackage_TestResources_InvokeGlobalFunction' do
    # <TestResources_InvokeGlobalFunction>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.python

    # set up variables
    library_path = resources_directory

    # load custom library
    called_runtime.load_library(library_path)

    # invoke global function
    response = called_runtime.invoke_global_function('TestClass.welcome', 'John').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeGlobalFunction>
    expect(result).to eq('Hello John!')
  end
end