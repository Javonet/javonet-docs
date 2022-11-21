require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To Perl Integration Tests' do

  javonet_src_root = File.expand_path('../../../../..', __FILE__)
  # <TestResources_TestClassValues>
  library_path = javonet_src_root + "/testResources/perl/"
  file_name = "PerlTestClass.pm"
  class_name = "PerlTestClass::PerlTestClass"
  # </TestResources_TestClassValues>

  before(:all) do
    Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_licence_key)
  end

  it 'Test_Perl_TestResources_LoadLibrary_LibraryPath_NoException' do
    # <TestResources_LoadLibrary>
    Javonet.in_memory.perl.load_library(library_path, file_name)
    # </TestResources_LoadLibrary>
  end

  it 'Test_Perl_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50' do
    # <TestResources_InvokeStaticMethod>
    Javonet.in_memory.perl.load_library(library_path, file_name)
    call = Javonet.in_memory.perl.get_type(class_name).invoke_static_method("multiply_by_two", 25).execute
    result = call.get_value
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Perl_TestResources_GetStaticField_StaticValue_3' do
    # <TestResources_GetStaticField>
    Javonet.in_memory.perl.load_library(library_path, file_name)
    call = Javonet.in_memory.perl.get_type(class_name).get_static_field("static_value").execute
    result = call.get_value
    # </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_Perl_TestResources_SetStaticField_StaticValue_75' do
    # <TestResources_SetStaticField>
    Javonet.in_memory.perl.load_library(library_path, file_name)
    Javonet.in_memory.perl.get_type(class_name).set_static_field("static_value", 75).execute
    # </TestResources_SetStaticField>
    call = Javonet.in_memory.perl.get_type(class_name).get_static_field("static_value").execute
    result = call.get_value
    Javonet.in_memory.perl.get_type(class_name).set_static_field("static_value", 3).execute
    expect(result).to eq(75)
  end

  it 'Test_Perl_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20' do
    # <TestResources_InvokeInstanceMethod>
    Javonet.in_memory.perl.load_library(library_path, file_name)
    instance = Javonet.in_memory.perl.get_type(class_name).create_instance.execute
    call = instance.invoke_instance_method("multiply_two_numbers", 5, 4).execute
    result = call.get_value
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_Perl_TestResources_GetInstanceField_PublicValue_1' do
    # <TestResources_GetInstanceField>
    Javonet.in_memory.perl.load_library(library_path, file_name)
    instance = Javonet.in_memory.perl.get_type(class_name).create_instance().execute
    call = instance.get_instance_field("public_value").execute
    result = call.get_value
    # </TestResources_GetInstanceField>
    expect(result).to eq(1)
  end

end

