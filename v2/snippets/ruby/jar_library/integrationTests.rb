require 'javonet'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To Jvm Integration Tests' do

  resources_directory = File.expand_path('../../../../../testResources/jar_library', __FILE__)

  before(:all) do
    Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_license_key)
  end

  it 'Test_Jvm_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50' do
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create JVM runtime context
    jvm_runtime = Javonet.in_memory.jvm

    # get type from the runtime
    jvm_type = jvm_runtime.get_type("java.lang.Math").execute

    # invoke type's static method
    response = jvm_type.invoke_static_method("abs", -50).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Jvm_StandardLibrary_GetStaticField_MathPI_PI' do
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create JVM runtime context
    jvm_runtime = Javonet.in_memory.jvm

    # get type from the runtime
    jvm_type = jvm_runtime.get_type("java.lang.Math").execute

    # get type's static field
    response  = jvm_type.get_static_field("PI").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_GetStaticField>
    expect(result.round(5)).to eq(Math::PI.round(5))
  end

  it 'Test_Jvm_StandardLibrary_InvokeInstanceMethod_javaUtilRandom_nextInt_10_between0and9' do
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create JVM runtime context
    jvm_runtime = Javonet.in_memory.jvm

    # get type from the runtime
    jvm_type = jvm_runtime.get_type("java.util.Random").execute

    # create type's instance
    instance = jvm_type.create_instance.execute

    # invoke instance's method
    response = instance.invoke_instance_method("nextInt", 10).execute
    
    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </StandardLibrary_InvokeInstanceMethod>
    expect(result).to be >= 0
    expect(result).to be < 10
  end


  it 'Test_Jvm_TestResources_LoadLibrary_LibraryPath_NoException' do
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create JVM runtime context
    jvm_runtime = Javonet.in_memory.jvm
    
    # set up variables
    library_path = resources_directory + "/JavaTestClass.jar"

    # load custom library
    jvm_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>
  end

  it 'Test_Jvm_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50' do
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create JVM runtime context
    jvm_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = resources_directory + "/JavaTestClass.jar"
    class_name = "javonet.test.resources.jvm.JavaTestClass"

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute

    # invoke type's static method
    response = jvm_type.invoke_static_method("multiplyByTwo", 25).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeStaticMethod>
    expect(result).to eq(50)
  end

  it 'Test_Jvm_TestResources_GetStaticField_StaticValue_3' do
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create JVM runtime context
    jvm_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = resources_directory + "/JavaTestClass.jar"
    class_name = "javonet.test.resources.jvm.JavaTestClass"

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute

    # get type's static field
    response = jvm_type.get_static_field("staticValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetStaticField>
    expect(result).to eq(3)
  end

  it 'Test_Jvm_TestResources_SetStaticField_StaticValue_75' do
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create JVM runtime context
    jvm_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = resources_directory + "/JavaTestClass.jar"
    class_name = "javonet.test.resources.jvm.JavaTestClass"

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute

    # set type's static field
    jvm_type.set_static_field("staticValue", 75).execute

    # get type's static field
    response = jvm_type.get_static_field("staticValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_SetStaticField>
    jvm_type.set_static_field("staticValue", 3).execute
    expect(result).to eq(75)

  end

  it 'Test_Jvm_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20' do
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create JVM runtime context
    jvm_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = resources_directory + "/JavaTestClass.jar"
    class_name = "javonet.test.resources.jvm.JavaTestClass"

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute

    # create type's instance
    instance = jvm_type.create_instance(12, 13).execute

    # invoke instance's method
    response = instance.invoke_instance_method("multiplyTwoNumbers", 5, 4).execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_InvokeInstanceMethod>
    expect(result).to eq(20)
  end

  it 'Test_Jvm_TestResources_GetInstanceField_PublicValue_18' do
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create JVM runtime context
    jvm_runtime = Javonet.in_memory.jvm

    # set up variables
    library_path = resources_directory + "/JavaTestClass.jar"
    class_name = "javonet.test.resources.jvm.JavaTestClass"

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute

    # create type's instance
    instance = jvm_type.create_instance(18,19).execute

    # get instance's field
    response = instance.get_instance_field("publicValue").execute

    # get value from response
    result = response.get_value

    # write result to console
    puts result
    # </TestResources_GetInstanceField>
    expect(result).to eq(18)
  end

end

