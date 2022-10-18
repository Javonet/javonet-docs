require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To Clr Integration Tests' do

  _javonet_src_root = File.expand_path('../../../..', __FILE__)
  // <TestResources_TestClassValues>
  library_path = _javonet_src_root + "/testResources/clr/ClrTestClass.dll";
  class_name = "ClrTestClass.ClrTestClass";
  // </TestResources_TestClassValues>

  before(:all) do
    Javonet.activate(ActivationCredentials.yourEmail, ActivationCredentials.yourLicenceKey)
  end

  it 'Test_Clr_StandardLibrary_InvokeStaticMethod_SystemMath_Abs_minus50_50' do
    if OS.windows?
      // <StandardLibrary_InvokeStaticMethod>
      call = Javonet.in_memory().clr().get_type("System.Math").invoke_static_method("Abs", -50).execute()
      result = call.get_value()
      // </StandardLibrary_InvokeStaticMethod>
      expect(result).to eq(50)
    end
  end

  it 'Test_Clr_StandardLibrary_GetStaticField_SystemMath_PI_PI' do
    if OS.windows?
      // <StandardLibrary_GetStaticField>
      call = Javonet.in_memory().clr().get_type("System.Math").get_static_field("PI").execute()
      result = call.get_value()
      // </StandardLibrary_GetStaticField>
      expect(result.round(5)).to eq(Math::PI.round(5))
    end
  end

  it 'Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022' do
    if OS.windows?
      // <StandardLibrary_InvokeInstanceMethod>
      instance = Javonet.in_memory().clr().get_type("System.DateTime").create_instance(2022,9,1).execute()
      call = instance.invoke_instance_method("ToShortDateString").execute()
      result = call.get_value()
      // </StandardLibrary_InvokeInstanceMethod>
      expect(result).to include("2022")
    end
  end

  it 'Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022' do
    if OS.windows?
      // <StandardLibrary_GetInstanceField>
      instance = Javonet.in_memory().clr().get_type("System.DateTime").create_instance(2022,9,1).execute()
      call = instance.get_instance_field("Year").execute()
      result = call.get_value()
      // </StandardLibrary_GetInstanceField>
      expect(result).to be(2022)
    end
  end

  it 'Test_Clr_TestResources_LoadLibrary_LibraryPath_NoException' do
    if OS.windows?
      // <TestResources_LoadLibrary>
      Javonet.in_memory().clr().load_library(library_path)
      // </TestResources_LoadLibrary>
    end
  end


  it 'Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50' do
    if OS.windows?
      // <TestResources_InvokeStaticMethod>
      Javonet.in_memory().clr().load_library(library_path)
      call = Javonet.in_memory().clr().get_type(class_name).invoke_static_method("MultiplyByTwo", 25).execute()
      result = call.get_value()
      // </TestResources_InvokeStaticMethod>
      expect(result).to eq(50)
    end
  end

  it 'Test_Clr_TestResources_GetStaticField_StaticValue_3' do
    if OS.windows?
      // <TestResources_GetStaticField>
      Javonet.in_memory().clr().load_library(library_path)
      call = Javonet.in_memory().clr().get_type(class_name).get_static_field("StaticValue").execute()
      result = call.get_value()
      // </TestResources_GetStaticField>
      expect(result).to eq(3)
    end
  end

  it 'Test_Clr_TestResources_SetStaticField_StaticValue_75' do
    if OS.windows?
      // <TestResources_SetStaticField>
      Javonet.in_memory().clr().load_library(library_path)
      Javonet.in_memory().clr().get_type(class_name).set_static_field("StaticValue", 75).execute()
      // </TestResources_SetStaticField>
      call = Javonet.in_memory().clr().get_type(class_name).get_static_field("StaticValue").execute()
      result = call.get_value()
      expect(result).to eq(75)
      Javonet.in_memory().clr().get_type(class_name).set_static_field("StaticValue", 3).execute()
    end
  end

  it 'Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20' do
    if OS.windows?
      // <TestResources_InvokeInstanceMethod>
      Javonet.in_memory().clr().load_library(library_path)
      instance = Javonet.in_memory().clr().get_type(class_name).create_instance().execute()
      call = instance.invoke_instance_method("MultiplyTwoNumbers", 5, 4)
      result = call.get_value()
      // </TestResources_InvokeInstanceMethod>
      expect(result).to eq(50)
    end
  end

  it 'Test_Clr_TestResources_GetInstanceField_PublicValue_1' do
    if OS.windows?
      // <TestResources_GetInstanceField>
      Javonet.in_memory().clr().load_library(library_path)
      instance = Javonet.in_memory().clr().get_type(class_name).create_instance(7,8).execute()
      call = instance.get_instance_field("PublicValue",)
      result = call.get_value()
      // </TestResources_GetInstanceField>
      expect(result).to eq(7)
    end
  end

end

