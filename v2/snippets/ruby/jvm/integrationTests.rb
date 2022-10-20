require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To Jvm Integration Tests' do

  javonet_src_root = File.expand_path('../../../../..', __FILE__)
  // <TestResources_TestClassValues>
  library_path = javonet_src_root + "/testResources/jvm/JavaTestClass.jar"
  class_name = "javonet.test.resources.jvm.JavaTestClass"
  // </TestResources_TestClassValues>

  before(:all) do
    Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_licence_key)
  end

  it 'Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50' do
    // <StandardLibrary_InvokeStaticMethod>
    call = Javonet.in_memory.jvm.get_type("java.lang.Math").invoke_static_method("abs", -50).execute
    result = call.get_value
    // </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI' do
    // <StandardLibrary_GetStaticField>
    call = Javonet.in_memory.jvm.get_type("java.lang.Math").get_static_field("PI").execute
    result = call.get_value
    // </StandardLibrary_GetStaticField>
    expect(result.round(5)).to eq(Math::PI.round(5))
  end

  it 'Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9' do
    // <StandardLibrary_InvokeInstanceMethod>
    instance = Javonet.in_memory.jvm.get_type("java.util.Random").create_instance.execute
    call = instance.invoke_instance_method("nextInt", 10).execute
    result = call.get_value
    // </StandardLibrary_InvokeInstanceMethod>
    expect(result).to be >= 0
    expect(result).to be < 10
  end


  it 'Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoException' do
    // <TestResources_LoadLibrary>
    Javonet.in_memory.jvm.load_library(library_path)
    // </TestResources_LoadLibrary>
  end

  it 'Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50' do
    // <TestResources_InvokeStaticMethod>
    Javonet.in_memory.jvm.load_library(library_path)
    call = Javonet.in_memory.jvm.get_type(class_name).invoke_static_method("multiplyByTwo", 25).execute
    result = call.get_value
    // </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Jvm_TestResources_GetStaticField_StaticValue_3' do
    // <TestResources_GetStaticField>
    Javonet.in_memory.jvm.load_library(library_path)
    call = Javonet.in_memory.jvm.get_type(class_name).get_static_field("staticValue").execute
    result = call.get_value
    // </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_Jvm_TestResources_SetStaticField_StaticValue_75' do
    // <TestResources_SetStaticField>
    Javonet.in_memory.jvm.load_library(library_path)
    Javonet.in_memory.jvm.get_type(class_name).set_static_field("staticValue", 75).execute
    // </TestResources_SetStaticField>
    call = Javonet.in_memory.jvm.get_type(class_name).get_static_field("staticValue").execute
    result = call.get_value
    Javonet.in_memory.jvm.get_type(class_name).set_static_field("staticValue", 3).execute
    expect(result).to eq(75)

  end

  it 'Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20' do
    // <TestResources_InvokeInstanceMethod>
    Javonet.in_memory.jvm.load_library(library_path)
    instance = Javonet.in_memory.jvm.get_type(class_name).create_instance.execute
    call = instance.invoke_instance_method("multiplyTwoNumbers", 5, 4).execute
    result = call.get_value
    // </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_Jvm_TestResources_GetInstanceField_PublicValue_1' do
    // <TestResources_GetInstanceField>
    Javonet.in_memory.jvm.load_library(library_path)
    instance = Javonet.in_memory.jvm.get_type(class_name).create_instance(7, 8).execute
    call = instance.get_instance_field("publicValue").execute
    result = call.get_value
    // </TestResources_GetInstanceField>
    expect(result).to eq(7)
  end

end
