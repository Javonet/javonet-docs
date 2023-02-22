from pathlib import Path
import pytest
import platform

from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent) + '/testResources/perl_package'


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux")
def test_perl_testresources_loadlibrary_librarypath_noexception():
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create perl runtime context
    perl_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory
    file_name = 'PerlTestClass.pm'

    # load custom library
    perl_runtime.load_library(library_path, file_name)
    # </TestResources_LoadLibrary>


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux")
def test_perl_testresources_invokestaticmethod_multiplybytwo_25_50():
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create perl runtime context
    perl_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory
    file_name = 'PerlTestClass.pm'
    class_name = 'PerlTestClass::PerlTestClass'

    # load custom library
    perl_runtime.load_library(library_path, file_name)

    # get type from the runtime
    perl_type = perl_runtime.get_type(class_name).execute()

    # invoke type's static method
    response = perl_type.invoke_static_method("multiply_by_two", 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeStaticMethod>
    assert (result == 50)


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux")
def test_perl_testresources_getstaticfield_staticvalue_3():
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create perl runtime context
    perl_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory
    file_name = 'PerlTestClass.pm'
    class_name = 'PerlTestClass::PerlTestClass'

    # load custom library
    perl_runtime.load_library(library_path, file_name)

    # get type from the runtime
    perl_type = perl_runtime.get_type(class_name).execute()

    # get type's static value
    response = perl_type.get_static_field("static_value").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetStaticField>
    assert (result == 3)


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux")
def test_perl_testresources_setstaticfield_staticvalue_75():
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create perl runtime context
    perl_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory
    file_name = 'PerlTestClass.pm'
    class_name = 'PerlTestClass::PerlTestClass'

    # load custom library
    perl_runtime.load_library(library_path, file_name)

    # get type from the runtime
    perl_type = perl_runtime.get_type(class_name).execute()

    # set static field value
    perl_type.set_static_field("static_value", 75).execute()

    # get type's static value
    response = perl_type.get_static_field("static_value").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetStaticField>
    assert (result == 75)
    perl_type.set_static_field("static_value", 3).execute()


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux")
def test_perl_testresources_invokeinstancemethod_multiplytwonumbers_2_25_50():
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create perl runtime context
    perl_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory
    file_name = 'PerlTestClass.pm'
    class_name = 'PerlTestClass::PerlTestClass'

    # load custom library
    perl_runtime.load_library(library_path, file_name)

    # get type from the runtime
    perl_type = perl_runtime.get_type(class_name).execute()

    # create type's instance
    instance = perl_type.create_instance().execute()

    # invoke instance's method
    response = instance.invoke_instance_method("multiply_two_numbers", 2, 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeInstanceMethod>
    assert (result == 50)


@pytest.mark.skipif(platform.system() != 'Windows', reason="Test fail on pipeline on linux")
def test_perl_testresources_getinstancefield_publicvalue_1():
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create perl runtime context
    perl_runtime = Javonet.in_memory().perl()

    # set up variables
    library_path = resources_directory
    file_name = 'PerlTestClass.pm'
    class_name = 'PerlTestClass::PerlTestClass'

    # load custom library
    perl_runtime.load_library(library_path, file_name)

    # get type from the runtime
    perl_type = perl_runtime.get_type(class_name).execute()

    # create type's instance
    instance = perl_type.create_instance().execute()

    # get instance's static field
    response = instance.get_instance_field("public_value").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetInstanceField>
    assert (result == 1)
