from pathlib import Path
import pytest
import platform

from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent.parent) + '/testResources/perl-package'

@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_StandardLibrary_CreateRuntimeContext():
    # <StandardLibrary_CreateRuntimeContext>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # use calledRuntime to interact with code from other technology
    # </StandardLibrary_CreateRuntimeContext>

@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_StandardLibrary_CreateInvocationContext():
    # <StandardLibrary_CreateInvocationContext>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type("CORE").invoke_static_method("length", "sample text")

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute()
    # </StandardLibrary_CreateInvocationContext>

@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_StandardLibrary_GetValue():
    # <StandardLibrary_GetValue>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().jvm()

    # construct an invocation context - this invocationContext in non-materialized 
    invocation_context = called_runtime.get_type("CORE").invoke_static_method("length", "sample text")

    # execute invocation context - this will materialize the invocationContext
    response = invocation_context.execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetValue>
    assert result == 11

@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_LoadLibrary():
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + "/TestClass.pm"

    # load custom library
    called_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_GetStaticField():
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = 'TestClass::TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # get type's static value
    response = called_runtime_type.get_static_field("static_value").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetStaticField>
    assert (result == 3)


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_SetStaticField():
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = 'TestClass::TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # set static field value
    called_runtime_type.set_static_field("static_value", 75).execute()

    # get type's static value
    response = called_runtime_type.get_static_field("static_value").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetStaticField>
    assert (result == 75)
    called_runtime_type.set_static_field("static_value", 3).execute()


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_GetInstanceField():
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = 'TestClass::TestClass'

    # load custom library
    called_runtime.load_library(library_path)

    # get type from the runtime
    called_runtime_type = called_runtime.get_type(class_name).execute()

    # create type's instance
    instance = called_runtime_type.create_instance().execute()

    # get instance's static field
    response = instance.get_instance_field("public_value").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetInstanceField>
    assert (result == 1)


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_InvokeStaticMethod():
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = 'TestClass::TestClass'

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


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_InvokeInstanceMethod():
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = 'TestClass::TestClass'

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


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_1DArray_GetIndex():
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = 'TestClass::TestClass'

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


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_1DArray_GetSize():
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = 'TestClass::TestClass'

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


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_1DArray_SetIndex():
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + "/TestClass.pm"
    class_name = 'TestClass::TestClass'

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


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_1DArray_Iterate():
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + '/TestClass.pm'
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
        array_upper.append(element.execute().get_value())

    # write result to console
    print(array_upper)
    # </TestResources_1DArray_Iterate>
    assert array_upper == ["one", "two", "three", "four", "five"]


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_1DArray_GetElement():
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + '/TestClass.pm'
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
    response = array[2].execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetElement>
    assert result == "three"


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux and macos")
def test_PerlPackage_TestResources_1DArray_SetElement():
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate("your-license-key")

    # create called runtime context
    called_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory + '/TestClass.pm'
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
    response = array[2].execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_SetElement>
    assert result == "zero"
