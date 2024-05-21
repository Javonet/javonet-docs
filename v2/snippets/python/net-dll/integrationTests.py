import math
from pathlib import Path

from javonet.utils.exception.JavonetException import JavonetException
from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent.parent) + '/testResources/net-dll'

def test_NetDll_StandardLibrary_CreateRuntimeContext():
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>

def test_NetDll_StandardLibrary_CreateInvocationContext():
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type("System.Math").invoke_static_method("Abs", -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute()
    # </StandardLibrary_CreateInvocationContext>

def test_NetDll_StandardLibrary_GetValue():
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type("System.Math").invoke_static_method("Abs", -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetValue>
    assert result == 50


def test_NetDll_StandardLibrary_GetStaticField():
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_StandardLibrary_GetInstanceField():
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_StandardLibrary_InvokeStaticMethod():
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_StandardLibrary_InvokeInstanceMethod():
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_LoadLibrary():
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>


def test_NetDll_TestResources_GetStaticField():
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_SetStaticField():
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_GetInstanceField():
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_SetInstanceField():
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_InvokeStaticMethod():
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_InvokeInstanceMethod():
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_1DArray_GetIndex():
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_1DArray_GetSize():
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_1DArray_SetIndex():
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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
    array.set_index(4, "seven").execute()

    # get index from array
    response = array.get_index(4).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_SetIndex>
    array.set_index(4, "five").execute()
    assert result == "seven"


def test_NetDll_TestResources_1DArray_Iterate():
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_1DArray_GetElement():
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_1DArray_SetElement():
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_1DArray_PassArrayAsArgument():
    # <TestResources_1DArray_PassArrayAsArgument>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_1DArray_RetrieveArray():
    # <TestResources_1DArray_RetrieveArray>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_Cast_ToUInt():
    # <TestResources_Cast_ToUInt>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_Cast_ToFloat():
    # <TestResources_Cast_ToFloat>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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


def test_NetDll_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException():
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    try:
        Javonet.activate("your-license-key")

        # create called runtime context
        called_runtime = Javonet.in_memory().netcore()

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
        assert isinstance(e, JavonetException)
        assert "DivideByThird" in str(e)


def test_NetDll_TestResources_GenericStaticMethod():
    # <TestResources_GenericStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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
    response = called_runtime_type. \
        invoke_generic_static_method("GenericSampleStaticMethod", target_type, 7, 5). \
        execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GenericStaticMethod>
    assert (result == "7 and 5")


def test_NetDll_TestResources_GenericMethod():
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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
    response = instance. \
        invoke_generic_method("GenericSampleMethod", target_type, 7, 5). \
        execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GenericMethod>
    assert (result == "7 or 5")


def test_NetDll_TestResources_GenericMethodWithTwoTypes():
    # <TestResources_GenericMethodWithTwoTypes>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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
    response = instance. \
        invoke_generic_method("GenericSampleMethodWithTwoTypes",
                              [target_type_1, target_type_2], "test"). \
        execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GenericMethodWithTwoTypes>
    assert (result == 0)


def test_NetDll_TestResources_EnumAddToList():
    # <TestResources_EnumAddToList>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get enum
    enum_type = called_runtime.get_type("TestClass.TestClass+Fruit")

    # create enum items
    apple = called_runtime.get_enum_item(enum_type, "Apple")
    mango = called_runtime.get_enum_item(enum_type, "Mango")

    # create fruits array
    fruits_list = [apple, mango]

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("AddFruitsToList", fruits_list).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_EnumAddToList>
    assert result == "2 fruits on the list"


def test_NetDll_TestResources_EnumNameAndValue():
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'

    # load custom library
    called_runtime.load_library(library_path)

    # get enum
    enum_type = called_runtime.get_type("TestClass.TestClass+Fruit")

    # create enum items
    fruit1 = called_runtime.get_enum_item(enum_type, "Mango")
    fruit2 = called_runtime.get_enum_item(enum_type, "Orange")

    # get items' names and values
    fruit1_name = fruit1.get_enum_name().execute().get_value()
    fruit2_name = fruit2.get_enum_name().execute().get_value()
    fruit1_value = fruit1.get_enum_value().execute().get_value()
    fruit2_value = fruit2.get_enum_value().execute().get_value()

    # write result to console
    print(f'{fruit1_name}: {fruit1_value}, {fruit2_name}: {fruit2_value}')
    # </TestResources_EnumNameAndValue>
    assert fruit1_name == "Mango"
    assert fruit2_name == "Orange"
    assert fruit1_value == 3
    assert fruit2_value == 2


def test_NetDll_TestResources_2DArray_GetIndex():
    # <TestResources_2DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

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
    array = instance.invoke_instance_method("Get2DArray").execute()

    # two ways to get elements from array
    response1 = array.get_index(0, 0).execute()
    response2 = array.get_index([0, 1]).execute()

    # get value from response
    result1 = response1.get_value()
    result2 = response2.get_value()

    # write result to console
    print(result1)
    print(result2)
    # </TestResources_2DArray_GetIndex>
    assert result1 == "S00"
    assert result2 == "S01"


def test_NetDll_TestResources_2DArray_GetSizeAndRank():
    # <TestResources_2DArray_GetSizeAndRank>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom libraries
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("Get2DArray").execute()

    # get array's size and rank
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


def test_NetDll_TestResources_2DArray_SetIndex():
    # <TestResources_2DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom libraries
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("Get2DArray").execute()

    # setting elements in array
    array.set_index([1, 1], "new value 1").execute()

    # two ways of getting elements from array
    response1 = array.get_index(1, 1).execute()

    # get value from response
    result1 = response1.get_value()

    # write result to console
    print(result1)
    # </TestResources_2DArray_SetIndex>
    array.set_index([1, 1], "S11").execute()
    assert result1 == "new value 1"


def test_NetDll_StandardLibrary_CreateInstanceOfGenericClass():
    # <StandardLibrary_CreateInstanceOfGenericClass>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # get type from the runtime
    string_type = called_runtime.get_type("System.String").execute()

    # get type for generic class
    list_type = called_runtime.get_type("System.Collections.Generic.List`1", string_type).execute()

    # create instance of generic class
    list_instance = list_type.create_instance().execute()

    # invoke instance's method
    list_instance.invoke_instance_method("Add", "one").execute()
    list_instance.invoke_instance_method("Add", "two").execute()
    list_instance.invoke_instance_method("Add", "three").execute()
    list_instance.invoke_instance_method("AddRange", ["four", "five", "six"]).execute()

    # check number of elements in list
    response = list_instance.get_instance_field("Count").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_CreateInstanceOfGenericClass>
    assert result == 6


def test_NetDll_StandardLibrary_HandleList():
    # <StandardLibrary_HandleList>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # get type from the runtime
    string_type = called_runtime.get_type("System.String").execute()

    # get type for generic class
    list_type = called_runtime.get_type("System.Collections.Generic.List`1", string_type).execute()

    # create instance of generic class
    list_instance = list_type.create_instance().execute()

    # invoke instance's method
    list_instance.invoke_instance_method("Add", "one").execute()
    list_instance.invoke_instance_method("Add", "two").execute()
    list_instance.invoke_instance_method("Add", "three").execute()
    list_instance.invoke_instance_method("AddRange", ["four", "five", "six"]).execute()

    # get elements from list
    response1 = list_instance.get_index(2).execute()
    response2 = list_instance[3].execute()

    # get value from response
    result1 = response1.get_value()
    result2 = response2.get_value()

    # write result to console
    print(result1)
    print(result2)
    # </StandardLibrary_HandleList>
    assert result1 == "three"
    assert result2 == "four"


def test_NetDll_StandardLibrary_HandleDictionary():
    # <StandardLibrary_HandleDictionary>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # get type from the runtime
    string_type = called_runtime.get_type("System.String").execute()
    double_type = called_runtime.get_type("System.Double").execute()

    # get type for generic class
    dictionary_type = called_runtime.get_type("System.Collections.Generic.Dictionary`2", string_type,
                                              double_type).execute()

    # create instance of generic class
    dictionary = dictionary_type.create_instance().execute()

    # invoke instance's method
    dictionary.invoke_instance_method("Add", "pi", math.pi).execute()
    dictionary.invoke_instance_method("Add", "e", math.e).execute()
    dictionary.invoke_instance_method("Add", "c", 299792458.0).execute()

    # get elements from dictionary
    response1 = dictionary.get_index("pi").execute()

    # get value from response
    result1 = response1.get_value()

    # write result to console
    print(result1)
    # </StandardLibrary_HandleDictionary>
    assert result1 == math.pi


def test_NetDll_TestResources_Refs_OneArg():
    # <TestResources_Refs>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + "/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create values for ref

    # first way - pass only value
    ref_value1 = called_runtime.as_ref(10).execute()

    # second way - pass value and type
    # ref variable should have specific type to be able to invoke methods on it
    # this way enables to cast value to specific type needed by called method
    int_type = called_runtime.get_type("System.Int32").execute()
    ref_value2 = called_runtime.as_ref(20.0, int_type).execute()

    # invoke type's static method with ref values
    called_runtime_type.invoke_static_method("RefSampleMethod", ref_value1).execute()
    called_runtime_type.invoke_static_method("RefSampleMethod", ref_value2).execute()

    # get ref values
    result1 = ref_value1.get_ref_value().execute().get_value()
    result2 = ref_value2.get_ref_value().execute().get_value()

    # write result to console
    print(result1)
    print(result2)
    # </TestResources_Refs>
    assert result1 == 20
    assert result2 == 40


def test_NetDll_TestResources_Refs_MultipleArgs():
    # <TestResources_Refs_MultipleArgs>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + "/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()
    double_type = called_runtime.get_type("System.Double").execute()

    # create values for ref
    # ref variable should have specific type to be able to invoke methods on it
    # This way enables to cast value to specific type needed by called method
    ref_to_int = called_runtime.as_ref(10).execute()
    ref_to_double = called_runtime.as_ref(5, double_type).execute()
    ref_to_string = called_runtime.as_ref("Before execution").execute()

    # invoke type's static method with ref values
    called_runtime_type.invoke_static_method("RefSampleMethod2", ref_to_int, ref_to_double, ref_to_string).execute()

    # get ref values
    result1 = ref_to_int.get_ref_value().execute().get_value()
    result2 = ref_to_double.get_ref_value().execute().get_value()
    result3 = ref_to_string.get_ref_value().execute().get_value()

    # write result to console
    print(result1)
    print(result2)
    print(result3)
    # </TestResources_Refs_MultipleArgs>
    assert result1 == 20
    assert result2 == 2.5
    assert result3 == "Done"


def test_NetDll_TestResources_Outs():
    # <TestResources_Outs>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + "/TestClass.dll"
    class_name = "TestClass.TestClass"

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()
    string_type = called_runtime.get_type("System.String").execute()

    # create values for outs
    # out variable should have specific type to be able to invoke methods on it
    # first way - pass only type
    out_value_1 = called_runtime.as_out(string_type).execute()
    # second way - pass initial value and type to cast on
    out_value_2 = called_runtime.as_out('c', string_type).execute()
    # third way - pass initial value without specific type
    out_value_3 = called_runtime.as_out("Test string").execute()

    # invoke type's static method with out values
    called_runtime_type.invoke_static_method("OutSampleMethod", out_value_1).execute()
    called_runtime_type.invoke_static_method("OutSampleMethod", out_value_2).execute()
    called_runtime_type.invoke_static_method("OutSampleMethod", out_value_3).execute()

    # get outs' values
    result1 = out_value_1.get_ref_value().execute().get_value()
    result2 = out_value_2.get_ref_value().execute().get_value()
    result3 = out_value_3.get_ref_value().execute().get_value()

    # write result to console
    print(result1)
    print(result2)
    print(result3)
    # </TestResources_Outs>
    assert result1 == "String from OutSampleMethod"
    assert result2 == "String from OutSampleMethod"
    assert result3 == "String from OutSampleMethod"
