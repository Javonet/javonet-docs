import math
import platform
from pathlib import Path

import pytest
from javonet.sdk import Javonet

resources_directory = str(Path(__file__).parent.parent.parent.parent) + '/testResources/netcore'


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
    library_path = resources_directory + '/NetcoreTestClass.dll'

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
    library_path = resources_directory + '/NetcoreTestClass.dll'
    class_name = 'NetcoreTestClass.NetcoreTestClass'

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
    library_path = resources_directory + '/NetcoreTestClass.dll'
    class_name = 'NetcoreTestClass.NetcoreTestClass'

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
    library_path = resources_directory + '/NetcoreTestClass.dll'
    class_name = 'NetcoreTestClass.NetcoreTestClass'

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
    library_path = resources_directory + '/NetcoreTestClass.dll'
    class_name = 'NetcoreTestClass.NetcoreTestClass'

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
    library_path = resources_directory + '/NetcoreTestClass.dll'
    class_name = 'NetcoreTestClass.NetcoreTestClass'

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

    
def test_netcore_standardlibrary_systemdatetime_passinstanceasargument():
    # <TestResources_GetInstanceField>
    instance = Javonet.in_memory().Netcore().get_type("System.DateTime").create_instance(2022, 9, 13, 8, 24,
                                                                                         22).Execute()
    culture_info_es = Javonet.in_memory().Netcore().get_type("System.Globalization.CultureInfo").create_instance(
        "es-ES",
        False).Execute();
    culture_info_pl = Javonet.in_memory().Netcore().get_type("System.Globalization.CultureInfo").create_instance(
        "pl-PL",
        False).Execute();
    culture_info_de = Javonet.in_memory().Netcore().get_type("System.Globalization.CultureInfo").create_instance(
        "de-De",
        False).Execute();

    result_es = instance.invoke_instance_method("ToString", "F", culture_info_es).Execute().get_value()
    result_pl = instance.invoke_instance_method("ToString", "F", culture_info_pl).Execute().get_value()
    result_de = instance.invoke_instance_method("ToString", "F", culture_info_de).Execute().get_value()

    # </TestResources_GetInstanceField>
    assert (result_es == "martes, 13 de septiembre de 2022 8:24:22")
    assert (result_pl == "wtorek, 13 września 2022 08:24:22")
    assert (result_de == "Dienstag, 13. September 2022 08:24:22")