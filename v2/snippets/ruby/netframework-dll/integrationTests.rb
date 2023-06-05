require 'javonet-ruby-sdk'
require_relative 'activation_credentials'

RSpec.describe 'Ruby To Clr Integration Tests' do

  resources_directory = File.expand_path('../../../../../testResources/netframework-dll', __FILE__)

  before(:all) do
    result = Javonet.activate(ActivationCredentials.your_email, ActivationCredentials.your_license_key)
    expect(result).to eq(0)
  end

  it 'Test_Clr_TestResources_LoadLibrary_LibraryPath_NoException' do
    if OS.windows?
      # <TestResources_LoadLibrary>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"

      # load custom library
      called_runtime.load_library(library_path)
      # </TestResources_LoadLibrary>
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_GetStaticField_StaticValue_3' do
    if OS.windows?
      # <TestResources_GetStaticField>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # get type's static field
      response = called_runtime_type.get_static_field("StaticValue").execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </TestResources_GetStaticField>
      expect(result).to eq(3)
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_SetStaticField_StaticValue_75' do
    if OS.windows?
      # <TestResources_SetStaticField>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # set type's static field
      called_runtime_type.set_static_field("StaticValue", 75).execute

      # get type's static field
      response = called_runtime_type.get_static_field("StaticValue").execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </TestResources_SetStaticField>
      called_runtime_type.set_static_field("StaticValue", 3).execute
      expect(result).to eq(75)
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_GetInstanceField_PublicValue_18' do
    if OS.windows?
      # <TestResources_GetInstanceField>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # create type's instance
      instance = called_runtime_type.create_instance(18, 19).execute

      # get instance's field
      response = instance.get_instance_field("PublicValue").execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </TestResources_GetInstanceField>
      expect(result).to eq(18)
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_InvokeStaticMethod_MultiplyByTwo_25_50' do
    if OS.windows?
      # <TestResources_InvokeStaticMethod>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # invoke type's static method
      response = called_runtime_type.invoke_static_method("MultiplyByTwo", 25).execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </TestResources_InvokeStaticMethod>
      expect(result).to eq(50)
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_InvokeInstanceMethod_MultiplyTwoNumbers_4_5_20' do
    if OS.windows?
      # <TestResources_InvokeInstanceMethod>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # create type's instance
      instance = called_runtime_type.create_instance.execute

      # invoke instance's method
      response = instance.invoke_instance_method("MultiplyTwoNumbers", 5, 4).execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </TestResources_InvokeInstanceMethod>
      expect(result).to eq(20)
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_1DArray_GetIndex_2_StringThree' do
    if OS.windows?
      # <TestResources_1DArray_GetIndex>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # create type's instance
      instance = called_runtime_type.create_instance.execute

      # invoke instance's method
      array = instance.invoke_instance_method("Get1DArray").execute

      # get index from array
      response = array.get_index(2).execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </TestResources_1DArray_GetIndex>
      expect(result).to eq("three")
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_1DArray_GetSize_5' do
    if OS.windows?
      # <TestResources_1DArray_GetSize>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # create type's instance
      instance = called_runtime_type.create_instance.execute

      # invoke instance's method
      array = instance.invoke_instance_method("Get1DArray").execute

      # get array's size
      response = array.get_size.execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </TestResources_1DArray_GetSize>
      expect(result).to eq(5)
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_1DArray_SetIndex_StringSeven' do
    if OS.windows?
      # <TestResources_1DArray_SetIndex>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # create type's instance
      instance = called_runtime_type.create_instance.execute

      # invoke instance's method
      array = instance.invoke_instance_method("Get1DArray").execute

      # set array's index
      array.set_index("seven", 4).execute

      # get index from array
      response = array.get_index(4).execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </TestResources_1DArray_SetIndex>
      expect(result).to eq("seven")
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_1DArray_Iterate' do
    if OS.windows?
      # <TestResources_1DArray_Iterate>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # create type's instance
      instance = called_runtime_type.create_instance.execute

      # invoke instance's method
      array = instance.invoke_instance_method("Get1DArray").execute

      # create local array and store elements in it
      array_values = []

      array.iterator.each { |element|
        array_values.append(element.invoke_instance_method("ToUpper").execute.get_value)
      }

      # write result to console
      puts array_values
      # </TestResources_1DArray_Iterate>
      expect(array_values).to eq(["ONE", "TWO", "THREE", "FOUR", "FIVE"])
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_1DArray_GetElement' do
    if OS.windows?
      # <TestResources_1DArray_GetElement>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # create type's instance
      instance = called_runtime_type.create_instance.execute

      # invoke instance's method
      array = instance.invoke_instance_method("Get1DArray").execute

      # invoke method on array's element
      response = array[2].invoke_instance_method("ToUpper").execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </TestResources_1DArray_GetElement>
      expect(result).to eq("THREE")
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_TestResources_1DArray_SetElement' do
    if OS.windows?
      # <TestResources_1DArray_SetElement>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # set up variables
      library_path = resources_directory + "/TestClass.dll"
      class_name = "TestClass.TestClass"

      # load custom library
      called_runtime.load_library(library_path)

      # get type from the runtime
      called_runtime_type = called_runtime.get_type(class_name).execute

      # create type's instance
      instance = called_runtime_type.create_instance.execute

      # invoke instance's method
      array = instance.invoke_instance_method("Get1DArray").execute

      # set array's element
      array[2] = "seven"

      # invoke method on array's element
      response = array[2].invoke_instance_method("ToUpper").execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </TestResources_1DArray_SetElement>
      expect(result).to eq("SEVEN")
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_StandardLibrary_GetStaticField_MathPI_PI' do
    if OS.windows?
      # <StandardLibrary_GetStaticField>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # get type from the runtime
      called_runtime_type = called_runtime.get_type("System.Math").execute

      # get type's static field
      response = called_runtime_type.get_static_field("PI").execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </StandardLibrary_GetStaticField>
      expect(result.round(5)).to eq(Math::PI.round(5))
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_StandardLibrary_GetInstanceField_SystemDateTime_Year_2022' do
    if OS.windows?
      # <StandardLibrary_GetInstanceField>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # get type from the runtime
      called_runtime_type = called_runtime.get_type("System.DateTime").execute

      # create type's instance
      instance = called_runtime_type.create_instance(2022, 9, 1).execute

      # get instance's field
      response = instance.get_instance_field("Year").execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </StandardLibrary_GetInstanceField>
      expect(result).to be(2022)
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_StandardLibrary_InvokeStaticMethod_Math_Abs_Minus50_50' do
    if OS.windows?
      # <StandardLibrary_InvokeStaticMethod>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # get type from the runtime
      called_runtime_type = called_runtime.get_type("System.Math").execute

      # invoke type's static method
      response = called_runtime_type.invoke_static_method("Abs", -50).execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </StandardLibrary_InvokeStaticMethod>
      expect(result).to eq(50)
    else
      skip("Clr supported on Windows only")
    end
  end

  it 'Test_Clr_StandardLibrary_InvokeInstanceMethod_SystemDateTime_ToShortDateString_Contains2022' do
    if OS.windows?
      # <StandardLibrary_InvokeInstanceMethod>
      # use activate only once in your app
      Javonet.activate("your-email", "your-license-key")

      # create called runtime context
      called_runtime = Javonet.in_memory.clr

      # get type from the runtime
      called_runtime_type = called_runtime.get_type("System.DateTime").execute

      # create type's instance
      instance = called_runtime_type.create_instance(2022, 9, 1).execute

      # call instance's method
      response = instance.invoke_instance_method("ToShortDateString").execute

      # get value from response
      result = response.get_value

      # write result to console
      puts result
      # </StandardLibrary_InvokeInstanceMethod>
      expect(result).to include("2022")
    else
      skip("Clr supported on Windows only")
    end
  end

end

