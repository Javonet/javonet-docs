import math
from pathlib import Path

from javonet.utils.exception.JavonetException import JavonetException
from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent.parent) + '/testResources/ruby-package'


def test_RubyPackage_StandardLibrary_GetStaticField():
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("Math").execute()

    # get type's static field
    response = called_runtime_type.get_static_field("PI").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetStaticField>
    assert (round(result, 6) == round(math.pi, 6))


def test_RubyPackage_StandardLibrary_InvokeStaticMethod():
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("Math").execute()

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("sqrt", 2500).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeStaticMethod>
    assert (result == 50)


def test_RubyPackage_TestResources_LoadLibrary():
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>


def test_RubyPackage_TestResources_GetStaticField():
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # get type's static field
    response = called_runtime_type.get_static_field("static_value").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetStaticField>
    assert (result == 3)


def test_RubyPackage_TestResources_SetStaticField():
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # set static field value
    called_runtime_type.set_static_field("static_value", 75).execute()

    # get type's static field
    response = called_runtime_type.get_static_field("static_value").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetStaticField>
    called_runtime_type.set_static_field("static_value", 3).execute()
    assert (result == 75)


def test_RubyPackage_TestResources_GetInstanceField():
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute()

    # get instance's field
    response = instance.get_instance_field("public_value").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetInstanceField>
    assert (result == 18)


def test_RubyPackage_TestResources_SetInstanceField():
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute()

    # set instance's field
    instance.set_instance_field("public_value", 44).execute()

    # get instance's field
    response = instance.get_instance_field("public_value").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetInstanceField>
    assert result == 44


def test_RubyPackage_TestResources_InvokeStaticMethod():
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("multiply_by_two", 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeStaticMethod>
    assert (result == 50)


def test_RubyPackage_TestResources_InvokeInstanceMethod():
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    response = instance.invoke_instance_method("multiply_two_numbers", 2, 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeInstanceMethod>
    assert (result == 50)


def test_RubyPackage_TestResources_1DArray_GetIndex():
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute()

    # get index from array
    response = array.get_index(2).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetIndex>
    assert (result == "three")


def test_RubyPackage_TestResources_1DArray_GetSize():
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute()

    # get array's size
    response = array.get_size().execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetSize>
    assert (result == 5)


def test_RubyPackage_TestResources_1DArray_SetIndex():
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute()

    # set array's index
    array.set_index(4, "seven").execute()

    # get index from array
    response = array.get_index(4).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_SetIndex>
    array.set_index(4, "five").execute()
    assert (result == "seven")


def test_RubyPackage_TestResources_1DArray_Iterate():
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute()

    # iterate through elements and invoke method on them
    array_upper = list()
    for element in array:
        array_upper.append(element.invoke_instance_method("upcase!").execute().get_value())

    # write result to console
    print(array_upper)
    # </TestResources_1DArray_Iterate>
    assert array_upper == ["ONE", "TWO", "THREE", "FOUR", "FIVE"]


def test_RubyPackage_TestResources_1DArray_GetElement():
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute()

    # get element of array and invoke method on it
    response = array[2].invoke_instance_method("upcase!").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetElement>
    assert result == "THREE"


def test_RubyPackage_TestResources_1DArray_SetElement():
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get_1d_array").execute()

    # set element of array
    array[2] = "zero"

    # get element of array and invoke method on it
    response = array[2].invoke_instance_method("upcase!").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_SetElement>
    assert result == "ZERO"


def test_RubyPackage_TestResources_1DArray_PassArrayAsArgument():
    # <TestResources_1DArray_PassArrayAsArgument>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    response = instance.invoke_instance_method("add_array_elements_and_multiply",
                                               [12.22, 98.22, -10.44],
                                               9.99).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_PassArrayAsArgument>
    assert round(result, 3) == 999.0


def test_RubyPackage_TestResources_1DArray_RetrieveArray():
    # <TestResources_1DArray_RetrieveArray>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + '/TestClass.rb'
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array_reference = instance.invoke_instance_method("get_1d_array").execute()

    # get value from array reference
    result = array_reference.retrieve_array()

    # write result to console
    print(result)
    # </TestResources_1DArray_RetrieveArray>
    assert result == ["one", "two", "three", "four", "five"]


def test_RubyPackage_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException():
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    try:
        Javonet.activate("your-license-key")

        # create called runtime context
        called_runtime = Javonet.in_memory().ruby()

        # set up variables
        library_path = resources_directory + '/TestClass.rb'
        class_name = "TestClass::TestClass"

        # load custom library
        called_runtime.load_library(library_path)

        # get type from the runtime
        called_runtime_type = called_runtime.get_type(class_name).execute()

        # invoke static method
        response = called_runtime_type.invoke_static_method("divide_by", 10, 0).execute()
    except Exception as e:
        # write exception to console
        print(e)
        # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        assert isinstance(e, JavonetException)
        assert "divide_by_third" in str(e)


def test_RubyPackage_TestResources_2DArray_GetIndex():
    # <TestResources_2DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + "/TestClass.rb"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get_2d_array").execute()

    # three ways to get elements from array
    response1 = array[1][1].execute()
    response2 = array.get_index(1, 0).execute()
    response3 = array.get_index([0, 1]).execute()

    # get value from response
    result1 = response1.get_value()
    result2 = response2.get_value()
    result3 = response3.get_value()

    # write result to console
    print(result1)
    print(result2)
    print(result3)
    # </TestResources_2DArray_GetIndex>
    assert result1 == "S11"
    assert result2 == "S10"
    assert result3 == "S01"


def test_RubyPackage_TestResources_2DArray_GetSizeAndRank():
    # <TestResources_2DArray_GetSizeAndRank>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + "/TestClass.rb"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get_2d_array").execute()

    # get size and rank from array
    response1 = array.get_size().execute()
    response2 = array.get_rank().execute()

    # get value from response
    result1 = response1.get_value()
    result2 = response2.get_value()

    # write result to console
    print(result1)
    print(result2)
    # </TestResources_2DArray_GetSizeAndRank>
    assert result1 == 4
    assert result2 == 2


def test_RubyPackage_TestResources_2DArray_SetIndex():
    # <TestResources_2DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().ruby()

    # set up variables
    library_path = resources_directory + "/TestClass.rb"
    class_name = "TestClass::TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(0, 1).execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get_2d_array").execute()

    # set element of array
    array.set_index([0, 1], "new value").execute()

    # get element from array
    response = array[0][1].execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_2DArray_SetIndex>
    assert result == "new value"
