require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To Perl Integration Tests' do

  resources_directory = File.expand_path('../../../../../testResources/perl', __FILE__)

  before(:all) do
    Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_license_key)
  end

  it 'Test_Perl_TestResources_LoadLibrary_LibraryPath_NoException' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PERL runtime context
    perl_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory
    file_name = "PerlTestClass.pm"

    # load custom library
    perl_runtime.load_library(library_path, file_name)
    # </TestResources_LoadLibrary>
  end

  it 'Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PERL runtime context
    perl_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory
    file_name = "PerlTestClass.pm"
    class_name = "PerlTestClass::PerlTestClass"

    # load custom library
    perl_runtime.load_library(library_path, file_name)

    # get type from the runtime
    perl_type = perl_runtime.get_type(class_name).execute

    # invoke type's static method
    response = perl_type.invoke_static_method("multiply_by_two", 25).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Perl_TestResources_GetStaticField_StaticValue_3' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PERL runtime context
    perl_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory
    file_name = "PerlTestClass.pm"
    class_name = "PerlTestClass::PerlTestClass"

    # load custom library
    perl_runtime.load_library(library_path, file_name)

    # get type from the runtime
    perl_type = perl_runtime.get_type(class_name).execute

    # get type's static field
    response = perl_type.get_static_field("static_value").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_Perl_TestResources_SetStaticField_StaticValue_75' do
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PERL runtime context
    perl_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory
    file_name = "PerlTestClass.pm"
    class_name = "PerlTestClass::PerlTestClass"

    # load custom library
    perl_runtime.load_library(library_path, file_name)

    # get type from the runtime
    perl_type = perl_runtime.get_type(class_name).execute

    # set type's static field
    perl_type.set_static_field("static_value", 75).execute

    # get type's static field
    response = perl_type.get_static_field("static_value").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetStaticField>
    perl_type.set_static_field("static_value", 3).execute
    expect(result).to eq(75)
  end

  it 'Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PERL runtime context
    perl_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory
    file_name = "PerlTestClass.pm"
    class_name = "PerlTestClass::PerlTestClass"

    # load custom library
    perl_runtime.load_library(library_path, file_name)

    # get type from the runtime
    perl_type = perl_runtime.get_type(class_name).execute

    # create type's instance
    instance = perl_type.create_instance().execute

    # invoke instance's method
    response = instance.invoke_instance_method("multiply_two_numbers", 5, 4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_Perl_TestResources_GetInstanceField_PublicValue_1' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create PERL runtime context
    perl_runtime = Javonet.in_memory.perl

    # set up variables
    library_path = resources_directory
    file_name = "PerlTestClass.pm"
    class_name = "PerlTestClass::PerlTestClass"

    # load custom library
    perl_runtime.load_library(library_path, file_name)

    # get type from the runtime
    perl_type = perl_runtime.get_type(class_name).execute

    # create type's instance
    instance = perl_type.create_instance().execute

    # get instance's field
    response = instance.get_instance_field("public_value").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetInstanceField>
    expect(result).to eq(1)
  end

end

