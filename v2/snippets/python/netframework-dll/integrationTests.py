import math
import platform
from pathlib import Path

import pytest
from javonet.core.exception.JavonetException import JavonetException
from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent.parent) + '/testResources/netframework-dll'


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_LoadLibrary():
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_GetStaticField():
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # get type's static field
    response = called_runtime_type.get_static_field("StaticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetStaticField>
    assert result == 3


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_SetStaticField():
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # set static field value
    called_runtime_type.set_static_field("StaticValue", 75).execute()

    # get type's static field
    response = called_runtime_type.get_static_field("StaticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetStaticField>
    called_runtime_type.set_static_field("StaticValue", 3).execute()
    assert result == 75


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_GetInstanceField():
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute()

    # get instance's field
    response = instance.get_instance_field("PublicValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetInstanceField>
    assert result == 18


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_SetInstanceField():
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute()

    # set instance's field
    instance.set_instance_field("PublicValue", 44).execute()

    # get instance's field
    response = instance.get_instance_field("PublicValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetInstanceField>
    assert result == 44


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_InvokeStaticMethod():
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke static method
    response = called_runtime_type.invoke_static_method("MultiplyByTwo", 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeStaticMethod>
    assert (result == 50)


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_InvokeInstanceMethod():
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    response = instance.invoke_instance_method("MultiplyTwoNumbers", 2, 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeInstanceMethod>
    assert result == 50


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_1DArray_GetIndex():
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("Get1DArray").execute()

    # get index from array
    response = array.get_index(2).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetIndex>
    assert result == "three"


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_1DArray_GetSize():
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("Get1DArray").execute()

    # get array's size
    response = array.get_size().execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetSize>
    assert result == 5


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_1DArray_SetIndex():
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("Get1DArray").execute()

    # set array's index
    array.set_index("seven", 4).execute()

    # get index from array
    response = array.get_index(4).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_SetIndex>
    array.set_index("five", 4).execute()
    assert result == "seven"


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_1DArray_Iterate():
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("Get1DArray").execute()

    # iterate through elements and invoke method on them
    array_upper = list()
    for element in array:
        array_upper.append(element.invoke_instance_method("ToUpper").execute().get_value())

    # write result to console
    print(array_upper)
    # </TestResources_1DArray_Iterate>
    assert array_upper == ["ONE", "TWO", "THREE", "FOUR", "FIVE"]


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_1DArray_GetElement():
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("Get1DArray").execute()

    # get element of array and invoke method on it
    response = array[2].invoke_instance_method("ToUpper").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetElement>
    assert result == "THREE"


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_1DArray_SetElement():
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("Get1DArray").execute()

    # set element of array
    array[2] = "zero"

    # get element of array
    response = array[2].invoke_instance_method("ToUpper").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_SetElement>
    assert result == "ZERO"


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_1DArray_PassArrayAsArgument():
    # <TestResources_1DArray_PassArrayAsArgument>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # get type for casting
    target_type = called_runtime.get_type("System.Double[]")

    # invoke instance's method
    response = instance.invoke_instance_method("AddArrayElementsAndMultiply",
                                               called_runtime.cast(target_type, [12.22, 98.22, -10.44]),
                                               9.99).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_PassArrayAsArgument>
    assert round(result, 3) == 999.0


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_1DArray_RetrieveArray():
    # <TestResources_1DArray_RetrieveArray>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array_reference = instance.invoke_instance_method("Get1DArray").execute()

    # get value from array reference
    result = array_reference.retrieve_array()

    # write result to console
    print(result)
    # </TestResources_1DArray_RetrieveArray>
    assert result == ["one", "two", "three", "four", "five"]


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_Cast_ToUInt():
    # <TestResources_Cast_ToUInt>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # get type for casting
    target_type = called_runtime.get_type("System.UInt32")

    # invoke static method
    response = called_runtime_type.invoke_static_method("CastSampleMethod",
                                                        called_runtime.cast(target_type, 5.2)).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_Cast_ToUInt>
    assert result == "CastSampleMethod with System.UInt32 called"


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_Cast_ToFloat():
    # <TestResources_Cast_ToFloat>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # get type for casting
    target_type = called_runtime.get_type("System.Single")

    # invoke static method
    response = called_runtime_type.invoke_static_method("CastSampleMethod",
                                                        called_runtime.cast(target_type, 5)).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_Cast_ToFloat>
    assert result == "CastSampleMethod with System.Single called"


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException():
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    try:
        Javonet.activate("your-email", "your-license-key")

        # create called runtime context
        called_runtime = Javonet.in_memory().clr()

        # set up variables
        library_path = resources_directory + '/TestClass.dll'
        class_name = 'TestClass.TestClass'

        # load custom library
        called_runtime.load_library(library_path)

        # get type from the runtime
        called_runtime_type = called_runtime.get_type(class_name).execute()

        # invoke static method
        response = called_runtime_type.invoke_static_method("DivideBy", 10, 0).execute()
    except Exception as e:
        # write exception to console
        print(e)
        # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        assert type(e) == JavonetException
        assert "DivideByThird" in str(e)


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_GenericStaticMethod():
    # <TestResources_GenericStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # get type for generic method
    target_type = called_runtime.get_type("System.Int32")

    # invoke static method
    response = called_runtime_type.\
        invoke_generic_static_method("GenericSampleStaticMethod", target_type, 7, 5).\
        execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GenericStaticMethod>
    assert (result == "7 and 5")


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_GenericMethod():
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # get type for generic method
    target_type = called_runtime.get_type("System.Int32")

    # invoke instance method
    response = instance.\
        invoke_generic_method("GenericSampleMethod", target_type, 7, 5).\
        execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GenericMethod>
    assert (result == "7 or 5")


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_TestResources_GenericMethodWithTwoTypes():
    # <TestResources_GenericMethodWithTwoTypes>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # get types for generic method
    target_type_1 = called_runtime.get_type("System.String")
    target_type_2 = called_runtime.get_type("System.Int32")

    # invoke instance method
    response = instance.\
        invoke_generic_method("GenericSampleMethodWithTwoTypes",
                              [target_type_1, target_type_2], "test").\
        execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GenericMethodWithTwoTypes>
    assert (result == 0)


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_StandardLibrary_GetStaticField():
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create runtime context
    called_runtime = Javonet.in_memory().clr()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("System.Math").execute()

    # get type's static field
    response = called_runtime_type.get_static_field("PI").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetStaticField>
    assert result == math.pi


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_StandardLibrary_GetInstanceField():
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("System.DateTime").execute()

    # create type's instance
    instance = called_runtime_type.create_instance(2022, 9, 2).execute()

    # get instance's field
    response = instance.get_instance_field("Year").execute()

    # get value from response
    result = response.get_value()
    # </StandardLibrary_GetInstanceField>
    assert result == 2022


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_StandardLibrary_InvokeStaticMethod():
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("System.Math").execute()

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("Abs", -50).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeStaticMethod>
    assert result == 50


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_StandardLibrary_InvokeInstanceMethod():
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().clr()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("System.DateTime").execute()

    # create type's instance
    instance = called_runtime_type.create_instance(2022, 9, 2).execute()

    # invoke instance's method
    response = instance.invoke_instance_method("ToShortDateString").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeInstanceMethod>
    assert "2022" in result


@pytest.mark.skipif(platform.system() != 'Windows', reason="Clr unsupported on Linux and MacOs")
def test_NetframeworkDll_StandardLibrary_PassInstanceAsArgument():
    # <StandardLibrary_PassInstanceAsArgument>
    instance = Javonet.in_memory().clr().get_type("System.DateTime").create_instance(2022, 9, 13, 8, 24,
                                                                                     22).execute()
    culture_info_es = Javonet.in_memory().clr().get_type("System.Globalization.CultureInfo").create_instance(
        "es-ES",
        False).execute();
    culture_info_pl = Javonet.in_memory().clr().get_type("System.Globalization.CultureInfo").create_instance(
        "pl-PL",
        False).execute();
    culture_info_de = Javonet.in_memory().clr().get_type("System.Globalization.CultureInfo").create_instance(
        "de-De",
        False).execute();
    culture_info_ja = Javonet.in_memory().clr().get_type("System.Globalization.CultureInfo").create_instance(
        "ja-JP",
        False).execute();
    culture_info_uk = Javonet.in_memory().clr().get_type("System.Globalization.CultureInfo").invoke_static_method(
        "GetCultureInfo", "uk-Ua").execute();

    result_es = instance.invoke_instance_method("ToString", "F", culture_info_es).execute().get_value()
    result_pl = instance.invoke_instance_method("ToString", "F", culture_info_pl).execute().get_value()
    result_de = instance.invoke_instance_method("ToString", "F", culture_info_de).execute().get_value()
    result_ja = instance.invoke_instance_method("ToString", "F", culture_info_ja).execute().get_value()
    result_uk = instance.invoke_instance_method("ToString", "F", culture_info_uk).execute().get_value()

    assert result_es == "martes, 13 de septiembre de 2022 8:24:22"
    assert result_pl == "wtorek, 13 września 2022 08:24:22"
    assert result_de == "Dienstag, 13. September 2022 08:24:22"
    assert result_ja == "2022年9月13日 8:24:22"
    assert result_uk == "13 вересня 2022 р. 8:24:22"
    # </StandardLibrary_PassInstanceAsArgument>
