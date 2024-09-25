# frozen_string_literal: true

require 'javonet-ruby-sdk'
require_relative '../../utils/activation_credentials'

RSpec.describe 'Ruby To Jar Library Integration Tests' do
  resources_directory = File.expand_path('../../../../../testResources/jar-library', __FILE__)

  before(:all) do
    result = Javonet.activate(ActivationCredentials.your_license_key)
    expect(result).to eq(0)
  end

  it 'Test_JarLibrary_TestResources_LoadLibrary' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>
  end

  it 'Test_JarLibrary_StandardLibrary_CreateRuntimeContext' do
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    expect(called_runtime).not_to be_nil
  end

  it 'Test_JarLibrary_StandardLibrary_CreateInvocationContext' do
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # construct an invocation context - this invocationContext in non-materialized
    invocation_context = called_runtime.get_type('java.lang.Math').invoke_static_method('abs', -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute
    # </StandardLibrary_CreateInvocationContext>
    expect(response).not_to be_nil
  end

  it 'Test_JarLibrary_StandardLibrary_GetValue' do
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # construct an invocation context - this invocationContext in non-materialized
    invocation_context = called_runtime.get_type('java.lang.Math').invoke_static_method('abs', -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetValue>
    expect(result).to eq(50)
  end

  it 'Test_JarLibrary_StandardLibrary_GetStaticField' do
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('java.lang.Math').execute

    # get type's static field
    response = called_runtime_type.get_static_field('PI').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetStaticField>
    expect(result.round(5)).to eq(Math::PI.round(5))
  end

  it 'Test_JarLibrary_StandardLibrary_GetInstanceField' do
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('java.sql.DriverPropertyInfo').execute

    # create type's instance
    instance = called_runtime_type.create_instance('sample value', 'sample value 2').execute

    # get instance's field
    response = instance.get_instance_field('name').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetInstanceField>
    expect(result).to eq('sample value')
  end

  it 'Test_JarLibrary_StandardLibrary_InvokeStaticMethod' do
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('java.lang.Math').execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('abs', -50).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_JarLibrary_StandardLibrary_InvokeInstanceMethod' do
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # get type from the runtime
    called_runtime_type = called_runtime.get_type('java.util.Random').execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    response = instance.invoke_instance_method('nextInt', 10).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeInstanceMethod>
    expect(result).to be >= 0
    expect(result).to be < 10
  end

  it 'Test_JarLibrary_TestResources_GetStaticField' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_SetStaticField' do
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_GetInstanceField' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_SetInstanceField' do
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_InvokeStaticMethod' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_InvokeInstanceMethod' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_1DArray_GetIndex' do
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_1DArray_GetSize' do
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_1DArray_SetIndex' do
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_1DArray_Iterate' do
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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
      array_values.append(element.invoke_instance_method('toUpperCase').execute.get_value)
    end

    # write result to console
    puts array_values
    # </TestResources_1DArray_Iterate>
    expect(array_values).to eq(%w[ONE TWO THREE FOUR FIVE])
  end

  it 'Test_JarLibrary_TestResources_1DArray_GetElement' do
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get1DArray').execute

    # invoke method on array's element
    response = array[2].invoke_instance_method('toUpperCase').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetElement>
    expect(result).to eq('THREE')
  end

  it 'Test_JarLibrary_TestResources_1DArray_SetElement' do
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

    # invoke method on array's element
    response = array[2].invoke_instance_method('toUpperCase').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_SetElement>
    expect(result).to eq('SEVEN')
  end

  it 'Test_JarLibrary_TestResources_1DArray_PassArrayAsArgument' do
    # <TestResources_1DArray_PassArrayAsArgument>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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
    expect(result).to eq(999)
  end

  it 'Test_JarLibrary_TestResources_1DArray_RetrieveArray' do
    # <TestResources_1DArray_RetrieveArray>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException' do
      # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    begin
      # use activate only once in your app
      Javonet.activate('your-license-key')

      # create called runtime context
      called_runtime = Javonet.in_memory.jvm

      # set up variables
      library_path = "#{resources_directory}/TestClass.jar"
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

  it 'Test_JarLibrary_TestResources_GenericStaticMethod' do
    # <TestResources_GenericStaticMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's generic static method
    response = called_runtime_type
               .invoke_generic_static_method('genericSampleStaticMethod', 7, 5)
               .execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GenericStaticMethod>
    expect(result).to eq('7 and 5')
  end

  it 'Test_JarLibrary_TestResources_GenericMethod' do
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke type's generic method
    response = instance
               .invoke_generic_method('genericSampleMethod', 7, 5)
               .execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GenericMethod>
    expect(result).to eq('7 or 5')
  end

  it 'Test_JarLibrary_TestResources_GenericMethodWithTwoTypes' do
    # <TestResources_GenericMethodWithTwoTypes>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke type's generic method
    response = instance
               .invoke_generic_method('genericSampleMethodWithTwoTypes', 7)
               .execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GenericMethodWithTwoTypes>
    expect(result).to eq('genericSampleMethodWithTwoTypes invoked')
  end

  it 'Test_JarLibrary_TestResources_EnumAddToList' do
    # <TestResources_EnumAddToList>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get enum
    enum_type = called_runtime.get_type('TestClass$Fruit')

    # create enum items
    apple = called_runtime.get_enum_item(enum_type, 'Apple')
    mango = called_runtime.get_enum_item(enum_type, 'Mango')

    # create fruits array
    fruits = [apple, mango]

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name)

    # invoke type's static method
    response = called_runtime_type.invoke_static_method('addFruitsToList', fruits).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_EnumAddToList>
    expect(result).to eq('2 fruits on the list')
  end

  it 'Test_JarLibrary_TestResources_EnumNameAndValue' do
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"

    # load custom library
    called_runtime.load_library(library_path)

    # get enum
    enum_type = called_runtime.get_type('TestClass$Fruit')

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

  it 'Test_JarLibrary_TestResources_2DArray_GetIndex' do
    # <TestResources_2DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
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
    response1 = array.get_index(0, 0).execute
    response2 = array.get_index([0, 1]).execute
    response3 = array[1][1].execute

    # get value from response
    result1 = response1.get_value
    result2 = response2.get_value
    result3 = response3.get_value

    # write result to console
    puts result1
    puts result2
    puts result3
    # </TestResources_2DArray_GetIndex>
    expect(result1).to eq('S00')
    expect(result2).to eq('S01')
    expect(result3).to eq('S11')
  end

  it 'Test_JarLibrary_TestResources_2DArray_GetSizeAndRank' do
    # <TestResources_2DArray_GetSizeAndRank>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
    class_name = 'TestClass'

    # load custom libraries
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get2DArray').execute

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

  it 'Test_JarLibrary_TestResources_2DArray_SetIndex' do
    # <TestResources_2DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = "#{resources_directory}/TestClass.jar"
    class_name = 'TestClass'

    # load custom libraries
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method('get2DArray').execute

    # two ways of setting elements in array
    array.set_index([1, 1], 'new value 1').execute
    array[0][1] = 'new value 2'

    # two ways of getting elements from array
    response1 = array.get_index(1, 1).execute
    response2 = array[0][1].execute

    # get value from response
    result1 = response1.get_value
    result2 = response2.get_value

    # write result to console
    puts result1
    puts result2
    # </TestResources_2DArray_SetIndex>
    array.set_index([1, 1], 'S11').execute
    array.set_index([0, 1], 'S01').execute
    expect(result1).to eq('new value 1')
    expect(result2).to eq('new value 2')
  end

  it 'Test_JarLibrary_StandardLibrary_CreateInstanceOfGenericClass' do
    # <StandardLibrary_CreateInstanceOfGenericClass>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # get type from the runtime
    list_type = called_runtime.get_type('java.util.ArrayList').execute

    # create instance of generic class
    list_instance = list_type.create_instance.execute

    # invoke instance's method
    list_instance.invoke_generic_method('add', 'one').execute
    list_instance.invoke_generic_method('add', 'two').execute
    list_instance.invoke_generic_method('add', 'three').execute
    list_instance.invoke_generic_method('add', 'four').execute
    list_instance.invoke_generic_method('add', 'five').execute
    list_instance.invoke_generic_method('add', 'six').execute

    # check number of elements in list
    response = list_instance.invoke_generic_method('size').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_CreateInstanceOfGenericClass>
    expect(result).to eq(6)
  end

  it 'Test_JarLibrary_StandardLibrary_HandleList' do
    # <StandardLibrary_HandleList>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # get type from the runtime
    list_type = called_runtime.get_type('java.util.ArrayList').execute

    # create instance of generic class
    list_instance = list_type.create_instance.execute

    # invoke instance's method
    list_instance.invoke_generic_method('add', 'one').execute
    list_instance.invoke_generic_method('add', 'two').execute
    list_instance.invoke_generic_method('add', 'three').execute
    list_instance.invoke_generic_method('add', 'four').execute
    list_instance.invoke_generic_method('add', 'five').execute
    list_instance.invoke_generic_method('add', 'six').execute

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

  it 'Test_JarLibrary_StandardLibrary_HandleDictionary' do
    # <StandardLibrary_HandleDictionary>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.jvm

    # get type from the runtime
    dictionary_type = called_runtime.get_type('java.util.HashMap').execute

    # create instance of generic class
    dictionary = dictionary_type.create_instance.execute

    # invoke instance's method
    dictionary.invoke_generic_method('put', 'pi', Math::PI).execute
    dictionary.invoke_generic_method('put', 'e', Math::E).execute
    dictionary.invoke_generic_method('put', 'c', 299_792_458.0).execute

    # get elements from dictionary
    response1 = dictionary.get_index('pi').execute
    response2 = dictionary['c'].execute

    # get value from response
    result1 = response1.get_value
    result2 = response2.get_value

    # write result to console
    puts result1
    puts result2
    # </StandardLibrary_HandleDictionary>
    expect(result1).to eq(Math::PI)
    expect(result2).to eq(299_792_458.0)
  end
end
