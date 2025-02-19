import math
from pathlib import Path

from javonet.utils.exception.JavonetException import JavonetException
from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent.parent) + '/testResources/jar-library'


def test_JarLibrary_TestResources_LoadLibrary():
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>


def test_JarLibrary_StandardLibrary_CreateRuntimeContext():
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>
    assert called_runtime is not None


def test_JarLibrary_StandardLibrary_CreateInvocationContext():
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type("java.lang.Math").invoke_static_method("abs", -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute()
    # </StandardLibrary_CreateInvocationContext>
    assert response is not None


def test_JarLibrary_StandardLibrary_GetValue():
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type("java.lang.Math").invoke_static_method("abs", -50)

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetValue>
    assert result == 50


def test_JarLibrary_StandardLibrary_GetStaticField():
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("java.lang.Math").execute()

    # get type's static field
    response = called_runtime_type.get_static_field("PI").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetStaticField>
    assert result == math.pi


def test_JarLibrary_StandardLibrary_GetInstanceField():
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("java.sql.DriverPropertyInfo").execute()

    # create type's instance
    instance = called_runtime_type.create_instance("sample value", "sample value 2").execute()

    # get instance's field
    response = instance.get_instance_field("name").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetInstanceField>
    assert result == "sample value"


def test_JarLibrary_StandardLibrary_InvokeStaticMethod():
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("java.lang.Math").execute()

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("abs", -50).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeStaticMethod>
    assert (result == 50)


def test_JarLibrary_StandardLibrary_InvokeInstanceMethod():
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type("java.util.Random").execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    response = instance.invoke_instance_method("nextInt", 10).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeInstanceMethod>
    assert (result in range(0, 10))


def test_JarLibrary_TestResources_GetStaticField():
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # get type's static field
    response = called_runtime_type.get_static_field("staticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetStaticField>
    assert result == 3


def test_JarLibrary_TestResources_SetStaticField():
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # set static field value
    called_runtime_type.set_static_field("staticValue", 75).execute()

    # get type's static field
    response = called_runtime_type.get_static_field("staticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetStaticField>
    assert result == 75
    called_runtime_type.set_static_field("staticValue", 3).execute()


def test_JarLibrary_TestResources_GetInstanceField():
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute()

    # get instance's field
    response = instance.get_instance_field("publicValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetInstanceField>
    assert result == 18


def test_JarLibrary_TestResources_SetInstanceField():
    # <TestResources_SetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance(18, 19).execute()

    # set instance's field
    instance.set_instance_field("publicValue", 44).execute()

    # get instance's field
    response = instance.get_instance_field("publicValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetInstanceField>
    assert result == 44


def test_JarLibrary_TestResources_InvokeStaticMethod():
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("multiplyByTwo", 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeStaticMethod>
    assert result == 50


def test_JarLibrary_TestResources_InvokeInstanceMethod():
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    response = instance.invoke_instance_method("multiplyTwoNumbers", 2, 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeInstanceMethod>
    assert result == 50


def test_JarLibrary_TestResources_1DArray_GetIndex():
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # get index from array
    response = array.get_index(2).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetIndex>
    assert result == "three"


def test_JarLibrary_TestResources_1DArray_GetSize():
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # get array's size
    response = array.get_size().execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetSize>
    assert result == 5


def test_JarLibrary_TestResources_1DArray_SetIndex():
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

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


def test_JarLibrary_TestResources_1DArray_Iterate():
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # iterate through elements and invoke method on them
    array_upper = list()
    for element in array:
        array_upper.append(element.invoke_instance_method("toUpperCase").execute().get_value())

    # write result to console
    print(array_upper)
    # </TestResources_1DArray_Iterate>
    assert array_upper == ["ONE", "TWO", "THREE", "FOUR", "FIVE"]


def test_JarLibrary_TestResources_1DArray_GetElement():
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # get element of array and invoke method on it
    response = array[2].invoke_instance_method("toUpperCase").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetElement>
    assert result == "THREE"


def test_JarLibrary_TestResources_1DArray_SetElement():
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # set element of array
    array[2] = "zero"

    # get element of array and invoke method on it
    response = array[2].invoke_instance_method("toUpperCase").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_SetElement>
    assert result == "ZERO"


def test_JarLibrary_TestResources_1DArray_PassArrayAsArgument():
    # <TestResources_1DArray_PassArrayAsArgument>
    # use Activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    response = instance.invoke_instance_method("addArrayElementsAndMultiply", [12.22, 98.22, -10.44], 9.99).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_PassArrayAsArgument>
    assert result == 999


def test_JarLibrary_TestResources_1DArray_RetrieveArray():
    # <TestResources_1DArray_RetrieveArray>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array_reference = instance.invoke_instance_method("get1DArray").execute()

    # get value from array reference
    result = array_reference.retrieve_array()

    # write result to console
    print(result)
    # </TestResources_1DArray_RetrieveArray>
    assert result == ["one", "two", "three", "four", "five"]


def test_JarLibrary_TestResources_ExceptionsFromCalledTech_InvokeStaticMethod_DivideBy_0_ThrowsException():
    # <TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
    # use activate only once in your app
    try:
        Javonet.activate("your-license-key")

        # create called runtime context
        called_runtime = Javonet.in_memory().jvm()

        # set up variables
        library_path = resources_directory + '/TestClass.jar'
        class_name = 'TestClass'

        # load custom library
        called_runtime.load_library(library_path)

        # get type from the runtime
        called_runtime_type = called_runtime.get_type(class_name).execute()

        # invoke static method
        response = called_runtime_type.invoke_static_method("divideBy", 10, 0).execute()
    except Exception as e:
        # write exception to console
        print(e)
        # </TestResources_ExceptionsFromCalledTech_InvokeStaticMethod>
        assert isinstance(e, JavonetException)
        assert "divideByThird" in str(e)


def test_JarLibrary_TestResources_GenericStaticMethod():
    # <TestResources_GenericStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke static method
    response = called_runtime_type. \
        invoke_generic_static_method("genericSampleStaticMethod", 7, 5). \
        execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GenericStaticMethod>
    assert (result == "7 and 5")


def test_JarLibrary_TestResources_GenericMethod():
    # <TestResources_GenericMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance method
    response = instance. \
        invoke_generic_method("genericSampleMethod", 7, 5). \
        execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GenericMethod>
    assert (result == "7 or 5")


def test_JarLibrary_TestResources_GenericMethodWithTwoTypes():
    # <TestResources_GenericMethodWithTwoTypes>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance method
    response = instance. \
        invoke_generic_method("genericSampleMethodWithTwoTypes", 7). \
        execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GenericMethodWithTwoTypes>
    assert (result == "genericSampleMethodWithTwoTypes invoked")


def test_JarLibrary_TestResources_EnumAddToList():
    # <TestResources_EnumAddToList>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get enum
    enum_type = called_runtime.get_type("TestClass$Fruit")

    # create enum items
    apple = called_runtime.get_enum_item(enum_type, "Apple")
    mango = called_runtime.get_enum_item(enum_type, "Mango")

    # create fruits array
    fruits_list = [apple, mango]

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke type's static method
    response = called_runtime_type.invoke_static_method("addFruitsToList", fruits_list).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_EnumAddToList>
    assert result == "2 fruits on the list"


def test_JarLibrary_TestResources_EnumNameAndValue():
    # <TestResources_EnumNameAndValue>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'

    # load custom library
    called_runtime.load_library(library_path)

    # get enum
    enum_type = called_runtime.get_type("TestClass$Fruit")

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


def test_JarLibrary_TestResources_2DArray_GetIndex():
    # <TestResources_2DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get2DArray").execute()

    # three ways to get elements from array
    response1 = array.get_index(0, 0).execute()
    response2 = array.get_index([0, 1]).execute()
    response3 = array[1][1].execute()

    # get value from response
    result1 = response1.get_value()
    result2 = response2.get_value()
    result3 = response3.get_value()

    # write result to console
    print(result1)
    print(result2)
    print(result3)
    # </TestResources_2DArray_GetIndex>
    assert result1 == "S00"
    assert result2 == "S01"
    assert result3 == "S11"


def test_JarLibrary_TestResources_2DArray_GetSizeAndRank():
    # <TestResources_2DArray_GetSizeAndRank>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom libraries
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get2DArray").execute()

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


def test_JarLibrary_TestResources_2DArray_SetIndex():
    # <TestResources_2DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom libraries
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get2DArray").execute()

    # two ways of setting elements in array
    array.set_index([1, 1], "new value 1").execute()
    array[0][1] = "new value 2"

    # two ways of getting elements from array
    response1 = array.get_index(1, 1).execute()
    response2 = array[0][1].execute()

    # get value from response
    result1 = response1.get_value()
    result2 = response2.get_value()

    # write result to console
    print(result1)
    print(result2)
    # </TestResources_2DArray_SetIndex>
    array.set_index([1, 1], "S11").execute()
    array.set_index([0, 1], "S01").execute()
    assert result1 == "new value 1"
    assert result2 == "new value 2"


def test_JarLibrary_StandardLibrary_CreateInstanceOfGenericClass():
    # <StandardLibrary_CreateInstanceOfGenericClass>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # get type from the runtime
    list_type = called_runtime.get_type("java.util.ArrayList").execute()

    # create instance of generic class
    list_instance = list_type.create_instance().execute()

    # invoke instance's method
    list_instance.invoke_generic_method("add", "one").execute()
    list_instance.invoke_generic_method("add", "two").execute()
    list_instance.invoke_generic_method("add", "three").execute()
    list_instance.invoke_generic_method("add", "four").execute()
    list_instance.invoke_generic_method("add", "five").execute()
    list_instance.invoke_generic_method("add", "six").execute()

    # check number of elements in list
    response = list_instance.invoke_generic_method("size").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_CreateInstanceOfGenericClass>
    assert result == 6


def test_JarLibrary_StandardLibrary_HandleList():
    # <StandardLibrary_HandleList>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # get type from the runtime
    list_type = called_runtime.get_type("java.util.ArrayList").execute()

    # create instance of generic class
    list_instance = list_type.create_instance().execute()

    # invoke instance's method
    list_instance.invoke_generic_method("add", "one").execute()
    list_instance.invoke_generic_method("add", "two").execute()
    list_instance.invoke_generic_method("add", "three").execute()
    list_instance.invoke_generic_method("add", "four").execute()
    list_instance.invoke_generic_method("add", "five").execute()
    list_instance.invoke_generic_method("add", "six").execute()

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


def test_JarLibrary_StandardLibrary_HandleDictionary():
    # <StandardLibrary_HandleDictionary>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # get type from the runtime
    dictionary_type = called_runtime.get_type("java.util.HashMap").execute()

    # create instance of generic class
    dictionary = dictionary_type.create_instance().execute()

    # invoke instance's method
    dictionary.invoke_generic_method("put", "pi", math.pi).execute()
    dictionary.invoke_generic_method("put", "e", math.e).execute()
    dictionary.invoke_generic_method("put", "c", 299792458.0).execute()

    # get elements from dictionary
    response1 = dictionary.get_index("pi").execute()
    response2 = dictionary["c"].execute()

    # get value from response
    result1 = response1.get_value()
    result2 = response2.get_value()

    # write result to console
    print(result1)
    print(result2)
    # </StandardLibrary_HandleDictionary>
    assert result1 == math.pi
    assert result2 == 299792458.0


def test_JarLibrary_StandardLibrary_HandleSet():
    # <StandardLibrary_HandleSet>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # get generic class
    hash_set_type = called_runtime.get_type("java.util.HashSet").execute()

    # create instance of generic class
    hash_set = hash_set_type.create_instance().execute()

    # invoke instance method
    hash_set.invoke_generic_method("add", "one").execute()
    hash_set.invoke_generic_method("add", "two").execute()
    hash_set.invoke_generic_method("add", "three").execute()

    # get size of set
    response = hash_set.invoke_generic_method("size").execute()
    result = response.get_value()

    # write results to console
    print(result)
    # </StandardLibrary_HandleSet>
    assert result == 3


def test_JarLibrary_StandardLibrary_PrimitiveTypeArray():
    # <StandardLibrary_PrimitiveTypeArray>
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # create instance of java.lang.String with "Hello World!"
    new_string = called_runtime.get_type("java.lang.String").create_instance("Hello World!").execute()

    # invoke instance method to get a byte array
    response_bytes = new_string.invoke_instance_method("getBytes").execute()

    # retrieve the array of bytes
    result = response_bytes.retrieve_array()

    # write results to console
    print(result)
    # </StandardLibrary_PrimitiveTypeArray>

    expected = [72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 33]
    assert result == expected


def test_JarLibrary_TestResources_PassingNullAsOnlyArg():
    # <TestResources_PassingNullAsOnlyArg>
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke type's static method passing None as only argument
    response = called_runtime_type.invoke_static_method("passNull", None).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_PassingNullAsOnlyArg>
    assert result == "Method called with null"


def test_JarLibrary_TestResources_PassingNullAsSecondArg():
    # <TestResources_PassingNullAsSecondArg>
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke type's static method with a non-null first argument and None as the second
    response = called_runtime_type.invoke_static_method("passNull2", 5, None).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_PassingNullAsSecondArg>
    assert result == "Method2 called with null"


def test_JarLibrary_TestResources_ReturningNull():
    # <TestResources_ReturningNull>
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # invoke type's static method that returns null
    response = called_runtime_type.invoke_static_method("returnNull").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_ReturningNull>
    assert result is None


def test_JarLibrary_TestResources_Multithreading_InvokeInstanceMethod():
    # <TestResources_Multithreading_InvokeInstanceMethod>
    # import threading locally
    import threading
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime and create an instance
    called_runtime_type = called_runtime.get_type(class_name).execute()
    instance = called_runtime_type.create_instance().execute()

    # create threads and dictionary to store responses
    responses = {}
    lock = threading.Lock()
    threads = []

    for i in range(5):
        def thread_func(j=i):
            response = instance.invoke_instance_method("addTwoNumbers", j, 5).execute().get_value()
            with lock:
                responses[j] = response

        thread = threading.Thread(target=thread_func)
        threads.append(thread)

    # start threads
    for thread in threads:
        thread.start()

    # wait for threads to finish
    for thread in threads:
        thread.join()

    # write results to console
    for key, value in responses.items():
        print(value)

    # </TestResources_Multithreading_InvokeInstanceMethod>
    for key, value in responses.items():
        assert value == key + 5


def test_JarLibrary_TestResources_ExecuteAsync_AsyncMethod():
    # <TestResources_ExecuteAsync_AsyncMethod>
    # import libaries locally
    import time
    from pathlib import Path
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # measure time
    start_time = time.time()

    # get type and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute()
    instance = called_runtime_type.create_instance().execute()

    # create file
    file_name = str(Path.home() / "output.txt")
    open(file_name, 'w').close()

    # invoke instance methods
    instance.invoke_instance_method("writeToFile", file_name, " This is ").execute_async()
    instance.invoke_instance_method("writeToFile", file_name, " file with ").execute_async()
    instance.invoke_instance_method("writeToFile", file_name, " sample input ").execute_async()

    # wait for threads to finish
    time.sleep(3)

    # measure time
    end_time = time.time()

    # write result to console
    print(f"Time elapsed: {(end_time - start_time) * 1000} milliseconds")
    # </TestResources_ExecuteAsync_AsyncMethod>
    assert end_time - start_time < 4


def test_JarLibrary_TestResources_ExecuteAsync_SyncMethod():
    # <TestResources_ExecuteAsync_SyncMethod>
    # import libaries locally
    import time
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    start_time = time.time()

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # invoke instance's method
    instance.invoke_instance_method("addThreeNumbers", 11, 12, 13).execute_async()
    instance.invoke_instance_method("addThreeNumbers", 21, 22, 23).execute_async()
    instance.invoke_instance_method("addThreeNumbers", 31, 32, 33).execute_async()

    # sleep to wait for async methods to finish
    time.sleep(3)
    end_time = time.time()

    # write result to console
    print(f"Time elapsed: {(end_time - start_time) * 1000} milliseconds")
    # </TestResources_ExecuteAsync_SyncMethod>
    assert (end_time - start_time) < 4


def test_JarLibrary_TestResources_UseStaticMethodAsDelegate():
    # <TestResources_UseStaticMethodAsDelegate>
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type and create instance
    called_runtime_type = called_runtime.get_type(class_name).execute()
    instance = called_runtime_type.create_instance().execute()

    # get static method as delegate
    my_func = called_runtime_type.get_static_method_as_delegate("divideBy", called_runtime.get_type("int"),
                                                                called_runtime.get_type("int")).execute()

    # invoke instance's method using delegate
    response = instance.invoke_instance_method("useYourFunc", my_func, 30, 6).execute()

    result = response.get_value()
    print(result)
    # </TestResources_UseStaticMethodAsDelegate>
    assert result == 5
