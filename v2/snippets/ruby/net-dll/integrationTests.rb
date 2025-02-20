# frozen_string_literal: true

require 'javonet-ruby-sdk'
require_relative '../../utils/activation_credentials'

RSpec.describe 'Ruby To Net Dll Integration Tests' do
  resources_directory = File.expand_path('../../../../testResources/net-dll', __dir__)

  before(:all) do
    result = Javonet.activate(ActivationCredentials.your_license_key)
    expect(result).to eq(0)
  end

  it 'Test_NetDll_StandardLibrary_CreateRuntimeContext' do
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    expect(called_runtime).not_to be_nil
  end

  it 'Test_NetDll_StandardLibrary_CreateInvocationContext' do
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type('System.Math').invoke_static_method('Abs', -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute
    # </StandardLibrary_CreateInvocationContext>
    expect(response).not_to be_nil
  end

  it 'Test_NetDll_StandardLibrary_GetValue' do
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type('System.Math').invoke_static_method('Abs', -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetValue>
    expect(result).to eq(50)
  end

  it 'Test_NetDll_StandardLibrary_GetStaticField' do
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('System.Math').execute

    # get type's static field
    response = called_runtime_type.get_static_field('PI').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetStaticField>
    expect(result.round(5)).to eq(Math::PI.round(5))
  end

  it 'Test_NetDll_StandardLibrary_GetInstanceField' do
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('System.DateTime').execute

    # create type's instance
    instance = called_runtime_type.create_instance(2022, 9, 1).execute

    # get instance's field
    response = instance.get_instance_field('Year').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetInstanceField>
    expect(result).to be(2022)
  end

  it 'Test_NetDll_StandardLibrary_InvokeStaticMethod' do
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('System.Math').execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('Abs', -50).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_NetDll_StandardLibrary_InvokeInstanceMethod' do
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('System.DateTime').execute

    # create type's instance
    instance = called_runtime_type.create_instance(2022, 9, 1).execute

    # call instance's method
    response = instance.invoke_instance_method('ToShortDateString').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeInstanceMethod>
    expect(result).to include('2022')
  end

  it 'Test_NetDll_TestResources_LoadLibrary' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>
  end

  it 'Test_NetDll_TestResources_GetStaticField' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # get type's static field
    response = called_runtime_type.get_static_field('StaticValue').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_NetDll_TestResources_SetStaticField' do
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # set type's static field
    called_runtime_type.set_static_field('StaticValue', 75).execute

    # get type's static field
    response = called_runtime_type.get_static_field('StaticValue').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetStaticField>
    called_runtime_type.set_static_field('StaticValue', 3).execute
    expect(result).to eq(75)
  end

  it 'Test_NetDll_TestResources_GetInstanceField' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute

    # get instance's field
    response = instance.get_instance_field('PublicValue').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetInstanceField>
    expect(result).to eq(18)
  end

  it 'Test_NetDll_TestResources_SetInstanceField' do
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute

    # set instance field
    instance.set_instance_field('PublicValue', 44).execute

    # get instance's field
    response = instance.get_instance_field('PublicValue').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetInstanceField>
    expect(result).to eq(44)
  end

  it 'Test_NetDll_TestResources_InvokeStaticMethod' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('MultiplyByTwo', 25).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_NetDll_TestResources_InvokeInstanceMethod' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    response = instance.invoke_instance_method('MultiplyTwoNumbers', 5, 4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_NetDll_TestResources_1DArray_GetIndex' do
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('Get1DArray').execute

    # get index from array
    response = array.get_index(2).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetIndex>
    expect(result).to eq('three')
  end

  it 'Test_NetDll_TestResources_1DArray_GetSize' do
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('Get1DArray').execute

    # get array's size
    response = array.get_size.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetSize>
    expect(result).to eq(5)
  end

  it 'Test_NetDll_TestResources_1DArray_SetIndex' do
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('Get1DArray').execute

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

  it 'Test_NetDll_TestResources_1DArray_Iterate' do
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('Get1DArray').execute

    # create local array and store elements in it
    array_values = []

    array.iterator.each do |element|
      array_values.append(element.invoke_instance_method('ToUpper').execute.get_value)
    end

    # write result to console
    puts array_values
    # </TestResources_1DArray_Iterate>
    expect(array_values).to eq(%w[ONE TWO THREE FOUR FIVE])
  end

  it 'Test_NetDll_TestResources_1DArray_GetElement' do
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('Get1DArray').execute

    # invoke method on array's element
    response = array[2].invoke_instance_method('ToUpper').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetElement>
    expect(result).to eq('THREE')
  end

  it 'Test_NetDll_TestResources_1DArray_SetElement' do
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('Get1DArray').execute

    # set array's element
    array[2] = 'seven'

    # invoke method on array's element
    response = array[2].invoke_instance_method('ToUpper').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_SetElement>
    expect(result).to eq('SEVEN')
  end

  it 'Test_NetDll_TestResources_1DArray_PassArrayAsArgument' do
    # <TestResources_1DArray_PassArrayAsArgument>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # get type for casting
    target_type = called_runtime.get_type('System.Double[]')

    # invoke instance's method
    response = instance
                 .invoke_instance_method('AddArrayElementsAndMultiply',
                                         called_runtime.cast(target_type, [12.22, 98.22, -10.44]), 9.99)
                 .execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_PassArrayAsArgument>
    expect(result.round(1)).to eq(999.0)
  end

  it 'Test_NetDll_TestResources_1DArray_RetrieveArray' do
    # <TestResources_1DArray_RetrieveArray>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array_reference = instance.invoke_instance_method('Get1DArray').execute

    # get array from reference
    result = array_reference.retrieve_array

    # write result to console
    puts result
    # </TestResources_1DArray_RetrieveArray>
    expect(result).to eq(%w[one two three four five])
  end

  it 'Test_NetDll_TestResources_Cast_ToUInt' do
    # <TestResources_Cast_ToUInt>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # get type for casting
    target_type = called_runtime.get_type('System.UInt32')

    # invoke type's static method
    response = called_runtime_type
                 .invoke_static_method('CastSampleMethod', called_runtime.cast(target_type, 5.2))
                 .execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_Cast_ToUInt>
    expect(result).to eq('CastSampleMethod with System.UInt32 called')
  end

  it 'Test_NetDll_TestResources_Cast_ToFloat' do
    # <TestResources_Cast_ToFloat>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # get type for casting
    target_type = called_runtime.get_type('System.Single')

    # invoke type's static method
    response = called_runtime_type
                 .invoke_static_method('CastSampleMethod',
                                       called_runtime.cast(target_type, 5))
                 .execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_Cast_ToFloat>
    expect(result).to eq('CastSampleMethod with System.Single called')
  end

  it 'Test_NetDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException' do
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    begin
      # use activate only once in your app
      Javonet.activate('your-license-key')

      # create called runtime context
      called_runtime = Javonet.in_memory.netcore

      # set up variables
      library_path = "#{resources_directory}/TestClass.dll"
      class_name = 'TestClass.TestClass'

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # invoke type's static method
      called_runtime_type.invoke_static_method('DivideBy', 10, 0).execute
    rescue Exception => e
      # write exception to console
      puts e.full_message
    end
    # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
  end

  it 'Test_NetDll_TestResources_GenericStaticMethod' do
    # <TestResources_GenericStaticMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # get type for generic method
    target_type = called_runtime.get_type('System.Int32')

    # invoke type's generic static method
    response = called_runtime_type
                 .invoke_generic_static_method('GenericSampleStaticMethod', target_type, 7, 5)
                 .execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GenericStaticMethod>
    expect(result).to eq('7 and 5')
  end

  it 'Test_NetDll_TestResources_GenericMethod' do
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # get type for generic method
    target_type = called_runtime.get_type('System.Int32')

    # invoke type's generic method
    response = instance
                 .invoke_generic_method('GenericSampleMethod', target_type, 7, 5)
                 .execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GenericMethod>
    expect(result).to eq('7 or 5')
  end

  it 'Test_NetDll_TestResources_GenericMethodWithTwoTypes' do
    # <TestResources_GenericMethodWithTwoTypes>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # get type for generic method
    target_type_1 = called_runtime.get_type('System.String')
    target_type_2 = called_runtime.get_type('System.Int32')

    # invoke type's generic method
    response = instance
                 .invoke_generic_method('GenericSampleMethodWithTwoTypes',
                                        [target_type_1, target_type_2], 'test')
                 .execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GenericMethodWithTwoTypes>
    expect(result).to eq(0)
  end

  it 'Test_NetDll_TestResources_EnumAddToList' do
    # <TestResources_EnumAddToList>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get enum
    enum_type = called_runtime.get_type('TestClass.TestClass+Fruit')

    # create enum items
    apple = called_runtime.get_enum_item(enum_type, 'Apple')
    mango = called_runtime.get_enum_item(enum_type, 'Mango')

    # create fruits array
    fruits = [apple, mango]

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name)

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('AddFruitsToList', fruits).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_EnumAddToList>
    expect(result).to eq('2 fruits on the list')
  end

  it 'Test_NetDll_TestResources_EnumNameAndValue' do
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"

    # load custom library
    called_runtime.load_library(library_path)

    # get enum
    enum_type = called_runtime.get_type('TestClass.TestClass+Fruit')

    # create enum items
    fruit1 = called_runtime.get_enum_item(enum_type, 'Mango')
    fruit2 = called_runtime.get_enum_item(enum_type, 'Orange')

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
    expect(fruit1_value).to eq(3)
    expect(fruit2_value).to eq(2)
  end

  it 'Test_NetDll_TestResources_2DArray_GetIndex' do
    # <TestResources_2DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('Get2DArray').execute

    # two ways to get elements from array
    response1 = array.get_index(0, 0).execute
    response2 = array.get_index([0, 1]).execute

    # get value from response
    result1 = response1.get_value
    result2 = response2.get_value

    # write result to console
    puts result1
    puts result2
    # </TestResources_2DArray_GetIndex>
    expect(result1).to eq('S00')
    expect(result2).to eq('S01')
  end

  it 'Test_NetDll_TestResources_2DArray_GetSizeAndRank' do
    # <TestResources_2DArray_GetSizeAndRank>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom libraries
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('Get2DArray').execute

    # get array's size and rank
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

  it 'Test_NetDll_TestResources_2DArray_SetIndex' do
    # <TestResources_2DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom libraries
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('Get2DArray').execute

    # setting elements in array
    array.set_index([1, 1], 'new value 1').execute

    # two ways of getting elements from array
    response1 = array.get_index(1, 1).execute

    # get value from response
    result1 = response1.get_value

    # write result to console
    puts result1
    # </TestResources_2DArray_SetIndex>
    array.set_index([1, 1], 'S11').execute
    expect(result1).to eq('new value 1')
  end

  it 'Test_NetDll_StandardLibrary_CreateInstanceOfGenericClass' do
    # <StandardLibrary_CreateInstanceOfGenericClass>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    string_type = called_runtime.get_type('System.String').execute

    # get type for generic class
    list_type = called_runtime.get_type('System.Collections.Generic.List`1', string_type).execute

    # create instance of generic class
    list_instance = list_type.create_instance.execute

    # invoke instance's method
    list_instance.invoke_instance_method('Add', 'one').execute
    list_instance.invoke_instance_method('Add', 'two').execute
    list_instance.invoke_instance_method('Add', 'three').execute
    list_instance.invoke_instance_method('AddRange', %w[four five six]).execute

    # check number of elements in list
    response = list_instance.get_instance_field('Count').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_CreateInstanceOfGenericClass>
    expect(result).to eq(6)
  end

  it 'Test_NetDll_StandardLibrary_HandleList' do
    # <StandardLibrary_HandleList>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    string_type = called_runtime.get_type('System.String').execute

    # get type for generic class
    list_type = called_runtime.get_type('System.Collections.Generic.List`1', string_type).execute

    # create instance of generic class
    list_instance = list_type.create_instance.execute

    # invoke instance's method
    list_instance.invoke_instance_method('Add', 'one').execute
    list_instance.invoke_instance_method('Add', 'two').execute
    list_instance.invoke_instance_method('Add', 'three').execute
    list_instance.invoke_instance_method('AddRange', %w[four five six]).execute

    # get elements from list
    response1 = list_instance.get_index(2).execute
    response2 = list_instance[3].execute

    # get value from response
    result1 = response1.get_value
    result2 = response2.get_value

    # write result to console
    puts result1
    puts result2
    # </StandardLibrary_HandleList>
    expect(result1).to eq('three')
    expect(result2).to eq('four')
  end

  it 'Test_NetDll_StandardLibrary_HandleDictionary' do
    # <StandardLibrary_HandleDictionary>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    string_type = called_runtime.get_type('System.String').execute
    double_type = called_runtime.get_type('System.Double').execute

    # get type for generic class
    dictionary_type = called_runtime.get_type('System.Collections.Generic.Dictionary`2', string_type,
                                              double_type).execute

    # create instance of generic class
    dictionary = dictionary_type.create_instance.execute

    # invoke instance's method
    dictionary.invoke_instance_method('Add', 'pi', Math::PI).execute
    dictionary.invoke_instance_method('Add', 'e', Math::E).execute
    dictionary.invoke_instance_method('Add', 'c', 299_792_458.0).execute

    # get elements from dictionary
    response1 = dictionary.get_index('pi').execute

    # get value from response
    result1 = response1.get_value

    # write result to console
    puts result1
    # </StandardLibrary_HandleDictionary>
    expect(result1).to eq(Math::PI)
  end

  it 'Test_NetDll_StandardLibrary_HandleSet' do
    # <StandardLibrary_HandleSet>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # get type from the runtime
    double_type = called_runtime.get_type('System.Double').execute

    # get type for generic class
    hashset_type = called_runtime.get_type('System.Collections.Generic.HashSet`1', double_type).execute

    # create instance of generic class
    hashset = hashset_type.create_instance.execute

    # invoke instance's method
    hashset.invoke_instance_method('Add', Math::PI).execute
    hashset.invoke_instance_method('Add', Math::E).execute
    hashset.invoke_instance_method('Add', 299792458.0).execute

    # get size of hashset
    response = hashset.get_instance_field('Count').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_HandleSet>
    expect(result).to eq(3)
  end

  it 'Test_NetDll_TestResources_Refs_OneArg' do
    # <TestResources_Refs>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create values for ref
    ref_value1 = called_runtime.as_ref(10).execute
    int_type = called_runtime.get_type('System.Int32').execute
    ref_value2 = called_runtime.as_ref(20.0, int_type).execute

    # invoke type's static method with ref values
    called_runtime_type.invoke_static_method('RefSampleMethod', ref_value1).execute
    called_runtime_type.invoke_static_method('RefSampleMethod', ref_value2).execute

    # get ref values
    result1 = ref_value1.get_ref_value.execute.get_value
    result2 = ref_value2.get_ref_value.execute.get_value

    # write result to console
    puts result1
    puts result2
    # </TestResources_Refs>
    expect(result1).to eq(20)
    expect(result2).to eq(40)
  end

  it 'Test_NetDll_TestResources_Refs_MultipleArgs' do
    # <TestResources_Refs_MultipleArgs>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute
    double_type = called_runtime.get_type('System.Double').execute

    # create values for ref
    ref_to_int = called_runtime.as_ref(10).execute
    ref_to_double = called_runtime.as_ref(5, double_type).execute
    ref_to_string = called_runtime.as_ref('Before execution').execute

    # invoke type's static method with ref values
    called_runtime_type.invoke_static_method('RefSampleMethod2', ref_to_int, ref_to_double, ref_to_string).execute

    # get ref values
    result1 = ref_to_int.get_ref_value.execute.get_value
    result2 = ref_to_double.get_ref_value.execute.get_value
    result3 = ref_to_string.get_ref_value.execute.get_value

    # write result to console
    puts result1
    puts result2
    puts result3
    # </TestResources_Refs_MultipleArgs>
    expect(result1).to eq(20)
    expect(result2).to eq(2.5)
    expect(result3).to eq('Done')
  end

  it 'Test_NetDll_TestResources_Outs' do
    # <TestResources_Outs>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute
    string_type = called_runtime.get_type('System.String').execute

    # create values for outs
    out_value_1 = called_runtime.as_out(string_type).execute
    out_value_2 = called_runtime.as_out('c', string_type).execute
    out_value_3 = called_runtime.as_out('Test string').execute

    # invoke type's static method with out values
    called_runtime_type.invoke_static_method('OutSampleMethod', out_value_1).execute
    called_runtime_type.invoke_static_method('OutSampleMethod', out_value_2).execute
    called_runtime_type.invoke_static_method('OutSampleMethod', out_value_3).execute

    # get outs' values
    result1 = out_value_1.get_ref_value.execute.get_value
    result2 = out_value_2.get_ref_value.execute.get_value
    result3 = out_value_3.get_ref_value.execute.get_value

    # write result to console
    puts result1
    puts result2
    puts result3
    # </TestResources_Outs>
    expect(result1).to eq('String from OutSampleMethod')
    expect(result2).to eq('String from OutSampleMethod')
    expect(result3).to eq('String from OutSampleMethod')
  end

  it 'Test_NetDll_TestResources_PassingNullAsOnlyArg' do
    # <TestResources_PassingNullAsOnlyArg>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method with nil as argument
    response = called_runtime_type.invoke_static_method('PassNull', nil).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_PassingNullAsOnlyArg>
    expect(result).to eq('Method called with null')
  end

  it 'Test_NetDll_TestResources_PassingNullAsSecondArg' do
    # <TestResources_PassingNullAsSecondArg>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method with second argument as nil
    response = called_runtime_type.invoke_static_method('PassNull2', 5, nil).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_PassingNullAsSecondArg>
    expect(result).to eq('Method2 called with null')
  end

  it 'Test_NetDll_TestResources_ReturningNull' do
    # <TestResources_ReturningNull>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('ReturnNull').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_ReturningNull>
    expect(result).to be_nil
  end

  it 'Test_NetDll_TestResources_InvokeMethodWithNullables' do
    # <TestResources_InvokeMethodWithNullables>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method with various null combinations
    response1 = called_runtime_type.invoke_static_method("MethodWithNullables", nil, nil).execute
    response2 = called_runtime_type.invoke_static_method("MethodWithNullables", 5, nil).execute
    response3 = called_runtime_type.invoke_static_method("MethodWithNullables", nil, 10.0).execute
    response4 = called_runtime_type.invoke_static_method("MethodWithNullables", 5, 10.0).execute

    # get values from responses
    result1 = response1.get_value
    result2 = response2.get_value
    result3 = response3.get_value
    result4 = response4.get_value

    # write results to console
    puts result1
    puts result2
    puts result3
    puts result4
    # </TestResources_InvokeMethodWithNullables>
    expect(result1).to eq("MethodWithNullables called")
    expect(result2).to eq("MethodWithNullables called")
    expect(result3).to eq("MethodWithNullables called")
    expect(result4).to eq("MethodWithNullables called")
  end

  it 'Test_NetDll_TestResources_MethodWithNullArgument' do
    # <TestResources_MethodWithNullArgument>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get types from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute
    string_type = called_runtime.get_type("System.String").execute

    # create null values from types
    null_string = string_type.create_null().execute
    null_class = called_runtime_type.create_null().execute

    # invoke type's static method with null arguments
    response1 = called_runtime_type.invoke_static_method("MethodWithNullArgument", null_string).execute
    response2 = called_runtime_type.invoke_static_method("MethodWithNullArgument", null_class).execute

    # get values from responses
    result1 = response1.get_value
    result2 = response2.get_value

    # write result to console
    puts result1
    puts result2
    # </TestResources_MethodWithNullArgument>
    expect(result1).to eq("MethodWithNullArgument called with string")
    expect(result2).to eq("MethodWithNullArgument called with TestClass")
  end

  it 'Test_NetDll_TestResources_Multithreading_InvokeInstanceMethod' do
    # <Multithreading_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute
    instance = called_runtime_type.create_instance.execute

    # create threads and dictionary to store responses
    threads = {}
    responses = {}

    thread_function = Proc.new do |index|
      response = instance.invoke_instance_method('MultiplyTwoNumbers', index, 5).execute.get_value
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

  it 'Test_NetDll_TestResources_UseStaticMethodAsDelegate' do
    # <TestResources_UseStaticMethodAsDelegate>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute
    instance = called_runtime_type.create_instance.execute

    # get static method as delegate
    my_func = called_runtime_type.get_static_method_as_delegate("DivideBy").execute

    # invoke instance's method using delegate
    response = instance.invoke_instance_method("UseYourFunc", my_func, 30, 6).execute

    result = response.get_value
    puts result
    # </TestResources_UseStaticMethodAsDelegate>
    expect(result).to eq(5)
  end

  it 'Test_NetDll_TestResources_UseInstanceMethodAsDelegate' do
    # <TestResources_UseInstanceMethodAsDelegate>
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.netcore

    # set up variables
    library_path = "#{resources_directory}/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute
    instance = called_runtime_type.create_instance.execute

    # get instance method as delegate
    my_func = instance.get_instance_method_as_delegate("MultiplyTwoNumbers").execute

    # invoke instance's method using delegate
    response = instance.invoke_instance_method("UseYourFunc", my_func, 5, 6).execute

    result = response.get_value
    puts result
    # </TestResources_UseInstanceMethodAsDelegate>
    expect(result).to eq(30)
  end
end
