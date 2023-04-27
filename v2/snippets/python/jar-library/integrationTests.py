import math
from pathlib import Path

from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent) + '/testResources/jar-library'


def test_jvm_standardlibrary_invokestaticmethod_javalangmath_abs_minus50_50():
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # get type from the runtime
    jvm_type = jvm_runtime.get_type("java.lang.Math").execute()

    # invoke type's static method
    response = jvm_type.invoke_static_method("abs", -50).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeStaticMethod>
    assert (result == 50)


def test_jvm_standardlibrary_getstaticfield_mathpi_pi():
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # get type from the runtime
    jvm_type = jvm_runtime.get_type("java.lang.Math").execute()

    # get type's static field
    response = jvm_type.get_static_field("PI").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetStaticField>
    assert (result == math.pi)


def test_jvm_standardlibrary_invokeinstancemethod_javautilrandom_nextInt_10_inrange1to10():
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # get type from the runtime
    jvm_type = jvm_runtime.get_type("java.util.Random").execute()

    # create type's instance
    instance = jvm_type.create_instance().execute()

    # invoke instance's method
    response = instance.invoke_instance_method("nextInt", 10).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeInstanceMethod>
    assert (result in range(0, 10))


def test_jvm_testresources_loadlibrary_librarypath_noexception():
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'

    # load custom library
    jvm_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>


def test_jvm_testresources_invokestaticmethod_multiplybytwo_25_50():
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # invoke type's static method
    response = jvm_type.invoke_static_method("multiplyByTwo", 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeStaticMethod>
    assert (result == 50)


def test_jvm_testresources_getstaticfield_staticvalue_3():
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # get type's static field
    response = jvm_type.get_static_field("staticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetStaticField>
    assert (result == 3)


def test_jvm_testresources_setstaticfield_staticvalue_75():
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # set static field value
    jvm_type.set_static_field("staticValue", 75).execute()

    # get type's static field
    response = jvm_type.get_static_field("staticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetStaticField>
    assert (result == 75)
    jvm_type.set_static_field("staticValue", 3).execute()


def test_jvm_testresources_invokeinstancemethod_multiplytwonumbers_2_25_50():
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # create type's instance
    instance = jvm_type.create_instance(13, 14).execute()

    # invoke instance's method
    response = instance.invoke_instance_method("multiplyTwoNumbers", 2, 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeInstanceMethod>
    assert (result == 50)


def test_jvm_testresources_getinstancefield_publicvalue_18():
    # <TestResources_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # create type's instance
    instance = jvm_type.create_instance(18, 19).execute()

    # get instance's field
    response = instance.get_instance_field("publicValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetInstanceField>
    assert (result == 18)
    
    
def test_jvm_testresources_1darray_get_index_2_string_three():
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # create type's instance
    instance = jvm_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # get index from array
    response = array.get_index(2).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetIndex>
    assert (result == "three")


def test_jvm_testresources_1darray_get_size_5():
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # create type's instance
    instance = jvm_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

    # get array's size
    response = array.get_size().execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetSize>
    assert (result == 5)


def test_jvm_testresources_1darray_set_index_string_seven():
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # create type's instance
    instance = jvm_type.create_instance().execute()

    # invoke instance's method
    array = instance.invoke_instance_method("get1DArray").execute()

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
    assert (result == "seven")


def test_jvm_testresources_1darray_iterate_strings():
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # create type's instance
    instance = jvm_type.create_instance().execute()

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


def test_jvm_testresources_1darray_get_element_string():
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # create type's instance
    instance = jvm_type.create_instance().execute()

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


def test_jvm_testresources_1darray_set_element_string():
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create jvm runtime context
    jvm_runtime = Javonet.in_memory().jvm()

    # set up variables
    library_path = resources_directory + '/TestClass.jar'
    class_name = 'TestClass'

    # load custom library
    jvm_runtime.load_library(library_path)

    # get type from the runtime
    jvm_type = jvm_runtime.get_type(class_name).execute()

    # create type's instance
    instance = jvm_type.create_instance().execute()

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
