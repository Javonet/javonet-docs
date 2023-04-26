import math
from pathlib import Path

from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent) + '/testResources/net-dll'


def test_netcore_standardlibrary_invokestaticmethod_systemmath_abs_minus50_50():
    # <StandardLibrary_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # get type from the runtime
    netcore_type = netcore_runtime.get_type("System.Math").execute()

    response = netcore_type.invoke_static_method("Abs", -50).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeStaticMethod>
    assert (result == 50)


def test_netcore_standardlibrary_getstaticfield_mathpi_pi():
    # <StandardLibrary_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # get type from the runtime
    netcore_type = netcore_runtime.get_type("System.Math").execute()

    # get type's static field
    response = netcore_type.get_static_field("PI").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_GetStaticField>
    assert (result == math.pi)


def test_netcore_standardlibrary_invokeinstancemethod_systemdatetime_toshortdatestring_contains2022():
    # <StandardLibrary_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # get type from the runtime
    netcore_type = netcore_runtime.get_type("System.DateTime").execute()

    # create type's instance
    instance = netcore_type.create_instance(2022, 9, 2).execute()

    # invoke instance's method
    response = instance.invoke_instance_method("ToShortDateString").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </StandardLibrary_InvokeInstanceMethod>
    assert ("2022" in result)


def test_netcore_standardlibrary_getinstancefield_systemdatetime_year_2022():
    # <StandardLibrary_GetInstanceField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # get type from the runtime
    netcore_type = netcore_runtime.get_type("System.DateTime").execute()

    # create type's instance
    instance = netcore_type.create_instance(2022, 9, 2).execute()

    # get instance's field
    response = instance.get_instance_field("Year").execute()

    # get value from response
    result = response.get_value()
    # </StandardLibrary_GetInstanceField>
    assert (result == 2022)


def test_netcore_testresources_loadlibrary_librarypath_noexception():
    # <TestResources_LoadLibrary>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'

    # load custom library
    netcore_runtime.load_library(library_path)
    # </TestResources_LoadLibrary>


def test_netcore_testresources_invokestaticmethod_multiplybytwo_25_50():
    # <TestResources_InvokeStaticMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # invoke type's static method
    response = netcore_type.invoke_static_method("MultiplyByTwo", 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeStaticMethod>
    assert (result == 50)


def test_netcore_testresources_getstaticfield_staticvalue_3():
    # <TestResources_GetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # get type's static field
    response = netcore_type.get_static_field("StaticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetStaticField>
    assert (result == 3)


def test_netcore_testresources_setstaticfield_staticvalue_75():
    # <TestResources_SetStaticField>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # set static field value
    netcore_type.set_static_field("StaticValue", 75).execute()

    # get type's static field
    response = netcore_type.get_static_field("StaticValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_SetStaticField>
    netcore_type.set_static_field("StaticValue", 3).execute()
    assert (result == 75)


def test_netcore_testresources_invokeinstancemethod_multiplytwonumbers_2_25_50():
    # <TestResources_InvokeInstanceMethod>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance(13, 14).execute()

    # invoke instance's method
    response = instance.invoke_instance_method("MultiplyTwoNumbers", 2, 25).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_InvokeInstanceMethod>
    assert (result == 50)


def test_netcore_testresources_getinstancefield_publicvalue_18():
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance(18, 19).execute()

    # get instance's field
    response = instance.get_instance_field("PublicValue").execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_GetInstanceField>
    assert (result == 18)


def test_netcore_testresources_1darray_get_index_2_string_three():
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance(0, 1).execute()

    # invoke instance's method
    array = instance.invoke_instance_method("Get1DArray").execute()

    # get index from array
    response = array.get_index(2).execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetIndex>
    assert (result == "three")


def test_netcore_testresources_1darray_get_size_5():
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance(0, 1).execute()

    # invoke instance's method
    array = instance.invoke_instance_method("Get1DArray").execute()

    # get array's size
    response = array.get_size().execute()

    # get value from response
    result = response.get_value()

    # write result to console
    print(result)
    # </TestResources_1DArray_GetSize>
    assert (result == 5)


def test_netcore_testresources_1darray_set_index_string_seven():
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance(0, 1).execute()

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
    assert (result == "seven")


def test_netcore_testresources_1darray_get_index_2_string_three():
    # <TestResources_1DArray_GetIndex>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance().execute()

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


def test_netcore_testresources_1darray_get_size_5():
    # <TestResources_1DArray_GetSize>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance().execute()

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


def test_netcore_testresources_1darray_set_index_string_seven():
    # <TestResources_1DArray_SetIndex>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance().execute()

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


def test_netcore_testresources_1darray_iterate_strings():
    # <TestResources_1DArray_Iterate>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance().execute()

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


def test_netcore_testresources_1darray_get_element_string():
    # <TestResources_1DArray_GetElement>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance().execute()

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


def test_netcore_testresources_1darray_set_element_string():
    # <TestResources_1DArray_SetElement>
    # use activate only once in your app
    Javonet.activate("your-email", "your-license-key")

    # create netcore runtime context
    netcore_runtime = Javonet.in_memory().netcore()

    # set up variables
    library_path = resources_directory + '/TestClass.dll'
    class_name = 'TestClass.TestClass'

    # load custom library
    netcore_runtime.load_library(library_path)

    # get type from the runtime
    netcore_type = netcore_runtime.get_type(class_name).execute()

    # create type's instance
    instance = netcore_type.create_instance().execute()

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

