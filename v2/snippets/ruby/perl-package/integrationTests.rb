require 'javonet-ruby-sdk'
require_relative '../../utils/activation_credentials'

RSpec.describe 'Ruby To Perl Package Integration Tests' do

  resources_directory = File.expand_path('../../../../../testResources/perl-package', __FILE__)

  before(:all) do
    result = Javonet.activate(ActivationCredentials.your_license_key)
    expect(result).to eq(0)
  end

  it 'Test_PerlPackage_StandardLibrary_CreateRuntimeContext' do
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    expect(called_runtime).not_to be_nil
  end

  it 'Test_PerlPackage_StandardLibrary_CreateInvocationContext' do
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # construct an invocation context - this invocationContext in non-materialized
    invocation_context = called_runtime.get_type('CORE').invoke_static_method("length", "sample text")

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute
    # </StandardLibrary_CreateInvocationContext>
    expect(response).not_to be_nil
  end

  it 'Test_PerlPackage_StandardLibrary_GetValue' do
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # construct an invocation context - this invocationContext in non-materialized
    invocation_context = called_runtime.get_type('CORE').invoke_static_method("length", "sample text")

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetValue>
    expect(result).to eq(11)
  end

  it 'Test_PerlPackage_StandardLibrary_InvokeStaticMethod' do
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # construct an invocation context - this invocationContext in non-materialized
    invocation_context = called_runtime.get_type('CORE').invoke_static_method("abs", -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_PerlPackage_TestResources_LoadLibrary' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>
  end

  it 'Test_PerlPackage_TestResources_GetStaticField' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # get type's static field
    response = called_runtime_type.get_static_field("static_value").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_PerlPackage_TestResources_SetStaticField' do
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # set type's static field
    called_runtime_type.set_static_field("static_value", 75).execute

    # get type's static field
    response = called_runtime_type.get_static_field("static_value").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetStaticField>
    called_runtime_type.set_static_field("static_value", 3).execute
    expect(result).to eq(75)
  end

  it 'Test_PerlPackage_TestResources_GetInstanceField' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # get instance's field
    response = instance.get_instance_field("public_value").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetInstanceField>
    expect(result).to eq(1)
  end

  it 'Test_PerlPackage_TestResources_SetInstanceField' do
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

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

  it 'Test_PerlPackage_TestResources_InvokeStaticMethod' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("multiply_by_two", 25).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_PerlPackage_TestResources_InvokeInstanceMethod' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    response = instance.invoke_instance_method("multiply_two_numbers", 5, 4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_PerlPackage_TestResources_1DArray_GetIndex' do
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute

    # get index from array
    response = array.get_index(2).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetIndex>
    expect(result).to eq("three")
  end

  it 'Test_PerlPackage_TestResources_1DArray_GetSize' do
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute

    # get array's size
    response = array.get_size.execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetSize>
    expect(result).to eq(5)

  end

  it 'Test_PerlPackage_TestResources_1DArray_SetIndex' do
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute

    # set array's index
    array.set_index(4, "seven").execute

    # get index from array
    response = array.get_index(4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_SetIndex>
    array.set_index(4, "five").execute
    expect(result).to eq("seven")
  end

  it 'Test_PerlPackage_TestResources_1DArray_Iterate' do
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute

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

  it 'Test_PerlPackage_TestResources_1DArray_GetElement' do
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute

    # get array's element
    response = array[2].execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_1DArray_GetElement>
    expect(result).to eq("three")
  end

  it 'Test_PerlPackage_TestResources_1DArray_SetElement' do
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute

    # create type's instance
    instance = called_runtime_type.create_instance.execute

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute

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

  it 'Test_PerlPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException' do
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    begin
      # use activate only once in your app
      Javonet.activate('your-license-key')

      # create called runtime context
      called_runtime = Javonet.in_memory.perl

      # set up variables
      library_path = resources_directory + "/TestClass.pm"
      class_name = "TestClass::TestClass"

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

  it 'Test_PerlPackage_TestResources_PassingNullAsOnlyArg' do
    # <TestResources_PassingNullAsOnlyArg>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context for Perl
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = "#{resources_directory}/TestClass.pm"
    class_name = 'TestClass::TestClass'

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

  it 'Test_PerlPackage_TestResources_PassingNullAsSecondArg' do
    # <TestResources_PassingNullAsSecondArg>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context for Perl
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = "#{resources_directory}/TestClass.pm"
    class_name = 'TestClass::TestClass'

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

  it 'Test_PerlPackage_TestResources_ReturningNull' do
    # <TestResources_ReturningNull>
    Javonet.activate('your-license-key')

    # create called runtime context for Perl
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = "#{resources_directory}/TestClass.pm"
    class_name = 'TestClass::TestClass'

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

  it 'Test_PerlPackage_TestResources_Multithreading_InvokeInstanceMethod' do
    # <Multithreading_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = "#{resources_directory}/TestClass.pm"
    class_name = 'TestClass::TestClass'

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

  it 'Test_PerlPackage_TestResources_InvokeGlobalFunction' do
    # <TestResources_InvokeGlobalFunction>
    # use activate only once in your app
    Javonet.activate('your-license-key')

    # create called runtime context
    called_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = "#{resources_directory}/TestClass.pm"

    # load custom library
    called_runtime.load_library(library_path)

    # invoke global function
    response = called_runtime.invoke_global_function('TestClass::TestClass::welcome', 'John').execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeGlobalFunction>
    expect(result).to eq('Hello John!')
  end

end

